const { writeToPath } = require("@fast-csv/format");
const QS = require("../../Util/QuickSort");
const { getItems } = require("../../Util/Items");
const { performance } = require("perf_hooks");

function KnapsackGreedy(values, weights, maxWeight) {
  //Get Ratios
  let ratios = [];
  for (let i = 0; i < values.length; i++) {
    ratios.push(weights[i] / values[i]);
  }

  //Sort
  QS.quickSort(ratios, values, weights, 0, ratios.length - 1);

  //put in bag till you cant anymore
  let k = 0;
  // console.log(`Max Bag Size ${maxWeight}`);
  let totalValue = 0;
  while (maxWeight >= 0 && maxWeight - weights[k] >= 0) {
    maxWeight -= weights[k];
    // console.log(
    //   `Item[${k}] Added Into Bag With Weight : ${weights[k]} And Value ${values[k]}`
    // );
    totalValue += values[k];
    k++;
  }
  return totalValue;
  // console.log(`Total Value : ${totalValue}`);
}

function createDataset(KnapsackSize) {
  let ExecTime = [];
  const path = `C:/Users/moham/Desktop/PBL 2.0/DataSets/01KnapSackGreedy/${KnapsackSize}.csv`;
  for (let i = 100; i <= 5000; i += 10) {
    console.log(`${5000 - i}`);
    let Items = getItems(i);
    const start = performance.now();
    let Value = KnapsackGreedy(Items.values, Items.weights, KnapsackSize);
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

// let values = [1, 2, 3, 4, 5];
// let weight = [1, 1, 1, 1, 1];
// KnapsackGreedy(values, weight, 10);

//Knapsack Size , Amount Of Items , Execution Time
