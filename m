Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C053BB83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jun 2022 17:21:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwme3-0004hJ-22; Thu, 02 Jun 2022 15:21:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwme1-0004h8-Lc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 15:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHDR/7ymZlRY3LME3tBfY3dURbSVVYute+0mYFE/LRw=; b=MbT9m3WQ8nLOVd/hptpx/xgvG4
 X4ZBaT9G3GSCieFw4dgb4u4+nY3mMlDF3BZN6uuWa5AsYM2r+7u09YCOhEjwjLVqAcNIuA00x+5FI
 w5hVJC2ZeUggJbssJ+55nzI3nRfKom1C+LEuoXoVGFb10Ew5HeuSlBtPaZfQG8a8v1qw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wHDR/7ymZlRY3LME3tBfY3dURbSVVYute+0mYFE/LRw=; b=EHkTM0VYNRRdLV/b0NQDn1FQVf
 yWaIW6veIcawKyQ2zv2w8L1M2B+ZfL1utbwpupp4cuR1Sh14Yvr2xcxI5/w5+gvEvUbKhbSLdc7O6
 l2sPvZoCAzqSLenJkdLlw6TpoEEIa0Gdx+VeJbhp62t+kL5VxVqcJvYRZQiK9+X7YQko=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwme0-0001F2-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 15:21:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C811C60FCE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jun 2022 15:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36C22C34119
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jun 2022 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654183297;
 bh=wHDR/7ymZlRY3LME3tBfY3dURbSVVYute+0mYFE/LRw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CQuWSp21IU4lmwWI1ZlWb39S/y/+mrv31ZNz8ae7N5rUyi9FregO6bFi7K27uCplM
 fZB32a7bAa5rjMh35+DYMMqWMzAHEOwYQ5rkfes8QnlWM58qfb/0KZ1uYzRc9Had5F
 hkPj7hn0FNeGB5GdB0AMjGsQqT0TUajgQ9MIKoEYXuDPsibDzYe3vx8Gyw5SEnW3aN
 IhJmJFMTXTpA4bMNlCc5C/5OufTMcC0HuGezRvqysDKkjr/zIAel2zEBKfd8el5OLl
 BkMm3vS8zZA6zd7p6AIEZJTQFTJF/7aUJOlA2BVvCEA4UwJelV7b0RozhlkIvnl8vx
 NTeEKw7+q4T8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 229CAC05FD5; Thu,  2 Jun 2022 15:21:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 02 Jun 2022 15:21:36 +0000
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
Message-ID: <bug-216050-202145-VbETx66UwB@https.bugzilla.kernel.org/>
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
 #17 from Jaegeuk Kim (jaegeuk@kernel.org) --- I think a quick WA would be
 remounting dm-2 with background_gc=off. By the way, may I ask two things:
 1) can we get the dm-2 image? 2) can you specify the kernel hash tag of the
 latest f2fs patch in the kernel? Or,
 can you build the kernel with some debugging messages [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwme0-0001F2-Fx
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

--- Comment #17 from Jaegeuk Kim (jaegeuk@kernel.org) ---
I think a quick WA would be remounting dm-2 with background_gc=off.

By the way, may I ask two things: 1) can we get the dm-2 image? 2) can you
specify the kernel hash tag of the latest f2fs patch in the kernel? Or, can you
build the kernel with some debugging messages?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
