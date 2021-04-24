
function y = TM(r,c,x)
        N = length(r);
        M = length(c);
        
        n = log2(N+M-1);
        n = ceil(n);
        n = 2^n;
        
        c1 = zeros(1,n);
        
        for k=1:M
                c1(k) = c(k);
        end
        
        for k = 2:N
            c1(n+2-k) = r(k);
        end
        
        xl = length(x);
        
        if xl < n
            x2 = zeros(1,n);
            for k =1:xl
                x2(k) = x(k);
            end
            y1 = CM(c1,x2);
            y = zeros(1,M);
        
            for k = 1:M
                y(k) = y1(k);
            end 
        else
            y1 = CM(c1,x);
            y = zeros(1,M);
        
            for k = 1:M
                y(k) = y1(k);
            end
           
        end
        
        
        
        
end
