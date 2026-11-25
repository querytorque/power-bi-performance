# QueryTorque Power BI Performance Tuner

Find slow Power BI visuals and test DAX rewrites on a copy of your report.
Check that the answers stay the same and measure the change on the local Power BI engine.

The Claude Code plugin and VS Code extension use the same Power BI Performance Tuner 1.3.4 runtime.

## VS Code

Install [Power BI Performance Tuner from the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=querytorque.power-bi-performance).

## Claude Code

```powershell
claude plugin marketplace add querytorque/power-bi-performance
claude plugin install power-bi-performance@querytorque-power-bi-performance
```

See the [Claude Code plugin guide](plugins/power-bi-performance/README.md) for setup and first-run instructions.

[Read how QueryTorque checks Power BI DAX rewrites](https://querytorque.com/blog/power-bi-ai-dax-rewrite-checks).
