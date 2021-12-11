Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B14710A2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Dec 2021 03:14:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvrtw-0006K3-QH; Sat, 11 Dec 2021 02:14:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mvrtv-0006Jw-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Dec 2021 02:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YebQTzutD78ujshDmyvP3FzNkqQ1gSJv4NNZuwL/DZI=; b=Ycl+SHHn6RqRUvULr1MLjfqPN6
 Zm4UvBd8ZTeQ0Gdd9+dhoLr7DAmNwiMLZoKo7f0nB7Ty2FNk+r974kYpaAJK8szfCPxznGqalgSzm
 nmiOLG09+0iN2rbXesI3TAU39rvBpSX2tkE4icbDiGfIKJx2pzeBl43j3SVJcc5y7n9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YebQTzutD78ujshDmyvP3FzNkqQ1gSJv4NNZuwL/DZI=; b=PI+shqhDE6Tszw6g4qNSwL65hq
 23iIKvYLzB8nfFgAMQV9QH9iofNyNOex/wPfvSEGeK42sxoKE0iX6n+tZmKXKrhZF1owLZe3iDYm6
 2CBTEpb/0koXMCj6c7SGxDFoV/rPjESSkQlAcmesEdekZ2LzsTFutMaeZk6mJjFYfcyI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvrtu-00BhAY-Je
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Dec 2021 02:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 198C1B82A82
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Dec 2021 02:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C94F5C341C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Dec 2021 02:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639188843;
 bh=Jn51R4wMks/C7LW0JROxrueeQIN2961GFWXBeK6H5SM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=URj3ST006sIAgKw0PfjrOxszwSAP8t2LXd3mL/z6RodOwuTp7V+WI6MVADKSOrsx9
 zbXcdeJcuqXtgG3dT3RwZ431L3Kn8ZDUNDcsbD9Dzp/+fZYAyYElqkZ1cVvGxsfKoD
 oLq/9zDaAWlsh2R4CNeJtTLb03jDLzi4CFymltQG+1tYjtAS9dnwoV/LafGNx+K99O
 oDZNT8k3QV6N6jqiWq6oXiJ1ZtaDVm24u4eOVlp41SPXoG0WOwgiwHvNXbFEc6u/Y3
 ley0VZJLNcRuX9C5OhK78DIpSAn/eAEXsSienqugHhOhGgOQy9CyoSZfQPqkNw+FqV
 eNYfGdcVOsM6Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 98DAB60F4F; Sat, 11 Dec 2021 02:14:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 11 Dec 2021 02:14:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-214895-202145-wU765Ypjg6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214895-202145@https.bugzilla.kernel.org/>
References: <bug-214895-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=214895 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvrtu-00BhAY-Je
Subject: [f2fs-dev] [Bug 214895] F2FS BUG: KASAN: stack-out-of-bounds in
 d_shrink_add+0x17f/0x1c0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=214895

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #4 from Chao Yu (chao@kernel.org) ---
Oh, sorry, I guess this is a known issue which has been reported in below link
[1], please apply fixing patch [2] to see whether it can fix your problem.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=204135

[2]
https://lore.kernel.org/linux-f2fs-devel/20190712085700.4239-1-yuchao0@huawei.com/T/#u

I can't reproduce this issue due to the "runner" test program crashed in 733
line.

(gdb) r
> Make dir /root/mnt
> Begin testing syscall...
> To mount root ...
MOUNT ROOT f2fs on /root/mnt: with
[nouser_xattr,active_logs=6,inline_data,fastboot,extent_cache]
> Mount root done...
[Detaching after vfork from child process 14904]
mount(dev: /dev/loop11, g_workspace: /root/mnt, fs: f2fs, 0, option:
nouser_xattr,active_logs=6,inline_data,fastboot,extent_cache)REMOUNT ROOT f2fs
on /root/mnt: with
[discard,no_heap,active_logs=6,inline_data,flush_merge,fastboot,extent_cache,mode=adaptive]
munmap_chunk(): invalid pointer

Program received signal SIGABRT, Aborted.
0x00000000004cc56b in raise ()
(gdb) bt
#0  0x00000000004cc56b in raise ()
#1  0x0000000000403ae3 in abort ()
#2  0x00000000004e6556 in __libc_message ()
#3  0x00000000004ecaec in malloc_printerr ()
#4  0x00000000004ecd1c in munmap_chunk ()
#5  0x0000000000405943 in m_deepen (curr_path=0x5855a8
"/root/mnt/fONyUHhUjtamPfvodyYSGfoo_318/gLCxIfoo_576/tFawtTrTsddGXmDCrYIvnOmEJPwiSUPkLfMfpHlZwOnItTpnEDfoo_663/biCedwbdHbfFfoo_884",
depth=665)
    at 214895.c:212
#6  0x0000000000408681 in test_syscall () at 214895.c:733
#7  0x000000000040b48c in main (argc=1, argv=0x7fffffffe388) at 214895.c:1260
(gdb) quit
A debugging session is active.

        Inferior 1 [process 14896] will be killed.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
