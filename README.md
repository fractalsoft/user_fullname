# UserFullname [![Gem Version](https://badge.fury.io/rb/user_fullname.png)](http://badge.fury.io/rb/user_fullname) [![Build Status](https://travis-ci.org/fractalsoft/user_fullname.png)](https://travis-ci.org/fractalsoft/user_fullname) [![Dependency Status](https://gemnasium.com/fractalsoft/user_fullname.png)](https://gemnasium.com/fractalsoft/user_fullname) [![Coverage Status](https://coveralls.io/repos/fractalsoft/user_fullname/badge.png?branch=master)](https://coveralls.io/r/fractalsoft/user_fullname?branch=master) [![Stories in Ready](https://badge.waffle.io/fractalsoft/user_fullname.png)](http://waffle.io/fractalsoft/user_fullname)
[![endorse](https://api.coderwall.com/torrocus/endorsecount.png)](https://coderwall.com/torrocus)

User fullname is a gem which support first name, last name and full name. You need only full name in Your database.

## Installation

Add this line to your application's Gemfile:

    gem 'user_fullname'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install user_fullname

## Usage

```ruby
class User
  include UserFullname
end

user.fullname = "John Smith"
user.firstname #=> "John"
user.lastname #=> "Smith"
user.fullname #=> "John Smith"
user.firstname = "Bob"
user.fullname #=> "Bob Smith"
user.lastname = "Marley"
user.fullname #=> "Bob Marley"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
