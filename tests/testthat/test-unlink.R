if (FALSE){
    context("Test removing of dlls")

    if (file.exists("tran.dll")){
        rc <- try(dyn.unload("tran.dll"), silent = TRUE);
        unlink("tran.dll");
    }

    options(dpaser.rm.named.parser.dll=TRUE);

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
    Sys.sleep(1)
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
    Sys.sleep(1)
    test_that("tran.dll has been removed #2", {
        expect_true(!file.exists(dll));
    })

    options(dpaser.rm.unnamed.parser.dll=TRUE);

    g <- paste(readLines("tran.g"), collapse="\n");

    f1 <- dparse(g)
    dll.file <- f1@env$dll.file

    test_that("dll exists #1", {
        expect_true(file.exists(dll.file));
    })

    f2 <- dparse(g)

    rm(f1);
    gc();

    test_that("dll exists #2", {
        expect_true(file.exists(dll.file));
    })
    rm(f2);
    gc();
    Sys.sleep(1)
    test_that("dll removed #1", {
        expect_true(!file.exists(dll.file));
    })

    options(dpaser.rm.named.parser.dll=FALSE);

    f <- dparse("tran.g");
    test_that("tran.dll exists #1a", {
        expect_true(file.exists(f@env$dll.file));
    })
    gc()
    test_that("tran.dll exists #2a", {
        expect_true(file.exists(f@env$dll.file));
    })

    dll <- f@env$dll.file;
    rm(f);
    gc()

    test_that("tran.dll exists #3a", {
        expect_true(file.exists(dll));
    })

    options(dpaser.rm.named.parser.dll=TRUE);
    gc()

    test_that("tran.dll exists #4a", {
        expect_true(file.exists(dll));
    })
    f <- dparse("tran.g");
    gc()

    test_that("tran.dll exists #5a", {
        expect_true(file.exists(dll));
    })
    rm(f)
    gc()
    Sys.sleep(1)
    test_that("tran.dll does not exit #1", {
        expect_true(!file.exists(dll));
    })
}
