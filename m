Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C24581AA7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jul 2022 22:06:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oGQpI-0007Hy-F3; Tue, 26 Jul 2022 20:06:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oGQpH-0007Hs-H1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jul 2022 20:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAGg929TNBm+MB4y60sl9gq78eMEKunOY2j2MDP/WQM=; b=evr/M/Lfgutck7G5TwXJEVX5+f
 NYCJLXxdEDnQp8sSUeZKhRChAuj2OdvNh1s5ws7d5/DWJVH1tFRQel/9EoKBUX9A0aHJO/Oy/nemG
 TN0MyVNDPU66yI/fv53AUcQBkH/xk5h9KthxDkouuQ71jXYmaZkOyx4zXCRHWERW7PG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eAGg929TNBm+MB4y60sl9gq78eMEKunOY2j2MDP/WQM=; b=YeTc3pR56okLBZJPJDoOmAGCbJ
 A5mwzfSpYGnrlIoWE6KiSewwUK8AtJkSzh8uRdYKkoA9NuGxEjGnrFWbvIP9sBV5qWtDH0goxPAyM
 vL1D5lZaNUd5HtHnV6yu/P/kYxInlYzICfsid1VLza6LpBIWiULdI8YmLPiY8LFjrR4Y=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oGQpH-0001Z3-GT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jul 2022 20:06:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35475B80D66
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jul 2022 20:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCFA6C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jul 2022 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658865995;
 bh=wmQzutottSG8VAI3NxydyPl5C9pNMSPidEgtl0nSzx8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=o1ztQADA9qVCHfqFNDYL5zpnt1FrU2PByjOHCh+ak6NCyJ4kodlYjBecs5RKKyP0u
 5Rl1lFzgV+Wpi0SEEslXlV+65+gNP3AZ8zCClqx6LkTjsl9v2H3FL4O4WEHQWd0sqy
 M0vaEDEWgS53DJNJTZQV539ApSZHhZU6G3rNdtexURQFYwY21uaxkKAfTfMezDYw/r
 Rp2wL6UeYmCMnnnwLjlzaBM332gleCTNH9YFfG7g8/t8L1CTTCB8vT9JlCvnqgOhXe
 r+3xyXddOLg8cw2AuDlxK5vcWDaahI6QDfbm4bHxBh3HKYsE6lGMjZdV3SGMkOC3K/
 Se7oVpe9RkTSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C0816C433E4; Tue, 26 Jul 2022 20:06:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 26 Jul 2022 20:06:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-216285-202145-WYYjk4S2GX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216285-202145@https.bugzilla.kernel.org/>
References: <bug-216285-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216285 Wenqing
 Liu (wenqingliu0120@gmail.com) changed: What |Removed |Added Summary|KASAN:
 slab-out-of-bounds |KASAN: slab-out-of-bounds |in mutex_lock and NULL |in
 mutex_lock a [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oGQpH-0001Z3-GT
Subject: [f2fs-dev] [Bug 216285] KASAN: slab-out-of-bounds in mutex_lock and
 NULL pointer dereference at fs/f2fs/segment.c: f2fs_update_meta_page() when
 mount a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=216285

Wenqing Liu (wenqingliu0120@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|KASAN: slab-out-of-bounds   |KASAN: slab-out-of-bounds
                   |in mutex_lock and NULL      |in mutex_lock and NULL
                   |pointer deference at        |pointer dereference at
                   |fs/f2fs/segment.c:          |fs/f2fs/segment.c:
                   |f2fs_update_meta_page()     |f2fs_update_meta_page()
                   |when mount a crafted f2fs   |when mount a crafted f2fs
                   |image                       |image

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
