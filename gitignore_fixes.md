# Fix .gitignore file is ignored by git and it does not work

### The following, will untrack every file that is in your .gitignore

```
git rm -r --cached .
git add .
git commit -m "Untracked files issue resolved to fix .gitignore"
```

### To stop tracking a single file file but not delete it from your filesystem use the following

```
git rm --cached <file>
```

### file removed from .gitignore filters does not appear to be tracked

When you remove something from .gitignore file and the file does not appear to be tracked, you can add it manually as follows:

```
git add -f <file>
git commit -m "Re-Adding ignored file by force"
```
