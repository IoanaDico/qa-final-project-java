package com.IoanaDico.homework;

import java.util.Scanner;

public class UsernameValidator {
   public static void main(String[] args) {
       Scanner scanner = new Scanner(System.in);
       String username;
       boolean valid;

       do {
           System.out.print("Introduceti username-ul: ");
           username = scanner.nextLine();
           valid = true;

           boolean containsWhitespace = false;
           boolean containsDigit = false;
           for (int i = 0; i < username.length(); i++) {
               char character = username.charAt(i);

               if (Character.isWhitespace(character)) {
                   containsWhitespace = true;
                   break;
               }
               if (character >= '0' && character <= '9') {
                   containsDigit = true;
               }
           }

           if (containsWhitespace) {
               System.out.println("Eroare: Username-ul nu trebuie sa contina spatii.");
               valid = false;
               continue;
           }

           if (username.length() < 6 || username.length() > 12) {
               System.out.println("Eroare: Username-ul trebuie sa aiba intre 6 si 12 caractere.");
               valid = false;
           } else if (!containsDigit) {
               System.out.println("Eroare: Username-ul trebuie sa contina cel putin o cifra.");
               valid = false;
           }
       } while (!valid);

       System.out.println("Username acceptat: " + username);
   }
}