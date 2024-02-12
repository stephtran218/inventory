//
//  main.swift
//  inventoryNew
//
//  Created by StudentAM on 2/12/24.
//

import Foundation


var startingCerealQuant: Int = 300
var startingMilkQuant: Int = 300
var startingSyrupQuant: Int = 300
var startingCupQuant: Int = 300

var currentStoreCerealQuantity: Int = startingCerealQuant
var currentStoreMilkQuantity: Int = startingMilkQuant
var currentStoreSyrupQuantity: Int = startingSyrupQuant
var currentStoreCupQuantity: Int = startingCupQuant

var cartCerealQuantity: Int = 0
var cartMilkQuantity: Int = 0
var cartSyrupQuantity: Int = 0
var cartCupQuantity: Int = 0

var adminID: Int = 2222

var remainingIventory: Int = currentStoreCerealQuantity + currentStoreMilkQuantity + currentStoreSyrupQuantity + currentStoreCupQuantity

var totalCost: Double = 0.0

var cerealPrice: Double = 3.99
var milkPrice: Double = 2.99
var syrupPrice: Double = 4.99
var cupPrice: Double = 3.99

let taxRate: Double = 0.0925
var subTotal: Double = 0.00

var totalSales: Double = 0.0



mainMenu()

//This is the main menu where the user can see all the choices
func mainMenu() {
    var menuChoice: String = "0"
    while menuChoice != "5" {
        print (
            "Welcome to the grocery store! Let us know how we can help you (Enter number of selection):\n",
            "1. Add item to cart\n",
            "2. Remove item from cart\n",
            "3. Check if item is in stock\n",
            "4. Admin Menu\n",
            "5. Checkout"
        )
        
        //Depending on which input the user puts, it will redirect them to the correct function
        if let userPick = readLine(), let userChoice = Int(userPick) {
            if userChoice == 1 {
                addToCartMenu()
            } else if userChoice == 2 {
                removeCartItemMenu()
            } else if userChoice == 3 {
                checkStockMenu()
            } else if userChoice == 4 {
                adminMenu ()
            } else if userChoice == 5 {
                checkout()
            } else{
                print("Please enter a valid selection 1-5")
            }
            menuChoice = userPick
        }
    }
}

//This is where the user will add stuff to their cart
func addToCartMenu() {
    print (
    "What would you like to add to cart? (Enter number of selection):\n",
    "1. Cereal\n",
    "2. Milk\n",
    "3. Syrup\n",
    "4. Cups"
    )
    
    //When the user picks which item they want to add, it will redireect them to a new function where they can choose a quantity of how much they will buy
    if let userChoice = readLine(), let choice = Int(userChoice) {
        verifyUserChoice(choice)
    }
}

//This function will allow the user to put in a quantity of the same item they want to put in cart
func verifyUserChoice(_ choice: Int) {
    if choice == 1 {
        print("How many cereal(s) would you like to add to your cart?")
        if let userQuantity = readLine(), let quantity = Int(userQuantity) {
            updateCartItemQuantity(choice, quantity)
        }
    } else if choice == 2 {
        print("How many milk(s) would you like to add to your cart?")
        if let userQuantity = readLine(), let quantity = Int(userQuantity) {
            updateCartItemQuantity(choice, quantity)
        }
    } else if choice == 3 {
        print("How many syrup(s) would you like to add to your cart?")
        if let userQuantity = readLine(), let quantity = Int(userQuantity) {
            updateCartItemQuantity(choice, quantity)
        }
    } else {
        print("How many cup(s) would you like to add to your cart?")
        if let userQuantity = readLine(), let quantity = Int(userQuantity) {
            updateCartItemQuantity(choice, quantity)
        }
    }
}

//This updates the cart with how many items are in it
func updateCartItemQuantity(_ choice: Int, _ quantity: Int) {
    if choice == 1 {
        cartCerealQuantity = quantity
        print("You have added \(cartCerealQuantity) cereal(s) to your cart")
        currentStoreCerealQuantity = startingCerealQuant - cartCerealQuantity
    } else if choice == 2 {
        cartMilkQuantity = quantity
        print("You have added \(cartMilkQuantity) milk(s) to your cart")
        currentStoreMilkQuantity = startingMilkQuant - cartMilkQuantity
    } else if choice == 3 {
        cartSyrupQuantity = quantity
        print("You have added \(cartSyrupQuantity) syrup(s) to your cart")
        currentStoreSyrupQuantity = startingSyrupQuant - cartSyrupQuantity
    } else {
        cartCupQuantity = quantity
        print("You have added \(cartCupQuantity) cup(s) to your cart")
        currentStoreCupQuantity = startingCupQuant - cartCupQuantity
    }
}

//This allows the user to remove things they added in their cart already
func removeCartItemMenu() {
    print("What would you like to remove from cart? (Enter number of selection):\n",
          "1. Cereal\n",
          "2. Milk\n",
          "3. Syrup\n",
          "4. Cups"
    )
    //when the user puts in a number for which item they want to remove, it will move them to the function to select a quantity of how much they want to remove
    if let userChoice = readLine(), let choice = Int(userChoice) {
        verifyRemovalChoice(choice)
    }
}

//This asks the user how much they want to remove and saves it
func verifyRemovalChoice(_ removeChoice: Int) {
    if removeChoice == 1 {
        print("How many cereal(s) would you like to remove?")
        if let removedQuantity = readLine(), let quantity = Int(removedQuantity) {
            updatedCartRemoval(removeChoice, quantity)
            currentStoreCerealQuantity += quantity
        }
    } else if removeChoice == 2 {
        print("How many milk(s) would you like to remove?")
        if let removedQuantity = readLine(), let quantity = Int(removedQuantity) {
            updatedCartRemoval(removeChoice, quantity)
            currentStoreMilkQuantity += quantity

        }
    } else if removeChoice == 3 {
        print("How many syrup(s) would you like to remove?")
        if let removedQuantity = readLine(), let quantity = Int(removedQuantity) {
            updatedCartRemoval(removeChoice, quantity)
            currentStoreSyrupQuantity += quantity

        }
    } else if removeChoice == 4 {
        print("How many cup(s) would you like to remove?")
        if let removedQuantity = readLine(), let quantity = Int(removedQuantity) {
            updatedCartRemoval(removeChoice, quantity)
            currentStoreCupQuantity += quantity

        }
    }
}

//this function updates their cart with the new quantity
func updatedCartRemoval(_ removeChoice: Int, _ smallerQuantity: Int) {
    if removeChoice == 1 {
        cartCerealQuantity = smallerQuantity
        print("You have removed \(smallerQuantity) cereal(s) from your cart")
    } else if removeChoice == 2 {
        cartMilkQuantity = smallerQuantity
        print("You have removed \(smallerQuantity) milk(s) from your cart")
    } else if removeChoice == 3 {
        cartSyrupQuantity = smallerQuantity
        print("You have removed \(smallerQuantity) syrup(s) from your cart")
    } else {
        cartCupQuantity = smallerQuantity
        print("You have removed \(smallerQuantity) cup(s) from your cart")
    }
}

//This allows the user to check how much is in the inventory
func checkStockMenu (){
    print ("Which item would you like to check if it's in stock? (Enter number of selection):\n",
    "1. Cereal\n",
    "2. Milk\n",
    "3. Syrup\n",
    "4. Cups\n")
    
    if let stockSelected = readLine(), let selected = Int(stockSelected) {
        verifyStockSelected(selected)
    }
}
//This is part of the previous function, it allows the user to see how much inventory is in stock based on which item they selected
func verifyStockSelected(_ selected: Int) {
    if selected == 1 {
        print("There is currently \(currentStoreCerealQuantity) cereal(s) in stock!")
    } else if selected == 2 {
        print("There is currently \(currentStoreMilkQuantity) milk(s) in stock!")
    } else if selected == 3 {
        print("There is currently \(currentStoreSyrupQuantity) syrup(s) in stock!")
    } else if selected == 4 {
        print("There is currently \(currentStoreCupQuantity) cup(s) in stock!")
    }
}

//This is adminMenu domain, asking them to put in an ID
func adminMenu() {
    print("Enter Admin ID:")
    if let adminIDInput = readLine(), let id = Int(adminIDInput) {
        checkAdminID(adminIDInput)
    }
}

//This checks if the user out in the correct ID
func checkAdminID(_ adminIDInput: String) {
    if let enteredID = Int(adminIDInput), enteredID == 2222 {
        adminControls()
    } else {
        print("Sorry wrong admin ID. Try again.")
    }
}

//This is the menu of admin controls
func adminControls(){
    print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection):\n",
          "1. Restock Inventory\n",
          "2. Generate Report\n",
          "3. Check number of items\n",
          "4. Quit admin menu"
    )
    if let controlChoice = readLine(), let controlChosen = Int(controlChoice) {
        verifyControlChosen(controlChosen)
    }
}
 
//Based on what the user put in, this will take them to the correct directory/function
func verifyControlChosen( _ controlChosen: Int){
    if controlChosen == 1 {
        restockInventory()
    } else if controlChosen == 2 {
        generateReport()
    } else if controlChosen == 3 {
        checkNumOfItems ()
    } else {
        quitMenu ()
    }
}

 //This allows the user to restock the inventory
func restockInventory(){
    print ("What would you like to restock? (Enter number of selection):\n",
            "1. Cereal\n",
            "2. Milk\n",
            "3. Syrup\n",
            "4. Cups"
            )
    if let restockChosen = readLine(), let picked = Int(restockChosen){
        verifyRestockChoice(picked)
    } else {
        print ("Invalid selection. Please enter a number")
    }
}
    
func verifyRestockChoice( _ picked: Int){
    if picked == 1 {
        print("How many units of cereal would you like to restock?:")
        if let restockValue = readLine(), let newInventory = Int(restockValue){
            currentStoreCerealQuantity += newInventory
            print("Restocked \(restockValue) units of cereal")
        }
    } else if picked == 2 {
        print("How many units of milk would you like to restock?:")
        if let restockValue = readLine(), let newInventory = Int(restockValue){
            currentStoreMilkQuantity += newInventory
            print("Restocked \(restockValue) units of milk")
        }
    } else if picked == 3 {
        print("How many units of syrup would you like to restock?:")
        if let restockValue = readLine(), let newInventory = Int(restockValue){
            currentStoreSyrupQuantity += newInventory
            print("Restocked \(restockValue) units of syrup")
        }
    } else if picked == 4 {
        print("How many units of cup would you like to restock?:")
        if let restockValue = readLine(), let newInventory = Int(restockValue){
            currentStoreCupQuantity += newInventory
            print("Restocked \(restockValue) units of cup")
        }
    }
}

//This will make a report of the remaining inventory in the store
func generateReport(){
    print("Summary Report:\n",
          "Remaining cereals: \(currentStoreCerealQuantity) items\n",
          "Remaining milks: \(currentStoreMilkQuantity) items\n",
          "Remaining syrups: \(currentStoreSyrupQuantity) items \n",
          "Remaining cups: \(currentStoreCupQuantity) items \n",
          "Remaining Inventory: \(remainingIventory) items\n",
          "Total sales: $\(String(format: "%.2f", totalSales))"
    )
}

//This does the same job of checking inventory quantities
func checkNumOfItems(){
    checkStockMenu()
}

//This resets the user back to the main menu to start over
func quitMenu (){
    print ("Returning back to the main menu")
    mainMenu()
}

//In checkout, the code will calculate the subtotal and add its tax. It prints the final total and thank you message
func checkout(){
    calculateSubTotal()
    let tax = subTotal * taxRate
    let totalCost = subTotal + tax
    totalSales += totalCost

    //This is basically the "toFixed()" function from javascript but in swift
    let totalCostRounded = String (format: "%.2f", totalCost)
    
    print( "Thank you for shopping with us!\n",
            "You purchased the following:\n",
           "Cereal(s): \(cartCerealQuantity)\n",
           "Milk(s): \(cartMilkQuantity)\n",
           "Syrup(s): \(cartSyrupQuantity)\n",
           "Cup(s): \(cartCupQuantity)\n",
           "Your grand total including tax (9.25%) is: $\(totalCostRounded)"
    )
    resetCart()
}


//This calculates everything in the cart taking the quantity and multiplying with price
func calculateSubTotal() {
    let cerealSubtotal = Double(cartCerealQuantity) * cerealPrice
    let milkSubtotal = Double(cartMilkQuantity) * milkPrice
    let syrupSubtotal = Double(cartSyrupQuantity) * syrupPrice
    let cupSubtotal = Double(cartCupQuantity) * cupPrice

    subTotal = cerealSubtotal + milkSubtotal + syrupSubtotal + cupSubtotal
}

//This resets the cart back to 0 when the user has completed checkout
func resetCart() {
    cartCerealQuantity = 0
    cartMilkQuantity = 0
    cartSyrupQuantity = 0
    cartCupQuantity = 0
}
