const std = @import("std");
const testing = std.testing;

const solutions = @import("solutions.zig");

pub fn run(allocator: std.mem.Allocator, day: u8) !void {
    switch (day) {
        1 => {
            const input = try readInput(allocator, 1);
            defer allocator.free(input);

            const part1 = try solutions.day01.solvePart1(input);
            const part2 = try solutions.day01.solvePart2(input);

            std.debug.print("Day 01\n", .{});
            std.debug.print("Part 1: {d}\n", .{part1});
            std.debug.print("Part 2: {d}\n", .{part2});
        },
        else => {
            std.debug.print("Day {d} not implemented\n", .{day});
            return error.DayNotImplemented;
        },
    }
}

fn readInput(allocator: std.mem.Allocator, day: u8) ![]const u8 {
    const input_path = try std.fmt.allocPrint(
        allocator,
        "input/2015/day{d:0>2}.txt",
        .{day},
    );
    defer allocator.free(input_path);

    const file = try std.fs.cwd().openFile(input_path, .{});
    defer file.close();

    const file_size = try file.getEndPos();
    const buffer = try allocator.alloc(u8, file_size);
    const bytes_read = try file.readAll(buffer);
    if (bytes_read != file_size) {
        allocator.free(buffer);
        return error.IncompleteRead;
    }

    return buffer;
}

test "readInput" {
    const allocator = testing.allocator;

    const input = try readInput(allocator, 1);
    defer allocator.free(input);

    try testing.expect(input.len > 0);
}

test "solve day 1" {
    const allocator = testing.allocator;

    const input = try readInput(allocator, 1);
    defer allocator.free(input);

    const part1 = try solutions.day01.solvePart1(input);
    _ = part1;
}
