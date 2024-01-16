Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0082F087
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 15:25:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPkNm-0004Il-0k;
	Tue, 16 Jan 2024 14:25:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rPkNk-0004If-1S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FR7MdUpW2vLZfOLxz7bJ6+fe6I6EEA6LqKX0tgQIM4g=; b=hQGSEnIuK+ZC5+JS6zJGevPQuS
 C/sWqx2KtJ0EFl4AcR6DIh8sJwQJYFlwG136zLL/E3mMR8A6FZyOGNh7tm4D39yuFaWu/5v0Yc4aP
 GNe3XdLmgQlbxchTTAwuoL4nbFSzCqm2DY91M9egceJg9yjFLy8mfZLkDW7Hm86SmGw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FR7MdUpW2vLZfOLxz7bJ6+fe6I6EEA6LqKX0tgQIM4g=; b=Zoic27tJkCfTHyc+9NARcIWp7m
 QiXSK+tgK6ZfZvSjzxbChMze0P2hEDSf5whDZXLQENlt1oHX2kyZSQaS6Q3skss2pSmFDgZPMkmX+
 6paEyBK7VsJjsawIQq5owW9fwbLXRCMDyy35Sl+4z2xHPbAPJPjrYygFZZCcAmgMkKq0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rPkNi-0001om-LA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32865CE19B3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 14:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1919C43390
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705415126;
 bh=BjdBDYogHS4TSH1VftptHUqeo+wKE6zHV+rrFNTRVDk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oxYoz20F8J9h7WVvaanfFMTHHhZevMenCSZUFN7OEOQcRYRl6adGnG3ayXmDqE7Aj
 DZaf2q6+H4P+Q7ZV4rfZy/OzG1/oJCXElx+qTes4OJ0DKp+D5HIGRU4hhIgiCDAtB1
 NI1Kv89PDFsSspnWxB4xm3TLW58o3hQEkEHYbKf7JHl1680VeaEOp/6lk6el6nQhIQ
 Y6R9wk8NOQQ/57vpMttp6e6CrHgeSOI79yWBoGzk9XVjP6D0lK969Ag4WOjJyoB2Qv
 Cf+azAoi9mCRBjo1h5PCpjvkN1IBof7mF2Jfkcc5jVGg3gY2mbPYBHWD3hzM/kvwrC
 2/m2jEdDu2yyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8EAE1C53BCD; Tue, 16 Jan 2024 14:25:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 16 Jan 2024 14:25:26 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-218349-202145-14p84pDOs8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218349-202145@https.bugzilla.kernel.org/>
References: <bug-218349-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=218349 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rPkNi-0001om-LA
Subject: [f2fs-dev] [Bug 218349] f2fs partitions corrupted during power
 failures and cannot be fixed with fsck.
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

https://bugzilla.kernel.org/show_bug.cgi?id=218349

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Can you please try below patch?

https://git.kernel.org/pub/scm/linux/kernel/git/chao/f2fs-tools.git/commit/?h=dev-test&id=20678a083d967948f3eeac6a61c17f691addaccd

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
