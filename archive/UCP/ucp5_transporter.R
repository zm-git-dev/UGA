## Correlation analysis of UCPs and mitochondrial outer membrane ion transporters.
setwd("C:/Users/jzhou/Desktop/SLC25A14")
file_name <- list.files("./", pattern="RData$")
projects <- sub("(.*)\\.up.*$", "\\1", file_name)
results <- vector("list", length(projects) * 2)
names(results) <- as.vector(outer(projects, c("_normal", "_tumor"), paste0))
names(results) <- names(results)[order(names(results))]


cor.mtest <- function(mat, conf.level = 0.95){
  mat <- as.matrix(mat)
    n <- ncol(mat)
    p.mat <- lowCI.mat <- uppCI.mat <- matrix(NA, n, n)
    diag(p.mat) <- 0
    diag(lowCI.mat) <- diag(uppCI.mat) <- 1
    for(i in seq(n-1)){
        for(j in (i+1):n){
            tmp <- cor.test(mat[,i], mat[,j], conf.level = conf.level)
            p.mat[i,j] <- p.mat[j,i] <- tmp$p.value
            lowCI.mat[i,j] <- lowCI.mat[j,i] <- tmp$conf.int[1]
            uppCI.mat[i,j] <- uppCI.mat[j,i] <- tmp$conf.int[2]
        }
    }
    rownames(p.mat) <- colnames(p.mat) <- colnames(mat)
    return(list(p.mat, lowCI.mat, uppCI.mat))
}


exp.genes <- function(df) {
    x <- rowSums(df)
    x <- x[x >= summary(x)["3rd Qu."]]
    df <- df[rownames(df) %in% names(x), ]
    return(df)
}


ucp5.t.test <- function(datan, datat) {
    x <- datan[grep("SLC25A14", rownames(datan)), ]
    y <- datat[grep("SLC25A14", rownames(datat)), ]
    if (class(x) == "numeric") {  # Got hits, otherwise would be empty matrix
        z <- t.test(x, y, na.rm=T)
        return(z$p.value <= 0.01 & z$estimate[1] < z$estimate[2])
    }
    else {
        return(FALSE)
    }
}


# df <- matrix(nrow=length(file_name), ncol=3, dimnames=list(projects, c("UCP5", "1st", "3rd")))
library(corrplot)

for (i in seq_along(projects)) {
    load(file_name[i])
    # ucp5_normal <- as.numeric(datan[grep("SLC25A14", rownames(datan)), , drop=F])
    # ucp5_tumor <- as.numeric(datat[grep("SLC25A14", rownames(datat)), , drop=F])
    # df[i,1] <- sum(datan[grep("SLC25A14", rownames(datan)), ]) / ncol(datan)
    # df[i,2:3] <- summary(rowSums(datan))[c("1st Qu.", "3rd Qu.")] / ncol(datan)
    # datan <- exp.genes(datan)
    # datat <- exp.genes(datat)
    if (ucp5.t.test(datan, datat)) {
        transporter_normal <- datan[grep("(^SLC25A14)|(^VDAC)|(^BCL2)|(^BAX)|(^BAK)|(^TOMM)", rownames(datan)), ]
        transporter_tumor <- datat[grep("(^SLC25A14)|(^VDAC)|(^BCL2)|(^BAX)|(^BAK)|(^TOMM)", rownames(datat)), ]
        rownames(transporter_normal) <- sub("(.*)\\|.*$", "\\1", rownames(transporter_normal)) 
        rownames(transporter_tumor) <- sub("(.*)\\|.*$", "\\1", rownames(transporter_tumor))

        results[[2*i-1]] <- dfn <- cor(t(transporter_normal))
        results[[2*i]] <- dft <- cor(t(transporter_tumor))
        resn <- cor.mtest(dfn,0.95)
        rest <- cor.mtest(dft,0.95)

        png(filename=paste0("./plot/expressed/", names(results)[2*i-1], ".png"), width = 1024, height = 1024, units = "px")
        corrplot.mixed(dfn, lower="number", upper="square", order="hclust", p.mat=resn[[1]], sig.level=0.05, tl.pos="lt")
        dev.off()
        png(filename=paste0("./plot/expressed/", names(results)[2*i], ".png"), width = 1024, height = 1024, units = "px")
        corrplot.mixed(dft, lower="number", upper="square", order="hclust", p.mat=rest[[1]], sig.level=0.05, tl.pos="lt")
        dev.off()
    }
}
