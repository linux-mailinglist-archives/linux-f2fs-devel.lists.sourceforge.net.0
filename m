Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F03618509
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 17:44:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqdKo-0001gF-V8;
	Thu, 03 Nov 2022 16:44:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oqdKn-0001g9-Ae
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 16:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qQGPQCnQDWgA7LX7dXJQJTNLovxgidGFQz3Hg/T5h7w=; b=f5NeyZ3EVNeigWFYMR267zfK4U
 63nh0P+1wyyPHeKxDDVBVKQY0aYpLYcM8An2BA/1z7t4TuSUgXe8XXYHF44sYsFDbIe0s3gHlqVJK
 zxsemZ7BXO07r9LkIwOXzcRc82ozg16NeESmuyM27t35iNOYYec+QVke44MrH+g5NIs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qQGPQCnQDWgA7LX7dXJQJTNLovxgidGFQz3Hg/T5h7w=; b=jNPl8WdlmLqC1Zev9dIUWogLMa
 YIpzsgPqr9qoxtPlk+kU5blqz2Dm83lK1CeZ3m4f9+2WuG++vOaN92y0q91uJMSOdPt4HWktFOcyR
 vnfRHyFpF+JAqxb9DRhwYFnjqMxgyxxOz1541mrRm9VJExpVEqy+AVJKFDT0mjA9kuGg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqdKl-0002uv-EW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 16:44:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF3C161F6D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Nov 2022 16:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59151C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Nov 2022 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667493885;
 bh=qQGPQCnQDWgA7LX7dXJQJTNLovxgidGFQz3Hg/T5h7w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=abCuhKpPP8mKue6blo2XYLDwxN/RncheLYVyBvr+KttRuLonpPwhFJQr0Iu3HKjXK
 sJhlomF0Ryn+DILaoHkQPR7u6CBLczG0ZnVPACHjnf7Jlm1rH2XGv6+NV5fw29kPEr
 1vw52TR8fFG+DKU/8szq3Abxz1eY4skOedffRQ2Qm66OZpEEI3IgZLl3EiyNHJwppD
 FWtyh4gsq5T7gH0P1uNPZCnCbLT7rGrcjUrzJkX2NqULKuHQCvtjOwJiz2Za+LS1e5
 FNCf8GSe2D7Z6k2bbK3O5wNFHottnWcMkHjS0T4bSxCqUqWgucguqIuOC30hqGamwF
 QWNPx1meO/+ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 307BDC433E4; Thu,  3 Nov 2022 16:44:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 03 Nov 2022 16:44:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rootkit85@yahoo.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-E0NoFxiCq5@https.bugzilla.kernel.org/>
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
 #74 from Matteo Croce (rootkit85@yahoo.it) --- Hi all, The only way to find
 where the issue is, is to bisect from the latest working kernel to the first
 non working one 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oqdKl-0002uv-EW
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

--- Comment #74 from Matteo Croce (rootkit85@yahoo.it) ---
Hi all,

The only way to find where the issue is, is to bisect from the latest working
kernel to the first non working one

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
