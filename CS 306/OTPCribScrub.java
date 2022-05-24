import java.util.HashMap;
import java.util.List;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.ArrayList;


public class OTPCribScrub {
    static PrintStream output;

    static String c1 = "2d0a0612061b0944000d161f0c1746430c0f0952181b004c1311080b4e07494852";
    static String c2 = "200a054626550d051a48170e041d011a001b470204061309020005164e15484f44";
    static String c3 = "3818101500180b441b06004b11104c064f1e0616411d064c161b1b04071d460101";
    static String c4 = "200e0c4618104e071506450604124443091b09520e125522081f061c4e1d4e5601";
    static String c5 = "304f1d091f104e0a1b48161f101d440d1b4e04130f5407090010491b061a520101";
    static String c6 = "2d0714124f020111180c450900595016061a02520419170d1306081c1d1a4f4601";
    static String c7 = "351a160d061917443b3c354b0c0a01130a1c01170200191541070c0c1b01440101";
    static String c8 = "3d0611081b55200d1f07164b161858431b0602000454020d1254084f0d12554249";
    static String c9 = "340e0c040a550c1100482c4b0110450d1b4e1713185414181511071b071c4f0101";
    static String c10 = "2e0a5515071a1b081048170e04154d1a4f020e0115111b4c151b492107184e5201";
    static String c11 = "370e1d4618104e05060d450f0a104f044f080e1c04540205151c061a1a5349484c";

    static String bc1,bc2,bc3,bc4,bc5,bc6,bc7,bc8,bc9,bc10,bc11 = "";

    static int numChars = 33;
    static int numMsgs = 11;
    
    static HashMap<Character,String> hexToBin = new HashMap<Character,String>();
    static HashMap<String,Character> binToHex = new HashMap<String,Character>();

    static String[] cArray = {c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11};
    static String[] bcArray = new String[11]; //Fill in init
    
    //Unsure whether key should be english (char) or hex or binary
    //static HashMap<Integer,Character> key = new HashMap<Integer,Character>();
    //Integer represents 8-bit block of a single char (33 ints) indexed starting at 0
    static HashMap<Integer,List<String>> keyBin = new HashMap<Integer,List<String>>();

    public static void init() {
        hexToBin.put('0', "0000");
        hexToBin.put('1', "0001");
        hexToBin.put('2', "0010");
        hexToBin.put('3', "0011");
        hexToBin.put('4', "0100");
        hexToBin.put('5', "0101");
        hexToBin.put('6', "0110");
        hexToBin.put('7', "0111");
        hexToBin.put('8', "1000");
        hexToBin.put('9', "1001");
        hexToBin.put('a', "1010");
        hexToBin.put('b', "1011");
        hexToBin.put('c', "1100");
        hexToBin.put('d', "1101");
        hexToBin.put('e', "1110");
        hexToBin.put('f', "1111");

        binToHex.put("0000", '0');
        binToHex.put("0001", '1');
        binToHex.put("0010", '2');
        binToHex.put("0011", '3');
        binToHex.put("0100", '4');
        binToHex.put("0101", '5');
        binToHex.put("0110", '6');
        binToHex.put("0111", '7');
        binToHex.put("1000", '8');
        binToHex.put("1001", '9');
        binToHex.put("1010", 'a');
        binToHex.put("1011", 'b');
        binToHex.put("1100", 'c');
        binToHex.put("1101", 'd');
        binToHex.put("1110", 'e');
        binToHex.put("1111", 'f');

        bc1 = hexToBin(c1);
        bc2 = hexToBin(c2);
        bc3 = hexToBin(c3);
        bc4 = hexToBin(c4);
        bc5 = hexToBin(c5);
        bc6 = hexToBin(c6);
        bc7 = hexToBin(c7);
        bc8 = hexToBin(c8);
        bc9 = hexToBin(c9);
        bc10 = hexToBin(c10);
        bc11 = hexToBin(c11);

        bcArray[0] = bc1;
        bcArray[1] = bc2;
        bcArray[2] = bc3;
        bcArray[3] = bc4;
        bcArray[4] = bc5;
        bcArray[5] = bc6;
        bcArray[6] = bc7;
        bcArray[7] = bc8;
        bcArray[8] = bc9;
        bcArray[9] = bc10;
        bcArray[10] = bc11;

        try {
            output = new PrintStream("output.txt");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        System.setOut(output);
    }

    public static String hexToBin(String hex) {
        String bin = "";
        for(int i=0; i<hex.length(); i++) {
            bin+=hexToBin.get(hex.charAt(i));
        }
        return bin;
    }

    public static String binToHex(String bin) {
        String hex = "";
        for(int i=0; i<bin.length(); i+=4) {
            hex+=binToHex.get(bin.substring(i, i+4));
        }
        return hex;
    }

    public static String strToBin(String str) {
        String bin = "";
        String binI = "";
        for(int i=0; i<str.length(); i++) {
            binI = Integer.toBinaryString(str.charAt(i));
            while(binI.length()<8) {
                binI = "0" + binI;
            }
            bin+=binI;
        }
        return bin;
    }

    public static String binToStr(String bin) {
        String str = "";
        for(int i=0; i<bin.length(); i+=8) {
            str+=(char) Integer.parseInt(bin.substring(i,i+8),2);
        }
        return str;
    }

    /*
    public int binToDecSingle(String bin) {
        int dec = 0;
        for(int i=0; i<bin.length(); i+=8) {
            decI = Integer.parseInt(bin.substring(i,i+8),2);
        }
        return decI;
    }
    */

    public static String binXOR(String a, String b) {
        String aXb = "";      
        for(int i=0; i<Math.min(a.length(),b.length()); i++) {
            if(a.charAt(i)==b.charAt(i)) {
                aXb+="0";
            } else {
                aXb+="1";
            }
        }
        return aXb;
    }

    public static boolean validChar(int ch) {
        if(ch>=65 && ch<=90) {
            return true;
        } else if(ch>=97 && ch<=122) {
            return true;
        } else if((ch==32) || (ch==33) || (ch==44) || (ch==46) || (ch==63)) {
            return true;
        } else {
            return false;
        }
    }

    //end is EXCLUSIVE
    public static boolean validKey(String keyBin, int start, int end) {
        //Debugging
        String tag = "Valid Key Check:";
        System.out.print(tag+"\nkey: "+keyBin
                            +"\nstart: "+start
                            +"\nend: "+end+"\n\n");
        //check if XORing keyBin with ALL ciphertexts at specified start & end produces valid plaintext
        boolean valid = true;
        int ctr = 0;
        int index = 0;
        String bXi = "";
        int ch = 0;
        //breaks when execution hits invalid char or finished looping
        while(valid && ctr<11) {
            index = 0;
            //XOR chars to dec individually
            for(int i=start; i<end; i+=8) {
                //Debugging
                System.out.print(tag+"\nctr: "+ctr
                                    +"\nbc char: "+bcArray[ctr].substring(i,i+8)
                                    +"\nKey char: "+keyBin.substring(index,index+8));
                bXi = binXOR(bcArray[ctr].substring(i,i+8),keyBin.substring(index,index+8));
                ch = Integer.parseInt(bXi,2);
                //Debugging
                System.out.print("\nbXi: "+bXi
                                +"\ndec: "+ch);
                //Check for validity
                if(!validChar(ch)) {
                    valid = false;
                    //Debugging
                    System.out.println("\nValid: "+valid+"\n");
                    break;
                }
                index+=8;
                //Debugging
                System.out.println("\nValid: "+valid+"\n");
            }
            ctr++;
        }
        return valid;
    }

    /*
    bca = first binary ciphertext
    bcb = second binary ciphertext
    word should be in ASCII chars
    */
    public static List<List<String>> cribScrub(String bca, String bcb, String wordOne) {
        //Debugging
        String tag = "Crib Scrub: ";
        //starting index, ending index (exclusive), possible key #1/#2 (bin) (if valid)
        List<List<String>> results = new ArrayList<>();
        String bcX = binXOR(bca,bcb);
        String wordOneBin = strToBin(wordOne);
        String bXi = ""; //binXOR of a single character from cX and word
        String keyOne,keyTwo = ""; //2 possible keys that result from valid XOR result
        //String wordTwoBin = ""; //full binXOR of substring of cX and word
        int ch = 0; //dec of bXi
        boolean valid = true;
        //Debugging
        System.out.print(tag+"\nCiphertext A: "+bca+"\nLength of Ciphertext A: "+bca.length()
                            +"\nCiphertext B: "+bcb+"\nLength of Ciphertext B: "+bcb.length()
                            +"\nWord: "+wordOneBin+"\nLength of Word: "+wordOneBin.length()
                            +"\nXOR of Ciphertexts: "+bcX+"\nLength of XOR of Ciphertexts: "+bcX.length()+"\n\n");
        //Loop through all possible positions word can be XOR'd with cX
        //NOTE: Every char is 8 bits long, increment by 8
        for(int i=0; i<bcX.length()-wordOneBin.length()+1; i+=8) {
            valid = true;
            //XOR chars to dec individually
            for(int j=0; j<wordOneBin.length(); j+=8) {
                //Debugging
                System.out.print(tag+"\nbcX char: "+bcX.substring(i+j,i+j+8)
                                    +"\nWord char: "+wordOneBin.substring(j,j+8));
                bXi = binXOR(bcX.substring(i+j,i+j+8),wordOneBin.substring(j,j+8));
                ch = Integer.parseInt(bXi,2);
                //Debugging
                System.out.print("\nbXi: "+bXi
                                +"\ndec: "+ch);
                //Check for validity
                if(!validChar(ch)) {
                    valid = false;
                    //Debugging
                    System.out.println("\nValid: "+valid+"\n");
                    //wordTwoBin = "";
                    break;
                } /* else {
                    wordTwoBin+=bXi;
                }
                */
                //Debugging
                System.out.println("\nValid: "+valid+"\n");
            }
            //Debugging
            System.out.println(tag+"\nValid: "+valid+"\n");
            //Determine whether to add
            if(valid) {
                //validate both keys against all ciphertexts
                keyOne = binXOR(wordOneBin,bca.substring(i,i+wordOneBin.length()));
                if(validKey(keyOne,i,i+wordOneBin.length())) {
                    List<String> result = new ArrayList<>();
                    result.add(Integer.toString(i));
                    result.add(Integer.toString(i+wordOneBin.length()));
                    result.add(keyOne);
                    //Debugging
                    System.out.println(tag+"{"+Integer.toString(i)+", "+Integer.toString(i+wordOneBin.length())+", "+keyOne+"}\n");
                    results.add(result);
                }
                keyTwo = binXOR(wordOneBin,bcb.substring(i,i+wordOneBin.length()));
                if(validKey(keyTwo,i,i+wordOneBin.length())) {
                    List<String> result = new ArrayList<>();
                    result.add(Integer.toString(i));
                    result.add(Integer.toString(i+wordOneBin.length()));
                    result.add(keyTwo);
                    //Debugging
                    System.out.println(tag+"{"+Integer.toString(i)+", "+Integer.toString(i+wordOneBin.length())+", "+keyTwo+"}\n");
                    results.add(result);
                }
            }    
            //Debugging
            System.out.println();
        }
        return results;
    }

    public static void updateKey(List<List<String>> keyBinFrags) {
        //Debugging
        String tag = "Update Key: ";
        System.out.println(tag+"Number of Fragments: "+keyBinFrags.size()+"\n");
        List<String> keyBinFrag = new ArrayList<>();
        int start,end,index = 0;
        String frag = "";
        //Loop through all key fragments
        for(int i=0; i<keyBinFrags.size(); i++) {
            //Get the key fragment
            keyBinFrag = keyBinFrags.get(i);
            //Set indices based on char (33)
            start = Integer.parseInt(keyBinFrag.get(0))/8;
            end = Integer.parseInt(keyBinFrag.get(1))/8;
            frag = keyBinFrag.get(2);
            index = 0;
            System.out.println(tag+"\nFragment #: "+(i+1)
                                  +"\nStart: "+start
                                  +"\nEnd: "+end
                                  +"\nKey Fragment: "+frag+"\n");
            //Update each char individually
            for(int j=start; j<end; j++) {
                List<String> value = new ArrayList<>();
                String fragChar = frag.substring(index*8,(index+1)*8);
                //Check if specific char mapping exists
                //if not, create new mapping
                if(!keyBin.containsKey(j)) {
                    value.add(fragChar);
                    keyBin.put(j,value);
                } else { //otherwise, add the fragment to the list in the existing mapping
                    value = keyBin.get(j);
                    //check for duplicate
                    if(!value.contains(fragChar)) {
                        value.add(fragChar);
                        keyBin.replace(j,value);
                    } 
                }
                index++;
                //Debugging
                System.out.print(tag+"{"+j+", ");
                printList(value, false);
                System.out.println("}\n");
            }
        }
    }


    public static void fillKey() {
        for(int i=0; i<numChars; i++) {
            if(!keyBin.containsKey(i)) {
                List<String> value = new ArrayList<>();
                value.add("00000000");
                keyBin.put(i,value);
            }
        }
    }

    public static void getAllKeysRecursive(List<String> keys, int depth, String currentKey) {
        //Debugging
        String tag = "Get All Keys Recursion: ";
        System.out.println(tag+"\nDepth: "+depth);
        if(depth==numChars) {
            //Debugging
            System.out.println("Added Key: "+currentKey
                              +"\nKey Length: "+currentKey.length()
                              +"\nKeys Added: "+(keys.size()+1)+"\n");
            keys.add(currentKey);
            return;
        }
        //Debugging
        System.out.println(tag+"\nBuilding Keys: ");
        for(int i=0; i<keyBin.get(depth).size(); i++) {
            //Debugging
            System.out.println("Depth: "+depth
                              +"\nIteration: "+i
                              +"\nKey In Progress: "+currentKey
                              +"\nKey Length: "+currentKey.length()+"\n");
            getAllKeysRecursive(keys, depth+1, currentKey+keyBin.get(depth).get(i));
        }
        //Debugging
        System.out.println("\n");
    }
    
    public static List<String> getAllKeys() {
        String tag = "Get All Keys: ";
        List<String> keys = new ArrayList<>();
        //Debugging
        long ev = getCombos();
        getAllKeysRecursive(keys,0,"");
        //Debugging
        System.out.println(tag+"\nExpected Value: "+Long.toString(ev)
                              +"\nActual Value: "+keys.size());
        return keys;
    }

    public static List<List<String>> decryptAll(String key) {
        //Debugging
        String tag = "Decrypt All: ";
        System.out.println(tag);
        List<List<String>> plainTexts = new ArrayList<>();
        String plainTextBin,plainTextEnglish = "";
        //Decrypt each ciphertext iteratively
        for(int i=0; i<numMsgs; i++) {
            //{key (binary), plainTextBin, plainText}
            List<String> plainText = new ArrayList<>();
            plainText.add(key);
            plainTextBin = binXOR(bcArray[i],key);
            plainText.add(plainTextBin);
            plainTextEnglish = binToStr(plainTextBin);
            plainText.add(plainTextEnglish);
            //Debugging
            System.out.println("\n\nMessage #: "+(i+1)
                              +"\nKey: ");
            printKeySegmented(key);
            System.out.println("Plaintext (bin): "+plainTextBin
                              +"\nPlaintext: "+plainTextEnglish+"\n");
        }
        return plainTexts;
    }

    //Debugging method
    public static long getCombos() {
        String tag = "List Lengths: ";
        System.out.println(tag);
        long total = 0;
        for(int i=0; i<numChars; i++) {
            System.out.println("{"+Integer.toString(i)+", "+Integer.toString(keyBin.get(i).size())+"}");
            total*=keyBin.get(i).size();
        }
        System.out.println("Total Keys: "+Long.toString(total));
        return total;
    }

    //Debugging method
    public static void printKey() {
        for(int i=0; i<33; i++) {
            if(keyBin.containsKey(i)) {
                System.out.print("{"+i+", ");
                printList(keyBin.get(i), false);
                System.out.print("}\n");
            }
        }
    }

    //Debugging method
    public static void printKeySegmented(String key) {
        for(int i=0; i<key.length(); i+=8) {
            System.out.println((i/8)+": "+key.substring(i,i+8));
        } 
    }

    //Debugging method
    public static void printList(List<String> list, boolean newLine) {
        if(list.size()>0) {
            if(!newLine) {
                System.out.print("{");
            }
            for(int j=0; j<list.size()-1; j++) {
                System.out.print(list.get(j));
                if(newLine) {
                    System.out.println();
                } else {
                    System.out.print(", ");
                }
            }
            System.out.print(list.get(list.size()-1));
            if(!newLine) {
                System.out.print("}");
            }
        }
    }

    //Debugging Method
    public static void printNestedList(List<List<String>> lists, boolean newLine) {
        List<String> list = new ArrayList<String>();
        for(int i=0; i<lists.size(); i++) {
            list = lists.get(i);
            printList(list, newLine);
            System.out.println();  
        }
    }

    public static void main(String[] args) {
        init();
        //Add any words to words to test
        List<String> words = new ArrayList<>();
        /**
         * perfect
         * Nikos
         * we are
         */
        words.add("Testing testing can you read this");
        
        //Automated
        for(int i=0; i<words.size(); i++) {
            //Simplify things (and save memory) by performing crib scrub on only 1 XOR
            // List<List<String>> possibleKeyFragments = cribScrub(bcArray[0], bcArray[1], words.get(i));
            // System.out.println(possibleKeyFragments.size());
            // printNestedList(possibleKeyFragments, false);
            // System.out.println();
            // updateKey(possibleKeyFragments);
            // printKey();s

            /**for loop below is the PROPER way to check for all possible key fragments by
             * finding all XOR combinations between ciphertexts
             * However, java heap space cannot support this
            */
            for(int j=0; j<bcArray.length-1; j+=2) {
                List<List<String>> possibleKeyFragments = cribScrub(bcArray[j], bcArray[j+1], words.get(i));
                System.out.println(possibleKeyFragments.size());
                printNestedList(possibleKeyFragments, false);
                System.out.println();
                updateKey(possibleKeyFragments);
                printKey();
            }
            if(bcArray.length%2==1) {
                List<List<String>> possibleKeyFragments = cribScrub(bcArray[bcArray.length-1], bcArray[0], words.get(i));
                System.out.println(possibleKeyFragments.size());
                printNestedList(possibleKeyFragments, false);
                System.out.println();
                updateKey(possibleKeyFragments);
                printKey();
            }
        }

        fillKey();
        printKey();

        /** The following line uses the most memory and causes the program to take a while to run
         * Alternative option to running this line is viewing the results from printKey and
         * MANUALLY entering the key in the for loop using decryptAll
         */
        //Automated line
        List<String> allKeys = getAllKeys();
        //Manual line
        //String key = ""; //enter key in quotes, may also use hexToBin or strToBin function but key must be in binary

        List<List<String>> plainTexts = new ArrayList<>();
        for(int i=0; i<allKeys.size(); i++) {
            //Automated line
            plainTexts.addAll(decryptAll(allKeys.get(i)));
            //Manual line
            //plainTexts.addAll(decryptAll(key));
        }
        
        System.out.println("\nKey (bin): " +"011110010110111101110101011001100110111101110101011011100110010001110100011010000110010101101011011001010111100100100001011000110110111101101110011001110111001001100001011101000111010101101100011000010111010001101001011011110110111001110011001000010010000100100001");
        System.out.println("Key (chars): "+binToStr("011110010110111101110101011001100110111101110101011011100110010001110100011010000110010101101011011001010111100100100001011000110110111101101110011001110111001001100001011101000111010101101100011000010111010001101001011011110110111001110011001000010010000100100001"));

        output.close();
    }
}