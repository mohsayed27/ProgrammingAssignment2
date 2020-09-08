## I have googled how to get inverse matrix in R
## then followed the example to change mean function by solve function


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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data) %*% data
        x$setmean(inv)
        inv		
}
