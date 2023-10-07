%% ------------------- indexing -----------------------------------------
% Note that this indexing provided for model 1 data
% The code written by : Reza Mahini March 2019, remahini@jyu.fi

function index=Indexing_M1(nSam,c_idx,k,St,g)

sa=g*nSam;


for i=1:k % number of clusters
   cl_inf(i).data= find(c_idx(sa-(nSam-1):sa)==i);
end

clust_idx1=c_idx(sa-(nSam-1):sa);

index=[];
index(1,:)=[1 clust_idx1(1)];
j1=2;
for j=2:nSam
   if abs(clust_idx1(j-1)-clust_idx1(j))>=1
      index(j1,:)=[j clust_idx1(j)]; % Start end of each clusters
      j1=j1+1;
   end
end
if index(j1-1)~=nSam
   index(j1,:)=[j clust_idx1(j)];
end
end