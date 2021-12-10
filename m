Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 423964702F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 15:37:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvh1Q-00044h-Ie; Fri, 10 Dec 2021 14:37:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mvh1O-00044U-LA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0dZo8iL4p4lp0i1nSsb9tZnmjZtTWCV9cthhFnDscs=; b=IxIHjrO6zjpUhA7EjSgw7AXsjf
 i4Ou3kC4pBkFPAqimXG6yTUWUkqCDO/Hc63vwlyjP1H46Xfst0+XN7+0PHtlWqv/EsZqyzM37ZKAP
 8NoTe+BpXORVr7hsoET8YJqSMuUwPFGYUP+qmYjPcedWpIFZFuShF2u0BLuF5fIbc9JE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A0dZo8iL4p4lp0i1nSsb9tZnmjZtTWCV9cthhFnDscs=; b=UPA61vPfGLFWY8eu8DTpzraJLd
 cWSkIz4bkXeQ2asuTM/OnwTqpbwpxW+SyhXtxF9WGhg6dMUpkItkL2f2ZSQ7/1HkIq5FOXIZd78Yx
 7aQv2gFh1Je9h8KHaKnBCg5XSS2+VKsPKaCtCCR2pCiri4xo8oRPr69ZPMy2babm3dpY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvh1N-0007aR-VU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:37:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76DFCB8282F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3467FC00446
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639147023;
 bh=ssGVE7JqUgIIL67Qgl8ve0BnN5ekry2q2CwC9bnEc7s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tSy4JyVtyuOtmGcl9dhZpFd6PRRUvo5tgYMQJJm71+JDWcwnMz1kGdsaPddQUCrKq
 zhSmtOBhWbMCpZdAc8eF/hTv/1Td50hP9vsrZVf8A+eK1eWdib69Xlacsr+b8gwazZ
 t3P2WjMWI4v2QcW7G+M/55gnRuSPNiS1W7UOwpPg5LnLpX9JQP5oPM/waa+VY/mjpF
 TojkFa38JzjCmRreSJnsDceY+OQ+zelwHNKz0l2gtitBzEUbQcy1A9LFYhDwLWhQx3
 XfmE5kpoMivDBlSFSniaa0MULI/b00cTYFfhacTQ3wYlfGIvggS6zf3KD4My93YVWM
 Sp/Jpjc2Xxwtg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 13FEE60F38; Fri, 10 Dec 2021 14:37:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Dec 2021 14:37:02 +0000
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
Message-ID: <bug-215295-202145-3dKD1yEG0a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215295-202145@https.bugzilla.kernel.org/>
References: <bug-215295-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215295 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvh1N-0007aR-VU
Subject: [f2fs-dev] [Bug 215295] F2FS: BUG: KASAN: slab-out-of-bounds in
 reset_curseg+0x5ac/0x5e0 [f2fs]
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

https://bugzilla.kernel.org/show_bug.cgi?id=215295

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Hi, thanks for the report

The root cause is f2fs runs out-of-space, and then new_curseg returns an
invalid
segno (bug 215293), result in we access memory out-of-bound in reset_curseg()
-> __mark_sit_entry_dirty() (bug 215295).

bug 215295 and bug 215293 are the same issue, let's close current one, and only
track 215293.

Let me know if you have any concern.

Thanks,

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
