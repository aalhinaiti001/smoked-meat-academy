# Publishing Smoked Meat Academy at `smokedmeatacademy.com`

This repository is a static HTML website and is ready to publish with GitHub Pages. Pull request #1 has been merged, so the default branch, `aalhin001`, now holds the complete site at its root and can be used as the Pages source directly.

**No custom domain is configured yet**, so the site serves at
`https://aalhinaiti001.github.io/smoked-meat-academy/` for preview. While a `CNAME` is
present, GitHub Pages redirects that URL to the custom domain, which is why the preview URL
did not work before. Set the `CUSTOM_DOMAIN` repository variable at the same time as the DNS
cutover below — the site should not go live on the domain without it.

The domain currently resolves to `192.0.78.24` and `192.0.78.25`, which are WordPress.com addresses. Those records must be replaced with the GitHub Pages records below, which means the domain stops serving whatever WordPress.com currently holds for it.

## Secure the domain first

Verify `smokedmeatacademy.com` at the GitHub account level before attaching it to the repository. GitHub will provide a value for a TXT record named `_github-pages-challenge-aalhinaiti001`; create that exact record at the domain's DNS provider and complete verification in GitHub. Keep the TXT record after verification. This prevents unrelated GitHub accounts from attaching the domain to their own Pages sites.

## Publish the website

The site is now an Astro project, so it is built by GitHub Actions rather than served from the branch. Open the repository’s **Settings → Pages** screen and set **Source** to **GitHub Actions**. The workflow in `.github/workflows/deploy.yml` builds on every push to `aalhin001` and publishes the result.

To move the site onto the custom domain, set the repository variable `CUSTOM_DOMAIN` to `smokedmeatacademy.com` under **Settings → Secrets and variables → Actions → Variables**. The next build then targets that domain and writes the `CNAME` into the deployment. Enter the same domain under **Settings → Pages → Custom domain**.

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

## Ordering and contact readiness

The site uses the confirmed mobile number and mailbox as direct ordering channels. It does not collect visitor details in an on-page form, so no request can be silently lost. If a form is added later, connect it to a secured endpoint or hosted form service and keep direct success/error feedback visible. Rebuild and run `tools/qa.sh` before committing any contact or ordering change.

## References

[1]: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site "Managing a custom domain for your GitHub Pages site"
[2]: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages "Verifying your custom domain for GitHub Pages"

GitHub’s documentation describes the required apex records, the `www` CNAME target, domain verification, and HTTPS guidance.[1][2]
