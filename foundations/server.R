
setwd("C:\\Users\\as07785\\Downloads")
df3 <- read.table("foundations.csv",quote = "",header=TRUE,sep=",",stringsAsFactors=FALSE)
df3
dat <- data.frame(
  
  Picture <- c('<img src="C:\\Users\\as07785\\Downloads\\download.png" height="50"></img>','<img src="C:\\Users\\as07785\\Downloads\\jf.png" height="65"></img>','<img src="C:\\Users\\as07785\\Downloads\\dtf.png" height="62"></img>','<img src="C:\\Users\\as07785\\Downloads\\pns.jpg" height="42"></img>','<img src="C:\\Users\\as07785\\Downloads\\mlse.jpg" height="72"></img>','<img src="C:\\Users\\as07785\\Downloads\\cdcr.jpg" height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\arjf.jpg" height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\Usabmx.jpg" height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\waaw.png" height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\cws.png" height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\rf.jpg" height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\cmf.png" height="92"></img>', '<img src="C:\\Users\\as07785\\Downloads\\wf.png", height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\swcs.jpg", height="82"></img>','<img src="C:\\Users\\as07785\\Downloads\\hf.jpg", height="52"></img>'
      ,'<img src="C:\\Users\\as07785\\Downloads\\jfn.png", height="52"></img>','<img src="C:\\Users\\as07785\\Downloads\\cr.png", height="52"></img>'),
  
CONTACTS <-paste0('<b>',df3[2:18,c('x')],'</b>'))


shinyServer(function(input, output){
  output$mytable <- DT::renderDataTable({
    
    DT::datatable(dat, escape = FALSE,rownames=FALSE, colnames="FOLLOWERS",class = 'cell-border stripe',options = list(language = list(
      info = '_TOTAL_ Friends from _START_ to _END_',
      paginate = list(previous = 'PREVIOUS', `next` = 'NEXT')
    ),list(search = '["automatic"]'),
      initComplete = JS(
        "function(settings, json) {",
        "$(this.api().table().header()).css({'background-color': '#00f', 'color': '#fff'});",
        "}")
    )) # HERE
  })
})