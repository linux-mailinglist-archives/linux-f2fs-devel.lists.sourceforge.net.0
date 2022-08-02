Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6308A5881D6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 20:26:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIwan-0000Zm-5b; Tue, 02 Aug 2022 18:26:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oIwal-0000Zb-60
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 18:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=56f+cn3UenGcDpMGUAMAzg4Kd2GKtA+hpM4X7HPIyXY=; b=BLmFVjG4pbod4AzwwcwGZ2Yuui
 VKo04ByteM/uB2rQcn4DEIqaM4pdH9q/AojXqoyfEXD9/s6KluOv028h+bBcIvJuQTU2kkfFAKVBG
 Hzr6K5TbFpFOAmWcyFwZLhmuHPf8pHe+w2aXBoAz0bhbLuyrPfgEZTMTuw6IS2UwbKZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=56f+cn3UenGcDpMGUAMAzg4Kd2GKtA+hpM4X7HPIyXY=; b=Pnrca804vC2gpIU1oaQVjFlOU5
 twRUp67cIUZapuPsPIWyVidB9puiBFMyAs9nIx1cxd3ZhheykBO1orvu0mLY9wPawvKusVuDujQav
 UTR4WrKFXip+0GWsxV1L7bD59a1gEoyDjiejiGhR94GIep0ypjAfDx9/HsgBiZUByx24=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oIwaf-0002Zv-Oz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 18:26:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2DA4B81EC5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 18:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49091C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659464749;
 bh=56f+cn3UenGcDpMGUAMAzg4Kd2GKtA+hpM4X7HPIyXY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=USaqJoW6DWGiKOmqYnkBNcGx7ayhssGzh5QzV8Al0SBJhR2iwu4K3HZxrwiqwrpHA
 y+0FNNaw+GezOT4Y8+HVOR8wQsyIrIFCQYjBqPiht+0IBrxE8bHAc0J5eTfd7cPYok
 NznOvfaJvKUWV7RV99nZOqGK73hrP0ZZnXX51i8Rd+FeAQ4HMujvHcVihd/IL62+FP
 1IsLGi0nTgppMA/29WDVCDQ2r4U9aFPurfqHMPgM+m4HEOkPThch6raNYZbNPCEjJj
 GJJirgYT/AE7uKpHNblwaN+xwDdxIygHdooFbtTpJbDTUGRhZR33aukZn2QxKxuAO2
 MYyXhOVblwPIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 29C24C433E4; Tue,  2 Aug 2022 18:25:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 02 Aug 2022 18:25:48 +0000
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
Message-ID: <bug-216050-202145-MF4E0RWY0y@https.bugzilla.kernel.org/>
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
 #47 from Yuriy Garin (yuriy.garin@gmail.com) --- I don't see this problem
 for a *month*, since 2022-06-30, see #25. I didn't change pattern of work
 - laptop is always on, same daily job, no load at night, no hibernating. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oIwaf-0002Zv-Oz
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

--- Comment #47 from Yuriy Garin (yuriy.garin@gmail.com) ---
I don't see this problem for a *month*, since 2022-06-30, see #25.

I didn't change pattern of work - laptop is always on, same daily job, no load
at night, no hibernating.

I'm on Arch Linux and do upgrade every weekend, more or less regularly.

First time I had this problem was ~2022-06-15, at that time I was probably on 
kernel 5.18.3 or 5.18.4. I had it on 5.18.6, see #25.

After next upgrade and up to now, kernel 5.18.13, I did not had this problem.

This brings the hypothesis: may be the source of the problem is not (directly)
in f2fs, but in the other part of the kernel, and kernel upgrades affect f2fs
in a negative way? Kind of "feature interaction".

Next question is: what was changed in the kernel around 5.18.3 or 5.18.4 that
so dramatically affects f2fs?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
