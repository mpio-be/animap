
#' pts_to_boundary 
#' 
#' pts_to_boundary  
#' @param x 
#' @examples 
#' pts_to_boundary(x =  )
#' @export 


pts_to_boundary <- function(x) {

st_as_sf(x) |>
    st_combine() |>
    st_boundary() |>
    st_bbox() |>
    st_as_sfc() |>
    st_as_sf()

}


#' st_points2lines 
#' 
#' st_points2lines  
#' @param x 
#' @param grp 
#' @param shift_lon 
#' @examples 
#' st_points2lines(x =  , grp =  , shift_lon = FALSE)
#' @export 

st_points2lines <- function (x, grp, shift_lon = FALSE) 
{
    if (shift_lon) {
        x = st_shift_longitude(x)
    }
    if (!missing(grp)) {
        o = st_cast(dplyr::summarise(dplyr::group_by(x, .data[[grp]]), 
            do_union = FALSE, .groups = "keep"), "LINESTRING")
    }
    else {
        o = st_cast(dplyr::summarise(x, do_union = FALSE), "LINESTRING")
    }
    o
}
