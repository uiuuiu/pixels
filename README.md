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

# How it works

The program includes 3 services:
- Rails application
- Pixel generation worker
- Create Pixel worker

## Rails application
- Used for displaying Pixel data to view
- Get data from database or files

## Pixel generation worker
- Used for generating pixel population
- Monitored by gem `god` through `pixels_generator.god`
- Worker file: `./daemons/pixels_generator.rb`

## Create Pixel worker
- Used for processing (such as saving to the database or file ) the pixel data which was created in `Pixel generation worker`
- Monitored by `sidekiq` with `redis` is storage

## Processing

> First, the Pixels will be created from `pixels_generator.rb` (which will be monitored by `god` gem).
>
> Each Pixel must have at least 1 gene from parent, and Its set of gene must be uniqueness.
>
> We will have many growth periods (3 seconds interval), each period will pick 50% of total Pixel population for pairing.
>
> I used a hash data structure for storing a pixel gene, only a new pixel with not duplicate gene be stored to the storage.
>
> After a growth period, pixel babies will be send to ActiveJob for the next processing.
