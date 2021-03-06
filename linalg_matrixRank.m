%% Computing rank
%%

% make a matrix
m = 4;
n = 6;

% create a random matrix
A = randn(m,n);

% what is the largest possible rank?
ra = rank(A);
disp([ 'rank(A) = ' num2str(ra) ])


% set last column to be repeat of penultimate column(second last column)
B = A;
B(:,end) = B(:,end-1);
rb = rank(B);
disp([ 'rank(B) = ' num2str(rb) ])

% set last row to be repeat of penultimate row(second last row)
B = A;
B(end,:) = B(end-1,:);
rb = rank(B);
disp([ 'rank(B) = ' num2str(rb) ])

%% adding noise to a rank-deficient matrix

% square for convenience
A = round( 10*randn(m,m) );

% reduce the rank
A(:,1) = A(:,2);

% noise level
noiseamp = .001;

% add the noise
B = A + noiseamp*randn(size(A));

disp(' ')
disp([ 'rank(w/o noise)  = ' num2str(rank(A)) ]);
disp([ 'rank(with noise) = ' num2str(rank(B)) ]);

%% Rank of A^TA and AA^T
%%

% matrix sizes
m = 14;
n =  3;

% create matrices
A = round(10*randn(m,n));

AtA = A'*A;
AAt = A*A';

fprintf('\n AtA: %gx%g, rank=%g',size(AtA,1),size(AtA,2),rank(AtA));
fprintf('\n AAt: %gx%g, rank=%g\n',size(AAt,1),size(AAt,2),rank(AAt));


%% Making a matrix full-rank by "shifting"
%%

% size of matrix
m = 30;

% create the square symmetric matrix
A = randn(m);
A = round(10*(A'*A));

% reduce the rank
A(:,1) = A(:,2);

% shift amount (lambda)
l = .01;

% new matrix
B = A + l*eye(m);

disp(['rank(w/o shift)  = ' num2str(rank(A))]);
disp(['rank(with shift) = ' num2str(rank(B))]);
