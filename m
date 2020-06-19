Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF8E20082B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 13:56:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmFcw-0006lS-L1; Fri, 19 Jun 2020 11:56:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jmFcu-0006kt-GN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 11:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qkiSuMBHq1jJPg79H69BLQzOTNgh3NSXy1sjSUD7sso=; b=bDvuVociXwWhmwmSGq+s+iwUn4
 c/x0/WWwtyeRZohXu5rhfSuMeeayz9zCN1q50VdDJww6AmAAdEpUgsJza1GhO1CD0MTwl2aNBZ4Ax
 puis8kfHMXxyw8yfVugP5oPwaJzI0t7JPOSwopK8ZlvCCaogWDmPRhzG6Uk7kGSjzBz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qkiSuMBHq1jJPg79H69BLQzOTNgh3NSXy1sjSUD7sso=; b=VJQIusxTCLW2NyvgkwLZ9w/zD+
 2PYeGyHP0IXgERmNYHdIfa6kUD5atDbQGABIPRZm22BbfTVCYqG+dg2kufJfB3iFgKlNZGSnA8HkE
 1xB0goPozuI6RMpmJ/kBp/aFW7XhkgBWXlgbVz+mz0bduxEQvz9dHnw4tkjrRnMGaqGQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmFcs-008wDO-QC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 11:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qkiSuMBHq1jJPg79H69BLQzOTNgh3NSXy1sjSUD7sso=; b=YmQH+Tq34JCOA4Fpp+Ct6KEZnt
 8L0h3XQhFTfcl+EZx9PD/QmFfjIZnpy4HoPgNnfBqHv64Iq5KfuRrtvHpLcfBtAlvvzZLZIa6wd8f
 WBdUMayWL2szYgJzuQAOr0qIZuM5ocftxFPIzNGVjJSWVMSlvpoZeOYI4S4AGQO8Nb0yis8YPFDTs
 gFrJkRAnXtTDuea5wOUzzuns5noEUpSfRbZfvMS0JhmrqudLco3NaWgMJzebBPpoOvVOvwgRaFW3F
 NclEHximP3q4U57rebPA25c4PcGKBj5TM+IBkvwcGuWphYM+ITP6Po2I7wixaC/wuvOd6BghDK1It
 5dgYN/wg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jmFcc-0002c8-O0; Fri, 19 Jun 2020 11:55:50 +0000
Date: Fri, 19 Jun 2020 04:55:50 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200619115550.GY8681@bombadil.infradead.org>
References: <20200619093916.1081129-1-agruenba@redhat.com>
 <20200619093916.1081129-3-agruenba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619093916.1081129-3-agruenba@redhat.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmFcs-008wDO-QC
Subject: Re: [f2fs-dev] [PATCH 2/2] gfs2: Rework read and page fault locking
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
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 19, 2020 at 11:39:16AM +0200, Andreas Gruenbacher wrote:
>  static int gfs2_readpage(struct file *file, struct page *page)
>  {
> -	struct address_space *mapping = page->mapping;
> -	struct gfs2_inode *ip = GFS2_I(mapping->host);
> -	struct gfs2_holder gh;
>  	int error;
>  
> -	unlock_page(page);
> -	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> -	error = gfs2_glock_nq(&gh);
> -	if (unlikely(error))
> -		goto out;
> -	error = AOP_TRUNCATED_PAGE;
> -	lock_page(page);
> -	if (page->mapping == mapping && !PageUptodate(page))
> -		error = __gfs2_readpage(file, page);
> -	else
> -		unlock_page(page);
> -	gfs2_glock_dq(&gh);
> -out:
> -	gfs2_holder_uninit(&gh);
> -	if (error && error != AOP_TRUNCATED_PAGE)
> +	error = __gfs2_readpage(file, page);
> +	if (error)
>  		lock_page(page);
>  	return error;

I don't think this is right.  If you return an error from ->readpage, I'm
pretty sure you're supposed to unlock that page.  Looking at
generic_file_buffered_read():

                error = mapping->a_ops->readpage(filp, page);
                if (unlikely(error)) {
                        if (error == AOP_TRUNCATED_PAGE) {
                                put_page(page);
                                error = 0;
                                goto find_page;
                        }
                        goto readpage_error;
                }
...
readpage_error:
                put_page(page);
                goto out;
...
out:
        ra->prev_pos = prev_index;
        ra->prev_pos <<= PAGE_SHIFT;
        ra->prev_pos |= prev_offset;

        *ppos = ((loff_t)index << PAGE_SHIFT) + offset;
        file_accessed(filp);
        return written ? written : error;

so we don't call unlock_page() in generic code, which means the next time
we try to get this page, we'll do ...

                page = find_get_page(mapping, index);
...
                if (!PageUptodate(page)) {
                        error = wait_on_page_locked_killable(page);
and presumably we'll wait forever because nobody is going to unlock this
page?

> @@ -598,16 +582,9 @@ static void gfs2_readahead(struct readahead_control *rac)
>  {
>  	struct inode *inode = rac->mapping->host;
>  	struct gfs2_inode *ip = GFS2_I(inode);
> -	struct gfs2_holder gh;
>  
> -	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
> -	if (gfs2_glock_nq(&gh))
> -		goto out_uninit;
>  	if (!gfs2_is_stuffed(ip))
>  		mpage_readahead(rac, gfs2_block_map);
> -	gfs2_glock_dq(&gh);
> -out_uninit:
> -	gfs2_holder_uninit(&gh);
>  }

Not for this patch, obviously, but why do you go to the effort of using
iomap_readpage() to implement gfs2_readpage(), but don't use iomap for
gfs2_readahead()?  Far more pages are brought in through ->readahead
than are brought in through ->readpage.

>  static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  {
> +	struct gfs2_inode *ip;
> +	struct gfs2_holder gh;
> +	size_t written = 0;
>  	ssize_t ret;
>  
> +	gfs2_holder_mark_uninitialized(&gh);
>  	if (iocb->ki_flags & IOCB_DIRECT) {
>  		ret = gfs2_file_direct_read(iocb, to);

Again, future work, but you probably want to pass in &gh here so you
don't have to eat up another 32 bytes or so of stack space on an unused
gfs2_holder.

>  		if (likely(ret != -ENOTBLK))
>  			return ret;
>  		iocb->ki_flags &= ~IOCB_DIRECT;
>  	}
> -	return generic_file_read_iter(iocb, to);
> +	iocb->ki_flags |= IOCB_CACHED;
> +	ret = generic_file_read_iter(iocb, to);
> +	iocb->ki_flags &= ~IOCB_CACHED;
> +	if (ret >= 0) {
> +		if (!iov_iter_count(to))
> +			return ret;
> +		written = ret;
> +	} else {
> +		switch(ret) {
> +		case -EAGAIN:
> +			if (iocb->ki_flags & IOCB_NOWAIT)
> +				return ret;
> +			break;
> +		case -ECANCELED:
> +			break;
> +		default:
> +			return ret;
> +		}
> +	}

I'm wondering if we want to do this in common code rather than making it
something special only a few filesystems do (either because they care
about workloads with many threads accessing the same file, or because
their per-file locks are very heavy-weight).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
