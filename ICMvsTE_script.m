%%Script to define ICM vs TE identity by cell position
% Author - Michael Pokrass

%Load nuclear centroid xyz coords
cellcoords = example_embryo(:,1:3);

%Assign each nucleus an index
idx_list = 1:size(cellcoords,1);

%Use boundary function to identify which centroids generate the 3D boundary
emb_bound = boundary(cellcoords,0.1);

%Trophectoderm cells defined as nuclei that make up the boundary of the embryo
TE_idx = unique(emb_bound);

%ICM cells defined as cells not used to make up boundary
ICM_idx = idx_list(~ismember(idx_list,TE_idx));


%% Visualize output of cell position definition function

figure()
s1=plot3(cellcoords(TE_idx,1),cellcoords(TE_idx,2),cellcoords(TE_idx,3), 'o', 'markerfacecolor','red', 'markeredgecolor','red', 'linewidth',0.5,'markersize',7);
hold on
trisurf(emb_bound,cellcoords(:,1),cellcoords(:,2),cellcoords(:,3),'Facecolor','red','FaceAlpha',0.1);
s2=plot3(cellcoords(ICM_idx,1),cellcoords(ICM_idx,2),cellcoords(ICM_idx,3),'o', 'markerfacecolor','blue', 'markeredgecolor','blue', 'linewidth',0.5,'markersize',7);
set(gcf,'color',[1 1 1])


%% Test against CDX2 expression definition

hist(log10(example_embryo(:,4)),15) %visualize intensities to set threshold
CDX2_thresh=950; %set threshold val

CDX2_cells=example_embryo(example_embryo(:,4)>CDX2_thresh,:); %collect cdx2 positive cells
CDX2_coords=CDX2_cells(:,1:3);
CDX2_bound=boundary(CDX2_coords,0);

neg_cells=example_embryo(example_embryo(:,4)<=CDX2_thresh,:);
neg_coords=neg_cells(:,1:3);

%% Visualize output of CDX2 expression definition

figure()
plot3(neg_coords(:,1),neg_coords(:,2),neg_coords(:,3), 'o', 'markerfacecolor','black', 'markeredgecolor','black', 'linewidth',0.5,'markersize',7);
hold on
trisurf(CDX2_bound,CDX2_coords(:,1),CDX2_coords(:,2),CDX2_coords(:,3),'Facecolor',[0 0.8 0],'FaceAlpha',0.1);
plot3(CDX2_coords(:,1),CDX2_coords(:,2),CDX2_coords(:,3), 'o', 'markerfacecolor',[0 0.8 0], 'markeredgecolor',[0 0.8 0], 'linewidth',0.5,'markersize',7);
set(gcf,'color',[1 1 1])
