Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961141A8FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Sep 2021 08:29:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mV6cM-0006hS-Ub; Tue, 28 Sep 2021 06:29:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mV6cK-0006hC-Mw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 06:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vkono8wNtITc70U8j/6873sJOjeAhu+nAhmYBnERBKE=; b=Aeg3ffyiZ+1M+NvfLGNJXXYx8V
 7SkX1pat6E2gYf5IBF2aN85eBkLLHvRknFlC8C7MSzC/bmue5oVzmnd950lhBa2BVzV3NAUdpVqRz
 ZmgTW9NcV4+sJ1XA1q87fIu6UsJRL+VESD/YP0YOPwAR2hROds4fBxkYtvdKrp0OcvGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vkono8wNtITc70U8j/6873sJOjeAhu+nAhmYBnERBKE=; b=c
 gUGmyI1+EfOOT4eivXn4BE5gqeH1J+oCtSPMFo3PsWzj2MZbpSRCH0flPIgmQKvJY0oRPiQzbrvJm
 XD/pzZWHFZ2jrgqzWZvY8K/rZ4CxC9K9w6h5EozeDhGQfKtiF/E7WW3py4pl6J0N5bLmE9N9BV4+N
 xyut68vgqR0OoXA8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mV6cK-00055s-4n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Sep 2021 06:29:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id DD6CC611BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Sep 2021 06:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632810557;
 bh=I8z4w3lnaeNHtQIyjkN7iwehjomEUcQ2iyaT2dWC/aY=;
 h=From:To:Subject:Date:From;
 b=BbrbxJeGqp7j9wgv8yNAGZ+4HntVpWm57deWSHMOXs+ejUzv3gBXFiu3IZwfKqLdQ
 RiyBga5IYxU8rHN9HYTggRgqrVM+mWZ6GtxPgp2hT8tNsw8teWPrvWxrOuqGx7WXhU
 pReYxACemj7bCg7v3Ll7oHFpXPn9dnTlrVYhVXnYldgMR4ys7W1NevYqQXeoTjXSg9
 UyVCamfzL7gTNFLG+M4xWfUuWI/REH6ri1QY1walNf1KFhE9j/Pz2/RxsFP3L84289
 xIlZZwRrDr+GNQTtiwBk11ZKD3n9lvxYLaGuJNU8JyP8J/EIS2KGPx2RI+NmVVQg0q
 484YUy8DQko/w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C7E9760EB1; Tue, 28 Sep 2021 06:29:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 28 Sep 2021 06:29:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lijiazi@xiaomi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214551-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=214551 Bug ID:
 214551 Summary: Roll-Forward recovery recover deleted file Product: File
 System Version: 2.5 Kernel Version: 5.4 Hardware: ARM OS: Linux Tree: Mainline
 Status: NEW Severity: normal Priority: [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mV6cK-00055s-4n
Subject: [f2fs-dev] [Bug 214551] New: Roll-Forward recovery recover deleted
 file
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

https://bugzilla.kernel.org/show_bug.cgi?id=214551

            Bug ID: 214551
           Summary: Roll-Forward recovery recover deleted file
           Product: File System
           Version: 2.5
    Kernel Version: 5.4
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: lijiazi@xiaomi.com
        Regression: No

reproduce step:
dd if=/dev/zero of=test count=256
fsync test
rm test
Trigger an abnormal reboot immediately.

After successful reboot, from dmesg, we can see f2fs recover this deleted test
file:
[    4.421237] F2FS-fs (dm-10): recover_inode: ino = 652d, name = test, inline
= 21
[    4.421407] F2FS-fs (dm-10): recover_dentry: ino = 652d, name = test, dir =
5985, err = 0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
