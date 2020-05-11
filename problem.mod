set I;
/* set of courses */

set J;
/* set of rooms */

set K;
/* set of time slots */

set L;
/* exception courses */

set M;
/* exception rooms */

param cost{i in I, j in J, k in K}, >= 0;
/* cost of allocating room j to course i in time slot k */

var x{i in I, j in J, k in K} binary;
/* x[i,j,k] = 1 means room j is assigned to course i in time slot k
   x[i,j,k] = 0 otherwise  */

s.t. first{i in I}: sum{j in J, k in K} x[i,j,k] = 1;

s.t. second{j in J, k in K}: sum{i in I} x[i,j,k] <= 1;

s.t. third: sum{i in L, j in M, k in K} x[i,j,k] = 0;

minimize obj: sum{i in I, j in J, k in K} c[i,j,k] * x[i,j,k];
/* the objective is to find a cheapest assignment */

solve;

printf "\n";

data;

set I := a b c d e;

set J := A B C;

set K := 1 2 3;

set L := a b c;

set M := C;

param cost :=
[*,*,1]: a b c d e :=
       A 1 1 1 1 1
       B 1 1 1 1 1
       C 1 1 1 1 1
[*,*,2]: a b c d e :=
       A 2 2 2 2 2
       B 2 2 2 2 2
       C 2 2 2 2 2
[*,*,3]: a b c d e :=
       A 3 3 3 3 3
       B 3 3 3 3 3
       C 3 3 3 3 3;

end;
