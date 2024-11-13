import random



# class Course:
#     def __init__(self):
#         self.name = name
#         self.credit_hours = credit_hours
#         self.letter_grade = letter_grade

# class Student:

def student_record():
    student_information = input("Enter Full Name, Email, Major, ID: ")
    number_of_courses = input("How many courses do you want to add (2-6): ")
    while (not number_of_courses.isdigit() or int(number_of_courses) < 2 or int(number_of_courses) > 6):
        number_of_courses = input("Invalid input. How many courses do you want to add (2-6):")

    number_of_courses = int(number_of_courses)

    for courses in range(number_of_courses ):
        print(f"For course {courses + 1}:")
        input_string = input("Enter course name, credit hours, and letter grade (Separated by commas): ")
    return


def lottery_number_generator ():
    return

def pig_latin():
    return

def rock_paper_scissors():
    return

def main():
    menu = ("Welcome to the CSC115 final project.\n"
                 "Enter 1 to Student Record \n"
                 "Enter 2 for Lotter Number Generator \n"
                 "Enter 3 for Pig Latin \n"
                 "Enter 4 for Rock, Paper, Scissors \n")

    print(menu)
    input_choice = input("Enter menu option 1,2,3,4, or 9 to exit: ")

    while (input_choice != "9"):
        #If option 1, display student record
        if (input_choice == "1"):
            student_record()
        #If option 2, generate random lottery number
        elif (input_choice == "2"):
            lottery_number_generator()
        #If option 3, read pig latin
        elif (input_choice == "3"):
            pig_latin()
        #If option 4, execute rock paper scissors game
        elif (input_choice == "4"):
            rock_paper_scissors()
        #If an invalid option is entered, re-enter input.
        else:
            print(f"User select option: {input_choice} which is an INVALID option. Please re-enter:")

        #Display the menu again and ask for new input.
        print("=" * 50)
        print(menu)
        input_choice = input("Enter your choice: ")

    #Exit program once option 9 is elected.
    print("User selection option 9: which is an Exit Program."
      "\nCSC115- Final Project Ended."
      "\nHope you enjoy this Python program."
      "\nGoodbye.")
    print("*" * 50)



if __name__ == '__main__':
    main()
