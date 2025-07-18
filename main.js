import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<App />);

            import React, { useState } from "react";
import { ethers } from "ethers";

function App() {
  const [account, setAccount] = useState("");

  async function connectWallet() {
    if (window.ethereum) {
      const provider = new ethers.BrowserProvider(window.ethereum);
      const accounts = await provider.send("eth_requestAccounts", []);
      setAccount(accounts[0]);
    } else {
      alert("Install MetaMask!");
    }
  }

  return (
    <div style={{ textAlign: "center", marginTop: "40px" }}>
      <h1>2048 Game on Base</h1>
      <button onClick={connectWallet}>
        {account ? `Connected: ${account.slice(0, 6)}...` : "Connect Wallet"}
      </button>
    </div>
  );
}

export default App;
