!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'FG 11/17/2022 11:25:23'!
test16PortfolioWithOneAccountHasAName

	| portfolio anAccount |
	
	anAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio of the family' with: anAccount.
	
	self assert: (portfolio name) equals: 'Portfolio of the family'.! !

!PortfolioTest methodsFor: 'tests' stamp: 'FG 11/17/2022 11:27:34'!
test17PortfolioWithoutAccountHasNoName
	| portfolio |
	portfolio := Portfolio new.
	
	self assert: (portfolio name) equals: 'Unnamed portfolio'.! !

!PortfolioTest methodsFor: 'tests' stamp: 'FG 11/17/2022 11:32:16'!
test18PortfolioWithTwoAccountHasAName

	| portfolio anAccount anotherAccount |
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	portfolio := Portfolio named: 'Portfolio of the family' with: anAccount with: anotherAccount.
	
	self assert: (portfolio name) equals: 'Portfolio of the family'.! !

!PortfolioTest methodsFor: 'tests' stamp: 'FG 11/17/2022 11:48:21'!
test19PortfolioWithoutAccountHasAName
	| portfolio |
	portfolio := Portfolio named: 'Portfolio of the family'.
	
	self assert: (portfolio name) equals: 'Portfolio of the family'.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/17/2022 11:28:16'!
test08AccountCreatedWithAName 

	| account |
	
	account := ReceptiveAccount named: 'John Account'.
	
	self assert: (account name) equals: 'John Account'.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/17/2022 11:28:43'!
test09AccountCreatedWithoutAName 

	| account |
	
	account := ReceptiveAccount new.
	
	self assert: (account name) equals: 'Unnamed account'.! !


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 11:41:37'!
test09TransferNetReportIs0OnReceptiveAccountWithoutTransferences
	| anAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount .
	summary := TransferNet for: anAccount.
	
	expectedSummary := 0 * peso.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 16:31:07'!
test10TransferNetReportOnSenderReceptiveAccountWithOneTransfer
	| anAccount anotherAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	summary := TransferNet for: anAccount.
	
	expectedSummary := -50 * peso.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 16:31:56'!
test11TransferNetReportOnSenderReceptiveAccountWithOneTransferAndOneDeposit
	| anAccount anotherAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	summary := TransferNet for: anAccount.
	
	expectedSummary := -50 * peso.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 16:32:27'!
test12TransferNetReportOnRecieverReceptiveAccountWithOneTransferAndOneDeposit
	| anAccount anotherAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	summary := TransferNet for: anotherAccount.
	
	expectedSummary := 50 * peso.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 16:33:17'!
test13TransferNetReportOnSenderReceptiveAccountWithMultipleTransferences
	| anAccount anotherAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	summary := TransferNet for: anAccount.
	
	expectedSummary := -100 * peso.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 16:34:49'!
test14TransferNetReportOnRecieverReceptiveAccountWithMultipleTransferences
	| anAccount anotherAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	Transfer amount: 50 * peso from: anAccount  to: anotherAccount.
	summary := TransferNet for: anotherAccount.
	
	expectedSummary := 100 * peso.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'transferNet - test' stamp: 'MB 11/16/2022 16:35:44'!
test15TransferNetReportOnPorfolioWithMultipleTransferences
	| anAccount anotherAccount summary expectedSummary portfolio |
	
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	portfolio := Portfolio with: anotherAccount.
	Transfer amount: 100 * peso from: anAccount  to: anotherAccount.
	Transfer amount: 500 * peso from: anAccount  to: anotherAccount.
	summary := TransferNet for: portfolio.
	
	expectedSummary := 600 * peso.
	self assert:  expectedSummary equals: summary report.! !


!ReportTest methodsFor: 'treePrinter - test' stamp: 'MB 11/17/2022 18:27:33'!
test16PortfolioTreePrinterWithUnnamedPortfolioWithoutAccounts
	" Los tests de la creación con nombre estás en las clases de test de Portfolio y ReceptiveAccount "
	| portfolio treePrinterReport expectedReport |

	portfolio := Portfolio new.
	
	treePrinterReport := PortfolioTreePrinter for: portfolio.
	expectedReport := OrderedCollection with: 'Unnamed portfolio'.
	
	self assert: treePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'treePrinter - test' stamp: 'MB 11/17/2022 18:27:10'!
test17PortfolioTreePrinterWithNamedPortfolioWithoutAccounts
	| portfolio treePrinterReport expectedReport |

	
	portfolio := Portfolio named: 'Portfolio of John'.
	
	treePrinterReport := PortfolioTreePrinter for: portfolio.
	expectedReport := OrderedCollection with: 'Portfolio of John'.
	
	self assert: treePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'treePrinter - test' stamp: 'MB 11/18/2022 15:09:36'!
test18PortfolioTreePrinterWithNamedPortfolioWithOneReceptiveAccount
	| portfolio treePrinterReport anAccount expectedReport |

	anAccount := ReceptiveAccount named: 'John'.	
	portfolio := Portfolio named: 'Portfolio of John' with: anAccount.
	
	treePrinterReport := PortfolioTreePrinter for: portfolio.
	
	expectedReport := OrderedCollection 
		with: 'Portfolio of John' 
		with: '  John'.
	
	self assert: treePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'treePrinter - test' stamp: 'MB 11/18/2022 15:09:48'!
test19PortfolioTreePrinterWithNamedPortfolioWithMultipleReceptiveAccounts
	| portfolio treePrinterReport anAccount expectedReport anotherAccount|

	anAccount := ReceptiveAccount named: 'John'.	
	anotherAccount := ReceptiveAccount named: 'Charles'.
	portfolio := Portfolio named: 'Portfolio of John' with: anAccount with: anotherAccount.
	
	treePrinterReport := PortfolioTreePrinter for: portfolio.
	
	expectedReport := OrderedCollection 
		with: 'Portfolio of John' 
		with: '  John' 
		with: '  Charles'.
	
	self assert: treePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'treePrinter - test' stamp: 'MB 11/18/2022 15:10:00'!
test20PortfolioTreePrinterWithComposedPortfolioAndAccounts
	| composedPortfolio aPortfolio treePrinterReport anAccount expectedReport anotherAccount actualReport |

	anAccount := ReceptiveAccount named: 'John'.	
	anotherAccount := ReceptiveAccount named: 'Charles'.
	aPortfolio := Portfolio named: 'Children portfolio' with: anotherAccount.
	composedPortfolio := Portfolio named: 'Portfolio of John' with: aPortfolio with: anAccount.
		
	treePrinterReport := PortfolioTreePrinter for: composedPortfolio.
	
	expectedReport := OrderedCollection 
		with: 'Portfolio of John' 
		with: '  Children portfolio' 
		with: '    Charles' 
		with: '  John'.
	actualReport := treePrinterReport report.
	self assert: actualReport equals: expectedReport.! !


!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:10:56'!
test21PortfolioDetailedTreePrinterWithUnnamedPortfolioWithoutAccounts
	| portfolio detailedTreePrinterReport expectedReport |

	portfolio := Portfolio new.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: portfolio.
	expectedReport := OrderedCollection 
		with: 'Unnamed portfolio' 
		with: '  Balance = 0 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:11:49'!
test22PortfolioDetailedTreePrinterWithNamedPortfolioWithOneReceptiveAccountWithoutTransactions
	| anAccount portfolio detailedTreePrinterReport expectedReport |
	
	anAccount := ReceptiveAccount named: 'John'.	
	portfolio := Portfolio named: 'Portfolio of the family' with: anAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: portfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  John' 
		with: '    Balance = 0 * pesos' 
		with: '  Balance = 0 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:13:50'!
test23PortfolioDetailedTreePrinterWithPortfolioWithOnePortfolioWithoutAccounts
	| aPortfolio composedPortfolio detailedTreePrinterReport expectedReport |
	
	
	aPortfolio := Portfolio named: 'Portfolio of John'.	
	composedPortfolio := Portfolio named: 'Portfolio of the family' with: aPortfolio.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: composedPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  Portfolio of John' 
		with: '    Balance = 0 * pesos' 
		with: '  Balance = 0 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:16:45'!
test24PortfolioDetailedTreePrinterWithPortfolioWithOneReceptiveAccountWithOneDeposit
	| detailedTreePrinterReport expectedReport anAccount aPortfolio |
	
	anAccount := ReceptiveAccount named: 'John'.
	Deposit register: 100 * peso on: anAccount.
	aPortfolio := Portfolio named: 'Portfolio of the family' with: anAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  John' 
		with: '    Depósito por 100 * pesos'
		with: '    Balance = 100 * pesos' 
		with: '  Balance = 100 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:15:05'!
test25PortfolioDetailedTreePrinterWithPortfolioWithMultipleReceptiveAccountsWithoutTransactions
	| detailedTreePrinterReport expectedReport anAccount aPortfolio anotherAccount |
	
	anAccount := ReceptiveAccount named: 'John'.
	anotherAccount := ReceptiveAccount named: 'Charles'.
	aPortfolio := Portfolio named: 'Portfolio of the family' with: anAccount with: anotherAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  John' 
		with: '    Balance = 0 * pesos' 
		with: '  Charles' 
		with: '    Balance = 0 * pesos' 
		with: '  Balance = 0 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:17:06'!
test26PortfolioDetailedTreePrinterWithPortfolioWithOneReceptiveAccountWithMultipleDeposits
	| detailedTreePrinterReport expectedReport anAccount aPortfolio |
	
	anAccount := ReceptiveAccount named: 'John'.
	aPortfolio := Portfolio named: 'Portfolio of the family' with: anAccount.
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 50 * peso on: anAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  John' 
		with: '    Depósito por 100 * pesos' 
		with: '    Depósito por 50 * pesos' 
		with: '    Balance = 150 * pesos' 
		with: '  Balance = 150 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:17:23'!
test27PortfolioDetailedTreePrinterWithPortfolioWithOneReceptiveAccountWithOneWithdraw
	| detailedTreePrinterReport expectedReport anAccount aPortfolio |
	
	anAccount := ReceptiveAccount named: 'John'.
	Withdraw register: 100 * peso on: anAccount.
	aPortfolio := Portfolio named: 'Portfolio of the family' with: anAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  John' 
		with: '    Extracción por 100 * pesos'
		with: '    Balance = -100 * pesos' 
		with: '  Balance = -100 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:18:24'!
test28PortfolioDetailedTreePrinterWithPortfolioWithOneReceptiveAccountWithOneTransferWithdraw
	| detailedTreePrinterReport expectedReport aPortfolio receiverAccount senderAccount |
	receiverAccount := ReceptiveAccount named: 'Charles'.
	senderAccount := ReceptiveAccount named: 'John'.
	Transfer amount: 100 * peso from: senderAccount to: receiverAccount.
	aPortfolio := Portfolio named: 'Portfolio of the family' with: senderAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  John' 
		with: '    Salida por transferencia de 100 * pesos'
		with: '    Balance = -100 * pesos' 
		with: '  Balance = -100 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:18:53'!
test29PortfolioDetailedTreePrinterWithPortfolioWithOneReceptiveAccountWithOneTransferDeposit
	| detailedTreePrinterReport expectedReport aPortfolio receiverAccount senderAccount |
	receiverAccount := ReceptiveAccount named: 'Charles'.
	senderAccount := ReceptiveAccount named: 'John'.
	Transfer amount: 100 * peso from: senderAccount to: receiverAccount.
	aPortfolio := Portfolio named: 'Portfolio of the family' with: receiverAccount.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: aPortfolio.
	expectedReport := OrderedCollection 
		with: 'Portfolio of the family' 
		with: '  Charles' 
		with: '    Entrada por transferencia de 100 * pesos'
		with: '    Balance = 100 * pesos' 
		with: '  Balance = 100 * pesos'.
	
	self assert: detailedTreePrinterReport report equals: expectedReport.! !

!ReportTest methodsFor: 'detailedTreePrinter - test' stamp: 'MB 11/18/2022 15:22:08'!
test30PortfolioDetailedTreePrinterWithPortfolioWithPortfolioWithAccountWithTransactions
	| aPortfolio composedPortfolio detailedTreePrinterReport expectedReport anAccount |
	
	anAccount := ReceptiveAccount named: 'John'.
	Deposit register: 100 * peso on: anAccount.
	aPortfolio := Portfolio named: 'Portfolio of John' with: anAccount .	
	composedPortfolio := Portfolio named: 'Portfolio of the family' with: aPortfolio.
	
	detailedTreePrinterReport := PortfolioDetailedTreePrinter for: composedPortfolio.
	expectedReport := OrderedCollection new.
	expectedReport add: 'Portfolio of the family'.
	expectedReport add: '  Portfolio of John'.
	expectedReport add: '    John'.
	expectedReport add: '      Depósito por 100 * pesos'.
	expectedReport add: '      Balance = 100 * pesos'.
	expectedReport add: '    Balance = 100 * pesos'.
	expectedReport add: '  Balance = 100 * pesos'.

	self assert: detailedTreePrinterReport report equals: expectedReport.! !


!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:21:43'!
test01AccountSummaryReportBalanceIs0OnReceptiveAccountWithoutTransactions
	| anAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	
	summary := AccountSummary for: anAccount.
	
	expectedSummary := OrderedCollection with: 'Balance = 0 * pesos'.
	self assert:  expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:23:09'!
test02AccountSummaryReportOnReceptiveAccountWithOnlyOneDeposit
	| anAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	
	summary := AccountSummary for: anAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:22:54'!
test03AccountSummaryReportOnReceptiveAccountWithOnlyOneWithdraw
	| anAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	Withdraw register: 100 * peso on: anAccount.

	summary := AccountSummary for: anAccount.
	
	expectedSummary := OrderedCollection with: 'Extracción por 100 * pesos' with: 'Balance = -100 * pesos'.

	self assert: expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:23:41'!
test04AccountSummaryReportOnSenderReceptiveAccountWithOnlyOneTransfer
	| aSenderAccount aReceiverAccount summary expectedSummary |
	
	aSenderAccount := ReceptiveAccount  new.
	aReceiverAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso from: aSenderAccount  to: aReceiverAccount .

	summary := AccountSummary for: aSenderAccount.
	
	expectedSummary := OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Balance = -100 * pesos'.

	self assert: expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:23:55'!
test05AccountSummaryReportOnReceptiveReceiverAccountWithOnlyOneTransfer
	| aSenderAccount aReceiverAccount summary expectedSummary |
	
	aSenderAccount := ReceptiveAccount  new.
	aReceiverAccount := ReceptiveAccount new.
	Transfer amount: 100 * peso from: aSenderAccount  to: aReceiverAccount .

	summary := AccountSummary for: aReceiverAccount .
	
	expectedSummary := OrderedCollection with: 'Entrada por transferencia de 100 * pesos' with: 'Balance = 100 * pesos'.

	self assert: expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:24:14'!
test06AccountSummaryReportOnReceptiveAccountWithMultipleDeposits
	| anAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 100 * peso on: anAccount.

	
	summary := AccountSummary for: anAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Depósito por 100 * pesos' with: 'Balance = 200 * pesos'.
	
	self assert: expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:24:26'!
test07AccountSummaryReportOnReceptiveAccountWithMultipleTransactions
	| anAccount summary expectedSummary |
	
	anAccount := ReceptiveAccount  new.
	Deposit register: 200 * peso on: anAccount.
	Withdraw register: 100 * peso on: anAccount.
	
	
	summary := AccountSummary for: anAccount.
	
	expectedSummary := OrderedCollection with: 'Depósito por 200 * pesos' with: 'Extracción por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: expectedSummary equals: summary report.! !

!ReportTest methodsFor: 'accountSummary - test' stamp: 'MB 11/16/2022 11:33:21'!
test08AccountSummaryReportOnPortfolioWithMultipleAccountsAndTransactions
	| aPortfolio summary anAccount anotherAccount expectedSummary |
	
	anAccount := ReceptiveAccount new.
	anotherAccount  := ReceptiveAccount new.
	aPortfolio := Portfolio with: anAccount  with: anotherAccount.
	Deposit register: 100 * peso on: anAccount .
	Transfer amount: 50 * peso from: anAccount to: anotherAccount.
	
	summary := AccountSummary for: aPortfolio.
	
	expectedSummary := OrderedCollection with: 'Depósito por 100 * pesos' with: 'Salida por transferencia de 50 * pesos' with: 'Entrada por transferencia de 50 * pesos' with: 'Balance = 100 * pesos'.
	
	self assert: expectedSummary equals: summary report.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'FG 11/17/2022 11:31:06'!
name
	^name! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'FG 11/17/2022 11:43:16'!
setName: aName
	name := aName! !


!Account methodsFor: 'initialization' stamp: 'MB 11/17/2022 18:18:51'!
initialize
	^self subclassResponsibility 
 ! !


!Account methodsFor: 'report' stamp: 'MB 11/17/2022 18:20:55'!
beAddedToPortfolioTreePrinterReport: aPortfolioTreePrinterReport
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'FG 11/17/2022 11:44:01'!
named: aName
	^self new setName: aName! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'MB 11/17/2022 18:19:05'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := 'Unnamed portfolio'.

! !


!Portfolio methodsFor: 'main protocol' stamp: 'MB 11/16/2022 11:18:17'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'report' stamp: 'FG 11/18/2022 12:49:43'!
beAddedToDetailedTreeReport: aDetailedTreePrinterReport
	aDetailedTreePrinterReport addPortfolioLine: self.! !

!Portfolio methodsFor: 'report' stamp: 'MB 11/17/2022 18:20:36'!
beAddedToPortfolioTreePrinterReport: aPortfolioTreePrinterReport
	aPortfolioTreePrinterReport addPortfolioLine: self
! !

!Portfolio methodsFor: 'report' stamp: 'FG 11/18/2022 12:44:30'!
generateDetailedTreeReport: aReport
	(accounts isEmpty) ifTrue: [^self].
	accounts do: [:anAccount |
		anAccount beAddedToDetailedTreeReport: aReport.
	].! !

!Portfolio methodsFor: 'report' stamp: 'MB 11/17/2022 15:54:10'!
generateTreePrinterReport: aReport
	(accounts isEmpty) ifTrue: [^self].
	accounts do: [:anAccount | anAccount beAddedToPortfolioTreePrinterReport: aReport].
! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error message' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'FG 11/17/2022 11:22:06'!
named: aName with: aReceptiveAccount 
	| instance |
	instance := self with: aReceptiveAccount.
	instance setName: aName.
	^instance.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'FG 11/17/2022 11:32:57'!
named: aName with: aReceptiveAccount with: anotherReceptiveAccount
	| instance |
	instance := self with: aReceptiveAccount with: anotherReceptiveAccount.
	instance setName: aName.
	^instance.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'MB 11/17/2022 18:19:14'!
initialize

	transactions := OrderedCollection new.
	name := 'Unnamed account'! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MB 11/15/2022 21:37:25'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'report' stamp: 'FG 11/18/2022 12:49:39'!
beAddedToDetailedTreeReport: aDetailedTreePrinterReport
	aDetailedTreePrinterReport addReceptiveAccountLine: self.! !

!ReceptiveAccount methodsFor: 'report' stamp: 'MB 11/17/2022 18:20:12'!
beAddedToPortfolioTreePrinterReport: aPortfolioTreePrinterReport
	aPortfolioTreePrinterReport addReceptiveAccountLine: self! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'report' stamp: 'MB 11/16/2022 11:13:31'!
beIncludedInReport: aReport

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'FG 11/18/2022 12:25:31'!
beIncludedInDetailedReport: aReport
	^ aReport addDepositLine: self.
	"^aReport addLine: ('    ','Depósito por ',(self value)asString)."! !

!Deposit methodsFor: 'report' stamp: 'MB 11/16/2022 11:13:31'!
beIncludedInReport: aReport
	^aReport addDepositLine: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'report' stamp: 'FG 11/18/2022 12:28:22'!
beIncludedInDetailedReport: aReport
	^ aReport addTransferDepositLine: self.! !

!TransferDepositLeg methodsFor: 'report' stamp: 'MB 11/16/2022 11:13:31'!
beIncludedInReport: aReport
	^aReport addTransferDepositLegLine: self! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'report' stamp: 'FG 11/18/2022 12:28:31'!
beIncludedInDetailedReport: aReport
	^ aReport addTransferWithdrawLine: self.! !

!TransferWithdrawLeg methodsFor: 'report' stamp: 'MB 11/16/2022 11:13:31'!
beIncludedInReport: aReport
	^aReport addTransferWithdrawLegLine: self! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'FG 11/18/2022 12:28:45'!
beIncludedInDetailedReport: aReport
	^ aReport addWithdrawLine: self.! !

!Withdraw methodsFor: 'report' stamp: 'MB 11/16/2022 11:13:31'!
beIncludedInReport: aReport
	^aReport addWithdrawLine: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'initializing' stamp: 'MB 11/18/2022 14:59:56'!
initializeFor: anAccount
	account := anAccount ! !


!Report methodsFor: 'operation' stamp: 'MB 11/16/2022 16:24:50'!
report
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'MB 11/16/2022 16:23:36'!
for: anAccount
	^self new initializeFor: anAccount 
! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'reportLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'initializing' stamp: 'MB 11/18/2022 14:59:46'!
initializeFor: anAccount
	super initializeFor: anAccount.
	reportLines := OrderedCollection new! !


!AccountSummary methodsFor: 'operation' stamp: 'MB 11/16/2022 11:13:31'!
report
	account transactions do: [:aTransaction | aTransaction beIncludedInReport: self].
	reportLines add: ('Balance = ', account balance asString).
	^reportLines! !


!AccountSummary methodsFor: 'private' stamp: 'MB 11/16/2022 11:07:58'!
getTransactionValue: aTransaction
	^aTransaction value asString! !


!AccountSummary methodsFor: 'adding' stamp: 'MB 11/18/2022 14:55:07'!
addLineToReport: aStringLine
	reportLines add: (aStringLine)
! !


!AccountSummary methodsFor: 'DD-adding' stamp: 'MB 11/18/2022 14:55:26'!
addDepositLine: aDeposit
	self addLineToReport: ('Depósito por ', (self getTransactionValue: aDeposit))
! !

!AccountSummary methodsFor: 'DD-adding' stamp: 'MB 11/18/2022 14:55:39'!
addTransferDepositLegLine: aDepositLeg
	self addLineToReport: ('Entrada por transferencia de ', (self getTransactionValue: aDepositLeg))
! !

!AccountSummary methodsFor: 'DD-adding' stamp: 'MB 11/18/2022 14:55:44'!
addTransferWithdrawLegLine: aWithdrawLeg
	self addLineToReport: ('Salida por transferencia de ', (self getTransactionValue: aWithdrawLeg))
! !

!AccountSummary methodsFor: 'DD-adding' stamp: 'MB 11/18/2022 14:55:49'!
addWithdrawLine: aWithdraw
	self addLineToReport: ('Extracción por ', (self getTransactionValue: aWithdraw))
! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'initializing' stamp: 'MB 11/18/2022 15:00:10'!
initializeFor: anAccount
	super initializeFor: anAccount ! !


!TransferNet methodsFor: 'operation' stamp: 'MB 11/16/2022 16:21:28'!
report
	|transferNet transferTransactions|
	transferNet := 0 * peso.
	transferTransactions := self selectTransferTransactions.
	transferTransactions do: [:aTransferLeg | transferNet := aTransferLeg affectBalance: transferNet].
	^transferNet! !


!TransferNet methodsFor: 'private' stamp: 'MB 11/16/2022 16:21:02'!
selectTransferTransactions
	^account transactions select: [:aTransaction | aTransaction isKindOf: TransferLeg].
! !


!classDefinition: #TreeReport category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TreeReport
	instanceVariableNames: 'reportLines indentationLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TreeReport methodsFor: 'initialization' stamp: 'MB 11/18/2022 15:00:49'!
initializeFor: anAccount
	super initializeFor: anAccount. 
	reportLines := OrderedCollection new.
	indentationLevel := 0.! !


!TreeReport methodsFor: 'indentation' stamp: 'MB 11/18/2022 14:46:33'!
addIndentationLevel
	indentationLevel  := indentationLevel + 1! !

!TreeReport methodsFor: 'indentation' stamp: 'MB 11/18/2022 14:46:29'!
getIndentation
	| indentation |
	indentation := ''.
	(indentationLevel ) timesRepeat: [
		indentation := '  ', indentation
		].
	^indentation.! !

!TreeReport methodsFor: 'indentation' stamp: 'MB 11/18/2022 14:46:25'!
subtractIndentationLevel
	indentationLevel  := indentationLevel - 1! !


!TreeReport methodsFor: 'adding' stamp: 'MB 11/18/2022 14:52:21'!
addLineToReport: aStringLine

	reportLines add: (self getIndentation, aStringLine).! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
TreeReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'operation' stamp: 'MB 11/18/2022 15:08:49'!
report
	"Decidimos no realizar la implementacion reultilizando el reporte AccountSummary, para no tener un alto acomplamiento y de esta manera resulto en codigo repetido de algunos mensajes"
	self addLineToReport: (account name).
	self addIndentationLevel.
	account generateDetailedTreeReport: self.
	self addLineToReport: (self balanceLine: account balance). 
	^reportLines.! !


!PortfolioDetailedTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:21'!
addDepositLine: aTransaction
	self addLineToReport: ('Depósito por ', (self getTransactionValue: aTransaction)).! !

!PortfolioDetailedTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:21'!
addPortfolioLine: aPortfolio
	self addLineToReport: (aPortfolio name).
	self addIndentationLevel.
	aPortfolio generateTreePrinterReport: self.
	self addLineToReport: (self balanceLine: aPortfolio balance).	
	self subtractIndentationLevel.! !

!PortfolioDetailedTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:21'!
addReceptiveAccountLine: aReceptiveAccount
	self addLineToReport: (aReceptiveAccount name).	
	
	self addIndentationLevel.
	aReceptiveAccount transactions do: [:aTransaction|
		aTransaction beIncludedInDetailedReport: self.
		].
	self addLineToReport: ('Balance = ',(aReceptiveAccount balance)asString).
	self subtractIndentationLevel.! !

!PortfolioDetailedTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:21'!
addTransferDepositLine: aTransaction
	self addLineToReport: ('Entrada por transferencia de ', (self getTransactionValue: aTransaction)).! !

!PortfolioDetailedTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:21'!
addTransferWithdrawLine: aTransaction
	self addLineToReport: ('Salida por transferencia de ', (self getTransactionValue: aTransaction)).! !

!PortfolioDetailedTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:22'!
addWithdrawLine: aTransaction
	self addLineToReport: ('Extracción por ', (self getTransactionValue: aTransaction)).! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'FG 11/18/2022 13:15:51'!
balanceLine: aBalance
	^ 'Balance = ', aBalance asString! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'FG 11/18/2022 12:29:50'!
getTransactionValue: aTransaction
	^(aTransaction value) asString! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
TreeReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:21'!
addPortfolioLine: aPortfolio
	self addLineToReport: (aPortfolio name).
	self addIndentationLevel.
	aPortfolio generateTreePrinterReport: self.
	self subtractIndentationLevel ! !

!PortfolioTreePrinter methodsFor: 'DD - adding' stamp: 'MB 11/18/2022 14:52:22'!
addReceptiveAccountLine: aReceptiveAccount
	
	self addLineToReport: (aReceptiveAccount name)
! !


!PortfolioTreePrinter methodsFor: 'operation' stamp: 'MB 11/18/2022 14:52:21'!
report

	self addLineToReport: (account name).
	self addIndentationLevel.
	account generateTreePrinterReport: self.
	^reportLines! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
