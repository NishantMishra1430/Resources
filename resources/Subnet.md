# 🌐 Subnets — Complete Networking Notes

> **Goal:** Understand what a subnet is, why networks are divided into subnets, how subnetting actually works, and how subnets are used in **AWS/Azure/GCP, Kubernetes, Docker, Terraform, routing, security, and real production architectures**.

---

# 1. What is a Subnet?

**Subnet** stands for **Subnetwork**.

A subnet is a **smaller logical network created by dividing a larger IP network into smaller networks**.

Simple example:

Suppose we have:

```text
10.0.0.0/16
```

This is a relatively large network.

We can divide it into smaller networks:

```text
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
10.0.4.0/24
```

Each of these is a **subnet**.

### Simple mental model

Think of a large apartment building:

```text
Large Network
      |
      +── Floor 1 → Subnet
      |
      +── Floor 2 → Subnet
      |
      +── Floor 3 → Subnet
      |
      +── Floor 4 → Subnet
```

The large network is divided into smaller logical sections.

---

# 2. Why Do We Need Subnets?

Imagine putting every machine in an organization into one huge network:

```text
                    Network
                       |
       +---------------+---------------+
       |       |       |       |       |
      PC      PC     Server   DB      PC
       |       |       |       |       |
      5000+ devices
```

This creates problems with:

* Network organization
* Broadcast traffic
* Security
* Routing
* IP address management
* Network isolation
* Troubleshooting
* Scalability

Instead, divide the network:

```text
                    Organization
                         |
          +--------------+--------------+
          |              |              |
       Subnet A       Subnet B       Subnet C
          |              |              |
        Users          Apps          Database
```

Now each subnet has a specific purpose.

---

# 3. What Problem Does a Subnet Solve?

A subnet mainly helps us divide a large IP address space into **smaller logical network segments**.

This provides:

### 1. Organization

Different systems can be placed into different networks.

### 2. Isolation

Traffic between different subnets can be controlled using routers, firewalls, security groups, and network policies.

### 3. Efficient IP Address Management

Instead of assigning one enormous network to everything, IP space can be divided according to requirements.

### 4. Routing Control

Routers can make decisions based on different network prefixes.

### 5. Scalability

Large environments can be divided into manageable network segments.

---

# 4. Subnet vs Network

These terms are often used almost interchangeably in practical conversations, but the context matters.

A subnet is essentially a **defined IP network segment** inside a larger address space.

Example:

```text
10.0.0.0/16
```

can be divided into:

```text
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
```

The `/16` network is being divided into smaller `/24` subnets.

---

# 5. How Subnetting Works

Subnetting works by **borrowing bits from the host portion of an IP address and using them to create additional network bits**.

This is the most important concept.

Suppose:

```text
192.168.1.0/24
```

IPv4 has:

```text
32 bits
```

A `/24` means:

```text
24 network bits
8 host bits
```

Because:

$$
32-24=8
$$

If we change it to:

```text
192.168.1.0/26
```

we now have:

```text
26 network bits
6 host bits
```

We borrowed:

```text
26-24=2
```

bits.

---

# 6. The Basic Subnetting Formula

Suppose you have:

```text
Original prefix = /24
New prefix = /26
```

### Borrowed bits

$$
26-24=2
$$

### Number of subnets

$$
2^2=4
$$

Therefore:

```text
1 × /24
      ↓
4 × /26
```

---

# 7. Host Calculation

For IPv4:

$$
Host\ Bits=32-Prefix\ Length
$$

For `/26`:

$$
32-26=6
$$

Therefore:

```text
6 host bits
```

Total addresses:

$$
2^6=64
$$

Traditional usable host addresses:

$$
2^6-2=62
$$

---

# 8. Complete Example — /24 to /26

Starting network:

```text
192.168.1.0/24
```

Divide it into `/26` subnets.

### Step 1 — Calculate borrowed bits

```text
26 - 24 = 2
```

### Step 2 — Number of subnets

$$
2^2=4
$$

### Step 3 — Host bits

$$
32-26=6
$$

### Step 4 — Addresses per subnet

$$
2^6=64
$$

### Step 5 — Traditional usable hosts

$$
64-2=62
$$

---

# 9. The Four /26 Subnets

The resulting networks are:

```text
192.168.1.0/26
192.168.1.64/26
192.168.1.128/26
192.168.1.192/26
```

Why increments of 64?

Because:

```text
Addresses per subnet = 64
```

Therefore:

```text
0
64
128
192
```

---

# 10. Subnet Ranges

### Subnet 1

```text
Network:
192.168.1.0

Usable:
192.168.1.1
      ↓
192.168.1.62

Broadcast:
192.168.1.63
```

### Subnet 2

```text
Network:
192.168.1.64

Usable:
192.168.1.65
      ↓
192.168.1.126

Broadcast:
192.168.1.127
```

### Subnet 3

```text
Network:
192.168.1.128

Usable:
192.168.1.129
      ↓
192.168.1.190

Broadcast:
192.168.1.191
```

### Subnet 4

```text
Network:
192.168.1.192

Usable:
192.168.1.193
      ↓
192.168.1.254

Broadcast:
192.168.1.255
```

---

# 11. Visual Representation

```text
Original Network

192.168.1.0/24
│
├── 192.168.1.0/26
│
├── 192.168.1.64/26
│
├── 192.168.1.128/26
│
└── 192.168.1.192/26
```

One larger network became four smaller networks.

---

# 12. Subnet Mask

A subnet is defined by an IP address and a prefix length/subnet mask.

Example:

```text
192.168.1.0/26
```

The equivalent subnet mask is:

```text
255.255.255.192
```

Binary:

```text
11111111.11111111.11111111.11000000
```

Count the `1`s:

```text
8 + 8 + 8 + 2
= 26
```

Therefore:

```text
255.255.255.192 = /26
```

---

# 13. CIDR and Subnets

CIDR stands for:

> **Classless Inter-Domain Routing**

CIDR notation tells us where the network portion ends.

Example:

```text
10.0.1.0/24
```

means:

```text
Network bits = 24
Host bits = 8
```

Another example:

```text
10.0.1.0/26
```

means:

```text
Network bits = 26
Host bits = 6
```

The prefix length is therefore critical for understanding the subnet.

---

# 14. Important Subnetting Formulas

### Host bits

$$
H=32-P
$$

where:

```text
H = host bits
P = prefix length
```

### Total addresses

$$
2^H
$$

### Traditional usable hosts

$$
2^H-2
$$

### Number of subnets created

If `B` bits are borrowed:

$$
2^B
$$

### Addresses per subnet

$$
2^H
$$

### Block size

$$
256-\text{interesting subnet mask octet}
$$

---

# 15. Why Do We Subtract 2?

For a traditional IPv4 subnet:

```text
First address
    ↓
Network address

Last address
    ↓
Broadcast address
```

These two addresses traditionally aren't assigned to ordinary hosts.

Therefore:

$$
Usable\ Hosts=Total\ Addresses-2
$$

Example:

```text
/26
```

Host bits:

```text
6
```

Total:

$$
2^6=64
$$

Traditional usable:

$$
64-2=62
$$

---

# 16. Important Exceptions

Do **not** blindly apply `2^H - 2` to every networking environment.

## /31

Often used for point-to-point links.

## /32

Represents exactly one IPv4 address.

```text
/32
↓
32 network bits
0 host bits
↓
2⁰ = 1 address
```

These are particularly relevant when working with:

* Routing
* Cloud infrastructure
* Firewall rules
* Load balancers
* Point-to-point links

---

# 17. Types of Subnets

There is no single universal classification of "types of subnet." In real-world networking, subnets are commonly categorized based on **purpose, accessibility, architecture, or addressing**.

For DevOps and Cloud, the following distinctions matter.

---

# 18. Public Subnet

A public subnet is a subnet whose routing configuration allows appropriate direct connectivity to the Internet through an Internet Gateway or equivalent mechanism.

A typical architecture:

```text
Internet
    |
    ↓
Internet Gateway
    |
    ↓
Public Subnet
    |
    ├── Load Balancer
    └── Bastion / Public-facing resource
```

### Important

A subnet is **not public merely because it contains public IP addresses**.

Its routing configuration matters.

---

# 19. Private Subnet

A private subnet is generally designed for resources that should not have direct inbound Internet connectivity.

Example:

```text
Internet
    |
    ↓
Public Subnet
    |
 Load Balancer
    |
    ↓
Private Subnet
    |
 Application
```

The application may still access the Internet for outbound traffic through NAT, depending on architecture.

---

# 20. Database Subnet

In production cloud architectures, databases are often placed in private subnets.

Example:

```text
                    VPC
                     |
       +-------------+-------------+
       |                           |
 Public Subnet                Private Subnet
       |                           |
 Load Balancer                Application
                                   |
                                   ↓
                             Database Subnet
                                   |
                               Database
```

The database should generally not be directly exposed to the public Internet.

---

# 21. Application Subnet

Application servers can be placed into dedicated private subnets.

Example:

```text
Private App Subnet
10.0.2.0/24

10.0.2.10 → API Server
10.0.2.11 → API Server
10.0.2.12 → Worker
```

This provides logical organization.

---

# 22. Management Subnet

A separate subnet can be used for infrastructure management.

Examples:

```text
Management Subnet
      |
      ├── Bastion
      ├── Monitoring
      └── Management tools
```

Modern architectures may use identity-aware access, VPNs, SSM-like mechanisms, or zero-trust approaches instead of exposing SSH/RDP directly.

---

# 23. Subnet by Addressing Type

Subnets can also be discussed as:

```text
IPv4 subnet
IPv6 subnet
```

For example:

```text
IPv4:
10.0.1.0/24
```

IPv6 uses different addressing conventions and prefix lengths, commonly `/64` for many end-user/network segments.

---

# 24. Public vs Private Subnet

| Feature                 | Public Subnet                  | Private Subnet                           |
| ----------------------- | ------------------------------ | ---------------------------------------- |
| Direct Internet routing | Possible                       | Usually no direct inbound Internet route |
| Typical resources       | Load balancer, public services | Apps, databases                          |
| Public IP               | May be assigned                | Usually avoided                          |
| Internet access         | Through Internet Gateway/route | Often through NAT for outbound IPv4      |
| Security exposure       | Higher                         | Lower by design                          |

> **Important:** "Private" does not mean "cannot communicate with the Internet." It means the subnet is not directly exposed in the same way as an Internet-facing public subnet.

---

# 25. Internal Working of a Subnet

This is the most important conceptual section.

Suppose:

```text
IP:
192.168.1.50

Mask:
/24
```

The subnet mask is:

```text
255.255.255.0
```

Binary:

```text
IP:
11000000.10101000.00000001.00110010

Mask:
11111111.11111111.11111111.00000000
```

The mask tells us:

```text
1 → Network portion
0 → Host portion
```

Therefore:

```text
11000000.10101000.00000001 | 00110010
          Network             Host
```

So:

```text
Network = 192.168.1.0
Host    = .50
```

---

# 26. How a Host Determines Whether a Destination is Local

This is extremely important.

Suppose:

```text
Host:
192.168.1.10/24
```

Destination:

```text
192.168.1.20
```

Both belong to:

```text
192.168.1.0/24
```

Therefore the destination is on the same subnet.

The host can communicate using local Layer-2 mechanisms such as ARP for IPv4.

---

# 27. What If the Destination is on Another Subnet?

Suppose:

```text
Host:
192.168.1.10/24
```

Destination:

```text
192.168.2.20
```

The destination is not part of:

```text
192.168.1.0/24
```

Therefore the host needs to send the traffic toward a router/default gateway.

Example:

```text
Host
192.168.1.10
     |
     ↓
Default Gateway
192.168.1.1
     |
     ↓
Router
     |
     ↓
192.168.2.0/24
     |
     ↓
192.168.2.20
```

---

# 28. How the Host Calculates the Network

A host can determine the network address using a **bitwise AND operation** between:

```text
IP address
AND
Subnet mask
```

Example:

```text
IP:
192.168.1.50

Mask:
255.255.255.0
```

Binary:

```text
IP:
11000000.10101000.00000001.00110010

Mask:
11111111.11111111.11111111.00000000
```

AND operation:

```text
11000000
10101000
00000001
00000000
```

Result:

```text
192.168.1.0
```

Therefore:

```text
Network Address = 192.168.1.0
```

---

# 29. Bitwise AND Rule

You should know these four rules:

|  A |  B | A AND B |
| -: | -: | ------: |
|  0 |  0 |       0 |
|  0 |  1 |       0 |
|  1 |  0 |       0 |
|  1 |  1 |       1 |

The only time AND produces `1` is:

```text
1 AND 1 = 1
```

This is how the network portion is extracted from an IP address using the subnet mask.

---

# 30. How Routing Works Between Subnets

Consider:

```text
Subnet A
10.0.1.0/24

Subnet B
10.0.2.0/24
```

A host in Subnet A wants to communicate with a host in Subnet B.

```text
10.0.1.10
     |
     ↓
Gateway / Router
     |
     ↓
10.0.2.20
```

The router uses its routing table to determine how to reach:

```text
10.0.2.0/24
```

This is why subnetting and routing are closely related.

---

# 31. Subnet Is Not a Security Boundary by Itself

This is a very important professional-level concept.

Do not say:

> "A subnet automatically provides security."

It doesn't.

A subnet provides **logical segmentation**.

Actual traffic control may be enforced using:

* Routers
* Firewalls
* Security Groups
* Network ACLs
* Kubernetes NetworkPolicies
* Cloud firewall rules
* Service meshes
* Routing policies

For example:

```text
Subnet A
    |
    | traffic
    ↓
Firewall
    |
    ↓
Subnet B
```

The firewall decides whether traffic is allowed.

---

# 32. Why Subnets Are Important in Industry

Subnets are used for:

### Network segmentation

Separate workloads logically.

### Security architecture

Limit which systems can communicate.

### Routing

Create clear network paths.

### IP management

Allocate address ranges systematically.

### Scalability

Support large infrastructure.

### Fault isolation

A network problem can sometimes be isolated to a specific segment.

### Compliance

Sensitive workloads can be placed into controlled network segments.

---

# 33. Real Production Architecture

A common cloud architecture might look like:

```text
                         INTERNET
                            |
                            ↓
                   Internet Gateway
                            |
              +-------------+-------------+
              |                           |
        Public Subnet                Public Subnet
         10.0.1.0/24                 10.0.2.0/24
              |                           |
        Load Balancer                Load Balancer
              |                           |
              +-------------+-------------+
                            |
                            ↓
                    Private App Subnets
                     10.0.11.0/24
                     10.0.12.0/24
                            |
                            ↓
                    Private DB Subnets
                     10.0.21.0/24
                     10.0.22.0/24
```

This pattern is common across cloud architectures, although the exact implementation differs by provider.

---

# 34. Subnets in AWS

In AWS, a **VPC** has an IP address range, and subnets are created inside that VPC.

Example:

```text
VPC
10.0.0.0/16
```

Subnets:

```text
10.0.1.0/24
10.0.2.0/24
10.0.11.0/24
10.0.12.0/24
```

A subnet is associated with an **Availability Zone**.

A typical architecture may have:

```text
VPC
 |
 +── AZ-A
 |    ├── Public Subnet
 |    └── Private Subnet
 |
 +── AZ-B
      ├── Public Subnet
      └── Private Subnet
```

This is extremely important for Cloud/DevOps interviews.

---

# 35. Subnets in Azure

Azure uses a similar model:

```text
Virtual Network
       |
       +── Subnet A
       |
       +── Subnet B
       |
       +── Subnet C
```

For example:

```text
VNet:
10.0.0.0/16

Subnet:
10.0.1.0/24
```

Network Security Groups and route tables can control traffic.

---

# 36. Subnets in GCP

Google Cloud also uses VPC networking and subnetworks.

Example:

```text
VPC
 |
 +── Subnetwork A
 |
 +── Subnetwork B
```

Subnet configuration is closely connected to:

* Routes
* Firewall rules
* Regions
* Workloads
* Private connectivity

---

# 37. Subnets and Terraform

Terraform is commonly used to create cloud network infrastructure as code.

Conceptually:

```text
Terraform
    |
    ↓
VPC / VNet
    |
    ↓
Subnets
    |
    ↓
Route Tables
    |
    ↓
Security Rules
```

A DevOps engineer should understand the networking architecture before writing Terraform.

Otherwise, Terraform becomes:

> "Code that creates infrastructure I don't understand."

That is a bad engineering habit.

---

# 38. Subnets in Kubernetes

Kubernetes networking is different from traditional VPC subnetting, but the concepts interact.

A Kubernetes environment may have:

```text
Cloud VPC
    |
    +── Node Subnet
           |
           +── Node
           |     |
           |     +── Pod IP
           |
           +── Node
                 |
                 +── Pod IP
```

Depending on the CNI and cloud integration, Pod IPs may come from:

* A dedicated Pod CIDR
* Node-level Pod CIDRs
* VPC/subnet address space
* Overlay networks

Therefore, always understand **which network layer you're talking about**.

---

# 39. Subnet vs Pod CIDR

Do not confuse:

```text
Cloud subnet
```

with:

```text
Kubernetes Pod CIDR
```

They may be related, but they are not automatically the same thing.

Example:

```text
Cloud VPC
10.0.0.0/16
       |
       +── Node Subnet
           10.0.1.0/24
               |
               +── Kubernetes nodes
               |
               +── Pod CIDR
                   10.244.0.0/16
```

The exact design depends on the Kubernetes networking implementation.

---

# 40. Subnetting vs Supernetting

### Subnetting

Break a larger network into smaller networks.

```text
10.0.0.0/16
      ↓
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
```

### Supernetting

Combine multiple smaller contiguous networks into a larger summarized route.

Conceptually:

```text
10.0.0.0/24
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
        ↓
10.0.0.0/22
```

Supernetting is useful for **route summarization**.

---

# 41. Route Summarization

Suppose a router has:

```text
10.0.0.0/24
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
```

Instead of advertising four routes, they can potentially be summarized as:

```text
10.0.0.0/22
```

provided the networks are aligned correctly and the routing design allows it.

This reduces routing-table entries.

---

# 42. VLSM

VLSM stands for:

> **Variable Length Subnet Mask**

It means different subnets can have different prefix lengths.

Example:

```text
10.0.0.0/24

        ↓

10.0.0.0/26
10.0.0.64/27
10.0.0.96/28
10.0.0.112/28
```

Why?

Because different systems need different numbers of addresses.

For example:

```text
Large application → /26

Small service     → /28
```

This avoids wasting large address blocks.

---

# 43. VLSM in Cloud Engineering

Suppose your VPC is:

```text
10.0.0.0/16
```

You might allocate:

```text
Public Load Balancer:
10.0.1.0/24

Application:
10.0.10.0/24

Database:
10.0.20.0/27

Management:
10.0.30.0/28
```

The exact design depends on expected capacity, availability-zone strategy, and provider constraints.

The principle is:

> **Allocate address space according to actual requirements rather than randomly choosing CIDRs.**

---

# 44. Overlapping Subnets

Two networks are problematic when their address spaces overlap in a context where they need to be routed together.

Example:

```text
Network A:
10.0.0.0/16

Network B:
10.0.0.0/16
```

If you try to connect them directly:

```text
Network A
10.0.0.0/16
      ↕
Network B
10.0.0.0/16
```

routing becomes ambiguous.

This is why careful IP planning matters in:

* VPC peering
* VPNs
* Hybrid cloud
* Multi-cloud
* Kubernetes networking
* Mergers/integrations

---

# 45. Subnet Planning

Before creating subnets, consider:

### 1. Number of workloads

How many systems need addresses?

### 2. Growth

Will the workload increase?

### 3. Availability Zones

Do you need separate subnets per AZ?

### 4. Security boundaries

Which systems should be isolated?

### 5. Routing

Which networks need to communicate?

### 6. Future integrations

Will you connect:

* Another VPC?
* On-premises network?
* VPN?
* Another cloud?
* Partner network?

### 7. Address overlap

Will the CIDR conflict with another network?

---

# 46. Example of Bad Subnet Planning

Suppose:

```text
VPC = 10.0.0.0/24
```

You use almost the entire range immediately:

```text
Public = 10.0.0.0/25
Private = 10.0.0.128/26
```

Now very little address space remains.

Later you need:

```text
More application nodes
More availability zones
More services
```

You may discover that your address space is too constrained.

### Lesson

> **IP planning should account for future growth, not only today's requirements.**

---

# 47. Example of Better Planning

Instead:

```text
VPC:
10.0.0.0/16
```

Reserve logical ranges:

```text
10.0.0.0/20    → Public
10.0.16.0/20   → Application
10.0.32.0/20   → Database
10.0.48.0/20   → Management
```

You have intentionally left space for future expansion.

The exact ranges are architecture-dependent; there is no universal "correct" layout.

---

# 48. Availability Zones and Subnets

In many cloud platforms, availability zones are separate infrastructure locations within a region.

A common high-availability design uses multiple subnets across zones.

Example:

```text
Region
 |
 +── AZ-A
 |    |
 |    +── Public Subnet
 |    +── Private Subnet
 |
 +── AZ-B
      |
      +── Public Subnet
      +── Private Subnet
```

This helps distribute workloads across failure domains.

---

# 49. Important Distinction: Subnet ≠ Availability Zone

These are different concepts.

```text
Availability Zone
        ↓
Physical/logical cloud infrastructure location

Subnet
        ↓
Logical IP network segment
```

In some cloud platforms, a subnet has a specific relationship with a zone.

Do not treat:

```text
Subnet = AZ
```

as a universal concept.

---

# 50. Subnet and Routing Table

A subnet alone does not determine the entire traffic path.

Routing tables determine where traffic goes.

Example:

```text
Subnet
10.0.1.0/24
       |
       ↓
Route Table
       |
       +── 10.0.2.0/24 → Internal Router
       |
       +── 0.0.0.0/0 → Internet/NAT path
```

The routing table tells the network where traffic should be sent.

---

# 51. Subnet and Firewall

Subnet:

```text
Logical network segment
```

Firewall:

```text
Traffic control
```

Example:

```text
App Subnet
10.0.10.0/24
      |
      | TCP 5432
      ↓
Database Subnet
10.0.20.0/24
```

A firewall/security rule can allow:

```text
Source:
10.0.10.0/24

Destination:
10.0.20.0/24

Port:
5432
```

This allows PostgreSQL traffic while potentially blocking everything else.

---

# 52. Troubleshooting Subnet Problems

When two systems cannot communicate, check:

```text
1. Are their IP addresses correct?
        ↓
2. Are they in the expected subnets?
        ↓
3. Is the subnet mask correct?
        ↓
4. Is routing configured?
        ↓
5. Is the route table correct?
        ↓
6. Is the firewall/security group allowing traffic?
        ↓
7. Is the destination service listening?
        ↓
8. Is the correct port being used?
        ↓
9. Is DNS resolving correctly?
        ↓
10. Is a NetworkPolicy/CNI rule blocking traffic?
```

---

# 53. Useful Linux Commands

Display addresses:

```bash
ip addr
```

Display routes:

```bash
ip route
```

Check which route Linux would use:

```bash
ip route get 10.0.2.10
```

Show interface details:

```bash
ip link
```

Test connectivity:

```bash
ping 10.0.2.10
```

Trace path:

```bash
traceroute 10.0.2.10
```

Check listening ports:

```bash
ss -tulnp
```

Test a specific TCP port:

```bash
nc -vz 10.0.2.10 5432
```

---

# 54. Important DevOps Interview Scenario

### Question

Your application is:

```text
10.0.1.10/24
```

Your database is:

```text
10.0.2.10/24
```

The application cannot connect to PostgreSQL on port `5432`.

Do not immediately blame PostgreSQL.

Think:

```text
Application
    |
    ↓
10.0.2.10
    |
    ↓
Different subnet
    |
    ↓
Routing?
    |
    ↓
Firewall/Security Group?
    |
    ↓
Port 5432 allowed?
    |
    ↓
Database listening?
    |
    ↓
Correct bind address?
```

This is how a real infrastructure engineer thinks.

---

# 55. Common Subnet Mistakes

### Mistake 1

Thinking:

> `/24` means 24 hosts.

Wrong.

It means:

```text
24 network bits
```

There are:

```text
8 host bits
```

---

### Mistake 2

Thinking:

> Bigger CIDR number means bigger network.

Wrong.

For example:

```text
/16 → larger network
/24 → smaller network
/26 → even smaller network
```

As the prefix increases, the network generally becomes smaller.

---

### Mistake 3

Thinking:

> All `10.x.x.x` addresses are on the same network.

Wrong.

For example:

```text
10.0.1.10/24
10.0.2.10/24
```

are different subnets.

---

### Mistake 4

Thinking:

> Subnet automatically provides security.

Wrong.

Subnetting provides segmentation.

Security requires controls such as:

```text
Firewall
Security Groups
NACLs
NetworkPolicies
Routing controls
```

---

### Mistake 5

Thinking:

> Public subnet means every resource has a public IP.

Wrong.

A subnet's public/private behavior depends on routing and architecture. Individual resources may or may not have public addresses.

---

# 56. CIDR Size Mental Model

Remember:

```text
Smaller prefix → Larger network
Larger prefix  → Smaller network
```

Example:

```text
/16
 ↓
Large

/24
 ↓
Smaller

/28
 ↓
Very small

/32
 ↓
Exactly one IPv4 address
```

---

# 57. Quick CIDR Reference

|  CIDR | Host Bits | Total IPv4 Addresses | Traditional Usable |
| ----: | --------: | -------------------: | -----------------: |
| `/16` |        16 |               65,536 |             65,534 |
| `/20` |        12 |                4,096 |              4,094 |
| `/21` |        11 |                2,048 |              2,046 |
| `/22` |        10 |                1,024 |              1,022 |
| `/23` |         9 |                  512 |                510 |
| `/24` |         8 |                  256 |                254 |
| `/25` |         7 |                  128 |                126 |
| `/26` |         6 |                   64 |                 62 |
| `/27` |         5 |                   32 |                 30 |
| `/28` |         4 |                   16 |                 14 |
| `/29` |         3 |                    8 |                  6 |
| `/30` |         2 |                    4 |                  2 |
| `/31` |         1 |                    2 |            Special |
| `/32` |         0 |                    1 |          1 address |

---

# 58. Subnetting Cheat Sheet

```text
IPv4 = 32 bits

Host Bits:
32 - Prefix

Total Addresses:
2^(Host Bits)

Traditional Usable Hosts:
2^(Host Bits) - 2

Borrowed Bits:
New Prefix - Old Prefix

Number of Subnets:
2^(Borrowed Bits)

Block Size:
256 - Mask Octet
```

---

# 59. One-Minute Revision

```text
Subnet
  ↓
Smaller logical network created from a larger network
  ↓
Created using subnetting/CIDR
  ↓
Network bits + Host bits
  ↓
Subnet mask defines the boundary
  ↓
Hosts communicate locally when destination is on same subnet
  ↓
Different subnet → routing/gateway required
```

### Why subnets?

```text
Segmentation
Security architecture
Routing
IP management
Scalability
Isolation
Troubleshooting
Cloud architecture
```

### Cloud architecture

```text
VPC / VNet
     |
     +── Public Subnets
     |
     +── Private App Subnets
     |
     +── Private Database Subnets
```

### DevOps stack

```text
Subnet
  ↓
Route Table
  ↓
Firewall / Security Group
  ↓
Port
  ↓
Service
  ↓
Application
```

---

# 60. Interview Questions

## Basic

1. What is a subnet?
2. Why do we use subnets?
3. What problem does subnetting solve?
4. What is the relationship between an IP address and a subnet?
5. What is a subnet mask?
6. What does `/24` mean?
7. What is CIDR?
8. What is the difference between a network address and a host address?
9. What is a broadcast address?
10. Why are network and broadcast addresses traditionally not assigned to normal hosts?

## Intermediate

11. How do you calculate the number of hosts in a subnet?
12. How many hosts can `/26` support?
13. How many `/26` networks can be created from a `/24`?
14. What is VLSM?
15. What is subnetting vs supernetting?
16. What is route summarization?
17. Why does `/24` provide fewer addresses than `/16`?
18. What happens when a host communicates with another subnet?
19. What is the purpose of a default gateway?
20. How is the network address calculated using bitwise AND?

## Cloud/DevOps

21. What is a VPC CIDR?
22. What is the difference between a public and private subnet?
23. How does a cloud subnet communicate with the Internet?
24. Why are databases usually placed in private subnets?
25. What is the relationship between a subnet and a route table?
26. Is a subnet itself a security mechanism?
27. What happens if two VPCs have overlapping CIDRs?
28. Why should you plan CIDRs before building cloud infrastructure?
29. How are subnets used across Availability Zones?
30. What is the difference between a cloud subnet and a Kubernetes Pod CIDR?
31. How does Terraform create and manage subnets?
32. How would you troubleshoot connectivity between two subnets?
33. Why is CIDR knowledge important for Kubernetes?
34. How does NAT interact with private subnets?
35. What is longest-prefix match?

---

# 🎯 Final Mental Model

```text
                    LARGE IP NETWORK
                          |
                    SUBNETTING
                          |
             +------------+------------+
             |            |            |
          Subnet A     Subnet B     Subnet C
             |            |            |
           Apps         Apps          DB
             |            |            |
             +------------+------------+
                          |
                       ROUTING
                          |
                    FIREWALL RULES
                          |
                         PORT
                          |
                       SERVICE
                          |
                      APPLICATION
```

> **The core idea:** A subnet is not just "a smaller network." It is a way to create **logical network boundaries** that allow an organization or cloud architecture to control addressing, routing, segmentation, scalability, and traffic flow.
