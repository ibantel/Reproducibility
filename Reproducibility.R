# Tutorial to set up version control with Git: https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN 

# in your project, use Tools > Version Control > Git
# after restarting, .gitignore and .Rhistory is added; now, file histories will be added

# regular data manipulation and analysis----
library(foreign) # Version 0.8-71

# Read Data
minaret <- read.dta("./raw_data/Minaret.dta")

# Preprocessing
minaret$gend <- ifelse(minaret$female == 1, 0, 1) 

# Analysis
fit <- glm(Minaret ~ educ + female,
           family = "binomial",
           data = minaret)

summary(fit)

stargazer::stargazer(fit,
                     title = "Minaret vote choice",
                     align = TRUE) # This prints everything to the console and can be used in a LaTeX document

# random numbers----

# Simulating predicted probabilities manually (normally you would use glm.predict)
set.seed(42, kind = "Mersenne-Twister", normal.kind = "Inversion")

mu <- coef(fit) # Coefficient Vector
var <- vcov(fit) # VCE

beta.sim <- MASS::mvrnorm(n=10000, # create a multivariate normal distribution
                          mu = mu,
                          Sigma = var) # Generate 10k simulated draws

s.sim <- c(1,0,1) # Intercept, low education, female
p.sim <- matrix(NA, nrow = 10000, ncol = 1, byrow = TRUE)

for (i in 1:10000){
  p.sim[i,1] <- plogis(beta.sim[i,1] * s.sim[1] +
                         beta.sim[i,2] * s.sim[2] +
                         beta.sim[i,3] * s.sim[3])} # Simulated predicted probabilities

head(p.sim) # first 6 predictions
mean(p.sim) # mean of predictions
quantile(p.sim, pprobs = c(.025, .975)) # give confidence interval

