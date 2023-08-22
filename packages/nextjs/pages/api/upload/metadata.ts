import type { NextApiRequest, NextApiResponse } from "next";
import { File, Web3Storage } from "web3.storage";

type ResponseData = {
  uri?: string;
  message: string;
};

export default async function handler(req: NextApiRequest, res: NextApiResponse<ResponseData>) {
  const { name, description, imageUri, color, role, generation, tokenId } = req.body;
  const web3StorageApiToken = process.env.WEB3_STORAGE_TOKEN;
  if (typeof web3StorageApiToken !== "string") {
    return res.status(500).json({ message: "No web3.storage api token was found" });
  }
  const web3Storage = new Web3Storage({ token: web3StorageApiToken });

  const metadata = {
    name: name,
    description: description,
    imageUri: imageUri,
    attributes: [
      {
        trait_type: "Color",
        value: color,
      },
      {
        trait_type: "Rol",
        value: role,
      },
      {
        display_type: "number",
        trait_type: "Temporada",
        value: generation,
      },
      {
        display_type: "date",
        trait_type: "init",
        value: Math.floor(Date.now() / 1000),
      },
    ],
  };

  const cid = await web3Storage.put([new File([Buffer.from(JSON.stringify(metadata))], `${tokenId}.json`)], {
    wrapWithDirectory: false,
  });
  const response = {
    // This should be ipfs://<cid>, but the centralised Lens indexer is using an Infura IPFS
    // gateway that has issues resolving CIDs when propagated through web3storage's pinning
    // service.
    uri: `ipfs://${cid}`,
  };
  return res.status(200).json({ uri: response.uri, message: "Hello from Next.js!" });
}
