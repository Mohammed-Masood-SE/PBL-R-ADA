const { writeToPath } = require("@fast-csv/format");
const QS = require("../../Util/QuickSort");
const { getItems } = require("../../Util/Items");
const { performance } = require("perf_hooks");

function max(a, b) {
  return a > b ? a : b;
}

// Returns the value of maximum profit
function knapSackRec(W, wt, val, n, dp) {
  // Base condition
  if (n == 0 || W == 0) return 0;

  if (dp[n][W] != -1) return dp[n][W];

  if (wt[n - 1] > W)
    // Store the value of function call
    // stack in table before return
    return (dp[n][W] = knapSackRec(W, wt, val, n - 1, dp));
  // Return value of table after storing
  else
    return (dp[n][W] = max(
      val[n - 1] + knapSackRec(W - wt[n - 1], wt, val, n - 1, dp),
      knapSackRec(W, wt, val, n - 1, dp)
    ));
}

function knapSack(W, wt, val, N) {
  // Declare the table dynamically
  let dp = new Array(N + 1);
  for (let i = 0; i < dp.length; i++) {
    dp[i] = new Array(W + 1);
  }

  // Loop to initially filled the
  // table with -1
  for (var i = 0; i < N + 1; i++) for (var j = 0; j < W + 1; j++) dp[i][j] = -1;

  return knapSackRec(W, wt, val, N, dp);
}

function createDataset(KnapsackSize) {
  let ExecTime = [];
  const path = `C:/Users/moham/Desktop/PBL 2.0/DataSets/01KnapsackDynamic/${KnapsackSize}.csv`;
  for (let i = 100; i <= 5000; i += 10) {
    console.log(`${5000 - i}`);
    let Items = getItems(i);
    const start = performance.now();
    let Value = knapSack(
      KnapsackSize,
      Items.weights,
      Items.values,
      Items.values.length
    );
    const end = performance.now();
    ExecTime.push({ totalItems: i, ExecutionTime: end - start });
  }
  const options = { headers: true, quoteColumns: true };
  writeToPath(path, ExecTime, options)
    .on("error", (err) => console.error(err))
    .on("finish", () => console.log("Done writing."));
}

createDataset(100);
createDataset(1000);
createDataset(5000);

// let values = [60, 100, 120];
// let weights = [10, 20, 30];
// let maxWeight = 50;
// console.log(knapSack(maxWeight, weights, values, values.length));
