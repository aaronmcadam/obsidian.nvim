local yaml = require "obsidian.yaml"

describe("obsidian.yaml", function()
  it("should dump numbers", function()
    assert.equals(yaml.dumps(1), "1")
  end)
  it("should dump strings", function()
    assert.equals(yaml.dumps "hi there", '"hi there"')
    assert.equals(yaml.dumps "hi it's me", [["hi it's me"]])
    assert.equals(yaml.dumps { foo = "bar" }, [[foo: "bar"]])
  end)
  it("should dump strings with single quote", function()
    assert.equals(yaml.dumps "hi it's me", [["hi it's me"]])
  end)
  it("should dump table with string values", function()
    assert.equals(yaml.dumps { foo = "bar" }, [[foo: "bar"]])
  end)
  it("should dump arrays with string values", function()
    assert.equals(yaml.dumps { "foo", "bar" }, '- "foo"\n- "bar"')
  end)
  it("should dump arrays with number values", function()
    assert.equals(yaml.dumps { 1, 2 }, "- 1\n- 2")
  end)
  it("should dump arrays with simple table values", function()
    assert.equals(yaml.dumps { { a = 1 }, { b = 2 } }, "- a: 1\n- b: 2")
  end)
  it("should dump tables with string values", function()
    assert.equals(yaml.dumps { a = "foo", b = "bar" }, 'a: "foo"\nb: "bar"')
  end)
  it("should dump tables with number values", function()
    assert.equals(yaml.dumps { a = 1, b = 2 }, "a: 1\nb: 2")
  end)
  it("should dump tables with array values", function()
    assert.equals(yaml.dumps { a = { "foo" }, b = { "bar" } }, 'a:\n  - "foo"\nb:\n  - "bar"')
  end)
  it("should dump tables with empty array", function()
    assert.equals(yaml.dumps { a = {} }, "a: []")
  end)
end)
