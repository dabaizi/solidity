contract C {
    struct S { bool f; }
    S s;
    function f(bool flag) internal view returns (S storage c) {
        if (flag) c = s;
    }
    function g(bool flag) internal returns (S storage c) {
        if (flag) c = s;
        else
        {
            if (!flag) c = s;
            else s.f = true;
        }
    }
}
// ----
// TypeError: (96-107): This variable is of storage pointer type and might be returned without assignment and could be used uninitialized. Assign the variable (potentially from itself) to fix this error.
// TypeError: (186-197): This variable is of storage pointer type and might be returned without assignment and could be used uninitialized. Assign the variable (potentially from itself) to fix this error.
