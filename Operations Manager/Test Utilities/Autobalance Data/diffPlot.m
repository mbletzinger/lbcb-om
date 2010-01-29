dof = 2;
plot(gold(:,1),diffNum{7}(:,dof),'.');
hold all
g = 2;
ldg{1} = diffDesc{8};
for f = [ 10 12 14 16 17 ]
   disp(sprintf('plotting %s [%d]',diffDesc{f},f));
    plot(gold(:,1),diffNum{f}(:,dof),'.');
    ldg{g} = diffDesc{f};
    g = g + 1;
end
grid on
legend(ldg{:})