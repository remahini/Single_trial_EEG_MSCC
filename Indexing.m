%% ------------------- indexing -----------------------------------------

% The indexing function provided for normal clustering on ERP data
% The code written by : Reza Mahini March 2019, r.mahini@foxmail.com

function index=Indexing(nSam,c_idx,k)
for i=1:k % number of clusters
    cl_inf(i).data= find(c_idx(nSam-(nSam-1):nSam)==i);
end
% index(1,:)=[1 c_idx(1)]; % may need this

clust_idx1=c_idx(nSam-(nSam-1):nSam);

index=[];
index(1,:)=[1 clust_idx1(1)];
j1=2;
for j=1:nSam-1
    if abs(clust_idx1(j)-clust_idx1(j+1))>=1
        index(j1,:)=[j+1 clust_idx1(j+1)]; % Start end of each clusters
        j1=j1+1;
    end
end
index(j1,:)=[j+1 clust_idx1(j)];
end