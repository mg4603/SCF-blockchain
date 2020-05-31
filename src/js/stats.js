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

	
    await App.loadAccount();
    if(!await App.Records.checkUser(App.account)){
        window.location.replace = "../index.html"
    }
    

    let contracts =await App.Records.getRecords(App.account);

    let contract_records = document.getElementById('contract_records');

    
    for(let i = 0; i < contracts.length; i++){
        let rec = await App.Records.getContractDetails1(contracts[i]);
        let rec2 = await App.Records.getContractDetails2(contracts[i]);
        rec.push(...rec2);
        var newRow = contract_records.insertRow();
        var cell1 = newRow.insertCell();
        cell1.innerHTML = i + 1;
        var cell2 = newRow.insertCell();
        cell2.innerHTML = rec[0];
        var cell3 = newRow.insertCell();
        cell3.innerHTML = rec[1];
        var cell4 = newRow.insertCell();
        cell4.innerHTML = rec[2];
        var cell5 = newRow.insertCell();
        cell5.innerHTML = rec[3];
        var cell6 = newRow.insertCell();
        cell6.innerHTML = rec[4];
        var cell7 = newRow.insertCell();
        cell7.innerHTML = rec[5];
        var cell8 = newRow.insertCell();
        cell8.innerHTML = rec[6];
        var cell9 = newRow.insertCell();
        cell9.innerHTML = rec[7];
        var cell10 = newRow.insertCell();
        cell10.innerHTML = rec[8];
        var cell11 = newRow.insertCell();
        cell11.innerHTML = rec[9];
        var cell12 = newRow.insertCell();
        cell12.innerHTML = rec[10];
        var cell13 = newRow.insertCell();
		cell13.innerHTML = rec[11];
		var cell14 = newRow.insertCell();
		cell14.innerHTML = rec[12];
    }


//  no  
//  sme 
//  Buyer 
//  noofinvestors 
//  deliveryDate; 
//  paymentDate; 
//  workingCapitalDeadline; 
//  orderAmount; 
//  orderDetails 
//  workingCapital 
//  interestRate 
//  backingPercent 
//  orderCompletion 
	

	
  })
})
