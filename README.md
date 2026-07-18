# headscale-server-container

Set of scripts to help with setup and management of a Headscale (OpenSource Tailscale) server.

## Running

1. Create the required directories in the repo directory:

    ```sh
    mkdir -p ./data/{config,lib}
    ```

2. Download the version of the configuration file that relates to the version of Headscale used for the Server (e.g. `v0.29.2`)
    * [Headscale: Configuration](https://headscale.net/stable/ref/configuration/)

3. Required changes to the `config.yaml` file:
    * Expose the Server by changing the `server_url` to your Server's Public IP, or Domain
    * Expose the HTTP ports by changing the `listen_addr` and `metrics_listen_addr` to `0.0.0.0` or your chosen Interface address.

4. Run the Headscale Server using the following command:
    ```shell
    ./run_headscale_server.sh
    ```

5. Add new Users to the Headscale Server using the following command:
    ```shell
    ./add_headscale_user.sh
    ```

## Configuration UIs

By default, there is no web-ui available for Headscale. Some are listed [here](https://headscale.net/stable/ref/integration/web-ui/).

Personal recommendations:

* [Headplane](https://github.com/tale/headplane)
* [Headscale Manager](https://github.com/hkdone/headscalemanager)

## References

* [Headscale: Install Container](https://headscale.net/stable/setup/install/container/)
* [Headplane: Docker Installation](https://headplane.net/install/docker)
