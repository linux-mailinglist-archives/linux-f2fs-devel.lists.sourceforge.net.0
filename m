Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F87278A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 09:21:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q79xn-0003yY-FP;
	Thu, 08 Jun 2023 07:21:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1q79xm-0003yS-6p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 07:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xILXibYXz/4kbFRvlpm0eVWoa5SkBntXIOHBoquRz4Y=; b=Y/GH6d1v4D60iES/0jJU4elCj3
 0ZdBNvaZHAEG+YTR76dg6sTCnJcGNE9R8dRFKMm3xETIiHv3vXhQxBFhSwEwN1euF0KXL7LbdAWBg
 lMR5Q9jIYkFmG99/pE3KWuTDbsqPVvCwYBB/uWZnYGTJaxxN7zPkoJwhpwlpsPCT+cDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xILXibYXz/4kbFRvlpm0eVWoa5SkBntXIOHBoquRz4Y=; b=SPCkqSlkC7qL6pIAHyUlrMbu7Q
 e/ZZyGYnVnanlFXH1VfN3ybj5PIlJ2fWREOZkwxJPi8PqrQyr1LCndnQwv18RZrIV5dr27T6dD6PP
 pwy+fuBUCTkgEO4ruCCZEKobAFCZ2FWNFALCBjEMMBHGKkByuJoMmVUzmRb5RBHcnibA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q79xm-00ERjy-4c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 07:21:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5FA064973
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jun 2023 07:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAE97C433A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jun 2023 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686208895;
 bh=6gcgw77kd8FR7SLNLNFr0ty8o82NtUvFnlis5JFIBTk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jAqWA5qO0rs4gdh5JR83IPzN2RP2U/TjxIzyl3X43X/L9jF1OE1UJgy5Jebab31t3
 CstNJO2XFgl73LV+GKu/ZMLxcTZMbCnEvVyASX4KWNpZSP1ibFI9870OeZQ2i99Ltp
 5oG11Vv6rxOvNiyGfedjh91KcyGNEcHA6GQISZ47vueIMFh1Z8on2IQ2f8YjI3Xuml
 vlObxsz8gJkWc2LUGjUvvPexAujNa2cBxbxk2stHlERIxgd3iBupQplDRX4n09sfYL
 9R1fNhO/UAupnCqRcPNytwmxDBql7GPF9yCU89/9RofqfxPAli1fYbcOmyVN2I1g1w
 jhQE0SiZEE7Xw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A9438C43142; Thu,  8 Jun 2023 07:21:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 08 Jun 2023 07:21:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: daangeurts@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-hyR97V4Jn0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 Daan
 Geurts-Doorenbos
 (daangeurts@pm.me) changed: What |Removed |Added CC| |daangeurts@pm.me 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q79xm-00ERjy-4c
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

Daan Geurts-Doorenbos (daangeurts@pm.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |daangeurts@pm.me

--- Comment #172 from Daan Geurts-Doorenbos (daangeurts@pm.me) ---
Hi all,

I'm by no means a super power user but I ran into this issue this week.
I've updated my kernel to 6.3.6 and the problem appears. In the past I had them
as well but I don't remember the kernel versions because it was fixed pretty
quick.
My mount options are the same as Guido's. I've tried several mount options but
I had no luck on 6.3.6
Downgraded the kernel to 6.3.1 and the problem disappears.
If you need more information please let me know.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
