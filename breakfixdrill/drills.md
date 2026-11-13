# Fix and Break Drills — Lab 1 & Lab 2

**Environment:** VirtualBox — DC01 + WIN11
**Domain:** northwind.local
**Domain Controller:** DC01 — 192.168.50.10

## Purpose

Practice breaking, troubleshooting, fixing, and verifying common IT support and Windows Server problems.

**Rules**

- Run DC01 and WIN11 together.
- Perform one drill at a time.
- Record actual results; do not assume success.
- Restore every configuration change after testing.
- Never record passwords or other secrets.

---

## Lab 1 — Active Directory, DNS and DHCP

### Drill 1 — DNS Service Failure

**Break:** Stop the DNS Server service on DC01.

- **Symptom:** WIN11 cannot resolve `dc01.northwind.local`.
- **Cause:** DNS service is stopped.
- **Fix:** Start the DNS Server service on DC01.
- **How I checked:** Run `nslookup dc01.northwind.local` on WIN11.

**Result:** tested


### Drill 2 — DHCP Failure

**Break:** Deactivate the DHCP scope on DC01.

- **Symptom:** WIN11 cannot obtain a DHCP lease.
- **Cause:** The DHCP scope is inactive.
- **Fix:** Reactivate the scope and renew the client lease.
- **How I checked:** Run `ipconfig /release`, `ipconfig /renew`, and `ipconfig`.

**Result:** tested


### Drill 3 — Disabled Domain User

**Break:** Disable `ali.test` in Active Directory Users and Computers.

- **Symptom:** The user cannot sign in successfully.
- **Cause:** The domain account is disabled.
- **Fix:** Re-enable `ali.test`.
- **How I checked:** Sign in again using the domain account.

**Result:** tested


---

## Lab 2 — Shared Folders and Group Policy

### Drill 4 — NTFS Permission Failure

**Break:** Remove the `Warehouse` group from the NTFS permissions on `C:\Shares\Warehouse`.

- **Symptom:** `ali.test` cannot access or create files in `\\dc01\Warehouse`.
- **Cause:** The user lacks the required NTFS permissions through the `Warehouse` group.
- **Fix:** Restore the appropriate NTFS permissions for `Warehouse`.
- **How I checked:** Sign in as `ali.test` and create a test file.

**Result:** Not tested
**Evidence / Notes:**

### Drill 5 — Drive Mapping GPO Failure

**Break:** Unlink the `Map Warehouse Drive` GPO from the `Northwind\Users` OU.

- **Symptom:** The mapped `W:` drive may disappear or stop being configured by the GPO.
- **Cause:** The drive-mapping policy is no longer linked to the user's OU.
- **Fix:** Restore the GPO link and refresh Group Policy.
- **How I checked:** Run `gpupdate /force`, sign out and back in, then check `W:` and run `gpresult /r`.

**Result:** Not tested
**Evidence / Notes:**

---

## Final Review

- [ ] All five drills attempted.
- [ ] Actual symptoms and results recorded.
- [ ] All services, accounts, permissions, and GPO links restored.
- [ ] Normal domain login verified.
- [ ] No passwords or sensitive information recorded.

**Hardest drill:**
**Main lesson learned:**
**Overall status:** Not completed