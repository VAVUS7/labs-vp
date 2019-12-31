pkg load image
clear all
% 1
im = ones(800, 800, 3);
f1 = im2double(imread("figure1.png"));
f2 = im2double(imread("figure2.png"));
f3 = im2double(imread("figure3.png"));
fon = im2double(imread("fon.png"));
% 2
im = imnoise(im, 'salt & pepper', 0.3);
% 3
noise_hist = figure("Name", "Гистограмма");
hold on;
  imhist(im);
hold off;
saveas(noise_hist, "noise_hist.png");
% 4
im = im .* f1;
imwrite(im, "im_f1.png");
%5 
%{
scale2_nearest = imresize(im, 2, 'nearest');
scale2_bilinear = imresize(im, 2, 'bilinear');
scale2_bicubic = imresize(im, 2, 'bicubic');
imwrite(scale2_nearest, "scale2_nearest.png");
imwrite(scale2_bilinear, "scale2_bilinear.png");
imwrite(scale2_bicubic, "scale2_bicubic.png");
%}
%6
im = ones(800, 800, 3);
im = imnoise(im, 'salt & pepper', 0.3);
im = im .* f2 .* f3;
%7
im_flip_h = flip(im);
imwrite(im_flip_h, "im_flip_h.png");
%8
im_flip_h = flip(im, 2);
imwrite(im_flip_h, "im_flip_v.png");
%9
im_r90 = rot90(im, 3);
imwrite(im_r90, "rot90.png"); 
%10
im_r90 = rot90(im);
imwrite(im_r90, "rot90_2.png"); 
%11
% Изображение загружено в начале программы
%12
im = fon(1:800, 1:800, :);
%13
im = im .* 0.25;
%14
im14 = im .* f2 .* f3;
im14 = imnoise(im14, 'salt & pepper', 0.05);
imwrite(im14, "за что все это.png");
%15
im_neg = ones(800, 800, 3) - im;
imwrite(im_neg, "negate.png");
%16
im16 = im .* f1;
im16 = imnoise(im16, 'salt & pepper', 0.05);
imwrite(im16, "за что все это2.png");
%17
im = im14 - im16;
imwrite(im, "subtraction.png");










