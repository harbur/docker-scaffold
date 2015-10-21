# Scaffold docker image

This project is to be used as base for minimal container images with embedded configuration template mechanism.

The output of the project is just 11Mb as it is based on Alpine image.

# Build Image

Use [captain](https://github.com/harbur/captain):

```
$ captain build
```

or docker

```
$ docker build -t `whoami`/docker-scaffold .
```

# Use Image

```
$ docker run `whoami`/docker-scaffold
OBLIGATORY_VAR variable is not provided, exiting...
```

If you run it directly it will show an example of validation of an obligatory variable.

To run it properly do:

```
$ docker run -e OBLIGATORY_VAR=sample `whoami`/docker-scaffold
Generating app.properties...
id=000001                 # Variable with default value
optional=     # Optional variable, returns empty if not defined
obligatory=sample # Obligatory variable, validation fails and script stops
```

To add value to the optional variable do:

```
$ docker run -e OPTIONAL_VAR=sample2 -e OBLIGATORY_VAR=sample `whoami`/docker-scaffold
Generating app.properties...
id=000001                 # Variable with default value
optional=sample2     # Optional variable, returns empty if not defined
obligatory=sample # Obligatory variable, validation fails and script stops
```

To override the default value for id do:

```
$ docker run -e APP_ID=101 -e OBLIGATORY_VAR=sample `whoami`/docker-scaffold
Generating app.properties...
id=101                 # Variable with default value
optional=     # Optional variable, returns empty if not defined
obligatory=sample # Obligatory variable, validation fails and script stops
```
