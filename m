Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE943C6F2F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 13:12:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3GKh-0004qT-3A; Tue, 13 Jul 2021 11:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m3GKT-0004nk-KT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 11:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fyfxSkHG6hwIFaTZZwzH64axAQ9uhCZWiMEIgFfPd5w=; b=D+dHN0ejoS4MYUTFqAcjseyYQ9
 jroC+rE/b6jyB6hoyJH6fX23Y3TbA/O7wZUs8tVxMOmUYkWBKYTYrCtnn8USUGx1FOKVjRLQHzO/t
 47rx3fdy4n4e6pT9fLsifL7uMrUua51RqRW8nvpMTCka7yS74EFzlW08bt/XZoL1Cww0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fyfxSkHG6hwIFaTZZwzH64axAQ9uhCZWiMEIgFfPd5w=; b=LwbwvfMWQRWqCNafozN/akPtRR
 WPPUhmN5ZxFu842uByw5M9TBYfwf5Pyl7LsP2oV5Xg/mmL13UD4aghs0CFxM9f+AkqtkOeSQbwag4
 vLJOIFmT6e4ixxYbC0p6krDa7Z0090adu5JamV2QlPJPK3bxD6Ih0ETV3XYY2IrDi4S4=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m3GKJ-006rlR-91
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 11:11:57 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 661E4200A3;
 Tue, 13 Jul 2021 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626174699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fyfxSkHG6hwIFaTZZwzH64axAQ9uhCZWiMEIgFfPd5w=;
 b=SvCFB6+vDIf8Ufi+U+qCl/kMdXbumeGBaEqoXR+GZBRxhR4IDKqpE2c0zcGl+N6cCDC8KF
 gaoB2/+tuPOuB8ZdBQipnidL3m7Mjc9y7S9C1no9auhbaKrKdlQwuGXrskdgVasTkAXr73
 p1Bfi16wJBCyfh0qV9V2mtnDcHciz5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626174699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fyfxSkHG6hwIFaTZZwzH64axAQ9uhCZWiMEIgFfPd5w=;
 b=/S4tY5hsn1E8XhBz1UlPg/4OtMs32QpnHfCCGCeNU93DxE2frczkRaUERn0Wm77094ed5w
 9YjLrvb5LCzD1LBQ==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 39890A3B85;
 Tue, 13 Jul 2021 11:11:39 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 159D21E0BBC; Tue, 13 Jul 2021 13:11:39 +0200 (CEST)
Date: Tue, 13 Jul 2021 13:11:39 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210713111139.GG12142@quack2.suse.cz>
References: <20210712163901.29514-1-jack@suse.cz>
 <20210712165609.13215-3-jack@suse.cz>
 <20210713012514.GB22402@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713012514.GB22402@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m3GKJ-006rlR-91
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
Cc: linux-xfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-cifs@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 12-07-21 18:25:14, Darrick J. Wong wrote:
> On Mon, Jul 12, 2021 at 06:55:54PM +0200, Jan Kara wrote:
> > @@ -2967,6 +2992,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> >  	pgoff_t max_off;
> >  	struct page *page;
> >  	vm_fault_t ret = 0;
> > +	bool mapping_locked = false;
> >  
> >  	max_off = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> >  	if (unlikely(offset >= max_off))
> > @@ -2988,15 +3014,30 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> >  		count_memcg_event_mm(vmf->vma->vm_mm, PGMAJFAULT);
> >  		ret = VM_FAULT_MAJOR;
> >  		fpin = do_sync_mmap_readahead(vmf);
> > +	}
> > +
> > +	if (!page) {
> 
> Is it still necessary to re-evaluate !page here?

No, you are right it is not necessary. I'll remove it.

> >  retry_find:
> > +		/*
> > +		 * See comment in filemap_create_page() why we need
> > +		 * invalidate_lock
> > +		 */
> > +		if (!mapping_locked) {
> > +			filemap_invalidate_lock_shared(mapping);
> > +			mapping_locked = true;
> > +		}
> >  		page = pagecache_get_page(mapping, offset,
> >  					  FGP_CREAT|FGP_FOR_MMAP,
> >  					  vmf->gfp_mask);
> >  		if (!page) {
> >  			if (fpin)
> >  				goto out_retry;
> > +			filemap_invalidate_unlock_shared(mapping);
> >  			return VM_FAULT_OOM;
> >  		}
> > +	} else if (unlikely(!PageUptodate(page))) {
> > +		filemap_invalidate_lock_shared(mapping);
> > +		mapping_locked = true;
> >  	}
> >  
> >  	if (!lock_page_maybe_drop_mmap(vmf, page, &fpin))
> > @@ -3014,8 +3055,20 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> >  	 * We have a locked page in the page cache, now we need to check
> >  	 * that it's up-to-date. If not, it is going to be due to an error.
> >  	 */
> > -	if (unlikely(!PageUptodate(page)))
> > +	if (unlikely(!PageUptodate(page))) {
> > +		/*
> > +		 * The page was in cache and uptodate and now it is not.
> > +		 * Strange but possible since we didn't hold the page lock all
> > +		 * the time. Let's drop everything get the invalidate lock and
> > +		 * try again.
> > +		 */
> > +		if (!mapping_locked) {
> > +			unlock_page(page);
> > +			put_page(page);
> > +			goto retry_find;
> > +		}
> >  		goto page_not_uptodate;
> > +	}
> >  
> >  	/*
> >  	 * We've made it this far and we had to drop our mmap_lock, now is the
> > @@ -3026,6 +3079,8 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> >  		unlock_page(page);
> >  		goto out_retry;
> >  	}
> > +	if (mapping_locked)
> > +		filemap_invalidate_unlock_shared(mapping);
> >  
> >  	/*
> >  	 * Found the page and have a reference on it.
> > @@ -3056,6 +3111,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> >  
> >  	if (!error || error == AOP_TRUNCATED_PAGE)
> >  		goto retry_find;
> > +	filemap_invalidate_unlock_shared(mapping);
> 
> Hm.  I /think/ it's the case that mapping_locked==true always holds here
> because the new "The page was in cache and uptodate and now it is not."
> block above will take the invalidate_lock and retry pagecache_get_page,
> right?

Yes. page_not_uptodate block can only be entered with mapping_locked ==
true - the only place that can enter this block is:

        if (unlikely(!PageUptodate(page))) {
                /*
                 * The page was in cache and uptodate and now it is not.
                 * Strange but possible since we didn't hold the page lock all
                 * the time. Let's drop everything get the invalidate lock and
                 * try again.
                 */
                if (!mapping_locked) {
                        unlock_page(page);
                        put_page(page);
                        goto retry_find;
                }
                goto page_not_uptodate;
        }

> >  
> >  	return VM_FAULT_SIGBUS;
> >  
> > @@ -3067,6 +3123,8 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
> >  	 */
> >  	if (page)
> >  		put_page(page);
> > +	if (mapping_locked)
> > +		filemap_invalidate_unlock_shared(mapping);
> 
> Hm.  I think this looks ok, even though this patch now contains the
> subtlety that we've both hoisted the xfs mmaplock to page cache /and/
> reduced the scope of the invalidate_lock.
> 
> As for fancy things like remap_range, I think they're still safe with
> this latest iteration because those functions grab the invalidate_lock
> in exclusive mode and invalidate the mappings before proceeding, which
> means that other programs will never find the lockless path (i.e. page
> locked, uptodate, and attached to the mapping) and will instead block on
> the invalidate lock until the remap operation completes.   Is that
> right?

Correct. For operations such as hole punch or destination of remap_range,
we lock invalidate_lock exclusively and invalidate pagecache in the
involved range. No new pages can be created in that range until you drop
invalidate_lock (places creating pages without holding i_rwsem are read,
readahead, fault and all those take invalidate_lock when they should create
the page).

There's also the case someone pointed out that *source* of remap_range
needs to be protected (but only from modifications through mmap). This is
achieved by having invalidate_lock taken in .page_mkwrite handlers and
thus not impacted by these changes to filemap_fault().

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
