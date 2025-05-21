# 🕵️‍♂️ Wayback Machine Scraper

A Bash script to extract **archived URLs** and **sensitive file paths** from the Wayback Machine (web.archive.org) for any target domain.

Made for **bug bounty hunters**, **pentesters**, and **OSINT enthusiasts**.

---

## ⚡ Features

- 🎯 Collects all archived URLs for a given domain
- 🧠 Filters for juicy file types (e.g., `.sql`, `.json`, `.pdf`, `.env`, `.yml`, etc.)
- 💾 Saves results to `all_urls.txt` and `filtered_urls.txt`

---

## 🧪 Example Usage

```bash
chmod +x wayback_scraper.sh
./wayback_scraper.sh
```

### 📸 Screenshot

Here's a sample terminal output:

![Example Output](img/wayback.png)
