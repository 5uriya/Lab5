
#' A package connecting to a web API.
#'
#' A package is created which is connected to Google Distance Matrix API,
#' it gives the distance between two cities and time taken to travel.
#' 
#' @section func1() function:
#' func1() returns the distance and time taken to travel between two cities.
#' 
#' 
#' @docType package
#' @name Lab5
#' @examples func1("chennai","bangalore")
#' @references \href{https://developers.google.com/maps/documentation/javascript/distancematrix}
#' 








func1<-function(origin,destination){
 
   stopifnot(is.character(origin)==T && is.character(destination)==T && (tolower(origin)!= tolower(destination)) )
  
  destination<-gsub(pattern = " ",replacement = "",destination)
  origin<-gsub(pattern = " ",replacement = "",origin)
  url1<-"https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins="
  url1<-paste(url1,origin,"&destinations=",destination,"&key=AIzaSyB47VpiErStMPVbFHQxueDYN0-hnDu4l-U",sep = "",collapse = NULL)
  sample1<-jsonlite::fromJSON(url1,flatten = TRUE)
  url2<-paste("https://maps.googleapis.com/maps/api/geocode/json?address=",origin,",+CA&key=AIzaSyD7TlapnNso6QUYkh0c17n97qDgEvJBERk",sep = "",collapse = NULL)
  sample2<-jsonlite::fromJSON(url2,flatten = TRUE)
  url3<-paste("https://maps.googleapis.com/maps/api/geocode/json?address=",destination,",+CA&key=AIzaSyD7TlapnNso6QUYkh0c17n97qDgEvJBERk",sep = "",collapse = NULL)
  sample3<-jsonlite::fromJSON(url3,flatten = TRUE)
  
  
  des.out<-sample1$destination_addresses
  ori.out<-sample1$origin_addresses
  num.out<-unlist(sample1[3])
  names(num.out)<- NULL
  cat(" The distance between \n",ori.out,"\n and \n",des.out," is ",num.out[2],"\n and the rough time taken for travel is ",num.out[4])
  lt1 <- as.vector(sample2$results[6])
  names(lt1) <- NULL
  ltt1<- as.numeric(lt1)
  
  ln1 <- as.vector(sample2$results[7])
  names(ln1) <- NULL
  lnn1 <- as.numeric(ln1)
  
  
  
  lt2 <- as.vector(sample3$results[6])
  names(lt2) <- NULL
  ltt2<- as.numeric(lt2)
  
  ln2 <- as.vector(sample3$results[7])
  names(ln2) <- NULL
  lnn2 <- as.numeric(ln2)
  
}


