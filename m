Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA905644E7C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 23:19:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2gI5-0000DW-U0;
	Tue, 06 Dec 2022 22:19:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p2gHm-0000DN-PI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 22:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIhGj5g7Q5b8Yr0lXrBDxKBK4qFmaU4n/lNeXhXvCw8=; b=BnQ0nC3OQVAw2PjI0Ux+keJGEu
 dnXNsa5JaI3Orq5I10oB6ha50ZWzBGLOmIHdp4NVZ5rw6O5sxcxs+7HuKwVZAMpKgK0ZbJx15yHoL
 T1duVf+q0ABWdM++M545ZV2P3THu9HHWFlDaPpBEV7QWelfw+TPZ5YjH7JH00FWjavpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cIhGj5g7Q5b8Yr0lXrBDxKBK4qFmaU4n/lNeXhXvCw8=; b=PhOoJ9FdF4G4UgV+73aFh9YdWC
 IQ46dY/ATKCB78bdr4eoqBiVb/+OjmWA+rAOzndC31OCSldnMCBn/VVLe/r4ESHrYqCac1/vH4JLm
 deviC1VWxvr9kS3oE+AyPiI49KnZgQTnVU3DXq3AxuaVt7QHAq7199X5g5osesqgoS8U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2gHm-0002kV-1C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 22:19:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9D08B81B4E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 22:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55DCDC433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670365166;
 bh=cIhGj5g7Q5b8Yr0lXrBDxKBK4qFmaU4n/lNeXhXvCw8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D+vgumr8lrCrJE49hovknMDnj7jZHTClBUpPHbVr67HB/jdM36zGBlCBjP4mm//1F
 2vCWTHsve+2MYgt1bFtyu7YOvYLg0e008poZaukcrJyIucRTx84qbBBC9MJoyUv+Dx
 35tIKxh0Jf6tGet1QhmSPueb5CZlCYrXUkdpDv4NQSwRZfg/jTDvO/1XfrnUA3rzzQ
 HR9hPFvzpR56S+rQe4uSO1PpI9nNjmiDKii5km2oA2b6b6kG8DjQc1lRYvk2tLKHj6
 0cc7z0yjVmhkMaqvftZx3jWfm8mKThaLdUR5PaemeAQX2+KpVbxHVU19+Vh/mZGTh1
 PjQ79WBrM9fLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 33CEAC433E6; Tue,  6 Dec 2022 22:19:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 06 Dec 2022 22:19:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-Tmrv8pcUMv@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #105 from Yuriy Garin (yuriy.garin@gmail.com) --- I'm running next debug
 patch,
 but problem is not happening for 4 days at this time. Can anybody suggest
 a way to increase chances of this GC problem? 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2gHm-0002kV-1C
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

--- Comment #105 from Yuriy Garin (yuriy.garin@gmail.com) ---
I'm running next debug patch, but problem is not happening for 4 days at this
time.

Can anybody suggest a way to increase chances of this GC problem?

Sometimes it happens twice a day, usually once in a 2-3 days, but sometimes it
runs well for month - with the same work pattern - development compilations all
day, never turn computer off, no hibernation.

By "way", I mean not scary, dangerous, intrusive way, like LLJY script in #83,
something "more natural", less intrusive.

Thanks!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
