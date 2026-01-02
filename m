Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6CCCEDAE3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 02 Jan 2026 07:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkHhTyXkxk7CI1ApmzeAMDefgJTaQp4hyM9QO60CvKQ=; b=YlAyeRC34yafh/W/A1TKmuAdUp
	374l0lTcvJtYUiZVlzy0IyLEG2v4hTWrQkQcxJ46ppZTAA7NUWLAiq17mqKbGrZy4dKbRAInE9g5u
	eBACzo2vFHPNfKpbG9d0MnNlUG2wbnoMX2hfSh0V8q4r6p01GPq5ep/SQj5RIEH3pd00=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vbYZ8-0008DN-I3;
	Fri, 02 Jan 2026 06:23:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vbYZ8-0008DH-62
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jan 2026 06:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=my8UVD9cbneSGKC6YDwOralvyRNTFnfMC6VqP7rP4UU=; b=inXxzB5Yn3QvacMcEkLKfaqOcA
 cbx1vtIg/BOLXVPIP6/jkRHJgW67x1bZZHm6VN66XdGvVtUURzJsUyKsRIhT3rJumUdOXTDt1IDv8
 DXH4QbME3OIlD+2eb8ZTyx2yDZ4WaDyHR5f+WQNVyAOZ/JN+Fp+xQDVUeMk7NpCDp2AM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=my8UVD9cbneSGKC6YDwOralvyRNTFnfMC6VqP7rP4UU=; b=EmvCB/DPa66GMWHbt1rrLBS9eW
 WXOjr+2fM9wAEIVif4QYojMpUs7JlKnkpOI/Ptp1/tk1olBdWUJYJjwFIJdYBw5CuQhZ8vkhkTV67
 hMyn6epJrJQnq2zIAQiF1D99fkUwaLBaM6DUVGmF2ObIKMirDxmupt5bVLL6OKg2DxfA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vbYZ7-0002mE-Ik for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jan 2026 06:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D68BA60017;
 Fri,  2 Jan 2026 06:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27784C116B1;
 Fri,  2 Jan 2026 06:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767334987;
 bh=SquersrdPm+OMwz4o28/QmCjQ1yhrhLHwIGGCtA6EZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pylf3dWyAtxpJkwEuMqmERtttl/1/mDcxanb2h20rp/Y5kRQ6dvByXggn/+N5VyXM
 bfGTFqaPD5lMaD3t+FGwgrzxMXbgR7MFoMeaF6uGyEJvd/WueRxdSqOSPZWbIVOAcF
 WwASZffGaxH7tCQR89mbpQV5p8n1UfV734fqoUG/r5wgc5WN96W0cPkvbfT1hykNs4
 /nY0aI76//4kPHITXSFuT/xzRckjyTWYF73tbH8nXecL2ma3IeMQD86ZTcnl+5tilB
 HD/fetDVMtc0mtcqwAoFOg1gwLkhkuPZXO4O/j372jHR+iSTLecCfierr3NRdVQGhW
 6P2Nlt84UHkCQ==
Date: Fri, 2 Jan 2026 06:23:05 +0000
To: Nanzhe Zhao <nzzhao@126.com>
Message-ID: <aVdkSZeuwzsNq7pE@google.com>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <0153ff69-789d-4fe1-a89c-0c607a9a7d6c@kernel.org>
 <aS3s98fgy80_xDuK@google.com> <aS4W7NBYFPwP6KEQ@google.com>
 <aS5RG6IQ8AlXrLwT@google.com>
 <0bf2eedd-eebb-440b-96f5-72ac3a68b608@kernel.org>
 <aThslGwzpYmEXzU5@google.com>
 <a7f7efde-53e3-48c3-9caf-9410b018b1e1@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7f7efde-53e3-48c3-9caf-9410b018b1e1@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Nanzhe, On 01/01, Nanzhe Zhao wrote: > Dear Kim: > Happy
 New Year! > > > +static struct f2fs_folio_state * > >
 +ffs_find_or_alloc(struct
 folio *folio) > > +{ > > + struct f2fs_folio_state *ffs = folio->privat [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vbYZ7-0002mE-Ik
Subject: Re: [f2fs-dev] [PATCH 1/2 v4] f2fs: support large folio for
 immutable non-compressed case
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Nanzhe,

On 01/01, Nanzhe Zhao wrote:
> Dear Kim:
> Happy New Year!
> 
> > +static struct f2fs_folio_state *
> > +ffs_find_or_alloc(struct folio *folio)
> > +{
> > +	struct f2fs_folio_state *ffs = folio->private;
> > +
> > +	if (ffs)
> > +		return ffs;
> > +
> > +	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab, GFP_NOIO, true, NULL);
> > +
> > +	spin_lock_init(&ffs->state_lock);
> > +	folio_attach_private(folio, ffs);
> > +	return ffs;
> > +}
> 
> It looks like ffs_find_or_alloc() does not initialize
> read_pages_pending.
> When I debug locally, printing read_pages_pending shows an undefined
> random value. Also, when I run a basic read test with dd, tasks can hang
> (because read_pages_pending never reaches zero, so the folio is never
> unlocked and never marked uptodate).
> 
> I know this function is modeled after iomap's ifs_alloc():
> 
> static struct iomap_folio_state *ifs_alloc(struct inode *inode,
> 					struct folio *folio, unsigned int flags)
> {
> 	struct iomap_folio_state *ifs = folio->private;
> 	unsigned int nr_blocks = i_blocks_per_folio(inode, folio);
> 	gfp_t gfp;
> 
> 	if (ifs || nr_blocks <= 1)
> 		return ifs;
> 	/*...*/
> 	/*
> 	 * ifs->state tracks two sets of state flags when the
> 	 * filesystem block size is smaller than the folio size.
> 	 * The first state tracks per-block uptodate and the
> 	 * second tracks per-block dirty state.
> 	 */
> 	ifs = kzalloc(struct_size(ifs, state,
> 		      BITS_TO_LONGS(2 * nr_blocks)), gfp);
> 	if (!ifs)
> 		return ifs;
> 
> 	spin_lock_init(&ifs->state_lock);
> 	if (folio_test_uptodate(folio))
> 		bitmap_set(ifs->state, 0, nr_blocks);
> 	if (folio_test_dirty(folio))
> 		bitmap_set(ifs->state, nr_blocks, nr_blocks);
> 	folio_attach_private(folio, ifs);
> 
> 	return ifs;
> }
> 
> Note ifs_alloc() uses kzalloc(), which zero-initializes the allocated memory
> by default while f2fs_kmem_cache_alloc() does not.
> 
> We could fix this by explicitly setting read_pages_pending = 0,
> or by doing a memset() right after f2fs_kmem_cache_alloc()
> (the latter seems more extensible if the struct grows). What do you think?

Agreed. What about adding __GFP_ZERO for f2fs_kmem_cache_alloc()?

> 
> > 		/*
> > +		 * This page will go to BIO.  Do we need to send this
> > +		 * BIO off first?
> > +		 */
> > +		if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
> > +					last_block_in_bio, block_nr) ||
> > +			!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
> > +submit_and_realloc:
> > +			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> > +			bio = NULL;
> > +		}
> > +		if (bio == NULL)
> > +			bio = f2fs_grab_read_bio(inode, block_nr,
> > +					max_nr_pages,
> > +					f2fs_ra_op_flags(rac),
> > +					index, false);
> > +
> > +		/*
> > +		 * If the page is under writeback, we need to wait for
> > +		 * its completion to see the correct decrypted data.
> > +		 */
> > +		f2fs_wait_on_block_writeback(inode, block_nr);
> > +
> > +		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
> > +					offset << PAGE_SHIFT))
> > +			goto submit_and_realloc;
> > +
> > +		if (folio_test_large(folio)) {
> > +			ffs = ffs_find_or_alloc(folio);
> > +
> > +			/* set the bitmap to wait */
> > +			spin_lock_irq(&ffs->state_lock);
> > +			ffs->read_pages_pending++;
> > +			spin_unlock_irq(&ffs->state_lock);
> > +		}
> 
> In the current code, it looks like a subpage is added to the BIO (or a
> cached BIO is submitted) before read_pages_pending is incremented.
> This can cause the following behaviour:
> 
> After one subpage of a folio is submitted, if the I/O completes very
> fast, the endio path may interrupt the read loop, run bio_endio, and
> eventually call f2fs_finish_read_bio(), which decrements read_pages_pending
> down to zero. That can make folio_finish_read() run too early, even though
> other parts of the same folio have not been added to a BIO yet.
> 
> I managed to trigger this locally by creating a heavily fragmented file
> and temporarily injecting the following code right after BIO submission:
> 
> 	f2fs_io_schedule_timeout(1);
> 	WARN_ON_ONCE(!folio_test_locked(folio));
> 
> I think the correct ordering is to increment read_pages_pending first,
> and then add the corresponding subpage to the BIO.
> In that ordering, the BIO side will either:
>   1) add a subpage after the increment (matching the new pending count),
> or
>   2) submit a BIO that corresponds to the pending increment from the
>      ** previous iteration **,
> so read_pages_pending will not reach zero prematurely.
> This is exactly the order that iomap_readpage_iter() implements.
> 
> If you need the script I used to reproduce the bug, please let me know.
> I will attach it in my next reply. Thanks!

I think this is also valid. If possible, could you please post patches to
fix these two bugs?

Thanks,

> 
> Best regards,
> Nanzhe Zhao
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
