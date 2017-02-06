# BOC Support Site

## Dependencies installation

You need to install Bundler first:

```
gem install bundler
```

Then you can install all the gems required by Support Site using the following command:

```
bundle install --path .bundle
```

## Database schema objects creation

Create the database structure, by running the following command under the application root directory:

```
bundle exec rake db:schema:load
```
