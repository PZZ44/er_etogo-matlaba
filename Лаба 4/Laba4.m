 clc % ������� ���������� ����
 
 str1 = '������ ���������� 1981 3 4 3 4 3 5'; % ������������� ������
 
 % ������ � ������ ����� ������ �������� � ������ ������ ��������� ��������
 % � ����������� ������������ ������
 KolvoSymb = sum(str1~=' ');
 
 disp(['������� ������ str1 = ', str1]) % ����� �������� ������ � ��������� ����
 % ����� ����������
 disp(['���������� �������� � ������ ��� ����� �������� ����� ', int2str(KolvoSymb)])

 p = findstr(str1, ' '); % �������� ������� �� ������� �������� � ������
 strA = str1(1 : p(1)-1); % ������ � ������ ������� �����
 strB = str1(p(1) : p(end)); % ������ � ������ ������ ����� 1�� � ��������� ������
 strC = str1(p(end)+1 : end); % ������ � ������ ���������� �����
 str1 = [strC strB strA]; % ������ ���� ����� � �������� ������
 % ����� � ��������� ���� ����������
 disp(['�������� ������ � ������� 1�� � ���������� �����: "', str1, '"']);
 
 str2 = '1981 3 4 3 4 3 5'; % ������������� ������
 disp('******************'); % ���������� �����������
 disp(['������� ������ � ������� str2 = ', str2]); % ����� �������� ������
 str2 = strrep(str2, '1981', '������ ��������� ����������� ����'); % ������ ����� 23
 str2 = strrep(str2, '3', '���'); % ������ ����� 2002
 str2 = strrep(str2, '4', '������'); % ������ ����� 0.35
 str2 = strrep(str2, '5', '����'); % ������ ����� 0.32
 % ����� ����������
 disp('��� ������ ���� �� ����� ���������� ���������:');
 disp(str2);
 
 str3 = '������ ���������� 1981 3 4 3 4 3 5'; % ������������� ������
 disp('******************'); % ���������� �����������
 disp(['������� ������ � ������� str3 = ', str3]); % ����� �������� ������
 
 p = findstr(str3, ' '); % �������� ������� �� ������� �������� � ������
 sNumb1 = str2double(str3(p(2):p(3)-1)); % ������ ����� 1981
 sNumb2 = str2double(str3(p(3):p(4)-1)); % ������ ����� 3 
 sNumb3 = str2double(str3(p(4):p(5)-1)); % ������ ����� 4
 sNumb4 = str2double(str3(p(5):p(6)-1)); % ������ ����� 3
 sNumb5 = str2double(str3(p(6):p(7)-1)); % ������ ����� 4
 sNumb6 = str2double(str3(p(7):p(8)-1)); % ������ ����� 3
 sNumb7 = str2double(str3(p(8):end)); % ������ ����� 5
 
 disp('����� ������� � ������� �� �������� ������:');
 format short g; % ��������� ������� ������ ��� ����������� ����������� �����
 masNumb = [sNumb1 sNumb2 sNumb3 sNumb4 sNumb5 sNumb6 sNumb7] % ����� ���-�� � ������

 disp('******************'); % ���������� �����������
 
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
 disp(['������ ������ �� �����: ', StrF]);
 disp('����� ������� ����� �� �����: ');
 MatFA = fscanf(File, '%g', [1 6]);
 MatFB = fscanf(File, '%g', [1 6]);
 MatF1 = [MatFA; MatFB]
 MatF2 = fscanf(File, '%g', [1 2])
 
 disp('******************'); % ���������� �����������
 
 
% ����������
tic %�������� ������
%������� �����, ��� ��������� ������� � html-����
File1NameExp='html';
PictHigh1='500'; %������ ������� �� html-��������
DirName1 = (File1NameExp);
%create new folder for ������
if ~exist(DirName1)
mkdir(DirName1);
end;
cd(DirName1);
%������� html-���� ��� �������� ������
FileHtml=fopen(['index', '.html'],'wt');
%��������� html-�����
fprintf(FileHtml,['<HTML>\n']);
fprintf(FileHtml,['<head>\n']);
fprintf(FileHtml,['<title>����� �� ������������ ������</title>\n']);
fprintf(FileHtml,['<meta http-equiv = "content-type" content = "text/html; charset = "windows"/>\n']);
fprintf(FileHtml,['</head>\n']);
fprintf(FileHtml,['<body>\n']);
fprintf(FileHtml,['<center><h2>�����<br/>�� ������������ ������</h2></center>\n']);
% ������� ��������� ��� ������ ����������
fprintf(FileHtml,['<h3>�������� ������</h3>\n']);
fprintf(FileHtml,['<img src = "images/screen1.png" alt = "�������" width = "700px"/><br/>\n']);
fprintf(FileHtml,['<img src = "images/screen2.png" alt = "�������" width = "300px"/><br/>\n']);
fprintf(FileHtml,['<h3>������� 1..6</h3>\n']);
fprintf(FileHtml,['<img src = "images/screen3.png" alt = "������� 1-6" width = "850px"/>\n']);
% ������� ��������� ��� ������ ����������
% ������� ����������� ����
h1=figure('Name','������ �������', 'NumberTitle','off', 'Position', [450 200 600 450]);
hold on
%��������� �������
x = 1:0.1:5;
y = sin(3.*x);
grid on;
plot(x,y,'r');
xlabel('��� �������');
ylabel('��� �������');
hold off
%��������� ����������� ������� � ����
FileName000= 'graph.jpg';
saveas(h1,FileName000);

% ���������� ����������� ���� ���������� ���������� �� html-��������

%��������� html-����
fprintf(FileHtml,['<br/><br/>\n']);
fprintf(FileHtml,['<h3>�������</h3>\n']);
fprintf(FileHtml,['<a href= "' FileName000 '" title = "������� ������ �������"/>' ]);
fprintf(FileHtml,['<br/><img src = "' FileName000 '" height="' PictHigh1 '" alt = "������ �������"/>' '\n']);
%fprintf(FileHtml,['<a href="' FileName000 '">']);
fprintf(FileHtml,['</a>\n']);
fprintf(FileHtml,['</body>\n']);
fprintf(FileHtml,['</HTML>\n']);
fclose(FileHtml);
disp('���������� ���������');
toc %������� ��������� �������