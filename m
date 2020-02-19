Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE33163B6B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:35:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4G9M-0006Fq-Rc; Wed, 19 Feb 2020 03:35:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j4G9L-0006Fj-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nwgY7Ko9KytWPPbg277Wodp+fpR6R4nK6+vgKlhTfbI=; b=e5lZV6MIqhTwUqgWLizHbFqlPI
 D46osnAex/CsFYX82BKfq7wTCUC1OC7uSEKlES4haQQT7TklwTgVPRXxN4giL+mtpWfGYWpDRBThF
 FkoEQyz+9Qs/eHGc3qCyZg1ZPI9EB/o7uQm5tvDt43LnibIolqRdDCk5J/FO72PnkQCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nwgY7Ko9KytWPPbg277Wodp+fpR6R4nK6+vgKlhTfbI=; b=ivqj3fyd+YurLhab+Ks/mFw8/R
 p0mVaRD3dIw1Irb21tjAT0FoAZaeMKevg4p0RWFTMv3ApBY5Ap4QTnwT4L2GX6CeTgkqJgFkXP3Yc
 N7wA1JcUczXv5WyDlbj2dDAuUUUIspwd1XLugOYmtqixV4Fg6Xv4z75Culc93nNgfYPQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4G9K-007svX-JA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:35:47 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C289424655;
 Wed, 19 Feb 2020 03:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582083336;
 bh=tdPejpHYKFC4AC7qPtDsJpaqp9EJYHzk8D60EwQzhSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ElD7YzTAqtfCH7VPiOSjO0VQ7eBxs4wRxvD3pjLlPFgwAetFyl/3WaRMgw8zOHRDt
 EY5gs7C2Q+GBr0W2OzmuLXEUkK7PJZnqEhcnRbhHR1Q1cwasPXcSJV3PrflwVOMZKi
 Ucc4HjJvPK81RYkjHtvKR2B38rKa1GS2CPovllcw=
Date: Tue, 18 Feb 2020 19:35:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219033534.GD1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-14-willy@infradead.org>
 <20200219031044.GA1075@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219031044.GA1075@sol.localdomain>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4G9K-007svX-JA
Subject: Re: [f2fs-dev] [PATCH v6 08/19] mm: Add readahead address space
 operation
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 18, 2020 at 07:10:44PM -0800, Eric Biggers wrote:
> On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> > diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> > index 7d4d09dd5e6d..81ab30fbe45c 100644
> > --- a/Documentation/filesystems/vfs.rst
> > +++ b/Documentation/filesystems/vfs.rst
> > @@ -706,6 +706,7 @@ cache in your filesystem.  The following members are defined:
> >  		int (*readpage)(struct file *, struct page *);
> >  		int (*writepages)(struct address_space *, struct writeback_control *);
> >  		int (*set_page_dirty)(struct page *page);
> > +		void (*readahead)(struct readahead_control *);
> >  		int (*readpages)(struct file *filp, struct address_space *mapping,
> >  				 struct list_head *pages, unsigned nr_pages);
> >  		int (*write_begin)(struct file *, struct address_space *mapping,
> > @@ -781,12 +782,24 @@ cache in your filesystem.  The following members are defined:
> >  	If defined, it should set the PageDirty flag, and the
> >  	PAGECACHE_TAG_DIRTY tag in the radix tree.
> >  
> > +``readahead``
> > +	Called by the VM to read pages associated with the address_space
> > +	object.  The pages are consecutive in the page cache and are
> > +	locked.  The implementation should decrement the page refcount
> > +	after starting I/O on each page.  Usually the page will be
> > +	unlocked by the I/O completion handler.  If the function does
> > +	not attempt I/O on some pages, the caller will decrement the page
> > +	refcount and unlock the pages for you.	Set PageUptodate if the
> > +	I/O completes successfully.  Setting PageError on any page will
> > +	be ignored; simply unlock the page if an I/O error occurs.
> > +
> 
> This is unclear about how "not attempting I/O" works and how that affects who is
> responsible for putting and unlocking the pages.  How does the caller know which
> pages were not attempted?  Can any arbitrary subset of pages be not attempted,
> or just the last N pages?
> 
> In the code, the caller actually uses readahead_for_each() to iterate through
> and put+unlock the pages.  That implies that ->readahead() must also use
> readahead_for_each() as well, in order for the iterator to be advanced
> correctly... Right?  And the ownership of each page is transferred to the callee
> when the callee advances the iterator past that page.
> 
> I don't see how ext4_readahead() and f2fs_readahead() can work at all, given
> that they don't advance the iterator.
> 

Yep, this patchset immediately crashes on boot with:

BUG: Bad page state in process swapper/0  pfn:02176
page:ffffea00000751d0 refcount:0 mapcount:0 mapping:ffff88807cba0400 index:0x0
ext4_da_aops name:"systemd"
flags: 0x100000000020001(locked|mappedtodisk)
raw: 0100000000020001 dead000000000100 dead000000000122 ffff88807cba0400
raw: 0000000000000000 0000000000000000 00000000ffffffff
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
bad because of flags: 0x1(locked)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2-00019-g7203ed9018cb9 #18
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20191223_100556-anatol 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x7a/0xaa lib/dump_stack.c:118
 bad_page.cold+0x89/0xba mm/page_alloc.c:649
 free_pages_check_bad+0x5d/0x60 mm/page_alloc.c:1050
 free_pages_check mm/page_alloc.c:1059 [inline]
 free_pages_prepare mm/page_alloc.c:1157 [inline]
 free_pcp_prepare+0x1c1/0x200 mm/page_alloc.c:1198
 free_unref_page_prepare mm/page_alloc.c:3011 [inline]
 free_unref_page+0x16/0x70 mm/page_alloc.c:3060
 __put_single_page mm/swap.c:81 [inline]
 __put_page+0x31/0x40 mm/swap.c:115
 put_page include/linux/mm.h:1029 [inline]
 ext4_mpage_readpages+0x778/0x9b0 fs/ext4/readpage.c:405
 ext4_readahead+0x2f/0x40 fs/ext4/inode.c:3242
 read_pages+0x4c/0x200 mm/readahead.c:126
 page_cache_readahead_limit+0x224/0x250 mm/readahead.c:241
 __do_page_cache_readahead mm/readahead.c:266 [inline]
 ra_submit mm/internal.h:62 [inline]
 ondemand_readahead+0x1df/0x4d0 mm/readahead.c:544
 page_cache_sync_readahead+0x2d/0x40 mm/readahead.c:579
 generic_file_buffered_read+0x77e/0xa90 mm/filemap.c:2029
 generic_file_read_iter+0xd4/0x130 mm/filemap.c:2302
 ext4_file_read_iter fs/ext4/file.c:131 [inline]
 ext4_file_read_iter+0x53/0x180 fs/ext4/file.c:114
 call_read_iter include/linux/fs.h:1897 [inline]
 new_sync_read+0x113/0x1a0 fs/read_write.c:414
 __vfs_read+0x21/0x30 fs/read_write.c:427
 vfs_read+0xcb/0x160 fs/read_write.c:461
 kernel_read+0x2c/0x40 fs/read_write.c:440
 prepare_binprm+0x14f/0x190 fs/exec.c:1589
 __do_execve_file.isra.0+0x4c0/0x800 fs/exec.c:1806
 do_execveat_common fs/exec.c:1871 [inline]
 do_execve+0x20/0x30 fs/exec.c:1888
 run_init_process+0xc8/0xcd init/main.c:1279
 try_to_run_init_process+0x10/0x36 init/main.c:1288
 kernel_init+0xac/0xfd init/main.c:1385
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Disabling lock debugging due to kernel taint
page:ffffea00000751d0 refcount:0 mapcount:0 mapping:ffff88807cba0400 index:0x0
ext4_da_aops name:"systemd"
flags: 0x100000000020001(locked|mappedtodisk)
raw: 0100000000020001 dead000000000100 dead000000000122 ffff88807cba0400
raw: 0000000000000000 0000000000000000 00000000ffffffff
page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)


I had to add:

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index e14841ade6122..cb982088b5225 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -401,8 +401,10 @@ int ext4_mpage_readpages(struct address_space *mapping,
 		else
 			unlock_page(page);
 	next_page:
-		if (rac)
+		if (rac) {
 			put_page(page);
+			readahead_next(rac);
+		}
 	}
 	if (bio)
 		submit_bio(bio);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 87964e4cb6b81..e16b0fe42e2e5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2238,8 +2238,10 @@ int f2fs_mpage_readpages(struct inode *inode, struct readahead_control *rac,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 next_page:
 #endif
-		if (rac)
+		if (rac) {
 			put_page(page);
+			readahead_next(rac);
+		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_compressed_file(inode)) {




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
