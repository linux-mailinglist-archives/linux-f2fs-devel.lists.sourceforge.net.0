Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D55164B0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 16:21:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlARs-0007Fu-P9; Sun, 01 May 2022 14:21:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nlARn-0007Fn-Cf
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 14:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmUbc2ViYlaIFaBT1jUoxn+gt4Gv7FFBv0dvVDtCkHA=; b=Koz5/QIKKBoWWZKlEC24i/guEe
 HZTeONLXDd7sPWqRj1TpONgxg8eM209VIe9s73f7cmyB5owfBn2aTl9ZC57vp1+NJ436ct6vIZkRl
 MZgHexTtu6TIEYYsf2I+D9RGKNAsAANLfZfJ65tXpAjMArENMgbW3Bjdn3YI7yxzFr1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lmUbc2ViYlaIFaBT1jUoxn+gt4Gv7FFBv0dvVDtCkHA=; b=C
 U19VLecVcgSQOPLeS2b70i9ESiBGIB2bnRJ/X3E85QTRFP1Ypgct5s/0W0BbbG0QaRrQOEd+AbvV8
 yfrh8S0dQ7X6VuRyAgRmGksaUoaigM2HqoUI+xYqXXHYhf5d02rxNQunqV67ZHf5yiHBjNOjtWalN
 YAY9jeQo8j7Rlv4U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlARi-0000jK-MC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 14:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9173AB80CED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  1 May 2022 14:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5038AC385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  1 May 2022 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651414858;
 bh=2sqmASBR2W2fmeTrVGj+cbs8NRgnVScgL/d4ofSqQYw=;
 h=From:To:Subject:Date:From;
 b=hNfZ2IvFxx2FOpB+JpHmAcRd5Qtloy9GTHvbS3pRAcm4Tsd3/KhU4k5Xn2aPPJPHS
 6NIfPcgaMHcSWD6rXVJmrZcpqjpxoWkUjAowwiWzSDFlo2lQvZWbH1TWyZn/3dAKNi
 HnCwfv+VejbrQXFF/RRY3ZuVG844TMlbTagVPVhI2x9oMIuKNz4WYKbE7lAaFCxHag
 FlREEkpkur6u6LPGnAISHEYgZdd2thFQ4DA7aRsJ0cBSjN9rf0zxdg0WsJ8aVHPXFO
 slNE4xGV5Zenhs30ll87B4nhXWvAhrO36StVsN3fVAf96Q0c51S100TxVtnuX1t6M9
 blnP0XS6caM5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 313B0C05FCE; Sun,  1 May 2022 14:20:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 01 May 2022 14:20:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215929-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215929 Bug ID:
 215929 Summary: kernel deadlocks while performing file operations Product:
 File System Version: 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree:
 Mainline Status: NEW Severity: normal Pr [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlARi-0000jK-MC
Subject: [f2fs-dev] [Bug 215929] New: kernel deadlocks while performing file
 operations
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

https://bugzilla.kernel.org/show_bug.cgi?id=215929

            Bug ID: 215929
           Summary: kernel deadlocks while performing file operations
           Product: File System
           Version: 2.5
    Kernel Version: 5.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: yanming@tju.edu.cn
        Regression: No

Created attachment 300864
  --> https://bugzilla.kernel.org/attachment.cgi?id=300864&action=edit
case.c, contains file operations

I'd mounted a F2FS image with several mount options. When I was performing file
operations on the mount point, the kernel hangs, and the process cannot be
killed.

The file operations are in case.c, and the image is provided at
(https://drive.google.com/file/d/1be1SyKJwBWvQKSnhD0Y05ZquEIPT62-W/view?usp=sharing).

This issue can be reproduced by running the following commands:
losetup /dev/loop0 case.img
mount -o
"background_gc=sync,active_logs=4,disable_ext_identify,inline_dentry,data_flush,fsync_mode=posix"
/dev/loop0 /mnt/test/
gcc -o case case.c
./case

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
