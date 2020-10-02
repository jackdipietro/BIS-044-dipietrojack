load("prrace08.rda")

Obama = 0
McCain = 0

n <- length(prrace08$state_full)

for (i in 1:n) { 
  if (prrace08$p_obama[i] >= prrace08$p_mc_cain[i]) {
    Obama <- Obama + prrace08$el_votes[i]
  } else {McCain <- McCain + prrace08$el_votes[i]} }

Obama <- Obama + 1
McCain <- McCain -1

Obama
McCain
