# How to run

1. run bundle:
    ```bash
    bundle install
    ```

2. run Message queue program:
    - Open a new terminal then run:
        ```bash
        redis-server
        ```
    - Open a new terminal then run:
        ```bash
        bundle exec sidekiq
        ```

3. run daemon:
    ```bash
    god -c path_to_workspace/daemons/pixels_generator.god
    ```

4. Check the daemon log `pixels_generator.log` in `path_to_workspace/log/`

5. check the activejob log `development.log` in `path_to_workspace/log/`
