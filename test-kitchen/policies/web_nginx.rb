# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

# A name that describes what the system you're building with Chef does.
name 'web_nginx'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
# run_list "example_cookbook::default"
run_list(
  'apt::default',
  'nginx::default'
)

# Specify a custom source for a single cookbook:
# cookbook "example_cookbook", path: "."
# cookbook "example_common", path: "../example_common"
