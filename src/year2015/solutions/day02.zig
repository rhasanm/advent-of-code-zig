const std = @import("std");
const testing = std.testing;

fn bad_instruction_position(instructions: []const u8) usize {
    var floor: i32 = 0;
    const basement = -1;
    for (instructions, 1..) |char, i| {
        if (char == '(') {
            floor += 1;
            if (floor == basement) {
                return i;
            }
        } else if (char == ')') {
            floor -= 1;
            if (floor == basement) {
                return i;
            }
        }
    }
    return 1;
}

test "day02Example2" {
    const input = "()())";
    const position = bad_instruction_position(input);

    try testing.expectEqual(5, position);
}

test "day02" {
    const allocator = std.heap.page_allocator;

    const input_path = "/Users/r_hasan/contests/advent-of-code-zig/input/2015/day01.txt";

    const file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();

    const input = try file.readToEndAlloc(allocator, std.math.maxInt(usize));
    defer allocator.free(input);

    const position = bad_instruction_position(input);

    try testing.expectEqual(1783, position);
}
