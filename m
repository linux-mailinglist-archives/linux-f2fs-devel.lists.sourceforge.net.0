Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4BF3DB6C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 12:04:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9PNZ-000253-5Q; Fri, 30 Jul 2021 10:04:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1m9PNQ-00023t-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 10:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xwAMamUyQqlRk8QkM/q3JDu1NiLXU/leLmRi2t6Qug=; b=Vg53lL9R2dJvpPEfKA4LcEsaNY
 /4pSKmUKdDfRGVTKic3x4cLKtDbgemxJ0K/qOBj7f5NyCLBckku+vlqnqFgaHRpq3X24mSrjRK5mb
 69NipXVekYLjRtJ3tA55BkbLIl60tFhic4CoHPSLBxwe/0diNQHZUsHe5zrHEjTWs16k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4xwAMamUyQqlRk8QkM/q3JDu1NiLXU/leLmRi2t6Qug=; b=PAjWIrY/mg4lWamLbwU853SKHF
 DZyy6OOFAba34eargcCsJIpQfni0QN5OlXcJssSl9N80fb5oATTJlc7L7FnYYtLlBvG4glJtOVugo
 6wTfpxWSW/QQslvZvBLkQBHBa4C0RWDuwpB2ufo/p9XZwMJy6DscIs57zmyk6OKoByEg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9PNK-0003Vl-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 10:04:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A67960F12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jul 2021 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627639448;
 bh=4xwAMamUyQqlRk8QkM/q3JDu1NiLXU/leLmRi2t6Qug=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CUAKXSrJAiv1olXMhmqlDfQZN8pKjfwrQrsF01kEmC9vnEYSFNKeLBQ7/mjST7NRh
 J5/Bg4wLhU3Zn+/UBj3x4c6sTGzIGQrL4RJoLzMxspfplWjwxm6jh8RcK87Ds2E+Ie
 gk3G3DrV2uX7LRn1gGgStaAgdV8EyOdJkioV2QMWkHTvS737V2TmM8nPNBfFTf8nsu
 C4v4wktVz+N1hAzvwIi1WeDWzD0m8n/bVDDMRAXZRi5+cPwXw/KfMvAsMYvBMMyz1C
 yo1otDU5n4lxN/dYC4R1aPMfrJjIuLsPMkvyAqpreE8P0LfHsWCgvvpSh3hELUKqu7
 Jod7kKuBdfVXA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2749860EE2; Fri, 30 Jul 2021 10:04:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Jul 2021 10:04:07 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213877-202145-UBScg6te6o@https.bugzilla.kernel.org/>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9PNK-0003Vl-Gj
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

--- Comment #4 from Chao Yu (chao@kernel.org) ---
Sorry, I've fixed that case:

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=misc&id=527a7d6a3e0307ad1b4bcc7811cc2920b2af45c5

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
