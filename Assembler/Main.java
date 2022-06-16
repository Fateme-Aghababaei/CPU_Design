import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

public class Main {
    static StringBuilder sb = new StringBuilder();

    static StringBuilder tmp = new StringBuilder();

    public static void main(String[] args) throws FileNotFoundException {
        sb.append("v2.0 raw\n");
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
        tmp.setLength(0);
        String rdformat = String.format("%04d", Integer.parseInt(registerNumber(rd)));
        String rsformat = String.format("%04d", Integer.parseInt(registerNumber(rs)));
        String rtformat = String.format("%04d", Integer.parseInt(registerNumber(rt)));
        String fnformat = String.format("%06d", Integer.parseInt(Integer.toBinaryString(Integer.parseInt(fn))));
        tmp.append("000000").append(rsformat).append(rtformat).append(rdformat).append(fnformat);
        sb.append(binaryToHex(String.valueOf(tmp))).append("\n");
    }

    static void iType(String opc, String rt, String rs, String data) {
        tmp.setLength(0);
        String opformat = String.format("%06d", Integer.parseInt(Integer.toBinaryString(Integer.parseInt(opc))));
        String rsformat = String.format("%04d", Integer.parseInt(registerNumber(rs)));
        String rtformat = String.format("%04d", Integer.parseInt(registerNumber(rt)));
        String dtformat = String.format("%010d", Integer.parseInt(Integer.toBinaryString(Integer.parseInt(data))));
        tmp.append(opformat).append(rsformat).append(rtformat).append(dtformat);
        sb.append(binaryToHex(String.valueOf(tmp))).append("\n");
    }

    static void jType(String opc, String label) {
        tmp.setLength(0);
        String opformat = String.format("%06d", Integer.parseInt(Integer.toBinaryString(Integer.parseInt(opc))));
        String dtformat = String.format("%018d", Integer.parseInt(Integer.toBinaryString(Integer.parseInt(label))));
        tmp.append(opformat).append(dtformat);
        sb.append(binaryToHex(String.valueOf(tmp))).append("\n");
    }

    static String registerNumber(String r) {
        String i = String.valueOf(r.charAt(1));
        return Integer.toBinaryString(Integer.parseInt(i));
    }

    private static String binaryToHex(String binary) {
        int number;
        number = Integer.parseInt(binary, 2);
        return Integer.toHexString(number);
    }
}