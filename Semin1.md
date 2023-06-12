# Основные команды Git

**git init** – инициализация локального репозитория

![git init](gitinit.bmp)

**git status** – получить информацию от git о его текущем состоянии

![git status](gitstatus.bmp)

**git add “path”**– добавить файл или файлы к следующему коммиту

![git add “path”](git_add_“path”.bmp)

**git add .**- добавляет все файлы в проекте в отслеживание

![git add .](git_add_..bmp)

**git commit -am “message”** - git add + git commit (Работает только после 1-го ручного добавления в отслеживание)

![git commit -am “message”](git_commit_-am_“message”.bmp)

**git commit -m “message”** – создание коммита

![git commit -m “message”](git_commit_-m_“message”.bmp)

**git log** – вывод на экран истории всех коммитов с их хеш-кодами

![git log](gitlog.bmp)

**git checkout** – переход от одного коммита к другому

![git checkout](git_checkout.bmp)

**git checkout master** – вернуться к актуальному состоянию и продолжить работу (git checkout main)

![git checkout master](git_checkout_master.bmp)

**git diff** – увидеть разницу между текущим файлом и закоммиченным файлом

![git diff](git_diff.bmp)

## Работа с ветками

**git branch <название ветки>** – создать новую ветку

![git_branch_name](git_branch_name.bmp)

**git branch -d <название ветки>** – удалить ветку

![git branch -d](git_branch_-d.bmp)

**git branch** – посмотреть список веток в репозитории

![git branch](git_branch.bmp)

**git checkout <название ветки>** – переход к другой ветке

![git_checkout_branch_name](git_checkout_branch_name.bmp)

**git checkout -b <название ветки>** -> Создание и переход в новую ветку

![git_checkout_-b_name](git_checkout_-b_name.bmp)

**git log --graph** - визуализирует коммиты

![git_log_--graph](git_log_--graph.bmp)

## Работа с удаленными репозиториями

**Команды синхронизации удаленного и локального репозиториев**

![Lokal_Github](Lokal_Github.bmp)

**git clone <url-адрес репозитория>** – клонирование внешнего репозитория на  
локальный ПК

**git pull** – получение изменений и слияние с локальной версией

![git_pull](git_pull.bmp)

**git push** – отправляет локальную версию репозитория на внешний репозиторий

![git_push](git_push.bmp)

## Работа с GitHab.

1. Сохраняем чужой репозиторий кнопкой "fork"

![fork_of_repo](fork_of_repo.bmp)

2. Копирование в локальный репозиторий

![clon_of_repo](clon_of_repo.bmp)

3. Создание ветки

![create_branch](create_branch.bmp)

4. Переход в ветку и создание "README.md"

![readme_init](readme_init.bmp)

5. Отправка во внешний репо

![push_to_repo](readme_init.bmp)
