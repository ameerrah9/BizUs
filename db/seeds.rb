# biz_plans = [["Gapify", "To deliver high quality fashion.", "$45,000"], ["Morgan Moor", "To deliver high quality soups.", "$40,000"], ["Jistly", "To deliver high quality buttons.", "$65,000"]]

# biz_plans.each {|name, mission, budget| BizPlan.create(name: name, mission: mission, budget: budget)}

BizPlan.create(name: "Gapify", mission: "To deliver high quality fashion.", budget: "$45,000")
BizPlan.create(name: "Morgan Moor", mission: "To deliver high quality soups.", budget: "$40,000")
BizPlan.create(name: "Jistly", mission: "To deliver high quality buttons.", budget: "$65,000")