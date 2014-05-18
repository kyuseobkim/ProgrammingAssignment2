## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Creates a special matrix, which is a list of functions to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set.matrix <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get.matrix <- function() {
                x
        }
        set.inverse <- function(inv) {
                inverse <<- inv
        }
        get.inverse <- function() {
                inverse
        }
        list(set.matrix = set.matrix, get.matrix = get.matrix,
             set.inverse = set.inverse, get.inverse = get.inverse)
}


## Write a short comment describing this function
## find the inverse using cache if possible

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$get.inverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        matrix <- x$get.matrix()
        inverse <- solve(matrix, ...)
        x$set.inverse(inverse)
        inverse
}
