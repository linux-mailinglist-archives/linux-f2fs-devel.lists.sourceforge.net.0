Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F83AA4B74B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 05:52:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toxnI-0000l3-Vs;
	Mon, 03 Mar 2025 04:52:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1toxn8-0000kp-Tl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 04:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQw5ITGZgmCnNe/hk5hAVGzpx+dtW1jxF5kvbKk1odc=; b=MGXvTEEXyReCJtSuO2VzeioJ6s
 ubyVCKFQ/r/Pw+TDplodHcX/f0Uz3JIkcpcO1cV9nmmuZpg0/H4fay6o52BFfJJci074pj/KFL6Up
 4WRee8adtLzd8RczykQ0W5c83hRLnrES/siHjqXmZm8+1v4UaGpAxSfWfUuXnrIYJaHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQw5ITGZgmCnNe/hk5hAVGzpx+dtW1jxF5kvbKk1odc=; b=GQnk71yP4IUAVXrwlpfOZTNOkn
 Ys8OXQ9cv3w2lYaWLF2L2boKwkMKtiYndCFnKbUJfq7jTsIzXDEAQC+1L3ZEBzvDN70W2Sd4LtYwP
 rdvcf5VX6FuZUQ+Sfqk6suyobCUKc42smaT0k4D4HgpvKLZUXhTiUZT4FJ0G7xyZP5Io=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toxn2-000246-3a for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 04:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gQw5ITGZgmCnNe/hk5hAVGzpx+dtW1jxF5kvbKk1odc=; b=wSWLuwDLOx/IJZoMUiZ0yLVGD2
 SXj8j0XbeQNESMdMfbNuJ/QVGxN4Nv7yHkdEn7N+3JpX/8ziNQncpR0Ynhc9ODh2iuuCPpC3kv61t
 8rjAQdpbQbAWzTCoxuOwLB1/FUVQD5AGsxQsggfavZPHcTE5edeBdsE6rYCysG0CDwwi72ymLzyfH
 dzQuCzdW+sHYBawGMWiblgM+wgqcSyNDHs3069Cip0lO0QYSQUK+Ik36Kus3jjXRGyn0SuEkN/V6K
 oT2FaHsFenmKx8eADvCWxRiDakYpt37qIq4cAHLLtK2eargfP9WChI4J143zjK5At4HwKEibYNLvq
 yRBRqg6Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1toxmp-0000000Aadi-29RH; Mon, 03 Mar 2025 04:52:15 +0000
Date: Mon, 3 Mar 2025 04:52:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <Z8U1f4g5av7L1Tv-@casper.infradead.org>
References: <14bd34c8-8fe0-4440-8dfd-e71223303edc@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14bd34c8-8fe0-4440-8dfd-e71223303edc@gmx.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Adding Jens to the cc. As you well know, he added this code, 
 so I'm mystified why you didn't cc him. Also adding linux-fsdevel (I presume
 this was a mistake and you inadvertently cc'd f2fs-devel inste [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1toxn2-000246-3a
Subject: Re: [f2fs-dev] Calling folio_end_writeback() inside a spinlock
 under task context?
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Adding Jens to the cc.  As you well know, he added this code, so I'm
mystified why you didn't cc him.  Also adding linux-fsdevel (I presume
this was a mistake and you inadvertently cc'd f2fs-devel instead.)

On Mon, Mar 03, 2025 at 10:34:26AM +1030, Qu Wenruo wrote:
> [SPINLOCK AND END WRITEBACK]
> 
> Although folio_end_writeback() can be called in an interruption context
> (by the in_task() check), surprisingly it may not be suitable to be
> called inside a spinlock (in task context):

It's poor practice to do that; you're introducing a dependency between
your fs lock and the i_mapping lock, which is already pretty intertwined
with ... every other lock in the system.

> For example the following call chain can lead to sleep:
> 
> spin_lock()
> folio_end_writeback()
> |- folio_end_dropbehind_write()
>    |- folio_launder()
>       Which can sleep.
> 
> My question is, can and should we allow folio_end_writeback() inside a
> spinlock?
> 
> [BTRFS' ASYNC EXTENT PROBLEM]
> 
> This is again a btrfs specific behavior, that we have to call
> folio_end_writeback() inside a spinlock to make sure really only one
> thread can clear the writeback flag of a folio.
> 
> I know iomap is doing a pretty good job preventing early finished
> writeback to clear the folio writeback flag, meanwhile we're still
> submitting other blocks inside the folio.
> 
> Iomap goes holding one extra writeback count before starting marking
> blocks writeback and submitting them.
> And after all blocks are submitted, reduce the writeback count (and call
> folio_end_writeback() if it's the last one holding the writeback flag).
> 
> But the iomap solution requires that, all blocks inside a folio to be
> submitted at the same time.

I aactually don't like the iomap solution as it's currently written; it
just hasn't risen high enough up my todo list to fix it.

What we should do is initialise folio->ifs->write_bytes_pending to
bitmap_weight(ifs->state, blocks_per_folio) * block_size in
iomap_writepage_map() [this is oversimplified; we'd need to handle eof
and so on too]

That would address your problem as well as do fewer atomic operations.

> This is not true in btrfs, due to the design of btrfs' async extent,
> which can mark the blocks for writeback really at any timing, as we keep
> the lock of folios and queue them into a workqueue to do compression,
> then only after the compression is done, we submit and mark them
> writeback and unlock.
> 
> If we do not hold a spinlock calling folio_end_writeback(), but only
> checks if we're the last holder and call folio_end_writeback() out of
> the spinlock, we can hit the following race where folio_end_writeback()
> can be called on the same folio:
> 
>      0          32K         64K
>      |<- AE 1 ->|<- AE 2 ->|
> 
>             Thread A (AE 1)           |            Thread B (AE 2)
> --------------------------------------+------------------------------
> submit_one_async_extent()             |
> |- process_one_folio()                |
>      |- subpage_set_writeback()       |
>                                       |
> /* IO finished */                     |
> end_compressed_writeback()            |
> |- btrfs_folio_clear_writeback()      |
>      |- spin_lock()                   |
>      |  /* this is the last writeback |
>      |     holder, should end the     |
>      |     folio writeback flag */    |
>      |- last = true                   |
>      |- spin_unlock()                 |
>      |                                | submit_one_async_extent()
>      |                                | |- process_one_folio()
>      |                                |    |- subpage_set_writeback()

This seems weird.  Why are you setting the "subpage" writeback bit
while the folio writeback bit is still set?  That smells like a
bug-in-waiting if not an actual bug to me.  Surely it should wait on
the folio writeback bit to clear?

>      |                                | /* IO finished */
>      |                                | end_compressed_writeback()
>      |                                | |btrfs_folio_clear_writeback()
>      |                                |    | /* Again the last holder */
>      |                                |    |- spin_lock()
>      |                                |    |- last = true
>      |                                |    |- spin_unlock()
>      |- folio_end_writeback()         |    |- folio_end_writeback()
> 
> I know the most proper solution would to get rid of the delayed unlock
> and submission, but mark blocks for writeback without the async extent
> mechanism completely, then follow the iomap's solution.
> 
> But that will be a huge change (although we will go that path
> eventually), meanwhile the folio_end_writeback() inside spinlock needs
> to be fixed asap.

I'd suggest the asap solution is for btrfs to mark itself as not
supporting dropbehind.

> So my question is, can we allow folio_end_writeback() to be called
> inside a spinlock, at the cost of screwing up the folio reclaim for
> DONTCACHE?
> 
> Thanks,
> Qu
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
