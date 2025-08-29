#include "YearConverter.h"
#include <stdexcept>

bool YearConverter::isLeapYear(int year) const 
{
    return (year % 4 == 0 &&
            year % 100 != 0) ||
           (year % 400 == 0);
}

int YearConverter::numberToYear(int days) const 
{
    if (days < 0) 
    {
        throw std::invalid_argument("Days cannot be negative.");
    }
    
    int year = 1980; // start with 1980
    while (days > 365) 
    { 
        if (isLeapYear(year)) 
        {
            if (days >= 366) 
            {
                days -= 366;
                year++;
            }
        } 
        else 
        {
            days -= 365;
            year++; 
        }
    }
    return year; 
}
