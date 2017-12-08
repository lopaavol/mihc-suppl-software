function im = reg_(im, tform, rds, ref_im)

tform.T(3)  = tform.T(3) / rds;
tform.T(6)  = tform.T(6) / rds;
im = imwarp(im,tform,'OutputView',imref2d(size(ref_im)), 'FillValues',0);

end

