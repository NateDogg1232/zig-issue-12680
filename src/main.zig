const std = @import("std");

pub extern fn c_func() callconv(.C) void;

pub fn main() anyerror!void {
    c_func();
}

pub export fn testFunc() callconv(.C) void {
    std.debug.print("func", .{});
}

comptime {
    @export(testFunc, .{ .name = "test_func", .linkage = .Strong });
}
