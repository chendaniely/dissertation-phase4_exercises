library(fs)
library(here)
library(glue)
library(purrr)
library(rsconnect)

child_docs <- fs::dir_ls(path = ".",
                         type = "file",
                         regexp = "\\d{3}.*\\.Rmd" # begins with 3 digits and ends with .Rmd
)

stopifnot(length(child_docs) == 18)

learnr_dirs <- fs::dir_ls(path = ".",
                          type = "directory",
                          regexp = "\\d{3}-"
                          )

stopifnot(length(learnr_dirs) == 5)

rmarkdown::find_external_resources("010-blank_noGradethis/010-ds4biomed-exercises.Rmd")
rmarkdown::find_external_resources("040-faded_yesGradethis/040-ds4biomed-exercises.Rmd")


#deploy_dir <- learnr_dirs[[1]]
for (deploy_dir in learnr_dirs) {
  print(deploy_dir)
  #browser()

  cp_to_pth <- here::here(glue::glue("{deploy_dir}/{child_docs}"))
  purrr::walk2(child_docs, cp_to_pth, fs::file_copy, overwrite = TRUE)

  #purrr::walk(cp_to_pth, fs::file_delete)
}


# run document command
# rmarkdown::run('C:/Users/Danie/git/hub/dissertation/submodules/dissertation-phase4_exercises/040-faded_yesGradethis/040-ds4biomed-exercises.Rmd', shiny_args = list(launch.browser = FALSE), auto_reload = FALSE, dir = 'C:/Users/Danie/git/hub/dissertation/submodules/dissertation-phase4_exercises/040-faded_yesGradethis',  render_args = list(encoding = 'UTF-8'));

# deploy command
# rmarkdown::shiny_prerendered_clean("040-faded_yesGradethis/040-ds4biomed-exercises.Rmd")
# rsconnect::deployApp(appDir = "C:/Users/Danie/git/hub/dissertation/submodules/dissertation-phase4_exercises/040-faded_yesGradethis",      appFileManifest = "C:/Users/Danie/AppData/Local/Temp/5b1c-c0b1-189c-1378",      appPrimaryDoc = "040-ds4biomed-exercises.Rmd", appSourceDoc = "C:/Users/Danie/git/hub/dissertation/submodules/dissertation-phase4_exercises/040-faded_yesGradethis/040-ds4biomed-exercises.Rmd",      account = "chendaniely", server = "shinyapps.io", appName = "040-ds4biomed-exercises",      appTitle = "040-ds4biomed-exercises", launch.browser = function(url) {         message("Deployment completed: ", url)     }, lint = FALSE, metadata = list(asMultiple = FALSE, asStatic = FALSE,          ignoredFiles = "010-setup.Rmd|020-010-pre_workshop_exercise.Rmd|030-005-exercise_1_setup.Rmd|030-010-exercise_1_prompt.Rmd|030-020-exercise_1_blank.Rmd|030-030-exercise_1_faded.Rmd|030-040-exercise_1_gradethis.Rmd|040-010-exercise_2_setup.Rmd|040-020-exercise_2_prompt.Rmd|040-030-exercise_2_blank.Rmd|040-040-exercise_2_faded.Rmd|040-050-exercise_2_gradethis.Rmd|050-010-exercise_3_setup.Rmd|050-020-exercise_3_prompt.Rmd|050-030-exercise_3_blank.Rmd|050-040-exercise_3_faded.Rmd|050-050-exercise_3_gradethis.Rmd|060-010-exercise_summ_prompt.Rmd|data/cmv.xlsx|data/ebola.csv|data/medicaldata_tumorgrowth.xlsx|data/tumorsubset_solution.csv"),      logLevel = "verbose")

# remove child docs from folders
for (deploy_dir in learnr_dirs) {
  print(deploy_dir)
  #browser()

  cp_to_pth <- here::here(glue::glue("{deploy_dir}/{child_docs}"))
  purrr::walk(cp_to_pth, fs::file_delete)

  #purrr::walk(cp_to_pth, fs::file_delete)
}
