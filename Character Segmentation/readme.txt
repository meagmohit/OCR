Segmentation



1. segmentChar.m

This is the function for the segmentation.
· The input is a matrix of image
· The output is a struct, which has 2 areas: bounding and data
    (1)bounding - The position of the top-left point and the bottom-right point of the bounding box of the character
                  It’s a 1x4 matrix: [row # of top-left point, col # top-left point, row # of bottom-right point, col # of bottom-right point]
    (2)data - The 20x20 black-white(0-1) matrix of the character
· Here is an example of how to use this function:
	img = imread(‘test.png’);
	result = segmentChar(img);
	numOfChar = size(result, 2);
	for i = 1 : numOfChar
		src = result(i).data;
		% label = yourSVM(src);
	end



2. segmentChar_test.m

A test script for segmentChar function.
There is many test images in folder ‘testsample’