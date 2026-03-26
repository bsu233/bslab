
library(frustratometeR)

PdbsDir <- "/home/teliu/work/frustration/2p4x/2p42/pdbs"
ResultsDir <- "/home/teliu/work/frustration/2p4x/2p42/results"

OrderList <- paste0("pdb", 1:100, ".pdb")

Dynamic_conf <- dynamic_frustration(PdbsDir = PdbsDir , OrderList = OrderList , ResultsDir = ResultsDir , Mode = "configurational")

saveRDS(Dynamic_conf, "/home/teliu/work/frustration/2p4x/2p42/results/dynamic_object.RDS")


#Dynamic_conf <- readRDS("personalfolder/dynamic_object.RDS")

gif_5adens_proportions(Dynamic = Dynamic_conf)

#gif_contact_map(Dynamic = Dynamic_conf)

frustra_movie(Dynamic = Dynamic_conf)
