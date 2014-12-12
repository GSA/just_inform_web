# What Is Just Inform

[Just Inform Web] is a simple web app (built with [Sinatra]) that uses the [Just Inform] gem to parse data from [RegInfo.gov] and generate a list of the top 25 government forms based on burden hours, cost, and number of responses.

## Basic Usage

    # clone the repo
    git clone https://github.com/GSA-OCSIT/just_inform_web

    # Load IRB
    irb
    
    # Bundle the gems
    bundle

    # Load the web app
    bundle exec shotgun
    
    # Visit http://localhost:9393
    open http://localhost:9393

## Todo

* Add tests with 100% coverage
* Add detail view for each form that reveals all known info about that form.

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
