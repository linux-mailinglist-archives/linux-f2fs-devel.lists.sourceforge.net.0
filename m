Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 068BC512F47
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 11:09:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nk092-0007Bx-VR; Thu, 28 Apr 2022 09:09:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nk092-0007Bn-Bc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 09:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EPc86FXCj1mk4bAsIvSgn/CBT1iaNpETQA0tlo0OOYc=; b=ATLCXFXoYDIr6VzrBUst+te9r4
 dEzO4yijguo2Z3QOtlUj0V2onJ+WLNXxhde7kw9evkQ2aaFvo4vtseUmM64v+wJtkFLdP8e9Lqftq
 9piqk8EZ553C7KMdXx1/BLgp/xJ4FkelGJXtTnbP/7v1wSWlP8llI8n9FM7BMWyqkghY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EPc86FXCj1mk4bAsIvSgn/CBT1iaNpETQA0tlo0OOYc=; b=gqxBy9KjxTxKtI55jSzxwF+Opg
 ilmMvtSN3WT4Pc+mkAzXPq61H+3OmKF18N7buS1TdtilfQSiN1bDaqfvxtQp1K6IUhGrCXEGkF8IH
 BLpU1zWgdbeeGikuIwdy91Kv7oOvJJy0yF6w42r/wiLLAQsFsedvVyrwklBMcJTGj/M8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nk090-0000BA-0d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 09:09:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84AABB82919
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 09:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C628C385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651136934;
 bh=64F8d1Gmuy3wizjmhLRtMNzRSxtCjpKWxGPzuSQahwA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hJvDgOmcfpahoOPNtfB6S5TetXcIm8mNVj4vCzulaOl9TIus7pd2Eg0FB3ncsV6H6
 Msc3APYLWtI93r8jrY2s2BgxdAh1JAZJY9Ol3kENR0xD8IJeH9oGqyUtQg8kn+XpwT
 xSsy0bQ5NTY8viH1UC7GI+/luDI1hvspu46Lx5K1PHG0K4tEXIRUUg6N+IpnkLy6DC
 JYPTzm4H7BjrnwICpjNinLj+ZyFjsJn89HjG5yZQ7U7+ky47zSpqHeHnUj9nT7W7eP
 2kIuoKZyMxyZQNltNQKjXsT/SQo1feV4UIpk+DoMlenvc9IYXZ0iA1JnRkV8g6qvOL
 mXQGme22eH4EA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 27AA3C05F98; Thu, 28 Apr 2022 09:08:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Apr 2022 09:08:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215897-202145-PDoPTvWhhj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215897-202145@https.bugzilla.kernel.org/>
References: <bug-215897-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215897 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |RESOLVED CC|
 |chao@kernel.org Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1nk090-0000BA-0d
Subject: [f2fs-dev] [Bug 215897] kernel BUG at fs/f2fs/f2fs.h:2511!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215897

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |chao@kernel.org
         Resolution|---                         |CODE_FIX

--- Comment #2 from Chao Yu (chao@kernel.org) ---
https://lore.kernel.org/linux-f2fs-devel/20220426170602.7431-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
