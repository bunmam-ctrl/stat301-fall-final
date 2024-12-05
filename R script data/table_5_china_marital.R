china_join <- china_marriage|>
  full_join(china_divorce, join_by(area == area))

colnames(china_join) <- gsub("\\.x$", "_marriage", colnames(china_join))
colnames(china_join) <- gsub("\\.y$", "_divorce", colnames(china_join))

