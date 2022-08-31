library("rvest")
library("matchmaker")
library("writexl")
library(tidyverse)
library(splitstackshape)

url <- "https://www.tff.org/default.aspx?pageID=142"
tff <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="ctl00_MPane_m_142_10564_ctnr_m_142_10564_Panel1"]/table') %>%
  html_table()
tff
tff1<- as.data.frame(tff)
tff1<-tff1[-1,]
tff1<-cSplit(tff1,'X1',sep = ".",type.convert = FALSE)
tff1<- tff1[,c(-9,-11)]
view(tff1)

tff1_teams<- data.frame(X1_2=c("BODRUMSPOR A", "EYÜPSPOR",	"PENDİKSPOR FUTBOL A",	"BEYÇİMENTO BANDIRMASPOR",	"SAKARYASPOR A",	"YILPORT SAMSUNSPOR",	"GENÇLERBİRLİĞİ",	"ANKARA KEÇİÖRENGÜCÜ",	"BOLUSPOR",	"GÖZTEPE A",	"ADANASPOR A",	"ERZURUMSPOR FK",	"MANİSA FUTBOL KULÜBÜ",	"ÇAYKUR RİZESPOR A",	"ALTINORDU",	"ALTAŞ DENİZLİSPOR",	"YENİ MALATYASPOR",	"ALTAY",	"TUZLASPOR A"),
                        X1=c("Bodrumspor",	"Eyüpspor",	"Pendikspor",	"Bey Çimento Bandırmaspor",	"Sakaryaspor",	"Yılport Samsunspor",	"Gençlerbirliği",	"Ankara Keçiörengücü",    	"Boluspor",	"Göztepe",	"Adanaspor",	"Erzurumspor FK",    	"Manisa Futbol Kulübü",	"Çaykur Rizespor",	"Altınordu", "Altaş Denizlispor", "Yeni Malatyaspor",	"Altay",	"Tuzlaspor")
)
tff1<- merge(tff1,tff1_teams,by = "X1_2")
tff1<- tff1[,-1]
tff1<- tff1[,c(9,1,2,3,4,5,6,7,8)]
names(tff1)<- NULL

write_xlsx(tff1,"C:\\Users\\yakup\\OneDrive\\Masaüstü\\tff1.xlsx")


