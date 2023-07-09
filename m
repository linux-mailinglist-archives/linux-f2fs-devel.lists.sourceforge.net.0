Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A74C74C65D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  9 Jul 2023 18:08:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIWx7-0007IG-AI;
	Sun, 09 Jul 2023 16:08:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1qIWx5-0007I2-3m
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 09 Jul 2023 16:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dYvUj3p1g8hkF8f4cMvD7d5u3EoabEDqXutELIsVPDQ=; b=Qw8RCl8/+T42OV9acHXblxOEzo
 mF2MgCs5QOergoX6BAM9vAE1lNL+zAC4Mjvh+0DS4ifaOT5vrxEszHCWaYNi+l3MpXJHx2RJwZvoZ
 76dCjFxjbzmyLW7jkTDdmdCKTLnxYm/S4tIHlDxfdC96XOWQA7mxpfst151ML14+2ZZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dYvUj3p1g8hkF8f4cMvD7d5u3EoabEDqXutELIsVPDQ=; b=IcQaalykBSL/cpaGTosnzo9XO4
 ZGow8pnl+soe6llkDaVPM2XcaMfX74c5J516OqnyBvwCigRqrr6mrmuGleGPPZES4lqHJ0QHV27X/
 kPRR7CDczjJ/Mc40AwqvB7BpmnSiboRFn6EJyhXozfnwlejp2t5HnsgQt5WiwknuvL54=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIWx2-0004sG-1X for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 09 Jul 2023 16:07:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FC1B60C01
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  9 Jul 2023 16:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86DCDC43397
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  9 Jul 2023 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688918867;
 bh=25WeeFRpU+aNv3UsS5BeFnTE0YSJuJBGUSJt5SbPUX8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f0LHiUoAY5AUdi3l6SGumkJIM4KjWmE+sbzZWD+wNH/xuVnKF2WZI5lgvIezaXs/Z
 CeMElLtreg7ONx2SCLqhAxLyioQd3q1kflFp2QkIqJmr8s6qGOdJh1+1zsGQRtOc4i
 8IdeSxLy5/O9pGAFdNETi1dnUSIyqJsvkjfWroKvuEK6u0QcGUmcp/AXH02yktLXf5
 oB+GrcAC0jaTKBURiFUw2UtqQnU3R/+FMo+2/QW+TMBrYQAlFA7mmfdbKyRagR1KkG
 smc+wWlhQel5XDTPULP2fNuWXjiyDKtReInAanuE7ZIl7Y3Kw1d1atHvVD0NlFQ+Z6
 4YWY4rSxR1k8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73F40C53BC6; Sun,  9 Jul 2023 16:07:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 09 Jul 2023 16:07:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: uddipak.bhyn@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-bkLiIot7Ti@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216050 Uddipak
 (uddipak.bhyn@gmail.com) changed: What |Removed |Added CC|
 |uddipak.bhyn@gmail.com
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qIWx2-0004sG-1X
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

Uddipak (uddipak.bhyn@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |uddipak.bhyn@gmail.com

--- Comment #173 from Uddipak (uddipak.bhyn@gmail.com) ---
Hi,
This issue often occurs in my system when the disk is around 80% full. When the
disk is less full I get much more uptime before this issue comes or would not
even occur sometimes.

$ uname -a
Linux ... 6.4.2-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 06 Jul 2023 18:35:54 +0000
x86_64 GNU/Linux

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
