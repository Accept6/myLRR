clear;
%load COIL20;
%load YaleBext_3232;
%load ORL_32x32 
%load Yale_32x32;
%load AR_database_60_43  
%load mnist_all
load PIE_32x32  
%load umist 
kk = 4   ;%�����
number = find(gnd==kk);%ÿһ��ĸ���
number=max(number);
%  feaa = NewTrain_DAT(:,1:kk*number);   
%  fea =double(feaa'); 
% gnd = trainlabels(1:kk*number); 
% gnd = gnd'; 
%fea=X';
fea=fea(1:number,:);%kk *number,:);  
gnd=gnd(1:number);%kk*number);
kkk=5;
fea=NormalizeFea(fea); 
%for time=1:12
%    for tim =1:12
[new1 b1 dis1] = LRSA(fea');
[new2 b2 dis2] = LRSA1(fea',0.1,0.1,kkk);
[new3 b3 dis3] = LRSA2(fea',0.1,0.1,3);
[new4 b4 dis4] = LRSA3(fea',0.1,0.1,5 ,99);
k=5;%knn��k
Y = fea';
Yg = fea';
a=fkNN(Yg,k);
b=constractmap(a);
c = transmit(b,0);
d = (c+c')/2;
d(find(d>0))=1;
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
%accuracy0_=max(accuracy0);
accuracy0_m=mean(accuracy0);
%accuracy0_t=std(accuracy0); 
%accuracy1_=max(accuracy1);
accuracy1_m=mean(accuracy1);
%accuracy1_t=std(accuracy1);
% accuracy2_=max(accuracy2);
accuracy2_m=mean(accuracy2); 
% accuracy2_t=std(accuracy2);
%accuracy3_=max(accuracy3);
accuracy3_m=mean(accuracy3); 
%accuracy3_t=std(accuracy3);
%accuracy4_=max(accuracy4); 
accuracy4_m=mean(accuracy4);
%accuracy4_t=std(accuracy4);
% accuracy0t(l) = accuracy0_m;
% accuracy2t(l) = accuracy2_m;
% accuracy3t(l) = accuracy3_m; 
% accuracy4t(l) = accuracy4_m;
   % end
%end