Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BAB69DED2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Feb 2023 12:27:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUQoN-00062n-Jd;
	Tue, 21 Feb 2023 11:27:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pUQoA-00062E-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 11:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=34+KigIncGN/PHxAHnxNWKr8KupH2ELcd/JU9aZWwDo=; b=Xmg4fF8STVFAQ8oPr4zWB1znmS
 r3UiJRqZphPA0mkiSQ+Yp3UPUxecS/XVpwPoFv5waHn6QRY+48VNH2npnpLW8g0xkPbeuSuNO5RGo
 SWNmry1MZa0olAbheajdjqdX1sVNjXPPyWwVlatM9VzCeLgk1g5aEPcLhQ2SWzkSGQmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=34+KigIncGN/PHxAHnxNWKr8KupH2ELcd/JU9aZWwDo=; b=MD6JuswIXygcEr0n7rG/GKfLgN
 DwcXKRbRNLTKiy8cj9/fyE30JxvNP7Isx4qUWdpTi6QsKJ++thwDc4xA6SS8a33+w9pPe7OruTVAa
 1cnKPjTVX5RJsiuGvNx6tRVkENAcS2o+eZ0htazG49lOHXYXOhB6xX7I2iOoreqL/Eus=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUQo8-00CDWW-H8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 11:27:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F150B80D5D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 11:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8537C4339C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676978849;
 bh=34+KigIncGN/PHxAHnxNWKr8KupH2ELcd/JU9aZWwDo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EPhX0WlqIuSukeORY8cYV1n3lhpeKzJ6uOqwG3XhMgk3GWe7GFGLpalYH9r5IbPMX
 mZaEyADH8/uzLA9Wa7ayRvC5+qI7O6eO9Z7pJyn5WCrSSAK/JNYaQmYEr3mln+tra5
 QQres3p4WOV7zdgh4WLUQ0kLDx8+eJuVKXMzNd7+zZ/B98Sjc9WEVRdTrHl11LU5Q4
 onxBdOri1stbikSnSvM73A6/HIndb/SO5l8ky3TSUDvdCBwLUwxjaWUGXQJms+1jDt
 1Fzq+Kbvu4K4c3613ux3Ne6FI9WZRhlCPInvA51KzOinXN+B4pXTWJKV9Y9OEEReAM
 vwL5jl8/t290w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A83D2C43142; Tue, 21 Feb 2023 11:27:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 Feb 2023 11:27:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-fP2xEzSvg5@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #136 from Guido (guido.iodice@gmail.com) --- OK, I am testing the new kernel.
 I tried the script to force the GC and noticed that on the root partition
 it occupies 10%, while on the home p [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pUQo8-00CDWW-H8
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

--- Comment #136 from Guido (guido.iodice@gmail.com) ---
OK, I am testing the new kernel. I tried the script to force the GC and noticed
that on the root partition it occupies 10%, while on the home partition the cpu
occupation was almost negligible (0.7-1%).

The process finished without any problems on all partitions.

I will keep you updated of any problems in the coming days.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
