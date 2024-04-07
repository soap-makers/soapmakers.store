/**
 * @name SQL Injection
 * @description Detects potential SQL injection vulnerabilities in database queries.
 */
import python

from SQLExpr se, MethodCall mc
where se.getKind() = SQLExprKind and
      mc.getTarget() = se and
      mc.getQualifiedName().matches("^.*execute.*$") and
      exists(DataFlow::taintTraces(source, mc))
select mc, "Potential SQL Injection vulnerability"
