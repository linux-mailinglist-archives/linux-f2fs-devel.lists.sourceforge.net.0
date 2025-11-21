Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D133C7B346
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 19:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vq1Tpzo90+/XmIw10aR2IFajN4rx6O3GtzVQz0ISIYg=; b=UMTI0ag8C/v4YHwVcAzJVavveW
	7C16NZdyfVejkkNs9RZxrH/e8HbVBo6qMdxdoDFAzrh4WRKRnANsZ4/z7lnphhFCcXvaJge50xEsJ
	2YzSj2gvYLHP4h06GY7NqRchJ9qdwLI8uPjkvZSvKasJAUArWt4txkgaapnADYxBZ+1o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMVVT-0002LS-EU;
	Fri, 21 Nov 2025 18:05:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMVVS-0002LC-6R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 18:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kC3icBuqtZ0GfaLUA3JxzPLWmRSzr8gw7aoWfCMFgK0=; b=J3TrWnsR3NKCPc6rQVc23uh/kS
 LiZKhSAsPmiRzvjDA5YHs/Yqt6TwwQm2HngqbZ9kuSJ9L1YLNiXFrgn2OabSy+WgdBKi7/mewWnG0
 A8tE5v7YVofIckOrtNhTgiu5I8xqEum/gJvN+fLFpBE06F00I37D/S6/ibPjs0Umfgag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kC3icBuqtZ0GfaLUA3JxzPLWmRSzr8gw7aoWfCMFgK0=; b=JpM2QMT3E7waCqmNWbkPw0QW6D
 FtWbnDsbIn3DkpEJXcNxVzISR1styVMMJtu/Z9YvH3pZPwAiccbJGhRQIo0q8Mb0+fTBrjgNUXlZ7
 FrGhZz9bzV7WDgFb5gfEPTG9u6b5hcDrrZS8Q+k/y2hjRtKQJ0L02hMVgyRqRPdl4i3U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMVVS-000800-Cj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 18:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B6090601B8;
 Fri, 21 Nov 2025 18:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231CCC116C6;
 Fri, 21 Nov 2025 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763748303;
 bh=6jQ6lGWb2XGclgEVJ+zij91b54xGPUPNrXP9Fgrtip4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aBgTcmnwJrZ1+/3QcGrLPplzwWBbMG+3sWVbJLN1FsK+6Kd7TvClQcCxFCTylY8zh
 bfV/FQTodj3YEi+N3PF57piWGirT4j0ZXDbtvQRA80cYog4nLcINqIjq4+8pVQlCEO
 diWY6pz2yAwitgblNOcfwLJCKnM02+OEkF4tkSSiusXhvzMDGAX+K+LiEMpobifCDa
 tAga5HiW01jocQrnJg4JeQVKaoFqpO1fukO2xgYHh/Hf+Ubi+MZ792YjRom0ISUGgL
 XRNkFcXIL5uYrSSuBvlL4gQPCkE0wTsQO2lFHsDOD58f+G8DRIuICTeZpXjS/gcaSO
 JOIzIy32Es22g==
Date: Fri, 21 Nov 2025 18:05:01 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <aSCpzRW8mUhNnjHB@google.com>
References: <20251121014202.1969909-1-jaegeuk@kernel.org>
 <aSALfvLUObUGSx-e@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSALfvLUObUGSx-e@infradead.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/20, Christoph Hellwig wrote: > On Fri, Nov 21, 2025
 at 01:42:01AM +0000, Jaegeuk Kim wrote: > > This patch boosts readahead for
 POSIX_FADV_WILLNEED. > > How? That's not a good changelog. > > Als [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMVVS-000800-Cj
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/20, Christoph Hellwig wrote:
> On Fri, Nov 21, 2025 at 01:42:01AM +0000, Jaegeuk Kim wrote:
> > This patch boosts readahead for POSIX_FADV_WILLNEED.
> 
> How?  That's not a good changelog.
> 
> Also open coding the read-ahead logic is not a good idea.  The only
> f2fs-specific bits are the compression check, and the extent precaching,
> but you surely should be able to share a read-ahead helper with common
> code instead of duplicating the logic.

Ok, let me try to write up and post a generic version of the changes.

> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/data.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/f2fs.h |  1 +
> >  fs/f2fs/file.c |  9 +++++---
> >  3 files changed, 68 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index a0433c8a4d84..d95974d79fb3 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -2710,6 +2710,67 @@ static void f2fs_readahead(struct readahead_control *rac)
> >  	f2fs_mpage_readpages(inode, rac, NULL);
> >  }
> >  
> > +int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
> > +{
> > +	struct inode *inode = file_inode(file);
> > +	struct address_space *mapping = file->f_mapping;
> > +	pgoff_t start_index = offset >> PAGE_SHIFT;
> > +	loff_t endbyte = offset + len;
> > +	pgoff_t end_index;
> > +	unsigned long nrpages;
> > +	unsigned long ra_pages = (16 * 1024 * 1024) / PAGE_SIZE;
> > +	DEFINE_READAHEAD(ractl, NULL, &file->f_ra, mapping, start_index);
> > +
> > +	if (!S_ISREG(inode->i_mode))
> > +		return -EOPNOTSUPP;
> > +
> > +	/* Should be read only. */
> > +	if (!(file->f_mode & FMODE_READ))
> > +		return -EBADF;
> > +
> > +	/* Do not support compressed file for large folio. */
> > +	if (f2fs_compressed_file(inode))
> > +		return -EINVAL;
> > +
> > +	if (!mapping || len < 0)
> > +		return -EINVAL;
> > +
> > +	if (unlikely(!mapping->a_ops->read_folio && !mapping->a_ops->readahead))
> > +		return -EINVAL;
> > +
> > +	/* Load extent cache at the first readahead. */
> > +	f2fs_precache_extents(inode);
> > +
> > +	/*
> > +	 * Careful about overflows. Len == 0 means "as much as possible".  Use
> > +	 * unsigned math because signed overflows are undefined and UBSan
> > +	 * complains.
> > +	 */
> > +	if (!len || endbyte > i_size_read(inode) || endbyte < len)
> > +		endbyte = i_size_read(inode) - 1;
> > +	else
> > +		endbyte--;		/* inclusive */
> > +
> > +	/* First and last PARTIAL page! */
> > +	end_index = endbyte >> PAGE_SHIFT;
> > +
> > +	if (start_index > end_index)
> > +		return 0;
> > +
> > +	nrpages = end_index - start_index + 1;
> > +
> > +	while (nrpages) {
> > +		unsigned long this_chunk = min(nrpages, ra_pages);
> > +
> > +		ractl.ra->ra_pages = this_chunk;
> > +
> > +		page_cache_sync_ra(&ractl, this_chunk << 1);
> > +
> > +		nrpages -= this_chunk;
> > +	}
> > +	return 0;
> > +}
> > +
> >  int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
> >  {
> >  	struct inode *inode = fio_inode(fio);
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 3340db04a7c2..934287cc5624 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4047,6 +4047,7 @@ int f2fs_init_bio_entry_cache(void);
> >  void f2fs_destroy_bio_entry_cache(void);
> >  void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
> >  			  enum page_type type);
> > +int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len);
> >  int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
> >  void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
> >  void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index d7047ca6b98d..b6f71efd6d2a 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -5305,9 +5305,12 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
> >  		filp->f_mode &= ~FMODE_RANDOM;
> >  		spin_unlock(&filp->f_lock);
> >  		return 0;
> > -	} else if (advice == POSIX_FADV_WILLNEED && offset == 0) {
> > -		/* Load extent cache at the first readahead. */
> > -		f2fs_precache_extents(inode);
> > +	} else if (advice == POSIX_FADV_WILLNEED) {
> > +		if (offset == 0 && len == -1) {
> > +			f2fs_precache_extents(inode);
> > +			return 0;
> > +		}
> > +		return f2fs_readahead_pages(filp, offset, len);
> >  	}
> >  
> >  	err = generic_fadvise(filp, offset, len, advice);
> > -- 
> > 2.52.0.487.g5c8c507ade-goog
> > 
> > 
> ---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
