Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0DC6D9DB6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 18:45:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkSjp-0007nD-UV;
	Thu, 06 Apr 2023 16:45:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pkSjn-0007n7-UL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 16:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Gy9lofpR84AJxaqsfvDvrzjw0Mmz0/goVV216S6mYA=; b=eI5lhWeZiF+R5wVf/522iFKOxj
 VgWiiUjWvV/lQ+KzYzOiAmS8tGEb8EiHfKR7XTDoIcvdqFUKdZM8WHryQWK8jkyUez9bdX6Oeuovj
 KHbPA9MYWCI3+DeUwheCbFsz7vUSR5W25t7+oEnN4d8uJ63O1WhdfH6hcNcoDOxg8+dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Gy9lofpR84AJxaqsfvDvrzjw0Mmz0/goVV216S6mYA=; b=L6CycdMU2Jtf34fJepGc8Zggq6
 G9W8jEwq+/Lz7xG5gqtJc8Is94l4yW6Ay5C6KwnruqHQbc1r3Dl8NXTjH8YTxWpI9MCCpqhRBU7vq
 r3sQG1dmaOTbJ1/trq3vqE2gM/5v8bWNL1jzxnQ7N3a6znoBXWcnN4ITkulLJtahTLpw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkSjn-0005FQ-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 16:45:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A670664A08
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Apr 2023 16:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15192C4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Apr 2023 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680799520;
 bh=9Gy9lofpR84AJxaqsfvDvrzjw0Mmz0/goVV216S6mYA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YCZdn0UiVVvwexoHM7oDqeYjfFsUBpswwBwt9bNQBH/X89K1dpSWVtIBFTgcUT2BE
 nsMb6ErsT81PvwFRgZ4z1DrHRxDnRkm6FJkcF9vpaANwMeFZR2aPlQouB0E2QTcSfO
 X6GFxS7gcITuvgnqtwzkTXji79MizmLdV0/0levnC2htV34/3SiM0/PLlcy8VFplbe
 fGjlyt1DVwKJo0/krKuZe1bq+Bc1Jz+yKVFFXiuSXbZFIYO4H/6d4g3AtMgZ6ERQNj
 Qljzzsrbrip81O8spDvaMv42f0Tgu0LNXkdlYmArwqcIxw0Vuix3O55IuC9vVOh8Q2
 TrowIyGMGiWPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D9F0DC43141; Thu,  6 Apr 2023 16:45:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 06 Apr 2023 16:45:19 +0000
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
Message-ID: <bug-216050-202145-enKLF0Q0lb@https.bugzilla.kernel.org/>
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
 #145 from Guido (guido.iodice@gmail.com) --- I'm not apre to patch 6.2.9,
 I receive error for hunk #2 in both data.c and f2fs.c, I tried to change
 the patch entry point but it fails. Can y [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkSjn-0005FQ-M2
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

--- Comment #145 from Guido (guido.iodice@gmail.com) ---
I'm not apre to patch 6.2.9, I receive error for hunk #2 in both data.c and
f2fs.c, I tried to change the patch entry point but it fails. Can you help me?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
