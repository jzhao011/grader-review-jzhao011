import static org.junit.Assert.*;
import org.junit.*;

import java.util.*;

public class TestListExamples {
    public class ShortStringFilter implements StringChecker{
        @Override
        public boolean checkString(String s) {
            return s.length() < 3;
        }
    }

    @Test(timeout = 500)
    public void testFilter() {
        String[] input1Values = {"a", "ab", "abc", "bc", "abcdc", "d"};
        List<String> input1 = new ArrayList<>();

        for (String s: input1Values) {
            input1.add(s);
        }

        assertArrayEquals(new String[]{"a", "ab", "bc", "d"}, 
                ListExamples.filter(input1, new ShortStringFilter()).toArray());

    }

    @Test(timeout = 500)
    public void testMerge() {
        String[] input1Values = {"a", "e", "g", "l", "u"};
        String[] input2Values = {"a", "c", "f", "m", "o", "x", "y", "z"};

        List<String> input1 = new ArrayList<>();
        List<String> input2 = new ArrayList<>();

        for (String s: input1Values) {
            input1.add(s);
        }
        for (String s: input2Values) {
            input2.add(s);
        }

        assertArrayEquals(new String[]{"a", "c", "e", "f", "g", "l", "m", "o", "u", "x", "y", "z"}, 
                ListExamples.merge(input1, input2).toArray());
    }

}
