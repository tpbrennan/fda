## LIBRARIES INSTALL 
#install.packages('Hmisc')
#install.packages('ROCR')
#install.packages('epicalc')
#install.packages('survival')

## LIBRARIES 
library(Hmisc)
library(ROCR)
library(epicalc)
library(survival)

## CLEAR WORKSPACE
rm(list=ls())

## INPUT DATA
filename = c("data/FDA_Approvals_Q113-Q214.csv")
path = c("/Users/tbrennan/Research/git/fda")
DATA = read.csv(paste(path,filename,sep="/"))

# TRANSFORM DATE
DATA$Approval.Date = as.Date(DATA$Approval.Date,"%m/%d/%Y")


# SUBSETS
APPROVALS = subset(DATA,DATA$Approval.Type == 'Approval')
LABELLING = subset(DATA,DATA$Approval.Type == 'Labeling Revision')
TENTATIVE = subset(DATA,DATA$Approval.Type == 'Tentative Approval')
ADDITIONS = subset(DATA,DATA$Approval.Type == 'Manufacturing Change or Addition')

# HISTOGRAM of FDA APPROVALS
pdf(sprintf('%s/figure/fig-approvals.pdf',path))
h = hist(APPROVALS$Approval.Date,breaks="quarters",xaxt="n",freq=TRUE,
     main='FDA Drug Approvals',xlab="",col="lightgray",
     xlim=c(as.Date("2013-01-01"),as.Date("2014-12-31")))
axis.Date(1,at=seq(as.Date("2013-02-15"),as.Date("2014-12-30"),by="quarters"),
          label=c('Q1\'13','Q2\'13','Q3\'13','Q4\'13','Q1\'14','Q2\'14','Q3\'14','Q4\'14'))
axis(2,at=seq(0,max(h$counts),50),labels=seq(0,max(h$counts),50))
abline(lsfit(h$mids[1:6], h$counts[1:6]),col='red')
dev.off()

# HISTOGRAM of FDA LABEL REVISIONS
pdf(sprintf('%s/figure/fig-labelrevisions.pdf',path))
h = hist(LABAELLING$Approval.Date,breaks="quarters",xaxt="n",freq=TRUE,
         main='FDA Label Revisions',xlab="",col="lightgray",
         xlim=c(as.Date("2013-01-01"),as.Date("2014-12-31")))
axis.Date(1,at=seq(as.Date("2013-02-15"),as.Date("2014-12-30"),by="quarters"),
          label=c('Q1\'13','Q2\'13','Q3\'13','Q4\'13','Q1\'14','Q2\'14','Q3\'14','Q4\'14'))
axis(2,at=seq(0,max(h$counts),50),labels=seq(0,max(h$counts),50))
abline(lsfit(h$mids[1:6], h$counts[1:6]),col='red')
dev.off()

# HISTOGRAM of FDA ADDITIONS
pdf(sprintf('%s/figure/fig-additions.pdf',path))
h = hist(ADDITIONS$Approval.Date,breaks="quarters",xaxt="n",freq=TRUE,
         main='FDA Manufacturing Changes or Aditions',xlab="",col="lightgray",
         xlim=c(as.Date("2013-01-01"),as.Date("2014-12-31")))
axis.Date(1,at=seq(as.Date("2013-02-15"),as.Date("2014-12-30"),by="quarters"),
          label=c('Q1\'13','Q2\'13','Q3\'13','Q4\'13','Q1\'14','Q2\'14','Q3\'14','Q4\'14'))
axis(2,at=seq(0,max(h$counts),50),labels=seq(0,max(h$counts),50))
abline(lsfit(h$mids[1:6], h$counts[1:6]),col='red')
dev.off()

# HISTOGRAM of FDA TENTATIVE APPROVALS
pdf(sprintf('%s/figure/fig-tentativeapprovals.pdf',path))
h = hist(TENTATIVE$Approval.Date,breaks="quarters",xaxt="n",freq=TRUE,
         main='FDA Drug Tentative Approvals',xlab="",col="lightgray",
         xlim=c(as.Date("2013-01-01"),as.Date("2014-12-31")))
axis.Date(1,at=seq(as.Date("2013-02-15"),as.Date("2014-12-30"),by="quarters"),
          label=c('Q1\'13','Q2\'13','Q3\'13','Q4\'13','Q1\'14','Q2\'14','Q3\'14','Q4\'14'))
axis(2,at=seq(0,max(h$counts),50),labels=seq(0,max(h$counts),50))
abline(lsfit(h$mids[1:6], h$counts[1:6]),col='red')
dev.off()

# HISTOGRAM of FDA TOTAL
pdf(sprintf('%s/figure/fig-totals.pdf',path))
h = hist(DATA$Approval.Date,breaks="quarters",xaxt="n",freq=TRUE,
         main='FDA Total Approvals',xlab="",col="lightgray",
         xlim=c(as.Date("2013-01-01"),as.Date("2014-12-31")))
axis.Date(1,at=seq(as.Date("2013-02-15"),as.Date("2014-12-30"),by="quarters"),
          label=c('Q1\'13','Q2\'13','Q3\'13','Q4\'13','Q1\'14','Q2\'14','Q3\'14','Q4\'14'))
axis(2,at=seq(0,max(h$counts),50),labels=seq(0,max(h$counts),50))
abline(lsfit(h$mids[1:6], h$counts[1:6]),col='red')
dev.off()

