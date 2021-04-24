function ans = ICZT(X,N,W,A)
    M = length(X);
    if M~=N
        ans = -1;
    else
        x = zeros(1,N);
        for k = 1:N %for product of P^(-1) and X
            x(k) = (W^(-(k-1)*(k-1)/2)) *X(k);
        end
        
        p = zeros(1,N);
        p(1) =1;
        for k= 2:N %precomputing polynomial products for finding u
            p(k) = p(k-1)*(W^(k-1) - 1);
        end
        
        u = zeros(1,N);
        
        for k = 1:N
            ind = k-1;
            
            u(k) = ((-1)^ind)* ( W^((2*ind*ind - (2*N-1)*ind + N*(N-1))/2)/(p(k)*p(N+1-k)) );
        end
        
        z = zeros(1,N);
        u1 = zeros(1,N);
        u2 = zeros(1,N);
        u2(1) = u(1);
        for k = 2:N
            u1(k) = u(N+2-k);
         
        end
        
        x1 = TM(u1,z,x);
        x1 = TM(z,u1,x1);
        x2 = TM(u,u2,x);
        x2 = TM(u2,u,x2);
        
        ans = zeros(1,N);
        
        for k =1:N
            ans(k) = (x2(k) - x1(k))/u(1);
            
        end
        
        for k =1:N
            ans(k) = (A^k)* (W^(-(k-1)*(k-1)/2) )*ans(k);
        end
        % multiplying Q^(-1) with X
        
        
        
        
        
    end 

end