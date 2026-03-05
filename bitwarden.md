# Using Bitwarden at Red Hat

To log in:

1. In the web UI, go to [Security -> Keys](https://vault.bitwarden.com/#/settings/security/security-keys). This will give you an oauth `client_id` and `client_secret`.

2. Run this command:

   ```
   bw login kdreyer@redhat.com --apikey
   ```

3. Plug in the oauth values from step 1.


Red Hat has not enabled the `--sso` flag for Bitwarden, so don't bother with that.
