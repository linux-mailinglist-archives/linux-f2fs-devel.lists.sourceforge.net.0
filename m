Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A09D65DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2024 23:46:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEcPP-0000PA-29;
	Fri, 22 Nov 2024 22:45:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tEcPM-0000P3-Th
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 22:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1PxAbW0n8nKFzNCTYOcf9XaKaJ+Zt1C/W7C95jp7hY8=; b=kQVDuHPiRf5ClRuQ+Rr6mztE3y
 asTceoJi0BsTZtTzJ+tHJiyiN/qr6cHJzrXIo04bWnD2hob3Yquq5uF2S8dJGdxtcWJIpw6dShTAS
 SfbLsFuBdvXaFNDfvke0nKWJY28hra9piRsgEoZB0OF1KqrocOpRaCmUfUfq3zwPd12M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1PxAbW0n8nKFzNCTYOcf9XaKaJ+Zt1C/W7C95jp7hY8=; b=iLlgSt8eGMdRhgzU1w3ccKXCZD
 WLLd9xd4+SwkIz6JFzOLsrYQnYe/I2nHwka0qAtpDJ+FxIK7r8EM9D+PW5PhWXYJkOFcnurAFMZx9
 3VTOTPpEEHP1bVtpBIbom5jhzB7Nw1Ho2R7JOLtdTeeMuAPHQWv0Ymrhu//jvgLMs3Us=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEcPM-00066b-5m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 22:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 42995A40CD7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Nov 2024 22:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23E52C4CECE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Nov 2024 22:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732315537;
 bh=1PxAbW0n8nKFzNCTYOcf9XaKaJ+Zt1C/W7C95jp7hY8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aSpsKTlnRPnF010GVb67z9W+TNm/rtjxdsvrwK077zxyx1j8YxKCznUUMbmKR/U3r
 idugEf8WcpHlhMqYAdKOVGRDfxMp559N57qZagsAD47OPkv9uZXq9nJRJAI1nV8e+8
 nCvTHHtgedPwMjiN69RWAPhQoyTNolkQjCchQEuvU2bDhOgsVBgzYIyirqkWnSqM2h
 DprKw1PITfmBowFy/O4B2/JsSJ+/doo4iDLWSU+i7jEq6MgU/AnILI7C49azmLXU3i
 RGBfrbgRfjy6btgLGNO+9ixsF00cc5FquMuv8tOpoDifggjULLtxMSVNPgE5yYE6Fk
 vJrOiBUQoBVZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0E2DBC53BC5; Fri, 22 Nov 2024 22:45:37 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Nov 2024 22:45:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: piergiorgio.sartor@nexgo.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-cLkHJzhJhG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #8 from piergiorgio.sartor@nexgo.de --- Thanks for taking the time to
 reproduce
 the issue. I tried to compile the kernel with your patch, but it seems these
 days is not anymore as easy as [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEcPM-00066b-5m
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=219484

--- Comment #8 from piergiorgio.sartor@nexgo.de ---
Thanks for taking the time to reproduce the issue.
I tried to compile the kernel with your patch, but it seems these days is not
anymore as easy as it used to be. No success...
Good the you manage to see the issue!

Thanks,

pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
