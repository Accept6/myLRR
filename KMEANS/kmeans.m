
dtime=[];
error=[];
MIhat=[];
for i=1:10
    stime=cputime;
    errnum=0;
    
    load('K:\DM\ʵ����\hw4data\COIL20\COIL20.mat','fea','gnd');
  str=strcat('K:\DM\ʵ����\hw4data\COIL20\10Class\',(int2str(i)),'.mat');%��ÿ������
load(str,'sampleIdx','zeroIdx');

fea = fea(sampleIdx,:); % ʹ��testdata���������
gnd = gnd(sampleIdx,:);
fea(:,zeroIdx) = [];
    
idx =kmeans(fea, 10);% ʹ��matlab�Դ���kmeans���з���
idx=bestMap(gnd,idx); % ƥ��
accuracy=length(find(gnd == idx))/length(gnd);% �ҵ�gnd���Ѿ�����ŵ�idx����ƥ���ֵ����������
error(i)=1-accuracy;%�ҵ�ÿ�εĴ�����
MIhat(i)= MutualInfo(gnd,idx);% ���ø����Ĺ�ʽ����б�����ԭ������֮������ƶȡ�
etime=cputime;
dtime(i)=etime-stime;            % ������ʱ��

end

