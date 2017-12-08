function tile_image(img,outpat,isize,padsize)
%tile_image Splits large image into tiles
%   Arguments:
%     img: Input image to tile
%     outpat: Output pattern (should include two %02d or similar specifiers for tile coordinates)
%     isize: Tile size
%     padsize: Size of the padding around the tile
img = padarray(img,[padsize padsize],0);
j = 0;
for ystart=1:isize:size(img,1)-padsize-isize
  j = j + 1;
  i = 0;
  ybreak = 0;
  yend = ystart + isize + 2 * padsize - 1;
  if yend > size(img,1)
    yend = size(img,1);
    ybreak = 1;
  end

  for xstart=1:isize:size(img,2)-padsize-isize
    i = i + 1;
    xbreak = 0;
    xend = xstart + isize + 2 * padsize - 1;
    if xend > size(img,2)
        xend = size(img,2);
        xbreak = 1;
    end
    subimg = img(ystart:yend,xstart:xend);
    imwrite(subimg,sprintf(outpat,j,i));
    
    if xbreak
        break
    end
  end
  
  if ybreak
      break
  end
end

end
