library(pdftools)

here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises")

pdf_combine(
  c(
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/010-010-blank-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/010-020-blank-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/010-030-blank-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/010-040-blank-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/010-050-blank-noAutograder.pdf")
  ),
  output = here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/010-all-blank-noAutograder.pdf"),
)

pdf_combine(
  c(
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/020-010-faded-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/020-020-faded-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/020-030-faded-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/020-040-faded-noAutograder.pdf"),
    here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/020-050-faded-noAutograder.pdf")
  ),
  output = here::here("../dissertation/submodules/dissertation-irb/irb-20-537-data_science_workshops/exercises/020-all-faded-noAutograder.pdf"),
)
