Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8C3D7297
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 12:07:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8K05-0004If-KI; Tue, 27 Jul 2021 10:07:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1m8K03-0004IW-3f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 10:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C3kDcBtMmljubQMknqnN3Q50TKGBAcKno7zsvBEr1kc=; b=Y3gJ1J6sSnBMRRFF0OzD0lxxuD
 /d/DvVkt6WRGrm4xEB8djJ55Xr/PQ2Y/bNSkIGcRNhwlYM3JM2tA1mkqwZHu7bDrYrUTZzO6auZh/
 wqAOIEF5QglDNvKHEu7zaT2ZeQ9uNypm+f63BPPBsz82iJzHtbEO5iYw62zer8wADIOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C3kDcBtMmljubQMknqnN3Q50TKGBAcKno7zsvBEr1kc=; b=c
 mxwOGXKUpROfPH7Tp+JYbZ2Em/Z4cYLk6dPKmHWfNHTlawQYxGspselF5myCLWNHf0NyU0IPWpLw/
 ihlyXS2W1K6ErBKVSa7aHznI8HrFfiSr7khVo2NQaoibQDa2Nv7QX6BR9+RHh1Xdp8Ez9z4rurQlf
 MPob4NqHfJMBIC9M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8Jzv-00042s-R6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 10:07:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 84A8A61406
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jul 2021 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627380449;
 bh=iOA0oFBG452J2uDOdeki+xaUUPAu74yUZItlK04qkhc=;
 h=From:To:Subject:Date:From;
 b=ej4PfeGaVbdeO4mw36p0++XTAVmM1Y90sW8OcWd7KR1UchzOvytxNg+7ls0vcYuFH
 9i0iZqKlFVU2pC0b+3JLt+thnoWOL9PGhowQBs60Q9fBGA2s0ZRdBtBf7L4Gp/qy2Q
 /J169AotIPRzksTpZTm3SArpivWWzRBNurnKr3cSCGCAs4gbEkkNFdMYkdX3+VlyRq
 RbMl8ss79q8DZuvqFEGOAx7ELlQvdkEyGW2gz1Oz1fViEEAps4XdZCc6jEHRb9wE+s
 QH/rEvovJYF6E3w/opTUlYghP5F3q6mKtmCK8W27F7xsMzLjjCxv9LRDL1QW1U+LeE
 fAwcU59DBnBlg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7304960EB7; Tue, 27 Jul 2021 10:07:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 27 Jul 2021 10:07:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leftzheng@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8Jzv-00042s-R6
Subject: [f2fs-dev] [Bug 213877] New: Mount multiple SMR block devices
 exceed certain number cause system non-response
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

https://bugzilla.kernel.org/show_bug.cgi?id=213877

            Bug ID: 213877
           Summary: Mount multiple SMR block devices exceed certain number
                    cause system non-response
           Product: File System
           Version: 2.5
    Kernel Version: Linux DT1 5.13.4-200.fc34.x86_64 #1 SMP Tue Jul 20
                    20:27:29 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: leftzheng@gmail.com
        Regression: No

[1.] One-line summary of the problem:
Mount multiple SMR block devices exceed certain number cause system
non-response

[2.] Full description of the problem/report:
Created some F2FS on SMR devices (mkfs.f2fs -m), then mounted in sequence. Each
device is the same Model: HGST HSH721414AL (Size 14TB).
Empirically, found that when the amount of SMR device * 1.5Gb > System RAM, the
system ran out of memory and hung. No dmesg output. For example, 24 SMR Disk
need 24*1.5GB = 36GB. A system with 32G RAM can only mount 21 devices, the 22nd
device will be a reproducible cause of system hang.
The number of SMR devices with other FS mounted on this system does not
interfere with the result above.

[3.] Keywords (i.e., modules, networking, kernel):
F2FS, SMR, Memory

[4.] Kernel information
[4.1.] Kernel version (uname -a):
Linux 5.13.4-200.fc34.x86_64 #1 SMP Tue Jul 20 20:27:29 UTC 2021 x86_64 x86_64
x86_64 GNU/Linux

[4.2.] Kernel .config file:
Default Fedora 34 with f2fs-tools-1.14.0-2.fc34.x86_64

[5.] Most recent kernel version which did not have the bug:
None

[6.] Output of Oops.. message (if applicable) with symbolic information
     resolved (see Documentation/admin-guide/oops-tracing.rst)
None

[7.] A small shell script or example program which triggers the
     problem (if possible)
mount /dev/sdX /mnt/0X

[8.] Memory consumption 

With 24 * 14T SMR Block device with F2FS
free -g
              total        used        free      shared  buff/cache   available
Mem:             46          36           0           0          10          10
Swap:             0           0           0


With 3 * 14T SMR Block device with F2FS
free -g
               total        used        free      shared  buff/cache  
available
Mem:               7           5           0           0           1          
1
Swap:              7           0           7

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
