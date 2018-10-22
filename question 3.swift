import Foundation

func main() -> (){
    
	print( "Validating ISBN_Demo" )
	print()
	
    
     
    let isbns:[String] = [
        "0811821846",
        "978-0811821841",
        //"1616550414",
        //"978-1616550417",
        //"0553418025",
        //"978-0553418026",        
    ]

    for isbn in isbns {
        
        print( "\(isbn) is valid ISBN?      \( isValidISBN( isbn ) )")
    }
}

func isValidISBN( _ isbn:String ) -> Bool {
    
    var result:Bool = false
    
	if !isbn.isEmpty {
		
		var _isbn = 
			isbn.removeWord( "-" )
			
		switch _isbn.characters.count {
			
			case 10:
				result = isValidISBN_10( _isbn )
				break
			case 13:
				result = isValidISBN_13( _isbn )
				break
				
			default:
				print( "ERROR" )
		}
	}
    
    return result
}

func isValidISBN_10( _ code:String ) -> Bool {
    
    var result:Bool = false
    
		
		var sum:Int = 0
		
		let codeArray = Array( code.characters ) 
		for i in 0 ..< 9 {
			
			let number = codeArray[ i ].toInt()
			
			sum += number * ( i + 1 )
		}
		let lastChar = codeArray[ 9 ]
		sum += lastChar == "X" ? 10 : lastChar.toInt() * 10
		
		result = sum % 11 == 0		

    
    return result
}

func isValidISBN_13( _ code:String ) -> Bool {
    
    var result = false
    
		
		var sum:Int = 0
		
		let codeArray = Array( code.characters ) 
		for i in 0 ..< codeArray.count {
			
			let number = codeArray[ i ].toInt()
			
			sum += number * ( i.isOdd() ? 3 : 1 )
		}
		
		result = sum % 10 == 0
	
    
    return result
}

extension String {

	
    func removeWord( _ word:String ) -> String {
    	
    	var result = ""
    	
    	let textCharArr = Array( self.characters ) 
    	let wordCharArr = Array( word.characters ) 
    	
    	var possibleMatch = ""
    	
    	var i = 0, j = 0
    	while i < textCharArr.count {
    		
    		if textCharArr[ i ] == wordCharArr[ j ] {
    			
    			if j == wordCharArr.count - 1 {
    				
    				possibleMatch = ""
    				j = 0
    			}
    			else {
    				
    				possibleMatch.append( textCharArr[ i ] )
    				j += 1
    			}
    		}
    		else {
    			
    			result.append( possibleMatch ) 
    			possibleMatch = ""
    			
    			if j == 0 {
    				
    				result.append( textCharArr[ i ] )
    			}
    			else {
    				
    				j = 0
    				i -= 1
    			}
    		}
    		
    		i += 1
    	}
    	
    	return result
    }	
}

extension Character {
	
	func toInt() -> Int {
		
		return Int( String( self ) )! 
	}
}

extension Int {
		
	func isOdd() -> Bool {
		
		return self % 2 != 0
	}
}

main()