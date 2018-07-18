# secure-enclave-keosd
<a href="https://github.com/owdin/secure-enclave-keosd/releases">![Download Latest](https://img.shields.io/badge/download-latest-brightgreen.svg?longCache=true&style=flat)</a>
<!-- ![Download Count](https://img.shields.io/github/downloads/owdin/secure-enclave-keosd/total.svg) -->
<b style="color: red">IMPORTANT: Fixing signing problem right now.. Stay Tuned!</b>

> Run Hardware-based EOS wallet with your Macbook Pro Touch ID.

You can [Download](https://github.com/owdin/secure-enclave-keosd/releases) latest release.

If your device is compromised, the key could also become compromised. As an added layer of protection, you can store a private key in the Touch ID Secure Enclave. Keep your EOS wallet secure with your finger.

## Overview
EOS officially supports secure enclave hardware wallet in v.1.10. The Secure Enclave is a hardware-based key manager that’s isolated from the main processor to provide an extra layer of security. When you store a private key in the Secure Enclave, you never actually handle the key, making it difficult for the key to become compromised. Instead, you instruct the Secure Enclave to create the key, securely store it, and perform operations with it. You receive only the output of these operations, such as encrypted data or a cryptographic signature verification outcome.

## Usage
> WIP

## License
This project is licensed under the MIT License. See [LICENSE]() for more detail.

## Reference
- [Apple - Storing Keys in the Secure Enclave](https://developer.apple.com/documentation/security/certificate_key_and_trust_services/keys/storing_keys_in_the_secure_enclave)
- [EOSIO Repo - Secure Enclave wallet support](https://github.com/EOSIO/eos/pull/4244)
