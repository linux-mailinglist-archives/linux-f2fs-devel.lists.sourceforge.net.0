Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B0D56AC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Oct 2019 17:49:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iJg7u-0004MF-Bs; Sun, 13 Oct 2019 15:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=/New=YG=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1iJg7s-0004M3-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Oct 2019 15:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4I9KQ/QuZsg7Ki6HUFntrRcaN1nMNyjnpRSi1rAlb0I=; b=kRhEPH9YTUkhIddDLQ6dc6bJe9
 QAiUHYhjgt5+pvRwXE6JPoGywuEwVLQ1Nr565vJOYH7stLet713FeXunLDeclCw9sB7C8Xqi97Lrw
 HQG7tZy4hMvRxH4GHwmUBx/8/YXEXVmg353lZX8XVrHvjsE8LCvSiHVkWWtsHS6IKdvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4I9KQ/QuZsg7Ki6HUFntrRcaN1nMNyjnpRSi1rAlb0I=; b=lJHnmFsMI7BcsuiULfOb1AzRTG
 TGXftbhAJ8hZ+lzWUFqTNlPq55sPGI/XopZGoRg8BXb66/Gjb2xc66lMGTs8mHC11zkgE2PJjmCbr
 QzEzc0rGmD7OdLZNlUu9xJ5IpjQi2SgqNPl/GRoTz5eS4VRMAlJxQ2+7CRLB3/B+USCU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iJg7r-00Gryd-8F
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Oct 2019 15:49:44 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 13 Oct 2019 15:49:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: andypoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205181-202145-6EjFsxbCvJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205181-202145@https.bugzilla.kernel.org/>
References: <bug-205181-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iJg7r-00Gryd-8F
Subject: [f2fs-dev] [Bug 205181] kernel panic when accessing btrfs root
 device with f2fs in kernel
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

https://bugzilla.kernel.org/show_bug.cgi?id=205181

Andrew Macks (andypoo@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andypoo@gmail.com

--- Comment #2 from Andrew Macks (andypoo@gmail.com) ---
The issue is present in 4.14 longterm, 4.19 longterm and 5.2 stable EOL.

The cause is the following patch:

July 2: Original commit
  10f966bbf521bb9b2e497bbca496a5141f4071d0
  f2fs: use generic EFSBADCRC/EFSCORRUPTED

July 12: Merged into mainline with f2fs-for-5.3

July 28: Fix from Icenowy Zheng (read this for some background)
  38fb6d0ea34299d97b031ed64fe994158b6f8eb3
  f2fs: use EINVAL for superblock with invalid magic

July 30: Fix merged into mainline with f2fs-for-5.4-rc3 (note the typo in
branch name, this was actually for 5.3-rc3)

September 15: Kernel 5.3 was born so already contained the fix.

It was backported into the relevant branches below:

October 1: Original commit merged into 5.2.18

  5.2.18 (5.2.19, 5.2.20, 5.2.21 EOL still affected)
  c704eb3aaffae0d6463b1773b37e69695b112ca4
  f2fs: use generic EFSBADCRC/EFSCORRUPTED

October 1: Original commit merged into 4.19.76

  4.19.76 (4.19.77, 4.19.78, 4.19.79 still affected)
  59a5cea41dd0ae706ab83f8ecd64199aadefb493
  f2fs: use generic EFSBADCRC/EFSCORRUPTED

October 5: Original commit merged into 4.14.147

  4.14.147 (4.14.148 and 4.14.149 still affected)
  e991f02f6f9117514ed1374b39ce195013ab9cd0
  f2fs: use generic EFSBADCRC/EFSCORRUPTED

...

Further notes:

* To date, 4.14, 4.19 and 5.2 all contain the issue.

* The f2fs development/stable kernel branches contain a fix (including their
4.14 and 4.19 branches), so the issue is not present there.

* Not quite sure why this commit was backported at all to longterm, but maybe I
am missing some behavioural change which warranted it.  (To me, it seems like
this was long-standing functionality already).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
