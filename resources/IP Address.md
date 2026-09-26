# 🌐 IP Addresses — Complete Networking Notes

> **Goal:** Build a strong understanding of IP Addresses from absolute basics to the level required for **Networking, DevOps, Cloud Engineering, Docker, Kubernetes, AWS/Azure/GCP, and technical interviews**.

---

# 1. What is an IP Address?

**IP** stands for **Internet Protocol**.

An **IP Address** is a logical numerical address assigned to a device/interface on an IP network so that it can be **identified and reached** by other devices.

Think of it like a **postal address**.

```text
House Address
      ↓
Identifies where a person/house is located

IP Address
      ↓
Identifies where a device/interface is located on a network
```

For example:

```text
192.168.1.10
```

This can be an IPv4 address assigned to a computer, server, VM, container, etc.

### Important

An IP address is associated with a **network interface**, not necessarily permanently with a physical device.

For example, one server can have:

```text
eth0 → 192.168.1.10
eth1 → 10.0.0.10
```

The same machine can therefore have multiple IP addresses.

---

# 2. Why Do We Use IP Addresses?

Computers communicate using numerical addresses.

Suppose you have:

```text
Client A
192.168.1.10

Server B
192.168.1.20
```

The client needs some way to identify where it wants to send data.

```text
192.168.1.10
      |
      | Data
      ↓
192.168.1.20
```

The IP address provides **logical addressing** at the Internet Protocol layer.

---

# 3. What Problem Does an IP Address Solve?

Without logical addressing, a network would have no standardized way to determine:

> **"Where should this packet go?"**

IP addressing helps solve:

### 1. Identification

Which network interface should receive the packet?

### 2. Location

Which network is the destination part of?

### 3. Routing

How should routers forward the packet toward its destination?

For example:

```text
Client
192.168.1.10
    |
    ↓
Router
    |
    ↓
Internet
    |
    ↓
Server
142.250.x.x
```

Routers examine the **destination IP address** to determine where to forward the packet.

---

# 4. IP Address vs MAC Address

This is extremely important for interviews.

| Feature             | IP Address                    | MAC Address                               |
| ------------------- | ----------------------------- | ----------------------------------------- |
| Type                | Logical address               | Hardware/data-link address                |
| Mainly used at      | Layer 3                       | Layer 2                                   |
| Used for            | Routing                       | Local network delivery                    |
| Example             | `192.168.1.10`                | `00:1A:2B:3C:4D:5E`                       |
| Usually assigned by | OS/network configuration/DHCP | Network-interface manufacturer            |
| Changes?            | Can change                    | Usually remains associated with interface |

### Simple way to remember

```text
MAC → Who are you on this local network?

IP  → Where are you logically located?
```

---

# 5. Versions of IP

There are two major versions:

```text
IP
├── IPv4
└── IPv6
```

---

# 6. IPv4

IPv4 is the older and still extremely common version of IP.

An IPv4 address contains:

```text
32 bits
```

It is normally written using **four decimal octets**.

Example:

```text
192.168.1.10
```

Each octet represents:

```text
8 bits
```

Therefore:

```text
8 + 8 + 8 + 8 = 32 bits
```

---

# 7. IPv6

IPv6 was introduced largely because IPv4 has a limited address space.

IPv6 uses:

```text
128 bits
```

Example:

```text
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

IPv6 is written using hexadecimal notation rather than the dotted-decimal notation normally used for IPv4.

### IPv4 vs IPv6

| Feature             |           IPv4 |                        IPv6 |
| ------------------- | -------------: | --------------------------: |
| Address size        |        32 bits |                    128 bits |
| Representation      |        Decimal |                 Hexadecimal |
| Example             | `192.168.1.10` |               `2001:db8::1` |
| Number of addresses |          `2³²` |                      `2¹²⁸` |
| NAT commonly used?  |            Yes |              Less necessary |
| Address notation    | Dotted decimal | Colon-separated hexadecimal |

For the rest of these notes, we focus mainly on **IPv4**.

---

# 8. IPv4 Address Structure

An IPv4 address contains:

```text
32 bits
```

These 32 bits are divided into:

```text
4 octets
```

Each octet:

```text
8 bits
```

Example:

```text
192.168.1.10
```

Structure:

```text
192       . 168       . 1         . 10
│           │           │           │
Octet 1     Octet 2     Octet 3     Octet 4
│           │           │           │
8 bits      8 bits      8 bits      8 bits
```

Therefore:

```text
4 × 8 = 32 bits
```

---

# 9. What is an Octet?

An **octet** is a group of exactly **8 bits**.

Example:

```text
10101100
```

This is one octet.

An IPv4 address has four octets:

```text
10101100.00010000.00000001.00001010
```

Each section between the dots is one octet.

---

# 10. Why is an Octet Limited to 0–255?

An octet contains:

```text
8 bits
```

Each bit can have only two values:

```text
0 or 1
```

Therefore the total number of combinations is:

```text
2⁸ = 256
```

Since counting starts from zero:

```text
0 → 255
```

Therefore:

> **Every IPv4 octet can have a value from 0 to 255.**

### Important formula

```text
Number of values = 2ⁿ
```

where:

```text
n = number of bits
```

For 8 bits:

```text
2⁸ = 256 values
```

Range:

```text
0–255
```

---

# 11. Most Important IP Address Mathematical Formulas

Memorize these.

### Number of possible values from n bits

$$
2^n
$$

### Maximum unsigned decimal value from n bits

$$
2^n - 1
$$

For 8 bits:

$$
2^8 - 1 = 255
$$

### IPv4 total bits

$$
4 \times 8 = 32
$$

### Total possible IPv4 addresses

$$
2^{32}
$$

$$
= 4,294,967,296
$$

So IPv4 provides approximately:

```text
4.29 billion
```

possible 32-bit addresses.

---

# 12. Bits and Bytes

Do not confuse **bit** and **byte**.

```text
1 byte = 8 bits
```

Therefore:

```text
32 bits = 4 bytes
```

because:

$$
32 \div 8 = 4
$$

An IPv4 address is therefore:

```text
32 bits
=
4 bytes
=
4 octets
```

### Important distinction

```text
bit  → b
byte → B
```

So:

```text
8 bits = 1 byte
```

---

# 13. Binary Number System

Before understanding IP calculations, you need to understand binary.

Computers fundamentally work with:

```text
0 and 1
```

This is the **binary number system**.

Binary is **base 2**.

Decimal is **base 10**.

---

# 14. Number Systems You Need for Networking

| Number System | Base | Digits     |
| ------------- | ---: | ---------- |
| Binary        |    2 | `0, 1`     |
| Decimal       |   10 | `0–9`      |
| Hexadecimal   |   16 | `0–9, A–F` |

For IPv4 calculations, **binary and decimal** are the most important.

For IPv6, **hexadecimal** becomes important.

---

# 15. Binary Place Values

An 8-bit binary number has these place values:

```text
Bit position:

128  64  32  16  8  4  2  1
 ↓    ↓   ↓   ↓   ↓  ↓  ↓  ↓
 2⁷  2⁶  2⁵  2⁴ 2³ 2² 2¹ 2⁰
```

This table is extremely important for IP calculations.

| Bit | Power | Value |
| --: | ----: | ----: |
|   7 |    2⁷ |   128 |
|   6 |    2⁶ |    64 |
|   5 |    2⁵ |    32 |
|   4 |    2⁴ |    16 |
|   3 |    2³ |     8 |
|   2 |    2² |     4 |
|   1 |    2¹ |     2 |
|   0 |    2⁰ |     1 |

Therefore:

```text
128 + 64 + 32 + 16 + 8 + 4 + 2 + 1
= 255
```

---

# 16. Decimal to Binary Conversion

There are two useful methods.

## Method 1 — Place Value Method

Suppose we want to convert:

```text
13
```

into binary.

Use:

```text
128 64 32 16 8 4 2 1
```

Find which values add up to 13:

```text
8 + 4 + 1 = 13
```

Therefore:

```text
128 64 32 16 8 4 2 1
 0   0  0  0  1 1 0 1
```

So:

```text
13 = 00001101
```

---

# 17. Decimal to Binary Example — 192

Convert:

```text
192
```

Using:

```text
128 64 32 16 8 4 2 1
```

We need:

```text
128 + 64 = 192
```

Therefore:

```text
128 64 32 16 8 4 2 1
 1   1  0  0  0 0 0 0
```

So:

```text
192 = 11000000
```

---

# 18. Decimal to Binary Example — 168

We need:

```text
168
```

Find the combination:

```text
128 + 32 + 8 = 168
```

Therefore:

```text
128 64 32 16 8 4 2 1
 1   0  1  0  1 0 0 0
```

So:

```text
168 = 10101000
```

---

# 19. Decimal to Binary Example — 10

```text
10 = 8 + 2
```

Therefore:

```text
128 64 32 16 8 4 2 1
 0   0  0  0  1 0 1 0
```

So:

```text
10 = 00001010
```

---

# 20. Complete IP Address Binary Conversion

Consider:

```text
192.168.1.10
```

Convert every octet separately.

```text
192 = 11000000
168 = 10101000
1   = 00000001
10  = 00001010
```

Therefore:

```text
192.168.1.10
```

becomes:

```text
11000000.10101000.00000001.00001010
```

Notice:

```text
4 octets × 8 bits
= 32 bits
```

---

# 21. Binary to Decimal Conversion

Now reverse the process.

Suppose:

```text
11000000
```

Use the place values:

```text
128 64 32 16 8 4 2 1
 1   1  0  0  0 0 0 0
```

Add values where the bit is `1`:

```text
128 + 64
= 192
```

Therefore:

```text
11000000 = 192
```

---

# 22. Binary to Decimal Example — 10101000

```text
128 64 32 16 8 4 2 1
 1   0  1  0  1 0 0 0
```

Add:

```text
128 + 32 + 8
= 168
```

Therefore:

```text
10101000 = 168
```

---

# 23. Binary to Decimal Example — 00001010

```text
128 64 32 16 8 4 2 1
 0   0  0  0  1 0 1 0
```

Add:

```text
8 + 2
= 10
```

Therefore:

```text
00001010 = 10
```

---

# 24. IP Address Binary Conversion Shortcut

For IPv4, memorize:

```text
128 64 32 16 8 4 2 1
```

Then every octet becomes much easier.

For example:

```text
172
```

```text
128 + 32 + 8 + 4
= 172
```

Therefore:

```text
172 = 10101100
```

---

# 25. Important IPv4 Decimal Range

Every IPv4 octet must satisfy:

```text
0 ≤ octet ≤ 255
```

Examples:

```text
192.168.1.10       ✅
10.0.0.1           ✅
255.255.255.255    ✅
0.0.0.0            ✅
```

But:

```text
256.168.1.10       ❌
192.500.1.10       ❌
```

because an octet cannot represent 256 or 500.

---

# 26. Why 256 is Important

A common interview trap:

> Why does an octet support 256 values but its maximum value is 255?

Because:

```text
Number of combinations = 256
```

but the values start from:

```text
0
```

Therefore:

```text
0 through 255
```

contains exactly:

```text
256 values
```

---

# 27. IPv4 Address Components

An IPv4 address can conceptually be divided into:

```text
Network Portion + Host Portion
```

For example:

```text
192.168.1.10/24
```

With `/24`:

```text
Network bits = 24
Host bits    = 8
```

Conceptually:

```text
192.168.1 | 10
-----------|---
 Network   |Host
```

The exact boundary is determined by the **subnet mask/CIDR prefix**.

---

# 28. Subnet Mask

A subnet mask tells us which portion of an IPv4 address represents the:

```text
Network
```

and which portion represents the:

```text
Host
```

Example:

```text
IP Address:
192.168.1.10

Subnet Mask:
255.255.255.0
```

Binary:

```text
IP:
11000000.10101000.00000001.00001010

Mask:
11111111.11111111.11111111.00000000
```

The `1`s represent network bits.

The `0`s represent host bits.

---

# 29. CIDR Notation

CIDR stands for:

> **Classless Inter-Domain Routing**

Instead of writing:

```text
192.168.1.10
255.255.255.0
```

we commonly write:

```text
192.168.1.10/24
```

The `/24` means:

```text
24 network bits
```

and therefore:

```text
32 - 24 = 8 host bits
```

---

# 30. Host Calculation Formula

For an IPv4 network:

$$
Host\ Bits = 32 - Prefix\ Length
$$

For `/24`:

$$
32 - 24 = 8
$$

Number of total addresses:

$$
2^{Host\ Bits}
$$

Therefore:

$$
2^8 = 256
$$

---

# 31. Usable Host Formula

For traditional IPv4 subnet calculations:

$$
Usable\ Hosts = 2^h - 2
$$

where:

```text
h = number of host bits
```

Why subtract 2?

Because traditionally:

```text
1 address → Network address
1 address → Broadcast address
```

Example:

```text
192.168.1.0/24
```

Host bits:

```text
32 - 24 = 8
```

Total addresses:

```text
2⁸ = 256
```

Traditional usable hosts:

```text
256 - 2
= 254
```

---

# 32. Important Exception: /31 and /32

The `2^h - 2` formula is a **general traditional subnetting rule**, not something to blindly apply everywhere.

### /31

Commonly used for point-to-point links.

```text
Host bits = 1
```

Traditional formula would produce:

```text
2¹ - 2 = 0
```

But `/31` has special operational rules and can provide two usable addresses for point-to-point links.

### /32

A `/32` represents exactly one IPv4 address:

```text
2⁰ = 1
```

Commonly used for:

* Individual hosts
* Routes
* Firewall rules
* Load-balancer targets
* Kubernetes/network configurations
* Cloud security rules

---

# 33. CIDR Calculation Table

|  CIDR | Host Bits | Total Addresses | Traditional Usable Hosts |
| ----: | --------: | --------------: | -----------------------: |
| `/30` |         2 |               4 |                        2 |
| `/29` |         3 |               8 |                        6 |
| `/28` |         4 |              16 |                       14 |
| `/27` |         5 |              32 |                       30 |
| `/26` |         6 |              64 |                       62 |
| `/25` |         7 |             128 |                      126 |
| `/24` |         8 |             256 |                      254 |
| `/23` |         9 |             512 |                      510 |
| `/22` |        10 |            1024 |                     1022 |
| `/21` |        11 |            2048 |                     2046 |
| `/20` |        12 |            4096 |                     4094 |
| `/16` |        16 |          65,536 |                   65,534 |
|  `/8` |        24 |      16,777,216 |               16,777,214 |

---

# 34. Important CIDR Formula

Given:

```text
IP = x.x.x.x/n
```

Then:

$$
Network\ Bits = n
$$

$$
Host\ Bits = 32-n
$$

$$
Total\ Addresses = 2^{32-n}
$$

For traditional subnets:

$$
Usable\ Hosts = 2^{32-n}-2
$$

Example:

```text
10.0.0.0/20
```

Host bits:

$$
32-20=12
$$

Total addresses:

$$
2^{12}=4096
$$

Traditional usable hosts:

$$
4096-2=4094
$$

---

# 35. Private IP Addresses

Private IPv4 addresses are used inside private networks.

The three major private IPv4 ranges are:

| Range                           | CIDR  |
| ------------------------------- | ----- |
| `10.0.0.0 – 10.255.255.255`     | `/8`  |
| `172.16.0.0 – 172.31.255.255`   | `/12` |
| `192.168.0.0 – 192.168.255.255` | `/16` |

These ranges are defined by RFC 1918.

Examples:

```text
10.0.0.5
172.16.10.20
192.168.1.100
```

---

# 36. Public IP Address

A public IP address is globally routable on the public Internet, subject to routing and allocation rules.

Example:

```text
Internet
   |
Public IP
   |
Server
```

Cloud providers commonly assign public IPv4 addresses to resources that need Internet connectivity.

Examples include:

* Public web servers
* Load balancers
* NAT gateways
* Internet-facing services

---

# 37. Private vs Public IP

| Feature                      | Private IP             | Public IP                  |
| ---------------------------- | ---------------------- | -------------------------- |
| Internet-routable directly   | Generally no           | Yes                        |
| Commonly used inside VPC/LAN | Yes                    | Sometimes                  |
| Example                      | `10.0.1.10`            | Publicly allocated address |
| Common use                   | Internal communication | Internet communication     |

### DevOps example

A cloud architecture may look like:

```text
Internet
    |
    ↓
Public Load Balancer
    |
    ↓
Private Application Server
    |
    ↓
Private Database
```

The application server does not necessarily need a public IP.

---

# 38. Static IP vs Dynamic IP

## Static IP

An IP address that is intentionally kept fixed.

Common uses:

* Servers
* Network infrastructure
* Certain cloud resources
* DNS targets

## Dynamic IP

An IP address assigned dynamically, commonly through DHCP.

Example:

```text
Laptop
   |
DHCP
   ↓
192.168.1.25
```

Later it might receive:

```text
192.168.1.40
```

depending on the DHCP lease and network configuration.

---

# 39. DHCP

DHCP stands for:

> **Dynamic Host Configuration Protocol**

It can automatically provide clients with network configuration such as:

* IP address
* Subnet mask
* Default gateway
* DNS server

A simplified DHCP process is commonly remembered as:

```text
DORA

Discover
   ↓
Offer
   ↓
Request
   ↓
ACK
```

---

# 40. Default Gateway

A **default gateway** is the router/interface a host uses to reach destinations outside its local subnet.

Example:

```text
Laptop
192.168.1.10
      |
      ↓
Gateway
192.168.1.1
      |
      ↓
Internet
```

If the destination is not on the local network, the host typically sends the packet toward the default gateway.

---

# 41. Special IPv4 Addresses

Some IPv4 ranges have special meanings.

## 41.1 Loopback

Common loopback address:

```text
127.0.0.1
```

It refers back to the local host.

Example:

```text
Application
   |
127.0.0.1
   |
Same machine
```

The loopback range is:

```text
127.0.0.0/8
```

---

# 42. 0.0.0.0

`0.0.0.0` can have different meanings depending on context.

Examples:

### As a server bind address

```text
0.0.0.0:8080
```

means the application listens on available local interfaces rather than only one specific interface.

### As a route

```text
0.0.0.0/0
```

represents the default route.

Meaning:

> If no more specific route matches, use this route.

---

# 43. Broadcast Address

IPv4 supports broadcast within a subnet.

For:

```text
192.168.1.0/24
```

the broadcast address is:

```text
192.168.1.255
```

It is used to address all hosts on the relevant broadcast domain/subnet in traditional IPv4 networking.

---

# 44. Network Address

For:

```text
192.168.1.10/24
```

the network address is:

```text
192.168.1.0
```

It identifies the subnet itself.

---

# 45. Network Address vs Host Address vs Broadcast

For:

```text
192.168.1.0/24
```

| Type                          | Address         |
| ----------------------------- | --------------- |
| Network                       | `192.168.1.0`   |
| First traditional usable host | `192.168.1.1`   |
| Last traditional usable host  | `192.168.1.254` |
| Broadcast                     | `192.168.1.255` |

---

# 46. APIPA

APIPA stands for:

> **Automatic Private IP Addressing**

The IPv4 link-local range is:

```text
169.254.0.0/16
```

A host may self-configure an address in this range when DHCP configuration fails in environments that use APIPA.

Example:

```text
169.254.x.x
```

This generally indicates local-link communication rather than normal routed Internet connectivity.

---

# 47. IPv4 Address Classes — Historical Concept

You may encounter the old classful model in older networking material.

| Class | First Octet Range | Historical Default Mask |
| ----- | ----------------: | ----------------------- |
| A     |           `1–126` | `/8`                    |
| B     |         `128–191` | `/16`                   |
| C     |         `192–223` | `/24`                   |
| D     |         `224–239` | Multicast               |
| E     |         `240–255` | Reserved/experimental   |

### Important

Modern IP networking uses **CIDR**, not the old classful system for allocating networks.

Therefore, do not assume:

```text
192.x.x.x = automatically /24
```

That is wrong in modern networking.

For example:

```text
192.168.0.0/16
192.168.0.0/24
192.168.0.0/20
```

are all possible CIDR networks.

---

# 48. Subnet Mask Binary Representation

Consider:

```text
255.255.255.0
```

Convert each octet:

```text
255 = 11111111
255 = 11111111
255 = 11111111
0   = 00000000
```

Therefore:

```text
11111111.11111111.11111111.00000000
```

Count the `1`s:

```text
8 + 8 + 8 = 24
```

Therefore:

```text
255.255.255.0 = /24
```

---

# 49. Common Subnet Masks

|  CIDR | Subnet Mask       |
| ----: | ----------------- |
|  `/8` | `255.0.0.0`       |
| `/16` | `255.255.0.0`     |
| `/24` | `255.255.255.0`   |
| `/25` | `255.255.255.128` |
| `/26` | `255.255.255.192` |
| `/27` | `255.255.255.224` |
| `/28` | `255.255.255.240` |
| `/29` | `255.255.255.248` |
| `/30` | `255.255.255.252` |

---

# 50. The Important Subnetting Formula

If you borrow:

```text
n bits
```

from the host portion:

$$
Number\ of\ Subnets = 2^n
$$

If you have:

```text
h host bits remaining
```

then:

$$
Addresses\ per\ Subnet = 2^h
$$

Traditional usable hosts:

$$
2^h-2
$$

---

# 51. Example: /24 Divided into /26

Starting network:

```text
192.168.1.0/24
```

New network:

```text
/26
```

Borrowed bits:

```text
26 - 24 = 2
```

Number of subnets:

$$
2^2 = 4
$$

Each subnet has:

```text
32 - 26 = 6 host bits
```

Total addresses per subnet:

$$
2^6 = 64
$$

Traditional usable hosts:

$$
64 - 2 = 62
$$

The four subnet blocks are:

```text
192.168.1.0/26
192.168.1.64/26
192.168.1.128/26
192.168.1.192/26
```

---

# 52. IP Address Range Calculation

For:

```text
192.168.1.64/26
```

There are:

```text
64 addresses
```

because:

$$
2^{32-26}=2^6=64
$$

Therefore:

```text
Network:
192.168.1.64

First traditional usable:
192.168.1.65

Last traditional usable:
192.168.1.126

Broadcast:
192.168.1.127
```

Next subnet starts at:

```text
192.168.1.128
```

---

# 53. Block Size Formula

For subnetting an octet:

$$
Block\ Size = 256 - Subnet\ Mask\ Value
$$

Example:

```text
Subnet mask:
255.255.255.192
```

Relevant octet:

```text
192
```

Therefore:

$$
256-192=64
$$

Subnet blocks:

```text
0
64
128
192
```

---

# 54. Important IP Address Formula Sheet

## Basic

$$
1\ Byte = 8\ Bits
$$

$$
IPv4 = 32\ Bits = 4\ Bytes
$$

$$
1\ Octet = 8\ Bits
$$

---

## Binary

$$
Number\ of\ combinations = 2^n
$$

$$
Maximum\ unsigned\ value = 2^n-1
$$

For 8 bits:

$$
2^8=256
$$

$$
2^8-1=255
$$

---

## IPv4

$$
Total\ IPv4\ addresses=2^{32}
$$

$$
2^{32}=4,294,967,296
$$

---

## CIDR

$$
Host\ Bits=32-Prefix
$$

$$
Total\ Addresses=2^{Host\ Bits}
$$

$$
Traditional\ Usable\ Hosts=2^{Host\ Bits}-2
$$

---

## Subnetting

$$
Number\ of\ Subnets=2^{Borrowed\ Bits}
$$

$$
Addresses\ per\ Subnet=2^{Remaining\ Host\ Bits}
$$

$$
Traditional\ Usable\ Hosts=2^{Remaining\ Host\ Bits}-2
$$

---

## Block Size

$$
Block\ Size=256-Mask\ Octet
$$

---

# 55. Decimal ↔ Binary Quick Reference

| Decimal | Binary     |
| ------: | ---------- |
|       0 | `00000000` |
|       1 | `00000001` |
|       2 | `00000010` |
|       3 | `00000011` |
|       4 | `00000100` |
|       5 | `00000101` |
|       8 | `00001000` |
|      10 | `00001010` |
|      16 | `00010000` |
|      32 | `00100000` |
|      64 | `01000000` |
|     100 | `01100100` |
|     127 | `01111111` |
|     128 | `10000000` |
|     192 | `11000000` |
|     224 | `11100000` |
|     240 | `11110000` |
|     248 | `11111000` |
|     252 | `11111100` |
|     254 | `11111110` |
|     255 | `11111111` |

---

# 56. IP Address and DNS Are NOT the Same

A common misconception is:

> "The IP address is the website address."

Not exactly.

Suppose you type:

```text
google.com
```

DNS can resolve the domain name to an IP address.

Conceptually:

```text
google.com
     |
     ↓
    DNS
     |
     ↓
IP Address
```

Then networking can use the IP address to reach the destination.

Therefore:

```text
Domain Name → Human-friendly identifier
IP Address  → Network-layer logical address
```

---

# 57. IP Address and Port Number Are Different

Another extremely important DevOps concept.

Consider:

```text
192.168.1.10:8080
```

Here:

```text
192.168.1.10 → IP address
8080         → Port
```

The IP identifies the network interface/host destination.

The port identifies the service/process endpoint on that host.

Example:

```text
192.168.1.10:80
        ↓
      HTTP

192.168.1.10:443
        ↓
     HTTPS

192.168.1.10:22
        ↓
      SSH
```

Think:

```text
IP   → Which machine/interface?

Port → Which service?
```

---

# 58. IP Address in Docker

Docker heavily uses private IP addressing.

Example:

```text
Docker Network
10.0.0.0/24

      ┌──────────────┐
      │   frontend   │
      │  10.0.0.2    │
      └──────────────┘

      ┌──────────────┐
      │   backend    │
      │  10.0.0.3    │
      └──────────────┘

      ┌──────────────┐
      │   database   │
      │  10.0.0.4    │
      └──────────────┘
```

Docker creates networks and assigns IP addresses to containers.

However, applications should generally communicate using **service/container DNS names** rather than hardcoding ephemeral container IP addresses.

---

# 59. IP Address in Kubernetes

Kubernetes makes IP addressing even more important.

A typical Kubernetes cluster has multiple networking layers:

```text
Node IP
   ↓
Pod IP
   ↓
Service IP
   ↓
Ingress / Load Balancer IP
```

### Pod IP

Each Pod normally gets an IP from the cluster's Pod network.

### Service IP

A Kubernetes Service provides a stable virtual IP for accessing a group of Pods.

### Node IP

The node itself has an IP on the underlying network.

### External IP

A LoadBalancer/Ingress can expose services outside the cluster depending on the environment.

---

# 60. IP Address in Cloud Computing

Cloud networking is heavily based on IP addressing.

For example, a cloud network may look like:

```text
VPC / VNet
10.0.0.0/16
       |
       ├── Public Subnet
       │      10.0.1.0/24
       |
       ├── Private Subnet
       │      10.0.2.0/24
       |
       └── Database Subnet
              10.0.3.0/24
```

This is why **CIDR and subnetting are mandatory knowledge for Cloud/DevOps engineers**.

---

# 61. Public Subnet vs Private Subnet

A subnet is not automatically "public" merely because it contains public-looking IP addresses.

In cloud environments, a subnet's public/private behavior depends on things such as:

* Routing
* Internet Gateway
* NAT
* Route tables
* Public IP assignment
* Security controls

For example:

```text
Internet
   |
Internet Gateway
   |
Public Subnet
   |
Load Balancer
   |
Private Subnet
   |
Application
   |
Database
```

The important concept is:

> **Routing determines where traffic can go.**

---

# 62. NAT and IP Addresses

NAT stands for:

> **Network Address Translation**

NAT allows private IP networks to communicate through public IP addresses in common IPv4 architectures.

Example:

```text
Private Network

192.168.1.10
     |
     ↓
   Router
     |
NAT Translation
     |
     ↓
Public IP
     |
     ↓
Internet
```

This is one reason private IPv4 addressing works effectively despite IPv4 address scarcity.

---

# 63. Routing and IP Addresses

Routers use routing tables to decide where packets should go.

A simplified routing table might contain:

```text
Destination       Next Hop
10.0.0.0/16       ...
192.168.1.0/24    ...
0.0.0.0/0         ...
```

The destination IP is compared against available routes.

A major routing principle is:

> **The most specific matching route generally wins.**

For example:

```text
10.0.0.0/8
10.10.0.0/16
10.10.20.0/24
```

For destination:

```text
10.10.20.50
```

the `/24` route is more specific than `/16` or `/8`.

---

# 64. Longest Prefix Match

This is important for Cloud and DevOps networking.

Suppose the routing table has:

```text
10.0.0.0/8
10.1.0.0/16
10.1.5.0/24
```

Destination:

```text
10.1.5.20
```

All three could match.

The router chooses:

```text
10.1.5.0/24
```

because `/24` is the **longest/more specific prefix**.

---

# 65. Why IP Knowledge Matters in DevOps

You cannot properly understand these technologies without networking:

```text
Docker
Kubernetes
AWS
Azure
GCP
Terraform
Nginx
Ingress
Load Balancers
DNS
Firewalls
VPN
Service Mesh
CI/CD deployment environments
Monitoring
```

For example, when a Kubernetes application cannot connect to PostgreSQL, the problem may involve:

```text
Pod IP
   ↓
Service IP
   ↓
DNS
   ↓
NetworkPolicy
   ↓
Routing
   ↓
Port
   ↓
Database
```

Therefore, IP addressing is not merely a networking-theory topic.

It is a **core DevOps skill**.

---

# 66. DevOps Interview Example

### Question

> Your application server has IP `10.0.2.10/24` and the database has IP `10.0.3.10/24`. Can the application communicate with the database directly?

### Correct thinking

The two addresses belong to:

```text
10.0.2.0/24
10.0.3.0/24
```

These are different subnets.

Therefore, communication requires appropriate Layer-3 routing between the subnets.

In a cloud environment, this may involve:

```text
Route Table
+
Network ACL
+
Security Group / Firewall
+
Correct destination port
```

Do not simply say:

> "They are both 10.x.x.x, so they are on the same network."

That is wrong.

The **CIDR prefix matters**.

---

# 67. Common Interview Traps

## Trap 1

> IPv4 has 4 bytes.

Correct.

```text
IPv4 = 32 bits = 4 bytes
```

---

## Trap 2

> Each IPv4 octet has 256 as its maximum value.

Wrong.

Maximum:

```text
255
```

Number of possible values:

```text
256
```

---

## Trap 3

> Every 192.168.x.x address is `/24`.

Wrong.

The prefix is separate from the address.

Examples:

```text
192.168.0.0/16
192.168.1.0/24
192.168.1.0/26
```

---

## Trap 4

> Private IP addresses cannot access the Internet.

Too simplistic.

A private host can access the Internet through mechanisms such as:

```text
NAT
```

provided the network is configured appropriately.

---

## Trap 5

> IP address identifies a process.

Wrong.

A port identifies the service/process endpoint.

```text
IP   → host/interface destination
Port → service endpoint
```

---

## Trap 6

> `127.0.0.1` means my computer's LAN IP.

Wrong.

It is the **loopback address**.

---

## Trap 7

> `0.0.0.0` means an invalid IP.

Wrong.

Its meaning depends on context.

Examples:

```text
0.0.0.0/0 → default route
0.0.0.0:8080 → listen on available local interfaces
```

---

# 68. Practical Commands for DevOps Engineers

## Linux

Show IP addresses:

```bash
ip addr
```

or:

```bash
ip a
```

Show routes:

```bash
ip route
```

Show a specific route:

```bash
ip route get 8.8.8.8
```

Test connectivity:

```bash
ping 8.8.8.8
```

DNS resolution:

```bash
nslookup example.com
```

or:

```bash
dig example.com
```

Show listening ports:

```bash
ss -tulnp
```

---

# 69. Important IP Troubleshooting Flow

When an application cannot connect to another service, do not randomly restart everything.

Think systematically:

```text
1. Is the destination IP correct?
            ↓
2. Is the destination reachable?
            ↓
3. Is routing correct?
            ↓
4. Is DNS resolving correctly?
            ↓
5. Is the required port open?
            ↓
6. Is the service actually listening?
            ↓
7. Is a firewall blocking it?
            ↓
8. Is a cloud security rule blocking it?
            ↓
9. Is a Kubernetes NetworkPolicy blocking it?
            ↓
10. Is the application itself rejecting the connection?
```

Useful commands:

```bash
ip addr
ip route
ping
traceroute
tracepath
dig
nslookup
ss
curl
nc
```

---

# 70. Important Mental Model

Always think about an IP address in this order:

```text
IP Address
    ↓
Which network?
    ↓
Which host/interface?
    ↓
Can I route to it?
    ↓
Which port?
    ↓
Which service?
```

Example:

```text
10.0.2.15:8080

10.0.2.15
    ↓
IP address

/24
    ↓
Network information

8080
    ↓
Application/service port
```

---

# 71. Complete IPv4 Example

Consider:

```text
IP Address:
192.168.10.50/24
```

### Step 1 — IPv4 size

```text
32 bits
```

### Step 2 — Prefix

```text
/24
```

Therefore:

```text
Network bits = 24
Host bits = 32 - 24 = 8
```

### Step 3 — Total addresses

$$
2^8=256
$$

### Step 4 — Traditional usable hosts

$$
256-2=254
$$

### Step 5 — Network

```text
192.168.10.0
```

### Step 6 — Broadcast

```text
192.168.10.255
```

### Step 7 — Traditional usable range

```text
192.168.10.1
        ↓
192.168.10.254
```

### Step 8 — Binary representation

```text
192 = 11000000
168 = 10101000
10  = 00001010
50  = 00110010
```

Therefore:

```text
11000000.10101000.00001010.00110010
```

---

# 72. Complete Formula Cheat Sheet

```text
1 Byte = 8 Bits

1 Octet = 8 Bits

IPv4 = 32 Bits = 4 Bytes = 4 Octets

Number of values from n bits = 2ⁿ

Maximum unsigned value from n bits = 2ⁿ - 1

8-bit values = 2⁸ = 256

Maximum 8-bit value = 255

Total IPv4 addresses = 2³²
                     = 4,294,967,296

Host Bits = 32 - CIDR Prefix

Total Addresses = 2^(Host Bits)

Traditional Usable Hosts = 2^(Host Bits) - 2

Number of Subnets = 2^(Borrowed Bits)

Addresses per Subnet = 2^(Remaining Host Bits)

Traditional Usable Hosts per Subnet
= 2^(Remaining Host Bits) - 2

Block Size = 256 - Mask Octet
```

---

# 73. The 8-Bit Binary Table You Should Memorize

```text
128  64  32  16  8  4  2  1
```

Corresponding powers:

```text
2⁷  2⁶  2⁵  2⁴ 2³ 2² 2¹ 2⁰
```

This single table makes most basic IPv4 binary calculations much faster.

---

# 74. One-Minute Revision

```text
IP Address
    ↓
Logical network-layer address
    ↓
IPv4 = 32 bits
    ↓
4 octets
    ↓
1 octet = 8 bits
    ↓
Each octet = 0–255
    ↓
Because 2⁸ = 256 possible values
```

### Important formulas

```text
Host Bits = 32 - Prefix

Total Addresses = 2^HostBits

Traditional Usable Hosts = 2^HostBits - 2

Number of Subnets = 2^BorrowedBits

Block Size = 256 - MaskOctet
```

### Important addresses

```text
127.0.0.1       → Loopback

0.0.0.0/0       → Default route

169.254.0.0/16  → IPv4 link-local/APIPA range

10.0.0.0/8      → Private

172.16.0.0/12   → Private

192.168.0.0/16  → Private
```

### DevOps connection

```text
IP
 ↓
Subnet
 ↓
Routing
 ↓
Firewall/Security Group
 ↓
Port
 ↓
Service
 ↓
Application
```

---

# 75. Interview Questions to Practice

### Beginner

1. What is an IP address?
2. Why do we need IP addresses?
3. What is the difference between IP and MAC addresses?
4. What is IPv4?
5. How many bits are in an IPv4 address?
6. What is an octet?
7. Why can an IPv4 octet contain values only from 0 to 255?
8. What is the difference between a bit and a byte?
9. Convert `192` to binary.
10. Convert `11000000` to decimal.

### Intermediate

11. What is a subnet mask?
12. What does `/24` mean?
13. How many hosts can a `/24` network traditionally support?
14. How many addresses exist in a `/26` network?
15. What is CIDR?
16. What is a network address?
17. What is a broadcast address?
18. What is a default gateway?
19. What is the difference between public and private IP?
20. What is NAT?
21. What is DHCP?
22. What is `127.0.0.1`?
23. What is `0.0.0.0`?
24. What is APIPA?
25. Why is `/31` special?
26. What is `/32` used for?

### DevOps/Cloud

27. Why is CIDR important in cloud networking?
28. What is a VPC/VNet CIDR?
29. What is the difference between a public and private subnet?
30. How does NAT allow private servers to access the Internet?
31. How does Kubernetes use IP addresses?
32. What is a Pod IP?
33. What is a Service IP?
34. Why should applications avoid hardcoding Kubernetes Pod IPs?
35. How would you troubleshoot connectivity between two Kubernetes Pods?
36. How would you troubleshoot a server that cannot connect to a database?
37. What is longest-prefix match?
38. Why can two `10.x.x.x` addresses still belong to different networks?
39. What is the relationship between IP address and port?
40. Why are subnetting and CIDR important for Terraform/cloud infrastructure?

---
