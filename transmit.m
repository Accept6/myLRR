%% transmit: ת������������ÿһ��������ڵĹ�ϵ����
function [graph] = transmit(data)
	[m,~] = size(data);
	datasave = data;
	datan = data;
	for i = 1:m
		for j = 1:m
			for k = 1:m
				if datasave(j,k) > 0
					datasave(j,:) = datasave(j,:) + data(k,:);
				end
			end
		end
	end
	graph = datasave;