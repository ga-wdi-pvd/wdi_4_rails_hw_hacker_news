# HaxorNews&trade;

*"Hack the planet!"*

[Hacker News](https://news.ycombinator.com/) is a social news web site that caters to programmers and entrepreneurs. Although it's quite popular, it doesn't look that hard to build... in fact, we could probably write our own in less than a week!

## Getting Started

Fork this repository as a starting point &ndash; it includes all the gems you'll need. The 'master' branch is on Rails 4. You will need to update to the current version of Rails. Here is a nice guide outlining the steps to upgrade an existing Rails project: [upgrading Rails](http://railsapps.github.io/updating-rails.html). The Rails 5 branch is up to date for Rails 5. Pay attention to the Gemfile's version requirements for other gems, not just the `rails` gem, and ensure `bundle update` has updated your gems for your desired version of Rails.

This project is divided into suggested implementation phases. As a step 0, you should create user stories to capture the desired functionality of the application. You should also plan your tables with a rough sketch of ERD diagrams. You can then take these sketches and stories to other people, technical and not, to discuss the project without writing a single line of code. This will save you time, and time is money!

Remember, we are explicitly building a "clone" of Hacker News. If you're not sure how something in your app should appear or behave, just refer to the real thing!

## Phase 1: Users

Users should be able to register for accounts, sign in, and sign out. Don't worry about any other account functionality, like forgotten password emails. 

### Devise

This project came with the Devise gem included, and `rails g devise:install` had been run under the Rails 4 version. If you have updated the Devise gem by running `bundle update`, you will want to re-run `rails g devise:install` in this repository to get the updated Devise configuration files. When confronted with a conflict with the updated version of Devise, pressing d will show a file diff, and y will accept the overwrite. Refer to the Devise github page and readme to learn more about differences in Devise versions, and what is going on in the configuraiton files. It will be helpful to have Devise documentation open when implementing user authentication with Devise.

## Phase 2: Articles

Signed-in users can submit articles. On the real Hacker News, articles can be a link to another web site, a chunk of text, or a poll. We'll remove some of that complexity and say that articles are just links. They have a title, which must be present, a URL, which must be valid, and a submission timestamp. The front page displays a list of all articles, with article titles linked to their URLs.

## Phase 3: Comments

Signed-in users can leave comments on articles. The real Hacker News supports threaded discussions where comments can be replies to other comments. Our cheap copy will only support top-level comments directly attached to articles, so we don't have to deal with weird self-referential associations. Comments have a body, which must be present, and a submission timestamp.

## Phase 4: Votes

Signed-in users can upvote or downvote both articles and comments. Each user can only cast one vote on a given article or comment, but they can take it back or change it at any time. For instance, I could upvote an article, then later change my upvote to a downvote, then later take back my downvote (so my vote is back to "neutral"). Both articles and comments should now be sorted by "score", which is the number of upvotes minus the number of downvotes.

## Phase 4.5: Testing?

You may not have time to write many tests or develop features using Test-Driven Development. However, we recommend adding at least some feature test coverage for the primary workflows of your app, and unit tests for public model methods. Practice with writing tests will come in handy for Project #2 and beyond. If you are skeptical of the value of writing tests and test-driven development, just have a look at the [Stack Overflow Jobs](http://stackoverflow.com/jobs?tl=tdd) page that lists TDD as a requirement for working with the company, just important as other major pieces of their technology stack.

### Rspec

Rspec is included in this project, meaning the `spec` directory takes place of the default `test` directory. We have already ran the `rails g devise:install` command, however if you are updating Rspec, you may want to run that command again. Any conflicts can be viewed with `d` during the update process, and pressing `y` will accept the new file. You should have the Rspec docs open while you write your tests to ensure you are writing the correct syntax for matchers.

## Phase 5: Ship It!

Your finished app must be deployed and functional at a Heroku URL that you provide in your pull request. This shouldn't take long, but leave some extra time for it in case you run into any strange issues.

## Specifications

* App has a database schema with appropriate columns and indexes
* App has working seed data to assist in manual testing
* Users can register for an account, sign in, and sign out
* Users can view a list of all articles and submit their own
* Users can view comments on articles and submit their own
* Users can upvote/downvote articles and comments, and change their vote
* Articles and comments are sorted by upvote/downvote score
* Models have appropriate validations and errors are shown to the user
* App has at least basic styles to provide an attractive and intuitive experience
* App generates HTML and CSS that validates with no errors
* Code is well-refactored and avoids duplication or repetition
* Code follows style conventions and has descriptive variable and method names
* App has at least some feature tests and unit tests using RSpec
* Repository has clean, logical, single-task commits with descriptive messages
* App is deployed and fully functional on Heroku

## Extra Challenges

* Having the front page display every single article on the site probably won't perform very well once we have thousands of articles. Use the Kaminari gem to implement paging of articles and comments.
* The real Hacker News doesn't display articles sorted by pure upvote/downvote score &ndash; it uses a "weighted" score that takes the time of the submission into account, so older articles gradually decay and move down the list. Implement this "decay factor" in your app.
* Javascript: use javascript to do DOM manipulation while upvoting and downvoting. Within current Rails projects, jQuery is included by default. By including the [jquery-rails gem](https://github.com/rails/jquery-rails), and including the correct directive in `application.js`, our app has jQuery loaded in. One Gotcha with newer versions of Rails is using jQuery's `document.ready()` with `turbolinks`. You will need to accomodate turbolinks' unique way of loading the DOM if you want to use `document.ready()` in your javascript to ensure the DOM is loaded before javascript is executed..
