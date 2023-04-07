Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF16DB0B4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 18:35:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkp3N-0007nW-FZ;
	Fri, 07 Apr 2023 16:35:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pkp3M-0007nQ-CT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 16:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x+vHCIAVk8QfVkDoSas4VFgSuVVsp3m5bbjtn3z1Zrk=; b=IRGlE+IRf0jHaB1vj/pOwpZV7J
 43A2BQX+EoHdTjrVKpcvbkB0UnW1FLJ/nIvHXOsbeozJqprxUVt3/aYRyziQMFpdvTQReWuAk5G9n
 2x0u0Gb1HiLmPlz7uyhj4ITEm+47zXsVsFE9VFI48KKfRUkhQLO0QG+s3LjED8w+lF3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x+vHCIAVk8QfVkDoSas4VFgSuVVsp3m5bbjtn3z1Zrk=; b=HGE/npDiuciwtK4njoF/+mshPm
 p7LDydDzVHdm+7tFZPFtM36qHDf3S5NE2NWZaYX9tId6e074MHsrfe+9XiNG17urX2/8hNyjNiVzl
 FQ/S1zlfBthC4ETw/8TwF5I/n0SDXrENKlJy1w8+zXKTvugeDx078e3UPOhA6o7cUJyE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkp3M-0007MA-N6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 16:35:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 571F662D10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Apr 2023 16:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7706C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Apr 2023 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680885302;
 bh=x+vHCIAVk8QfVkDoSas4VFgSuVVsp3m5bbjtn3z1Zrk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ma7hVgIGwpUke71DdtxBeb4o0AGW8WifITJhgPoEOP9Fj41t+4GqQ0js9aNK7ypiO
 fAn55Q5sOiqp6nv+hcqId/AcE1YaZcsJZW8cURIg4aYKtzl7Rd8ppMca6YUalwIyty
 kPv6qfkseaEYm1aqKABSgXvwo94vbhN3kxwhnkXH7v1phxkPBOndiL0XUzpMs/pvgo
 liGBaKG/Mi7XpbyY3zvFRYu+VlIifB879bhGT0USY2JeGnTjx9+0Ec/mYFOSimTWgy
 YuICImNmKmlpZH3mZTFtrAO9XpHNl7fcc7GINKFNjap6OzuM0GMddArQ8Dz5J2A/fo
 ayY1VEsXSLfIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DB9EC43142; Fri,  7 Apr 2023 16:35:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 07 Apr 2023 16:35:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-5hYeDJc40Z@https.bugzilla.kernel.org/>
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
 #151 from Jaegeuk Kim (jaegeuk@kernel.org) --- Thanks. I found one mistake
 in the previous backport of first patch. Could you please re-download them?
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkp3M-0007MA-N6
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

--- Comment #151 from Jaegeuk Kim (jaegeuk@kernel.org) ---
Thanks. I found one mistake in the previous backport of first patch. Could you
please re-download them?

https://github.com/jaegeuk/f2fs-stable/commits/linux-6.2.y

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
