---
description: Create the Orchard demo and measure its original Power BI visuals.
argument-hint: "[new output folder]"
disable-model-invocation: true
---

Create Orchard with the bundled QT:DAX CLI, then investigate it with the plugin's qt-dax MCP tools.

1. Use $ARGUMENTS as the new demo folder if supplied. Otherwise choose a new folder named QueryTorque Orchard under `${CLAUDE_PROJECT_DIR}`, with a unique suffix if needed. Resolve it to an absolute path. Use a new sibling folder for the investigation and keep both paths.
2. In Bash, set `out` to the absolute demo folder and run the following. Claude Code substitutes the plugin data path. Wait for the qt-dax server to finish first-run setup if the path files are still missing.

   ```bash
   runtime="$(cat "${CLAUDE_PLUGIN_DATA}/runtime-path.txt")" &&
   clients="$(cat "${CLAUDE_PLUGIN_DATA}/native-clients-path.txt")" &&
   QT_DAX_NATIVE_CLIENTS="$clients" "$runtime/python.exe" -I -B -m qt_dax.cli.main workbook demo --out "$out" --json
   ```

   Keep the default 8 million rows. Check the created status and use the exact project path in the result.
3. Call native_prepare with that project, the new run_root and open_browser set to false. Continue only when preparation succeeds.
4. Call native_measure with the same run_root and desktop set to false. Report which visuals finished timing, the slowest ones and any missing or unsteady results. Link to Orchard.pbip, native-run.json and chart-timings.json.

This command only establishes the original timings. A rewrite, same-answer check and regression guard are later steps in the power-bi-performance skill.
