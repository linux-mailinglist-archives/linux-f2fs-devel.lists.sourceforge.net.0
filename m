Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2718D87799D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 02:46:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjUjm-0005vP-0D;
	Mon, 11 Mar 2024 01:45:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rjUjk-0005vC-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 01:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0FHLrUEMkId+AIZYH9Ola6s04em2D4h6gyyq5kf6HQ4=; b=a6vARSeoEtTbAL2obeqP/mHt+G
 VBYOJobKdF3QLZtiMU2qEptchrFP5XcPuk+Y47L49nDKtiIvONU0AgSyUcpa2p1OTHlaSawWsA92H
 n+3c5+YtmLGnEimk9aDoxi99KfsUNQU050HalZ8E/dAGD+i24Fh/Qls4cuDdQOsbC3Q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0FHLrUEMkId+AIZYH9Ola6s04em2D4h6gyyq5kf6HQ4=; b=P4YRdMdYc0ys8pMc7S15ohphg6
 3Cq9l/llHbDSjx6KQkVZTwZGd/ZudhtvztoZ5DfSUgYPQtBWudGiWfhKwZdj5qiqqfeiaj0JQy77w
 N39urVAExNlKe5gEra0bzxMDmZ1seK06M2KlB1nx3zVpaGfV1xzBa+KIgmH9i0xLyndk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjUjb-0005QE-2b for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 01:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A806360C37
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 01:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5723FC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710121542;
 bh=fwdMUJNAAzlE6K4IPUhjxg84tCFKGnjXDNBzMXPWgZU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kpA2pH3FaK5uPTckxFiJ09BXyozgRd9+wdOhNWDLXn0zFp+hzdL78q9RyncH25dKb
 jvTVhetG/zkfSr99ASqVewXVXrkP+VsMwlHLQhrI7h56N/jH/rGg1zgkUtrUL+jvvq
 ZiSAK8XdaA7ywLlyYyeexYmkIIrdsHeokaYn4Da9a/V7d4kpQRdf4qVLVyvjXQYBxR
 HJoNMxvufM9JzkOqFwkMmXuuvlq46jzdyPXkPXQ25SYdNG8GYPkA3oE9TyDD2fTOje
 wPHLXyasAvrw15wLi610DUt1DQWTvMGew3U6SzPYQ8kKEgNuIqxnCdk/IswEHskUr6
 A7B7bG0sR2p+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3924BC4332E; Mon, 11 Mar 2024 01:45:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 11 Mar 2024 01:45:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qinfd2023@lzu.edu.cn
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218349-202145-cnPOZdSy88@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218349-202145@https.bugzilla.kernel.org/>
References: <bug-218349-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218349 Kane Ch'in
 (qinfd2023@lzu.edu.cn) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |PATCH_ALREADY_AVAILABLE 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjUjb-0005QE-2b
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

Kane Ch'in (qinfd2023@lzu.edu.cn) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #2 from Kane Ch'in (qinfd2023@lzu.edu.cn) ---
That works! Thank you for your efforts.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
