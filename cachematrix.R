## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
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


## Write a short comment describing this function
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
}
