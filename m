Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE220AFA2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2020 12:23:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jolVi-00040q-Aq; Fri, 26 Jun 2020 10:23:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=yT37=AH=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jolVh-00040i-AX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jun 2020 10:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EiaVhQJY8odOkVqjC5iqgUFEGhNHgHkoUztfSTvDCqA=; b=AEQQZTUIGb6UKg55aA/8V+UY2N
 EeR+m2ON2b7rn+FadIaumCckCYn/s0/FDlVx/mVWn2aI9l49hktD1W08QL34ISjM9lh3BpF9SL62P
 eNn7jXC8+Rj8NWcxQFcaUzkrg7MWq9NlPxD/2GnFWsCdlEabgjcybtzk7Q54wUMA3bgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EiaVhQJY8odOkVqjC5iqgUFEGhNHgHkoUztfSTvDCqA=; b=l
 mbzqf+HntEf1JxOmmJvgay73p7mNyEyv5Ay5N0pUnu0jMiMfAOiRe4Rd8biXdQ80YFTeDI8m70yCz
 wvAO+zPcxP2aDvz6a5iiQHz9uZ5Jg2q03yU5Gn2u/DYyQZvt/x7glqvWfoLRgvb0t1TNWooFSwgoX
 MPK+GarBNPDV0o6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jolVg-001reV-6c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jun 2020 10:23:05 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 26 Jun 2020 10:22:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zKqri0@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208325-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jolVg-001reV-6c
Subject: [f2fs-dev] [Bug 208325] New: f2fs inconsistent node block
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

https://bugzilla.kernel.org/show_bug.cgi?id=208325

            Bug ID: 208325
           Summary: f2fs inconsistent node block
           Product: File System
           Version: 2.5
    Kernel Version: 5.7.2-arch1-1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: zKqri0@gmail.com
        Regression: No

i was working with an android kernel tree and once when i was trying to build i
started getting errors like "make[1]: stat: drivers/input/touchscreen/Kconfig:
Invalid argument". checked my laptop's dmesg and there were a bunch of errors
like "F2FS-fs (sda2): inconsistent node block, nid:1761978,
node_footer[nid:540703074,ino:1937074503,ofs:212733452,cpver:7020105085017473824,blkaddr:1008758642]".


rebooted and the problem is still there whenever i try to build that kernel
tree. probably could just delete and clone it again but i kept it in case
having it will help with finding what caused this bug. its probably not caused
by ssd failure as i didnt get any sata errors and ive never got files corrupted
before and after this happened.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
