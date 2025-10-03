Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE10BB5D7C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 05:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HojHF0vRDXmcNOfxci0cvaWyMlhKtjCOj4PDoT1d514=; b=cYrCKcO0+0z8QC6vuhCLbo1t0i
	OZb1ROE20pLb+DPIshI3igwyUMaiByuCc4Ks/nNXJ1MtpK7jf87XydO+qSmXW9ChsbnMLObck20sE
	OGSvwzwK9gMoTal08i3py4PbLtnsdVYDX3fyMFV626VXqJqAJiSuLKcw3ajla58m/fho=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4WEx-0003tv-QO;
	Fri, 03 Oct 2025 03:13:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v4WEv-0003tp-Qx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 03:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ik2xJfQUZrMzG+Ys8Tf6OH602Usx1Pmf6PNrS6XE8gI=; b=AARA4JNi26u+pxAZ27bHpINR37
 Uovty5wzZGYCwJSfxS31r6sIWWWMLQqzT1XO6ZTgiXskFAQ98PmFK2lq0HxHFkrLiIxCptV3kgnU8
 P414EZzH52tMHa+cNFqRIKEjL4iyRVZ+Ct3LXPFKhHVRcTFEJNXOIBDmTbi1CKMvQKgM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ik2xJfQUZrMzG+Ys8Tf6OH602Usx1Pmf6PNrS6XE8gI=; b=NvD5sYTC6ErSk1BfFNa8J+zplW
 TqJ4CUumPriFDRW5ARmEDsq1b5GhvhSxaSq4riW5sHR8ZpBOOFiTKnYw3cuSxSFDsil2R4fZ5C8Yv
 W7C2Gv8kRA7sM5+rnlXxSvAwKxF4qq02M2WwAV8kyUBF5eME302C6PEE8d8ZZpMQPg8w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4WEv-0001jq-Aj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 03:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 66A3160572
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Oct 2025 03:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78988C4CEF4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Oct 2025 03:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759461215;
 bh=Ik2xJfQUZrMzG+Ys8Tf6OH602Usx1Pmf6PNrS6XE8gI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lkxan/DzyinUo4eSGbrQc2LlIvTkosE2rhu8TySdxxeDxEQ65qbotKxF1LQwbn/S6
 zzOo4Fw1bIVWre66WUSn9onXkWgynuP+dr3aB19oozzDWlAcfYdmfXAqdixKyTwnt3
 Ckbov6uT2BP+FnLsXHqO2zR/hrm9NsC5Yws/oMCFi/m4gGyRTrRiXOUgCX5ObkKwAv
 lZPW/az4yxcKMZ3f2rT6gZscM9EQFGCd0R+ivnRuKRYhuPRC3Q57jN4ZHJg/z7Ueul
 czpTOFF809zb1zIgS6ERFyHMoOBuOArg2Aog9rAWcZbnmD5Hd+Ow1C7gJbLJpRtgbC
 uN/aL0XyA70RA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 63F7FC3279F; Fri,  3 Oct 2025 03:13:35 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 03 Oct 2025 03:13:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: JY.Ho@mediatek.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-F4YLhjie7C@https.bugzilla.kernel.org/>
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
 #19 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #18)
 > (In reply to JY from comment #16) > > I tried to modified: > > +
 set_page_private(bounce_page, (unsigned long) [...] 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4WEv-0001jq-Aj
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

--- Comment #19 from JY (JY.Ho@mediatek.com) ---
(In reply to Chao Yu from comment #18)
> (In reply to JY from comment #16)
> > I tried to modified:
> > + set_page_private(bounce_page, (unsigned long)0x5566F2F5);
> > 
> > But I got two results from different panics. 
> > fscrypt_pagecache_page(page):0x000000005566f2f5 and 
> > 
> > fscrypt_pagecache_page(page):0x0000000000000000 (As shown below)
> 
> I think this is the same issue, actually, value of page->private should be
> unpredictable, because this is a UAF issue, we don't know how system changes
> the page after we freed it.
> 
> So, can you please test the fix to check whether it can solve your problem
> or not? Thanks a lot. :)

No problem, it's my pleasure. :)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
