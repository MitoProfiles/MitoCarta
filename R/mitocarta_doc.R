#' MitoCarta3.0: An Inventory of Mammalian Mitochondrial Proteins and Pathways
#'
#' MitoCarta3.0 is an inventory of 1136 human and 1140 mouse genes encoding
#' proteins with strong support of mitochondrial localization, now with
#' sub-mitochondrial compartment and pathway annotations. To generate this
#' inventory, the team from MitoCarta performed mass spectrometry of mitochondria isolated from
#' fourteen tissues, assessed protein localization through large-scale GFP
#' tagging/microscopy, and integrated these results with six other genome-scale
#' datasets of mitochondrial localization, using a Bayesian approach. MitoCarta3.0,
#' released 2020, uses manual literature curation to revise the previous MitoCarta2.0
#' inventory (78 added and 100 removed genes), provide annotation of
#' sub-mitochondrial localization, and assign genes to a custom ontology of 149
#' mitochondrial pathways.
#'
#' The original data can be found here: [MitoCarta](https://www.broadinstitute.org/mitocarta/mitocarta30-inventory-mammalian-mitochondrial-proteins-and-pathways)
#' The original citation for these data: [Rath S, et al. 2021](https://pubmed.ncbi.nlm.nih.gov/33174596/)
#'
#' This RData package contains the MitoCarta data in list form, which includes
#' three dataframes of the human MitoCarta.
#'
#' A: Human MitoCarta3.0. Data for all 1136 human  genes with high confidence of mitochondrial
#' localization (based on integrated proteomics, computation, and microscopy)
#'
#' @format A data frame containing 1137 rows and 48 columns.
#' \describe{
#'  \item{HumanGeneId}{(numeric) - NCBI Entrez Gene ID for human ortholog of mouse gene
#'  (based on reciprocal BLASTP hit, expect<1e-3)}
#'  \item{MouseOrthologGeneID}{(numeric) - NCBI Entrez Gene ID for mouse gene}
#'  \item{Symbol}{(string) - Official Entrez gene symbol from NCBI as of 08/31/2020}
#'  \item{Synonyms}{(string) - NCBI Entrez gene synonyms (UniProt added at end)
#'  from NCBI as of 08/31/2020}
#'  \item{Description}{(string) - NCBI Entrez gene description from NCBI as of 08/31/2020}
#'  \item{MitoCarta3.0_List}{(string) - MitoCarta3.0, mito-interacting, otherwise 0.
#'  Note mito-interacting is a tag indicating  genes not in MitoCarta3.0 and not residing
#'  within the double-membraned organelle, but with evidence of association with the
#'  mitochondrion or proteins embedded within the mitochondrial outer membrane
#'  (eg ER Mitochondial Associated Membranes, or cytosolic proteins binding to the signalling
#'  molecule MAVS), although this list is not exhaustive.}
#'  \item{MitoCarta3.0_Evidence}{(string) - Type of experimental support}
#'  \item{MitoCarta3.0_SubMitoLocalization}{(string) - Compartment within mitochondrion: matrix,
#'  MIM (mitochondrial inner membrane), IMS (intermembrane space), MOM (mitochondrial outer membrane),
#'  membrane, unknown.  Annotations are best guess based on literature, APEX experimental data to
#'  matrix, IMS, or MOM, presence of transmembrane helices (via TMHMM program).}
#'  \item{MitoCarta3.0_MitoPathways}{(string) - List of manually curated biological pathways.}
#'  \item{TrainingDataset}{(string) - For MitoCarta2.0: Tmito, Tnot_mito, or T_possible_mito
#'  (indicating evidence based on NCBI GO mitochondrial annotation or MitoP2 database, but not in
#'  Tmito); Deprecated indicates NCBI Entrez Gene was present in 2015 but deprecated by 2020;
#'  NA indicates newly added to NCBI Entrez Gene, thus present in 2020 but not in 2015.}
#'  \item{MitoCarta2.0_Score}{(numeric) - Naïve Bayes score (sum of log-likelihood ratios for each
#'  of 7 above features)}
#'  \item{MitoCarta2.0_FDR}{(numeric) - Estimated corrected false discovery rate for all
#'  predictions >= given score}
#'  \item{MitoCarta2.0_List}{(numeric) - 1 if gene is on final MitoCarta2.0 list}
#'  \item{MitoCarta2.0_Evidence}{(string) - Type of experimental support}
#'  \item{EnsemblGeneID_mapping_version_20200130}{(string) - Ensembl Gene Identifier (based on
#'  Ensembl mapper)}
#'  \item{UniProt}{(string) - UniProt Protein Identifier (based on UniProt mapper)}
#'  \item{ProteinLength}{(numeric) - Length of longest RefSeq protein isoform}
#'  \item{TargetP_Score}{(numeric) - TargetP confidence score (1-5, 1 is most confident) of
#'  mitochondrial targeting signal. Score 0 indicates no mitochondrial prediction}
#'  \item{MitoDomain_Score}{(string) - MitoDomain indicates exclusively mito domain; SharedDomain
#'  indicates shared mito & non-mito domain; NonMitoDomain indicates exclusively non-mito domain;
#'  NA indicates unknown}
#'  \item{CoexpressionGnfN50_Score}{(numeric) - N50 score for coexpression across mouse GNFv3 tissue
#'  atlas (N50 = number of 50 nearest neighbors that are in Tmito)}
#'  \item{PGC_Induction_Score}{(numeirc) - Foldchange in transcript induction following overexpression
#'  of PGC1a, known to induce mitochondrial biogenesis}
#'  \item{YeastMitoHomolog_Score}{(string) - OrthologMitoHighConf (HomologMitoHighConf) if yeast
#'  ortholog (homolog) is annotated mitochondrial in SGD with high confidence; OrthologMitoLowConf
#'  (HomologMitoLowConf) if yeast ortholog (homolog) is annotated mitochondrial in SGD with low
#'  confidence (dual localized or only based on high throughput data), NoMitoHomolog indicates no
#'  yeast homolog or homolog is not annotated mitochondrial in SGD}
#'  \item{RickettsiaHomolog_Score}{(string) - Ortholog if 1:1 ortholog between mouse and Rickettsia
#'  prowazekii; Homolog if homology between mouse and Rickettsia prowazekii, otherwise NoHomolog}
#'  \item{MSMS_Score}{(string) - Category indicating MS/MS abundance (coverage) and enrichment in
#'  subtractive proteomics (either pure-enriched, crude-enriched, or ambiguous)}
#'  \item{hg19_Chromosome}{(string) - Chromosome (mm10 assembly)}
#'  \item{hg19_Start}{(numeric) - Start position (mm10)}
#'  \item{hg19_Stop}{(numeric) - Stop position (mm10)}
#'  \item{MSMS_NUM_TISSUES}{(numeirc) - Number 0-14 tissues where gene products were found by MS/MS}
#'  \item{MSMS_NUM_PEPTIDES_UNIQUE}{(numeric) - Number of unique peptides, based on pooling spectra
#'  from 14 tissues}
#'  \item{MSMS_NUM_SPECTRA}{(numeric) - Number of spectra corresponding to this gene, based on pooling
#'  spectra from 14 tissues}
#'  \item{MSMS_TOTAL_INTENSITY}{(numeric) - total peak intensity, based on pooling spectra from 14
#'  tissues}
#'  \item{MSMS_PERCENT_COVERAGE}{(numeric) - Coverage (percent of amino acids covered by MS/MS
#'  spectra), based on pooling spectra from 14 tissues}
#'  \item{Tissues}{(string) - List of tissues with evidence of protein, based on 14 tissues}
#'  \item{cerebrum_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{cerebellum_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{brainstem_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{spinalcord_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{kidney_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in this
#'  tissue (log base 10)}
#'  \item{liver_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in this
#'  tissue (log base 10)}
#'  \item{heart_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in this
#'  tissue (log base 10)}
#'  \item{skeletalmuscle_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found
#'  in this tissue (log base 10)}
#'  \item{adipose_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{smallintestine_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found
#'  in this tissue (log base 10)}
#'  \item{largeintestine_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found
#'  in this tissue (log base 10)}
#'  \item{stomach_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{placenta_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{testis_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{HPA_Main_Location_2020 (Reliability)}{(string) - Main location in the human ortholog in
#'  Protein Atlas based on antibody-based high-resolution microscopy in multiple cell lines, along
#'  with annotation of reliability, as of 2020-09-16}
#'  }
#'
#' @details Each row corresponds to a specific gene that can be found in all the human mitochondrial genome.
#'
#'
#' B: Human All Genes: Maestro rankings (from MitoCarta2.0) of mitochondrial localization for all 19,247 Entrez genes with RefSeq proteins, including:
#' 1) MitoCarta3.0 assignment, sub-mitochondrial localization, and biological pathways
#' 2) Training sets (Tmito, Tpossible_mito, and Tnot_mito) and scores for MitoCarta2.0
#' 3) Proteomics data for genes detected in fourteen tissues
#' 4) Auxilliary data, including values for each of seven dataset integrated by Maestro, chromosomal locations, etc
#'
#' @format A data frame containing 19248 rows and 48 columns.
#' \describe{
#'  \item{HumanGeneId}{(numeric) - NCBI Entrez Gene ID for human ortholog of mouse gene
#'  (based on reciprocal BLASTP hit, expect<1e-3)}
#'  \item{MouseOrthologGeneID}{(numeric) - NCBI Entrez Gene ID for mouse gene}
#'  \item{Symbol}{(string) - Official Entrez gene symbol from NCBI as of 08/31/2020}
#'  \item{Synonyms}{(string) - NCBI Entrez gene synonyms (UniProt added at end)
#'  from NCBI as of 08/31/2020}
#'  \item{Description}{(string) - NCBI Entrez gene description from NCBI as of 08/31/2020}
#'  \item{MitoCarta3.0_List}{(string) - MitoCarta3.0, mito-interacting, otherwise 0.
#'  Note mito-interacting is a tag indicating  genes not in MitoCarta3.0 and not residing
#'  within the double-membraned organelle, but with evidence of association with the
#'  mitochondrion or proteins embedded within the mitochondrial outer membrane
#'  (eg ER Mitochondial Associated Membranes, or cytosolic proteins binding to the signalling
#'  molecule MAVS), although this list is not exhaustive.}
#'  \item{MitoCarta3.0_Evidence}{(string) - Type of experimental support}
#'  \item{MitoCarta3.0_SubMitoLocalization}{(string) - Compartment within mitochondrion: matrix,
#'  MIM (mitochondrial inner membrane), IMS (intermembrane space), MOM (mitochondrial outer membrane),
#'  membrane, unknown.  Annotations are best guess based on literature, APEX experimental data to
#'  matrix, IMS, or MOM, presence of transmembrane helices (via TMHMM program).}
#'  \item{MitoCarta3.0_MitoPathways}{(string) - List of manually curated biological pathways.}
#'  \item{TrainingDataset}{(string) - For MitoCarta2.0: Tmito, Tnot_mito, or T_possible_mito
#'  (indicating evidence based on NCBI GO mitochondrial annotation or MitoP2 database, but not in
#'  Tmito); Deprecated indicates NCBI Entrez Gene was present in 2015 but deprecated by 2020;
#'  NA indicates newly added to NCBI Entrez Gene, thus present in 2020 but not in 2015.}
#'  \item{MitoCarta2.0_Score}{(numeric) - Naïve Bayes score (sum of log-likelihood ratios for each
#'  of 7 above features)}
#'  \item{MitoCarta2.0_FDR}{(numeric) - Estimated corrected false discovery rate for all
#'  predictions >= given score}
#'  \item{MitoCarta2.0_List}{(numeric) - 1 if gene is on final MitoCarta2.0 list}
#'  \item{MitoCarta2.0_Evidence}{(string) - Type of experimental support}
#'  \item{EnsemblGeneID_mapping_version_20200130}{(string) - Ensembl Gene Identifier (based on
#'  Ensembl mapper)}
#'  \item{UniProt}{(string) - UniProt Protein Identifier (based on UniProt mapper)}
#'  \item{ProteinLength}{(numeric) - Length of longest RefSeq protein isoform}
#'  \item{TargetP_Score}{(numeric) - TargetP confidence score (1-5, 1 is most confident) of
#'  mitochondrial targeting signal. Score 0 indicates no mitochondrial prediction}
#'  \item{MitoDomain_Score}{(string) - MitoDomain indicates exclusively mito domain; SharedDomain
#'  indicates shared mito & non-mito domain; NonMitoDomain indicates exclusively non-mito domain;
#'  NA indicates unknown}
#'  \item{CoexpressionGnfN50_Score}{(numeric) - N50 score for coexpression across mouse GNFv3 tissue
#'  atlas (N50 = number of 50 nearest neighbors that are in Tmito)}
#'  \item{PGC_Induction_Score}{(numeirc) - Foldchange in transcript induction following overexpression
#'  of PGC1a, known to induce mitochondrial biogenesis}
#'  \item{YeastMitoHomolog_Score}{(string) - OrthologMitoHighConf (HomologMitoHighConf) if yeast
#'  ortholog (homolog) is annotated mitochondrial in SGD with high confidence; OrthologMitoLowConf
#'  (HomologMitoLowConf) if yeast ortholog (homolog) is annotated mitochondrial in SGD with low
#'  confidence (dual localized or only based on high throughput data), NoMitoHomolog indicates no
#'  yeast homolog or homolog is not annotated mitochondrial in SGD}
#'  \item{RickettsiaHomolog_Score}{(string) - Ortholog if 1:1 ortholog between mouse and Rickettsia
#'  prowazekii; Homolog if homology between mouse and Rickettsia prowazekii, otherwise NoHomolog}
#'  \item{MSMS_Score}{(string) - Category indicating MS/MS abundance (coverage) and enrichment in
#'  subtractive proteomics (either pure-enriched, crude-enriched, or ambiguous)}
#'  \item{hg19_Chromosome}{(string) - Chromosome (mm10 assembly)}
#'  \item{hg19_Start}{(numeric) - Start position (mm10)}
#'  \item{hg19_Stop}{(numeric) - Stop position (mm10)}
#'  \item{MSMS_NUM_TISSUES}{(numeirc) - Number 0-14 tissues where gene products were found by MS/MS}
#'  \item{MSMS_NUM_PEPTIDES_UNIQUE}{(numeric) - Number of unique peptides, based on pooling spectra
#'  from 14 tissues}
#'  \item{MSMS_NUM_SPECTRA}{(numeric) - Number of spectra corresponding to this gene, based on pooling
#'  spectra from 14 tissues}
#'  \item{MSMS_TOTAL_INTENSITY}{(numeric) - total peak intensity, based on pooling spectra from 14
#'  tissues}
#'  \item{MSMS_PERCENT_COVERAGE}{(numeric) - Coverage (percent of amino acids covered by MS/MS
#'  spectra), based on pooling spectra from 14 tissues}
#'  \item{Tissues}{(string) - List of tissues with evidence of protein, based on 14 tissues}
#'  \item{cerebrum_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{cerebellum_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{brainstem_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{spinalcord_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{kidney_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in this
#'  tissue (log base 10)}
#'  \item{liver_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in this
#'  tissue (log base 10)}
#'  \item{heart_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in this
#'  tissue (log base 10)}
#'  \item{skeletalmuscle_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found
#'  in this tissue (log base 10)}
#'  \item{adipose_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{smallintestine_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found
#'  in this tissue (log base 10)}
#'  \item{largeintestine_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found
#'  in this tissue (log base 10)}
#'  \item{stomach_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{placenta_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{testis_total_peak_intensity_log10}{(numeric) - Total peak intensity of spectra found in
#'  this tissue (log base 10)}
#'  \item{HPA_Main_Location_2020 (Reliability)}{(string) - Main location in the human ortholog in
#'  Protein Atlas based on antibody-based high-resolution microscopy in multiple cell lines, along
#'  with annotation of reliability, as of 2020-09-16}
#'  }
#'
#' @details Each row corresponds to a specific gene that can be found in all the human genome.
#'
#'
#' C: MitoPathways.	Hierarchy of biological pathways and list of MitoCarta3.0 genes assigned
#' to each pathway
#'
#' @format A data frame containing 150 rows and 3 columns.
#' \describe{
#'  \item{MitoPathway}{(string) - Biological pathway present in the mitochondria}
#'  \item{MitoPathways Hierarchy}{(string) - Different steps made to achieve the wanted pathway}
#'  \item{Genes}{(string) - Genes involved in a specific mitochondrial pathway}
#'
#' @details Each row corresponds to a pathway that is present in the mitochondria.
#'
"mitocarta_data"
