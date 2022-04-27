Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6351149E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 12:02:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njeUe-0000AI-LG; Wed, 27 Apr 2022 10:01:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njeUd-0000A6-PU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 10:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N7Sy5T4U3IvX/1/IXsSTIPg3vKUghMCvHkXI0+n5RlI=; b=LRot/XjKAmuHEiNFnsn16cIj9x
 eUH5Y2RKffyPwukADyJgj6oTWVFa66p7+UOfsHuF301x6JRQ4oY0VulgVDU0M8l3X9mgZVlcemrQO
 0ksFTCcyo+teMnUvxlbe6XNhdh6G8frx+WTm7JqrCrySgPcLPZJOS1cV7qih63UEnaEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N7Sy5T4U3IvX/1/IXsSTIPg3vKUghMCvHkXI0+n5RlI=; b=QTnxM2IKGwWBcTRApFYNCo4o0m
 cMt81hkbQLgBaDEpEurLlNwdkENzuyKK1jRlnwdwYB33n+R+cy4hufAcc2zmVR0Soza8wqU4fG+kZ
 qL97ldQIGBmYJuTPA7oIU2f9khla5HX98CVi7wGz6kk5sRjhFeHO3TPw6we1lQ7U75nI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njeUZ-00061L-In
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 10:01:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0A0F61D27
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 10:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D732C385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651053705;
 bh=/eJz8DE9qgtC0yUV76F3rD61Dpg5ZiSEIiR6+KoPS7o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S9Y7GBgtJT9Nzn2ZO8paTU0om9qMCRG51QnNgxCGkTnIUXnpYOuvV38zV3TMoDiLD
 zI8B6oYKdrT8Y3qUjXIL+wEUKP+dk5VeuWxIfNScSW5wQSJzJcS+3B0Fwiy5UtG9wJ
 vof7mHLo2Fpm3L79f69OHZyrGp57qie+7v7zyX+D7w3ztAS+TtRjWuh5/bzeTN2HUB
 FmZCc9ZcyOYu/nxS7dFzVOMZbgvTk6fEueNdDfyVdknw4+m8Ag0iDQUTNWyL//Xbgx
 S8462wzZiQcK4HOUkJMrY5kMs4s0OgnPOL3WzYuuRAzA0KVjKQOnJauYe8DBeMiTrE
 Pvp6Q/8zYFbsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 45CD6C05FCE; Wed, 27 Apr 2022 10:01:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 10:01:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215893-202145-yWDeFGRjo0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215893-202145@https.bugzilla.kernel.org/>
References: <bug-215893-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215893 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njeUZ-00061L-In
Subject: [f2fs-dev] [Bug 215893] F2FS Bug at fs/f2fs/checkpoint.c:192
 f2fs_is_valid_blkaddr+0xbf5/0xe50
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

https://bugzilla.kernel.org/show_bug.cgi?id=215893

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
This is just warning, now we have tried to use dump_stack() to instead
WARN_ON() with below change:

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=6cc4dd68f6c4d32ec8f60b45e0282dd3bae4b4de

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
