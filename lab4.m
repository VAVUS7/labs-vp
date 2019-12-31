% Lab 4

str = "Иванов Константин 1981";
arr1 = [3 4 3 4 3 5];
mat1 = [1 2 3 4 99 80; 5 6 7 8 33 21];
arr2 = [15 90];

%1
str1 = str;
printf("Задание 1: кол-во символов в строке %d\n", length(strrep(str1, " ", ""))); 

%2
str2 = "Иванов Константин 1981 3 4 3 4 3 5";
spaces = findstr(str2, " "); 
first_w = str2(1: spaces(1));
last_w = str2(spaces(end) + 1: end);
str2 = cstrcat(last_w, str2(spaces(1):spaces(end)), first_w);
printf("Задание 2: %s\n", str2);
 
%3
str3 = "Иванов Константин 1981 3 4 3 4 3 5";
str3 = regexprep(str3, "\\<0\\>", "нуль");
str3 = regexprep(str3, "\\<1\\>", "один");
str3 = regexprep(str3, "\\<2\\>", "два");
str3 = regexprep(str3, "\\<3\\>", "три");
str3 = regexprep(str3, "\\<4\\>", "четыре");
str3 = regexprep(str3, "\\<5\\>", "пять");
str3 = regexprep(str3, "\\<6\\>", "шесть");
str3 = regexprep(str3, "\\<7\\>", "семь");
str3 = regexprep(str3, "\\<8\\>", "восемь");
str3 = regexprep(str3, "\\<9\\>", "девять");

printf("Задание 3: %s\n", str3);

%4
str4 = "Иванов Константин 1981 3 4 3 4 3 5";
str4 = strtrim(regexprep(str4, "\\D", " "));
cells = strsplit(str4, " ");
for i = 1:length(cells)
  arr(i) = str2num(cells{i});
endfor
printf("Задание 4: %s\n", mat2str(arr));


%5
f = fopen("in3.txt", "wt");

fprintf(f, "%s\n", str);
fprintf(f, "%f ", arr1);
fprintf(f, "\n");
for line = 1:size(mat1)(1);
  fprintf(f, "%f ", mat1(line, 1:end));
  fprintf(f, "\n");
endfor
fprintf(f, "%f ", arr2);
fprintf(f, "\n");

fclose(f);

% 6
f = fopen("in3.txt", "rt");

rstr = fgetl(f);
rarr1 = fscanf(f, "%f", [6]);
rmat = fscanf(f, "%f", [2 6]);
rarr2 = fscanf(f, "%f", [2]);

printf(strcat("Задание 6: " ,
        "\n\tСтрока: %s\n" ,
        "\tМассив1: %s\n" ,
        "\tМатрица: %s\n",
        "\tМассив2: %s\n"),
        rstr, mat2str(rarr1), mat2str(rmat), mat2str(rarr2)); 

fclose(f);

%7

% f = sin(3*x)

im = figure("Name", "Sin(3x)");
hold on;
  X = [1:0.2:5];
  Y = sin(3*X);
  plot(X, Y);
hold off;

saveas(im, "plot.jpg");

% HTML
doc = fopen("var3.html", "wt");
  
fprintf(doc, "%s", "<html>");
fprintf(doc, "%s",   "<head>");
fprintf(doc, "%s",     "<title>Отчет по лабораторной работе №4</title>");
fprintf(doc, "%s",   "</head>");
fprintf(doc, "%s",   "<body>");
fprintf(doc, "%s",     "<center><h3>ОТЧЕТ <br> по лабораторной работе №4</h3></center>");
fprintf(doc, "%s",     "<h3>Исходные данные</h3>");
fprintf(doc, "%s",     "Иванов Константин 1981 3 4 3 4 3 5<br>");
fprintf(doc, "%s",     "1 2 3 4 99 80<br>");
fprintf(doc, "%s",     "5 6 7 8 33 21<br>");
fprintf(doc, "%s",     "15 90");
fprintf(doc, "%s",     "<h3>График</h3>");
fprintf(doc, "%s",     "<img width=30% src=\"plot.jpg\">");
fprintf(doc, "%s",   "</body>");
fprintf(doc, "%s", "</html>");

fclose(doc);

clear all


