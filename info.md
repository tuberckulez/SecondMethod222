# Основные команды гит:

**git init** – инициализация локального репозитория

**git status** – получить информацию от git о его текущем состоянии

**git add**– добавить файл или файлы к следующему коммиту

Изменения 

>Тестируем pull реквест 
# Introduction to Version control
![GIT](images/0.JPEG)

## What is version control and why is it needed

__Version control (source code control)__ is a practice that allows you to track and manage changes to the source code.

__Version control is necessary to:__

1. store different versions of the project;

2. go back to different versions of the project.

__The control system__ is an implemented possibility of replacing information using saved versions.

![GIT](images/1.JPG)

## Git is a version control program

__Git__ is the most popular version control system, but not the only one. The algorithm of operation of such systems is similar.

The Git program takes control of the project versions and allows you to switch between them. Please note: Git ~~does not store the entire files~~, but the differences between them. This saves memory. The author of the program is __Linus Torvalds__, the creator of the Linux OS.

# Installing and configuring a version control system

There are two ways to work with Git:

1. Via the command line (terminal).

2. Via the IDE.

> File names must be specified with extensions and do not "lose" spaces. 

> Remember that Git manages saved files, not those that are in the process of editing.

# Going deeper into version control

## Differentiation of the concepts of Git and GitHub

![GIT](images/3.JPG)

* Master working with remote repositories that are located not on a local, but on a remote machine, for example, on a server.
* git is one of the version control systems
* Method of organizing and maintaining versioning
* The most popular version control system

![GIT](images/4.PNG)

* Microsoft service for organizing remote repositories
* The most popular Git service
* Many useful functions
* Huge archive of various code

## Basic commands git

![GIT](images/2.JPG)

* **git init** – initialization of the local repository

* **git status** – get information from git about its current status

* **git add "path"** – add a file or files to the next commit

* **git add .** - adds all files in the project to tracking

* **git commit -am "message"** - git add + git commit
>Works only after the 1st manual addition to tracking

* **git commit -m "message"** – creating a commit.

* **git log** – displays the history of all commits with their hash codes

* **git checkout** – transition from one commit to another

* **git checkout master** – return to the current state and continue working
>Git checkout main

* **git diff** – see the difference between the current file and the committed file

* **git clone** "repository url" – cloning an external repository to a local PC

* **git pull** – getting changes and merging with the local version

* **git push** – sends the local version of the repository to the external

## All necessary links:

1. [Git](https://git-scm.com)

2. [Wikipedia](https://ru.wikipedia.org/wiki/Git)

3. [Habr](https://habr.com/ru/articles/472600/)