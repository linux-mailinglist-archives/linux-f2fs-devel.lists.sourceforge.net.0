Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E0860BE14
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 01:01:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on6RU-0004zI-GB;
	Mon, 24 Oct 2022 23:01:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1on6RT-0004zC-7K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 23:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s0XLF94ufe2brz0qb+vB8HaaLf4qUW2pOZ0vwlkX+QQ=; b=Nj2BLYY9nNUeRF+WXFJTjQs5Sg
 djGaGB9jhA6tPyeAXMHM7q7EeJzjU72zM/D+V9qLENXXYz4TF1sN2CXafFBHNx0ttYzvSwkABXfgI
 As4Tn1bWoS7dcevbMlX/jn+qOIVAvgFBrRmlX1SegP+HvAvHDGtGjWkFNy7S9gl5CK8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s0XLF94ufe2brz0qb+vB8HaaLf4qUW2pOZ0vwlkX+QQ=; b=kO7O+LFOhhwhm7qJ2Tmy0JrYnt
 kvooWV5VjXoFu22lUxxnw4cNl9f5lDjrw7N9Hr7nlpA0yLIu4YcTzSPhksGLvw+bHK/VRL2UPA5SL
 HXPcz09HMS4x6SwELix9YzT7/rMJvb6dWTuzm2Hkl5ZwTfklHLS1o1z/+YCZcLw4s0Ds=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on6RS-0007m6-If for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 23:01:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 29D9361625
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Oct 2022 23:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AF89C43143
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Oct 2022 23:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666652464;
 bh=w8pbFoH67PnFPbfl1zovzzaA2B81OmDROH445Ivjmac=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=inpBAdzw3VB2o0N0+D1dbnm80rAtaK3mRriqGqOAHrEvoAPpGX8lGVanaBVEyAgCf
 OWGFr7If3ccTCkHfJloKRXAFnNgUC8JKmDULhtbzqZJbNIynTQYsH4oZg148YUBFM4
 cF0hIpCcdOXJYRlYXjtoOBRtkWrvl+lwCJX9eCqOTNbx3rZMUbry2AUyjeKgX8/QtO
 VwwJAU76rRghLw/meT64SN7TdSZOrQrGpjMc/uKMnmCAvGSx7cPf5YqA3vLJv6745Y
 t9AGx8+8vT/hriy07puTnUdHyP1eH2snHzEdOOoIGOieBE6EITvMMYJAcnO/f3mMuf
 WUqXmnCPPoYbg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3E3BBC433E6; Mon, 24 Oct 2022 23:01:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 24 Oct 2022 23:01:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-jK6vtpxfox@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #67 from Yuriy Garin (yuriy.garin@gmail.com) --- Yes, sadly confirming, this
 bug happens on 6.0.2-arch1-1: [Mon Oct 24 15:57:09 2022] INFO: task
 f2fs_ckpt-259:3:273
 blocked for more than 122 seconds. [Mon Oct 24 15:57:09 2022] Not tainted
 6.0.2-arch1-1 #1 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on6RS-0007m6-If
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

--- Comment #67 from Yuriy Garin (yuriy.garin@gmail.com) ---
Yes, sadly confirming, this bug happens on 6.0.2-arch1-1:

[Mon Oct 24 15:57:09 2022] INFO: task f2fs_ckpt-259:3:273 blocked for more than
122 seconds.
[Mon Oct 24 15:57:09 2022]       Not tainted 6.0.2-arch1-1 #1

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
