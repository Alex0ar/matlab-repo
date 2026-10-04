%% MASIVE
%initializari
X=[2,4,5];
Y=[2;4;5];
A=[[2,1,0];[1,1,0];[1,2,1]];
T=zeros(3,3,2);
T(:,:,1)=A;
T(:,:,2)=A;
%afisare
disp(X);
disp(Y);
disp(A);
disp(T);
%accesare element/linie,coloana,plan
prim_X=X(1);
elementul_1_2=A(1,2);
prima_linie_A=A(1,:);
prima_coloana_A=A(:,1);
el_1_2_2=T(1,2,2);
primul_plan=T(:,:,1);

%concatenari
%generare 2 matrice aleatoare U(0,1)
m1=unifrnd(0,1,[3,2]);
m2=unifrnd(0,1,[3,2]);
mat=[m1, m2];
matt=[m1;m2];
disp(m1);
disp(m2);
disp(mat);
disp(matt);



%% STUCTURI DE CONTROL
% IF, IF-ELSE, IF-ELSEIF
A=[[2,1,0,1];[1,1,0,3];[1,2,1,5]];
[m,n]=size(A);
if m==n
    disp('A este patratica');
elseif m>n
    disp('Mai multe linii')
else
    disp('Mai multe coloane');
end
% SWITCH
switch m
    case 1
        disp('A este vector linie');
    case n
        disp('A este patratica');
    otherwise
        disp('altceva');
end
% FOR
% numarul elementelor nule din T
nr_0=0;
[l,c,p]=size(T);
for i=1:l
    for j=1:c
        for k=1:p
            if ~T(i,j,k)
                nr_0=nr_0+1;
                disp([i,j,k])
            end
        end
    end
end
disp(['numarul de elemente nule din T este ' int2str(nr_0)]);
% cu fprintf
fprintf('numarul de elemente nule din T este %d', nr_0);


for i=20:-2:10
    disp(i);
end

%WHILE

%aduna numerele din fis_numere, citite unul cate unul
suma=0;
f_nr=fopen('fis_numere.txt','r');
while ~feof(f_nr)
    suma=suma+fscanf(f_nr,'%d',[1,1]);
end
disp(['suma numerelor din fisier este ' int2str(suma)]);
fclose(f_nr);

%aduna numerele din fis_numere, citite intr-un masiv
suma=0;
f_nr=fopen('fis_numere.txt','r');
Numere=fscanf(f_nr,'%d');
disp(Numere);
disp(['suma numerelor din fisier este ' int2str(sum(Numere))]);
fclose(f_nr);

%% OPERATORI SI FUNCTII UTILE PENTRU LUCRUL CU MATRICE
disp(m1);disp(m2);
%m1+m2
suma_m=m1+m2;
disp(suma_m);
%suma_m la care adaug 2 la fiecare element
suma_m1=suma_m+2;
disp(suma_m1);
%m1*(m2 Transpus)
produs_m=m1*m2';
disp(produs_m);
% suma elementelor primei linii din m1
disp(sum(m1(1,:)));
% suma pe fiecare coloana a matricei m1
disp(sum(m1));
% suma elementelor lui m1
disp(sum(sum(m1)));
% reshape
[linii,coloane]=size(m1);
disp(m1);
% linializare pe coloana
m1_vector_c=reshape(m1,[1,linii*coloane]);
disp(m1_vector_c);
% linializare pe linie
m1_vector_l=reshape(m1',[1,linii*coloane]);
disp(m1_vector_l);


