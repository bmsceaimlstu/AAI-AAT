% Use this editor as a MiniZinc scratch book
include "alldifferent.mzn";
int: N=3;

array[1..N,1..N] of var 1..N*N: x;
int: Magic_num=N*(N*N+1) div 2;

constraint alldifferent ([x[i,j] | i in 1..N, j in 1..N]);
constraint forall(i in 1..N)(sum (j in 1..N)(x[i,j])=Magic_num);
constraint forall(i in 1..N)(sum (j in 1..N)(x[j,i])=Magic_num);
constraint sum(i in 1..N)(x[i,i])=Magic_num;
constraint sum(i in 1..N)(x[i,N-i+1])=Magic_num;

solve satisfy;

