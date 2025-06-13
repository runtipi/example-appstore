# 🔒 Security Policy

## 📋 Supported Versions

We actively maintain and provide security updates for the following:

| Component | Version | Supported |
|-----------|---------|-----------|
| tipi-store (latest) | All releases | ✅ |
| Applications | Latest versions | ✅ |
| CI/CD Infrastructure | Current | ✅ |
| Documentation | Current | ✅ |

## 🚨 Reporting Security Vulnerabilities

### For tipi-store Repository Issues

If you discover a security vulnerability in this repository (automation scripts, configurations, or infrastructure), please report it responsibly:

**🔐 Private Disclosure (Preferred)**
- Email: [Create a GitHub Security Advisory](https://github.com/JigSawFr/tipi-store/security/advisories/new)
- Use GitHub's private vulnerability reporting feature
- Include detailed information about the vulnerability

**📧 Direct Contact**
- Create a private issue or contact maintainers directly
- **Do not** create public issues for security vulnerabilities

### For Application-Specific Vulnerabilities

If you find a security issue in one of the applications we package:

1. **Report to Upstream**: Contact the original application maintainers first
2. **Notify Us**: Let us know so we can coordinate updates
3. **Follow Responsible Disclosure**: Allow time for fixes before public disclosure

## 🛡️ Security Measures

### Repository Security

- **🔒 Automated Dependency Updates**: Renovate Bot monitors and updates dependencies
- **✅ CI/CD Validation**: All changes undergo automated security checks
- **🔍 Code Scanning**: GitHub's security features scan for vulnerabilities
- **📝 Audit Trail**: All changes are tracked and reviewed

### Application Security

- **🏠 Rootless by Default**: Applications run as non-root user (1000:1000)
- **🔐 Pinned Dependencies**: Docker images are pinned to specific versions
- **🩺 Health Checks**: Real health monitoring, not just port checks
- **🚫 Supply Chain Protection**: Secure CI/CD prevents upstream risks

### Infrastructure Security

- **🤖 Automated Workflows**: GitHub Actions with restricted permissions
- **🔑 Secret Management**: Proper handling of sensitive information
- **📊 Monitoring**: Automated detection of unusual activities
- **🔄 Regular Updates**: Frequent security updates via automation

## 🚀 Security Best Practices

### For Users

When using applications from this store:

- **🔄 Keep Updated**: Enable automatic updates in Runtipi
- **🔒 Use Strong Passwords**: Set secure passwords for all services
- **🌐 Network Security**: Use reverse proxy with SSL/TLS
- **💾 Regular Backups**: Backup your data regularly
- **🔍 Monitor Logs**: Check application logs for suspicious activity

### For Contributors

When contributing to this repository:

- **✅ Validate Configurations**: Test all Docker configurations locally
- **🔍 Review Dependencies**: Check for known vulnerabilities in dependencies
- **📝 Document Changes**: Clearly document security-relevant changes
- **🔐 Follow Standards**: Use established security patterns and practices

## 🎯 Security Scope

### What We Secure

- ✅ **Repository Infrastructure**: CI/CD, automation, and configuration files
- ✅ **Application Packaging**: Docker configurations and metadata
- ✅ **Documentation**: Security guidance and best practices
- ✅ **Dependency Management**: Automated updates and vulnerability monitoring

### What We Don't Control

- ❌ **Upstream Applications**: Security of the original applications (report to upstream)
- ❌ **Runtipi Platform**: Security of the Runtipi platform itself
- ❌ **User Configurations**: Custom configurations and modifications
- ❌ **Network Infrastructure**: User's network and server security

## 🔧 Vulnerability Response Process

### 1. Initial Response (24-48 hours)
- Acknowledge receipt of vulnerability report
- Assign severity level and priority
- Begin initial assessment

### 2. Investigation (1-7 days)
- Reproduce and validate the vulnerability
- Assess impact and affected components
- Develop remediation plan

### 3. Resolution (Varies by severity)
- **Critical**: Immediate fix and release
- **High**: Fix within 7 days
- **Medium**: Fix within 30 days
- **Low**: Fix in next regular release

### 4. Disclosure
- Coordinate with reporter on disclosure timeline
- Publish security advisory if applicable
- Update documentation and guidance

## 📊 Security Metrics

We track and monitor:

- **🔄 Update Frequency**: How quickly we apply security updates
- **⏱️ Response Time**: Time to acknowledge and fix vulnerabilities
- **📈 Coverage**: Percentage of dependencies under automated monitoring
- **🎯 Compliance**: Adherence to security best practices

## 🔗 Security Resources

### External Resources
- **[Runtipi Security](https://runtipi.io/docs/security)**: Platform security documentation
- **[Docker Security](https://docs.docker.com/engine/security/)**: Container security best practices
- **[OWASP](https://owasp.org/)**: Web application security guidance
- **[CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks)**: Security configuration standards

### Internal Documentation
- **[Contributing Guidelines](./CONTRIBUTING.md)**: Security considerations for contributors
- **[CI/CD Documentation](./.github/RENOVATE_CONFIG_SUMMARY.md)**: Automation security measures
- **[Application Standards](./apps/README.md)**: Security requirements for applications

## 🚨 Security Incident Response

### If You Suspect a Security Incident

1. **🛑 Do Not Panic**: Take systematic approach to assessment
2. **📊 Gather Information**: Document what you've observed
3. **🔒 Secure Systems**: Take immediate protective measures if needed
4. **📞 Report Immediately**: Contact us through secure channels
5. **📝 Preserve Evidence**: Keep logs and evidence for investigation

### Our Response

- **⚡ Immediate Assessment**: Rapid evaluation of incident severity
- **🛡️ Containment**: Steps to prevent further damage
- **🔍 Investigation**: Thorough analysis of root cause
- **🔧 Remediation**: Fix vulnerabilities and strengthen defenses
- **📊 Post-Incident Review**: Learn and improve security measures

## 📞 Contact Information

### Security Team
- **GitHub Security Advisories**: [Create Advisory](https://github.com/JigSawFr/tipi-store/security/advisories/new)
- **Issues**: [GitHub Issues](https://github.com/JigSawFr/tipi-store/issues) (for non-sensitive matters)
- **Discord**: [Community Support](https://discord.com/channels/976934649643294750/1378139625268314205)

### Response Time Expectations
- **Critical Vulnerabilities**: Within 24 hours
- **High Severity**: Within 48 hours
- **Medium/Low Severity**: Within 7 days
- **General Security Questions**: Within 14 days

---

## 🙏 Acknowledgments

We appreciate responsible disclosure and will acknowledge security researchers who help improve our security posture. Your contributions help keep the self-hosting community safe.

**Thank you for helping keep tipi-store secure!** 🛡️

---

*Last updated: June 2025*
