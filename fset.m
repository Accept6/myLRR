%������˹���һ�������ݼ�
clear;
load COIL20
nn = 3;
fea = fea(1:72*nn,:);
gnd = gnd(1:72*nn,:);
k=5;%knn��k
Y = fea';
Yg = fea';
a=fkN(Yg,k);
[b,c]=fkNN(Yg,5);
[m,n]=size(Y);
W=zeros(n,n);
%******************************
%��һ�ε������ǲ����Ƿ���k��������
 for i=1:n
     aa=a(i,1:k);
     aa(1)=0;
     for j=1:n
         if any(aa==j)
             W(i,j)=1;
             W(j,i)=1;
         end
     end
 end
%****************************
%*********************************
%��һ����ʹ�þ�����ȷ�������
%for i=1:n
%    aa=a(i,k+1);
%     for j=1:n
%         if norm(Yg(:,i)-Yg(:,j))<=aa
%             W(i,j)=1;
%             W(j,i)=1;
%         end
%     end
% end
[Z, E] =   sparse_graph_LRR(Y,W)%, 0.1, 5, 8.0, 2.5, 0);
Ynew=Y*Z+E;