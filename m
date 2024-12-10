Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F39EA92B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2024 07:59:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tKuCx-00009y-DF;
	Tue, 10 Dec 2024 06:58:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tKuCv-00009q-Ic
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 06:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KwWmXKpenER4zcFyScxXr9YKWQyPUGNP2OmpcbnexhE=; b=OGGHi2vyoH16VhTmIWqxubAn1z
 B8yWm7L298LcmGUUyEojE3IuozvtPX2kbZXsv09JdyjHxZOO68OnccWPxokRT6OJmcMkTyWMv24H9
 oHHeEQGOVXzTt2haAMbqN9+V/A89QKCbrT7mDsPzTAiuk/7bSkyty/d0H4U5kRhpHs8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KwWmXKpenER4zcFyScxXr9YKWQyPUGNP2OmpcbnexhE=; b=X
 B2pTtTqESSTdqskaZz5pkupIdDcL6caKvnrbh4Cg4lZLRtJ0G72Obr/ADPCOSTDxNsG0eFgj9fSoZ
 OgbGAPbMZPMVGo6FDMIDN8Ug2iuRMIM6Z+rAAskgPcYJTawOsz4zn1vwmGUmeq5kTbaxKohscFPAe
 Oojgn7XY0S4tM1OQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tKuCu-0007EP-9E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 06:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 325D45C628E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Dec 2024 06:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A18BC4CED6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Dec 2024 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733813924;
 bh=0sGEJCaAsqsptavo4/8H4jOelXLHonp8xW8MDjwrhRI=;
 h=From:To:Subject:Date:From;
 b=aXR/VJyjR1C2Ro7r4J1XW3j433/H8kDE51f0J/4URx6ZkYtsvSi49bdeZ0nzGYE7l
 I7RfuWAQiWOarIEMEwBkWmfr8R46OMs7sk1K7pymhBbYa9J2LtXeEJ39+IaVfE9w5s
 kzs7y0Hj3zVi86bNfBB9+2Vl9/BvW2I3tHtkfvvS/abPzgwUEOgJNlMHLFPMg+OfLE
 dqofEHUQ0qEP85wpx9auyYWtVXM9xLScfkv1PxQJQj92idSSh808foolPuScshyhjd
 iuFkMo95gbcffpi99wdyhxJ6OKsinqmzxgRWQcx2xjU2OryRdc6kdr+x0lir0NsJBt
 3/sOuilv7MZqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 501EAC3279F; Tue, 10 Dec 2024 06:58:44 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 10 Dec 2024 06:58:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: hanqi@vivo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219586-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219586 Bug ID:
 219586 Summary: Unable to find file after unicode change Product: File System
 Version: 2.5 Hardware: All OS: Linux Status: NEW Severity: blocking Priority:
 P3 Component: f2fs Assignee: filesy [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tKuCu-0007EP-9E
Subject: [f2fs-dev] [Bug 219586] New: Unable to find file after unicode
 change
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTk1ODYKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjE5NTg2CiAgICAgICAgICAgU3VtbWFyeTogVW5hYmxlIHRvIGZpbmQg
ZmlsZSBhZnRlciB1bmljb2RlIGNoYW5nZQogICAgICAgICAgIFByb2R1Y3Q6IEZpbGUgU3lzdGVt
CiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICAgICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAg
ICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVy
aXR5OiBibG9ja2luZwogICAgICAgICAgUHJpb3JpdHk6IFAzCiAgICAgICAgIENvbXBvbmVudDog
ZjJmcwogICAgICAgICAgQXNzaWduZWU6IGZpbGVzeXN0ZW1fZjJmc0BrZXJuZWwtYnVncy5rZXJu
ZWwub3JnCiAgICAgICAgICBSZXBvcnRlcjogaGFucWlAdml2by5jb20KICAgICAgICBSZWdyZXNz
aW9uOiBObwoKSGkgZXZlcnlib2R5LApUaGUgZjJmcyBmaWxlc3lzdGVtIGlzIHVuYWJsZSB0byBy
ZWFkIHNvbWUgZmlsZXMgd2l0aCBzcGVjaWFsIGNoYXJhY3RlcnMsCnN1Y2ggYXMg4p2k77iPLCBh
ZnRlciB0aGUga2VybmVsIHdhcyB1cGRhdGVkIHdpdGggdGhlIGZvbGxvd2luZyBwYXRjaDoKaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4
LmdpdC9jb21taXQvP2lkPTE4YjVmNDdlN2RhNDZkM2EwZDczMzFlNDhiZWZjYWYxNTFlZDJkZGYK
CldlIGNhbiByZXByb2R1Y2UgdGhpcyBpbiB0aGUgZm9sbG93aW5nIHN0ZXBzOgox44CBRmlyc3Qs
IHdlIG5lZWQgdG8gcm9sbCBiYWNrIHRoZSB1bmljb2RlLXJlbGF0ZWQgY2hhbmdlcyBhYm92ZSBh
bmQgY3JlYXRlCnRoZSBzcGVjaWFsIGNoYXJhY3RlciBmaWxlIG9yIGZvbGRlcjoKLi90b29scy9t
a2ZzLmYyZnMgLWYgLU8gY2FzZWZvbGQgLUMgdXRmOCBmMmZzLmltZwptb3VudCBmMmZzLmltZyBm
MmZzX2Rpci8KbWtkaXIgUGljdHVyZQouL2YyZnNfaW8gc2V0ZmxhZ3MgY2FzZWZvbGQgUGljdHVy
ZQpjZCBQaWN0dXJlCnRvdWNoIOKdpO+4jwoKMuOAgVRoZW4gd2UgYXBwbHkgdGhlIGFib3ZlIHVu
aWNvZGUgcGF0Y2gsIGFuZCBhZnRlciBtb3VudGluZyB0aGUgZmlsZXN5c3RlbSwKd2UgZ2V0IGEg
bWVzc2FnZSB0aGF0IHRoZSBzcGVjaWFsIGNoYXJhY3RlciBmaWxlIHdhcyBub3QgZm91bmQuCm1v
dW50IGYyZnMuaW1nIGYyZnNfZGlyLwpjZCBQaWN0dXJlCmxzIC1hbGgKbHM6IGNhbm5vdCBhY2Nl
c3MgJ+KdpO+4jyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKdG90YWwgOApkcnd4ci14ci14
IDIgcm9vdCByb290IDM0ODggRGVjIDEwIDA2OjExIC4KZHJ3eHIteHIteCAzIHJvb3Qgcm9vdCA0
MDk2IERlYyAgOSAxMDoyMSAuLgotPz8/Pz8/Pz8/ID8gPyAgICA/ICAgICAgID8gICAgICAgICAg
ICA/IOKdpO+4jwoKSGVyZSBhcmUgdGhlIGNvbmNsdXNpb25zIG9mIG15IHByZWxpbWluYXJ5IGFu
YWx5c2lzLgpJbiBjYXNlZm9sZS1lbmFibGVkIGYyZnMgZmlsZXN5c3RlbXMsIGZpbGUgbmFtZXMg
YXJlIGNvbnZlcnRlZCB0byBsb3dlcmNhc2UKYnkgdGhlIHV0ZjhfY2FzZWZvbGQgZnVuY3Rpb24g
d2hlbiBxdWVyeWluZyBmb3IgYSBmaWxlLCBhbmQgdGhlbiB0aGUgaGFzaCBpcwpjYWxjdWxhdGVk
IGJhc2VkIG9uIHRoZSBsb3dlcmNhc2UgZmlsZW5hbWUgYW5kIHN0b3JlZCBvbiBkaXNrLiBUaGUg
cGF0aCB0bwp0aGUgZnVuY3Rpb24gaXM6CmYyZnNfbG9va3VwCiAgICBmMmZzX3ByZXBhcmVfbG9v
a3VwCiAgICAgICAgX19mMmZzX3NldHVwX2ZpbGVuYW1lCiAgICAgICAgICAgIGYyZnNfaW5pdF9j
YXNlZm9sZGVkX25hbWUKICAgICAgICAgICAgICAgIHV0ZjhfY2FzZWZvbGQKICAgICAgICAgICAg
ZjJmc19oYXNoX2ZpbGVuYW1lCiAgICBfX2YyZnNfZmluZF9lbnRyeQoKRm9yIHNvbWUgZmlsZXMg
dGhhdCBjb250YWluIHNwZWNpYWwgY2hhcmFjdGVycywgc3VjaCBhcyDinaTvuI8uIFdlIGZvdW5k
IHRoYXQgdGhlCmxlbmd0aCBvZiB0aGUgb3V0cHV0IGNoYXJhY3RlcnMgY2hhbmdlZCBhZnRlciB0
aGUgdXRmOF9jYXNlZm9sZCBmdW5jdGlvbgpjb252ZXJ0ZWQKdGhlbSB0byBsb3dlcmNhc2UgYmVm
b3JlIGFuZCBhZnRlciB0aGUgcGF0Y2gsIHdoaWNoIHVsdGltYXRlbHkgbGVkIHRvIGEgY2hhbmdl
CmluIHRoZQpjYWxjdWxhdGVkIGhhc2guIEZpbGVzIGNyZWF0ZWQgYmVmb3JlIHBhdGNoIGFyZSBu
b3QgcmVhZGFibGUgYWZ0ZXIgcGF0aCBpcwplbmFibGVkLgoKSSB0aGluayB3ZSBuZWVkIHRvIG1v
ZGlmeSB0aGUgZjJmcyBmaWxlc3lzdGVtIHRvIGJlIGNvbXBhdGlibGUgd2l0aCB1bmljb2RlCnJl
bGF0ZWQgY2hhbmdlcy4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEg
Y29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
