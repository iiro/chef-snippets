# Quick command reference for Chef

** This includes a short quick-reference for the opitionated-useful Chef commands.



## ChefDK's "chef"

| Command | Description |
| --- | --- |
| chef verify | Verify your ChefDK setup |
| chef generate generator generator_cookbook_name | Creates a generator (template) cookbook |
| chef generate cookbook cookbook_name | Generates a cookbook using the generator cookbook |
| chef exec bundle install | Runs the "bundle install" using ChefDK's Ruby |
| chef gem list | Shows all RubyGems installed for you (located in your ~/.chefdk) |
| chef gem install -V gem-name | Installs a single RubyGem for you |
| chef exec bundle exec guard | use the Guard for continous automated iterations between saves |



## Test-Kitchen
| export KITCHEN_YAML=".kitchen.cloud.yml" | activates another Kitchen YAML for your current shell session |
| kitchen list | list all your instances with their statuses |
| kitchen conv(erge) (-c N) (suitename) | run a converge for your instance(s); if instance is not provisioned - do it first - increase concurrency with -c switch; specify part-name of suite if only some suites wanted |
| kitchen dest(roy) | destroys the instance(s) |
| kitchen verify | runs cookbook tests against your instance |
| kitchen test | runs through the whole lifecycle: destroy, converge, setup, verify and destroy; favourite on CI tools |
| kitchen diagnose | debug what's wrong in your Kitchen setup |
| kitchen login | logins to instance; use (part of) suite's name if multiple suites exists |
| kitchen exec | runs a command in instance |




## Berkshelf
| berks update | Updates the Berksfile lock file (Berksfile.lock); use the install instead of update if the lockfile does not yet exist |
| berks upload (cookbook_name) | Uploads all cookbook with dependencies to Chef server. A single cookbook can be specified. Does not re-upload if cookbook is already found. |
| berks apply (-f envfile.json) environment_name | Updated cookbook locks from Berksfile.lock to Chef server (or - if -f switch used - a local environment file) |
| berks outdated | Shows all outdated Chef cookbooks which "berks update" would update |



## Others
| chef-apply your_recipe.rb | Runs your recipe against your local node; useful for simple local recipe testing |
| rubocop * | (on cookbook top folder) runs RuboCop (static code analyzer) "cops" against your code |
| foodcritic * | (on cookbook top folder) runs Foodcritic against your code |
| knife rehash | (re)creates your Chef plugin cache file ~/.chef/plugin_manifest.json (do this after every plugin installation!) |
| irb | Ruby interactive shell - can be handy for testing |

