## Matrix inversion is usually a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than compute it repeatedly
##
## The makeCacheMatrix function creates a special "inv_matrix" object that 
## can cache its inverse.
##
makeCacheMatrix <- function(x = matrix()) {
      inv_matrix <- NULL
      set <- function(y) {
            x <<- y
            inv_matrix <<- NULL
      }
      
      get <- function() x
      set_inv_matrix <- function(inverse) inv_matrix <<- inverse
      get_inv_matrix <- function() inv_matrix
      list(set = set, 
           get = get,
           set_inv_matrix = set_inv_matrix,
           get_inv_matrix = get_inv_matrix)
}
##
## The cachesolve function computes the inverse of the special "inv_matrix" 
## returned by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve 
## will retrieve the inverse from the cache.
##
## This function assumes that the matrix is invertible
##
cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      inv_matrix <- x$get_inv_matrix()
      if(!is.null(inv_matrix)) {
            message("Matrix has already been inverted.  Getting cached copy of inverted matrix")
            return(inv_matrix)  # Return the previously cached data
      }
      
      # The matrix has not been inverted yet, so we need to invert it
      new_matrix <- x$get()
      inv_matrix <- solve(new_matrix, ...)
      x$set_inv_matrix(inv_matrix)   # set the value in the cache
      inv_matrix                     # return the inverted matrix
}
