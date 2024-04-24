Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF08B0869
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 13:39:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzay0-0005xq-S9;
	Wed, 24 Apr 2024 11:39:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rzaxz-0005xO-5e
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 11:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qAkfWT9LnbWcv0YAMG+ZL+GKUI5Miu82IG0RB4e7wTc=; b=Zk/BkLYjqYuExxbqdpP7xCnM5r
 kx13fkw9bwJwtDeWHKgsvnpVrx1IShWg+q+PTvTWv1P8VAAiMTeRBpsJNIVqgqenqOmIRjs2GFXTF
 6KEBuu0ygHCYUuiWQ2EEHTD1QihWqYc7gPWcR9PSGA5iK0mMlFFJ9lpbtdc6dSp6JsFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qAkfWT9LnbWcv0YAMG+ZL+GKUI5Miu82IG0RB4e7wTc=; b=D
 WZeUVt94aNsfsToHlIfaO5zEveTanuVvnm+6+Eq4Gn16ybhYMUv4izSiOXAssMb34MulSF9Gg4FD5
 F/2+tUQxoV1EgJ2yuN5foL0Pgcnboa8TAAEcbTKOFgc/uDZKllrD06X9mIr06cSu/s8qXPVGr4ghV
 Y3L07mi+GgfMlyZ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzaxy-0004QI-9r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 11:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BC4761857
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 11:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3CAAC2BD10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 11:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713958736;
 bh=+snKENNsXWoKc0JW8gX1w1Yjd0pX3CBrGtF5qoVDRVU=;
 h=From:To:Subject:Date:From;
 b=AffFjLZhaZLiwJLWvaA+H2xkjCrDzd1svqWiH9XP+V7HaMOlio0HuMWI6F+Exhkhk
 I81/N506b561Xml0mwMi78y0ToIAP1XQQqUomK9tGeI2TjNT4c0bOxdVsJJoUvUCnA
 k8pM+IMnQlZOle/rrGAAJMESgqgr2M13OUyb6/0ZqJ6TX3CeBO4iM69V3PJ581JVUV
 F2sie4aCOzkegT7jC7XpTMLtXEwBJ0c28OF4nythNtRZBjqQ2ft/VwvFh4exhxxxAJ
 TYcr78F7TMBt2HP2fvC1OjYkjsvzZgwp2TGTIAIK8ZHfmNh6ElE8exV9++xI3rO27w
 TpVBiizRZBqRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8DD72C433E2; Wed, 24 Apr 2024 11:38:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Apr 2024 11:38:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218769-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=218769 Bug ID:
 218769 Summary: fsck seems unable to solve corruption Product: File System
 Version: 2.5 Hardware: All OS: Linux Status: NEW Severity: high Priority:
 P3 Component: f2fs Assignee: filesystem_f2 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzaxy-0004QI-9r
Subject: [f2fs-dev] [Bug 218769] New: fsck seems unable to solve corruption
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

https://bugzilla.kernel.org/show_bug.cgi?id=218769

            Bug ID: 218769
           Summary: fsck seems unable to solve corruption
           Product: File System
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: guido.iodice@gmail.com
        Regression: No

Created attachment 306204
  --> https://bugzilla.kernel.org/attachment.cgi?id=306204&action=edit
fsck

After installing kernel 6.9rc5 it seems that all my f2fs partitions are
corrupted, according to fsck. On boot the check-repair is always performed. I
also tried running f2fs from a live usb (with kernel 6.6) but the problem is
not solved. Even running fsck several times always finds problems.

I attach the output of fsck -f -d 1 on one of the partitions.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
