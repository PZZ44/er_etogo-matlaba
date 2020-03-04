 clc % очистка командного окна
 
 str1 = 'Иванов Константин 1981 3 4 3 4 3 5'; % инициализация строки
 
 % Запись в массив нулей вместо пробелов и единиц вместо остальных символов
 % и последующее суммирование единиц
 KolvoSymb = sum(str1~=' ');
 
 disp(['Входная строка str1 = ', str1]) % Вывод исходной строки в командное окно
 % Вывод результата
 disp(['Количество символов в строке без учёта пробелов равно ', int2str(KolvoSymb)])

 p = findstr(str1, ' '); % Создание вектора из позиций пробелов в строке
 strA = str1(1 : p(1)-1); % Запись в строку первого слова
 strB = str1(p(1) : p(end)); % Запись в строку текста между 1го и последним словом
 strC = str1(p(end)+1 : end); % Запись в строку последнего слова
 str1 = [strC strB strA]; % Запись всех строк в исходную строку
 % Вывод в командное окно результата
 disp(['Выходная строка с заменой 1го и последнего слова: "', str1, '"']);
 
 str2 = '1981 3 4 3 4 3 5'; % инициализация строки
 disp('******************'); % Визуальный разделитель
 disp(['Входная строка с числами str2 = ', str2]); % Вывод исходной строки
 str2 = strrep(str2, '1981', 'Тысяча девятьсот восемьдесят один'); % Замена числа 23
 str2 = strrep(str2, '3', 'три'); % Замена числа 2002
 str2 = strrep(str2, '4', 'четыре'); % Замена числа 0.35
 str2 = strrep(str2, '5', 'пять'); % Замена числа 0.32
 % Вывод результата
 disp('При замене цифр на слова получилось следующее:');
 disp(str2);
 
 str3 = 'Иванов Константин 1981 3 4 3 4 3 5'; % инициализация строки
 disp('******************'); % визуальный разделитель
 disp(['Входная строка с числами str3 = ', str3]); % вывод исходной строки
 
 p = findstr(str3, ' '); % Создание вектора из позиций пробелов в строке
 sNumb1 = str2double(str3(p(2):p(3)-1)); % запись числа 1981
 sNumb2 = str2double(str3(p(3):p(4)-1)); % запись числа 3 
 sNumb3 = str2double(str3(p(4):p(5)-1)); % запись числа 4
 sNumb4 = str2double(str3(p(5):p(6)-1)); % запись числа 3
 sNumb5 = str2double(str3(p(6):p(7)-1)); % запись числа 4
 sNumb6 = str2double(str3(p(7):p(8)-1)); % запись числа 3
 sNumb7 = str2double(str3(p(8):end)); % запись числа 5
 
 disp('Вывод массива с числами из исходной строки:');
 format short g; % изменение формата вывода для корректного отображения чисел
 masNumb = [sNumb1 sNumb2 sNumb3 sNumb4 sNumb5 sNumb6 sNumb7] % вывод рез-ов в массив

 disp('******************'); % визуальный разделитель
 
 File = fopen('in3.txt' , 'rt');
 Str1 = fscanf(File, '%s', 1);
 Str2 = fscanf(File, '%s', 1);
 Str3 = fscanf(File, '%s', 1);
 Str4 = fscanf(File, '%s', 1);
 Str5 = fscanf(File, '%s', 1);
 Str6 = fscanf(File, '%s', 1);
 Str7 = fscanf(File, '%s', 1);
 Str8 = fscanf(File, '%s', 1);
 Str9 = fscanf(File, '%s', 1);
 
 StrF = [Str1 ' ' Str2 ' ' Str3 ' ' Str4 ' ' Str5 ' ' Str6 ' ' Str7 ' ' Str8 ' ' Str9];
 disp(['Первая строка из файла: ', StrF]);
 disp('Вывод массива чисел из файла: ');
 MatFA = fscanf(File, '%g', [1 6]);
 MatFB = fscanf(File, '%g', [1 6]);
 MatF1 = [MatFA; MatFB]
 MatF2 = fscanf(File, '%g', [1 2])
 
 disp('******************'); % визуальный разделитель
 
 
% вычисление
tic %включить таймер
%указать папку, где сохранять рисунки и html-файл
File1NameExp='html';
PictHigh1='500'; %высота рисунка на html-странице
DirName1 = (File1NameExp);
%create new folder for данных
if ~exist(DirName1)
mkdir(DirName1);
end;
cd(DirName1);
%открыть html-файл для создания отчета
FileHtml=fopen(['index', '.html'],'wt');
%Заголовок html-файла
fprintf(FileHtml,['<HTML>\n']);
fprintf(FileHtml,['<head>\n']);
fprintf(FileHtml,['<title>Отчет по лабораторной работе</title>\n']);
fprintf(FileHtml,['<meta http-equiv = "content-type" content = "text/html; charset = "windows"/>\n']);
fprintf(FileHtml,['</head>\n']);
fprintf(FileHtml,['<body>\n']);
fprintf(FileHtml,['<center><h2>ОТЧЕТ<br/>по лабораторной работе</h2></center>\n']);
% листинг программы или другая информация
fprintf(FileHtml,['<h3>Исходные данные</h3>\n']);
fprintf(FileHtml,['<img src = "images/screen1.png" alt = "задания" width = "700px"/><br/>\n']);
fprintf(FileHtml,['<img src = "images/screen2.png" alt = "вариант" width = "300px"/><br/>\n']);
fprintf(FileHtml,['<h3>Задания 1..6</h3>\n']);
fprintf(FileHtml,['<img src = "images/screen3.png" alt = "задания 1-6" width = "850px"/>\n']);
% листинг программы или другая информация
% создать графическое окно
h1=figure('Name','График функции', 'NumberTitle','off', 'Position', [450 200 600 450]);
hold on
%выполнить расчеты
x = 1:0.1:5;
y = sin(3.*x);
grid on;
plot(x,y,'r');
xlabel('Ось абсцисс');
ylabel('Ось ординат');
hold off
%сохранить построенные графики в файл
FileName000= 'graph.jpg';
saveas(h1,FileName000);

% полученный графический файл необходимо разместить на html-странице

%создается html-файл
fprintf(FileHtml,['<br/><br/>\n']);
fprintf(FileHtml,['<h3>Графики</h3>\n']);
fprintf(FileHtml,['<a href= "' FileName000 '" title = "Открыть график функции"/>' ]);
fprintf(FileHtml,['<br/><img src = "' FileName000 '" height="' PictHigh1 '" alt = "График функции"/>' '\n']);
%fprintf(FileHtml,['<a href="' FileName000 '">']);
fprintf(FileHtml,['</a>\n']);
fprintf(FileHtml,['</body>\n']);
fprintf(FileHtml,['</HTML>\n']);
fclose(FileHtml);
disp('Вычисления завершены');
toc %вывести показания таймера