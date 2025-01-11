const std = @import("std");
const testing = std.testing;

fn follow_instruction(instructions: []const u8) i32 {
    var floor: i32 = 0;
    for (instructions) |char| {
        if (char == '(') {
            floor += 1;
        } else if (char == ')') {
            floor -= 1;
        }
    }
    return floor;
}

test "example1" {
    const example1 = "))(((((";
    const floor = follow_instruction(example1);

    try testing.expectEqual(3, floor);
}

test "day01" {
    const allocator = std.heap.page_allocator;

    const input_path = "/Users/r_hasan/contests/advent-of-code-zig/input/2015/day01.txt";

    const file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();

    const input = try file.readToEndAlloc(allocator, std.math.maxInt(usize));
    defer allocator.free(input);

    const final_floor = follow_instruction(input);

    try testing.expectEqual(232, final_floor);
}
