Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823F5A3A75
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Aug 2022 01:30:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oS5FU-0008D9-AC;
	Sat, 27 Aug 2022 23:29:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oS5FT-0008D2-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 23:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4t371XOjv3k64+DT4AIxykNNXNqq32ykF3z3OJoeO10=; b=VawBn48bAKUttcLckMAmTMbShc
 Qo/h/QMfT+FtjeqdoJeaq4KXtlEVy56HCs//ZQGeT+O0HW6I+4SkwBqIwy0alk6FI+HJo4naQu3SQ
 xVawldYBjhEAOX1wc5luc7MAB9SneOXXgRANM3e/0yAAY2hQuephFAg4sTiLpEcaApbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4t371XOjv3k64+DT4AIxykNNXNqq32ykF3z3OJoeO10=; b=W0KLky9fO6k0/SqUEK/eW4ZlyC
 rqL2VF08slozXztrY4fcdSzeE7+HY0FwkXE1FtFUrnl018MYh8xsGsuLa5fh+ssnl0q6qzv3ulHgc
 Spj0lx8dFMkCry/aPHeDlH0nHvYToucQ2EwVF4GOFm2BZ3YDEkSaOb7GoTPFrmiRrfaE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oS5FI-0004af-Ow for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 23:29:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3602B80A3B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 23:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47D6AC433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661642972;
 bh=e63wJyWdGmyPM02GFVNqViPURxTmSXQS5qe+QHu2sX8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rgfjb2/aSGgMK0ll2luL8e/Y5ohyuiAw7H33Gm19BrGJhh+zdYRGnuJmeOPzag9le
 clIMNRc3uQlEHG7CTYtJtcevvjmWxnmqJFI5TQfuGmJV9OJQ47nVdrdFX+eX3KYeX8
 DgbhrXTgCeTPkWopyXNY5XHEiuVE1XAGVr0m231/hPRXUtWJanpzcxCz0wA4igRf8F
 zCp7FZJ2JWKmDzLTF3s5tCtVjQOy6I5qMjPzu1yxeoTHAAFwWrCmxYjViBuLvdTi9F
 +Y/waq/BDG4CuMNxwvvG9kih23KplxiPCxd2N8OQxHh5yMegZM7I0Bh0ZuwyqMDrYe
 5ASIKJbqhrPuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 29EC3C433E6; Sat, 27 Aug 2022 23:29:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 27 Aug 2022 23:29:31 +0000
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
Message-ID: <bug-216285-202145-RGPu14t9NW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216285-202145@https.bugzilla.kernel.org/>
References: <bug-216285-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216285 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oS5FI-0004af-Ow
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

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Wenqing, thanks for the report.

I've figured out a fixing patch:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09beadf289d6e300553e60d6e76f13c0427ecab3

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
