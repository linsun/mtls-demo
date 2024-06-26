The following has been tested on a Macbook M2 pro:

Following [instruction](https://istio.io/latest/docs/setup/getting-started/#download) to download Istio 1.22.0 which includes the `istioctl` CLI.
To standup the environment:

```
./setup-env.sh
```

1. Follow the `steps` file in `/simple` folder for simple plain text, up to the line that says "Label the namespace".

2. Follow the `steps file in `/manual-mtls` folder for doing mTLS the hard way.

3. Follow the `steps` file in `/simple` folder for simple plain text, from the line that says "Label the namespace" to do mtls the simple way!
   
To tear down the environment:

```
./teardown.sh
```
