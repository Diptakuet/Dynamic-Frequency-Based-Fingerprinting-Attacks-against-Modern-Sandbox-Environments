# Python program to sort given array of string stored in a file

# Input number of strings to be inserted in file
N = int(input("Enter the number of strings: "))

# Open file for writing
with open("container_name_new.txt", "w") as f:
	# Insert the strings into file
	for i in range(N):
		name = input("Enter the string: ")
		# Writing into the file
		f.write(name + "\n")

# Open file for reading
with open("container_name.txt", "r") as f:
	# Read the lines until end of file is reached
	names = [line.strip() for line in f.readlines()]

# Sort the strings
names.sort()

# Open the file for writing
with open("file.txt", "w") as f:
	# Insert the sorted strings into the file
	for name in names:
		f.write(name + "\n")

# Print the sorted names
for name in names:
	print(name)
