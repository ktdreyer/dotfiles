# Using Bitwarden at Red Hat

I haven't figured out how the `--sso` flag works yet, or what RH's org ID is.

To log in:

1. In the web UI, go to [Security -> Keys](https://vault.bitwarden.com/#/settings/security/security-keys). This will give you an oauth `client_id` and `client_secret`.

2. Run this command:

   ```
   bw login kdreyer@redhat.com --apikey
   ```

3. Plug in the oauth values from step 1.
