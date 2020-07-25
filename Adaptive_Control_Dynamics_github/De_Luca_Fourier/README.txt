%% Adaptive Dynamic fmincon Optimization %%%


PARAMETERS:   x =  [a_1 a_2 b_1 b_2 q0_1 q0_2 wf]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% CASE II ( Maximization of determinant of Gramian == min(-fun))

% Initial Guess

Cost function = determinant of Gramian

x0 = [11.3 7.2 4 2.9 0.6 0.3 0.5*pi];

x* = [ 20.5496    0.1173    1.8877    2.2446    0.5536    0.2851    6.2810]

Bounds
lb = [0.1 0.1 0.1 0.1  0     0      0.1*pi];
ub = [30  30  30  30   6.28  6.28   2*pi];





Computing Gramian by integrating.
Getting determinant of Gramian.
[ 175197.0,  346286.0, 171089.0,  668477.0,  667037.0,  173758.0]
[ 346286.0,  685433.0, 339147.0, 1323850.0, 1322000.0,  344439.0]
[ 171089.0,  339147.0, 168059.0,  655369.0,  654962.0,  170681.0]
[ 668477.0, 1323850.0, 655369.0, 3403520.0, 3723160.0,  988115.0]
[ 667037.0, 1322000.0, 654962.0, 3723160.0, 4221070.0, 1164950.0]
[ 173758.0,  344439.0, 170681.0,  988115.0, 1164950.0,  350592.0]
 
1787753601.3222618389533563356887
 
Getting smallest eigenvalue of Gramian.
  -1.7878e+09

Computing Gramian by integrating.
Getting determinant of Gramian.
[ 175197.0,  346286.0, 171089.0,  668477.0,  667037.0,  173758.0]
[ 346286.0,  685433.0, 339147.0, 1323850.0, 1322000.0,  344439.0]
[ 171089.0,  339147.0, 168059.0,  655369.0,  654962.0,  170681.0]
[ 668477.0, 1323850.0, 655369.0, 3403520.0, 3723160.0,  988115.0]
[ 667037.0, 1322000.0, 654962.0, 3723160.0, 4221070.0, 1164950.0]
[ 173758.0,  344439.0, 170681.0,  988115.0, 1164950.0,  350592.0]
 
1787753670.9354208977242188442551
 
Getting smallest eigenvalue of Gramian.
  -1.7878e+09


Local minimum possible. Constraints satisfied.

fmincon stopped because the size of the current step is less than
the value of the step size tolerance and constraints are 
satisfied to within the value of the constraint tolerance.

<stopping criteria details>

x =

   20.5496    0.1173    1.8877    2.2446    0.5536    0.2851    6.2810


fval =

  -1.7878e+09


exitflag =

     2


output = 

  struct with fields:

         iterations: 17
          funcCount: 180
    constrviolation: 0
           stepsize: 8.8692e-11
          algorithm: 'interior-point'
      firstorderopt: 5.6095e+12
       cgiterations: 79
            message: '↵Local minimum possible. Constraints satisfied.↵↵fmincon stopped because the size of the current step is less than↵the value of the step size tolerance and constraints are ↵satisfied to within the value of the constraint tolerance.↵↵<stopping criteria details>↵↵Optimization stopped because the relative changes in all elements of x are↵less than options.StepTolerance = 1.000000e-10, and the relative maximum constraint↵violation, 0.000000e+00, is less than options.ConstraintTolerance = 1.000000e-06.↵↵'

Elapsed time is 3672.646826 seconds.
Finished minimization.
>> 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CASE II (Variazione dei bounds, con stesso guess iniziale)

Cost function = determinant of Gramian

x0 = [11.3 7.2 4 2.9 0.6 0.3 0.5*pi];


lb = [0.01 0.01 0.01 0.01  0 0  0.1*pi];
ub = [100  100  100  100   6.28  6.28   2*pi];


Local minimum possible. Constraints satisfied.

fmincon stopped because the size of the current step is less than
the value of the step size tolerance and constraints are 
satisfied to within the value of the constraint tolerance.

<stopping criteria details>

x =

   11.3522    7.1170    3.9340    2.8793    0.4512    0.2933    2.0194


fval =

   -7.7280


exitflag =

     2


output = 

  struct with fields:

         iterations: 6
          funcCount: 103
    constrviolation: 0
           stepsize: 1.0682e-09
          algorithm: 'interior-point'
      firstorderopt: 2.1032e+05
       cgiterations: 44
            message: '↵Local minimum possible. Constraints satisfied.↵↵fmincon stopped because the size of the current step is less than↵the value of the step size tolerance and constraints are ↵satisfied to within the value of the constraint tolerance.↵↵<stopping criteria details>↵↵Optimization stopped because the relative changes in all elements of x are↵less than options.StepTolerance = 1.000000e-10, and the relative maximum constraint↵violation, 0.000000e+00, is less than options.ConstraintTolerance = 1.000000e-06.↵↵'

Elapsed time is 1445.265094 seconds.
Finished minimization.
>> 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cost Function = lambda min


Computing Gramian by integrating.
Getting determinant of Gramian.
[ 1782570.0, 3562720.0, 1780190.0,   4122080.0,   4173540.0,  1833980.0]
[ 3562720.0, 7121720.0, 3559000.0,   8240590.0,   8344410.0,  3666540.0]
[ 1780190.0, 3559000.0, 1778810.0,   4118500.0,   4170880.0,  1832560.0]
[ 4122080.0, 8240590.0, 4118500.0,  1.8989e+10, 1.90145e+10, 2.98138e+7]
[ 4173540.0, 8344410.0, 4170880.0, 1.90145e+10, 1.90421e+10, 3.17574e+7]
[ 1833980.0, 3666540.0, 1832560.0,  2.98138e+7,  3.17574e+7,  3777590.0]
 
  -3.1199e+32

Cost Function lambda min
  -14.8901

Computing Gramian by integrating.
Getting determinant of Gramian.
[ 1782570.0, 3562720.0, 1780190.0,   4122080.0,   4173540.0,  1833980.0]
[ 3562720.0, 7121720.0, 3559000.0,   8240590.0,   8344410.0,  3666540.0]
[ 1780190.0, 3559000.0, 1778810.0,   4118500.0,   4170880.0,  1832560.0]
[ 4122080.0, 8240590.0, 4118500.0,  1.8989e+10, 1.90145e+10, 2.98138e+7]
[ 4173540.0, 8344410.0, 4170880.0, 1.90145e+10, 1.90421e+10, 3.17574e+7]
[ 1833980.0, 3666540.0, 1832560.0,  2.98138e+7,  3.17574e+7,  3777590.0]
 
  -3.1199e+32

Cost Function lambda min
  -14.8901

Computing Gramian by integrating.
Getting determinant of Gramian.
[ 1782570.0, 3562720.0, 1780190.0,   4122080.0,   4173540.0,  1833980.0]
[ 3562720.0, 7121720.0, 3559000.0,   8240590.0,   8344410.0,  3666540.0]
[ 1780190.0, 3559000.0, 1778810.0,   4118500.0,   4170880.0,  1832560.0]
[ 4122080.0, 8240590.0, 4118500.0,  1.8989e+10, 1.90145e+10, 2.98138e+7]
[ 4173540.0, 8344410.0, 4170880.0, 1.90145e+10, 1.90421e+10, 3.17574e+7]
[ 1833980.0, 3666540.0, 1832560.0,  2.98138e+7,  3.17574e+7,  3777590.0]
 
  -3.1199e+32

Cost Function lambda min
  -14.8901

Computing Gramian by integrating.
Getting determinant of Gramian.
[ 1782570.0, 3562720.0, 1780190.0,   4122080.0,   4173540.0,  1833980.0]
[ 3562720.0, 7121720.0, 3559000.0,   8240590.0,   8344410.0,  3666540.0]
[ 1780190.0, 3559000.0, 1778810.0,   4118500.0,   4170880.0,  1832560.0]
[ 4122080.0, 8240590.0, 4118500.0,  1.8989e+10, 1.90145e+10, 2.98138e+7]
[ 4173540.0, 8344410.0, 4170880.0, 1.90145e+10, 1.90421e+10, 3.17574e+7]
[ 1833980.0, 3666540.0, 1832560.0,  2.98138e+7,  3.17574e+7,  3777590.0]
 
  -3.1199e+32

Cost Function lambda min
  -14.8901


Local minimum possible. Constraints satisfied.

fmincon stopped because the size of the current step is less than
the value of the step size tolerance and constraints are 
satisfied to within the value of the constraint tolerance.

<stopping criteria details>

initial guess x0 = [201.9 10 177 0.9 0.6 0.3 0.5*pi];


x =

  201.9000   10.0000  177.0000    0.9000    0.6000    0.3000    1.5708


fval =

  -14.8901


exitflag =

     2


output = 

  struct with fields:

         iterations: 1
          funcCount: 46
    constrviolation: 0
           stepsize: 9.2032e-11
          algorithm: 'interior-point'
      firstorderopt: 9.3355e+05
       cgiterations: 34
            message: '↵Local minimum possible. Constraints satisfied.↵↵fmincon stopped because the size of the current step is less than↵the value of the step size tolerance and constraints are ↵satisfied to within the value of the constraint tolerance.↵↵<stopping criteria details>↵↵Optimization stopped because the relative changes in all elements of x are↵less than options.StepTolerance = 1.000000e-10, and the relative maximum constraint↵violation, 0.000000e+00, is less than options.ConstraintTolerance = 1.000000e-06.↵↵'

Elapsed time is 3978.275582 seconds.
Finished minimization.
>> 
