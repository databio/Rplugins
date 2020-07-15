# Rplugins demo packages

This repo demonstrates how to write simple R plugins. There are 2 packages here, a host package (the one that will run the plugin), and the plugin package.

The host package has a function, that would be run by a user. It does whatever the host package should do. It also runs a plugin function, if one exists.

The plugin package defines the function to be run when the host package function is run.

To communicate, the plugin package must list the host package in 'Enhances', and provide functions with names that correspond to the plugin function names expected by the host package. In this example, the function names are 'preHook' and 'postHook', but they can be anything specified in the host package.

## Demo

```R
install.packages("pluginHost", repos=NULL)
```

```R
pluginHost::hostFunction()	
```
There should be no plugin functions run here, you just see hello world from the host package.

But install the plugin and run the function:


```R
install.packages("pluginHost.myPlugin", repos=NULL)
pluginHost::hostFunction()
```

Now you get some more stuff, called from the plugin package -- even though we're calling a function from the host package. These are not called if you remove the package


```R
remove.packages("pluginHost.myPlugin")
pluginHost::hostFunction()
```


## Develepment

```
devtools::document("pluginHost")
devtools::document("pluginHost.myPlugin")
```
