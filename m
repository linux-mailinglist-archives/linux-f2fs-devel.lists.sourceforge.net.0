Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B85829A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jul 2022 17:31:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oGj0C-0008ES-FZ; Wed, 27 Jul 2022 15:31:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oGj0B-0008EL-5t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jul 2022 15:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oi0z3hV3TDrYeXzBMDKQby7ni5rGCmd+VzN1BCoJqcU=; b=Z8MJYC2D3ZAmr1/flmbCjrie09
 PLgmB4ozHEaCNDa270XHbhIpJPFsD2eMDbLlEcOM38BXeq0pahe6W2y+Hqt4SvC9KFQ/iEW5kq1SC
 Xw1jwvPWTeBxkll0LPV5lie/JidpaP2L6spbwq+BoVc2YL8ZIwOnx/OsIT1/DBWPCuCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oi0z3hV3TDrYeXzBMDKQby7ni5rGCmd+VzN1BCoJqcU=; b=Bweq5+BvWaGu8Et0Hj9AQhBAmm
 AYqSKSz7G2SxcGS61hyP8mUXSiR0q2QBIdAmanL/EBzLSy44tWGLgbJkyRUJ5mMTCNjHiYOoYu/qp
 tLQDDv8D6wsotys7xGiFgZTvybxo+izVOeaGwdQbR+GCQLmFTO6giCWrQGnT1OyhhXcs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oGj06-00C6j0-IO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jul 2022 15:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6081D6193E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jul 2022 15:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5184C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jul 2022 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658935855;
 bh=Oi0z3hV3TDrYeXzBMDKQby7ni5rGCmd+VzN1BCoJqcU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=doudiqxPyIzSzNXxAOfThJ2VpWAUQpr7kVPmUQ5sC6m3DrKiDl+JE3Nk+ZVVG7wgo
 edRDvrVVQTRGcd0soJzqC7wZeeLVDPSvb+1WQTAV/TB9qfciACnIXNvhFRYFWUReai
 XtivZU1ST/masLJK4IhJ23b/3oIFsJ0qhQ9467vxgNp6k0U6mGUkQTgfSO2FBHV0w8
 uNq9+CoqfEZgCjBlkTpZL2/ZALRQUN4BT71LfdcADhW+5/ed0ii6rtmq5RqE2D9t+5
 oFEvGbkqf8oLPW0dTR9pen3tye/StikM/dztzVY5ZhZFIJBk22RSNlkNl0PMYrAHmf
 OPT9RYghA2nGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AC798C433E4; Wed, 27 Jul 2022 15:30:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Jul 2022 15:30:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bbutscheidt@yahoo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-qTL4F7Sfvy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #35 from bernd_b (bbutscheidt@yahoo.de) --- As a normal mouse mover, I fear
 I cannot add much of value here, but this error occurred on my system too
 after a system update. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oGj06-00C6j0-IO
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

--- Comment #35 from bernd_b (bbutscheidt@yahoo.de) ---
As a normal mouse mover, I fear I cannot add much of value here, but this error
occurred on my system too after a system update.

I ran this archlinux-system from two simple usb sticks, both formatted with
f2fs. One thread of four of the cpu suddenly out of the blu is occupied with
100% by "f2fs_gc" after a handful of minutes of uptime.

So far, I downgraded to kernel 5.17.19 and got hopefully rid of the problem.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
