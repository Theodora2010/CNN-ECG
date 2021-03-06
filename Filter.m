function y = filtrare(SIG)
%   Filtering:
%   SIG: vector of data
%   y: vector of denoised data


tipul = 'db4';
nivel = 7;
sorh = 's';    

%   Tresholds:
thrSettings =  [...
    0.364901106466179 ; ...
    0.679361112297085 ; ...
    1.919075433990411 ; ...
    2.787112725982012 ; ...
    0.000000000000000 ; ...
    0.000000000000000 ; ...
    0.000000000000000   ...
    ];

a = cmddenoise(SIG,tipul,nivel,sorh,NaN,thrSettings);
y = transpose(a);
