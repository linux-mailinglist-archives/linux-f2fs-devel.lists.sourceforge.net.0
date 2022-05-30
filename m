Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A785379DD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 May 2022 13:29:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nvdaG-0002MQ-9W; Mon, 30 May 2022 11:29:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nvdaF-0002M0-49
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 May 2022 11:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j5+gffg2wWVQbq31GSzO5Oga+IlzhuVsQJrbbsORqYw=; b=iE4IhVJZrpq3SMYEmhqZsSWcBW
 vX0ZgPAE4Y/+P0ch3sJmdmRxlni6Pj6KO3KNCXrf/Zgi8lU3c8KeYME9HPpGC3Pdny8dGLy7AGCX4
 DrUoLyX+KG3ow4sZVbhqzzZMZ1FT4ZibpFEhKYf4EKMuqqouN2kkRelG3R5PdKYYwoe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j5+gffg2wWVQbq31GSzO5Oga+IlzhuVsQJrbbsORqYw=; b=A
 mexSX0fcjlShhTtCGRwYALoAP44B98SdXjsqnZocLEbJM4aDw3+LlSe9Nl4IDnf0viGfG6E/bzlDq
 afoiDvalQMuU5B2/Gif6BHRpc015D0Wu4S7GVhunI9CCyt8lVO6Wa19b+PH6if0vwPeeXGiOew29R
 eEuVjSa7l+QuNFXY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nvda9-00030s-Ke
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 May 2022 11:29:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B840F61157
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 May 2022 11:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29CE7C3411C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 May 2022 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653910140;
 bh=EzAVJQ1/U3njxbbyiGAjXuBCzzFX4Ftun+kwL6lgkx8=;
 h=From:To:Subject:Date:From;
 b=orbgsgSsNZTkVJFdm56jMZTAgL9fmTBgiOeqBOCZUoHIMg8rFEWDA9lvw6GzYLrMe
 i2zLvlw3yp1C+emtqwQkaMiydthQMkGj184cSfIHwvSJz4W30h2knZwd+vcybMWIuN
 FsCLwYIfxAaeBZZFmyV3lGZjvfh6u8miHfrIKHiw6LMqXpMHtbe2+rAniYmjLrGdKA
 mBxx6Y+6V0ki4sXkIdezzDFtLBLjOD98jXRXU2+dqo5Z6WNaywBZOJVnks6XWdBfyE
 WAujTXcIp+avCTJBQOHc1w70ck4wuISzYZDp5fqTpXrqkjkWwA1cKGSTOQpgBP7qbx
 Y5FjPF4JnRj4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 00557C05FD2; Mon, 30 May 2022 11:28:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 30 May 2022 11:28:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216050 Bug ID:
 216050 Summary: fsfs_gc occupies 100% cpu Product: File System Version: 2.5
 Kernel Version: 5.18 Hardware: All OS: Linux Tree: Mainline Status: NEW
 Severity: normal Priority: P1 Component: f2 [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nvda9-00030s-Ke
Subject: [f2fs-dev] [Bug 216050] New: fsfs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

            Bug ID: 216050
           Summary: fsfs_gc occupies 100% cpu
           Product: File System
           Version: 2.5
    Kernel Version: 5.18
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: guido.iodice@gmail.com
        Regression: No

The problem started when I symlinked a file in my /home/user to a file in my
/root (both partitions are f2fs). By removing that symlink the problem seems no
longer occurs.
From dmesg I don't see any error related to f2fs.

UUID=... /              f2fs    defaults,noatime,nodiscard 0 1
UUID=... /home          f2fs    defaults,noatime,nodiscard 0 2

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
