library(ggplot2)
library(stringr)
library(scales)

format_amount <- function(amount){
  if(amount>115000){
  
  amount_formatted <- paste0('$',round(plyr::round_any(amount,100)/1000.0,digits=1),'k')
  
  return(amount_formatted)
  }
  else {amount_formatted <- paste0(round(plyr::round_any(amount,1000)/1000.0,digits=1),'')
  return(amount_formatted)
}
  }


setwd("C:\\Users\\as07785\\Downloads")
screencast <- read.table("test.csv",header=TRUE,sep=" ",stringsAsFactors=FALSE)


screencast[screencast$Investments == 'Average_Market_Investment','Investments'] <- 'Market Average'
screencast[screencast$Investments == 'Investment_by_RWJF','Investments'] <- 'Robert Wood Johnson Foundation'


screencast$Funding<-as.numeric(lapply(screencast$Funding,function(x) str_replace(x,',','')))

screencast$funding_label <- unlist(lapply(screencast$Funding,format_amount))

plot <- ggplot(data=screencast, aes(x=Collaborations,y=as.numeric(Funding),fill=factor(Investments))) +
  geom_bar(position="dodge",stat="identity") + 
  geom_text(data=screencast,aes(label=funding_label), vjust=0.5,hjust=1.2,position = position_dodge(0.9), color="Black", size=6)+
  
  coord_flip() +
  
  
  scale_fill_brewer(palette="Paired") +
  theme_minimal()+
  theme(legend.position="bottom")+
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=16,face="bold")) +
  labs(y = "Funding ($)",fill='') +
  scale_y_continuous(labels=scales::dollar)
print(plot)