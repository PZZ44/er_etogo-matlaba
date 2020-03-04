ImgZero = zeros(800,800); % генерация массива из нулей
Image = im2uint8(ImgZero); % создание пустого 8bit-изображения
R = exp(randn(800, 800));  % генерация экспоненциального шума
Noise = im2double(Image); % создание массива для изображения
Noise = Noise + R; % слияние изображения с экспоненциальным шумом
Noise = im2uint8(Noise); % возврат изображения к типу 8-bit

% создание рабочего окна и его настройка
figure('Name','Гистограмма экспоненциального шума', 'NumberTitle','off');
ImgHist = histogram(Noise); % строим гистограмму

Direct = ('Lab5'); % создание директории для этого проекта
if ~exist(Direct)
    mkdir(Direct);
end;
cd(Direct); % сохранение директории, если проверка удачна
saveas(ImgHist, 'HistogramNoise', 'png'); % запись гистограммы в файл

% создание переменной для нового изображения и занесение в неё шума
ImgNoise = Noise;
% извлечение из папки певого фигуры
Obj1 = im2double(imread('Picture1.png'));
for i = 1:size(Obj1, 1)
    for j = 1:size(Obj1, 2)
        if (Obj1(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру на изображение
            ImgNoise(i+310, j+310) = Obj1(i,j);
        end;
    end;
end;
imwrite(ImgNoise, 'ImgNoise.png');

ImgNoiseX2 = Noise; % копирование шума на новое изображение
Obj1X2 = imresize(Obj1, 2); % увеличение фигуры в 2 раза
for i = 1:size(Obj1X2, 1)
    for j = 1:size(Obj1X2, 2)
        if (Obj1X2(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру на изображение
            ImgNoiseX2(i+230, j+230) = Obj1X2(i,j);
        end;
    end;
end;
imwrite(ImgNoiseX2, 'ImgNoiseX2.png'); % запись результат в файл

ImgNoiseHalf = Noise; % копирование шума на новое изображение
Obj1Half = imresize(Obj1, 0.5); % уменьшение фигуры в 2 раза
for i = 1:size(Obj1Half, 1)
    for j = 1:size(Obj1Half, 2)
        if (Obj1Half(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру на изображение
            ImgNoiseHalf(i+355, j+355) = Obj1Half(i,j);
        end;
    end;
end;
imwrite(ImgNoiseHalf, 'ImgNoiseHalf.png');  % запись результат в файл

ImjNoiseDouble = Noise; % копирование шума на новое изображение
Obj2 = im2double(imread('Picture2.png')); % извлечение из файла второй фигуры
for i = 1:size(Obj2, 1)
    for j = 1:size(Obj2, 2)
        if (Obj2(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру на изображение
            ImjNoiseDouble(i+15, j+15) = Obj2(i,j);
        end;
    end;
end;
Obj3 = im2double(imread('Picture3.png')); % извлечение из файла третьей фигуры
for i = 1:size(Obj3, 1)
    for j = 1:size(Obj3, 2)
        if (Obj3(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру на изображение
            ImjNoiseDouble(i+630, j+630) = Obj3(i,j);
        end;
    end;
end;
imwrite(ImjNoiseDouble, 'ImjNoiseDouble.png'); % записываем результат в файл

imwrite(fliplr(ImjNoiseDouble), 'ImgNoiseDoubleHor.png');  % поворот ImjNoiseDouble.png по горизонтали
imwrite(flip(ImjNoiseDouble), 'ImgNoiseDoubleVert.png'); % поворот ImjNoiseDouble.png по вертикали
imwrite(imrotate(ImjNoiseDouble, -45), 'ImgNoiseDouble45R.png'); % поворот ImjNoiseDouble.png на 45° по час стрелке
imwrite(imrotate(ImjNoiseDouble, 45), 'ImgNoiseDouble45L.png'); % поворот ImjNoiseDouble.png на 45° против час стрелки

Fon = imread('FonPicture.jpg'); % извлечение фона из папки
FonBrigth = imadjust(Fon, [0 1], [0 0.25]); % ставим яркость фона на 25%
imwrite(FonBrigth, 'FonBrigth.png'); % записываем результат в файл

R = exp(randn(800, 800)); % генерируем экспоненциальный шум ещё раз

% расширяем матрицу шума до 3D-формата, чтобы
% матрица была соизмерима с фоном
R = repmat(R, [1 1 3]);

FonNoiseBrigth = im2double(FonBrigth); % преобразуем фон к 3D-матрице
FonNoiseBrigth = FonNoiseBrigth+R; % слияем шум с фоном

% создаём отдельную переменную для фона с фигурам
FonNoiseBrigthObj = FonNoiseBrigth;

for i = 1:size(Obj3, 1)
    for j = 1:size(Obj3, 2)
        if (Obj3(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру №3 на изображение
            FonNoiseBrigthObj(i+15, j+15) = Obj3(i,j);
        end;
    end;
end;
for i = 1:size(Obj2, 1)
    for j = 1:size(Obj2, 2)
        if (Obj2(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру №2 на изображение
            FonNoiseBrigthObj(i+620, j+600) = Obj2(i,j);
        end;
    end;
end;
imwrite(FonNoiseBrigthObj, 'FonObj2Obj3.png'); % записываем результат в файл

FonNoiseNegative = imadjust(FonNoiseBrigthObj, [0 1], [1 0]); % Применяем к фону эффект негатив
imwrite(FonNoiseNegative, 'FonNoiseNegative.png'); % записываем результат в файл

FonObj1 = FonNoiseBrigth; % копируем параметры из FonNoiseBrigth в новую переменную
for i = 1:size(Obj1, 1)
    for j = 1:size(Obj1, 2)
        if (Obj1(i,j) < 1)
            % в ходе вложенного цикла наносим фигуру №1 на изображение
            FonObj1(i+310, j+310) = Obj1(i,j);
        end;
    end;
end;
imwrite(FonObj1, 'FonObj1.png'); % записываем результат в файл

% находим разность между FonNoiseBrigth и FonObj1, затем пишем результат в
% файл FonMix.png
imwrite(FonNoiseBrigth - FonObj1, 'FonMix.png');
