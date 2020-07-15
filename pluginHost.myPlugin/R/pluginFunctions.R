#' Package docs
#' @docType package
#' @name pluginHost_myPlugin
#' @author Nathan Sheffield
#' 
#' @references \url{http://github.com/databio/pluginHost}
NULL

#' pre hook function
#' @export
preHook = function() {
    message("Congratulations, your plugin is installed! preHook function called")
}

#' post hook function
#' @export
postHook = function() {
    message("postHook function called.")
}
