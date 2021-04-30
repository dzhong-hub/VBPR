function []= export_reg_data(database, out_file)

bbox=database.Ib.BoundingBox;
%utmzone=strsplit(database.Ib.GeoAsciiParamsTag,' ');
%utmzone=utmzone{6};
%utmzone=[utmzone(1:2),' ',utmzone(3)];
%[bbox(:,2),bbox(:,1)] = utm2deg(bbox(:,1),bbox(:,2),[utmzone;utmzone]);
bit_depth=32;
geotiffwrite([out_file,'_',database.bvar,'_reg.tif'],       bbox, reshape(database.all_1(:,4),database.image_dim(1),database.image_dim(2)), bit_depth, database.Ib);
geotiffwrite([out_file,'_',database.bvar,'_reg_flags.tif'], bbox, reshape(database.all_1(:,5),database.image_dim(1),database.image_dim(2)), bit_depth, database.Ib);

end