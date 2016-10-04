function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
TA = P1; TB = P2;
zSign = zeros(6,1);
h=0;

for k=1:2
	p1 = zeros(1,2); p2 = zeros(1,2); p3 = zeros(1,2); px = zeros(1,2);
	V  = zeros(2,2); zDet = zeros(4,3); 	
	for i=1:3
		if i < 3 ; m = i+1; else m = 1	; end;
		if m < 3 ; n = m+1; else n = i-1; end;
	    p1 = [ TA(i,1) , TA(i,2)]; 
	    p2 = [ TA(m,1) , TA(m,2)];
		p3 = [ TA(n,1) , TA(n,2)];
	    for j=1:4
		    if j<4
				px = [ TB(j,1) , TB(j,2)]; 	
			else	
				px = p3;
			end;
	        V = [ (p2 - p1).' , (px - p1).'];      
			zDet(j,i)= det(V);	   
		end;
	    if ( sign(zDet(1,i)) == sign(zDet(2,i)) )...
		   && ( sign(zDet(1,i)) == sign(zDet(3,i)) )...
		   && ( sign(zDet(1,i)) ~= sign(zDet(4,i)) )
	        zSign(i+h,1) = 1;
		else
		    zSign(i+h,1) = 0;
		end;
	end;
	h=3;
	TA = P2; TB = P1;
end;

if (norm(zSign(1:3)) ~= 0) || (norm(zSign(4:6)) ~= 0)
    flag = false;
else
    flag = true;
end;

% *******************************************************************
end