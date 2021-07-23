Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A473D3613
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 10:05:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6qBN-0007bn-KU; Fri, 23 Jul 2021 08:05:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m6qBI-0007bd-7S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pOoefm+z2PLYd1rkHuUNb0Ml9VcEd+dX3ojywHK4Pts=; b=Nya1YUJJLofjggnKI/IpbZk56G
 EwKa+0agahKMrSr/eZfH5egMgcbM0IQrI17iFJbCPZgdGtER8vC+UJJLUi9iPi2ar6q7ZBcUFgAFE
 scde+R0/ByRgxJi93HSn9byjlWoMmTZKqjWe8JguP9Um4y2nkrLUEUksGL2hgIe+Zo/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pOoefm+z2PLYd1rkHuUNb0Ml9VcEd+dX3ojywHK4Pts=; b=buNlr+C0ZGQRILuzkrJpeStlrP
 xzcqj815aeWzoPTAlnGKBbzEtXoYVC/3mxsYlvM23ZvMv7U5BUBJoJ/A1+xQBMeXHyOrtNMuW6SMJ
 Lsqmoha/7L11SFy6pRx87M0pAOJ7qikro0oWgdzquKFbtwurlg0pxW6rXHPujq1Tb+2o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6qBC-0005mX-22
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:05:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 543C660EBD;
 Fri, 23 Jul 2021 08:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627027504;
 bh=/W9QIIEUNToeuX48XLcyNEVSSAu2I80C1zls/gY1dBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qNxfeqQ/Z1CyZGlgBKytzW1O7c41Mk2W0b0ycup+6dDps26z9sWm0uko9E6x/1zKg
 x3jLijYwkcPNCqshg+xEiFWrPeU2MynG/pcMksRajMdzRovi6ypPlWMLgIXbIzWWsJ
 OmUMvVH8gUQaQr8ivtfGKpaVJ+Jh/9kqw4IFk+uf1zet0U0uKDzmFNnAkJHpYAb7WE
 YTUSdDrQSb5zUBRRWy+3GgQpUo+3Zc93PCAB+NoNIs5EnR6pofOYGVMfkHyrsAmmfQ
 KLyI2lfktDYg0arl1Vw5uu9oX0z9fCZ520lDOjd2vE9HHtXS3FJ3i+pSaAUruaAmEk
 5vrANOMfnQNmA==
Date: Fri, 23 Jul 2021 01:05:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YPp4LjpH3DgFQbdP@sol.localdomain>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-7-ebiggers@kernel.org>
 <YPU+3inGclUtcSpJ@infradead.org> <YPog4SDY3nNC78sK@sol.localdomain>
 <YPpM09DLTB28obqQ@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPpM09DLTB28obqQ@infradead.org>
X-Spam-Score: -1.6 (-)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6qBC-0005mX-22
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 23, 2021 at 06:00:03AM +0100, Christoph Hellwig wrote:
> On Thu, Jul 22, 2021 at 06:52:33PM -0700, Eric Biggers wrote:
> > I am trying to do this, but unfortunately I don't see a way to make it work
> > correctly in all cases.
> > 
> > The main problem is that when iomap_dio_rw() returns an error (other than
> > -EIOCBQUEUED), there is no way to know whether ->end_io() has been called or
> > not.  This is because iomap_dio_rw() can fail either early, before "starting"
> > the I/O (in which case ->end_io() won't have been called), or later, after
> > "starting" the I/O (in which case ->end_io() will have been called).  Note that
> > this can't be worked around by checking whether the iov_iter has been advanced
> > or not, since a failure could occur between "starting" the I/O and the iov_iter
> > being advanced for the first time.
> > 
> > Would you be receptive to adding a ->begin_io() callback to struct iomap_dio_ops
> > in order to allow filesystems to maintain counters like this?
> 
> I think we can triviall fix this by using the slightly lower level
> __iomap_dio_rw API.  Incremental patch to my previous one below:
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4fed90cc1462..11844bd0cb7a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4243,6 +4243,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>  	const loff_t pos = iocb->ki_pos;
>  	const size_t count = iov_iter_count(to);
> +	struct iomap_dio *dio;
>  	ssize_t ret;
>  
>  	if (count == 0)
> @@ -4260,8 +4261,13 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	}
>  
>  	inc_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
> -	ret = iomap_dio_rw(iocb, to, &f2fs_iomap_ops, &f2fs_iomap_dio_ops, 0);
> -
> +	dio = __iomap_dio_rw(iocb, to, &f2fs_iomap_ops, &f2fs_iomap_dio_ops, 0);
> +	if (IS_ERR_OR_NULL(dio)) {
> +		dec_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
> +		ret = PTR_ERR_OR_ZERO(dio);
> +	} else {
> +		ret = iomap_dio_complete(dio);
> +	}
>  	up_read(&fi->i_gc_rwsem[READ]);
>  
>  	file_accessed(file);
> @@ -4271,8 +4277,6 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	else if (ret == -EIOCBQUEUED)
>  		f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO,
>  				   count - iov_iter_count(to));
> -	else
> -		dec_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
>  out:
>  	trace_f2fs_direct_IO_exit(inode, pos, count, READ, ret);
>  	return ret;

I wouldn't call it trivial, but yes that seems to work (after fixing it to
handle EIOCBQUEUED correctly).  Take a look at the v2 I've sent out.  Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
