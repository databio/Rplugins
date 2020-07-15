#' Package docs
#' @docType package
#' @name pluginHost
#' @author Nathan Sheffield
#' 
#' @references \url{http://github.com/databio/pluginHost}
NULL

#' Project workspace initializer
#'
#' \code{projectInit} sources the \code{00-init.R} or \code{projectInit.R} 
#' script for the project. You pass a complete folder or a relative path. This 
#' function is intended to be run just once per session.
#' 
#' @param projectName A string 
#' @export
hostFunction = function(projectName) {

    pluginHost::runPlugin("preHook")

    # Do some stuff
    message("Hi, I'm a host function")

    pluginHost::runPlugin("postHook")



}

runPlugin = function(hook) {
    pluginKey = "pluginHost"
    pluginPkgs = names(which(vapply(installed.packages()[,"Enhances"], function(x) { pluginKey %in% x }, FUN.VALUE=FALSE)))
    for (pkg in unique(pluginPkgs)) {
        # message(paste0("Running plugin: ", pkg))
        pkgNamespace = getNamespace(pkg)
        if (hook %in% getNamespaceExports(pkg)) {
            pkgNamespace[[hook]]()
        }
    }
}