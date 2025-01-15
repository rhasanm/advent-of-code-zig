const std = @import("std");
const testing = std.testing;

const utils = @import("../solutions.zig").utils;

const DayError = error{
    InvalidChar,
    NoBasementFound,
} || utils.SolutionError;

pub fn solvePart1(input: []const u8) DayError!i32 {
    return calculateFinalFloor(input);
}

pub fn solvePart2(input: []const u8) DayError!usize {
    return findBasementPosition(input);
}

fn calculateFinalFloor(instructions: []const u8) DayError!i32 {
    var floor: i32 = 0;

    for (instructions) |char| {
        switch (char) {
            '(' => floor += 1,
            ')' => floor -= 1,
            else => return DayError.InvalidChar,
        }
    }

    return floor;
}

fn findBasementPosition(instructions: []const u8) DayError!usize {
    var floor: i32 = 0;
    const basement: i32 = -1;

    for (instructions, 1..) |char, position| {
        switch (char) {
            '(' => floor += 1,
            ')' => floor -= 1,
            else => return DayError.InvalidChar,
        }

        if (floor == basement) {
            return position;
        }
    }

    return DayError.NoBasementFound;
}

test "part 1 example" {
    const inputs = .{
        .{ "(())", 0 },
        .{ "()()", 0 },
        .{ "(((", 3 },
        .{ "(()(()(", 3 },
        .{ "))(((((", 3 },
        .{ "())", -1 },
        .{ "))(", -1 },
        .{ ")))", -3 },
        .{ ")())())", -3 },
    };

    inline for (inputs) |case| {
        const result = try calculateFinalFloor(case[0]);
        try testing.expectEqual(case[1], result);
    }
}

test "part 1 solution" {
    // Using hardcoded result to avoid loading input file in tests
    const expected: i32 = 232;
    const result = try solvePart1(input_test);
    try testing.expectEqual(expected, result);
}

test "part 2 example" {
    const input = "()())";
    const expected: usize = 5;
    const result = try findBasementPosition(input);
    try testing.expectEqual(expected, result);
}

test "part 2 solution" {
    // Using hardcoded result to avoid loading input file in tests
    const expected: usize = 1783;
    const result = try solvePart2(input_test);
    try testing.expectEqual(expected, result);
}

// Test input - normally this would be read from a file, but included here for completeness
const input_test = @embedFile("../../../input/2015/day01.txt");
