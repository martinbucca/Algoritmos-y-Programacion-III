!classDefinition: #OOStackLimitedTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackLimitedTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:15:01'!
test01LimitedStackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack newWith: 5.
	self assert: stack isEmpty! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 13:58:25'!
test02PushAddElementsToTheLimitedStack

	| stack |
	stack := OOStack newWith: 4.
	stack push: 'something'.
	self deny: stack isEmpty! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:15:25'!
test03PopRemovesElementsFromTheLimitedStack
	| stack |
	stack := OOStack newWith: 5.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:02:28'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack newWith: 5.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:15:43'!
test05LimitedStackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack newWith: 5.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:01:40'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack newWith: 5.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:01:23'!
test07TopDoesNotRemoveObjectFromLimitedStack

	| stack pushedObject |
	
	stack := OOStack newWith: 5.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:17:42'!
test09CanNotPopWhenThereAreNoObjectsInTheLimitedStackAndTheStackHasObjects

	| stack  |
	
	stack := OOStack newWith: 6.
	stack push: 'something'.
	stack pop.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:00:44'!
test10CanNotTopWhenThereAreNoObjectsInTheLimitedStack

	| stack  |
	
	stack := OOStack newWith: 7.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:17:12'!
test11CanNotPushWhenCapacityIsZero

	| stack |
	stack := OOStack newWith: 0.
	self
		should: [ 	stack push: 'something'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack FullStackErrorDescription equals: anError messageText ]! !

!OOStackLimitedTest methodsFor: 'test' stamp: 'MB 10/14/2022 14:16:26'!
test12CanNotPushWhenLimitedStackIsFull

	| stack |
	stack := OOStack newWith: 4.
	stack push: 'something'.
	stack push: 'something'.
	stack push: 'something'.
	stack push: 'something'.	
	self
		should: [ 	stack push: 'something'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack FullStackErrorDescription equals: anError messageText ]! !


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'MB 10/14/2022 13:59:20'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHasObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'originalStack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 15:52:45'!
test01SenteceFinderFindsNothingWhenStackIsEmpty
	|sentencesFound|
	sentencesFound := sentenceFinder find: 'Nada'.
	self assert: sentencesFound isEmpty
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 15:54:47'!
test02SentenceFinderIsNotEmptyWhenFindsASentence
	| sentencesFound sentence1 |
	sentence1 := 'Navidad'.
	originalStack push: sentence1.
	sentencesFound := sentenceFinder find: 'Nav'.
	self deny: sentencesFound isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 22:19:27'!
test03SentenceFinderFindsTheUniqueSentenceInStack
	|sentencesFound sentence1 |
	sentence1 := 'Navidad'.
	originalStack push: sentence1.
	sentencesFound := sentenceFinder find: 'Nav'.
	self assert: sentencesFound last equals: sentence1! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 22:20:44'!
test04SentenceFinderIsCaseSensitive
	|sentencesFound sentence1 sentence2 prefix|
	prefix := 'Nav'.
	sentence1 := 'Navidad'.
	sentence2 := 'navidad'.
	originalStack push: sentence1.
	originalStack push: sentence2.
	sentencesFound := sentenceFinder find: prefix.
	self assert: sentencesFound removeLast equals: sentence1.
	self assert: sentencesFound isEmpty 
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 22:21:10'!
test05SentenceFinderOnlyFindsByPrefix
	|sentencesFound sentence1 sentence2 prefix|
	prefix := 'nav'.
	sentence1 := 'navidad'.
	sentence2 := 'Llego navidad'.
	originalStack push: sentence1.
	originalStack push: sentence2.
	sentencesFound := sentenceFinder find: prefix.
	self assert: sentencesFound removeLast equals: sentence1.
	self assert: sentencesFound isEmpty 
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 22:21:35'!
test06SentenceFinderFindAllTheSentences
	|sentencesFound sentence1 sentence2 sentence3 prefix sentence4 |
	prefix := 'nav'.
	sentence1 := 'navidad'.
	sentence2 := 'Llego navidad'.
	sentence3 := 'navidad es en diciembre'.
	sentence4 := 'naval'.
	originalStack push: sentence1.
	originalStack push: sentence2.
	originalStack push: sentence3.
	originalStack push: sentence4.
	sentencesFound := sentenceFinder find: prefix.
	self assert: sentencesFound removeLast equals: sentence1.
	self assert: sentencesFound removeLast equals: sentence3.
	self assert: sentencesFound removeLast equals: sentence4.
	self assert: sentencesFound isEmpty 
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 16:54:19'!
test07SentenceFinderFindsNothing
	|sentencesFound sentence1 sentence2 sentence3 prefix sentence4 |
	prefix := 'hol'.
	sentence1 := 'navidad'.
	sentence2 := 'Llego navidad'.
	sentence3 := 'navidad es en diciembre'.
	sentence4 := 'naval'.
	originalStack push: sentence1.
	originalStack push: sentence2.
	originalStack push: sentence3.
	originalStack push: sentence4.
	sentencesFound := sentenceFinder find: prefix.
	self assert: sentencesFound isEmpty 
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 16:53:14'!
test08SentenceFinderDoesNotModifyTheOriginalStack
	|sentence1 sentence2 sentence3 prefix sentence4 |
	prefix := 'nav'.
	sentence1 := 'navidad'.
	sentence2 := 'Llego navidad'.
	sentence3 := 'navidad es en diciembre'.
	sentence4 := 'naval'.
	originalStack push: sentence1.
	originalStack push: sentence2.
	originalStack push: sentence3.
	originalStack push: sentence4.
	sentenceFinder find: prefix.
	self assert: originalStack pop equals: sentence4.
	self assert: originalStack pop equals: sentence3.
	self assert: originalStack pop equals: sentence2.
	self assert: originalStack pop equals: sentence1.
	self assert: originalStack isEmpty.

	
	 
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 16:49:38'!
test09SentenceFinderCanNotFindWithSpacedPrefix
	| prefix|
	prefix := 'feliz navidad'.
	self
		should: [ sentenceFinder find: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MB 10/13/2022 16:53:35'!
test10SentenceFinderCanNotFindWithEmptyPrefix
	| prefix|
	prefix := ''.
	self
		should: [ sentenceFinder find: prefix ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix invalidPrefixErrorDescription equals: anError messageText ]! !


!SentenceFinderByPrefixTest methodsFor: 'setUp/tearDown' stamp: 'MB 10/13/2022 15:52:06'!
setUp
	originalStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix newWith: originalStack.

	
	! !


!classDefinition: #Element category: 'Stack-Exercise'!
Object subclass: #Element
	instanceVariableNames: 'element previousElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'accesing' stamp: 'FG 10/11/2022 21:02:53'!
getElement
	self subclassResponsibility.! !

!Element methodsFor: 'accesing' stamp: 'MB 10/14/2022 12:15:22'!
getPreviousElement
	self subclassResponsibility.! !


!classDefinition: #BaseElement category: 'Stack-Exercise'!
Element subclass: #BaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseElement methodsFor: 'accessing' stamp: 'FG 10/11/2022 20:52:48'!
getElement
	^self signalErrorStackIsEmpty.! !

!BaseElement methodsFor: 'accessing' stamp: 'MB 10/14/2022 12:15:22'!
getPreviousElement
	^self signalErrorStackIsEmpty.! !


!BaseElement methodsFor: 'initializing' stamp: 'FG 10/11/2022 21:05:05'!
withElement: anElement previousElement: aPreviousElement
	previousElement := nil.
	element := nil.! !


!BaseElement methodsFor: 'private' stamp: 'FG 10/11/2022 21:07:20'!
signalErrorStackIsEmpty
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #StackedElement category: 'Stack-Exercise'!
Element subclass: #StackedElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackedElement methodsFor: 'initializing' stamp: 'FG 10/11/2022 20:50:00'!
withElement: anElement previousElement: aPreviousElement
	previousElement := aPreviousElement.
	element := anElement.! !


!StackedElement methodsFor: 'accesing' stamp: 'FG 10/11/2022 20:48:33'!
getElement
	^element.! !

!StackedElement methodsFor: 'accesing' stamp: 'MB 10/14/2022 12:15:22'!
getPreviousElement
	^previousElement.! !


!classDefinition: #TopElement category: 'Stack-Exercise'!
Element subclass: #TopElement
	instanceVariableNames: 'capacity actualSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!TopElement methodsFor: 'operations' stamp: 'MB 10/14/2022 14:08:26'!
addElement: anElement
	(capacity = actualSize) ifTrue: [
		self signalErrorStackIsFull
		].
	actualSize := actualSize + 1.
	previousElement := 	StackedElement new withElement: anElement previousElement: previousElement.

	! !

!TopElement methodsFor: 'operations' stamp: 'MB 10/14/2022 12:18:40'!
removeElement
	|removedElement|
	removedElement := previousElement getElement.
	actualSize := actualSize - 1.
	previousElement := 	previousElement getPreviousElement.
	^removedElement

	! !

!TopElement methodsFor: 'operations' stamp: 'MB 10/14/2022 12:21:39'!
size
	^actualSize! !


!TopElement methodsFor: 'private' stamp: 'MB 10/14/2022 13:57:31'!
signalErrorStackIsFull
	self error: OOStack FullStackErrorDescription.! !


!TopElement methodsFor: 'initializing' stamp: 'MB 10/14/2022 12:06:34'!
initializeWith: anElement capacity: aCapacity
	previousElement := anElement.
	actualSize := 0.
	element := nil.
	capacity := aCapacity! !


!TopElement methodsFor: 'accesing' stamp: 'MB 10/14/2022 11:58:53'!
getElement
	^previousElement getElement! !

!TopElement methodsFor: 'accesing' stamp: 'MB 10/14/2022 12:15:22'!
getPreviousElement
	^previousElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TopElement class' category: 'Stack-Exercise'!
TopElement class
	instanceVariableNames: ''!

!TopElement class methodsFor: 'instance creation' stamp: 'MB 10/14/2022 12:54:00'!
newWith: element capacity: aCapacity
	^self new initializeWith: element capacity: aCapacity.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size stackTop'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'MB 10/14/2022 13:50:03'!
pop
	^self subclassResponsibility ! !

!OOStack methodsFor: 'operations' stamp: 'MB 10/14/2022 13:49:47'!
push: element
	^self subclassResponsibility ! !

!OOStack methodsFor: 'operations' stamp: 'MB 10/14/2022 13:49:10'!
top
	^self subclassResponsibility ! !


!OOStack methodsFor: 'testing' stamp: 'MB 10/14/2022 13:50:16'!
isEmpty
	^self subclassResponsibility ! !

!OOStack methodsFor: 'testing' stamp: 'MB 10/14/2022 13:49:30'!
size
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'MB 10/14/2022 13:57:19'!
FullStackErrorDescription
	
	^ 'Stack is full'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'MB 10/14/2022 12:45:25'!
new
	^OOStackUnlimited basicNew initialize! !

!OOStack class methodsFor: 'instance creation' stamp: 'MB 10/14/2022 12:45:56'!
newWith: capacity
	^OOStackLimited basicNew initializeWith: capacity! !


!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'testing' stamp: 'MB 10/14/2022 12:50:53'!
isEmpty
	^self size = 0.! !

!OOStackLimited methodsFor: 'testing' stamp: 'MB 10/14/2022 14:21:34'!
size
	^stackTop size! !


!OOStackLimited methodsFor: 'initialization' stamp: 'MB 10/14/2022 14:21:34'!
initializeWith: aCapacity
	|elementoBase|
	elementoBase := BaseElement new.
	stackTop := TopElement newWith: elementoBase capacity: aCapacity.
	! !


!OOStackLimited methodsFor: 'operations' stamp: 'MB 10/14/2022 14:21:34'!
pop
	^stackTop removeElement! !

!OOStackLimited methodsFor: 'operations' stamp: 'MB 10/14/2022 14:21:34'!
push: element
	stackTop addElement: element.
! !

!OOStackLimited methodsFor: 'operations' stamp: 'MB 10/14/2022 14:21:34'!
top
	^stackTop getElement.! !


!classDefinition: #OOStackUnlimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackUnlimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackUnlimited methodsFor: 'testing' stamp: 'MB 10/14/2022 12:40:42'!
isEmpty
	^size = 0.! !

!OOStackUnlimited methodsFor: 'testing' stamp: 'MB 10/14/2022 12:41:30'!
size
	^size! !


!OOStackUnlimited methodsFor: 'initialization' stamp: 'MB 10/14/2022 14:21:34'!
initialize
	stackTop := BaseElement new.
	size := 0.! !


!OOStackUnlimited methodsFor: 'operations' stamp: 'MB 10/14/2022 14:21:34'!
pop
	| elementoADevolver |
	elementoADevolver := stackTop getElement.
	stackTop := stackTop getPreviousElement.
	size := size - 1.
	^elementoADevolver.! !

!OOStackUnlimited methodsFor: 'operations' stamp: 'MB 10/14/2022 14:21:34'!
push: element
	stackTop :=  StackedElement new withElement: element previousElement: stackTop.
	size := size + 1.! !

!OOStackUnlimited methodsFor: 'operations' stamp: 'MB 10/14/2022 14:21:34'!
top
	^stackTop getElement.! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'public' stamp: 'FG 10/13/2022 20:10:55'!
checkPrefix: aPrefix
	|selectedSubclass|
	selectedSubclass := Prefix subclasses detect: [:prefixSubclass | prefixSubclass isValidPrefix: aPrefix].
	^selectedSubclass checkPrefix.! !


!Prefix class methodsFor: 'private' stamp: 'FG 10/13/2022 20:11:46'!
checkPrefix
	self subclassResponsibility.! !

!Prefix class methodsFor: 'private' stamp: 'FG 10/13/2022 20:13:56'!
isValidPrefix: aPrefix
	^self subclassResponsibility
! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise'!
Prefix subclass: #InvalidPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: 'Stack-Exercise'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'private' stamp: 'FG 10/13/2022 20:12:52'!
checkPrefix
	self error: SentenceFinderByPrefix invalidPrefixErrorDescription
! !

!InvalidPrefix class methodsFor: 'private' stamp: 'MB 10/13/2022 17:17:54'!
isValidPrefix: aPrefix
	^aPrefix = '' or: (aPrefix includesSubString: ' ')
	! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: 'actualPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'private' stamp: 'FG 10/13/2022 20:12:11'!
checkPrefix
! !

!ValidPrefix class methodsFor: 'private' stamp: 'MB 10/13/2022 17:17:46'!
isValidPrefix: aPrefix
	^(aPrefix = '' or: (aPrefix includesSubString: ' ')) not! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack actualPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MB 10/13/2022 16:48:14'!
signalErrorInvalidPrefix
	self error: self class invalidPrefixErrorDescription! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MB 10/13/2022 22:15:35'!
find: aPrefix
	| auxiliarStack sentencesFound stackSize |
	Prefix checkPrefix: aPrefix.
	auxiliarStack := OOStack new.
	sentencesFound := OrderedCollection new.
	stackSize := stack size.
	(stackSize) timesRepeat: [
		|actualElement|
		actualElement := stack pop.
		auxiliarStack push: actualElement.
		(actualElement beginsWith: aPrefix) ifTrue: [
			sentencesFound add: actualElement.
			].
		].
	(stackSize) timesRepeat: [
		|actualElement|
		actualElement := auxiliarStack pop.
		stack push: actualElement.
		].

	^sentencesFound! !


!SentenceFinderByPrefix methodsFor: 'instance creation-private' stamp: 'MB 10/13/2022 22:10:44'!
initializeWith: aStack
	stack := aStack
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'MB 10/13/2022 16:27:38'!
invalidPrefixErrorDescription
	^'prefix can not be empty or have spaces'! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'MB 10/13/2022 22:11:02'!
newWith: aStack
	^self new initializeWith: aStack.
	! !
