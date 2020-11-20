#include <iostream>
#include <iomanip>
#include <fstream>
#include <malloc.h>
#include <stdio.h>

std::string logLevel = "u";

void convert(long long num) {

   char arr[100];

   int i = 0;

   while(num!=0) {

      int temp = 0;
      temp = num % 16;

      if(temp < 10) {

         arr[i] = temp + 48;
         i++;

      } else {

         arr[i] = temp + 55;
         i++;

      }

      num = num/16;
   }

   for(int j=i-1; j>=0; j--)
   std::cout << arr[j];

   std::cout << std::endl;
}

void hash(long long hasher) {

	long long retre2;
	long long retre;

	if (hasher<0)hasher=-hasher; 

	retre = hasher * 5;

	if (logLevel == "d" || logLevel == "donly")
		std::cout << "hasher * 5 = " << retre << std::endl;

	retre = retre % 16777215;

	if (logLevel == "d" || logLevel == "donly")
		std::cout << "retre % 16777215 = " << retre << std::endl;

	retre2 = retre / 2;

	if (logLevel == "d" || logLevel == "donly")
		std::cout << "retre2 = retre / 3 = " << retre2 << std::endl;


	retre = retre * retre2;

	if (logLevel == "d" || logLevel == "donly")
		std::cout << "retre = retre * retre2 = " << retre << std::endl;

	retre = retre % 4294967295;

	if (logLevel == "d" || logLevel == "donly")
		std::cout << "retre % 42949672955 = " << retre << std::endl;

	if (!(logLevel == "fonly") && !(logLevel == "donly"))
		std::cout << std::setfill('0') << std::setw(12) << retre << std::endl;

}

int main (int argc, char** argv) {

	--argc;

	long long hashing = 0;

	if (argc > 0) {
		
		if (argc >= 2) 
			logLevel = argv[2];
		

		std::string fileFullPath = argv[1];

		if (logLevel == "d" || logLevel == "donly")
			std::cout << "filepath : " << fileFullPath << std::endl;
	
		std::fstream file(fileFullPath,std::ios::in | std::ios::out | std::ios::binary);
	
		file.seekg(0, std::ios::end);
	
		long long fileLength = file.tellg();
	
		file.seekg(0, std::ios::beg);
	
		char x;
		
		if (logLevel == "d" || logLevel == "donly")
			std::cout << "bytes in the file : " << fileLength << std::endl;
	
		

		for (int i = 0; i < fileLength; i++) {
	
			file.read(&x, 1);

			if (logLevel == "f" || logLevel == "fonly")
				std::cout << x;

			hashing += x;		
	
		}

		if (logLevel == "d" || logLevel == "donly")
			std::cout << "value from adding up every single chrachters ascii value together : " << hashing << std::endl;

		hash(hashing);

	} else {
	
		std::cout << "No arguments." << std::endl;
	
	}


}
