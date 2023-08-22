const baseGatewayUrl = "https://ipfs.w3s.link/";
const baseIpfsUri = "ipfs://";

export const getGatewayUrl = (cid: string) => {
  return `${baseGatewayUrl}${cid}`;
};

export const getIpfsUri = (cid: string, fileName: string) => {
  return `${baseIpfsUri}${cid}/${fileName}`;
};
