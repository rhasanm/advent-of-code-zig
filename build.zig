const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Main executable
    const exe = b.addExecutable(.{
        .name = "advent-of-code-zig",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe);

    // Run command
    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the Advent of Code solution");
    run_step.dependOn(&run_cmd.step);

    // Test suite configuration
    const test_step = b.step("test", "Run all tests");

    // Main tests
    const main_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // 2015 tests
    const year2015_tests = b.addTest(.{
        .root_source_file = b.path("src/year2015/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Run commands for tests
    const run_main_tests = b.addRunArtifact(main_tests);
    const run_2015_tests = b.addRunArtifact(year2015_tests);

    // Add all test runners to test step
    test_step.dependOn(&run_main_tests.step);
    test_step.dependOn(&run_2015_tests.step);

    // Individual year test steps
    const test_2015_step = b.step("test-2015", "Run 2015 tests only");
    test_2015_step.dependOn(&run_2015_tests.step);

    // Development helpers
    const watch_test_cmd = b.addSystemCommand(&[_][]const u8{
        "zig", "build", "test", "--watch",
    });
    const watch_test_step = b.step("test-watch", "Watch and run tests on changes");
    watch_test_step.dependOn(&watch_test_cmd.step);
}
