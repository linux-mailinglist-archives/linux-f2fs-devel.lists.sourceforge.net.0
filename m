Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0E12A7D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Dec 2019 13:18:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ik5cJ-0003BM-TK; Wed, 25 Dec 2019 12:18:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=CZM4=2P=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1ik5cI-0003BE-5T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Dec 2019 12:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LAz3utZOSBv1fvZJC0fys61YY/xnCChGKqFAwf93yr0=; b=Qpr9nusgy0N4jmPPMxIg27YNB5
 wgcNX5elzK8hO8I0wzQMt/Xyxyr6XiCjk01h3svswxC5LDx4ss9Yfpy6agFbXs459IGtvizqr9e3S
 h2XPL19NXwwVq+CLdWt0qHRjj1TgKtn3LK5k73L945eqm1nyy8g4pkazYwaZfNopNoO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LAz3utZOSBv1fvZJC0fys61YY/xnCChGKqFAwf93yr0=; b=b
 HJ+E3e9EEYmF7OgiCCQFpye4Zdxal8TJH13cmtG5bMxWnhvuHEvs1/hx6X92oz8GhPb/4bChk+/CA
 uiZApMjbVxrF9mE9ANNrClbXB347Kd4uTVCvoH9iMvUzKF9sRWvcASCjl0M/u54kf2AyI+I3b2dqc
 Bod7/bdlGwBfoIBY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ik5cG-00EuXb-3s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Dec 2019 12:18:18 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 25 Dec 2019 12:18:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@ixit.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205967-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ik5cG-00EuXb-3s
Subject: [f2fs-dev] [Bug 205967] New: [bisected] f2fs compression support
 breaks build
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

https://bugzilla.kernel.org/show_bug.cgi?id=205967

            Bug ID: 205967
           Summary: [bisected] f2fs compression support breaks build
           Product: File System
           Version: 2.5
    Kernel Version: 5.5.0-rc2-next
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: david@ixit.cz
        Regression: No

commit: 25d18e19a91e60837d36368ee939db13fd16dc64

breaks build for me (armv6):
/usr/bin/armv6-alpine-linux-musleabihf-ld: fs/f2fs/file.o: in function
`f2fs_truncate_blocks':
/mnt/linux/.output/../fs/f2fs/file.c:738: undefined reference to
`__aeabi_uldivmod'
make[1]: *** [/mnt/linux/Makefile:1079: vmlinux] Error 1

and Pavel Machek (x86-32) [1]:
LD .tmp_vmlinux1
ld: fs/f2fs/file.o: in function `f2fs_truncate_blocks':
file.c:(.text+0x2968): undefined reference to `__udivdi3'
make: *** [Makefile:1079: vmlinux] Error 1

[1] https://lkml.org/lkml/fancy/2019/12/22/48

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
