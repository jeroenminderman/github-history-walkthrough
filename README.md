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

## Finding sensitive data file, removing locally, and pushing

We can see the commit history for an online repository by going to "commits" at the top of the file list under the Code tab:

<img align="center" src="images/commit_history.jpg" width=75%>
  
We can look at the state of the repository at previous commits by clicking on the <> buttons, "Browse the repository at this point in the history:  

<img align="center" src="images/browse_previous_commit.jpg" width=75%>
  
Going down to commit #187804a, we can see that at that point the repo had a file `data/secure/personal_data.csv`:  

<img align="center" src="images/file_in_secure_folder.jpg" width=75%>  
  
From this point onwards, this file was removed locally and the changes pushed to the remote repository:

```{console}
rm data/secure/personal_data.csv
git add data/secure/personal_data.csv
git commit -m "Oops I added a file that shouldn't be included, I have now removed it locally"
git push
```

This resulted in commit [#7a2b4cd](https://github.com/Vanuatu-National-Statistics-Office/vnso-github-training/commit/7a2b4cd54263e20dd8ba9a671de840424576352f); where the file in question no longer exists.  
However, it is important to stress that as per the above, all that is needed to retrieve the deleted file is to go to the history, browse the commit before the file was deleted, and viewing or downloading its source - in a public repository anyone could do this.
Indeed, in your local repository you can "checkout" any of the previous commits, which allows you to browse previous versions of the working directory, using the following CLI commands:

```{console}
git checkout 18780a4
ls data/secure
```
This should show the file as being present (at this point in the history). To switch the local repository to the most current state:

```{console}
git switch -
```
  

__Would we like to add another similar examples of including keys/passwords in files?__
  


## .gitignore to avoid commiting specific files or folders

The `.gitignore` file in the root of a git repository is essentially a list of rules of specific files, file types, directories or file patterns that will always be excluded from any commits.  
Any references to files or directory names in this list will not be included in any commits _from the point they are added to the list_.
Format of this file is really quite straightforward but some further details and examples can be found [here](https://www.atlassian.com/git/tutorials/saving-changes/gitignore), for example.

Note that up to commit XXX, any files added to the `data/secure/` folder can easily be added to any commits, and therefore be accidentally pushed to the remote repository.  
To address this, we can add the whole of the the `data/secure/` folder to the `.gitignore` file, by adding the line

```
data/secure/
```

to the `.gitignore` file, and committing and pushing that change. Note the forward slash at the end of the line above - this is crucial to ensure the _entire contents_ of this folder is ignored, rather than just a single file.

With this new change to the `.gitignore`, we can add any files we like to this folder in our _local_ repository, but these changes will not be added to any commits, avoiding accidental commits of these.  
To illustrate, we can add a new sensitive file:

```
tu
```

## Rewriting repo history to permanently remove specific files