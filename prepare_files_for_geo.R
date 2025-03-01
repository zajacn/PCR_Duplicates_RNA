#Prepare files for GEO

fcpre_dirs = list("Novaseq6000" = "/srv/GT/analysis/zajacn/p2220/o31444/o31444_NovaSeq_NOV1703_subsampled_dedup/featurecounts.table.PRE.rds", 
                  "NovaseqX" = "/srv/GT/analysis/zajacn/p2220/o31444_NovaseqX_100bp/dedup/featurecounts.table.PRE.rds", 
                  "G4" = "/srv/GT/analysis/zajacn/p2220/o31444_G4/G4_p2220_o31444_subsampledv2_dedup/featurecounts.table.PRE.rds", 
                  "Aviti" = "/srv/GT/analysis/zajacn/p2220/o31444_Aviti/Aviti_p2220_o31444_subsampled_dedup/featurecounts.table.PRE.rds")

fcpost_dirs = list("Novaseq6000" = "/srv/GT/analysis/zajacn/p2220/o31444/o31444_NovaSeq_NOV1703_subsampled_dedup/featurecounts.table.POST.rds", 
                  "NovaseqX" = "/srv/GT/analysis/zajacn/p2220/o31444_NovaseqX_100bp/dedup/featurecounts.table.POST.rds", 
                  "G4" = "/srv/GT/analysis/zajacn/p2220/o31444_G4/G4_p2220_o31444_subsampledv2_dedup/featurecounts.table.POST.rds", 
                  "Aviti" = "/srv/GT/analysis/zajacn/p2220/o31444_Aviti/Aviti_p2220_o31444_subsampled_dedup/featurecounts.table.POST.rds")

for (x in names(fcpre_dirs)){
  ifelse(!dir.exists(file.path(dirname(fcpre_dirs[[x]]), "geo_files_FC")), dir.create(file.path(dirname(fcpre_dirs[[x]]), "geo_files_FC")), FALSE)
  fcpre = readRDS(fcpre_dirs[[x]])
  for (i in colnames(fcpre$counts)){
    df = ezFrame(fcpre$counts[,i, drop = FALSE])
    write.table(df, file = paste0(dirname(fcpre_dirs[[x]]), "/geo_files_FC/",i, ".", x,".pre_deduplication.txt"), col.names = TRUE, row.names = TRUE, sep = "\t", quote = FALSE)
  }
  fcpost = readRDS(fcpost_dirs[[x]])
  for (i in colnames(fcpost$counts)){
    df = ezFrame(fcpost$counts[,i, drop = FALSE])
    write.table(df, file = paste0(dirname(fcpost_dirs[[x]]), "/geo_files_FC/",i, ".", x,".post_deduplication.txt"), col.names = TRUE, row.names = TRUE, sep = "\t", quote = FALSE)
  }
}


