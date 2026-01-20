Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A1D3C348
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 10:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IpaZw/8FGwjoLp+pY9STvg0quIK5t9DfteDbOC+8Ms=; b=LTJ30LXkyGn0s+BdL7Q9XnEr8c
	Ye2n8A6+KcBQ3Kl85lrWVB/XzE+X2vGs7dru7JqEmblYP7yB1QsY6ADIhyIYCxBKolKd3yl1GpyIK
	zlzKG7jifYtAQvllpcPoKixPnxW9bQbCna/azwFqz3lfeX/RsBlXLChIFGSbNLw+WI/E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi7uc-00063X-EJ;
	Tue, 20 Jan 2026 09:20:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1vi7ua-00063N-SA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 09:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X3QIRnbkG+een8ywAYG10mkSik728ER9RG7n3MzqxTc=; b=SNHakcc04LBjsyaveBjnKJtX2X
 IZ4WVWLxNv6n2DffiXP8X9PIKd9/xD0rCPB1nBvqv9D0n5Er13FV/FGom3uyQv1P4umcHTsZbVnqH
 k8YzZEEdr4al6H85JQTn8ZY32s1Bbfu+bkrkMH16rajC/84BBMcBPAsFmhVyKZg/tnTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X3QIRnbkG+een8ywAYG10mkSik728ER9RG7n3MzqxTc=; b=QdvSjBYCUsN3aymyc4K4tFthGQ
 q3SkFxUw2Nk21+XvZyi9HNMCRF3RX8WKXGzEryK7yG6x5aj745wWyYHmJAziDLN6J2GfuQdZWFH84
 zINy8pGgfhzwvIQriQjsreUZsVvSsF8X9bB2ScWNO/ygbdo4juw6lBuawaMEem6SxZF4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi7ua-00077H-BN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 09:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EDCAF42B24
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jan 2026 09:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF1A0C16AAE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jan 2026 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768900821;
 bh=9sbObY5MQtksv8GLYrO7B/lcexuO9rq6If6dyV+nsRs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t+uQJGYsmmLKOHtHHIUTnEGuZ2E8YcYL4m2mMZEDpfwOHPgKdxf6VNPlXfgusccgB
 MlDt4k7ipreR8HvOJKuZxvzStl5LjxT0PKB403QRieoPTcvnUootDwaiKkzHOidsDa
 rVN6HkFc68RtIa6Uv/EiMPgUD6KdgLEXZV6DlYIzWId9aVqax18+56G3erBRamYSsu
 RoTf8CEWCMKIE4K/FWxUcno6XPvTE7jmaedhaaOLv9Hp2Qh7uuqFGUY/G9N0SUxGcw
 /LSYlsb1kImFB4vsiCrXPbq3Rni64iHvT3fvGMvE72mTHC+//VaSB8n2K5naNwqUyg
 8jMZiK7lfD86Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C8B22C433E1; Tue, 20 Jan 2026 09:20:21 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 20 Jan 2026 09:20:21 +0000
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
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220951-202145-wc6ywgILz0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220951-202145@https.bugzilla.kernel.org/>
References: <bug-220951-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220951 Artem S.
 Tashkinov (aros@gmx.com) changed: What |Removed |Added Status|ASSIGNED
 |RESOLVED Resolution|--- |CODE_FIX 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vi7ua-00077H-BN
Subject: [f2fs-dev] [Bug 220951] swapfile activation bug causes data
 corruption when swapfile < 2MB with fragmented extents
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

https://bugzilla.kernel.org/show_bug.cgi?id=220951

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
