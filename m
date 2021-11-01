Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDA4419B7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 11:19:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhUPI-0006qj-Bs; Mon, 01 Nov 2021 10:19:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mhUPH-0006qY-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 10:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RtwgvVgP6Bo2fD/CsKQ2PuUYoTz5V4pyshM6aam66v4=; b=Z7RZqao7WqzgZYaKE94vOlYy4W
 QIDlgUiQb88aiKkTnwCi/ETuJH2XsqwswJIRvxp18lPd4H+B1KnjWlRjyi6xLS3o/GssC9oCuwfu2
 ZnPkBCiKYd0UE3o//UQiRRLQhjLCia3emHqWz7/2WkCvB7QaalAuR/+unBQOURvhXg+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RtwgvVgP6Bo2fD/CsKQ2PuUYoTz5V4pyshM6aam66v4=; b=mLkrqBD86XM5OgKseWMt/GvPSm
 SXkP6dLDbsreHlSlceVoy+Ag6m5HpmmH8gewAuhw59oxDH4sRy73JqK3JVjCCHV99dpVO3RoEm38p
 +0ILk7btc+haXYa76G84Gx1TFw/sPLeCz/OmqTqtuBT0AqgWwPoowwtDNKZG6UhwnmkI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mhUJS-0001UD-4B
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 10:19:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 5191960FD9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Nov 2021 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635760914;
 bh=XIQZD12xTVxhSCzU4hEHqtwc8DxwMuyjG49pJjU3VS4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=R/J4AmKbLpkvRXGmVWj0MmAqSC/sra2LSQGQ5bwXelAqJPv6h6VrGBpNdu8Rf1WrP
 6uyTX9BdS2C5zO/N6h5hSUX2bdAtO9qKMKZ2eoiNBu+SJKvhdnIakY9H503IU8/sHk
 T/l/R5zDMzOgYGnhi2mrkSPgnFp+Z1By4epFLnLgbw+U3H1hBuiNFnnYisY6IY8Y1Y
 I4vJs+jR2mBIE8ugVWONqpzGLDjm3bYFaJ2ja9THOlmZI5VM3AW234wZBDPQ5KOkqd
 XWtp5E05mxK6nzomUD5dNbA0NiMNpC3CsPntQ4pCnuNWAW4LoQHgdyUrTUnCL58gDL
 gKjtlRnNXKyFw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3A99860F25; Mon,  1 Nov 2021 10:01:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 01 Nov 2021 10:01:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214895-202145-59ViNWwHBQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214895-202145@https.bugzilla.kernel.org/>
References: <bug-214895-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Headers-End: 1mhUJS-0001UD-4B
Subject: [f2fs-dev] [Bug 214895] F2FS BUG: KASAN: stack-out-of-bounds in
 d_shrink_add+0x17f/0x1c0
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

https://bugzilla.kernel.org/show_bug.cgi?id=214895

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chao@kernel.org

--- Comment #3 from Chao Yu (chao@kernel.org) ---
I can see the KASAN related bug occurs in d_shrink_add(), the callpath doesn't
come from f2fs, it doesn't look like a f2fs bug?

BUG: KASAN: stack-out-of-bounds in d_shrink_add+0x17f/0x1c0

BTW, could you please try last 5.15 kernel?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
