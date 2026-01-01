Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00820CECFBA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 01 Jan 2026 12:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w3xRRjkdhABK4kSy89qkpaXWnRkmEE/zGI548jG7bw=; b=UMNILPXUKMHTDeb8utGsbUtd9f
	KatMCr7Ld2r7DCeglEBi4gARGQfOZIj/rmWushV5hTe8F2crHm5QqA1mqa2zAij95ynID2Uit9IoW
	on/j+3KtrXyYxJ21B96fo9YoTclgmLQ9aXEmKfkDP9lkR+wHzhEyHvwdsIY8B4MY+WfM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vbGjN-0000C1-GF;
	Thu, 01 Jan 2026 11:20:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vbGjM-0000Br-Bz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jan 2026 11:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wRJ0M5Rhvpmu0SmgyWolmNnapBivis+1yU+V0txmr5I=; b=bPEZs2wAd2yA9xJsAYnwHBrlf6
 D/uch8yEdvBXNx7ByHveWXgsBaHDoe/hlR0sfle03lkI/Q8uuNq4t+wxeW2zjvYODN56Be/fLpjF2
 ufDGW5sSh6XnS9OY/Ha4SOhRCoayBzcAEjS/GBH42pJj+6z9g0GfycpNNcUSsWndU7nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wRJ0M5Rhvpmu0SmgyWolmNnapBivis+1yU+V0txmr5I=; b=NDNbgtVkDfd+0Go5Lh+XFiu//s
 Xn3E1xTBKzbKm/ApuqLpAMtX/jFfHSL0CCHUFTG7/xjxZjFTSK+Cy1CZXXwMUvr7XIUcFHoUvnLyU
 kz2KwS/1LRJt6l4MTtxdJlkwBaWf+e5qp7puc9DQ2Kyq6FmZCMqqblUhkpWDzapvaWcI=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vbGjL-0007NJ-3L for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jan 2026 11:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=wRJ0M5Rhvpmu0SmgyWolmNnapBivis+1yU+V0txmr5I=;
 b=hKpwsQv2V8ur+2YOqg5yPalrkiSWLpdmgTx+w09ssbNlaK+DgKPsEeJx8Qgukl
 8Pd32Y8wb0tI1d9kESkXgAsyky+LGcn/VI3O/EOwDS67UAZbvGexVa9KC0Qk2mbU
 wtqjJ0slifvOzPTnV7YuXf1J/9V7s5Yg92lynkVevz3SQ=
Received: from [IPV6:2409:8a20:4df7:2871:62a7:9187:4185:993d] (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wDn9_BtWFZplu2qBA--.64963S2; 
 Thu, 01 Jan 2026 19:20:13 +0800 (CST)
Message-ID: <a7f7efde-53e3-48c3-9caf-9410b018b1e1@126.com>
Date: Thu, 1 Jan 2026 19:20:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
 <0153ff69-789d-4fe1-a89c-0c607a9a7d6c@kernel.org>
 <aS3s98fgy80_xDuK@google.com> <aS4W7NBYFPwP6KEQ@google.com>
 <aS5RG6IQ8AlXrLwT@google.com>
 <0bf2eedd-eebb-440b-96f5-72ac3a68b608@kernel.org>
 <aThslGwzpYmEXzU5@google.com>
Content-Language: en-US
From: Nanzhe Zhao <nzzhao@126.com>
In-Reply-To: <aThslGwzpYmEXzU5@google.com>
X-CM-TRANSID: _____wDn9_BtWFZplu2qBA--.64963S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw13GFWUXF1rWw43AF47Arb_yoWrCFyDpF
 WDKas3KrWDXr48ur1IyF1kXr1S934rWF45uaykGw13AF1aqrnakF1kGa4YvFW2yrWxAFsa
 qw4Ygrykua1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UG4EiUUUUU=
X-Originating-IP: [2409:8a20:4df7:2871:62a7:9187:4185:993d]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBog4h8GlWWG4uzgAA3U
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Dear Kim: Happy New Year! > +static struct f2fs_folio_state
 * > +ffs_find_or_alloc(struct folio *folio) > +{ > + struct f2fs_folio_state
 *ffs = folio->private; > + > + if (ffs) > + return ffs;
 > + > + ffs = f2fs_kmem_cache_al [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.8 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vbGjL-0007NJ-3L
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Kim:
Happy New Year!

 > +static struct f2fs_folio_state *
 > +ffs_find_or_alloc(struct folio *folio)
 > +{
 > +	struct f2fs_folio_state *ffs = folio->private;
 > +
 > +	if (ffs)
 > +		return ffs;
 > +
 > +	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab, GFP_NOIO, true, NULL);
 > +
 > +	spin_lock_init(&ffs->state_lock);
 > +	folio_attach_private(folio, ffs);
 > +	return ffs;
 > +}

It looks like ffs_find_or_alloc() does not initialize
read_pages_pending.
When I debug locally, printing read_pages_pending shows an undefined
random value. Also, when I run a basic read test with dd, tasks can hang
(because read_pages_pending never reaches zero, so the folio is never
unlocked and never marked uptodate).

I know this function is modeled after iomap's ifs_alloc():

static struct iomap_folio_state *ifs_alloc(struct inode *inode,
					struct folio *folio, unsigned int flags)
{
	struct iomap_folio_state *ifs = folio->private;
	unsigned int nr_blocks = i_blocks_per_folio(inode, folio);
	gfp_t gfp;

	if (ifs || nr_blocks <= 1)
		return ifs;
	/*...*/
	/*
	 * ifs->state tracks two sets of state flags when the
	 * filesystem block size is smaller than the folio size.
	 * The first state tracks per-block uptodate and the
	 * second tracks per-block dirty state.
	 */
	ifs = kzalloc(struct_size(ifs, state,
		      BITS_TO_LONGS(2 * nr_blocks)), gfp);
	if (!ifs)
		return ifs;

	spin_lock_init(&ifs->state_lock);
	if (folio_test_uptodate(folio))
		bitmap_set(ifs->state, 0, nr_blocks);
	if (folio_test_dirty(folio))
		bitmap_set(ifs->state, nr_blocks, nr_blocks);
	folio_attach_private(folio, ifs);

	return ifs;
}

Note ifs_alloc() uses kzalloc(), which zero-initializes the allocated 
memory by default while f2fs_kmem_cache_alloc() does not.

We could fix this by explicitly setting read_pages_pending = 0,
or by doing a memset() right after f2fs_kmem_cache_alloc()
(the latter seems more extensible if the struct grows). What do you think?

 > 		/*
 > +		 * This page will go to BIO.  Do we need to send this
 > +		 * BIO off first?
 > +		 */
 > +		if (bio && (!page_is_mergeable(F2FS_I_SB(inode), bio,
 > +					last_block_in_bio, block_nr) ||
 > +			!f2fs_crypt_mergeable_bio(bio, inode, index, NULL))) {
 > +submit_and_realloc:
 > +			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 > +			bio = NULL;
 > +		}
 > +		if (bio == NULL)
 > +			bio = f2fs_grab_read_bio(inode, block_nr,
 > +					max_nr_pages,
 > +					f2fs_ra_op_flags(rac),
 > +					index, false);
 > +
 > +		/*
 > +		 * If the page is under writeback, we need to wait for
 > +		 * its completion to see the correct decrypted data.
 > +		 */
 > +		f2fs_wait_on_block_writeback(inode, block_nr);
 > +
 > +		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE,
 > +					offset << PAGE_SHIFT))
 > +			goto submit_and_realloc;
 > +
 > +		if (folio_test_large(folio)) {
 > +			ffs = ffs_find_or_alloc(folio);
 > +
 > +			/* set the bitmap to wait */
 > +			spin_lock_irq(&ffs->state_lock);
 > +			ffs->read_pages_pending++;
 > +			spin_unlock_irq(&ffs->state_lock);
 > +		}

In the current code, it looks like a subpage is added to the BIO (or a
cached BIO is submitted) before read_pages_pending is incremented.
This can cause the following behaviour:

After one subpage of a folio is submitted, if the I/O completes very
fast, the endio path may interrupt the read loop, run bio_endio, and
eventually call f2fs_finish_read_bio(), which decrements read_pages_pending
down to zero. That can make folio_finish_read() run too early, even 
though other parts of the same folio have not been added to a BIO yet.

I managed to trigger this locally by creating a heavily fragmented file
and temporarily injecting the following code right after BIO submission:

	f2fs_io_schedule_timeout(1);
	WARN_ON_ONCE(!folio_test_locked(folio));

I think the correct ordering is to increment read_pages_pending first,
and then add the corresponding subpage to the BIO.
In that ordering, the BIO side will either:
   1) add a subpage after the increment (matching the new pending count),
or
   2) submit a BIO that corresponds to the pending increment from the
      ** previous iteration **,
so read_pages_pending will not reach zero prematurely.
This is exactly the order that iomap_readpage_iter() implements.

If you need the script I used to reproduce the bug, please let me know.
I will attach it in my next reply. Thanks!

Best regards,
Nanzhe Zhao



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
