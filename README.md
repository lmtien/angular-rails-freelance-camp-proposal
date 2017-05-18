Live demo: [https://freelance-camp-proposal.herokuapp.com/proposals](https://freelance-camp-proposal.herokuapp.com/proposals)

## Setup steps

    bundle
    rails db:create
    rake db:migrate
    rake db:setup
    rails s -b $IP -p 8082

### PG::Error: ERROR: new encoding (UTF8) is incompatible

Below [steps resolved the problem](http://stackoverflow.com/questions/16736891/pgerror-error-new-encoding-utf8-is-incompatible):

1. First, we need to drop template1. Templates can’t be dropped, so we first modify it so t’s an ordinary database:

        UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';

2. Now we can drop it:

        DROP DATABASE template1;

3. Now its time to create database from template0, with a new default encoding:

        CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';

4. Now modify template1 so it’s actually a template:

        UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';

5. Now switch to template1 and VACUUM FREEZE the template:

        \c template1
        VACUUM FREEZE;

Problem should be resolved.