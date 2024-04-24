Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0898B092F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 14:22:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbe7-0003br-Hh;
	Wed, 24 Apr 2024 12:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rzbdt-0003Z6-4U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=37cYP9bzsL7g5HQd46B67HLR1Q8B3tPM/GhneuRdFok=; b=KPJEwaw1o+l24ZUoJheRgeDKqT
 OuDiMA9lzY6hnXGW+TzwvFtvhCN8oIJ1Z6h8ry6ql0291EFowrNSGwegpAJLCl/QGxbX/SHK1Qlug
 vFG8N406oXF94rL04d6cIdtwkrclU834ASSxY7velXjyl8KLJxvyGzqA5BRkQy4FiRPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=37cYP9bzsL7g5HQd46B67HLR1Q8B3tPM/GhneuRdFok=; b=Zvp7ggVk01ePasB18Z3SRfXdo/
 zbK9gaI7DWd5LB94WeDukIIMvTUGcilKBqGqcUCAEiZMrKVX+zGZaY+T6nzGpk3SAUr5NaRoKTTtL
 85tRDqA78lQh1XQBpsdwgvEhG4yfpzhFe6Iwk2Sk7FshTrUTneGARo84vCowJuIT8eGA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbds-0001K5-8s for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74C9161A6A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 12:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2049EC32782
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713961338;
 bh=/ah8/gkIhP6W3yjhCvdTr4UHv4wH1/Q3r5AxPYRv0t0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QyXwLn0DJyGyo5AgFnsrgPvFGGyUctzI0C2V7+8B2hvzczh/IxQoJ8QJJlR8J9zOq
 +y23EuUC//eAaLiDbJleOv3L082vIPYbassxUonDFdHqaGTpAqmu3f97iY9rivjsCL
 dSJErmd7vo7I+Ry+IWSVH2e6kIKF7fhIoS8C0Yfjz86p8nFYbVfwv7RRO9BMcepoYi
 J+Z9uJfOBweHHeXYzLGROOsipc6USDNVo/JqKYtBXM2T353vbfbDSQi4TDl8R5Keo6
 sgjatPPpMhdQ0hNBJ74Ciuq7BVSIWDhegUle49S/cyNyh+zT2EeJxlfth5vC7yq8xG
 yKNatuxraxL8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 04BFFC433E2; Wed, 24 Apr 2024 12:22:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Apr 2024 12:22:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218770-202145-dHDBzc6tKM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218770-202145@https.bugzilla.kernel.org/>
References: <bug-218770-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218770 Artem S.
 Tashkinov (aros@gmx.com) changed: What |Removed |Added Status|NEW |RESOLVED
 Resolution|--- |ANSWERED 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzbds-0001K5-8s
Subject: [f2fs-dev] [Bug 218770] fsck seems unable to solve corruption
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

https://bugzilla.kernel.org/show_bug.cgi?id=218770

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
> Even running fsck several times always finds problems.

This looks like a f2fs fsck issue, not the kernel issue.

Please post here:

https://github.com/jaegeuk/f2fs-tools

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
