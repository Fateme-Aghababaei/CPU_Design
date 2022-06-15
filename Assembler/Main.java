import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Main {
    static StringBuilder sb = new StringBuilder();

    public static void main(String[] args) throws FileNotFoundException {
        File myObj = new File("input.txt");
        Scanner myReader = new Scanner(myObj);
        while (myReader.hasNextLine()) {
            String data = myReader.nextLine();
            split_input_function(data);
        }
        myReader.close();
        sb.deleteCharAt(sb.length() - 1);
        try (PrintWriter out = new PrintWriter("output.txt")) {
            out.print(sb.toString());
        }
    }

    static void split_input_function(String input) {
        String remove_comma = input.replaceAll("[,]", "");
        String[] split_input = remove_comma.split("\\s");
        instructions(split_input[0], split_input);
    }

    static void instructions(String op, String[] data) {
        switch (op) {
            case "add" -> rType(data[1], data[2], data[3], "1");
            case "sub" -> rType(data[1], data[2], data[3], "5");
            case "mult" -> rType(data[1], data[2], data[3], "2");
            case "div" -> rType(data[1], data[2], data[3], "6");
            case "and" -> rType(data[1], data[2], data[3], "8");
            case "or" -> rType(data[1], data[2], data[3], "4");
            case "sll" -> rType(data[1], data[2], data[3], "3");
            case "sra" -> rType(data[1], data[2], data[3], "7");
            case "addi" -> iType("1", data[1], data[2], data[3]);
            case "ori" -> iType("2", data[1], data[2], data[3]);
            case "andi" -> iType("3", data[1], data[2], data[3]);
            case "lw" -> {
                String data_replace = data[2].replaceAll("[(|)]", " ");
                String[] data_split = data_replace.split(" ");
                iType("4", data[1], data_split[1], data_split[0]);
            }
            case "sw" -> {
                String data_replace = data[2].replaceAll("[(|)]", " ");
                String[] data_split = data_replace.split(" ");
                iType("5", data[1], data_split[1], data_split[0]);
            }
            case "beq" -> iType("6", data[1], data[2], data[3]);
            case "bgt" -> iType("7", data[1], data[2], data[3]);
            case "jump" -> jType("8", data[1]);
        }
    }

    static void rType(String rd, String rs, String rt, String fn) {
        sb.append("0").append(registerNumber(rs)).append(registerNumber(rt)).append(registerNumber(rd)).append(Integer.toHexString(Integer.parseInt(fn))).append("\n");
    }

    static void iType(String opc, String rt, String rs, String data) {
        sb.append(Integer.toHexString(Integer.parseInt(opc))).append(registerNumber(rs)).append(registerNumber(rt)).append(Integer.toHexString(Integer.parseInt(data))).append("\n");
    }

    static void jType(String opc, String label) {
        sb.append(Integer.toHexString(Integer.parseInt(opc))).append(Integer.toHexString(Integer.parseInt(label))).append("\n");
    }

    static String registerNumber(String r) {
        String i = String.valueOf(r.charAt(1));
        return Integer.toHexString(Integer.parseInt(i));
    }
}