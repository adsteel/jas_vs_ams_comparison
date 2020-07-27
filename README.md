# JSON API Serializer - AMS 0.10.10 Comparison

An attempt to compare [JSON API Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) (formerly [Fast JSON API](https://github.com/Netflix/fast_jsonapi)) against [Active Model Serializer](https://github.com/rails-api/active_model_serializers), apples to apples, in a Rails context.

## Results

Data visualization of benchmark speeds, in seconds, over 10 consecutive benchmark trials per serializer solution.

![image](https://user-images.githubusercontent.com/4186462/88438723-9bd70480-cdc6-11ea-92e9-3e3a4252c2ea.png)

## Result data

AMS test results:

- 5.134540404003928
- 5.561995001000469
- 6.68827473098645
- 6.929471960000228
- 6.914195046003442
- 6.87613258100464
- 6.922666821992607
- 6.898649249007576
- 6.9383243629999924
- 6.886459750996437

JSON API Serializer test results:

- 3.4942911730031483
- 3.5805928920017323
- 4.078054733006866
- 4.3636172719998285
- 4.588106184994103
- 4.713157361999038
- 4.463631228005397
- 4.352507838004385
- 4.478046999996877
- 4.759699816000648

## Running Locally

To ensure neither code "pollutes" the performance time of the other, each benchmark is run in an isolated, tagged commit.

1. Install gems

```bash
bundle install
```

2. Set up SQLite database

```bash
bundle exec rake db:setup
```

3. Run benchmark specs for JSON API Serializer

```
git checkout vjas
bundle exec rspec spec
```

4. Run benchmark spec for Active Model Serializer

```
git checkout vams
bundle exec rspec spec
```

## Contributing

Issues, improvements and expansions welcomed, just be nice, please.
