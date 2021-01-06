function xp=proj_bound(y,alpha)
n=length(y);
lb=min(y)-2/length(y);
ub=max(y);
f=@(lam)sum(min(max(y-lam,0),alpha))-1;
if alpha<1/n
    fprintf("Empty Set")
    return
end
lam=bisection(f,lb,ub,1e-10);
for i=1:n
    
     if y(i)-lam<=alpha
        xp(i)=max(y(i)-lam,0);
     end
     if y(i)-lam>alpha
       xp(i)=alpha;
    end
end