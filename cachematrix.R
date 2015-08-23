## Below two functions is used to create a spacial object that
## stores a matirx vector and cache's its reverse matrix

## the following function used to cache reverse matrix

makeCacheMatrix <- function(x = matrix()) {
    r<- NULL
    set<- function(y){
      x<<- y
      r<<- NULL
    }
    get<- function() x
    setinversematrix<- function(rm)  r <<- rm
    getinversematrix<- function() r
    list(set = set, get= get,
         setinversematrix = setinversematrix,
         getinversematrix = getinversematrix)
    
}


## The following functions calculate the inverse matrix of the input
## matrix.However, it first checks to see if the inverse matrix has 
## already  been calculated. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        r<- x$getinversematrix()
        if(!is.null(r)){
            message("getting cached data")
            return(r)
        }
        data <- x$get()
        r<- solve(data)
        x$setinversematrix(r)
        r
}
