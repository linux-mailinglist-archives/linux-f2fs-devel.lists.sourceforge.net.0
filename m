Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A973E8A28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 08:19:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDhaQ-00023A-B2; Wed, 11 Aug 2021 06:19:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mDhaO-00022v-NZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 06:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yG8SSrUP/LQOt3SSI9SYchz+BqWSQ2fzhpkId/KSIac=; b=j+v2ywdiNwtQPWPaahCePyD70O
 c9FEjUtP4AUEDa85nA45wOBfACAh/ugLhbLha6imZMX49VkgbM5cBgEw0Blu3F7SlPjs+IpAToGV5
 L29SXEo31ZrKTxrd2e0R79a02ELCqbXvlzV88G67VU1Q5lOdfCTp7hLFfpthl2y1D81E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yG8SSrUP/LQOt3SSI9SYchz+BqWSQ2fzhpkId/KSIac=; b=ijqkbSW12/CIZpMIlaf6/GvLT9
 D909bpo5yWccp+4ZwluNGxIEhunsYkLKKT0GFxA7uTGToQLU38T6k51MLdb0E6+pdua2rBtEjYOU3
 RFR6NYF7noGJ+oh0CM5QN/zK8ArM493VxXGofWDA8WEUF+48r0uO8A5EQeyoFOQ8iBMc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDhaL-002ffa-QR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 06:19:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 0317460F46
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Aug 2021 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628662761;
 bh=KynxJ1UQ7TacXAGbI79y7Z9qprXK8qQsKfRtzjxZMcI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nuuSdd+6lUBmKs9fOmYULo76Am/dV4ZfIsZvFh2cyWJ//92pnHpX646Qx76dIjrsq
 5AJixqU7tPjGBsHZmPVCQFSfVfosWGJKKjtqi/jKdG57IdH4BQLDAzdzpOCcvB8zOW
 kOjtHfRamOqMklpjw0RelDaOSxi9PXFodxZV4ukznymnn5hrcU3iYqoDNUyDAzSCjj
 Gdxe1HfCCC9iitupnr6/5DTNomAHCEiNaRaQfuReNV/sW4CO6p81acM0ozreb8Igrx
 dIsTdXNz2spypjLCt3yCj0bWj7G/TkaHzULBiT2ikFupJNDB/3SSH/9/VFU5BvceRK
 Ic0m/w4KVQUvw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E730260ED7; Wed, 11 Aug 2021 06:19:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 11 Aug 2021 06:19:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@ixit.cz
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206057-202145-CrKFqrtXNT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206057-202145@https.bugzilla.kernel.org/>
References: <bug-206057-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ixit.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDhaL-002ffa-QR
Subject: [f2fs-dev] [Bug 206057] 5.5.0-rc2-next: f2fs is extremely slow,
 with ext4 system works well
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

https://bugzilla.kernel.org/show_bug.cgi?id=206057

David Heidelberg (okias) (david@ixit.cz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #10 from David Heidelberg (okias) (david@ixit.cz) ---
Currently Nexus 7 2012 works on F2FS well, closing.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
