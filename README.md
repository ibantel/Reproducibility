# Reproducibility repository
This is a sample repository to use GitHub for reproducibility

Procedure to use RStudio with GitHub for Version control and reproducibility

# Setup GitHub/RStudio #
## 1 RStudio ##
- "Global Options" > Git/SVN
  - Check "Enable version control interfrace for RStudio projects"
  - specify "Git executable" path 
  - Generate SSH RSA key ("Create RSA key") and copy public SSH RSA key ("View public key")
  
## 2 GitHub ##
- sign in and go to "Settings" > "SSH and GPG keys"
- Add a "New SSH key" (Title should refer to your RStudio, paste key from RStudio)

# Setup Project #
- Create new repository on *GitHub*
- Copy repository URL
- In *Rstudio*, "File" > "New Project" > "Version Control" > "Git"
- Paste repository URL and set path (potentially also fill in "Project directory name" although this should be filled in from the repository) 
- Click "Create Project"
- In *RStudio*, "File" > "New File" > "R Script", work on your code and save as desired (e.g. as "Reproducibility.R"); you can also add subfolders and (data) files to the directory.
- In *RStudio*, you should see a tab "Git" in one of the panes; click "Commit" (i.e. upload to the GitHub repository)
- In the window "RSStudio: Review Changes", select all files and paths you wish to commit, include a commit message and click "Commit" (and close the windows afterwards)
