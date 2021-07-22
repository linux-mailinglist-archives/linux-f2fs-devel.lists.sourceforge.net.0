Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4F23D2DE9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 22:48:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6fbk-0002hU-Lz; Thu, 22 Jul 2021 20:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m6fbk-0002hM-At
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 20:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3kUE6RxJp6/gxEOKySvlq+AJmZmP2i4FoCg+EmsL+GA=; b=MhvJXQQ0Cgdsqcsrpc9X68wEns
 G4w3cMV+P91/NP43af5H3JdTKwN4RDFj1qqG0eXPkNnT5evWoYJLqa8W+v/0jUUdUYwwAXtXSioz8
 nDGN0VQYdvZfeRkuR40KgBnRrxLqXjW/OR+E6UF5b1WX1u+q9/CvyBnn8IuGCjkqfbLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3kUE6RxJp6/gxEOKySvlq+AJmZmP2i4FoCg+EmsL+GA=; b=d3sIL75zhvr0oFw9Zw43JL67Jw
 wKT05s27NGCSSHKMwzBAbq1lqzLraUXhGfkTYfh2TNgNTToVe/9yepN0TkkTL/HRCSCvpV0JMhzzH
 tNRbuawSM7yg7WWB2iUMKD5NKXQ3mgoXkt6PVTBCzwmNA/M6fBO1S7kGJJXTN4TL22/U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6fbe-0002iq-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 20:47:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91D0D60EB1;
 Thu, 22 Jul 2021 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626986860;
 bh=pGvSxhiZEcY6+C/PtZZ5RKkHCoa/6474xXrVF/SSIaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kTgSRXnsorFhgbBoMCRPRhM17JtAYMGrnr6PfWEHNoLEDJO777AEnnUNWWsV4uoPU
 QnMsSKfvSAGC+M7yVLKh24qK1h971BeJkKxZ2I/GB08KyDsP9bkIyyLVw2/H3Srxx1
 xknZMzsqn1ne/+9Csnnx98kormcCuIjD5/qwfkjPGy9B15IOC68Jzylfi2JrpVTaiZ
 MWeM5gS8bTNhVLeNma2tO8QIemSoSxr1uZsYw4xvAArjIvE5GUSwtVZ+tnd5SSozX2
 KhlFe33iaGHzWhbXLswxRYbzBzDU/omlWHs57+zDYtJA87m/IqfjtpWcT30ghvgrf0
 zgZYM3aYMwyYA==
Date: Thu, 22 Jul 2021 13:47:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YPnZa5dFVP7vtB9q@google.com>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-7-ebiggers@kernel.org>
 <YPU+3inGclUtcSpJ@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPU+3inGclUtcSpJ@infradead.org>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6fbe-0002iq-Bj
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: implement iomap operations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/19, Christoph Hellwig wrote:
> On Fri, Jul 16, 2021 at 09:39:16AM -0500, Eric Biggers wrote:
> > +static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
> > +				    struct bio *bio, loff_t file_offset)
> > +{
> > +	struct f2fs_private_dio *dio;
> > +	bool write = (bio_op(bio) == REQ_OP_WRITE);
> > +
> > +	dio = f2fs_kzalloc(F2FS_I_SB(inode),
> > +			sizeof(struct f2fs_private_dio), GFP_NOFS);
> > +	if (!dio)
> > +		goto out;
> > +
> > +	dio->inode = inode;
> > +	dio->orig_end_io = bio->bi_end_io;
> > +	dio->orig_private = bio->bi_private;
> > +	dio->write = write;
> > +
> > +	bio->bi_end_io = f2fs_dio_end_io;
> > +	bio->bi_private = dio;
> > +
> > +	inc_page_count(F2FS_I_SB(inode),
> > +			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> > +
> > +	return submit_bio(bio);
> 
> I don't think there is any need for this mess.  The F2FS_DIO_WRITE /
> F2FS_DIO_READ counts are only used to check if there is any inflight
> I/O at all.  So instead we can increment them once before calling
> iomap_dio_rw, and decrement them in ->end_io or for a failure/noop
> exit from iomap_dio_rw.  Untested patch below.  Note that all this
> would be much simpler to review if the last three patches were folded
> into a single one.

Eric, wdyt?

I've merged v1 to v5, including Christoph's comment in v2.

> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 4fbf28f5aaab..9f9cc49fbe94 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3369,50 +3369,6 @@ static int f2fs_write_end(struct file *file,
>  	return copied;
>  }
>  
> -static void f2fs_dio_end_io(struct bio *bio)
> -{
> -	struct f2fs_private_dio *dio = bio->bi_private;
> -
> -	dec_page_count(F2FS_I_SB(dio->inode),
> -			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> -
> -	bio->bi_private = dio->orig_private;
> -	bio->bi_end_io = dio->orig_end_io;
> -
> -	kfree(dio);
> -
> -	bio_endio(bio);
> -}
> -
> -static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
> -				    struct bio *bio, loff_t file_offset)
> -{
> -	struct f2fs_private_dio *dio;
> -	bool write = (bio_op(bio) == REQ_OP_WRITE);
> -
> -	dio = f2fs_kzalloc(F2FS_I_SB(inode),
> -			sizeof(struct f2fs_private_dio), GFP_NOFS);
> -	if (!dio)
> -		goto out;
> -
> -	dio->inode = inode;
> -	dio->orig_end_io = bio->bi_end_io;
> -	dio->orig_private = bio->bi_private;
> -	dio->write = write;
> -
> -	bio->bi_end_io = f2fs_dio_end_io;
> -	bio->bi_private = dio;
> -
> -	inc_page_count(F2FS_I_SB(inode),
> -			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> -
> -	return submit_bio(bio);
> -out:
> -	bio->bi_status = BLK_STS_IOERR;
> -	bio_endio(bio);
> -	return BLK_QC_T_NONE;
> -}
> -
>  void f2fs_invalidate_page(struct page *page, unsigned int offset,
>  							unsigned int length)
>  {
> @@ -4006,6 +3962,18 @@ const struct iomap_ops f2fs_iomap_ops = {
>  	.iomap_begin	= f2fs_iomap_begin,
>  };
>  
> +static int f2fs_dio_end_io(struct kiocb *iocb, ssize_t size, int error,
> +		unsigned flags)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(iocb->ki_filp));
> +
> +	if (iocb->ki_flags & IOCB_WRITE)
> +		dec_page_count(sbi, F2FS_DIO_WRITE);
> +	else
> +		dec_page_count(sbi, F2FS_DIO_READ);
> +	return 0;
> +}
> +
>  const struct iomap_dio_ops f2fs_iomap_dio_ops = {
> -	.submit_io	= f2fs_dio_submit_bio,
> +	.end_io		= f2fs_dio_end_io,
>  };
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6dbbac05a15c..abd521dc504a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1750,13 +1750,6 @@ struct f2fs_sb_info {
>  #endif
>  };
>  
> -struct f2fs_private_dio {
> -	struct inode *inode;
> -	void *orig_private;
> -	bio_end_io_t *orig_end_io;
> -	bool write;
> -};
> -
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
>  #define f2fs_show_injection_info(sbi, type)					\
>  	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6b8eac6b25d4..4fed90cc1462 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4259,6 +4259,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		down_read(&fi->i_gc_rwsem[READ]);
>  	}
>  
> +	inc_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
>  	ret = iomap_dio_rw(iocb, to, &f2fs_iomap_ops, &f2fs_iomap_dio_ops, 0);
>  
>  	up_read(&fi->i_gc_rwsem[READ]);
> @@ -4270,6 +4271,8 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	else if (ret == -EIOCBQUEUED)
>  		f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO,
>  				   count - iov_iter_count(to));
> +	else
> +		dec_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
>  out:
>  	trace_f2fs_direct_IO_exit(inode, pos, count, READ, ret);
>  	return ret;
> @@ -4446,6 +4449,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  
>  	if (pos + count > inode->i_size)
>  		dio_flags |= IOMAP_DIO_FORCE_WAIT;
> +	inc_page_count(F2FS_I_SB(inode), F2FS_DIO_WRITE);
>  	ret = iomap_dio_rw(iocb, from, &f2fs_iomap_ops, &f2fs_iomap_dio_ops,
>  			   dio_flags);
>  	if (ret == -ENOTBLK)
> @@ -4459,6 +4463,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  
>  	up_read(&fi->i_gc_rwsem[WRITE]);
>  
> +	if (ret <= 0 && ret != -EIOCBQUEUED)
> +		dec_page_count(F2FS_I_SB(inode), F2FS_DIO_WRITE);
> +
>  	if (ret < 0) {
>  		if (ret == -EIOCBQUEUED)
>  			f2fs_update_iostat(sbi, APP_DIRECT_IO,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
