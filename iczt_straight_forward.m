function x = iczt_straight_forward(X,N,W,A)
    M = length(X);
    if M~=N
        ans = -1;
    else
        x = zeros(1,N);
        for k = 1:N %for product of P^(-1) and X
            x(k) = (W^(-(k-1)*(k-1)/2)) *X(k);
        end
        r = zeros(1,N);
        for k = 1:N
            r(k) = W^(-(k-1)*(k-1)/2);
        end
        WW = toeplitz(r);
        WW = inv(WW);
        x = x*WW;
        
        
        for k =1:N
            x(k) = (A^k)* (W^(-(k-1)*(k-1)/2) )*x(k);
        end
        % multiplying Q^(-1) with X
        
        
        
        
        
    end 

end

%written by vaibhaw
