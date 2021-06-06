function [bboxFace, test_points ] = InitShapeDRMF( img,faceDetector,DRMF,isfigure) 
%     figure(1), set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 1], 'Visible','off');
    
    test_image=im2double((img));
%     imshow(test_image);hold on;

    bboxFace = step(faceDetector, test_image);        
    
    if(size(bboxFace, 2) > 1)
        [~,ind] = max(bboxFace(:,3));
        bboxFace = bboxFace(ind,:);
    end 
    
    test_init_shape = InitShape(bboxFace,DRMF.refShape);
    test_init_shape = reshape(test_init_shape,49,2);
%     plot(test_init_shape(:,1),test_init_shape(:,2),'ro');
    size(test_init_shape);
    if size(test_image,3) == 3
        test_input_image = im2double(rgb2gray(test_image));
    else
        test_input_image = im2double((test_image));
    end
     
    if(size(bboxFace,1) > 1)
        [val,idx] = max(bboxFace(:,3));
        bboxFace   = bboxFace(idx,:);
    end

    MaxIter=6;
    test_points = Fitting(test_input_image,test_init_shape,DRMF.RegMat,MaxIter); 

%     plot(test_points(:,1),test_points(:,2),'g*','MarkerSize',6);hold off;
%     legend('Initialization','Final Fitting');  

    for i = 1: size(test_points,1)
%         text(test_points(i,1),test_points(i,2),num2str(i),'Color','w');
    end

end

