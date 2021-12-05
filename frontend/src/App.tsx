import {useEffect} from 'react';
import './App.css';
import Web3 from 'web3';
import Navbar from './components/Navbar';
import Tweets from './components/Tweets';
import SendTweet from './components/SendTweet';

function App() {
  const web3 = new Web3('ws://localhost:8556')
  
  useEffect(() => {

  }, [])

  return (
    <div className="App">
      <Navbar />
      <Tweets tweets={[
        {nickname: 'javi', content:'mi tweet', likeCounter: 10, address: '0x0000'
      }]} />
      <SendTweet />
    </div>
  );
}

export default App;
