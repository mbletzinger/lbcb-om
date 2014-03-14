function rot = rotationalMatrix(angle, type)
rot = eye(3);
switch type
    case 1
        rot(2,2) =  cos( angle );
        rot(2,3) = -sin( angle );
        rot(3,2) =  sin( angle );
        rot(3,3) =  cos( angle );
        return;
    case 2
        rot(1,1) =  cos( angle );
        rot(1,3) =  sin( angle );
        rot(3,1) = -sin( angle );
        rot(3,3) =  cos( angle );
        return;
    case 3
        rot(1,1) =  cos( angle );
        rot(1,2) = -sin( angle );
        rot(2,1) =  sin( angle );
        rot(2,2) =  cos( angle );
end
return;
end
