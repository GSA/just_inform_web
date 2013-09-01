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

## License
[MIT License]
  
  [Just Inform Web]: https://github.com/GSA-OCSIT/just_inform_web
  [Sinatra]: http://www.sinatrarb.com/
  [Just Inform]: https://github.com/GSA-OCSIT/just_inform
  [RegInfo.gov]: http://www.reginfo.gov
  [MIT License]: https://github.com/GSA-OCSIT/just_inform_web/blob/master/LICENSE.md
  [README]: https://github.com/GSA-OCSIT/just_inform_web/blob/master/README.md