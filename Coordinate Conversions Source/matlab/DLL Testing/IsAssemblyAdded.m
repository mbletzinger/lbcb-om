function flag = IsAssemblyAdded( MyName )

domain = System.AppDomain.CurrentDomain;
assemblies = domain.GetAssemblies;
flag = false;

for i= 1:assemblies.Length

    asm = assemblies.Get(i-1);    
    %disp(char(asm.FullName));
    if strcmpi(asm.FullName, MyName)
        flag = true;
    end

end