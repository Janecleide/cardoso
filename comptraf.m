 function [output] = comptraf(Vvz, Ivz, Pvz, Vcc, Icc,Pcc, Vprim, Vsec, FPcarga, Strafo)


a = (Vprim/Vsec); % Relacao de transformacao
Vs = Vprim; % Tensao de operacao do primario

Is = Strafo/Vs; % Corrente nominal
angCarga = acos(FPcarga);

FPvz = Pvz/(Vvz*Ivz);

mYe = Ivz/Vvz;

angYe = acos(FPvz);

[realYe,imYe]= pol2cart(angYe,mYe); 

Rc = a^(2)*((1/realYe));

Xm =a^(2)* abs((1/imYe));

FPcc = Pcc/(Vcc*Icc);

mZe =Vcc/Icc;

angZe = acos(FPcc);

[Req,Xeq] = pol2cart(angZe,mZe);

Pativa = Vs*Is*cos(angCarga);

Pcobre =(Is^2)*Req;
Vpa = Vs+ Req.*Is+j.*Xeq.*Is;

 
Pnucleo = (abs(Vpa)^2)/Rc;

Efic = abs(100*Pativa/(Pcobre + Pnucleo + Pativa));
 
Reg = (abs (Vpa) - Vs)/Vs*100;

output.Rc = Rc;
output.Xm = Xm;
output.Req = Req;
output.Xeq = Xeq;
output.FPvz = FPvz;
output.FPcc = FPcc;
output.Efic = Efic;
output.Reg = Reg;
end