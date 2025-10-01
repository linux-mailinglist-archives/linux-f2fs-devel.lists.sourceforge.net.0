Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 166BFBAF87A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Oct 2025 10:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUV7UCNiAQTjZjN1bQBEqj/6ehup7MIe/9Xeh9tyzNs=; b=mPXhSJatq4wbKb21c25vaaA0+O
	UQMs7VkaNBOGCFi8tpR/gh6aRIhdk6xgFUIYMWeWALOCSGSTAC5oXbINAFalO6EM3zUXPSVgOds6Q
	bBON30SE2q61bdntdaOuOr9Xi/nYQnDh+FSksjdqMolGCLWbJRIFy3e/161hdmB7PUYo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3rm7-0002fR-2l;
	Wed, 01 Oct 2025 08:01:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v3rm5-0002fJ-IW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 08:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SawoQ7Lq9KG6X1XW9RuEy7kcT6Am5PVODL7lToQ7dzk=; b=HTT0AJ4mojrYA9P0uG7QRqsov1
 zxugktGj0Ztmva0ZHx/4w/l0aVUodXQZ587rHkkS3EXmHVWwhYGw9biEGnH5qAdiAoTz7BhB0JvHd
 u1ajKKNE1lXSFcv6GKewEVwRigUXVz3qYzt85mgx6Qgv5rQrNWvHquNwfqWGKrCSWxHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SawoQ7Lq9KG6X1XW9RuEy7kcT6Am5PVODL7lToQ7dzk=; b=c1DUciiGESsZKsxAyvtRD3y9rL
 fmcvI6P9KExFBeEOcJmSnu2rcg9a8YFotM8Izqt2coBOhYj87qECkB4kRgA1gWar/XxuoJRZE0Vuj
 RlOmNW17pDvc0cVAGdLvhWzhC/ajV9P4v4Z2lbePZM+K88HnnEPWE2q3ZV5Xmz10YMuw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3rm4-0003RE-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 08:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 410B86054C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Oct 2025 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E60FFC4CEF4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Oct 2025 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759305674;
 bh=pAggRwe/q4KiXfVUIpSF3EtMwGGC2hR9OfKyQGd7gVY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cApAb5G7Z4zPlcGCEBTyEs4OSqOBWKcUGKAjYACBcVCxU2EgwEOlH2Ul5wjFeGADU
 Rpuamv2HB94Ivt9F7d3lh+nK0Bw94kgUCoGQO67D8pv7N3L/d7vT3EIxxOBKIpHMjn
 e2OLyyfELHcFS6zXSOyyZ9kuNV0JkGmR++BmDhe3ao3M9n9dWlmAfH50fpM/rl6kfI
 w6N+nug/eiFZuiIT7VkfKGCgG+po+0B0AYyW9ygOEMSgzCFEVrPvqsGQ4bqcMwdUhU
 Prt+7PrErcey0IRmXnYlse/6Q7YWiovNJWJsVtF8d6WhPHBuuP4jJlC16iOEcGAL9D
 0+wH75vj2dRSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CF2E9C4160E; Wed,  1 Oct 2025 08:01:14 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Oct 2025 08:01:14 +0000
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
Message-ID: <bug-220575-202145-Xue8UCoDez@https.bugzilla.kernel.org/>
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
 #16 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #7)
 > Can you please hook fscrypt_free_bounce_page() to set page private w/ >
 special value, something as below: > > [...] 
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
X-Headers-End: 1v3rm4-0003RE-VZ
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

--- Comment #16 from JY (JY.Ho@mediatek.com) ---
(In reply to Chao Yu from comment #7)
> Can you please hook fscrypt_free_bounce_page() to set page private w/
> special value, something as below:
> 
> void fscrypt_free_bounce_page(struct page *bounce_page)
> {
>       if (!bounce_page)
>               return;
>       set_page_private(bounce_page, (unsigned long)0xF2F52011);
>       ClearPagePrivate(bounce_page);
>       mempool_free(bounce_page, fscrypt_bounce_page_pool);
> }
> 
> And add some check conditions in f2fs_is_cp_guaranteed() to see whether the
> page has been freed before inc_page_count().

I tried to modified:
+ set_page_private(bounce_page, (unsigned long)0x5566F2F5);

But I got two results from different panics. 
fscrypt_pagecache_page(page):0x000000005566f2f5 and 

fscrypt_pagecache_page(page):0x0000000000000000 (As shown below)

[38417.862874] JY f2fs_is_cp_guaranteed 65 bounced_page:0xfffffffe81cd6760,
_private:0xfffffffe824723c0, fscrypt_pagecache_page(page):0x0000000000000000

[38417.921850] JYJY :fffffffe824723c0 is the PAGE

[38417.968256] page: refcount:4 mapcount:1 mapping:000000000615ef5b index:0x6c
pfn:0x74a0c

[38417.998050] memcg:ffffff804c331380

[38418.018203] flags:
0x800000000009029(locked|uptodate|lru|owner_2|private|zone=0)

[38418.046079] raw: 0800000000009029 fffffffe82475618 fffffffe82484fc8
ffffff806b25c460

[38418.100286] raw: 000000000000006c 0000000000000009 0000000400000000
ffffff804c331380

[38418.143969] raw: ffffff8064457540 0000000000000000

[38418.162562] page dumped because: JY got the BUG!

[38418.199250] page_owner tracks the page as allocated

[38418.225840] page last allocated via order 0, migratetype Movable, gfp_mask
0x152c4a(GFP_NOFS|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL|__GFP_MOVABLE),
pid 20039, tgid 19537 (NetworkService), ts 38403893384078, free_ts
38403858760495

[38418.310128]  post_alloc_hook+0x1d0/0x1e8

[38418.330509]  prep_new_page+0x30/0x150

[38418.358836]  get_page_from_freelist+0x11e8/0x127c

[38418.375352]  __alloc_pages_noprof+0x1b0/0x448

[38418.399171]  __folio_alloc_noprof+0x1c/0x64

[38418.430498]  page_cache_ra_unbounded+0x1a4/0x36c

[38418.440402]  page_cache_ra_order+0x358/0x434

[38418.446579]  page_cache_async_ra+0x128/0x17c

[38418.454399]  filemap_fault+0x14c/0x868

[38418.467818]  f2fs_filemap_fault+0x34/0xec

[38418.475253]  __do_fault+0x70/0x110

[38418.484117]  do_pte_missing+0x424/0x12f0

[38418.489691]  handle_mm_fault+0x4d4/0x818

[38418.499341]  do_page_fault+0x210/0x640

[38418.504888]  do_translation_fault+0x48/0x11c

[38418.510476]  do_mem_abort+0x5c/0x108

[38418.515795] page last free pid 64 tgid 64 stack trace:

[38418.527744]  free_unref_folios+0x944/0xe94

[38418.534456]  shrink_folio_list+0x8c8/0x1304

[38418.543434]  evict_folios+0x12ec/0x1818

[38418.550869]  try_to_shrink_lruvec+0x1fc/0x3c8

[38418.561221]  shrink_one+0xa4/0x230

[38418.574348]  shrink_node+0xbe0/0xfc4

[38418.599077]  balance_pgdat+0x7bc/0xce4

[38418.630024]  kswapd+0x298/0x4d8

[38418.650979]  kthread+0x118/0x1ac

[38418.670266]  ret_from_fork+0x10/0x20

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
