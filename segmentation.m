function y = segmentare(a,c,s,d,adn)
    y = zeros();
    for i=1:a-1         
        poz=(1.2/c);     
        for j=1:poz     
            if i==1 
                poz1=1;
            else
                poz1=poz*(i-1);
            end
                for l=1:d
                    if adn(l,1)>=poz1 && adn(l,1)<=(poz*i)
                        y(i,1)=1;
                    end
                 end
            y(i,j+1) = s((poz*(i-1)+j),:);   %valoare ciclu semnal
         end
    end
end