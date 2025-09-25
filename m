Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4DB9E4BF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 11:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaW2VleL1g2T9T9ZME4ALzBcq/gp2u10iUvlASfriYg=; b=XJhH8c2lYIKM/txwWFHHMA+6xk
	lIPq0FMSz1JvIsU83gCIsAZTKXHEi/tkD4WOkit6K4NbOnz4jnkDhRe4yCzz0qinD28DFW89MdMso
	8qR7Ci3PXbPbxWXb8GWmHU4o84gpT2m8ejALoLwi4hUdKVR93Ig6dhDxuJWXOJhnAquU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1iCg-0007F0-Ug;
	Thu, 25 Sep 2025 09:23:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v1iCf-0007Et-4x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 09:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wRNUzaUfoqNJ2sY3cBnDOF3dc+xUB6XfwJUTzg/TieU=; b=ewkzq1JKg7+2Brn0n+BL88G1nH
 e10F1FUE/sEkPC/trA/eLVI0OueziTYN7l50bK1h2KBRG2v2GgVHeNT+S7felExzshmC3fcEsYXy8
 vwwr6L21NwjhPx+UyYSBjF+uw0mHIwmKKE7Gzl1XFhrjmzPJQLAU2kd0rssK2ODQcH1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wRNUzaUfoqNJ2sY3cBnDOF3dc+xUB6XfwJUTzg/TieU=; b=gj4i+JzdFmOJx1SVKEy6F6nbn7
 +/mjFWVqs3g7MIncC2EBDin+G2Ns0rujekEoLUK6tqd4SlQ09PYtXmYw+B5Sa6yUnYeJDaMajJnzz
 06nDPJMCWCU15/hf43V4eOdVA7nqV6YCzcGSj/Vm4bGZNGoJ1utCrMu4j+1HmNOKDsWc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1iCe-0003Gk-LA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 09:23:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D3CF415B7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 09:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DB1DC4CEF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758792222;
 bh=CRRnrM1qN171FV5c4+sRNFwXqRP929yD52oG0pPs6+Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fipKfd8bX5XOxJzuWhrzCnQ5n782CvLScls03whcsxRBqins/Qp/95MxThs1VpSid
 eNb7s8tHl+n+TGi5K1VEMg7QVm4FQGaFFAdjSUi1zny4uZ1t8OHVWdEBNLhB4I87Lq
 rYPga8Ts9myJzlIbhvKEfX9wx3XRfxV2rdI2pZFfRcSETctDb73a4KKb6IVqMZEguW
 xkMvYHaTTwoTJE3jqdeyTP00SJL4U9U5ZlPpGOFbLYBCFXyXp/Mdt7P89/r79uuGYd
 5OGKl5QZLRBEWL2PYp/qbMCbxu9mF7lnVqtCxFlouzByzQCIGQVp9sZLST9ubZ0hYU
 SE4QM2demY3Lg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0BA66C4160E; Thu, 25 Sep 2025 09:23:42 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 25 Sep 2025 09:23:41 +0000
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
Message-ID: <bug-220575-202145-RXV6CJpORu@https.bugzilla.kernel.org/>
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
 #11 from Chao Yu (chao@kernel.org) --- (In reply to JY from comment #8) >
 OK, I will try it. > > At the last experiment,
 I used the newly added '_private'
 to record non-null > value and du [...] 
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
X-Headers-End: 1v1iCe-0003Gk-LA
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

--- Comment #11 from Chao Yu (chao@kernel.org) ---
(In reply to JY from comment #8)
> OK, I will try it.
> 
> At the last experiment, I used the newly added '_private' to record non-null
> value and dump it when fscrypt_is_bounce_page(page) is true.
> 
> +             pr_crit("bounced_page:0xpx, pp:0x%px,
> fscrypt_pagecache_page(page):0x%px\n", page, page->_private,
> fscrypt_pagecache_page(page));
> 
> The result is :
> bounced_page:0xfffffffe82282290, pp:0x0000000000000000,
> fscrypt_pagecache_page(page):0x0000000000000000
> (pp is page->_private)
> 
> I think the 'pp:0x0000000000000000' proves this page is not a bounce_page.
> Am I misunderstanding? :(
Can you please try below diff?

---
 fs/f2fs/data.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1b0050b8421d..13bde4a2f40d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -884,6 +884,15 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info
*sbi,
        }
 }

+#define sanity_check_page(sbi, enc_page, page)                         \
+       do {                                                            \
+               if (page && !page->private) {                           \
+                       dump_page(enc_page, "dump enc_page");           \
+                       dump_page(page, "dump data page");              \
+                       BUG_ON(1);                                      \
+               }                                                       \
+       } while (0)
+
 int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 {
        struct bio *bio = *fio->bio;
@@ -896,9 +905,13 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)

        trace_f2fs_submit_page_bio(page, fio);

+       sanity_check_page(fio->sbi, fio->encrypted_page, fio->page);
+
        if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
                                                fio->new_blkaddr))
                f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
+
+       sanity_check_page(fio->sbi, fio->encrypted_page, fio->page);
 alloc_new:
        if (!bio) {
                bio = __bio_alloc(fio, BIO_MAX_VECS);
@@ -906,15 +919,19 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
                                page_folio(fio->page)->index, fio, GFP_NOIO);

                add_bio_entry(fio->sbi, bio, page, fio->temp);
+               sanity_check_page(fio->sbi, fio->encrypted_page, fio->page);
        } else {
                if (add_ipu_page(fio, &bio, page))
                        goto alloc_new;
+               sanity_check_page(fio->sbi, fio->encrypted_page, fio->page);
        }

        if (fio->io_wbc)
                wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
                                         PAGE_SIZE);

+       sanity_check_page(fio->sbi, fio->encrypted_page, fio->page);
+
        inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));

        *fio->last_block = fio->new_blkaddr;
-- 
2.40.1

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
