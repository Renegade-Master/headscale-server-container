# headscale-server-container

Set of scripts to help with setup and management of a Headscale (OpenSource Tailscale) server.

## Running

1. Run the `clean.sh` script to prepare the envrionment

2. Required changes to the `config.yaml` file:
    * Expose the Server by changing the `server_url` to your Server's Public IP, or Domain
    * Expose the HTTP ports by changing the `listen_addr` and `metrics_listen_addr` to `0.0.0.0` or your chosen Interface address.

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

## Troubleshooting

Enable Podman Socket for Headplane: `systemctl --user enable --now podman.socket`

## References

* [Headscale: Install Container](https://headscale.net/stable/setup/install/container/)
* [Headplane: Docker Installation](https://headplane.net/install/docker)
