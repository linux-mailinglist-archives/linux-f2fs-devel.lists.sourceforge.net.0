Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A3BB5D4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 04:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QU9YGJsSXJRGI1YXq1d6qt7/09zee0+YphAI4t7X+Q0=; b=PiysNbbwnpBnJCjlp/7ssTblV4
	bpPIfuWU2GBDc24wIm4yS3z3tpQy/uxtxC7DXzG1c4UTrdkQpOEK66RcO8imwHkcyI4FcKTAyfLdY
	CcfEQWfnFZxO1qFUQF8nCTTbZ2lhDAL52No2FDgTCtjOcrrHwFVG1ophN+hgEXVWJjtY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4Vn1-0007Or-6Z;
	Fri, 03 Oct 2025 02:44:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v4Vn0-0007Ol-10
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 02:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ib1AeoQ+ItWol3LzxiyYEzZ7LYdAzBRCVGAGLtI9KYc=; b=g46s9aOvaq7kWiYMUOvkCmpHVR
 H7QA41uGZ1E8tHjEwH54+SyeyNZSV95gTe/swEWiAUItOmrhGUeklXpaBzlREt5ujJwyY2Sb6DTZ7
 dBhxJrf0xnsU8IFGxvj/c3hOxwvctcJ1YcDb0QRljepLnfWfhJOUOesVG+v1mN3bnzzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ib1AeoQ+ItWol3LzxiyYEzZ7LYdAzBRCVGAGLtI9KYc=; b=jcnDqzRwsxIvHNkfOYMxA8CbHp
 EEHqTWPRnnWqKTOrqAlSgyRAMKce5FBgnPh1mOTWJBQtnN6vDZnS9/XjHkUACJFCzpbx5o1latA/j
 fY0EvKqysjEPl79eVTcx9BvcLXTm6F04vgLHaNaIExikjjQskYo0DIK1ab/IM9tK00fc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4Vn0-0007m3-AP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 02:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0502C41A66
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Oct 2025 02:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D271BC4CEFD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Oct 2025 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759459462;
 bh=Ib1AeoQ+ItWol3LzxiyYEzZ7LYdAzBRCVGAGLtI9KYc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S6Su9NiPd1eyXOtcUYRC8jw79RzP2MY5NBGLaxHPVtlPy3wM2m1+5gtcZ42SkkrVY
 lqNgA8X3sBtCDxWI05EJ7eg7lg7ZOPMrIGa9YXWACX1QraVweI4ecODYZA89V9l5Xj
 zdF/NDmwXiMLTpZfO6AHLhE3gv9hYCvVfJqPZCF2+AmfLB2FMo5Weo6VuOaGfoC33Q
 WyOQ6ufrMyNXUiGYLJocHJe9K4MLHnmkkZZBlUur5km/s3u6axrQ893GD35MCCzLIL
 ucQWuSMr1+Ia5Rs4+yDkMeGwIkqg6opcrEQdrMkE4JcYCROEBolmeKg9HF/1MRDaIS
 WwiL/1E7f13DQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C07ACC3279F; Fri,  3 Oct 2025 02:44:22 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 03 Oct 2025 02:44:22 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-6ovkY8oQa1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #18 from Chao Yu (chao@kernel.org) --- (In reply to JY from comment #16)
 > I tried to modified: > + set_page_private(bounce_page, (unsigned
 long)0x5566F2F5); > > But I got two results from [...] 
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
X-Headers-End: 1v4Vn0-0007m3-AP
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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

https://bugzilla.kernel.org/show_bug.cgi?id=220575

--- Comment #18 from Chao Yu (chao@kernel.org) ---
(In reply to JY from comment #16)
> I tried to modified:
> + set_page_private(bounce_page, (unsigned long)0x5566F2F5);
> 
> But I got two results from different panics. 
> fscrypt_pagecache_page(page):0x000000005566f2f5 and 
> 
> fscrypt_pagecache_page(page):0x0000000000000000 (As shown below)

I think this is the same issue, actually, value of page->private should be
unpredictable, because this is a UAF issue, we don't know how system changes
the page after we freed it.

So, can you please test the fix to check whether it can solve your problem or
not? Thanks a lot. :)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
