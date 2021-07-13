Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE643C6A70
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 08:26:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3Bs3-0001jU-DE; Tue, 13 Jul 2021 06:26:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+5ed7718f52b0c846131f+6533+infradead.org+hch@casper.srs.infradead.org>)
 id 1m3Bs1-0001jH-V7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 06:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5NJ/GobYssN7on3zOlsbOWTmiBv2EzLNZy86W7YdGXg=; b=SfJtsrZbv0bNEj3qkdn5asggoH
 BQX6WucXt6zUl6R8agPVSwI6FHB9dIrT5rYdqHDOko3sGCXd7y/vfQqwRp3X4stOL7dUWJIhGkp5z
 C8UrhjzfCTwcP3cDIc4kGFvJBJzotosuXH8ojMWl1jm05KX9+4bAkEW64hf/CbYilENU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5NJ/GobYssN7on3zOlsbOWTmiBv2EzLNZy86W7YdGXg=; b=Uq+lZlPGQxXlZteWeJ+uvFXmCO
 aE5lB6X0jAES7W4PSxsjV6W7jmoIo35cDwBLDA2pB0yXNVcTLFye2EzRVL50j9j3mL0S7j5sfTPQh
 Ra3jVYfauxyxfOvXeHMedJoYyJ2kS1fpoXuV22RZMMaV695rmhj25s6UWdQ2gY/3CVMQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3Brz-0007Oz-AP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 06:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5NJ/GobYssN7on3zOlsbOWTmiBv2EzLNZy86W7YdGXg=; b=fbsmLbOQszWOm3dv8Pr5kj2E7C
 2oH8QijCtEXZ3EozE81NW39ttgW8OJljVf+LGGn1grSH4J/TUVDG0j2e/NTp+MRk4wJ9nnd3+guTz
 +uiAyPZWdlJAz/ObZcfnq4duRgc9SCYl6elA/kg4FjqqjxRWiSyctVBKCNGsl9KYTYO892oJYWZI5
 TrvEbdC7HmPZPoevV1PUKcLJ6czjAami4Jbi7sr+F0PnKOI41Qf+ldIkfRpOlaioGlDjqxR3FtMJ3
 yq3YPlebvzDtb55VjfVt14OhvN5M9EDIMhIcPqpI3SwMoNGZzFinwEFn0SbUkZR/uo311WDKHFLwQ
 3JuzSKBg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m3Bqr-000oBA-3D; Tue, 13 Jul 2021 06:25:10 +0000
Date: Tue, 13 Jul 2021 07:25:05 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YO0xwY+q7d8rQE3f@infradead.org>
References: <20210712163901.29514-1-jack@suse.cz>
 <20210712165609.13215-3-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712165609.13215-3-jack@suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m3Brz-0007Oz-AP
Subject: Re: [f2fs-dev] [PATCH 03/14] mm: Protect operations adding pages to
 page cache with invalidate_lock
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Still looks good.  That being said the additional conditional locking in
filemap_fault makes it fall over the readbility cliff for me.  Something
like this on top of your series would help:

diff --git a/mm/filemap.c b/mm/filemap.c
index fd3f94d36c49..0fad08331cf4 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3040,21 +3040,23 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 	 * Do we have something in the page cache already?
 	 */
 	page = find_get_page(mapping, offset);
-	if (likely(page) && !(vmf->flags & FAULT_FLAG_TRIED)) {
+	if (likely(page)) {
 		/*
-		 * We found the page, so try async readahead before
-		 * waiting for the lock.
+		 * We found the page, so try async readahead before waiting for
+		 * the lock.
 		 */
-		fpin = do_async_mmap_readahead(vmf, page);
-	} else if (!page) {
+		if (!(vmf->flags & FAULT_FLAG_TRIED))
+			fpin = do_async_mmap_readahead(vmf, page);
+		if (unlikely(!PageUptodate(page))) {
+			filemap_invalidate_lock_shared(mapping);
+			mapping_locked = true;
+		}
+	} else {
 		/* No page in the page cache at all */
 		count_vm_event(PGMAJFAULT);
 		count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
 		ret = VM_FAULT_MAJOR;
 		fpin = do_sync_mmap_readahead(vmf);
-	}
-
-	if (!page) {
 retry_find:
 		/*
 		 * See comment in filemap_create_page() why we need
@@ -3073,9 +3075,6 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
 			filemap_invalidate_unlock_shared(mapping);
 			return VM_FAULT_OOM;
 		}
-	} else if (unlikely(!PageUptodate(page))) {
-		filemap_invalidate_lock_shared(mapping);
-		mapping_locked = true;
 	}
 
 	if (!lock_page_maybe_drop_mmap(vmf, page, &fpin))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
