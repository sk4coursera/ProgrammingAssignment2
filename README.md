### Computing and caching the Inverse of a Matrix

```
  m1 = matrix(runif(25), 5, 5)
  x <- makeCacheMatrix(m2)

  cacheSolve(x) # Caculates the inverse of the matrix and caches it
  cacheSolve(x) # When called again returns the cached inverse
```

To update the matrix and there by invalidate the cache

```
  m2 = matrix(runif(25), 5, 5)
  x$set(m2) # Matrix is updated in the object returned by makeCacheMatrix, this invalidates the cache
  
  cacheSolve(x) # Caculates the inverse of the matrix and caches it
  cacheSolve(x) # When called again returns the cached inverse
```