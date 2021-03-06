## Demonstration of how to lazy cache a computed value for future use.

## Stores a matrix with cacheable inverse
makeCacheMatrix <- function(x = matrix()) {
	inv = NULL;
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <-function(i) {
		inv <<- i
	}
	getinverse <- function() inv
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## returns the inverse of matrix x, and saves to avoid recalculating
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        print("getting matrix from cache")
        inv <- x$getinverse()
        if(is.null(inv)){
        	print("Inverse not in cache, calculating and saving")
        	inv = solve(x$get())
        	x$setinverse(inv)
        }
        inv
}
