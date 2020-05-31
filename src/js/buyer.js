App = {

	loading:false,
	contracts: {},

	load:async()=>{

		await App.loadWeb3()
		
		

	},

	loadWeb3: async()=>{

		if (typeof web3 !== 'undefined') {
      			App.web3Provider = web3.currentProvider
      			web3 = new Web3(web3.currentProvider)
    		} else {
      			window.alert("Please connect to Metamask.")
    		}
    		if (window.ethereum) {
      			window.web3 = new Web3(ethereum)
      			try {
        			await ethereum.enable()
        			web3.eth.sendTransaction({/* ... */})
      			} catch (error) {
              		}
		}
		else if(window.web3) {
      			App.web3Provider = web3.currentProvider
      			window.web3 = new Web3(web3.currentProvider)
      			web3.eth.sendTransaction({/* ... */})
    		}
   		else {
      			console.log('Non-Ethereum browser detected. You should consider trying MetaMask!')
    		}
	},
	
	loadAccount: async () => {
    		App.account = web3.eth.accounts[0]
  	},

	loadContract: async () => {
    		const records = await $.getJSON('Records.json')
    		App.contracts.Records = TruffleContract(records)
    		App.contracts.Records.setProvider(App.web3Provider)
		/////////////////////////////////////////
    		App.Records = await App.contracts.Records.deployed()
 	 },

  	
  
}

$(() => {
  $(window).load(() => {
	App.load()
	
	let login = document.getElementById("login-btn");

	
    App.loadAccount();
    if(!App.Records.checkUser(App.account)){
        window.location.replace = "../index.html"
    }
    let investor = document.getElementById("investor-btn");
    let sme = document.getElementById('sme-btn');
	let buyer = document.getElementById('buyer-btn');

    investor.addEventListener('click', ()=>{
        window.location.replace="../investor.html";
    });
    sme.addEventListener('click',()=>{
        window.location.replace="../sme.html";
	});
	buyer.addEventListener('click',()=>{
		window.location.replace = "../buyer.html";
	});
	

	
  })
})
