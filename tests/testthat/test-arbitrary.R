context("Test grammar parsing on the fly");

f <- dparse("tran.g");

sink("tran.g-1");
f("
    b       = -1
    d/dt(X) = a*X + Y*Z;
    d/dt(Y) = b*(Y - Z);
    d/dt(Z) = -X*Y + c*Y - Z
    if (t < 0.02 | t > 99.98){
        print
    }
", function(name, value, pos, depth){
    cat(sprintf("name:%s;value:%s;pos:%s;depth:%s\n", name, value, pos, depth));
})
sink();
t1 <- readLines("tran.g-1");
t1c <- readLines("tran.g-1.check");
test_that("character specification works", {
    expect_equal(t1, t1c);
})
unlink("tran.g-1");

sink("tran.g-2");
f({
    b       = -1
    d/dt(X) = a*X + Y*Z;
    d/dt(Y) = b*(Y - Z);
    d/dt(Z) = -X*Y + c*Y - Z
    if (t < 0.02 | t > 99.98){
        print
    }
}, function(name, value, pos, depth){
    cat(sprintf("name:%s;value:%s;pos:%s;depth:%s\n", name, value, pos, depth));
})
sink();

t2 <- readLines("tran.g-2");
t2c <- readLines("tran.g-2.check");

test_that("expression specification works", {
    expect_equal(t2, t2c);
})
unlink("tran.g-2");

sink("tran.g-3");
f(function(){
    b       = -1
    d/dt(X) = a*X + Y*Z;
    d/dt(Y) = b*(Y - Z);
    d/dt(Z) = -X*Y + c*Y - Z
    if (t < 0.02 | t > 99.98){
        print
    }
}, function(name, value, pos, depth){
    cat(sprintf("name:%s;value:%s;pos:%s;depth:%s\n", name, value, pos, depth));
})
sink();

t3 <- readLines("tran.g-3");
t3c <- readLines("tran.g-3.check");

test_that("function specification works", {
    expect_equal(t3, t3c);
})
unlink("tran.g-3");
