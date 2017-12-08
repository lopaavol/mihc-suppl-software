function [tform, rds] = matchNuclei_(fixed, moving)

rds = 1/14;
moving = imresize( moving, rds );
fixed  = imresize( fixed,  rds );

fixed = imhistmatch(fixed, moving);

ptsHE = detectSURFFeatures(fixed);
ptsIF = detectSURFFeatures(moving);

[featuresHE, validPtsHE] = extractFeatures(fixed , ptsHE);
[featuresIF, validPtsIF] = extractFeatures(moving, ptsIF);

indexPairs  = matchFeatures(featuresHE, featuresIF);
matchedHE   = validPtsHE(indexPairs(:,1));
matchedIF   = validPtsIF(indexPairs(:,2));

% figure, showMatchedFeatures(fixed, moving, matchedHE, matchedIF )

[tform, inlierDistorted, inlierOriginal] = ...
    estimateGeometricTransform(matchedIF,matchedHE,'similarity');

% registered = imwarp(moving,tform,'OutputView',imref2d(size(fixed)), 'FillValues',0);
% figure, showMatchedFeatures(fixed,moving,inlierOriginal,inlierDistorted)

end


