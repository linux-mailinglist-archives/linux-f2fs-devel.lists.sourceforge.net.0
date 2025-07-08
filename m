Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903AAFC0B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 04:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ph596sJOuYi0Vmw7yAp/BYjxcmKV2kVg2aIgvtJFuw=; b=hUa8kl7hEZtEf7EBVtrRXMHSuY
	H7xkT6Bvheb7txFQEf0zikvcr1973OpSx3s+J8vDk1iPeJCcDMrCRs0ZsDdjZyBs5+TUebs4eICxk
	yVAa9KZmC7Tm8hAePY+zWXVN8LFet4giCN08gqu8WjKTFHgiZDAwUpPTOvqQu+eIlEnk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYxsV-0003jB-S0;
	Tue, 08 Jul 2025 02:16:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uYxsH-0003iu-NQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 02:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OjaO1elWi4sB2jCn9KEcliCJVW4deC7EpZFBuX/ofZs=; b=WujteIKrm9SW+s0Zi+95LH+rPn
 KQKeraIRjqvqXOuUaerLL1eOCt7qyEaihVFDIJ03r4vO5Gey3IeqJG1T0pyYPsOuRokXvmIOf4nh/
 67qFmygEP5/mgcRg8YMCi+1+d6iWaXBSRc0+6li80QmqEit+v7tV0Y9AQ6AOmLjjpl14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OjaO1elWi4sB2jCn9KEcliCJVW4deC7EpZFBuX/ofZs=; b=iB3HOUJN20vxoAP6wySk+RgdyF
 /GLkOPG2CyEE5yKu9WSCMRRuPYEcsMp46qHsnvuPZ/JQqRbsskhGGjBv01pRRQbjIC2RpDtOTgRFd
 p067gK5XeotWfNog7ZF72RlzOSgeZ0BDPzE+N1FK/zgIT57nMYHDy8w5fpc4RctDoCeY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYxsH-0003C2-8j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 02:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E32D543629
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Jul 2025 02:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBAE5C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Jul 2025 02:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751940955;
 bh=OjaO1elWi4sB2jCn9KEcliCJVW4deC7EpZFBuX/ofZs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FaqwaZZLp6Fbw7ODea57KgFB8r3QqMBVJjm41S8S8qI6s4PVqSS9Z+Mx2XCQSQqby
 kM6FZl0t+E1W+qEwMsabI3Ci9vNQgUjZia6U0GNM0kIjq6RAzKm3Dfh+mdQoHgySFV
 DxOWNtmeYd1e5bc4eMTT5WyVigWdavD6oE8jnHTK/FgpYsAn7gIU0tElel+Swu3AFi
 35O6oqaiu7PCQM8v0lrSZKEskrHXphUcP/YTR9iTUJnSDGe9Ci1H2G5bUSAjhpPNV9
 Rj1jwAhN6L4JSa5nMEAjAkBhEll4RpWax5+mmI4LLDrH7qzJvT+8D5e8aX5j6LDDCa
 UfoNPWMRJUmRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A707EC4160E; Tue,  8 Jul 2025 02:15:55 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 08 Jul 2025 02:15:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hy50.seo@samsung.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220321-202145-jhpuIhFbEq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220321-202145@https.bugzilla.kernel.org/>
References: <bug-220321-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220321 ---
 Comment
 #2 from SEO HOYOUNG (hy50.seo@samsung.com) --- Yes. A problem occurred when
 quota_release_work used a workqueue without WQ_MEM_RECLAIM flag. So I think
 we should use workqueue with WQ_MEM_ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uYxsH-0003C2-8j
Subject: [f2fs-dev] [Bug 220321] F2FS: workqueue: WQ_MEM_RECLAIM
 writeback:wb_workfn is flushing !WQ_MEM_RECLAIM
 events_unbound:quota_release_workfn
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=220321

--- Comment #2 from SEO HOYOUNG (hy50.seo@samsung.com) ---
Yes.
A problem occurred when quota_release_work used a workqueue without
WQ_MEM_RECLAIM flag.
So I think we should use workqueue with WQ_MEM_RECLAIM flag.
The WQ_MEM_RECLAIM flag cannot be added to system_unbound_wq, so how about you
to create a new workqueue for dquot?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
