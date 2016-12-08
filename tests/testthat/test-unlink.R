context("Test removing of dlls")
if (file.exists("tran.dll")){
    rc <- try(dyn.unload("tran.dll"), silent = TRUE);
    unlink("tran.dll");
}

f <- dparse("tran.g");
test_that("tran.dll exists #1", {
    expect_true(file.exists(f@env$dll.file));
})
gc()
test_that("tran.dll exists #2", {
    expect_true(file.exists(f@env$dll.file));
})

dll <- f@env$dll.file;
rm(f);
gc();
test_that("tran.dll has been removed", {
    expect_true(!file.exists(dll));
})

f1 <- dparse("tran.g");
f2 <- dparse("tran.g");
test_that("tran.dll exists #3", {
    expect_true(file.exists(dll));
})
gc();
test_that("tran.dll exists #4", {
    expect_true(file.exists(dll));
})
rm(f1);
gc();
test_that("tran.dll exists #5", {
    expect_true(file.exists(dll));
})
rm(f2);
gc();
test_that("tran.dll has been removed #2", {
    expect_true(!file.exists(dll));
})
