Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3553ACAE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 20:23:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwSzd-0003nD-TU; Wed, 01 Jun 2022 18:22:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwSzd-0003n5-7c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vMA0/UFAXPAwcwejtDsQwPRAlUb88P+ZeLAeWa1FJIs=; b=B2cGKF6K1f5ntVj6IFw1K0BLX8
 +94sDUGVqK6gEzuVnfnsgkVPiGnXOalC8HvZq3c41u9wlLWZw8m7pVZlzYOfdyY79xiBvBxyeaLKe
 OW6adeGujcFigKHc6iVqol+ULO7knX5z6ZdlnM/gjEU7SyEK5jlAotjCMOJ3eONeZJok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vMA0/UFAXPAwcwejtDsQwPRAlUb88P+ZeLAeWa1FJIs=; b=HUnTL8hx9e0Ts28UZkbXtIUxxF
 F9Y6ivlwEHsY1QCis86DSMNRCyrOOxGUYhwZggkO9dfNtCxUCelhYajC/lmAb0k7fjg1sD/mkOexv
 VoRTND0vLIxU/nR2j1x8tcCrBHCY/N2wrxvRgOm62w3hngeXZey4URErpAt5+CAvaTM0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwSzY-0006Po-Bn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 18:22:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 760706166F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 18:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45F91C385A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654107759;
 bh=RwAsLhK2+qkz3JnXo7Yyd+M6M71YVmyLJR4x0eUxZC0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MfIkMYtLCP5jTD2BXIdrN4ocbxLxBUkD/anYxpRol5F/YHrXmUAyubhaXkJ8qPe9y
 nsEbK3pR8KeBDAXzSaP0rk0n+xS1Vzz/te5B36kxImgAKr/y5LLQQoYeItSFzrCQJS
 kZLLzkkvsFDC9fcntU4Oj819Y5xcQm/4A5adQoD4uO859FRzXF6RkHaqHPfqtJq4lG
 Qg2bPMk2hhiT+ifUqes7hBKLml1hMjpQBzSD4m35DZsSe1GR0OTKFAIgBKl/9p6h3W
 zEYJ4qZckxsHMk907xBYP+Zz5KfcRXO3pBTS+XxEs8unAJXueAcm45vGLc85U+uEYn
 Z3dEqXSe1gIug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 298E8C05FD4; Wed,  1 Jun 2022 18:22:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Jun 2022 18:22:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-H66f1DQqpW@https.bugzilla.kernel.org/>
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
 #14 from Jaegeuk Kim (jaegeuk@kernel.org) --- Re #9, Thank you so much. 
 Content analysis details:   (-5.8 points, 6.0 required)
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
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwSzY-0006Po-Bn
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

--- Comment #14 from Jaegeuk Kim (jaegeuk@kernel.org) ---
Re #9,

Thank you so much.

   f2fs_gc-254:2-1156    [013] ..... 22290.243361: f2fs_lookup_extent_tree_end:
dev = (254,2), ino = 1409621, pgofs = 234, ext_info(fofs: 0, blk: 0, len: 0) 
   f2fs_gc-254:2-1156    [013] ..... 22290.243362:
f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
   f2fs_gc-254:2-1156    [013] ..... 22290.243362: f2fs_lookup_extent_tree_end:
dev = (254,2), ino = 1409621, pgofs = 234, ext_info(fofs: 0, blk: 0, len: 0) 
   f2fs_gc-254:2-1156    [013] ..... 22290.243362:
f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
   f2fs_gc-254:2-1156    [013] ..... 22290.243362: f2fs_lookup_extent_tree_end:
dev = (254,2), ino = 1409621, pgofs = 234, ext_info(fofs: 0, blk: 0, len: 0) 
   f2fs_gc-254:2-1156    [013] ..... 22290.243362:
f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
   f2fs_gc-254:2-1156    [013] ..... 22290.243362: f2fs_lookup_extent_tree_end:
dev = (254,2), ino = 1409621, pgofs = 234, ext_info(fofs: 0, blk: 0, len: 0) 
   f2fs_gc-254:2-1156    [013] ..... 22290.243362:
f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234


It seems this disk is dm-2, since the extent hit count is something below.
    - Hit Ratio: 0% (38193 / 78044163449)

I'm suspecting this flow, but not sure where it goes into a loop.

f2fs_gc
 -> gc_data_segment
  -> f2fs_get_read_data_page
    -> f2fs_lookup_extent_cache

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
