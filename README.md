# RBenv Docker image

The goal for this Docker image is to provide a ready to go Ruby environment based on [RBenv][RBenv] that you could taylor to your needs,
be it a RoR, Sinatra or any other Ruby application type.

The base image is [Ubuntu Trusty Tahr][UbuntuImage] with Ruby 2.0.0-p353 compiled and installed from sources.

As a result, you have a fully working Docker for RBenv and dependencies. The following gems are available by default:

- bigdecimal (1.2.0)
- bundler (1.6.2)
- coderay (1.1.0)
- io-console (0.4.2)
- json (1.7.7)
- method_source (0.8.2)
- minitest (4.3.2)
- pry (0.9.12.6)
- psych (2.0.0)
- rake (0.9.6)
- rdoc (4.0.0)
- slop (3.5.0)
- test-unit (2.0.0.0)

Of course as it includes Bundler, any Gemfile based Ruby application will be able to install it's Ruby dependencies super easily.
You just need to install OS dependent resources if any.


## Creating your own images based on this one

A trusted build is available publicly from [index.docker.io](https://index.docker.io)
```
docker pull swcc/rbenv
```

If you want to inherit from this Docker for your own, whichever user you will use for the service you want to run, he should inherit the correct
RBenv configuration. If any issue, you can still source this file: ```/etc/profile.d/rbenv.sh```.

It will setup the environment correctly for your user.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[RBenv]: https://github.com/sstephenson/rbenv  "Groom your app’s Ruby environment"
[UbuntuImage]: https://index.docker.io/_/ubuntu/ "Official Ubuntu Docker images"
