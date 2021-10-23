import scipy.interpolate as sci

def func(n):
    return (1 - n + n**2 - n**3 + n**4 - n**5 + n**6 - n**7 + n**8 - n**9 + n**10)


x = [func(j) for j in range(1,11)]

y = [n for n in range(1,11)]


def f6(x):
    return x**6


def lagrange(x,i,xm):
    """
    Evaluates the i-th Lagrange polynomial at x
    based on grid data xm
    """
    n=len(xm)-1
    y=1.
    for j in range(n+1):
        if i!=j:
            y*=(x-xm[j])/(xm[i]-xm[j])
    return y

def interpolation(x,xm,ym):
    n=len(xm)-1
    lagrpoly = array([lagrange(x,i,xm) for i in range(n+1)])
    y = dot(ym,lagrpoly)
    return y





