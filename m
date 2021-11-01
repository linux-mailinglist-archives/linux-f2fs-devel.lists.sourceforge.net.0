Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B7441908
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 10:52:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhTzJ-00024K-Vw; Mon, 01 Nov 2021 09:52:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mhTzF-00023m-7j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 09:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihJnrWVmbnRU1dP1rVYZ58rbfkB7ALa4gcgqiTnoMWo=; b=bNT9Yqc9bukBbsl2A1Byi7yW9H
 gOk91t5qz+RCMshXptBrT5vi/WoZMTtI0RYkKmwdGk0y7p0Zb33Gjr4OhLkh7ufVd2l3/T6XXmXth
 CZYgwnNOpgcwUmfRsLK66n26Azr5pEodaesGdDT9E4NzRCR+piL94i2xs6l5Yg53APfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ihJnrWVmbnRU1dP1rVYZ58rbfkB7ALa4gcgqiTnoMWo=; b=X/lmdA3CgpDpEmHpzvedJyjtkv
 zQvkqUJinlPNGyM25fUvh0qs9W2PyUEqzEstspC9WekAg6sdtZ3j5unYB7ctusYdoO94zvOY+DGvZ
 9/HnFi28Fx1qTTvgWxKTm+T5gVUlNv45HYterlFxvhIA7MH+oAC/8H1wikNV712djoKY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhTz7-00B9L2-CY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 09:52:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4054E60187
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Nov 2021 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635759681;
 bh=ihJnrWVmbnRU1dP1rVYZ58rbfkB7ALa4gcgqiTnoMWo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=afYBieQAhU6sFdRgSvFKX21FyV9J4FrVkv5/00z4M7/bNKsUubEJR5iv4FIsPntd2
 5OOcda9LoLAI3GAlSS3U98HL7PmTKhi4V+6XSS9Bj7F9Fqi50y92f6XHdWMybNiobD
 r+hB8sgcgBlSsQg4dq00GO6RrBOBfm62qrbLQKYpy/f3yGqoOZXD385Ko0i+XjeaLk
 w0NgAtSq5cPMRrIiX+4geLyc5qVMaxuoPbetA4vY15MP36WGU2MwVJa6VnH/RHrb+n
 tHqkuz779/6I4FXegr30ddepR2PZ2Lk2l7EHoUnk7pWpYXH41fjURVIVVv6dL414hS
 mE7BJFwrLrYFQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2CA4C60F41; Mon,  1 Nov 2021 09:41:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 01 Nov 2021 09:41:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 793679547@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214895-202145-ze3C7BYhi8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214895-202145@https.bugzilla.kernel.org/>
References: <bug-214895-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=214895 ---
 Comment
 #2 from limbo_wg (793679547@qq.com) --- Thank you for your valuable advice!
 I have listened to your suggestions, and tested the scripts on both kernel
 version 4.19.214 and 4.14.253. Unfort [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mhTz7-00B9L2-CY
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

--- Comment #2 from limbo_wg (793679547@qq.com) ---
Thank you for your valuable advice! I have listened to your suggestions, and
tested the scripts on both kernel version 4.19.214 and 4.14.253. Unfortunately,
this bug still exists, and the kernel crashed in the same place.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
