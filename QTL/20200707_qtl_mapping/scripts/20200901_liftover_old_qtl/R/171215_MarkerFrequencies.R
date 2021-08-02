#Yanjun
freq.h <- read.table("~/Documents/impute/HWS.freq.171030.txt.frq",stringsAsFactors = F,header=F,fill=T)
freq.l <- read.table("~/Documents/impute/LWS.freq.171030.txt.frq",stringsAsFactors = F,header=F,fill=T)

#Örjan
freq.h <- read.table("~/Dropbox/Projects/Ongoing/HL_F2_SeqMrk/F2_re_seq/data/HWS.freq.txt.frq",stringsAsFactors = F,header=F,fill=T)
freq.l <- read.table("~/Dropbox/Projects/Ongoing/HL_F2_SeqMrk/F2_re_seq/data/LWS.freq.txt.frq",stringsAsFactors = F,header=F,fill=T)

freq.h <- gsub(pattern = ".*:(\\d.*)",replacement = "\\1",x = freq.h[2:nrow(freq.h),5] )
freq.l <- gsub(pattern = ".*:(\\d.*)",replacement = "\\1",x = freq.l[2:nrow(freq.l),5] )

freq.h <- as.numeric(freq.h)
freq.l <- as.numeric(freq.l)

freq.diff <- freq.h - freq.l

informative.between <- (freq.h)^2*(1-freq.l)^2+freq.l^2*(1-freq.h)^2
hist(informative.between)
mean(informative.between,na.rm = TRUE)
sum(informative.between>0.25, na.rm = TRUE)

informative.hws <- 2*(freq.h)^2*(1-freq.h)^2
hist(informative.hws)
mean(informative.hws, na.rm = TRUE)

informative.lws <- 2*(freq.l)^2*(1-freq.l)^2
hist(informative.lws)
mean(informative.lws, na.rm = TRUE)

dev.off()
hist(abs(freq.diff))
hist(freq.h)
hist(freq.l)
