#include <gtest/gtest.h>
#include "../src/YearConverter.h"

// 测试集: BuggyVersion
TEST(BuggyVersion, StartOfRange) {
    YearConverter converter;
    // 等价类：起点边界
    EXPECT_EQ(converter.numberToYear(0), 1980);
}

TEST(BuggyVersion, LastDayOfLeapYear) {
    YearConverter converter;
    // 等价类：闰年边界
    EXPECT_EQ(converter.numberToYear(365), 1980);
}

TEST(BuggyVersion, Day1024) {
    YearConverter converter;
    // 等价类：随意数字
    EXPECT_EQ(converter.numberToYear(1024), 1982);
}


TEST(BuggyVersion, InvalidInputThrowsException) {
    YearConverter converter;
    // 等价类：无效输入
    ASSERT_THROW(converter.numberToYear(-1), std::invalid_argument);
}

/*
// 这个测试将会暴露无限循环的bug
TEST(BuggyVersion, FirstDayAfterLeapYear) {
    YearConverter converter;
    // 等价类：闰年后的第一天
    // 这个测试会因为无限循环而卡住
    EXPECT_EQ(converter.numberToYear(366), 1981);
}

*/