#Shell Aliases

This repo contains shell scripts that make life easier in CLI. As far as I know, the same code works in both bash and zsh. Just copy and paste the shell script contained in the `.bashrc` file into the `.bashrc` or `.zshrc` file located in your home folder and you should be good to go!

#Usage

##h
This alias makes it slightly easier to go to your home directory

##b [levels]

This alias goes up your directory by `[levels]` many levels. If no arguments are detected, it goes up your directory by 1 level. Here are some examples:

```
If: /you/are/this/many/layers/deep/in/your/file/system
>> b		-> /you/are/this/many/layers/deep/in/your/file
>> b 3		-> /you/are/this/many/layers/deep
>> b 5		-> /you
>> b		-> /
Congrats, you have escaped back to your root directory!
```

##f [substr]

This alias looks at the current list of subdirectories and matches their names to find `[substr]`, if the name matches, you will be redirected to that subdirectory. If there are multiple matches, you will go to the first subdirectory found with a matching name.

##nr [repo-name] [username]

This alias does all the following at the same time:

1. make new directory with `[repo-name]`
2. change directory to `[repo-name]`
3. creates `.gitignore` file
4. initializes git
5. adds `.gitignore` to git staging area
6. add git remote `origin` with information provided by `[username]`
7. commits and pushes first commit with `.gitignore` to `master`

I used this alias to create this repo.

Bonus: if you do not want to enter your username and password, just change the `curl` request where the argument after `-u` is formatted as `[username]:[password]`. Then, hardcode your username by replacing `$2` with `[username]` in the line where it adds a new git remote. (~~Probably~~ DEFINITELY not secure)

Example:

```
git remote add origin "git@github.com:[username]/$1.git"
curl -u '[username]:[password]' https://api.github.com/user/repos -d "$json"
```

##Some more git shortcuts

| alias | action |
|-----|-----|
| s | git status |
| c [message] | git commit with `message` |