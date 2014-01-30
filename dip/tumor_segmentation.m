name = input('Provide an image name:  ', 's');
[name2 format] = strread(name, '%s %s', 'delimiter','.');
a=imread(name,format{1}); %reading image
a1 = imresize(a, [300 300]);
b = rgb2gray(a1); %to grayscale
subplot(2,4,1);
imshow(b)%initial image 2 grayscale

true=0;
 while(true~=1)
	thresholdValue = input('Please define threshold (proposed is 150): ');
	c = b > thresholdValue;
	subplot(2,4,2);
	imshow(c)
	true = input('Do you want to continue (0/1): ');
 end

true=0;
 while(true~=1)
	min_obj = input('Please define the minimum object size (proposed is 150 pixels): ');
	d=bwareaopen(c, min_obj);
	subplot(2,4,3);
	imshow(d)
	true = input('Do you want to continue (0/1): ');
 end


e = imfill(d,'holes'); %better filtering
subplot(2,4,4);
imshow(e);

L = bwlabel(e);% object measurements; each object has to have an index as a value
subplot(2,4,5);
imshow(L,[]);
index = input('Using Data Cursor, please select a specific object (from the last image) and provide index: ');
for i=1:300
  for j=1:300
    if L(i,j)~=index
	  L(i,j)=0;%assigning zero value to not needed shapes
	end
  end 
end
subplot(2,4,6);
imshow(L,[]);
%the required shape is located to L matrix - each pixel of it, has an index value!
count=0;
for i=1:300
  for j=1:300
    if L(i,j)==index
	  count=count+1;
	end
  end 
end
giro_giro = edge(L);
fprintf('Tumor size in pixels: %i \n', count);

%giving a little bit of thickness to the frame
for i=1:300
  for j=1:300
    if giro_giro(i,j)==1
	  b(i,j)=1;
	  b(i+1,j)=1;
	end
  end 
end
subplot(2,4,7);
imshow(b);
