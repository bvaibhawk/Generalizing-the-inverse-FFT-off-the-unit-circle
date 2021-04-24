function y = CM(c,x)
    C = fft(c);
    X = fft(x);
    n = length(c);
    Y = zeros(1,n);
    
    for k = 1:n
        Y(k) = C(k)*X(k);
    end
    
    y = ifft(Y);
    
end