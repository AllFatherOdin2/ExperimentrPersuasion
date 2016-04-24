var j2c    = require('json2csv')
  , fs     = require('fs')
  , file   = process.argv[2]
  , _      = require('underscore')
  , fields = [ // EDIT THESE
      'postId',
      'time_start_experiment',
      'time_start_demo',
      'time_end_demo',
      'time_diff_demo',
      'timestamp',
      'age',
      'sex',
      'degree',
      'time_start_preTest',
      'time_end_preTest',
      'time_diff_preTest',
      'preknowledge',
      'previolence',
      'visType',
      'time_start_attentionCheck',
      'time_end_attentionCheck',
      'time_diff_attentionCheck',
      'topic',
      'displayType',
      'subtopic',
      'postviolence',
      'time_start_qualitative',
      'time_end_qualitative',
      'time_diff_qualitative',
      'qualitative',
      'time_end_experiment',
      'time_diff_experiment',
      'comments'
    ]
  , data

fs.readFile(file, 'utf8', function (err, data) {
  if (err) console.log(err)

  data = JSON.parse(data)

  // filters any undefined data (it makes R scripting easier)
  data = filterUndefined(data)

  // use 'debug' for your workerId when testing experiments, 
  //   comment out if you want to analyze data from yourself
  data = filterDebug(data) 

  convert( data )
})

function convert(d) {
  var params = {
    data: d,
    fields: fields
  }
  j2c(params, function(err, csv) {
    if (err) console.log(err)
    console.log(csv)
  })
}

function filterUndefined (arr) {
  return _.filter(arr, function(row) {
    return _.every(fields, function(f) { return row[f] })
  })
}

function filterDebug (arr) {
  return _.filter(arr, function(row) {
    return row.workerId !== 'debug'
  })
}
