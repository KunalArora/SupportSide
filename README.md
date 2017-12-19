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

## Initial configurations

BOC Support Site use two different kind of Databases.
1. Support Site's database to create Staff or Users storing the login information.
2. BOC database to interact with BOC devices and retrieve information.

To create both databases, follow the steps below:
  1. Create the Support Site's database structure, by running the following command under the application root directory:

```
bundle exec rake db:schema:load
```

To create the record in Support Site's database, run following command under the application root directory in specified order:
```
* rails console
* Staff.create(name: <NAME>, email: <EMAIL-ID>, password: <PASSWORD>, company_id: 1, admin: sadmin)
```
  2. To create BOC database for Support Site, a special gem called `ridgepole` is being used.Access the below link to get more information about ridgepole gem.  
https://github.com/winebarrel/ridgepole

To create BOC database Schema, run the following command:
```
ridgepole -c config/database.yml -E ENVIRON_boc -f db/SchemaFile --apply
```
ENVIRON value could be development or test.

To insert initial data in the created BOC database, run following command:
```
bundle exec bin/rails db:initial_seed
```

Run the BOC Support Site and check if you are able to login or not. The Login E-mail and password is same as the one used while creating Support Site's database step.  
After successful logging, insert the following uuid `{3488664F-19AD-2D35-B3E2-A65B1D244417}` into the search bar to check if the site has been successfully setup or not.
