% Öncelikle denklemi tanımladım
f = @(x) x.^3 + x.^2 + 8*x - 10;

% Denklemin grafiğini çizmek için
deger_x = linspace(-3, 3, 1000);
deger_y = f(deger_x);
plot(deger_x, deger_y);
xlabel('x');
ylabel('f(x)');
title('Denklemin Grafiği: x^3 + x^2 + 8x - 10');
grid on;

% Kullanıcıdan başlangıç noktasını, 
% minimum hatayı ve iterasyon sayısını almak için
x_baslangic = input('Başlangıç noktasını giriniz: ');
tolerans = input('Minimum hata toleransını giriniz: ');
max_yineleme = input('Maksimum yineleme sayısını giriniz: ');

% Newton-Raphson yöntemini uygulamak ve her iterasyon için kök ve hatayı
% hesaplamak için
x = x_baslangic;
hatalar = zeros(1, max_yineleme);
for yineleme = 1:max_yineleme
    f_baslangic = (f(x + tolerans) - f(x - tolerans)) / (2 * tolerans);
    yeni_x = x - f(x) / f_baslangic;
    hata = abs(yeni_x - x);
    hatalar(yineleme) = hata;
    fprintf('Yineleme %d: Kök = %.6f, Hata = %.6f\n', yineleme, yeni_x, hata);

% Eğer hata toleransı belirlenen tolerans değerinden 
% küçük veya ona eşitse, iterasyon döngüsü sonlandırılır
% mesaj ekrana yazdırılır.
    if hata <= tolerans
        fprintf("Belirlenen hata toleransına ulaştınız. \n")
        break;
    end
    x = yeni_x;
end

% Tahmini kökün konumunu grafiğe işaretlemek için
hold on;
plot(yeni_x, f(yeni_x), 'ro', 'MarkerSize', 8);
legend('f(x)', 'Tahmini Kök', 'Location', 'best');

% Hataları göstermek için bir grafik çizimi
figure;
plot(1:yineleme, hatalar(1:yineleme), '-o');
xlabel('Yineleme');
ylabel('Hata');
title('Yinelemelere Göre Hata Grafiği');
grid on;

