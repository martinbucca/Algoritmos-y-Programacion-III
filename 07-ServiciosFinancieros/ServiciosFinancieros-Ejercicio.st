!classDefinition: #CantAddAccountError category: 'ServiciosFinancieros-Ejercicio'!
Error subclass: #CantAddAccountError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/8/2022 21:35:34'!
test01PortfolioWithAccountWithoutTransactionsHasBalance0
 	| portfolio anAccount |
	anAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio new.
	portfolio addAccount: anAccount.
		
	self assert: 0 * peso equals: portfolio balance! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/10/2022 21:36:25'!
test02PortfolioBalanceHasADeposit
 	| portfolio anAccount |
	anAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	
	portfolio := Portfolio new.
	portfolio addAccount: anAccount.
		
	self assert: 100 * peso equals: portfolio balance! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/10/2022 21:32:23'!
test03PortfolioBalanceSumsDepositsOfMulltipleAccounts
 	| portfolio anAccount anotherAccount |
	anAccount := ReceptiveAccount  new.
	anotherAccount := ReceptiveAccount  new.
	Deposit register: 100 * peso on: anAccount.
	Deposit register: 50 * peso on: anotherAccount.	
	
	portfolio := Portfolio new.
	portfolio addAccount: anAccount.
	portfolio addAccount: anotherAccount.
		
	self assert: 150 * peso equals: portfolio balance! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/10/2022 21:35:06'!
test04PortfolioDoesntHasTheTransactionOfAccount
 	| portfolio anAccount transaction |
	anAccount := ReceptiveAccount  new.
	transaction := Deposit register: 100 * peso on: anAccount.
	
	portfolio := Portfolio new.
	
		
	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/10/2022 21:35:27'!
test05PortfolioHasTheTransactionOfAccount
 	| portfolio anAccount transaction |
	anAccount := ReceptiveAccount  new.
	transaction := Deposit register: 100 * peso on: anAccount.

	portfolio := Portfolio new.
	portfolio addAccount: anAccount.

	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/10/2022 21:37:27'!
test06PortfolioDoesntHasTransactions
 	| portfolio anAccount |
	anAccount := ReceptiveAccount  new.

	portfolio := Portfolio new.
	portfolio addAccount: anAccount.

	self assert: (portfolio transactions) isEmpty.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/10/2022 21:38:11'!
test07PortfolioHasTheTransactionOfHisAccount
 	| portfolio anAccount transaction |
	anAccount := ReceptiveAccount  new.
	transaction := Deposit register: 100 * peso on: anAccount.

	portfolio := Portfolio new.
	portfolio addAccount: anAccount.

	self assert: (portfolio transactions) includes: transaction.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:31:38'!
test08PortfolioCantAddAnAccountTwice
 	| portfolio anAccount |
	anAccount := ReceptiveAccount  new.

	portfolio := Portfolio new.
	portfolio addAccount: anAccount.

	self should: [portfolio addAccount: anAccount] raise: CantAddAccountError.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:31:28'!
test09PortfolioCantAddAnAccountExistingInAnotherPortfolioInside
 	| aPortfolio anotherPortfolio anAccount |
	anAccount := ReceptiveAccount  new.

	anotherPortfolio := Portfolio new.
	aPortfolio := Portfolio new.
	aPortfolio addAccount: anAccount.
	anotherPortfolio addAccount: aPortfolio.
	
	self should: [anotherPortfolio addAccount: anAccount] raise: CantAddAccountError.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:32:21'!
test10PortfolioCantBeAddedToHimself
 	| aPortfolio |
	aPortfolio := Portfolio new.
	
	self should: [aPortfolio addAccount: aPortfolio] raise: CantAddAccountError.! !

!PortfolioTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:41:12'!
test11PortfolioCantAddAnotherPortfolioWhithExistentAccount
 	| aPortfolio anotherPortfolio anAccount |
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherPortfolio addAccount: anAccount.
	aPortfolio addAccount: anAccount.
	
	self should: [aPortfolio addAccount: anotherPortfolio] raise: CantAddAccountError.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'anAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:48:30'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 
	self assert: 0 equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:48:40'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: anAccount.
		
	self assert: 100 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:48:48'!
test03WithdrawDecreasesBalanceOnTransactionValue 
	Deposit register: 100 * peso on: anAccount.
	Withdraw register: 50 * peso on: anAccount.
		
	self assert: 50 * peso equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:48:59'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: anAccount) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:49:10'!
test05ReceptiveAccountKnowsRegisteredTransactions 
	| deposit withdraw |
	deposit := Deposit register: 100 * peso on: anAccount.
	withdraw := Withdraw register: 50 * peso on: anAccount.
		
	self assert: (anAccount hasRegistered: deposit).
	self assert: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:49:23'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions
	| deposit withdraw |
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (anAccount hasRegistered: deposit).
	self deny: (anAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FG 11/11/2022 12:49:35'!
test07AccountKnowsItsTransactions 
	| deposit |
		
	deposit := Deposit register: 50 * peso on: anAccount.
		
	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'setUp/tearDown' stamp: 'FG 11/11/2022 12:48:10'!
setUp
	anAccount := ReceptiveAccount new.! !


!classDefinition: #TransactionTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransactionTest
	instanceVariableNames: 'senderAccount receiverAccount amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransactionTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:46:14'!
test01TransferenceOutHasAValue
	| transference  |
	
	transference := Transference register: amount from: senderAccount to: receiverAccount.

	self assert: (transference value) equals: amount! !

!TransactionTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:46:38'!
test02TransferenceOutDisminushSenderBalance
	Transference register: amount from: senderAccount to: receiverAccount.
	
	self assert: (senderAccount balanceIs: (amount negated)).! !

!TransactionTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:46:50'!
test03TransferenceOutIncrementReceiverBalance
	Transference register: amount from: senderAccount to: receiverAccount.
	
	self assert: (receiverAccount balanceIs: amount).! !

!TransactionTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:47:02'!
test04TransferenceOutCounterpartIsTheReceiverAccount
	| transference |
	transference := Transference register: amount from: senderAccount to: receiverAccount.
	
	self assert: (transference counterpart isKindOf: Deposit).! !

!TransactionTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:47:17'!
test05TransferenceInCounterpartIsTheSenderAccount	
	| transference |
	Transference register: amount from: senderAccount to: receiverAccount.
	transference := receiverAccount transactions detect: [:transaction | transaction isKindOf: Transference].
	
	self assert: (transference counterpart isKindOf: Withdraw).! !

!TransactionTest methodsFor: 'testing' stamp: 'FG 11/11/2022 12:47:29'!
test06TransferenceIsRegisteredInSenderAccount
	| transference |
	transference := Transference register: amount from: senderAccount to: receiverAccount.
	
	self assert: (senderAccount hasRegistered: transference).! !


!TransactionTest methodsFor: 'setUp/tearDown' stamp: 'FG 11/11/2022 12:45:53'!
setUp
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	amount := 10 * peso.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'FG 11/4/2022 19:39:03'!
applyTo: aBalance
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'FG 11/10/2022 20:46:37'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'FG 11/4/2022 19:41:30'!
applyTo: aBalance
	^ aBalance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transference
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'FG 11/11/2022 11:33:55'!
initializeFor: aValue counterpart: aCounterpart.
	value := aValue.
	counterpart := aCounterpart.! !


!Transference methodsFor: 'value' stamp: 'FG 11/11/2022 11:16:09'!
applyTo: aBalance
	^ aBalance.! !


!Transference methodsFor: 'accessing' stamp: 'FG 11/10/2022 20:53:46'!
counterpart
	^counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'FG 11/11/2022 11:33:10'!
for: aValue counterpart: aCounterpart
	^ self new initializeFor: aValue counterpart: aCounterpart.! !

!Transference class methodsFor: 'instance creation' stamp: 'FG 11/11/2022 11:50:11'!
register: anAmount from: aSenderAccount to: aReceiverAccount
	| transference deposit withdraw transferenceOut transferenceIn|
	deposit := Deposit register: anAmount on: aReceiverAccount.
	withdraw := Withdraw register: anAmount on: aSenderAccount.
	
	transferenceOut := Transference for: anAmount counterpart: deposit.
	aSenderAccount register: transferenceOut.
	
	transferenceIn := Transference for: anAmount counterpart: withdraw.
	aReceiverAccount register: transferenceIn.
	
	^transferenceOut.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'FG 11/4/2022 19:39:57'!
applyTo: aBalance
	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private' stamp: 'FG 11/11/2022 12:38:33'!
hasAccount: anAccount
	^accounts anySatisfy:[:account | (account hasAccount: anAccount) or: (anAccount hasAccount: account)]
! !


!Portfolio methodsFor: 'public' stamp: 'FG 11/11/2022 12:31:06'!
addAccount: anAccount
	((self hasAccount: anAccount) or: (self = anAccount)) ifTrue:[ CantAddAccountError signal.].
	
	accounts add: anAccount.! !

!Portfolio methodsFor: 'public' stamp: 'FG 11/8/2022 20:14:25'!
balance
	^accounts sum:[:account| account balance].! !

!Portfolio methodsFor: 'public' stamp: 'FG 11/8/2022 20:58:26'!
hasRegistered: aTransaction
	^accounts anySatisfy:[:account | account hasRegistered: aTransaction]! !

!Portfolio methodsFor: 'public' stamp: 'FG 11/8/2022 21:28:39'!
transactions
	| allTransactions |
	allTransactions := OrderedCollection new.
	accounts do: [:account | allTransactions addAll: (account transactions)].
	^ allTransactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'FG 11/8/2022 20:13:46'!
initialize
	accounts := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FG 11/10/2022 21:22:54'!
balance
	| aBalance |
	aBalance := 0 * peso.
	transactions do:[ :aTransaction | aBalance := aTransaction applyTo: aBalance ].
	^ aBalance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FG 11/4/2022 20:02:11'!
balanceIs: aBalance
	^ self balance = aBalance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FG 11/11/2022 12:25:51'!
hasAccount: anAccount
	^self = anAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
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
