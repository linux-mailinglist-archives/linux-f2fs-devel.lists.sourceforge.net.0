Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF669B58BCA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 04:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBOe1o+2Cy3qQv1SU9BZcQqMJtCtg3I4v8R9nYaINJQ=; b=BA9gFoQ3aA/+Cw/8eoPJKD5bxi
	oz1pPM3mb9SshJISVRYMpYaJ8jKQcOTHZNSqAsl/QpJ9q10u13EWLppI0BNSgezveYSkOYxrefEoF
	Lq/Pv22BKN1WTdKWUEQGw20506y3OlxQhQbbbI1sasDJjkeRduC41dI+3SqcjJ6fTnXE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyLIb-0006gV-QY;
	Tue, 16 Sep 2025 02:20:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uyLIa-0006gP-2t
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HKg/U2PxkffQxNZLZVvTtK4KGC7H/RtEFGOBVYrxkSA=; b=Ur6XM6hyUsKacLtLmt8ikGQNjD
 JRmGLaYGwAPRRbD1hckofy1WINX3gDpwT3WE8+PqPeQvSi+lheDMv70/n+vza2Jzz6KrJDd3IuQEE
 9blhpFCBeB7bADit3Ek4dHDPBUUZrsb4v7AnDwDkp3V3/YSYz1Ellkz70Z+twVwQhyXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HKg/U2PxkffQxNZLZVvTtK4KGC7H/RtEFGOBVYrxkSA=; b=PLeLEJmdM0upilE8DRk5ugFFkx
 RIa5pMqM7++quUtO9/2M0QStlFnx3u9fS9YuUPPW5ocyyIMP3be4grUi4rQrOvdEBZo67A7O3rk+5
 BnFIn1N+AhIyOXD1IL2vJGrWKuHZFp6S+1iSTEQWgmjrST0+ZuJa8E4WPcTPK8vbii6c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyLIY-0001Lm-TA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 798CC43DA0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Sep 2025 02:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57682C4CEF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Sep 2025 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757989192;
 bh=z+qwu+IrFHNUlnt75fJleeQ1yKbM9XBYWr6oCJzQBJk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WPjJc1aqO8pymFvH2hzVYRWhGD1kd2RTZhvto+GHDUJduq5YVimSdABUPwyRPVCyX
 lGziL/BEg4+npKZs7DAtB1ZpVlajGojJeRaqyyLqPQuq4PYIcsm7vkmrYpKw+uYmJP
 x4j9P55Ypr//pv91lkiVIQ3z7YqU0JCoQlyANNkG5jlPr7kVSW75qREIwA6P4EdfpW
 urz4Ps/ZKYpKb8cU+GGbspNNhNPtYc0Vo3r/wlaHhSqsdkMpgzyrFLo9YTo7aXQ1K2
 PxNFnATRNl0JaoLA8qbrO9kLDcULmxeiw1RmjOGGZM4d9a+ZXhvbRY58GH5fvvQUCJ
 pOoIK2B+ldoaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 40A97C433E1; Tue, 16 Sep 2025 02:19:52 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 16 Sep 2025 02:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: JY.Ho@mediatek.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-dqd9ZBPSsZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #2 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #1)
 > Hi, > > Do you have a ramdump about this issue, if there is, can you please
 provide > more information about the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyLIY-0001Lm-TA
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=220575

--- Comment #2 from JY (JY.Ho@mediatek.com) ---
(In reply to Chao Yu from comment #1)
> Hi,
> 
> Do you have a ramdump about this issue, if there is, can you please provide
> more information about the corrupted page?
> 
> Thanks,

Hi Chao,

Do you mean the sysreg dump? or are there some kernel configurations I need to
enable? 

Thanks

as below:
Unable to handle kernel NULL pointer dereference at virtual address
0000000000000000
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 39-bit VAs, pgdp=0000000037b28000
[0000000000000000] pgd=0800000039429003, p4d=0800000039429003,
pud=0800000039429003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Kernel Offset: 0x0 from 0xffffffc080000000
PHYS_OFFSET: 0x0
pstate: 20400005 (nzCv daif +PAN -UAO)
pc : [0xffffffe51d249484] f2fs_is_cp_guaranteed+0x70/0x98
lr : [0xffffffe51d24adbc] f2fs_merge_page_bio+0x520/0x6d4
sp : ffffffc08cc13280
x29: ffffffc08cc132a0 x28: fffffffec0bae200
x27: 0000000000000168 x26: dead000000000100
x25: 0000000000000002 x24: 0000000000000000
x23: ffffff8077b65ae8 x22: ffffff802a06a000
x21: fffffffec1fcb240 x20: ffffff802a06a000
x19: ffffffc08cc133d0 x18: 0000000000000000
x17: 000000008c623181 x16: 000000008c623181
x15: 000000000000ba7e x14: ffffff802a7accc0
x13: ffffffc08cc10000 x12: ffffffc08cc14000
x11: 0000000000000000 x10: 0000000000000001
x9 : ffffffe51d24adbc x8 : 0000000000000000
x7 : 0000000000000000 x6 : 0000000000000000
x5 : fffffffebf3448e0 x4 : 0000000000000000
x3 : ffffffc08cc13070 x2 : 0000000000001000
x1 : fffffffec1fcb240 x0 : 0000000000000000
PC: 0xffffffe51d249484:
9400: 94037df0 a8c17bfd d50323bf d65f03c0 e9161943 aa1e03e9 d503201f f9400c08
9420: b4000308 f9400108 f9401509 f941c92a f9402109 b945b94b eb0b013f 540001e0
9440: b945b54a eb0a013f 54000180 79400109 12140d29 7140113f 54000100 7140213f
9460: 54000061 39403108 37280088 f9400008 36780128 14000006 52800020 d65f03c0
9480: f9401400 f9400008 36780068 f8428c08 37000068 2a1f03e0 d65f03c0 f9400008
94a0: d3410500 d65f03c0 df7ce677 aa1e03e9 d503201f f940000a b94bec09 aa0003e8
94c0: f9407940 7100093f 540001eb f945f908 91016108 14000004 f1000529 9101a108
94e0: 54000120 b85fc10a 6b0a002a 54ffff63 b940010b 6b01017f 54ffff03 f85b0100
9500: 2a0a03e1 b4000062 d37d7c28 f9000048 d65f03c0 00d09e79 aa1e03e9 d503201f
LR: 0xffffffe51d24adbc:
ad30: 942e9b7a 910022e0 91046282 f9409281 eb02001f 54000820 eb00003f 540007e0
ad50: f9400028 eb02011f 54000781 f9009280 a90086e2 f9000020 9104a280 97eadec0
ad70: 91054280 52800061 2a1f03e2 aa1f03e3 97ea9b97 f9403260 b4000140 f94002a8
ad90: 37300068 aa1f03e8 14000002 394102a8 52820009 aa1503e1 9ac82122 97f8665d
adb0: f9400274 aa1c03e0 97fff997 52800388 7200001f 52800309 9a881128 8b080288
add0: 91196108 d503201f 52800029 b829011f b9401e68 f9403a69 2a1f03e0 f9000128
adf0: f9400be8 f9403669 f9000128 d5384108 f9432508 f85f83a9 eb09011f 540001c1
ae10: a9474ff4 a94657f6 a9455ff8 a94467fa a9436ffc a9427bfd 910203ff d50323bf
ae30: d65f03c0 d1000515 17fffeb0 d1000501 17fffeba 942e77da 97e7411a 17ffffc7
SP: 0xffffffc08cc13280:
3200: 00000100 dead0000 00000168 00000000 c0bae200 fffffffe 8cc132a0 ffffffc0
3220: 1d24adbc ffffffe5 8cc13280 ffffffc0 1d249484 ffffffe5 20400005 00000000
3240: 00000100 dead0000 00000001 00000000 00000000 00000000 77b65ae8 ffffff80
3260: 8cc132a0 ffffffc0 1d249484 ffffffe5 2994b968 ffffff80 00000000 00000000
3280: c1fcb240 fffffffe c0bae200 fffffffe 75c5a700 ffffff80 7572b200 8abc58ea
32a0: 8cc13310 ffffffc0 1d271100 ffffffe5 00000021 00000000 00000000 00000000
32c0: 00000001 00000000 8cc13980 ffffffc0 8cc1357c ffffffc0 00000002 00000000
32e0: 8cc13350 ffffffc0 0018f948 00000000 2a06a000 ffffff80 8cc133d0 ffffffc0
X1: 0xfffffffec1fcb240:
b1c0: 00000000 00000000 c1fcb101 fffffffe 00000122 dead0000 00000400 dead0000
b1e0: 000eb1f2 00000000 00000000 00000000 00000002 00000000 00000000 00000000
b200: 00000000 00000000 00000000 00000000 00000122 dead0000 00000000 00000000
b220: 00015b6f 00000000 00000000 00000000 ffffffff 00000001 00000000 00000000
b240: 00009029 10000000 c2727708 fffffffe c1fce348 fffffffe 35760fc8 ffffff80
b260: 00000021 00000000 00000009 00000000 00000000 00000004 31cb30c0 ffffff80
b280: 00180028 00000000 00000100 dead0000 00000001 dead0000 3364f958 ffffff80
b2a0: 000006c9 00000000 00000000 00000000 00000023 00000025 4c5a6b40 ffffff80
X3: 0xffffffc08cc13070:
2ff0: 00000000 00000000 00000000 00000000 00000000 00000000 8cc13130 ffffffc0
3010: 96000006 00000000 00000000 00000000 00000002 00000000 00002001 00000000
3030: 8cc13090 ffffffc0 1ddf9794 ffffffe5 6c286180 ffffff80 00000168 00000000
3050: 00000100 dead0000 00000002 00000000 00000000 00000000 20400005 00000000
3070: 1de0e0f0 ffffffe5 00000000 00000000 6c286180 ffffff80 96000006 00000000
3090: 8cc130c0 ffffffc0 1cc4bc48 ffffffe5 00000000 00000000 1cc23a24 ffffffe5
30b0: 8cc13130 ffffffc0 96000006 00000000 8cc130f0 ffffffc0 1dde6b98 ffffffe5
30d0: 1d249484 ffffffe5 00000000 00000000 8cc13130 ffffffc0 96000006 00000000
X5: 0xfffffffebf3448e0:
4860: 00000000 00000000 00000004 00000000 00000000 00000000 00321b67 00000000
4880: 00321bcd 00000000 00321b81 00000000 00000000 00000000 0000c1b1 00000000
48a0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
48c0: 00000000 ffffffe3 00000000 00000000 00000000 00000000 00000000 00000000
48e0: 30ffe5a0 ffffff80 30ffb300 ffffff80 00000104 00000000 fffffffc ffffffff
4900: 00000000 00000000 bf33ec40 fffffffe 7d70d000 ffffff80 000014a2 00000000
4920: ffffcb8f ffffffff ffffe033 ffffffff ffffd699 ffffffff 00000004 00000000
4940: 00000000 00000000 00000000 00000000 00002eb7 00000000 00003be9 00000000
X9: 0xffffffe51d24adbc:
ad30: 942e9b7a 910022e0 91046282 f9409281 eb02001f 54000820 eb00003f 540007e0
ad50: f9400028 eb02011f 54000781 f9009280 a90086e2 f9000020 9104a280 97eadec0
ad70: 91054280 52800061 2a1f03e2 aa1f03e3 97ea9b97 f9403260 b4000140 f94002a8
ad90: 37300068 aa1f03e8 14000002 394102a8 52820009 aa1503e1 9ac82122 97f8665d
adb0: f9400274 aa1c03e0 97fff997 52800388 7200001f 52800309 9a881128 8b080288
add0: 91196108 d503201f 52800029 b829011f b9401e68 f9403a69 2a1f03e0 f9000128
adf0: f9400be8 f9403669 f9000128 d5384108 f9432508 f85f83a9 eb09011f 540001c1
ae10: a9474ff4 a94657f6 a9455ff8 a94467fa a9436ffc a9427bfd 910203ff d50323bf
ae30: d65f03c0 d1000515 17fffeb0 d1000501 17fffeba 942e77da 97e7411a 17ffffc7
X12: 0xffffffc08cc14000:
3f80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
3fa0: 00000000 00000000 00000000 00000000 00000000 00000000 00100005 00000000
3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
3fe0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
X13: 0xffffffc08cc10000:
0000: 57ac6e9d 00000000 00000000 00000000 00000000 00000000 00000000 00000000
0020: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
0040: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
0060: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
X14: 0xffffff802a7accc0:
cc40: 2a7ac780 ffffff80 2a7acfc0 ffffff80 06100ff0 00000000 00000000 00000000
cc60: 06100056 00000000 00000fe8 00000000 00000000 00000000 2a7af000 ffffff80
cc80: 2a7ac000 ffffff80 2a7ace40 ffffff80 06100ff0 00000000 00000000 00000000
cca0: 0610004d 00000000 00000fb8 00000000 00000000 00000000 2a7c1000 ffffff80
ccc0: 2a7ac440 ffffff80 2a7ac580 ffffff80 06100ff0 00000000 00000000 00000000
cce0: 0610005b 00000000 00000000 00000000 00000000 00000000 2a7cd000 ffffff80
cd00: 2a7acbc0 ffffff80 2a7aca40 ffffff80 06100ff0 00000000 00000000 00000000
cd20: 06100051 00000000 00000fd4 00000000 00000000 00000000 2a7b5000 ffffff80
X19: 0xffffffc08cc133d0:
3350: 35760e58 ffffff80 00000000 00000000 00000000 00000000 000037c7 00000021
3370: 00000001 0018f948 7572b200 8abc58ea 8cc13450 ffffffc0 1d250d78 ffffffe5
3390: 35760e58 ffffff80 7572b200 8abc58ea c1fcb240 fffffffe 00004000 00000000
33b0: 2a06a000 ffffff80 8cc135f8 ffffffc0 2e8b5068 ffffff80 0001082a 00000001
33d0: 2a06a000 ffffff80 000037c7 00000000 00000001 00000001 00000000 0018f948
33f0: 0018f948 00000000 c1fcb240 fffffffe c0bae200 fffffffe 00000000 00000000
3410: 00000000 00000000 00000000 00000000 00000000 00100002 00000006 00000000
3430: 8cc13980 ffffffc0 8cc135f8 ffffffc0 8cc135f0 ffffffc0 7572b200 8abc58ea
X20: 0xffffff802a06a000:
9f80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fa0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
a000: 2994a000 ffffff80 32395b40 ffffff80 3056a000 ffffff80 00000000 00000000
a020: 610cce01 ffffff80 00000000 00000000 2a06a030 ffffff80 2a06a030 ffffff80
a040: 00000000 00000000 2a06a048 ffffff80 2a06a048 ffffff80 00000000 00000000
a060: 00000481 00000000 6c286180 ffffff80 00000000 00000000 2a06a078 ffffff80
X21: 0xfffffffec1fcb240:
b1c0: 00000000 00000000 c1fcb101 fffffffe 00000122 dead0000 00000400 dead0000
b1e0: 000eb1f2 00000000 00000000 00000000 00000002 00000000 00000000 00000000
b200: 00000000 00000000 00000000 00000000 00000122 dead0000 00000000 00000000
b220: 00015b6f 00000000 00000000 00000000 ffffffff 00000001 00000000 00000000
b240: 00009029 10000000 c2727708 fffffffe c1fce348 fffffffe 35760fc8 ffffff80
b260: 00000021 00000000 00000009 00000000 00000000 00000004 31cb30c0 ffffff80
b280: 00180028 00000000 00000100 dead0000 00000001 dead0000 3364f958 ffffff80
b2a0: 000006c9 00000000 00000000 00000000 00000023 00000025 4c5a6b40 ffffff80
X22: 0xffffff802a06a000:
9f80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fa0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
a000: 2994a000 ffffff80 32395b40 ffffff80 3056a000 ffffff80 00000000 00000000
a020: 610cce01 ffffff80 00000000 00000000 2a06a030 ffffff80 2a06a030 ffffff80
a040: 00000000 00000000 2a06a048 ffffff80 2a06a048 ffffff80 00000000 00000000
a060: 00000481 00000000 6c286180 ffffff80 00000000 00000000 2a06a078 ffffff80
X23: 0xffffff8077b65ae8:
5a60: 00000122 dead0000 3fe9cf00 ffffff80 910f179f f7531a19 00000122 dead0000
5a80: 45846400 ffffff80 910f1217 0f531a19 00000122 dead0000 4636d500 ffffff80
5aa0: 910f1cbf 27531a19 00000122 dead0000 404ceb00 ffffff80 910f1787 3f531a19
5ac0: 00000122 dead0000 49583900 ffffff80 910f156f 57531a19 00000122 dead0000
5ae0: 75c5a700 ffffff80 910f131f 6f531a19 00000122 dead0000 75c5ab00 ffffff80
5b00: 910f1f67 87521a19 00000122 dead0000 35111e00 ffffff80 910f1ac7 9f521a19
5b20: 00000122 dead0000 9f84b600 ffffff80 910f16cf b7521a19 00000122 dead0000
5b40: 4db47900 ffffff80 910f160f cf521a19 00000122 dead0000 56524400 ffffff80
5b60: 910f155f e7521a19 00000122 dead0000 3e802900 ffffff80 910f1f07 ff521a19
X28: 0xfffffffec0bae200:
e180: 00008038 08000000 c0bae208 fffffffe c0badd08 fffffffe 6cc17430 ffffff80
e1a0: 00000a1a 00000000 00000009 00000000 ffffffff 00000002 2e89f500 ffffff80
e1c0: 00000000 00000000 281e3500 ffffff80 00000122 dead0000 00000000 00000000
e1e0: 00000000 00000000 00100010 00000000 f5000000 00000001 00000000 00000000
e200: 00008038 08000000 c1ecf588 fffffffe c0bae188 fffffffe 6cc17430 ffffff80
e220: 00000a19 00000000 00000009 00000000 ffffffff 00000002 2e89f500 ffffff80
e240: 00008000 00000000 00000000 00000000 00000122 dead0000 00000000 00000000
e260: 000e8683 00000000 2eb89000 00000000 ffffffff 00000001 00000000 00000000
X29: 0xffffffc08cc132a0:
3220: 1d24adbc ffffffe5 8cc13280 ffffffc0 1d249484 ffffffe5 20400005 00000000
3240: 00000100 dead0000 00000001 00000000 00000000 00000000 77b65ae8 ffffff80
3260: 8cc132a0 ffffffc0 1d249484 ffffffe5 2994b968 ffffff80 00000000 00000000
3280: c1fcb240 fffffffe c0bae200 fffffffe 75c5a700 ffffff80 7572b200 8abc58ea
32a0: 8cc13310 ffffffc0 1d271100 ffffffe5 00000021 00000000 00000000 00000000
32c0: 00000001 00000000 8cc13980 ffffffc0 8cc1357c ffffffc0 00000002 00000000
32e0: 8cc13350 ffffffc0 0018f948 00000000 2a06a000 ffffff80 8cc133d0 ffffffc0
3300: 00000001 00000000 7572b200 8abc58ea 8cc13380 ffffffc0 1d250370 ffffffe5

CPU: 3 UID: 0 PID: 6790 Comm: kworker/u16:3 Tainted: P    B   W  OE     
6.12.30-android16-5-maybe-dirty-4k #1 5f7701c9cbf727d1eebe77c89bbbeb3371e895e5
Tainted: [P]=PROPRIETARY_MODULE, [B]=BAD_PAGE, [W]=WARN, [O]=OOT_MODULE,
[E]=UNSIGNED_MODULE
Workqueue: writeback wb_workfn (flush-254:49)
Call trace:
 dump_backtrace+0xf4/0x130
 show_stack+0x20/0x30
 dump_stack_lvl+0x40/0xa0
 notifier_call_chain+0x90/0x174
 notify_die+0x50/0x8c
 die+0x9c/0x310
 __do_kernel_fault+0x294/0x2a4
 do_page_fault+0xac/0x640
 do_translation_fault+0x48/0x11c
 do_mem_abort+0x5c/0x108
 el1_abort+0x3c/0x5c
 el1h_64_sync_handler+0x80/0xcc
 el1h_64_sync+0x68/0x6c
 f2fs_is_cp_guaranteed+0x70/0x98
 f2fs_inplace_write_data+0x174/0x2f4
 f2fs_do_write_data_page+0x214/0x81c
 f2fs_write_single_data_page+0x28c/0x764
 f2fs_write_data_pages+0x78c/0xce4
 do_writepages+0xe8/0x2fc
 __writeback_single_inode+0x4c/0x4b4
 writeback_sb_inodes+0x314/0x540
 __writeback_inodes_wb+0xa4/0xf4
 wb_writeback+0x160/0x448
 wb_workfn+0x2f0/0x5dc
 process_scheduled_works+0x1c8/0x458
 worker_thread+0x334/0x3f0
 kthread+0x118/0x1ac
 ret_from_fork+0x10/0x20

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
