Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505A564865
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Jul 2022 17:29:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o81Xd-0004bj-7S; Sun, 03 Jul 2022 15:29:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o81XU-0004aw-6y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 03 Jul 2022 15:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pg0PFT/MXXz2zAW/nkxLWdlbtd/md6E1gJphvMTXEo4=; b=IRR/HWNIZNT27wQpFcs+2+eimm
 IDo5lIv74D54F3fe5Qq98qwVlMMFheXTBQUcoZR5HFSaKk4wV5MYnGfg62GXPP+K8ZtbKELFoN/B2
 rjM6jCEqakYgeaKZIFXRD5kFpYcYSSofqzWFRBhnbIW2iQ3pTwcFO63Zgbse+w4k6rGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pg0PFT/MXXz2zAW/nkxLWdlbtd/md6E1gJphvMTXEo4=; b=kLmqvnkyx+7k9liNMPJrPqlUSg
 zTuGbQjhAcc8kHqlNfAuegxChV8zXKi+EwjCMt0xSFpKHP7XCUmVGAWtU078KR1hgIkMD26RNlmNp
 JmXItzaQ0i8O5E0ACSDM9pXgZ1Z6Qg6Z8p3ZFh9t0eg3OTEu6Hud29rViKMkBx26PCuc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o81XS-005wgt-8s
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 03 Jul 2022 15:29:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3DACB80B71
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  3 Jul 2022 15:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2AEC341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  3 Jul 2022 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656862158;
 bh=Pg0PFT/MXXz2zAW/nkxLWdlbtd/md6E1gJphvMTXEo4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AKD7tuR4/ksHyRK+zWfbcZT1RnimB88l5EtN+nFmIuahQJINWfAfu4eH408ecq7iu
 q9t/Kd/+g36xAPvHreU9C2A/i/FLsyOk85LNF0yiVK/sQtMxlk9YL1m/6nXwGLq2kv
 pamrFGuviEPxHWJo4sAn8vQr02IrWOQP7lBr4hiPMkXTOQoqWieXwrHidWBbRZwppt
 +9xxi15j4nRpcjDuWR84rsgmn9Rq9OjDk5hamxjn92AjFjXcwpmniPLEFd/RyL33N4
 qJ3YqzGssHXmYvsB0Pv9QTOEg4u3YK08AAwPmAmaSI+CW2Mf2xFRH5DGDJbux9MYPh
 ai5FcVZGLAQhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8F0CEC05FD5; Sun,  3 Jul 2022 15:29:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 03 Jul 2022 15:29:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ghtm2@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216162-202145-qF6rphkm67@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216162-202145@https.bugzilla.kernel.org/>
References: <bug-216162-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216162 ---
 Comment
 #4 from ghtm2@protonmail.com --- I did compile and run f2fs-tools-git just
 now, it doesn't do anything unfortunately. The mentioned patch is in the
 stable tree as of 5.18.8 and doesn't fix this problem either. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o81XS-005wgt-8s
Subject: [f2fs-dev] [Bug 216162] F2FS filesystem with compression broken
 after kernel version 5.18.1
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

https://bugzilla.kernel.org/show_bug.cgi?id=216162

--- Comment #4 from ghtm2@protonmail.com ---
I did compile and run f2fs-tools-git just now, it doesn't do anything
unfortunately.

The mentioned patch is in the stable tree as of 5.18.8 and doesn't fix this
problem either.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
