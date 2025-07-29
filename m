Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD0B14608
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 03:57:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev7fp/F0Z4xZ4lWE+fabgNL6Afy35dupW+u05+T513E=; b=gUMMFiclm5vJH1cUAym1P2jIRo
	ZR9TcoZO7PYH7MK3+aDlETrTEnD993l54JfFsvrlF3vKLVrxe4oAMi0Vt+NdBhPXLoBFwUKHap5fj
	aVHVUO3LvUTiz8lQBkzMrePQXr3pn1CuM9/sZZ7dc0/0Y77fmp8G+wswE1bsEPgNhvUc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugZaq-0003bX-S2;
	Tue, 29 Jul 2025 01:57:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1ugZaq-0003bR-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 01:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9GomTzObmvDV7VVJ7EeUxjxn8pw7UwzfTKE6jpmGFFg=; b=FLHzispMkAJ6L2CQ0dUBHG0mdj
 33km+goNk4UOYoO4muiNoO2bszkJm6eToq7+aYl5SH42Vd99LJCJFIQaGRRR3GH/fT6PD2KiBRhp3
 hydv2mpbi5uEqGxs+PutUZ3YylvTcFTvat0w8piNfk6omq2sCJ3Ycaeb2lIY61IrUXxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9GomTzObmvDV7VVJ7EeUxjxn8pw7UwzfTKE6jpmGFFg=; b=nLI7jYrFvQ+pSFKEgU0fliZL9X
 15E5iv7QM/murvzm0nqse+K6W4p5I/IyfHQxq0zjET9voV3zs4C8qHn1PXci2AKVnRQEj0oSW0pO2
 q5zBZ49HXf3DjWMqaP0saHsclx/PIfgIyQR2ukiW00QvNtSIkKM7RCeYvrgb9cIlA/sw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugZap-0008B0-ET for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 01:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A489601EC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Jul 2025 01:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DD7BC4CEEF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Jul 2025 01:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753754241;
 bh=bYm3cRWq9wdnQ16EqCwWTvsdPEsfmHJeapFDZN5aXf4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z9W4ITjcEMlCNOufADnovjtir2FNX7YzbNFVGaSHIakUa/JcUFL27e1N9aLng3quC
 /6CMZ0Z/SL4FATFX+RaTShgvyDWFqBFN+W2wykO8EVG9/HP6j0TuXFoehTdsUPZPzX
 Ukc3MBMk/QGf4CKF2titAF+rnC4PEWOew6OVKR8FxrvLsxuwOIEzj5smAT6yet2lwh
 vzkpFbHfHtZldoWcXnmnmLqzb2GiBkwDSsanZhMWzY6tERHhuFgKX0zrI9PSNcTdDp
 wOfQtqs9JMogIBI2DkthwKDTnjwWqRi0BLRVRJREh3ULh+FDlaHkWXBNDD6LDbV1Og
 4m4UrbQ1ow5UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F23DC3279F; Tue, 29 Jul 2025 01:57:21 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 29 Jul 2025 01:57:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: devfs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hy50.seo@samsung.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-220321-202145-4pfVgl07Jo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220321-202145@https.bugzilla.kernel.org/>
References: <bug-220321-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220321 SEO
 HOYOUNG
 (hy50.seo@samsung.com) changed: What |Removed |Added Component|f2fs |devfs
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugZap-0008B0-ET
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

SEO HOYOUNG (hy50.seo@samsung.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|f2fs                        |devfs

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
