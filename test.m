clear;
%load COIL20;
%load YaleB_3232;
load('ORL_64x64.mat')
kk = 4  ;%�����
number = 10;%ÿһ��ĸ���
fea=fea(1:kk *number,:); 
gnd=gnd(1:kk*number);
fea=NormalizeFea(fea);
[new1 b1 dis1] = LRSA(fea');
[new2 b2 dis2] = LRSA1(fea',0.1,0.1,4);
[new3 b3 dis3] = LRSA2(fea',0.1,0.1,4);
[new4 b4 dis4] = LRSA3(fea',0.1,0.1,4,kk*number);
k=5;%knn��k
Y = fea';
Yg = fea';
a=fkNN(Yg,k);
b=constractmap(a);
c = transmit(b,0);
d = (c+c')/2;
[new,OBJ] =  sparse_graph_LRR(Yg,d);
for i = 1:10
    c =  NJW(new,kk);
    idx=bestMap(gnd,c); % ƥ��
    accuracy0(i) = length(find(gnd == idx))/length(gnd);% �ҵ�gnd���Ѿ�����ŵ�idx����ƥ���ֵ����������
    c =  NJW(new1,kk);
    idx = bestMap(gnd,c); % ƥ��
    accuracy1(i) = length(find(gnd == idx))/length(gnd);% �ҵ�gnd���Ѿ�����ŵ�idx����ƥ���ֵ����������
    c =  NJW(new2,kk);
    idx=bestMap(gnd,c); % ƥ��
    accuracy2(i)=length(find(gnd == idx))/length(gnd);% �ҵ�gnd���Ѿ�����ŵ�idx����ƥ���ֵ����������
    c =  NJW(new3,kk);
    idx=bestMap(gnd,c); % ƥ��
    accuracy3(i)=length(find(gnd == idx))/length(gnd);% �ҵ�gnd���Ѿ�����ŵ�idx����ƥ���ֵ����������
    c =  NJW(new4,kk);
    idx=bestMap(gnd,c); % ƥ��
    accuracy4(i)=length(find(gnd == idx))/length(gnd);% �ҵ�gnd���Ѿ�����ŵ�idx����ƥ���ֵ����������
end 
accuracy0_=max(accuracy0);
accuracy0_m=mean(accuracy0);
accuracy0_t=std(accuracy0);
accuracy1_=max(accuracy1);
accuracy1_m=mean(accuracy1);
accuracy1_t=std(accuracy1);
accuracy2_=max(accuracy2);
accuracy2_m=mean(accuracy2);
accuracy2_t=std(accuracy2);
accuracy3_=max(accuracy3);
accuracy3_m=mean(accuracy3);
accuracy3_t=std(accuracy3);
accuracy4_=max(accuracy4);
accuracy4_m=mean(accuracy4);
accuracy4_t=std(accuracy4);