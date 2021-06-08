function [IFaces] = FaceDetection(I,faceDetector, DRMF,resizeS)
    
    if(size(I,3)>1)
        I = rgb2gray(I); 
    end
        
    [~,pointsInit]   = InitShapeDRMF(I,faceDetector,DRMF,'off'); 
        
    bboxes = [pointsInit(1,1), pointsInit(3,2)-20, pointsInit(10,1) - pointsInit(1,1),( pointsInit(41,2)-pointsInit(3,2))+60];
 
    IFaces = imcrop(I,bboxes);
    IFaces = imresize(IFaces,[resizeS,resizeS]);
end

