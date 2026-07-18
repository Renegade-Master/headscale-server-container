# headscale-server-container

Set of scripts to help with setup and management of a Headscale (OpenSource Tailscale) server.

## Running

1. Run the `clean.sh` script to prepare the envrionment

2. Required changes to the Headscale `config.yaml` file:
    * `server_url`: Should be your Server's Public IP, or Domain
    * `listen_addr`: Should be `0.0.0.0` (or your chosen Network Interface address) to expose
    * `metrics_listen_addr`: Should be `127.0.0.1` to remain hidden, or `0.0.0.0` (or your chosen Network Interface address) to expose
    * `grpc_listen_addr`: Should be `127.0.0.1` to remain hidden, or `0.0.0.0` (or your chosen Network Interface address) to expose
    * `policy.path`: If setting [Policies](https://headscale.net/stable/ref/policy/), this should be set to something like `/etc/headscale/policy.json`

3. Run the Headscale Server using the following command:
    ```shell
    ./run_headscale_server.sh
    ```

4. Add new Users to the Headscale Server using the following command:
    ```shell
    ./add_headscale_user.sh
    ```

5. Optionally, it is possible to run a Headplane Web UI using the following command:
    ```shell
    ./run_headplane_webui.sh
    ```

## Configuration UIs

By default, there is no web-ui available for Headscale. Some are listed [here](https://headscale.net/stable/ref/integration/web-ui/).

Personal recommendations:

* [Headplane](https://github.com/tale/headplane)
* [Headscale Manager](https://github.com/hkdone/headscalemanager)

### Configuring Headplane:

Required changes to the Headplane configuration file include:
* `cookie_secure`: Should be `true` only if Headscale is serving over HTTPS
* `headscale.url`: The port should match whatever Port Headscale is serving on
* `integration.docker.enabled`: Should be `true` for easiest integration

## Troubleshooting

Enable Podman Socket for Headplane: `systemctl --user enable --now podman.socket`

## References

* [Headscale: Install Container](https://headscale.net/stable/setup/install/container/)
* [Headplane: Docker Installation](https://headplane.net/install/docker)
