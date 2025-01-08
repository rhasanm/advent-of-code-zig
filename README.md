# Advent of Code Zig Solutions

This repository contains my solutions to the Advent of Code problems, written in Zig. The project is structured to support development, testing, benchmarking, performance analysis, and visualization.

## Project Structure

```plaintext
advent-of-code-zig/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/
│       ├── ci.yml
│       ├── release.yml
│       ├── security.yml
│       ├── performance.yml
│       └── docs.yml
├── .vscode/
│   ├── settings.json
│   ├── tasks.json
│   └── launch.json
├── src/
│   ├── common/
│   │   ├── parsing.zig
│   │   ├── grid.zig
│   │   ├── math.zig
│   │   └── testing.zig
│   ├── year2023/
│   │   ├── solutions/
│   │   │   ├── day01.zig
│   │   │   └── day02.zig
│   │   ├── main.zig
│   │   └── solutions.zig
│   ├── year2022/
│   ├── platform/
│   │   ├── windows.zig
│   │   ├── linux.zig
│   │   └── darwin.zig
│   └── main.zig
├── bench/
│   ├── bench.zig
│   └── benchmarks/
│       ├── year2023/
│       │   └── day01_bench.zig
│       └── year2022/
│           └── day01_bench.zig
├── fuzz/
│   ├── fuzz.zig
│   └── fuzzers/
│       ├── year2023/
│       │   └── day01_fuzz.zig
│       └── year2022/
│           └── day01_fuzz.zig
├── tools/
│   ├── scripts/
│   │   ├── new-day.zig
│   │   ├── benchmark.zig
│   │   └── generate-docs.zig
│   ├── lint/
│   │   └── custom-checks.zig
│   ├── test/
│   │   ├── coverage.zig
│   │   └── runner.zig
│   ├── perf/
│   │   ├── trace.zig
│   │   └── analyze.zig
│   ├── debug/
│   │   ├── heap.zig
│   │   └── logger.zig
│   ├── release/
│   │   ├── changelog.zig
│   │   └── versioning.zig
│   └── ci/
│       ├── metrics.zig
│       └── report.zig
├── input/
│   ├── 2023/
│   │   ├── day01.txt
│   │   └── day01_test.txt
│   └── 2022/
├── deps/
│   └── helpful-lib/
├── docs/
│   ├── api/
│   ├── algorithms/
│   ├── performance/
│   ├── design/
│   └── tutorials/
├── examples/
│   ├── algorithms/
│   ├── optimizations/
│   └── patterns/
├── test/
│   ├── integration/
│   ├── benchmark/
│   ├── fuzz/
│   └── fixtures/
├── profile/
│   ├── memory/
│   ├── cpu/
│   └── reports/
├── perf/
│   ├── benchmarks/
│   ├── flamegraphs/
│   └── optimization/
├── debug/
│   ├── memory/
│   ├── trace/
│   └── logs/
├── visualization/
│   ├── graphs/
│   ├── images/
│   ├── interactive/
│   └── scripts/
├── .gitignore
├── .editorconfig
├── build.zig
├── build.zig.zon
├── gyro.zzz
├── zig.mod
├── CONTRIBUTING.md
└── README.md
```

## Key Features

- **Solutions**: Advent of Code solutions organized by year and day.
- **Benchmarks**: Microbenchmarks for individual solutions.
- **Performance Analysis**: Tools for profiling, optimization, and visualization.
- **Visualization**: Graphs, images, and interactive models to explore solutions.
- **Testing**: Unit tests, integration tests, and fuzz tests.
- **Documentation**: API docs, design decisions, and tutorials.
- **CI/CD**: Automated testing, security scanning, and release management.

## How to Use

1. **Build the Project**:
   ```bash
   zig build
   ```

2. **Run a Solution**:
   ```bash
   zig build run -Dyear=2023 -Dday=1
   ```

3. **Run Benchmarks**:
   ```bash
   zig build bench -Dyear=2023 -Dday=1
   ```

4. **Generate Visualizations**:
   ```bash
   zig build visualize -Dyear=2023 -Dday=1
   ```

5. **View Documentation**:
   ```bash
   zig build docs
   ```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute to this project.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
