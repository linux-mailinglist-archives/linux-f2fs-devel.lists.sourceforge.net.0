Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A1B9C2E0E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Nov 2024 16:11:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9n7d-0005BM-13;
	Sat, 09 Nov 2024 15:11:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1t9n7c-0005BG-Ap
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 15:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FqyyG99neGoAfWLf5wruv/RzgAZNl/SIZH+bU67U9do=; b=NTYn1fmoh2C8nfx3UE+Ti/ComZ
 LQOPlQfKHNnLxtMKQYt6VkCh8dsfCHhKTPFEcQ3MJQoeHtNJHGgZLdPTd26qQA6wucvm/Qsqz5F6M
 T5KZJIo8Hw3VjoMsLjkOtI1aqFcadFEdb8URqCmVTNzUt+Na7U9nxpOXrSmWQLnHanwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FqyyG99neGoAfWLf5wruv/RzgAZNl/SIZH+bU67U9do=; b=gnaQPvzfJGYNxCOszuLXgtLy7z
 pCahPmkCv8tuKPVGzeDheBytArf6lqBUpbIhEFyltBXA2bS6cTUzSZilgltkOk79TFNUqOI+t6ppi
 fjmkKIfeoeOuXoYqqeAFmqF3jUtHtBrkwfsaQaicEDy0Ue+ieekY6UK+Ts7GQH01pW9M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9n7b-0003r0-58 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 15:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4273D5C558D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Nov 2024 15:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D487C4CED5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Nov 2024 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731165080;
 bh=aw6AvHdTq18+mXrdTSk6FtgdFmH9YaaoXF9JtBpND0Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kgI194/b4KdwOvPCwI58E9YBsau8bUdYahxNdVjB3igUNZjhRoDnTvdL1w5LWR7JU
 ewNnjBJCJPOR4fwY0m3UIVNfKdQpTz8rhkkmf3sVyqM7uWZavINqBEosCzV6jJcYa1
 NvLA3U1pW2f8Eth/30hFsqxrhjKqZkyL7hnZEXjtFnbR3khontL9hC29ukC3w2z0u1
 AO+AGdSze6SaKl1z5DNmPd/2j9Oh/1QiNTt2zlLLwnpkt5GCsvokM/rG3Uw4uOx8bd
 pkmPQ2qzG/ig2tohgdea6shD+azohSBz+vQZeXUCpAP0+2Ha+ntC1Yt4017FBsMNxK
 m+AhjTLjlX8oQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6EF4FC53BC2; Sat,  9 Nov 2024 15:11:20 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 09 Nov 2024 15:11:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-219484-202145-LUIa9WRZgU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219484 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9n7b-0003r0-58
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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

https://bugzilla.kernel.org/show_bug.cgi?id=219484

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Hi, thanks for your report.

Can you please help to check max_hw_discard_sectors parameter of dm device
via "cat /sys/block/<device_name>/queue/max_hw_discard_sectors"?

I doubt max_discard_blocks becomes zero in __submit_discard_cmd(), result
in that __blkdev_issue_discard() fails to allocate bio.

__submit_discard_cmd()
{
        unsigned int max_discard_blocks =
                        SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
...
        while () {
...
                if (len > max_discard_blocks) {
                        len = max_discard_blocks;
                        last = false;
                }
...
                } else {
                        err = __blkdev_issue_discard(bdev,
                                        SECTOR_FROM_BLOCK(start),
                                        SECTOR_FROM_BLOCK(len),
                                        GFP_NOFS, &bio);
                }
...
                f2fs_bug_on(sbi, !bio); // trigger warning here and panic below
}

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
