def leiner(input):
  result = []
  lein = []
  for i in input:
    if i == "\n":
      result.append(lein)
      lein = []
    else:
      lein.append(i)
  return result

def dehtml(page):
  result = []
  def in_tag(page):
    c = page[0]
    if c == ">":
      out_page(page[1:])
    else:
      in_tag(page[1:])
  def out_tag(page):
    c = page[0]
    if c == "<":
      in_tag(page[1:])
    else:
      result.append(c)
      out_tag(page[1:])
  out_tag(page)
