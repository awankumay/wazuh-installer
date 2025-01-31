# Wazuh Agent Installer

Skrip ini mengotomatiskan proses instalasi Wazuh Agent di Ubuntu. Skrip ini akan mengunduh paket Wazuh Agent, menginstalnya, dan secara opsional mengaktifkan serta memulai layanan Wazuh Agent.

## Prasyarat

- Sistem operasi Ubuntu.
- Akses internet untuk mengunduh paket Wazuh Agent.
- Hak akses `sudo` untuk menginstal paket dan mengelola layanan.

## Cara Penggunaan

1. **Unduh dan jalankan skrip:**
   ```bash
   curl -sL https://raw.githubusercontent.com/awankumay/wazuh-installer/installer-wazuh.sh | bash -s -- [options]
2. **Opsi**
    - -i: Menginstal Wazuh Agent. Wajib.
    - -e: Mengaktifkan dan memulai layanan Wazuh Agent. Opsional.
    - -h: Menampilkan pesan bantuan.
2. **Contoh**
   ```bash
   curl -sL https://raw.githubusercontent.com/awankumay/wazuh-installer/installer-wazuh.sh | bash -s -- -i -e
