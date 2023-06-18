//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int I;
  int J;
  int N;
  int<lower=1,upper=I> user[N];
  int<lower=1,upper=J> item[N];
  int<lower=0,upper=1> y[N];    //rating
  
  // prior parameters:
  real psi_0; // rep_vector(alpha, I)
  real phi_0;
}


// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  simplex[I] phi;
  simplex[J] psi;
  
}

transformed parameters {
  real<lower=0,upper=1> theta[I,J];
  
  for(i in 1:I) {
    for (j in 1:J) {
      theta[i,j] = phi[i] * psi[j] / max(psi) / max(phi);
    }
  }
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  psi ~ dirichlet(rep_vector(psi_0,J));
  phi ~ dirichlet(rep_vector(phi_0,I));
  
  for(n in 1:N) {
    y[n] ~ bernoulli(theta[user[n], item[n]]);
  }
  
}

