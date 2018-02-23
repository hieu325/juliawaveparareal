function wave2(u0, ut0, vel, dx, tf)

    dt=dx/2;
    Nt=Int(floor(tf/dt));
    c2=vel.*vel;
    
    u=u0;
    ut=ut0;
    
    ddx(f)=(circshift(f,(1,0))+circshift(f,(-1,0))+circshift(f,(0,1))+circshift(f,(0,-1))-4*f)/dx^2;
    for k=1:Nt      
        ou=u[:,:];
        # wave equation update
        u = ou+ut*dt+0.5*dt^2*c2.*ddx(ou);         
        ut = ut+0.5*dt*c2.*(ddx(u)+ddx(ou));
    end

return (u,ut)

end
