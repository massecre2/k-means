N1 = [2,2]; 
N2 = [7,6]; 

sinif1=repmat(N1,500,1)+randn(500,2);
sinif2=repmat(N2,500,1)+randn(500,2); 
tumSiniflar = [sinif1;sinif2]; 

plot(tumSiniflar(:,1),tumSiniflar(:,2),'o');

C1=[9.6505  1.9493];%10*rand(1,2);
C2=[7.7981  1.8864];%10*rand(1,2);

hold on; 
plot(C1(1),C1(2),'r+','MarkerSize',10,'LineWidth',5);
plot(C2(1),C2(2),'k+','MarkerSize',10,'LineWidth',5);
hold off


for i=1:150
    d1=tumSiniflar-repmat(C1,1000,1);
    uzC1 = sqrt(d1(:,1).^2+d1(:,2).^2);%c1 e olan uzaklýgý gosteren matris

    d2=tumSiniflar-repmat(C2,1000,1);
    uzC2 = sqrt(d2(:,1).^2+d2(:,2).^2);

    kume=uzC1>=uzC2; %0 olanlar c2 , 1 olanlar c1 ye dahil

    C1Kumesi = tumSiniflar(find(kume==1),:);
    C2Kumesi = tumSiniflar(find(kume==0),:);

    hold on;
    plot(C1Kumesi(:,1),C1Kumesi(:,2),'k+');
    plot(C2Kumesi(:,1),C2Kumesi(:,2),'r*');
    hold off;

    C1=mean(C1Kumesi); 
    C2=mean(C2Kumesi);

    hold on; 
    plot(C1(1),C1(2),'k+','MarkerSize',10,'LineWidth',5);
    plot(C2(1),C2(2),'r+','MarkerSize',10,'LineWidth',5);
    hold off

    pause;
end