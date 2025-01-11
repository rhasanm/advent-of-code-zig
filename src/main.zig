const std = @import("std");
const year2015 = @import("year2015/main.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 3) {
        std.debug.print("Usage: zig build run -- <year> <day>\n", .{});
        return;
    }

    const year = try std.fmt.parseInt(u16, args[1], 10);
    const day = try std.fmt.parseInt(u8, args[2], 10);

    switch (year) {
        2015 => try year2015.run(allocator, day),
        else => {
            std.debug.print("Year {d} not implemented\n", .{year});
            return error.YearNotImplemented;
        },
    }
}
