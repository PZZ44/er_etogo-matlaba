ImgZero = zeros(800,800); % ��������� ������� �� �����
Image = im2uint8(ImgZero); % �������� ������� 8bit-�����������
R = exp(randn(800, 800));  % ��������� ����������������� ����
Noise = im2double(Image); % �������� ������� ��� �����������
Noise = Noise + R; % ������� ����������� � ���������������� �����
Noise = im2uint8(Noise); % ������� ����������� � ���� 8-bit

% �������� �������� ���� � ��� ���������
figure('Name','����������� ����������������� ����', 'NumberTitle','off');
ImgHist = histogram(Noise); % ������ �����������

Direct = ('Lab5'); % �������� ���������� ��� ����� �������
if ~exist(Direct)
    mkdir(Direct);
end;
cd(Direct); % ���������� ����������, ���� �������� ������
saveas(ImgHist, 'HistogramNoise', 'png'); % ������ ����������� � ����

% �������� ���������� ��� ������ ����������� � ��������� � �� ����
ImgNoise = Noise;
% ���������� �� ����� ������ ������
Obj1 = im2double(imread('Picture1.png'));
for i = 1:size(Obj1, 1)
    for j = 1:size(Obj1, 2)
        if (Obj1(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �� �����������
            ImgNoise(i+310, j+310) = Obj1(i,j);
        end;
    end;
end;
imwrite(ImgNoise, 'ImgNoise.png');

ImgNoiseX2 = Noise; % ����������� ���� �� ����� �����������
Obj1X2 = imresize(Obj1, 2); % ���������� ������ � 2 ����
for i = 1:size(Obj1X2, 1)
    for j = 1:size(Obj1X2, 2)
        if (Obj1X2(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �� �����������
            ImgNoiseX2(i+230, j+230) = Obj1X2(i,j);
        end;
    end;
end;
imwrite(ImgNoiseX2, 'ImgNoiseX2.png'); % ������ ��������� � ����

ImgNoiseHalf = Noise; % ����������� ���� �� ����� �����������
Obj1Half = imresize(Obj1, 0.5); % ���������� ������ � 2 ����
for i = 1:size(Obj1Half, 1)
    for j = 1:size(Obj1Half, 2)
        if (Obj1Half(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �� �����������
            ImgNoiseHalf(i+355, j+355) = Obj1Half(i,j);
        end;
    end;
end;
imwrite(ImgNoiseHalf, 'ImgNoiseHalf.png');  % ������ ��������� � ����

ImjNoiseDouble = Noise; % ����������� ���� �� ����� �����������
Obj2 = im2double(imread('Picture2.png')); % ���������� �� ����� ������ ������
for i = 1:size(Obj2, 1)
    for j = 1:size(Obj2, 2)
        if (Obj2(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �� �����������
            ImjNoiseDouble(i+15, j+15) = Obj2(i,j);
        end;
    end;
end;
Obj3 = im2double(imread('Picture3.png')); % ���������� �� ����� ������� ������
for i = 1:size(Obj3, 1)
    for j = 1:size(Obj3, 2)
        if (Obj3(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �� �����������
            ImjNoiseDouble(i+630, j+630) = Obj3(i,j);
        end;
    end;
end;
imwrite(ImjNoiseDouble, 'ImjNoiseDouble.png'); % ���������� ��������� � ����

imwrite(fliplr(ImjNoiseDouble), 'ImgNoiseDoubleHor.png');  % ������� ImjNoiseDouble.png �� �����������
imwrite(flip(ImjNoiseDouble), 'ImgNoiseDoubleVert.png'); % ������� ImjNoiseDouble.png �� ���������
imwrite(imrotate(ImjNoiseDouble, -45), 'ImgNoiseDouble45R.png'); % ������� ImjNoiseDouble.png �� 45� �� ��� �������
imwrite(imrotate(ImjNoiseDouble, 45), 'ImgNoiseDouble45L.png'); % ������� ImjNoiseDouble.png �� 45� ������ ��� �������

Fon = imread('FonPicture.jpg'); % ���������� ���� �� �����
FonBrigth = imadjust(Fon, [0 1], [0 0.25]); % ������ ������� ���� �� 25%
imwrite(FonBrigth, 'FonBrigth.png'); % ���������� ��������� � ����

R = exp(randn(800, 800)); % ���������� ���������������� ��� ��� ���

% ��������� ������� ���� �� 3D-�������, �����
% ������� ���� ���������� � �����
R = repmat(R, [1 1 3]);

FonNoiseBrigth = im2double(FonBrigth); % ����������� ��� � 3D-�������
FonNoiseBrigth = FonNoiseBrigth+R; % ������ ��� � �����

% ������ ��������� ���������� ��� ���� � �������
FonNoiseBrigthObj = FonNoiseBrigth;

for i = 1:size(Obj3, 1)
    for j = 1:size(Obj3, 2)
        if (Obj3(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �3 �� �����������
            FonNoiseBrigthObj(i+15, j+15) = Obj3(i,j);
        end;
    end;
end;
for i = 1:size(Obj2, 1)
    for j = 1:size(Obj2, 2)
        if (Obj2(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �2 �� �����������
            FonNoiseBrigthObj(i+620, j+600) = Obj2(i,j);
        end;
    end;
end;
imwrite(FonNoiseBrigthObj, 'FonObj2Obj3.png'); % ���������� ��������� � ����

FonNoiseNegative = imadjust(FonNoiseBrigthObj, [0 1], [1 0]); % ��������� � ���� ������ �������
imwrite(FonNoiseNegative, 'FonNoiseNegative.png'); % ���������� ��������� � ����

FonObj1 = FonNoiseBrigth; % �������� ��������� �� FonNoiseBrigth � ����� ����������
for i = 1:size(Obj1, 1)
    for j = 1:size(Obj1, 2)
        if (Obj1(i,j) < 1)
            % � ���� ���������� ����� ������� ������ �1 �� �����������
            FonObj1(i+310, j+310) = Obj1(i,j);
        end;
    end;
end;
imwrite(FonObj1, 'FonObj1.png'); % ���������� ��������� � ����

% ������� �������� ����� FonNoiseBrigth � FonObj1, ����� ����� ��������� �
% ���� FonMix.png
imwrite(FonNoiseBrigth - FonObj1, 'FonMix.png');
