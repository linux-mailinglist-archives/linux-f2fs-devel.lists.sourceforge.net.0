Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D059E3BBAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jun 2019 20:17:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1haOrF-0004Dy-EP; Mon, 10 Jun 2019 18:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1haOrE-0004Dl-8w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Jun 2019 18:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1M2oCUQ6KGOSl99KgihEgZ9wt72zpjCZ6kZCWd/nLE=; b=NDSx6Ml48lCyh+liVg72DlY9Ez
 vbDLAE6RCZ33peis6qzfBotPM8xVcXFghnfXrIzxMY7G3Hk8wQ3Oo0uO3YOle3oqfgT7srtjHvhLx
 qoPO+SNCx39375FGmX8bCKqzQjB1552CcL5OLG1bZS0PjVI4/NvBxCvMYDHgYWr/Qmfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f1M2oCUQ6KGOSl99KgihEgZ9wt72zpjCZ6kZCWd/nLE=; b=N
 0hD87sRGxvla/QLVYfe33vgQlmZBvGmPPLmLIaGSNtRUioxnzE1Ojse1tHdTQxi5hotrgB4GqScuw
 wQU3ClsesLq2wHa/gtrMm4csI1mt4eY8OhyCnlZUoPyRXrCYgtfNHmWnJHXiZkrlENA1PD4zTPeIW
 32ps7/9gtCtinwcQ=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1haOrD-006RNF-GA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Jun 2019 18:17:24 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 3BA1F28613
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Jun 2019 18:17:14 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 2F8E0286A1; Mon, 10 Jun 2019 18:17:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 Jun 2019 18:17:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: seulbae@gatech.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203861-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1haOrD-006RNF-GA
Subject: [f2fs-dev] [Bug 203861] New: Division by zero error in fsck.f2fs
 when fixing a corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=203861

            Bug ID: 203861
           Summary: Division by zero error in fsck.f2fs when fixing a
                    corrupted image
           Product: File System
           Version: 2.5
    Kernel Version: v4.18
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: seulbae@gatech.edu
        Regression: No

Created attachment 283179
  --> https://bugzilla.kernel.org/attachment.cgi?id=283179&action=edit
Corrupted f2fs image (compressed)

[Overview]
fsck.f2fs of f2fs-tools (master at commit 54244dcafd) triggers a division by
zero error while fixing a corrupted image, in which segs->secs_per_zone is set
to 0.

[Reproduction]
Download and uncompress the attached image.
Run fsck.f2fs against the downloaded image:
$ cd path/to/f2fs-tools/
$ ./fsck/fsck.f2fs -d 0 -f /tmp/f2fs.img
Info: Force to fix corruption
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 131072 (64 MB)
Info: MKFS version
  "Linux version 4.13.0-45-generic (buildd@lgw01-amd64-011) (gcc version 5.4.0
20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.9)) #50~16.04.1-Ubuntu SMP Wed May 30
11:18:27 UTC 2018"
Info: FSCK version
  from "Linux version 4.13.0-45-generic (buildd@lgw01-amd64-011) (gcc version
5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.9)) #50~16.04.1-Ubuntu SMP Wed May
30 11:18:27 UTC 2018"
    to "Linux version 4.18.0-21-generic (buildd@lcy01-amd64-006) (gcc version
7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #22~18.04.1-Ubuntu SMP Thu May 16 15:07:19 UTC
2019"
[update_superblock: 503] Info: Done to update superblock
Info: superblock features = 0 : 
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 131072 (64 MB)
Info: CKPT version = 3
[1]    13488 floating point exception (core dumped)  ./fsck/fsck.f2fs -f
/tmp/f2fs.img

[Location]
- build_curseg at fsck/mount.c:1589
  1589  array[i].zone = GET_ZONENO_FROM_SEGNO(sbi, segno);
- GET_ZONENO_FROM_SEGNO(sbi, segno) at fsck/f2fs.h:317
  318 ((segno / sbi->segs_per_sec) / sbi->secs_per_zone)
Causes division by zero error when sbi->secs_per_zone is corrupted to be 0.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
