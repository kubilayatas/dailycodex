function [yn,My] = myconv(x1n,Mx1,x2n,Mx2);
if nargin < 4 || isempty(x1n) || isempty(x2n) || isempty(Mx1) || isempty(Mx2)
    Mx1 = input('x1[n]''in başlangıç indisini giriniz: ');
    x1n = input('x1[n]''i giriniz: ');
    Mx2 = input('x2[n]''in başlangıç indisini giriniz: ');
    x2n = input('x2[n]''i giriniz: ');
end
Nx1 = Mx1 + length(x1n)-1;
Nx2 = Mx2 + length(x2n)-1;
My = Mx1;
Ny = Mx1 + length(x1n) + length(x2n)-2;
disp(strcat('[Mx1,Nx1]: [',num2str(Mx1),',',num2str(Nx1),']'))
disp(strcat('[Mx2,Nx2]: [',num2str(Mx2),',',num2str(Nx2),']'))
disp(strcat('[My,Ny]: [',num2str(My),',',num2str(Ny),']'))
yn = zeros(1,Ny-My+1);
for i=[1:(length(x1n)+length(x2n)-1)]
    Multipl = x1n.*x2n';
    diagon = i-length(x2n);
    yn(i) = sum(diag(flipud(Multipl),diagon));
end
figure;

subplot(2,2,1);
stem([Mx1:Nx1],x1n,'filled');
title('x1[n] signal');
xlim('tight');
grid on

subplot(2,2,2);;
stem([Mx2:Nx2],x2n,'filled');
title('x2[n] signal');
xlim('tight');
grid on

subplot(2,2,3);
stem([My:Ny],yn,'filled');
title('y[n]=x1[n]*x2[n] signal (My Conv)');
xlim('tight');
grid on

subplot(2,2,4);
stem([My:Ny],conv(x1n,x2n),'filled');
title('y[n]=x1[n]*x2[n] signal (Matlab Conv)');
xlim('tight');
grid on
