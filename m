Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E943D7AD5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 18:22:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8Pqd-0006uK-RF; Tue, 27 Jul 2021 16:22:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1m8Pqc-0006uE-Gy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 16:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fS+MskyOHRCLf0R0oFYZaL6+w10V833hKF5obZAnuEo=; b=hRKUg5x66G6RfKEDNIRHIxkfAk
 SkgV/ErBILe2j14r6qMJuOle0sBgV3tx83NSyYcPW+OF1XlTnGQRArlku7/KzHO3TcjHTcN/kG/1J
 Z/HD4WTq3tcBMobUzCnXGfvfyrSJsTnv4olxN6XIOraQQ2x9IL6PBcY3ASB5ui0p3CaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fS+MskyOHRCLf0R0oFYZaL6+w10V833hKF5obZAnuEo=; b=IMbRbEBNol6vPatQopqbyoKfy0
 nldrI0ErXewP1M42tVOoNX4txY65rGJs9OhgfF1d+6iC53ck0mj1o3LmgEE6kX8Y/BwtfI6z1HzUa
 ls/myavYmwOlyzbt+rbAo8vYeFoKvCmkfiA3NhedGy4nCEKK5mKfZVhBi9G01OBhuXS4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8PqW-004OQa-7g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 16:22:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id E0C4B61B93
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jul 2021 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627402929;
 bh=l90EQHjjmdNm8AFUf4uBb9TxdhAE/KK5Wmo4nKsJaks=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TP+J5hPjLd4dOZ3/GVPQ+ebUKKHA/cAPESyVO2YtY8EOtBbxunw4Lso8cFX/srv2R
 sV7Pzn2IKioHUzWh4NwDN46r2YiAzFfU0ymvAkxMlxXxVvSs4R6y7XAt+S/4V/h/PA
 n1wW/CHtnRyfNzwM6b8L3V70xvNyPOPkN9pGJgoR8th+fQpxza/K4OSTB+uP7+90cF
 CJ2U911rlL69DJLzqZKTfAFFVY8wgtY3sDOenhYSWui0A6LfmQhp1Pg5rGx/T6qVy8
 ZWOrjRnnsjmV8FOZUHELLzDRkw/Oo6vINfKhCq2KHLuFU3GY0Nx5sCNzF6bZ8eU8bJ
 YEM1/5Tll/68w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CF01360EB7; Tue, 27 Jul 2021 16:22:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 27 Jul 2021 16:22:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-213877-202145-UNoU7WE4rD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213877-202145@https.bugzilla.kernel.org/>
References: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8PqW-004OQa-7g
Subject: [f2fs-dev] [Bug 213877] Mount multiple SMR block devices exceed
 certain number cause system non-response
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

https://bugzilla.kernel.org/show_bug.cgi?id=213877

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Could you please apply below patch, and try nosmall_discard option during
mount(), it expects that memory cost will decrease.

*Please note that*, I haven't do any test w/ this patch now, so please backup
your data before your test.

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=misc&id=5dba79cc25c3c902942c2f68a6e2546586c65f96

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
