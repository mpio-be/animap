#' alphaAlong 
#' 
#' alphaAlong  
#' @param x 
#' @param head 
#' @param skew 
#' @examples
#'  alphaAlong(x =  , head = 20, skew = -2)
#' @export 

alphaAlong <-function (x, head = 20, skew = -2) {
	if (head >= length(x)) 
		head = as.integer(length(x) * 0.5)
	x = as.numeric(x)
	he = scales::rescale(x[(length(x) - head):length(x)], c(skew, 0)) |> exp()
	ta = rep(min(he), length.out = length(x) - head - 1)
	c(ta, he)
}


#' sizeAlong 
#' 
#' sizeAlong
#' @param x 
#' @param head 
#' @param to 
#' @examples 
#' sizeAlong(x =  , head = 20, to = c(0.1, 2.5))
#' @export 

sizeAlong <-function (x, head = 20, to = c(0.1, 2.5)) {
	if (head >= length(x)) 
		head = as.integer(length(x) * 0.5)
	x = as.numeric(x)
	he = scales::rescale(x[(length(x) - head):length(x)], to)
	ta = rep(min(he), length.out = length(x) - head - 1)
	c(ta, he)
}
