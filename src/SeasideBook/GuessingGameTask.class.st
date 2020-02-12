"
First task
"
Class {
	#name : #GuessingGameTask,
	#superclass : #WATask,
	#category : #SeasideBook
}

{ #category : #'class initialization' }
GuessingGameTask class >> initialize [

	WAAdmin register: self asApplicationAt: 'guessinggame'
]

{ #category : #running }
GuessingGameTask >> go [
	
	| number guess attempts |
	attempts := 3.
	number := 100 atRandom.
		[ guess := (self request: 'Enter your guess (You have ', attempts printString, ' attempts)') asNumber.
			guess < number
				ifTrue: [ 
					self inform: 'Your guess was too low'.
					attempts := attempts - 1 ].
			guess > number
				ifTrue: [ self inform: 'Your guess was too high'.
					attempts := attempts - 1 ].
			(guess = number) | (attempts = 0) ] whileFalse.
	attempts > 0
		ifTrue: [ self inform: 'You got it!' ]
		ifFalse: [ self inform: 'You lose!' ]
]
