SELECT oi.UID, p.PID, p.pname, p.pdescription, p.pImage, p.price,oi.QTY
FROM tblOrderItem oi, tblProduct p
WHERE oi.PID = p.PID AND oi.UID=2