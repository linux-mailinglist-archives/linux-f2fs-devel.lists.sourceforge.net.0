Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472751614B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 05:17:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nl05P-0007PD-Ba; Sun, 01 May 2022 03:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nl05O-0007P7-6S
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 03:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4bh/qaFvL1gu+KJ7xm9pm57zFm+FJ1Yha3QTgv64K8=; b=AoDyquECcw2fNLNimOoGbgU/1e
 KhpSI9MhmTbjH/9RMiXvmp/Z+FMftWr8QjbKj1wnzDLKljgk2xVmComA5HQp4ub2b31PZVBBSH1PN
 pxe+qidkHlEZDxjssYRE0u/JzhFhqfifwqNOyvMzYZfqup8077T0UHVbv0n9NsfziKdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B4bh/qaFvL1gu+KJ7xm9pm57zFm+FJ1Yha3QTgv64K8=; b=Db669bmbMp4mhF2IN7kza6Xgoi
 fd3Hn/N4hz6YRN7Flgm8/eaI3fNAqs/pRb3ruiFK4F9wCtdpPVQFsWLWPdXvMzzl1U+9UPBIDvz5Z
 NYZfOV0YlSQKOoSFfXB6C4gPnt2iUZUKmIVzTp8F4HhkCMNABn+QiOy+OyCe7hXLPUAI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nl05G-00FLzN-OT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 03:17:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EAB660BB1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  1 May 2022 03:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78B94C385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  1 May 2022 03:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651375025;
 bh=B4bh/qaFvL1gu+KJ7xm9pm57zFm+FJ1Yha3QTgv64K8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mvAunMCsh5RdFppBx6SYRICj3FmkmJmFF/A+12fGcJwlXcDY2Z5hli8SkjKwSOi5+
 gZSV7CPHipY7mSvgHV9E0/MzZ9xOWZJ1X5VmpjfIyQOzWna0jKwoXEGt0gQdWQK5KD
 VyUW2p8wjEPMhwjzXAC16u/ZK9ydY8MBp9djmBlYMS31nYjcFkoMZurHgKq9SZujhH
 K9dg/Cp81EZewMZl3N8Mt5uiMmpU4plo5elN1BlRDU6SSHOCbgb9qzLxbSxdsX16Ld
 nikZsWP1/E3XXlx+jFYuMHAPy5Uiihj0iNFyf0fqoOCNjU8hn9Dor1wC6ipKDHbklg
 8yEyDkEPjcmhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5AD27C05F98; Sun,  1 May 2022 03:17:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 01 May 2022 03:17:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215905-202145-KZFb90Q3zy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215905-202145@https.bugzilla.kernel.org/>
References: <bug-215905-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215905 ---
 Comment
 #2 from bughunter (yanming@tju.edu.cn) --- In kernel v5.17.5, the image fails
 to be mounted. I think this bug has been fixed in the recent commit. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nl05G-00FLzN-OT
Subject: [f2fs-dev] [Bug 215905] BUG: KASAN: slab-out-of-bounds in
 f2fs_allocate_data_block+0x23d0/0x31f0
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

https://bugzilla.kernel.org/show_bug.cgi?id=215905

--- Comment #2 from bughunter (yanming@tju.edu.cn) ---
In kernel v5.17.5, the image fails to be mounted. I think this bug has been
fixed in the recent commit.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
