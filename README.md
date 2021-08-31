sudo nano /etc/postgresql/9.3/main/pg_hba.conf# Leobit Rails Test Sprint

In this project you will see close-to-real-life example of Scrum sprint. 
This should make you a minified introduction to common developer's workflow.

Of course, we skipped all Scrum meetings, but let's leave them as a future surprise for you :)


## Prerequisites

- **Install Unix-based OS (Linux, OSX)**

- **Install Ruby**

**Note.** Look to `.ruby_version` file.

- **Install Node**

It is used for handling `webpacker` front-end libraries, installed from `package.json`. 
Recommend you to get used to install Node using [NVM](https://github.com/nvm-sh/nvm). 
This is similar tool to Ruby `rvm`, that allows you to have 
different Node versions installed simultaneously and just select the needed one for the project.
Alternatively, Node can be downloaded & installed directly from [here](https://nodejs.org/en/download).

- **Install Yarn**

Front-end package manager. Ruby `bundler` analogue, but for Node.
Installation guide is [here](https://classic.yarnpkg.com/en/docs/install).

- **Install PostgreSQL**

It is used as database for this project. 
Can be downloaded [here](https://www.postgresql.org/download).

- **Install Bundler**

```
gem install bundler
```

- **Install required gems**

```
bundle # in the repository folder
```

**Important note.** If you have exceptions like
```
ERROR: Failed to build gem native extension.
```
feel free to search your issue in Google.

Theoretically, there could be a few system libraries needed to be installed in order to make it work, 
and periodically with Ruby/Rails version upgrades, such issues appear/disappear, that's fine. 

- **Install front-end packages**

```
yarn install
```

- **Setup environment variables**

Copy `.env.example` and name this copy `.env`. Fill it with your postgres credentials, but after all
this file is used to fill ALL environment variables you want to be used in the project

- **Setup the project database**

```
bundle exec rake db:setup
```

- **You can try to run initial test build to ensure everything is fine 
(yeah-yeah, no matter raw Ruby or Ruby on Rails - Tests are our friends!)**

```
bundle exec rspec
```

- **To run the server execute**

```
bundle exec rails s
```

**NB.** To enable hot-reloading for JS/CSS changes and feel yourself better with assets in general,
I'd recommend you to run 

```
./bin/webpack-dev-server
```

in the separate terminal tab. It runs local webpacker server which handles assets better.

- **Hooray! :confetti_ball: You've finished ramping-up the project.**


## How to work with tasks

1. Fork this repository;

2. Add your mentor to the forked repository as a `Developer`.

    ```
    Sidebar > Project information > Members > Invite
    ```

3. Open Trello board

4. Start making tasks by priorities. You need to pick the tickets with the highest priority first!

If cards have the same priority - pick the one that is closer to the top of column.

5. Push finished tasks to GitHub.

6. You're a rockstar! :horns:


## How to work with Trello

To filter cards by yourself - press **F** and ~~(pay respect)~~ select yourself in member list.
On the board have been created several columns, each with its own purpose.

### To Do

Tickets are prepared to be picked into work. 

You can start working on them. **REMEMBER.** The highest priority - the most applicable to be picked up.

If cards have the same priority - pick the one that is closer to the top of column.

### In Progress

You're currently working on this ticket.

If you started working on the ticket from **To Do** - move the card to this column.

### Code Review

There is merge request created for this ticket.

At this stage, you're checking if everything is fine with your branch under created merge request.

In real life, your teammates would look to your merge request.

### QA Testing

Ticket is merged to main branch and waiting to be tested.

At this stage you've just merged a branch into `master` and waiting for green test build on `master`.

In real life, your code would be deployed to QA-environment web-server 
(the same project, just running on external machine and supposed to be accessible only for testing purposes).

There QA guys check if everything works according to the ticket description and move the card further 
or back to **To Do** with bug reports.

### Done

Ticket is ready to be deployed to Production environment.

[Congratulations](https://uk.wikipedia.org/wiki/%D0%A1%D1%96%D0%B7%D1%96%D1%84), you can pick something else!

### Icebox

Ticket is not planned well, or it is not currently prioritized to be started.

If **To Do** is empty, you can pick the task from this column.

In real life, you should ask a project manager before picking something up from **Icebox**!


## Last words before you start

There are a few rules:

1. You make each task in its own git branch.

2. Git branch has to be named as `[trello-ticket-number]-[small-descriptive-name]` (square braces can be ignored).

3. For each task create a merge request(e.g. `123-task-name -> master`).

    This is needed to ensure that test build is still green. 
    After you see that tests are passing on GitLab CI, you can merge your branch into master.

4. Move your cards in Trello according to their status. We're simulating the real workflow :smile:

5. All commits has to include [GitHub emoji](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md). 
Initial commit will be an example. This is the most strict requirement! (**We're not joking**).
