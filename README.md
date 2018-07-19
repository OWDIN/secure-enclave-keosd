# secure-enclave-keosd
<a href="https://github.com/owdin/secure-enclave-keosd/releases">![Download Latest](https://img.shields.io/badge/download-latest-brightgreen.svg?longCache=true&style=flat)</a>
<!-- ![Download Count](https://img.shields.io/github/downloads/owdin/secure-enclave-keosd/total.svg) -->

![secure-enclave-keosd](https://user-images.githubusercontent.com/1831308/42917377-3c35b3c6-8b44-11e8-9849-2c0e63e78a3f.gif)

> Run Hardware-based EOS wallet with your Macbook Pro Touch ID.

**[Download](https://github.com/owdin/secure-enclave-keosd/releases)** latest release.

If your device is compromised, the key could also become compromised. As an added layer of protection, you can store a private key in the Touch ID Secure Enclave. Keep your EOS wallet secure with your finger.

## Overview
EOS officially supports secure enclave hardware wallet in v1.1.0. The Secure Enclave is a hardware-based key manager that’s isolated from the main processor to provide an extra layer of security. When you store a private key in the Secure Enclave, you never actually handle the key, making it difficult for the key to become compromised. Instead, you instruct the Secure Enclave to create the key, securely store it, and perform operations with it. You receive only the output of these operations, such as encrypted data or a cryptographic signature verification outcome.

## Usage
You can run keosd.app directly. If you want to run with option, try below:

```bash
$ ./keosd.app/Contents/MacOS/keosd --http-server-address=localhost:8900 --http-validate-host=false
```

Unlock SecureEnclave wallet:

```bash
$ cleos wallet unlock -n SecureEnclave
```

Create secure enclave key:

```bash
$ cleos wallet create_key -n SecureEnclave R1
```

Hooray! 🎉 You can create account with secure enclave key.

## Links
- [Touch ID 를 이용한 Secure Wallet 기능 사용법 - Steemit](https://steemit.com/kr/@owdin.network/eos-macbook-touchid-secure-wallet)

## License
This project is licensed under the MIT License. See [LICENSE](https://github.com/owdin/secure-enclave-keosd/blob/master/LICENSE) for more detail.

## Reference
- [Apple - Storing Keys in the Secure Enclave](https://developer.apple.com/documentation/security/certificate_key_and_trust_services/keys/storing_keys_in_the_secure_enclave)
- [EOSIO Repo - Secure Enclave wallet support](https://github.com/EOSIO/eos/pull/4244)
