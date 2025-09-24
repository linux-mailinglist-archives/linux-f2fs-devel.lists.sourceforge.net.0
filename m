Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA8B9A050
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 15:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZZpyimegvfzzJUCK9vO9sCerVBokE0zURsI31Ka+Kk=; b=iCY6Shs5BU8fxWhT/3p8LEqSoL
	ad2LEvZqN4uPE0djvF9nnXz8e2V8MSXuYDWNjNhSJpAYr27CwU9SDb5ihEoW5oBRXmv4Wk6ebi5av
	/PQM/Ed9rd6JGRh/qMl7Xxgy/yQwO7po6CJt1Ko+lMmCBRS714IfodAcNpv8Kk+wPflE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1PS6-0007gH-07;
	Wed, 24 Sep 2025 13:22:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v1PS4-0007gB-Jx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 13:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3IKCXCoZP5+L2HlFHb6TIvP3cSS5kNB+s4qEEoqHV+M=; b=c7UbaZ0jx97I9MKyoomWdBWjXe
 hxn89p56+NYLsU4jW9AA4hBimUCmjh2I6GEhIYqjsnxRYv7VU/O/+/3rhh5PpY/jRgSh5jZCsG79u
 X3afsa0HxfY9soLQon4wcTdA1B+dO8yweTAQ9v+EOAWDiNBib3PwpPAFcm7IPGgE1TAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3IKCXCoZP5+L2HlFHb6TIvP3cSS5kNB+s4qEEoqHV+M=; b=gXjRrw8+pOF/tCOyYx6lhmZI7B
 IYCBvKTP3vRBdS/Qj9iQed9Tlb40bwc54wFd8Mw8VAlX0ZfauPm1TmVNzQaI34HUh5F1sg3OTwj1d
 KnU/O5n6bu6HsdA8TbiDwRcbuhHCQg03jw8zMJlm1tbaN4ydiUEtjpYew6OL2xSWntqk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1PS4-0003fc-1j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 13:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5821060097
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 13:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A6D8C116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758720146;
 bh=6nVpiagir5w/q/p9i7KXX0VguNWBRlgMHm54g0Lq1W4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=diRWlao4/Imcerh4Dd3LlQmORqrsAxrKQizo8TN3qclEX9oJaxIiqo005vrvR8FBA
 NEVYQ4LHUwOfVsCD01ZPQQTCUzp6iiK2rg/CNUJCfcdtg+8ASGGw87v5DCcJAUtyb6
 SQ2Oa/rF3z4KvD7403y8xYkiTW3b/eCMODAHx5qOrzFUND+rYzfqrwKeuzQrXn4Eqp
 7vxjeUnE8iwOsIh2sZrnFYWmKV8664lGDqjDSrQ0SVpfoqUyyocKXdVX808d8jM3Jf
 FjAnJH4Vl1dZxqTnMoWfRK4rl1xBCgUitG9ET95cUBQP1In2UlAOWcAPYFdBQ54SaT
 r87fFUSqVSE2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E8E50C433E1; Wed, 24 Sep 2025 13:22:25 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Sep 2025 13:22:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-7jx7lfjqex@https.bugzilla.kernel.org/>
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
 #7 from Chao Yu (chao@kernel.org) --- Can you please hook
 fscrypt_free_bounce_page()
 to set page private w/ special value, something as below: 
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
X-Headers-End: 1v1PS4-0003fc-1j
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

--- Comment #7 from Chao Yu (chao@kernel.org) ---
Can you please hook fscrypt_free_bounce_page() to set page private w/ special
value, something as below:

void fscrypt_free_bounce_page(struct page *bounce_page)
{
        if (!bounce_page)
                return;
        set_page_private(bounce_page, (unsigned long)0xF2F52011);
        ClearPagePrivate(bounce_page);
        mempool_free(bounce_page, fscrypt_bounce_page_pool);
}

And add some check conditions in f2fs_is_cp_guaranteed() to see whether the
page has been freed before inc_page_count().

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
