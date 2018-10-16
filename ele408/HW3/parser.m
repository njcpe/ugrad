function parser(inputArg1,inputArg2,inputArg3)
GG1_Data = csvread(inputArg1);
GD1_Data = csvread(inputArg2);
GX1_Data = csvread(inputArg3);

Lambda = GG1_Data(:,1);
GG1 = GG1_Data(:,2);
GD1 = GD1_Data(:,2);
GX1 = GX1_Data(:,2);

plot(Lambda, GG1, Lambda, GD1, Lambda,GX1);
legend("Geo/Geo/1","Geo/D/1","Geo/X/1");
xlabel("\lambda (Arrival Probability)");
ylabel("(Avg Delay)");
title("Avg Packet Delay vs \lambda values for different servicing models");
print('Plot','-dpng')
end

