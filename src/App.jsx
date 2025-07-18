import { useState } from 'react';
import { ethers } from 'ethers';
import './App.css';

const CONTRACT_ADDRESS = "0xYourContractAddressHere"; // заменишь на актуальный

const abi = [
  "function makeMove() public payable"
];

function App() {
  const [status, setStatus] = useState('Disconnected');

  const connectAndMove = async () => {
    if (!window.ethereum) {
      alert("Install MetaMask first");
      return;
    }

    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();

    const contract = new ethers.Contract(CONTRACT_ADDRESS, abi, signer);

    try {
      const tx = await contract.makeMove({ value: ethers.parseUnits("0.0000001", "ether") });
      setStatus('Transaction sent: ' + tx.hash);
      await tx.wait();
      setStatus('Move complete!');
    } catch (err) {
      setStatus('Error: ' + err.message);
    }
  };

  return (
    <div className="container">
      <h1>2048 Onchain</h1>
      <button onClick={connectAndMove}>Make Move (0.0000001 ETH)</button>
      <p>{status}</p>
    </div>
  );
}

export default App;
