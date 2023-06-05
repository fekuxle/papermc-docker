PAPERMC_VERSION=$1

if [ -z $PAPERMC_VERSION ]; then
    PAPERMC_VERSION="1.19.4"
fi

LATEST_BUILD=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/${PAPERMC_VERSION}" | jq '.builds[-1]')
LATEST_DOWNLOAD=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/${PAPERMC_VERSION}/builds/${LATEST_BUILD}" | jq '.downloads.application.name' -r)
PAPERMC_DOWNLOAD_URL="https://papermc.io/api/v2/projects/paper/versions/${PAPERMC_VERSION}/builds/${LATEST_BUILD}/downloads/${LATEST_DOWNLOAD}"

echo "Downloading Paper $PAPERMC_VERSION build $LATEST_BUILD"

curl -s -o paper.jar $PAPERMC_DOWNLOAD_URL