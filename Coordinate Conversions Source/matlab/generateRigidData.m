function generateRigidData(mc,xform)
data = [1.0000,    1.0000,    1.0000,    0.0100,   -0.0100,    0.0000;
    1.0000,    1.0000,    1.0000,    0.0100,   -0.0100,   -0.0100;
    -0.5000,    1.0000,    1.0000,    0.0100,   -0.0100,   -0.0100;
    -0.0000,    0.0001,    0.0001,    0.0000,   -0.0000,   -0.0000;
    -2.49057281992992,0.84917664534742,0.351855928713871,-0.00439381326893646,0.00724404598236554,0.0157294745248363;
    ];
tdisp = zeros(size(data));
pdisp = zeros(size(data));
forces = [        0.0568e3,     0.0217e3,     0.3595e3,     1.6722e3,    -6.2027e3,     0.0014e3;
    0.0572e3,     0.0209e3,     0.3590e3,     1.7098e3,    -6.1463e3,    -0.3031e3;
    -0.0060e3,     0.0196e3,     0.3381e3,     1.6543e3,    -5.7681e3,    -0.2176e3;
    -0.0000e3,     0.0000e3,     0.0000e3,     0.0001e3,    -0.0005e3,    -0.0000e3;
    -0.0060e3,     0.0196e3,     0.3381e3,     1.6543e3,    -5.7681e3,    -0.2176e3;
    ];
tforces = zeros(size(forces));
pforces = zeros(size(forces));
disp('plat displacements');
result = printMatrix(data);
disp(result)
disp('plat forces');
result = printMatrix(forces);
disp(result)
rigid = RigidTransformation(mc,xform);
for i = 1:size(data,1)
    tdisp(i,:) = rigid.transform(data(i,:),false);
    tforces(i,:) = rigid.transformForces2(forces(i,:));
end
disp('mc displacements');
result = printMatrix(tdisp);
disp(result)

disp('mc forces');
result = printMatrix(tforces);
disp(result)
for i = 1:size(data,1)
    pdisp(i,:) = rigid.transform(tdisp(i,:),true);
    pforces(i,:) = rigid.transformForces2(tforces(i,:));
end
disp('plat result displacements');
result = printMatrix(pdisp);
disp(result)

disp('plat result forces');
result = printMatrix(pforces);
disp(result)
end
function csharp = printMatrix(matrix)
csharp = '';
lfirst = true;
for i = 1:size(matrix,1)
    line = 'new double[] { ';
    cfirst = true;
    for k = 1:size(matrix,2)
        if ~cfirst
            line = sprintf('%s, ',line);
        end
        line = sprintf('%s %12.7g',line,matrix(i,k));
        cfirst = false;
    end
    if ~lfirst
        csharp = sprintf('%s},\n\t',csharp);
    end
    lfirst = false;
    csharp = sprintf('%s%s',csharp,line);
end
csharp = sprintf('%s}\n',csharp);
end