addpath(genpath('class\'));

if(isequal(formass, 'train'))
    TrainingForm
else
    TestingForm
end
    