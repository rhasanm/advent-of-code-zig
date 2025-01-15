const std = @import("std");

pub const day01 = @import("solutions/day01.zig");
pub const day02 = @import("solutions/day02.zig");

test {
    // Import and run tests from all solution modules
    std.testing.refAllDecls(@This());
}

// Testing helper functions that can be used across days
pub const testing = struct {
    pub fn expectEqualDay(
        comptime T: type,
        expected: T,
        actual: T,
        day: u8,
        part: u8,
    ) !void {
        _ = part; // autofix
        _ = day; // autofix
        try std.testing.expectEqual(
            expected,
            actual,
        );
    }

    pub fn readTestInput(allocator: std.mem.Allocator, day: u8) ![]const u8 {
        const input_path = try std.fmt.allocPrint(
            allocator,
            "test/fixtures/2015/day{d:0>2}.txt",
            .{day},
        );
        defer allocator.free(input_path);

        const file = try std.fs.cwd().openFile(input_path, .{});
        defer file.close();

        const content = try file.readToEndAlloc(allocator, std.math.maxInt(usize));
        return content;
    }
};

// Common utilities that might be useful across multiple days
pub const utils = struct {
    // Parse a list of integers from a string
    pub fn parseNumberList(
        allocator: std.mem.Allocator,
        input: []const u8,
        delimiter: []const u8,
    ) !std.ArrayList(i64) {
        var list = std.ArrayList(i64).init(allocator);
        errdefer list.deinit();

        var iter = std.mem.split(u8, input, delimiter);
        while (iter.next()) |num_str| {
            const num = try std.fmt.parseInt(i64, std.mem.trim(u8, num_str, " \n\r\t"), 10);
            try list.append(num);
        }

        return list;
    }

    // Split a string into lines
    pub fn getLines(
        allocator: std.mem.Allocator,
        input: []const u8,
    ) !std.ArrayList([]const u8) {
        var lines = std.ArrayList([]const u8).init(allocator);
        errdefer lines.deinit();

        var iter = std.mem.split(u8, input, "\n");
        while (iter.next()) |line| {
            const trimmed = std.mem.trim(u8, line, " \r\t");
            if (trimmed.len > 0) {
                try lines.append(trimmed);
            }
        }

        return lines;
    }

    // Common error set for solutions
    pub const SolutionError = error{
        InvalidInput,
        NoSolution,
        OutOfMemory,
    };
};

// Common constants that might be needed across days
pub const constants = struct {
    pub const MAX_INPUT_SIZE = 1024 * 1024; // 1MB
    pub const MAX_LINE_LENGTH = 1024;
    pub const MAX_ITERATIONS = 1000000;
};
