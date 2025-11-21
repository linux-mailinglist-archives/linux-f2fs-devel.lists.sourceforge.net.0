Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D0C779AD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 07:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8BFOouPyk4VeRmzTJ69XPAFf3To4aVGzi98teX8cLc=; b=M+B2C8IvX1DtErCE0TzOmIhMQ8
	6QvsiBYjGGeJyMuqKIJ8r3ARYyF9VV4w7pD3Ly6ejR7Z+FAeS3mmt6bQAds8a9m/Z0ZL5qTpjAYxe
	PHOo7BSbX5506367qUqTPIQ4pYEh4t3uCsNVmj3kKYy23jyL6+IQde6OuMFZx2sJAf1A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMKxo-0004ZJ-4H;
	Fri, 21 Nov 2025 06:49:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8a242fb3b4bb83c2bb93+8125+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vMKxl-0004Yw-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 06:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Z2wSgy2zyNNpnV1+nFigOTTA+9f/wicUJMD/M0cv00=; b=Bqotq05xWPyFr+LiO1iF/xnZBi
 8NmKVK1SkKb5/Y5zEaDffinvBExMUMT2h1B8+zgurwbnnOwHYwNRajo4SjtV69zBKeeWWecsJRC7Z
 /GT+50S3UMbCGRU1FqqQo+kt4EzeTTqteamALWMTM1vr2qgj6V7sFFVSc2u3+NVMS2j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Z2wSgy2zyNNpnV1+nFigOTTA+9f/wicUJMD/M0cv00=; b=Pe+CkT2r2wQlQ/EI8UPPtBI02h
 QjTqnPOATE4uEd6ymF2TzPgS6VT0yZxjPRI+jTda1LXt+cybhyR58oXq8X7KnQYCwcNA8h954Kavc
 8Hm3OPglpEWyrC1WXSnyiKyNw6V84i5ixdOBgpBKhKVESuojXn2nRPkzkgYWFFHqfaro=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMKxl-00080I-Oy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 06:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6Z2wSgy2zyNNpnV1+nFigOTTA+9f/wicUJMD/M0cv00=; b=LfFscgXAyljwTAzbKdofiwBSIr
 YWYUsofssn/tG0skiwGrltv9b8ePvZePS7jNfK4RiziTFvUhkQwfCVX/Lhj34YMREUQNJtx3cnCgo
 7h6LtpoUjQ/SHzly93tP7y0XPAcX+U9M/upev6JqoLrk4y1DP9fa1XHxIggGAPOwcKCENGyKgCkoS
 l7IE7EycCTEb4p1yAlk1+4qtFZu0vsjCOPrWRmB2Rfq+uRivgN5cuIFXfFhaRUGjJTorUn1WlZCXR
 MePwiN9IDZ21Z1yUzef3f1Kaz1xYhy1CXVJqw8KHuyYeBDZBIBIgusRaoCC+kZf163AJiYgRPDfEr
 QKnUeDaw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vMKxa-00000007wJZ-1QWX;
 Fri, 21 Nov 2025 06:49:34 +0000
Date: Thu, 20 Nov 2025 22:49:34 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aSALfvLUObUGSx-e@infradead.org>
References: <20251121014202.1969909-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121014202.1969909-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 21, 2025 at 01:42:01AM +0000, Jaegeuk Kim wrote:
 > This patch boosts readahead for POSIX_FADV_WILLNEED. How? That's not a
 good changelog. Also open coding the read-ahead logic is not a good idea.
 The only f2fs-specific bits are the compression check,
 and the extent precaching, 
 but you surely should be able to share a read-ahead helper w [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vMKxl-00080I-Oy
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: improve readahead for
 POSIX_FADV_WILLNEED
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 21, 2025 at 01:42:01AM +0000, Jaegeuk Kim wrote:
> This patch boosts readahead for POSIX_FADV_WILLNEED.

How?  That's not a good changelog.

Also open coding the read-ahead logic is not a good idea.  The only
f2fs-specific bits are the compression check, and the extent precaching,
but you surely should be able to share a read-ahead helper with common
code instead of duplicating the logic.

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/file.c |  9 +++++---
>  3 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a0433c8a4d84..d95974d79fb3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2710,6 +2710,67 @@ static void f2fs_readahead(struct readahead_control *rac)
>  	f2fs_mpage_readpages(inode, rac, NULL);
>  }
>  
> +int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
> +{
> +	struct inode *inode = file_inode(file);
> +	struct address_space *mapping = file->f_mapping;
> +	pgoff_t start_index = offset >> PAGE_SHIFT;
> +	loff_t endbyte = offset + len;
> +	pgoff_t end_index;
> +	unsigned long nrpages;
> +	unsigned long ra_pages = (16 * 1024 * 1024) / PAGE_SIZE;
> +	DEFINE_READAHEAD(ractl, NULL, &file->f_ra, mapping, start_index);
> +
> +	if (!S_ISREG(inode->i_mode))
> +		return -EOPNOTSUPP;
> +
> +	/* Should be read only. */
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> +	/* Do not support compressed file for large folio. */
> +	if (f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	if (!mapping || len < 0)
> +		return -EINVAL;
> +
> +	if (unlikely(!mapping->a_ops->read_folio && !mapping->a_ops->readahead))
> +		return -EINVAL;
> +
> +	/* Load extent cache at the first readahead. */
> +	f2fs_precache_extents(inode);
> +
> +	/*
> +	 * Careful about overflows. Len == 0 means "as much as possible".  Use
> +	 * unsigned math because signed overflows are undefined and UBSan
> +	 * complains.
> +	 */
> +	if (!len || endbyte > i_size_read(inode) || endbyte < len)
> +		endbyte = i_size_read(inode) - 1;
> +	else
> +		endbyte--;		/* inclusive */
> +
> +	/* First and last PARTIAL page! */
> +	end_index = endbyte >> PAGE_SHIFT;
> +
> +	if (start_index > end_index)
> +		return 0;
> +
> +	nrpages = end_index - start_index + 1;
> +
> +	while (nrpages) {
> +		unsigned long this_chunk = min(nrpages, ra_pages);
> +
> +		ractl.ra->ra_pages = this_chunk;
> +
> +		page_cache_sync_ra(&ractl, this_chunk << 1);
> +
> +		nrpages -= this_chunk;
> +	}
> +	return 0;
> +}
> +
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  {
>  	struct inode *inode = fio_inode(fio);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3340db04a7c2..934287cc5624 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4047,6 +4047,7 @@ int f2fs_init_bio_entry_cache(void);
>  void f2fs_destroy_bio_entry_cache(void);
>  void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
>  			  enum page_type type);
> +int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len);
>  int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
>  void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
>  void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d7047ca6b98d..b6f71efd6d2a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5305,9 +5305,12 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>  		filp->f_mode &= ~FMODE_RANDOM;
>  		spin_unlock(&filp->f_lock);
>  		return 0;
> -	} else if (advice == POSIX_FADV_WILLNEED && offset == 0) {
> -		/* Load extent cache at the first readahead. */
> -		f2fs_precache_extents(inode);
> +	} else if (advice == POSIX_FADV_WILLNEED) {
> +		if (offset == 0 && len == -1) {
> +			f2fs_precache_extents(inode);
> +			return 0;
> +		}
> +		return f2fs_readahead_pages(filp, offset, len);
>  	}
>  
>  	err = generic_fadvise(filp, offset, len, advice);
> -- 
> 2.52.0.487.g5c8c507ade-goog
> 
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
