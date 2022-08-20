export default function (name, weight, grade, fill, size) {
  let svgName = `${name}`;
  if (weight > 0) {
    svgName += `_wght${wight}`;
  }
  if (grade != 0) {
    svgName += "_grad";
    svgName += grade > 0 ? `${grade}` : `N${grade * -1}`;
  }
  if (fill) {
    svgName += "_fill";
  }
  svgName += `_${size}px.marko`;
  let result = `./${name}/${style}/${svgName}`;
  return result;
}
