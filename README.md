# Wazuh Agent Installer

Skrip ini mengotomatiskan proses instalasi Wazuh Agent di Ubuntu. Skrip ini akan mengunduh paket Wazuh Agent, menginstalnya, dan secara opsional mengaktifkan serta memulai layanan Wazuh Agent.

## Prasyarat

- Sistem operasi Ubuntu.
- Akses internet untuk mengunduh paket Wazuh Agent.
- Hak akses `sudo` untuk menginstal paket dan mengelola layanan.

## Cara Penggunaan

1. **Unduh dan jalankan skrip:**
   ```bash
   curl -sL https://raw.githubusercontent.com/awankumay/wazuh-installer/main/installer-wazuh.sh | bash -s -- [options]
2. **Opsi**
    - -i: Menginstal Wazuh Agent. Wajib.
    - -e: Mengaktifkan dan memulai layanan Wazuh Agent. Opsional.
    - -m: <WAZUH_MANAGER>  Server Wazuh (IP atau hostname)
    - -n: <HOSTNAME_AGENT>  Hostname Agent (biarkan kosong untuk menggunakan hostname sistem)
    - -h: Menampilkan pesan bantuan.
2. **Contoh**
   ```bash
   curl -sL https://raw.githubusercontent.com/awankumay/wazuh-installer/main/installer-wazuh.sh | bash -s -- -m ip_server -i -e
