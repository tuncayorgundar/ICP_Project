import { HttpAgent, Actor } from "@dfinity/agent";
import { idlFactory } from "../../.dfx/local/canisters/hayvanlar_backend/hayvanlar_backend.did.js";

// Backend Canister ID'si
const canisterId = "bkyz2-fmaaa-aaaaa-qaaaq-cai";

// Agent ve Actor Tanımı
const agent = new HttpAgent({ host: "http://127.0.0.1:4943" });
const hayvanlarBackend = Actor.createActor(idlFactory, {
    agent,
    canisterId,
});

// Bağış Yapma İşlevi
async function makeDonation(donorName, donationAmount) {
    const result = await hayvanlarBackend.donate(donorName, donationAmount);
    console.log(result);
    alert(result); // Kullanıcıya geri bildirim
}

// Örnek: Bağış Yap Butonuna Tıklama İşlemi
document.getElementById("donateButton").addEventListener("click", async () => {
    const donorName = document.getElementById("donorName").value;
    const donationAmount = parseInt(document.getElementById("donationAmount").value, 10);

    await makeDonation(donorName, donationAmount);
});
