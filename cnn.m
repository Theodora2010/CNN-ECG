function acc = cnn()
%CNN Arhitecture
layers = [
    %Layers of connections
    imageInputLayer([128 128 3],"Name","imageinput")
    convolution2dLayer([10 10],32,"Name","conv_2","BiasL2Factor",10,"Padding",[1 1 1 1])
    reluLayer("Name","relu_1")
    convolution2dLayer([10 10],32,"Name","conv_1","BiasL2Factor",10,"Padding",[1 1 1 1])
    reluLayer("Name","relu_2")
    maxPooling2dLayer([2 2],"Name","maxpool_1","Padding","same")
    dropoutLayer(0.5,"Name","dropout_1")
    convolution2dLayer([8 8],32,"Name","conv_3","BiasL2Factor",10,"Padding",[1 1 1 1])
    reluLayer("Name","relu_3")
    convolution2dLayer([4 4],32,"Name","conv_4","BiasL2Factor",10,"Padding",[1 1 1 1])
    reluLayer("Name","relu_4")
    maxPooling2dLayer([2 2],"Name","maxpool_2","Padding","same")
    dropoutLayer(0.5,"Name","dropout_2")
    %Layers of classification
    fullyConnectedLayer(256,"Name","fc_1")
    dropoutLayer(0.5,"Name","dropout_3")
    fullyConnectedLayer(2,"Name","fc_2")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];

%Arhitecture:
plot(layerGraph(layers));

%Data base:
imdsTrain = imageDatastore("C:\Users\ASUS\Desktop\Folder nou","IncludeSubfolders",true,"LabelSource","foldernames");
[imdsTrain, imdsValidation] = splitEachLabel(imdsTrain,0.8,"randomized");

% Resizing data:
augimdsTrain = augmentedImageDatastore([128 128 3],imdsTrain);
augimdsValidation = augmentedImageDatastore([128 128 3],imdsValidation);

%Training options:
opts = trainingOptions("sgdm",...
    "ExecutionEnvironment","cpu",...
    "InitialLearnRate",0.01,...
    "L2Regularization",1e-05,...
    "MaxEpochs",50,...
    "Momentum",0.8,...
    "Shuffle","every-epoch",...
    "Plots","training-progress",...
    "ValidationData",augimdsValidation);

%Training:
[net, traininfo] = trainNetwork(augimdsTrain,layers,opts);

%Results:
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;
acc = sum(YPred == YValidation)/numel(YValidation);
end