Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BCB56EDA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Sep 2025 05:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5d4Odv8zLhfJjaq1pwtvptwND6kZ7Ae37ylJskIGgpI=; b=DHLO6lgHvnbkN6vmNzPZbgUSeT
	QVKoS2GMwkELxHOMZu4Rb0bsmo+4RU2Jt6AZh3O9TIoP6i0VSuk1XIPqnEpHEhMQpZkvDjNJMs+eD
	tc6JSKcuVvfX5pBfq4Z3/JqKm72YWMyH0sSrP+AzBne6iFUp5YUVv1jiRYIClocXFOsk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uxzxl-00065b-2R;
	Mon, 15 Sep 2025 03:33:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uxzxk-00065V-48
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 03:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lkb63F4lvijs7MhJMii7HmlD0ojnAxwZTAQXOfLlJ6k=; b=F9PtITAMvTulNWZQmjGPAaXpdy
 CWYuWwHIUd4BftTBoRPkffH2ALUwA7thG0UUP7ntN1XwBFBsvxLLGB9UQAbktkE0oqdBNZBH+r00F
 uE3uAma/DtTu2pJ57Fy0IaZ/H532UjrXuOlBc/4Lso92mZnhSy5qDTzZdo6zpuN9paZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Lkb63F4lvijs7MhJMii7HmlD0ojnAxwZTAQXOfLlJ6k=; b=f
 K2RbumbzOf6z0o2/h1vvfFMdy/aRWathFiDA/4dC9f47Q9bZ52JrKfnBqaOfS7fH7jpe+II3XVo5s
 gSa0HKxxWy90sBtpGmKmJZQ7TTRZsui6MbYw2HpbjRhf9qcaowtNzcZ796E6IbbGRU+GOxxkYShNg
 hgiXg0VERx9qqHSA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uxzxj-0002wf-HO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 03:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0477942B6F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Sep 2025 03:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9F5CC4CEF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Sep 2025 03:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757907181;
 bh=UPi5PvGaYVkFpKMFwmbT2EC4acz/UZy7MKz1ssEXXc8=;
 h=From:To:Subject:Date:From;
 b=M33UyBx/N4GqX0Ug5vGbsXxhwCd5zsQ3PPSH1Pmv6F1tzvLdoyLUEXDjRCUAlTQe+
 M3oG+k4J1qUSK5dKb0zDPkhVefu8YKqmFZQwk+24PLgWaF9I+JUVhiW8P+PT0iYa0b
 ET2gLaOdmYTvBO9Xm05M1yE9PzSidjOn9I1AOlnouXehQXBL2iX6KQZgyIuJGoGgsl
 IYYJX/d25nm5kB6wflpje91ce5UvNDL7qcGEcRiUZhY8Pcek8eLq+PhRm3PdV91Mfy
 GBrAZ5f/O4tJBvMhsm6o2TeJMKUOzZEvubnJ4M7d9mt0qB2HvtMLJc9NfJ2W6glICl
 yWbcjzB43xk3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C576FC433E1; Mon, 15 Sep 2025 03:33:01 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Sep 2025 03:33:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-220575-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=220575 Bug ID:
 220575 Summary: Unable to handle kernel NULL pointer dereference at virtual
 address 0000000000000000 Product: File System Version: 2.5 Kernel Version:
 6.12.30-android16 Hardware: ARM OS: Linu [...] 
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
X-Headers-End: 1uxzxj-0002wf-HO
Subject: [f2fs-dev] [Bug 220575] New: Unable to handle kernel NULL pointer
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

            Bug ID: 220575
           Summary: Unable to handle kernel NULL pointer dereference at
                    virtual address 0000000000000000
           Product: File System
           Version: 2.5
    Kernel Version: 6.12.30-android16
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: JY.Ho@mediatek.com
        Regression: No

Hi experts,

We encountered an f2fs issue in a Linux 6.12.30 environment. (Android 16)
Linux source code:
https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12-2025-07

Further analysis confirms that the issue occurs at the following line:
return page_private_gcing(fscrypt_pagecache_page(page));

In this case, the ptr argument passed to page_private_gcing() is NULL.
Does anyone have any idea about this situation?
Thanks.

[ T6790] Unable to handle kernel NULL pointer dereference at virtual address
0000000000000000
[ T6790] Mem abort info:
[ T6790]   ESR = 0x0000000096000006
[ T6790]   EC = 0x25: DABT (current EL), IL = 32 bits
[ T6790]   SET = 0, FnV = 0
[ T6790]   EA = 0, S1PTW = 0
[ T6790]   FSC = 0x06: level 2 translation fault
[ T6790] Data abort info:
[ T6790]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[ T6790]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[ T6790]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ T6790] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000037b28000
[ T6790] [0000000000000000] pgd=0800000039429003, p4d=0800000039429003,
pud=0800000039429003, pmd=0000000000000000
[ T6790] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[ T6790] Kernel Offset: 0x0 from 0xffffffc080000000
[ T6790] PHYS_OFFSET: 0x0
[ T6790] pstate: 20400005 (nzCv daif +PAN -UAO)
[ T6790] pc : [0xffffffe51d249484] f2fs_is_cp_guaranteed+0x70/0x98
[ T6790] lr : [0xffffffe51d24adbc] f2fs_merge_page_bio+0x520/0x6d4
[ T6790] sp : ffffffc08cc13280
[ T6790] x29: ffffffc08cc132a0 x28: fffffffec0bae200
[ T6790] x27: 0000000000000168 x26: dead000000000100
[ T6790] x25: 0000000000000002 x24: 0000000000000000
[ T6790] x23: ffffff8077b65ae8 x22: ffffff802a06a000
[ T6790] x21: fffffffec1fcb240 x20: ffffff802a06a000
[ T6790] x19: ffffffc08cc133d0 x18: 0000000000000000
[ T6790] x17: 000000008c623181 x16: 000000008c623181
[ T6790] x15: 000000000000ba7e x14: ffffff802a7accc0
[ T6790] x13: ffffffc08cc10000 x12: ffffffc08cc14000
[ T6790] x11: 0000000000000000 x10: 0000000000000001
[ T6790] x9 : ffffffe51d24adbc x8 : 0000000000000000
[ T6790] x7 : 0000000000000000 x6 : 0000000000000000
[ T6790] x5 : fffffffebf3448e0 x4 : 0000000000000000
[ T6790] x3 : ffffffc08cc13070 x2 : 0000000000001000
[ T6790] x1 : fffffffec1fcb240 x0 : 0000000000000000
[ T6790] PC: 0xffffffe51d249484:
[ T6790] CPU: 3 UID: 0 PID: 6790 Comm: kworker/u16:3 Tainted: P    B   W  OE   
  6.12.30-android16-5-maybe-dirty-4k #1
5f7701c9cbf727d1eebe77c89bbbeb3371e895e5
[ T6790] Tainted: [P]=PROPRIETARY_MODULE, [B]=BAD_PAGE, [W]=WARN,
[O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[ T6790] Workqueue: writeback wb_workfn (flush-254:49)
[ T6790] Call trace:
[ T6790]  dump_backtrace+0xf4/0x130
[ T6790]  show_stack+0x20/0x30
[ T6790]  dump_stack_lvl+0x40/0xa0
[ T6790]  dump_stack+0x18/0x24
[ T6790]  notify_die+0x50/0x8c
[ T6790]  die+0x9c/0x310
[ T6790]  __do_kernel_fault+0x294/0x2a4
[ T6790]  do_page_fault+0xac/0x640
[ T6790]  do_translation_fault+0x48/0x11c
[ T6790]  do_mem_abort+0x5c/0x108
[ T6790]  el1_abort+0x3c/0x5c
[ T6790]  el1h_64_sync_handler+0x80/0xcc
[ T6790]  el1h_64_sync+0x68/0x6c
[ T6790]  f2fs_is_cp_guaranteed+0x70/0x98
[ T6790]  f2fs_inplace_write_data+0x174/0x2f4
[ T6790]  f2fs_do_write_data_page+0x214/0x81c
[ T6790]  f2fs_write_single_data_page+0x28c/0x764
[ T6790]  f2fs_write_data_pages+0x78c/0xce4
[ T6790]  do_writepages+0xe8/0x2fc
[ T6790]  __writeback_single_inode+0x4c/0x4b4
[ T6790]  writeback_sb_inodes+0x314/0x540
[ T6790]  __writeback_inodes_wb+0xa4/0xf4
[ T6790]  wb_writeback+0x160/0x448
[ T6790]  wb_workfn+0x2f0/0x5dc
[ T6790]  process_scheduled_works+0x1c8/0x458
[ T6790]  worker_thread+0x334/0x3f0
[ T6790]  kthread+0x118/0x1ac
[ T6790]  ret_from_fork+0x10/0x20

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
