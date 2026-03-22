# <img align="left" width="45" height="45" src="https://github.com/user-attachments/assets/b1a10251-0c34-41c9-ac8c-edd79dbfaf07"> Google Cloud Platform - Network Module

[![OpenTofu Tests](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-arche-google-network/test.yml?style=for-the-badge&logo=opentofu&color=FEDA15&label=OpenTofu%20Tests)](https://github.com/osinfra-io/pt-arche-google-network/actions/workflows/test.yml) [![Dependabot](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-arche-google-network/dependabot.yml?style=for-the-badge&logo=github&color=2088FF&label=Dependabot)](https://github.com/osinfra-io/pt-arche-google-network/actions/workflows/dependabot.yml) [![Datadog Security Enabled](https://img.shields.io/badge/Datadog%20Security-Enabled-632CA6?style=for-the-badge&logo=datadog)](https://app.datadoghq.com/security/code-security/repositories?repository_id=pt-arche-google-network)

## Repository Description

OpenTofu **example** module that creates a Shared VPC host project network with configurable firewall rules, including CIS benchmark and Identity-Aware Proxy (IAP) rules. Regional subnetworks are provisioned with secondary IP ranges, VPC flow logging, and optional Cloud NAT for outbound internet access. Cloud DNS managed zones are supported for both public (with DNSSEC) and private visibility configurations.

## 🔩 Usage

> [!TIP]
> You can check the [tests/fixtures](tests/fixtures) directory for example configurations. These fixtures set up the system for testing by providing all the necessary initial code, thus creating good examples on which to base your configurations.

Google project services must be enabled before using this module. As a best practice, these should be defined in the [pt-arche-google-project](https://github.com/osinfra-io/pt-arche-google-project) module. The following services are required:

- `compute.googleapis.com`
- `dns.googleapis.com`

## <img align="left" width="35" height="35" src="https://github.com/user-attachments/assets/eb98a3be-2ffe-4c05-91a4-072fe795a167"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with OpenTofu documentation.

See the [documentation](https://docs.osinfra.io/fundamentals/development-setup) for setting up a local development environment.

### 🛠️ Tools

- [osinfra-pre-commit-hooks](https://github.com/osinfra-io/pt-techne-pre-commit-hooks)
- [pre-commit](https://github.com/pre-commit/pre-commit)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [cloud dns](https://cloud.google.com/dns/docs)
- [cloud nat](https://cloud.google.com/nat/docs/overview)
- [firewall](https://cloud.google.com/vpc/docs/firewalls)
- [shared vpc](https://cloud.google.com/vpc/docs/shared-vpc)
- [subnets](https://cloud.google.com/vpc/docs/subnets)
- [vpc](https://cloud.google.com/vpc/docs/vpc)

### 🔍 Tests

All tests are [mocked](https://opentofu.org/docs/cli/commands/test/#the-mock_provider-blocks) allowing us to test the module without creating infrastructure or requiring credentials. The trade-offs are acceptable in favor of speed and simplicity. In an OpenTofu test, a mocked provider or resource will generate fake data for all computed attributes that would normally be provided by the underlying provider APIs.

```none
tofu init
```

```none
tofu test
```

### 📦 Release

To release a new version, simply push a new tag to the repository. The tag should be in the format `vX.Y.Z` where `X`, `Y`, and `Z` are integers.

```none
git tag vX.Y.Z
git push origin vX.Y.Z
```
