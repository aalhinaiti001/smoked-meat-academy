# Publishing Smoked Meat Academy at `smokedmeatacademy.com`

This repository is a static HTML website and is ready to publish with GitHub Pages. Pull request #1 has been merged, so the default branch, `aalhin001`, now holds the complete site at its root and can be used as the Pages source directly.

The domain currently resolves to `192.0.78.24` and `192.0.78.25`, which are WordPress.com addresses. Those records must be replaced with the GitHub Pages records below, which means the domain stops serving whatever WordPress.com currently holds for it.

## Secure the domain first

Verify `smokedmeatacademy.com` at the GitHub account level before attaching it to the repository. GitHub will provide a value for a TXT record named `_github-pages-challenge-aalhinaiti001`; create that exact record at the domain's DNS provider and complete verification in GitHub. Keep the TXT record after verification. This prevents unrelated GitHub accounts from attaching the domain to their own Pages sites.

## Publish the website

Open the repository’s **Settings → Pages** screen. Under **Build and deployment**, select **Deploy from a branch**, choose the `aalhin001` branch, choose the `/(root)` folder, and save. Wait for the Pages deployment to finish. In **Custom domain**, enter `smokedmeatacademy.com` and save. The root `CNAME` file committed with this project matches this setting.

## Configure DNS

At the registrar or DNS provider, remove any conflicting parking records and add the following records. Do not use a wildcard (`*`) record.

| Host | Type | Value |
| --- | --- | --- |
| `@` | `A` | `185.199.108.153` |
| `@` | `A` | `185.199.109.153` |
| `@` | `A` | `185.199.110.153` |
| `@` | `A` | `185.199.111.153` |
| `www` | `CNAME` | `aalhinaiti001.github.io` |

Once the records resolve, return to **Settings → Pages** and enable **Enforce HTTPS**. GitHub Pages will redirect the `www` variant to the configured apex domain when both the apex and `www` records exist. DNS and certificate issuance can take up to 24 hours.

## Verify the launch

Use the following checks after propagation. Each should be reachable over HTTPS and all pages should retain their styles and working navigation.

```bash
dig smokedmeatacademy.com +short
dig www.smokedmeatacademy.com +short
curl -I https://smokedmeatacademy.com
curl -I https://www.smokedmeatacademy.com
```

The repository includes `robots.txt`, `sitemap.xml`, `.nojekyll`, and `CNAME` for this deployment. The sitemap’s canonical URLs use `https://smokedmeatacademy.com/`.

## Important content readiness items

Before making the site public, replace the placeholder telephone number and confirm that `hello@smokedmeat.academy` is a real, monitored mailbox. If the desired mailbox is instead `hello@smokedmeatacademy.com`, provision it with the mail provider first, then update the address in `tools/parts.sh` and `tools/build-order.sh`, run `tools/build.sh`, and commit the regenerated pages.

## References

[1]: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site "Managing a custom domain for your GitHub Pages site"
[2]: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages "Verifying your custom domain for GitHub Pages"

GitHub’s documentation describes the required apex records, the `www` CNAME target, domain verification, and HTTPS guidance.[1][2]
