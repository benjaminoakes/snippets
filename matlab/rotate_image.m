% Rotate an image.  Code I helped a coworker with.
% 
% Author: Benjamin Oakes <hello@benjaminoakes.com>

im=imread('image2_cut.bmp');
finim=uint8(zeros(500,1000,3));
dx=1;
dy=500;
ddx=450;
ddy=1000;
i=360/(2.5*30);
for j=1:i:360;
    imrot=imrotate(im(dx:dy,dx:dy,:),j,'bicubic','crop');
     imrot2=imrotate(im(dx:dy,ddx:ddy,:),j,'bicubic','crop');
        finim(dx:dy,dx:dy,:)=imrot;
        finim(dx:dy,ddx:ddy,:)=imrot2;
n=(round(j/(360/(2.5*30))))+1;
        imwrite(finim,[num2str(n),'.bmp']);
end

