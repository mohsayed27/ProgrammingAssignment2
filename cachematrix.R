## I have googled how to get inverse matrix in R
## then followed the example to change mean function by solve function

## All is pretty simple and just like the example given
makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(mat) {
			x <<- mat
			inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set = set, get = get,
		 setinverse = setinverse,
		 getinverse = getinverse)
}


## function solves for the cache by using the built-in solve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
				##gets into here if incerse is already calculated
                message("getting cached data")
                return(inv)
        }
        data <- x$get() ##gets the matrix
        inv <- solve(data,...) ##calculates the matrix inverse
        x$setinverse(inv) 	## Stores Inverse ti be retrieved in the future
        inv		 ##Return inverse matrix
}
