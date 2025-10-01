Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EBBBAF7DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Oct 2025 09:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBdFc8vs22CJWM2ga62611lxzCfK16q6Gnm9Mgr5lKI=; b=avb9YizYxjj2ayJpZYZscmVdS8
	ysZUYNEHjt/EvHam/2tX1Dlx5rSx94TMeKlVGp7DxjV70pyM+3bhmWuAOfeF1ewGC50ZNdCWnnz+b
	qBWYOMt3ZQEfMqThcohMNJqub+FJ4sckf0Ho0csv4spkLBOkylOs7T9yul/XOlT3QLEA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3rcF-0002c6-Hx;
	Wed, 01 Oct 2025 07:51:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v3rcE-0002by-H3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 07:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7oArbh/KqkkiBYx3RkMxwj14YueE+wZ0ZLFIghQ11o=; b=BzmwJkwXmFEgWff9mfNKq0/S0q
 5/LGX7HrIVuVcLOTrX5qbkUq6p3rTBj/MUwT1EQXmPBwedX/d7C/jTkElzTMl7qzn8IUYQF/xCvVR
 3jikcBSW3w4NF8HjtryYJN0Tr5hdWb7g5LEvZUSpTVa/KkLoQgT02ETBoLkY0jeV//Bw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m7oArbh/KqkkiBYx3RkMxwj14YueE+wZ0ZLFIghQ11o=; b=Z26JFDVdgj0ULzRwW72JqHB45+
 +B+dEytV4lk0jHLrOCzxfsLG9pD8wcRtEQiSqAmNkJ8Xnh67v5v8/TEyuf9Zv0b6SCRoz+/ThW+Z4
 lARdlGAzZRUAsMUVIUAjhyvCL6GNhmOdB5OXK3StEWvdaALWcSNoXTNHkav2EXxxIyfg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3rcC-0002p7-UA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 07:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CAF540A54
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Oct 2025 07:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19F68C4CEF4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Oct 2025 07:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759305063;
 bh=F21BWHxQ0VuA2aIKHt0XioDukSDnPMtaiCe2atVbVcA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SNOEFWJnktU7wfRFE5o9bpdhkTZNKKENxbqoab4gY9aCP3tfqX6y7pLfUxpxDW5Ex
 4ysVxshcVSXWpNi4XJvxx5cfesCi/dh2K6rQYOi5vrAmpcERPkZeCYpMVbaU45RAxL
 QMDIinQ05+rl50dN4JI83lub9JQ5UYWoPQXwOZM52mY5MdnI43u+7yWV74XKe7A00X
 KO/uY9Zh9206odk2aWQdKOlCGBlvVKpnZX09spLw7/15ln34NF9q3dWySanvn33vUu
 tZgVlvgXOWpKj13Cg274TIAZHakpwd2m0TtTf1LGTkGSfJrE0ytnPYTy3Yt6RlWh4z
 iBcUdM7F9tWJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 070D6C433E1; Wed,  1 Oct 2025 07:51:02 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Oct 2025 07:51:02 +0000
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
Message-ID: <bug-220575-202145-BmcTjO5Gc1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #15 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #7)
 > Can you please hook fscrypt_free_bounce_page() to set page private w/ >
 special value, something as below: > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3rcC-0002p7-UA
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

--- Comment #15 from JY (JY.Ho@mediatek.com) ---
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

By the way, this is my test result. Is that another issue?

[27024.604851] JY f2fs_is_cp_guaranteed 65 bounced_page:0xfffffffe81338410,
_private:0xfffffffe813c54f0, fscrypt_pagecache_page(page):0x000000005566f2f5

[27024.620405] JYJY :fffffffe813c54f0 is the PAGE

[27024.626388] page: refcount:4 mapcount:1 mapping:000000008cdd016b index:0x1d
pfn:0x3f443

[27024.636025] memcg:ffffff8031bd0000

[27024.641269] flags:
0x1000000000009029(locked|uptodate|lru|owner_2|private|zone=0)

[27024.650060] raw: 1000000000009029 fffffffe813c54a8 fffffffe813bc588
ffffff806b096f68

[27024.660600] raw: 000000000000001d 0000000000000009 0000000400000000
ffffff8031bd0000

[27024.669271] raw: 000000003f443000 0000000000000000

[27024.675745] page dumped because: JY got the BUG!

[27024.683789] page_owner tracks the page as allocated

[27024.690777] page last allocated via order 0, migratetype Movable, gfp_mask
0x152c4a(GFP_NOFS|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL|__GFP_MOVABLE),
pid 30372, tgid 30372 (android.vending), ts 27014734256272, free_ts
27002686350166

[27024.724435]  post_alloc_hook+0x1d0/0x1e8

[27024.730550]  prep_new_page+0x30/0x150

[27024.735185]  get_page_from_freelist+0x11e8/0x127c

[27024.744799]  __alloc_pages_noprof+0x1b0/0x448

[27024.753649]  __folio_alloc_noprof+0x1c/0x64

[27024.759063]  page_cache_ra_unbounded+0x1a4/0x36c

[27024.767626]  page_cache_ra_order+0x358/0x434

[27024.774150]  do_sync_mmap_readahead+0x20c/0x280

[27024.780541]  filemap_fault+0x1e0/0x868

[27024.785950]  f2fs_filemap_fault+0x34/0xec

[27024.792392]  __do_fault+0x70/0x110

[27024.797172]  do_pte_missing+0x300/0x12f0

[27024.802556]  handle_mm_fault+0x4d4/0x818

[27024.808201]  do_page_fault+0x210/0x640

[27024.813143]  do_translation_fault+0x48/0x11c

[27024.818658]  do_mem_abort+0x5c/0x108

[27024.824631] page last free pid 55 tgid 55 stack trace:

[27024.831407]  free_unref_page+0x828/0x978

[27024.837039]  __folio_put+0xac/0xdc

[27024.842449]  migrate_pages_batch+0x127c/0x1894

[27024.849239]  migrate_pages+0x3f0/0x798

[27024.856057]  compact_zone+0xca8/0x12ec

[27024.861241]  compact_node+0xc0/0x190

[27024.865955]  kcompactd+0x3b8/0x978

[27024.872656]  kthread+0x118/0x1ac

[27024.878257]  ret_from_fork+0x10/0x20[27024.604851] JY f2fs_is_cp_guaranteed
65 bounced_page:0xfffffffe81338410, _private:0xfffffffe813c54f0,
fscrypt_pagecache_page(page):0x000000005566f2f5

[27024.620405] JYJY :fffffffe813c54f0 is the PAGE

[27024.626388] page: refcount:4 mapcount:1 mapping:000000008cdd016b index:0x1d
pfn:0x3f443

[27024.636025] memcg:ffffff8031bd0000

[27024.641269] flags:
0x1000000000009029(locked|uptodate|lru|owner_2|private|zone=0)

[27024.650060] raw: 1000000000009029 fffffffe813c54a8 fffffffe813bc588
ffffff806b096f68

[27024.660600] raw: 000000000000001d 0000000000000009 0000000400000000
ffffff8031bd0000

[27024.669271] raw: 000000003f443000 0000000000000000

[27024.675745] page dumped because: JY got the BUG!

[27024.683789] page_owner tracks the page as allocated

[27024.690777] page last allocated via order 0, migratetype Movable, gfp_mask
0x152c4a(GFP_NOFS|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL|__GFP_MOVABLE),
pid 30372, tgid 30372 (android.vending), ts 27014734256272, free_ts
27002686350166

[27024.724435]  post_alloc_hook+0x1d0/0x1e8

[27024.730550]  prep_new_page+0x30/0x150

[27024.735185]  get_page_from_freelist+0x11e8/0x127c

[27024.744799]  __alloc_pages_noprof+0x1b0/0x448

[27024.753649]  __folio_alloc_noprof+0x1c/0x64

[27024.759063]  page_cache_ra_unbounded+0x1a4/0x36c

[27024.767626]  page_cache_ra_order+0x358/0x434

[27024.774150]  do_sync_mmap_readahead+0x20c/0x280

[27024.780541]  filemap_fault+0x1e0/0x868

[27024.785950]  f2fs_filemap_fault+0x34/0xec

[27024.792392]  __do_fault+0x70/0x110

[27024.797172]  do_pte_missing+0x300/0x12f0

[27024.802556]  handle_mm_fault+0x4d4/0x818

[27024.808201]  do_page_fault+0x210/0x640

[27024.813143]  do_translation_fault+0x48/0x11c

[27024.818658]  do_mem_abort+0x5c/0x108

[27024.824631] page last free pid 55 tgid 55 stack trace:

[27024.831407]  free_unref_page+0x828/0x978

[27024.837039]  __folio_put+0xac/0xdc

[27024.842449]  migrate_pages_batch+0x127c/0x1894

[27024.849239]  migrate_pages+0x3f0/0x798

[27024.856057]  compact_zone+0xca8/0x12ec

[27024.861241]  compact_node+0xc0/0x190

[27024.865955]  kcompactd+0x3b8/0x978

[27024.872656]  kthread+0x118/0x1ac

[27024.878257]  ret_from_fork+0x10/0x20

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
