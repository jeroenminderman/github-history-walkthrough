# vnso-github-training
A repository to hold some introductory training support, tutorials and materials for Git/Github for VNSO

## Removing sensitive data from repositories

Once local changes or additions are "pushed" to a remote repository, they become part of the remote's history and are therefore not easily removed permanently.  
This can become an issue is we need to deal with data files that contain sensitive or personal data that have erroneously been committed and pushed to a repository.  
  
This repository provides a "toy" example of such a case with dummy sensitive data in `data/secure/`.  

We will use the history of this repository to demonstrate:
- Even if a file has been previously removed locally and changes pushed to a repo, the file can be retrieved online by browsing the remote's history
- A simple means to ensure files in certain local directories will not be accidentally uploaded to the repository (using `.gitignore`); as well as the limitations of doing that.
- One method to remove such files _permanently_ and rewrite the repository's history to ensure it cannot be retrieved in the remote.

