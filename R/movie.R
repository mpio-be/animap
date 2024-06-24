#' make_moviemap  
#' @param dir 
#' @param outnam 
#' @param outdir 
#' @param nframes 
#' @param movie_length_secs 
#' @examples 
#' make_moviemap(dir =  , outnam =  , outdir =  , nframes = nrow(frmss), movie_length_secs = 25)
#' @export 

make_moviemap <-function (dir, outnam, outdir, nframes = nrow(frmss), movie_length_secs = 25) {
	frate = round(nframes/movie_length_secs)
	if (missing(outnam)) 
		outnam = "animap.mp4"
	if (missing(outdir)) 
		outdir = getwd()
	call = glue::glue("cd {dir} && ffmpeg -r {frate} -pattern_type glob -i \"*.png\" -c:v libx264 -vf \"scale=trunc(iw/2)*2:trunc(ih/2)*2\" -pix_fmt yuv420p -preset veryslow -crf 1 {outnam}")
	t0 = Sys.time()
	system(call)
	system(glue::glue("mv {dir}/{outnam} {outdir}"))
	difftime(Sys.time(), t0)
}


#' makefrm 
#' 
#' makefrm  
#' @param d 
#' @param bytime 
#' @param byid 
#' @examples 
#' makefrm(d =  , bytime = 15 mins, byid = id)
#' @export 

makefrm <-function (d, bytime = "15 mins", byid = "id") {
	d[, .(date = seq(as.POSIXct(as.Date(min(date))), as.POSIXct(as.Date(max(date))), by = bytime)), by = byid]
}
