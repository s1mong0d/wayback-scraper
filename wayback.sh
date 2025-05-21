#!/bin/bash

# Define colors
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
CYAN="\e[36m"
YELLOW="\e[33m"
BOLD="\e[1m"
RESET="\e[0m"

echo -e "${CYAN}"
echo "##############################################"
echo -e "# ${BOLD}       s1monC2 - Wayback Machine Scraper       ${RESET}${CYAN}#"
echo -e "# ${BOLD}       Author: ${RED}s1monC2${RESET}${CYAN}                         #"
echo "##############################################"
echo -e "${RESET}"

echo -e "${YELLOW}[*] Enter the target domain (e.g., example.com): ${RESET}"
read -p "→ " domain
echo ""

# Fetch all URLs
echo -e "${BLUE}[*] Fetching all URLs from the Wayback Machine...${RESET}"
curl -G "https://web.archive.org/cdx/search/cdx" \
  --data-urlencode "url=*.$domain/*" \
  --data-urlencode "collapse=urlkey" \
  --data-urlencode "output=text" \
  --data-urlencode "fl=original" \
  -o all_urls.txt

# Check if fetching was successful
if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}[+] Successfully fetched all URLs.${RESET}"
else
    echo -e "${RED}[!] Failed to fetch all URLs.${RESET}"
    exit 1
fi

# Fetch filtered URLs
echo -e "${BLUE}[*] Fetching URLs with specific file extensions...${RESET}"
curl "https://web.archive.org/cdx/search/cdx?url=*.$domain/*&collapse=urlkey&output=text&fl=original&filter=original:.*\.(xls|xml|xlsx|json|pdf|sql|doc|docx|pptx|txt|git|zip|tar\.gz|tgz|bak|7z|rar|log|cache|secret|db|backup|yml|gz|config|csv|yaml|md|md5|exe|dll|bin|ini|bat|sh|tar|deb|rpm|iso|img|env|apk|msi|dmg|tmp|crt|pem|key|pub|asc)$" \
  -o filtered_urls.txt

# Check if fetching was successful
if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}[+] Successfully fetched filtered URLs.${RESET}"
else
    echo -e "${RED}[!] Failed to fetch filtered URLs.${RESET}"
    exit 1
fi

# Display output summary
echo -e "\n${CYAN}##############################################${RESET}"
echo -e "${GREEN}[+] Done! Results saved to:${RESET}"
echo -e "   ${BOLD}🔹 all_urls.txt${RESET} - (All archived URLs)"
echo -e "   ${BOLD}🔹 filtered_urls.txt${RESET} - (Filtered URLs with sensitive file extensions)"
echo -e "${CYAN}##############################################${RESET}\n"



