Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3851399E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 18:20:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nk6sT-0003GK-Ht; Thu, 28 Apr 2022 16:20:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nk6sS-0003GD-EV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 16:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KKyU9ULjrADVinwIi9WI5piK0F7MrOjmq95Q5O1aOms=; b=Nnqr93f/ty0G0mTnrnjEMtNPco
 rv//RMpHxEnQ2v0x0UWJQFVoox83cEz5k14G/HEUvNMgcXrJy0MT87OICSPkHfmCcY7COM44p/qR+
 NKf8mzTR6bSd4zLSqEqHqMnmH5pvbNM7MEWKOWnOWlEbUMfJCqgAiAPizT4djTu+hAAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KKyU9ULjrADVinwIi9WI5piK0F7MrOjmq95Q5O1aOms=; b=G
 bmbGOv8tXmyPbxDgYHCrO1T9ghNCWo4d6skb++BD3z3kH+xhWg5co9+UmgVazuVlmVYy/tfwKknEO
 f9W+yM8lMwzoCknW7aevKKrzOl4aMitO6O7XT8HtEq8OhGI/+EXEew/p8o3kEdVcV2pM0kN5MCc4j
 bdFBK+9b9D1UNvn4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nk6sO-00Cx1y-8u
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 16:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E0C162083
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 16:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3C72C385A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651162812;
 bh=SsrEJZygFem/DP+OD+Jglsa+PgqAcq+rKi5AFUDXh3A=;
 h=From:To:Subject:Date:From;
 b=aChsb00GyqWeStT05VOppbMTdmGfda9m4FBlG7ynR0m3xzE4uScj6nc/36hKePFZe
 4Ek8opnc1SDGY6/5k6GQOUCVM8wpdHTUx6qBRkbSVZ0bVolLiWQfv588JsTuu2Oez/
 mU6EndHCBXlNGzlt/m6Qcu/+WE8pfl0riX2eovW0muM99X6hvmbvOwkEfUl+69bXZc
 Lt8IvnlVtcPPQkmS3MDQ0ejKwYq07lKR+QauumGqt3+xR60kwu3RC0/l52WRYKDY/R
 OVHl/thq7n1NLlfzDuEl4483lCHl+E4uJx9PNwtKWvmfSLTaQPaahp9mE4yemVkp8M
 qtdIFmV/SDjJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 97125C05F98; Thu, 28 Apr 2022 16:20:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Apr 2022 16:20:12 +0000
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
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215914-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215914 Bug ID:
 215914 Summary: kernel hangs after mounting the image Product: File System
 Version: 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree: Mainline
 Status: NEW Severity: normal Priority: P1 C [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nk6sO-00Cx1y-8u
Subject: [f2fs-dev] [Bug 215914] New: kernel hangs after mounting the image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215914

            Bug ID: 215914
           Summary: kernel hangs after mounting the image
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

I have mounted a F2FS image with several mount options. When I try to perform
any file operations on the mount point, the kernel hangs. The process even
cannot be killed. I am wondering whether there is a bug in the file system?

The image is provided at
(https://drive.google.com/file/d/1EwbxTExo7lsNgGKRpK-CP3ccIkFJe4kg/view?usp=sharing).

This issue can be reproduced by running the following commands:
losetup /dev/loop0 case.img
mount -o
"disable_ext_identify,inline_data,nobarrier,extent_cache,grpquota,fsync_mode=nobarrier,test_dummy_encryption"
/dev/loop0 /mnt/test/
cd /mnt/test/
touch test

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
