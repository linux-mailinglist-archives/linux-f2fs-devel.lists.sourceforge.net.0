Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757E8B1779
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 01:51:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzmO2-00024t-3U;
	Wed, 24 Apr 2024 23:50:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1rzmNq-00024d-2N
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 23:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yt9rkyoEWWN8iV1XjerPzCUOjSVSXSeNMKGiuMcy6ss=; b=fffGyz3D1wfB47QFGTnH+Qp7x0
 Ei0YKG0p6mP5t6StVUQrtPPupb6YSE30c+5mgPkI43v9U4fgGasJV98X8APldNI6HhYqm16pjbWuu
 ZNWiHIsNf24XwKredgjJgjHbUr/aF3Emmp/JH8nDd/QgfhI/sH2uTV/sdjql57qSP2A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yt9rkyoEWWN8iV1XjerPzCUOjSVSXSeNMKGiuMcy6ss=; b=a9/2ZJD++JQsxJh3TkOfAg+E5Z
 xY2LtMDSLH0LTuYHURS46LYkAf+3aDQlII9kbTNUKuLGLmgj4sHpvGSyCDhHYs4RWg1NTQCbZGOte
 ZY11YCePDmPUSWbw4fqhYaKEH1rIyMzU/TI30PcZ8w1qTVnk0kUObh2ZmxHp4PO2A68Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzmNp-0005lo-Ew for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 23:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55A6F611FD;
 Wed, 24 Apr 2024 23:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8602C113CD;
 Wed, 24 Apr 2024 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1714001665;
 bh=r1lFMQ9tjlwDCB+yNR4sMxDGzxvWoPx/ZEFghdtGbrE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k+gsUF74AM8tc617xiGEq89jMawYHg31Zlp93tTbs31afiLDVMXfdX/JXO6FR8DMm
 LSNG5DF6NtQKO+OqHklIjrbfJfilPNIunu38rKI43bKf2sIy9nLSJb0oclb5r5vbtu
 +zpCLAhE++JJx79s6IYUd5Ola9Hudc52ne9h+oKg=
Date: Wed, 24 Apr 2024 16:34:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Message-Id: <20240424163423.ad6e23a984deb731e2de497c@linux-foundation.org>
In-Reply-To: <7c52ae2a-8f72-4c3c-b4b3-24b50bdb5486@redhat.com>
References: <20240423225552.4113447-1-willy@infradead.org>
 <20240423225552.4113447-7-willy@infradead.org>
 <7c52ae2a-8f72-4c3c-b4b3-24b50bdb5486@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed,
 24 Apr 2024 13:55:32 +0200 David Hildenbrand <david@redhat.com>
 wrote: > On 24.04.24 00:55, Matthew Wilcox (Oracle) wrote: > > All callers
 are now converted, delete this compatibility wrapper. > > 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-foundation.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -3.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rzmNp-0005lo-Ew
Subject: Re: [f2fs-dev] [PATCH 6/6] mm: Remove page_mapping()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-fscrypt@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 24 Apr 2024 13:55:32 +0200 David Hildenbrand <david@redhat.com> wrote:

> On 24.04.24 00:55, Matthew Wilcox (Oracle) wrote:
> > All callers are now converted, delete this compatibility wrapper.
> > 

For some reason,

mm/hugetlb.c: In function 'hugetlb_page_mapping_lock_write':
mm/hugetlb.c:2164:41: error: implicit declaration of function 'page_mapping'; did you mean 'page_mapped'? [-Werror=implicit-function-declaration]
 2164 |         struct address_space *mapping = page_mapping(hpage);
      |                                         ^~~~~~~~~~~~
      |                                         page_mapped
mm/hugetlb.c:2164:41: error: initialization of 'struct address_space *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]


I'll disable "mm: Remove page_mapping()" pending review of the below,
please.


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm: convert hugetlb_page_mapping_lock_write() to hugetlb_folio_mapping_lock_write
Date: Wed Apr 24 04:20:30 PM PDT 2024

Convert this to use folios, so we can remove page_mapping()

Cc: David Hildenbrand <david@redhat.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/hugetlb.h |    6 +++---
 mm/hugetlb.c            |    6 +++---
 mm/memory-failure.c     |    4 ++--
 mm/migrate.c            |    2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

--- a/mm/hugetlb.c~mm-convert-hugetlb_page_mapping_lock_write-to-hugetlb_folio_mapping_lock_write
+++ a/mm/hugetlb.c
@@ -2155,13 +2155,13 @@ static bool prep_compound_gigantic_folio
 /*
  * Find and lock address space (mapping) in write mode.
  *
- * Upon entry, the page is locked which means that page_mapping() is
+ * Upon entry, the folio is locked which means that folio_mapping() is
  * stable.  Due to locking order, we can only trylock_write.  If we can
  * not get the lock, simply return NULL to caller.
  */
-struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage)
+struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio)
 {
-	struct address_space *mapping = page_mapping(hpage);
+	struct address_space *mapping = folio_mapping(folio);
 
 	if (!mapping)
 		return mapping;
--- a/mm/memory-failure.c~mm-convert-hugetlb_page_mapping_lock_write-to-hugetlb_folio_mapping_lock_write
+++ a/mm/memory-failure.c
@@ -1595,7 +1595,7 @@ static bool hwpoison_user_mappings(struc
 	 * XXX: the dirty test could be racy: set_page_dirty() may not always
 	 * be called inside page lock (it's recommended but not enforced).
 	 */
-	mapping = page_mapping(hpage);
+	mapping = folio_mapping(folio);
 	if (!(flags & MF_MUST_KILL) && !PageDirty(hpage) && mapping &&
 	    mapping_can_writeback(mapping)) {
 		if (page_mkclean(hpage)) {
@@ -1622,7 +1622,7 @@ static bool hwpoison_user_mappings(struc
 		 * TTU_RMAP_LOCKED to indicate we have taken the lock
 		 * at this higher level.
 		 */
-		mapping = hugetlb_page_mapping_lock_write(hpage);
+		mapping = hugetlb_folio_mapping_lock_write(folio);
 		if (mapping) {
 			try_to_unmap(folio, ttu|TTU_RMAP_LOCKED);
 			i_mmap_unlock_write(mapping);
--- a/include/linux/hugetlb.h~mm-convert-hugetlb_page_mapping_lock_write-to-hugetlb_folio_mapping_lock_write
+++ a/include/linux/hugetlb.h
@@ -178,7 +178,7 @@ bool hugetlbfs_pagecache_present(struct
 				 struct vm_area_struct *vma,
 				 unsigned long address);
 
-struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage);
+struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);
 
 extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];
@@ -297,8 +297,8 @@ static inline unsigned long hugetlb_tota
 	return 0;
 }
 
-static inline struct address_space *hugetlb_page_mapping_lock_write(
-							struct page *hpage)
+static inline struct address_space *hugetlb_folio_mapping_lock_write(
+							struct folio *folio)
 {
 	return NULL;
 }
--- a/mm/migrate.c~mm-convert-hugetlb_page_mapping_lock_write-to-hugetlb_folio_mapping_lock_write
+++ a/mm/migrate.c
@@ -1425,7 +1425,7 @@ static int unmap_and_move_huge_page(new_
 			 * semaphore in write mode here and set TTU_RMAP_LOCKED
 			 * to let lower levels know we have taken the lock.
 			 */
-			mapping = hugetlb_page_mapping_lock_write(&src->page);
+			mapping = hugetlb_folio_mapping_lock_write(src);
 			if (unlikely(!mapping))
 				goto unlock_put_anon;
 
_



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
