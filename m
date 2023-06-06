Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 167237233EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 02:04:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6KBS-0000PC-Qe;
	Tue, 06 Jun 2023 00:04:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1q6KBR-0000P6-Nm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 00:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1c/PGvnM2AArs48812YAruot+zBOAvMou0BFxMQK/0=; b=URTH5/7C/aXmxsQE5rysbJqMuF
 xFFAjJLhF0VMmTnHUeu2b1Na+Jn8GL2zJx11f2W9v9MlRT9yyzgxk+s58bz68QQlEIf4Y77UUQHks
 ie1fdntabaLWuGeTvpLTCjpYZIw3nD2LOkRv5GtgaxW6r7C3P+ptL3kIlyvv1pvEhcco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f1c/PGvnM2AArs48812YAruot+zBOAvMou0BFxMQK/0=; b=J1UoJYt6rEDVOeQCYr+TlwN70N
 osTRaAnzM3tOGniIXPYLUKvm18+IIs1XhbVdxf7XmRCkYkp3RNhVCabfc4Zh3FTqaFWEsXNOLzrp6
 20g5hcxe6kSLGPqw2868oJ7aV44pMNCCvqDXDakXo7hv4+Gzmwu8r/WbV/rtmGuZK7ag=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6KBR-00CGYH-5J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 00:04:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B14F762B4F;
 Tue,  6 Jun 2023 00:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1C3C433D2;
 Tue,  6 Jun 2023 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686009855;
 bh=xPqDBnA9crfcda+QJHDEogmu65T/ezefUhM18Debbm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ddPmBSXSMvlY9x94xIIznZYGaNuipQq3VI72KC0oXDBKaGeDQjKtRJmfrsGmehWvO
 +dPcgrPTfGtR6It+kcXJltBdEm6/kbNCqegUMdcjJLpThWScaZHuyrI92e+KxL5eSE
 6UYfqRlb93ixurnxyFXwOAH/gstR61UDyavP5IbH3jiHC6gYnE66jfhBxNASdfvKoO
 3g91Y67k3IwVIP5kIbGlNmjoUpg38PKL0tJCWBDOdkxq0zpo0hU4ztLFtuUy69XDvZ
 pgOw60wCPj40tpC46Ad5a91ebl7gCGcJ/iJcwmK8v80Pnvc61AL6XuQN4t+34IdDjQ
 mC0Xvp8bW0hvA==
Date: Mon, 5 Jun 2023 17:04:14 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230606000414.GJ1325469@frogsfrogsfrogs>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601145904.1385409-10-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 04:59:01PM +0200, Christoph Hellwig
 wrote: > Add a helper dealing with handling the syncing of a buffered write
 fallback > for direct I/O. > > Signed-off-by: Christoph Hellwig [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6KBR-00CGYH-5J
Subject: Re: [f2fs-dev] [PATCH 09/12] fs: factor out a direct_write_fallback
 helper
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
Cc: linux-mm@kvack.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 01, 2023 at 04:59:01PM +0200, Christoph Hellwig wrote:
> Add a helper dealing with handling the syncing of a buffered write fallback
> for direct I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>

Looks good to me; whose tree do you want this to go through?

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/libfs.c         | 41 ++++++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  mm/filemap.c       | 66 +++++++++++-----------------------------------
>  3 files changed, 58 insertions(+), 51 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 89cf614a327158..5b851315eeed03 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1613,3 +1613,44 @@ u64 inode_query_iversion(struct inode *inode)
>  	return cur >> I_VERSION_QUERIED_SHIFT;
>  }
>  EXPORT_SYMBOL(inode_query_iversion);
> +
> +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> +		ssize_t direct_written, ssize_t buffered_written)
> +{
> +	struct address_space *mapping = iocb->ki_filp->f_mapping;
> +	loff_t pos = iocb->ki_pos - buffered_written;
> +	loff_t end = iocb->ki_pos - 1;
> +	int err;
> +
> +	/*
> +	 * If the buffered write fallback returned an error, we want to return
> +	 * the number of bytes which were written by direct I/O, or the error
> +	 * code if that was zero.
> +	 *
> +	 * Note that this differs from normal direct-io semantics, which will
> +	 * return -EFOO even if some bytes were written.
> +	 */
> +	if (unlikely(buffered_written < 0)) {
> +		if (direct_written)
> +			return direct_written;
> +		return buffered_written;
> +	}
> +
> +	/*
> +	 * We need to ensure that the page cache pages are written to disk and
> +	 * invalidated to preserve the expected O_DIRECT semantics.
> +	 */
> +	err = filemap_write_and_wait_range(mapping, pos, end);
> +	if (err < 0) {
> +		/*
> +		 * We don't know how much we wrote, so just return the number of
> +		 * bytes which were direct-written
> +		 */
> +		if (direct_written)
> +			return direct_written;
> +		return err;
> +	}
> +	invalidate_mapping_pages(mapping, pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> +	return direct_written + buffered_written;
> +}
> +EXPORT_SYMBOL_GPL(direct_write_fallback);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 91021b4e1f6f48..6af25137543824 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2738,6 +2738,8 @@ extern ssize_t __generic_file_write_iter(struct kiocb *, struct iov_iter *);
>  extern ssize_t generic_file_write_iter(struct kiocb *, struct iov_iter *);
>  extern ssize_t generic_file_direct_write(struct kiocb *, struct iov_iter *);
>  ssize_t generic_perform_write(struct kiocb *, struct iov_iter *);
> +ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
> +		ssize_t direct_written, ssize_t buffered_written);
>  
>  ssize_t vfs_iter_read(struct file *file, struct iov_iter *iter, loff_t *ppos,
>  		rwf_t flags);
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ddb6f8aa86d6ca..137508da5525b6 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -4006,23 +4006,19 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  {
>  	struct file *file = iocb->ki_filp;
>  	struct address_space *mapping = file->f_mapping;
> -	struct inode 	*inode = mapping->host;
> -	ssize_t		written = 0;
> -	ssize_t		err;
> -	ssize_t		status;
> +	struct inode *inode = mapping->host;
> +	ssize_t ret;
>  
> -	err = file_remove_privs(file);
> -	if (err)
> -		goto out;
> +	ret = file_remove_privs(file);
> +	if (ret)
> +		return ret;
>  
> -	err = file_update_time(file);
> -	if (err)
> -		goto out;
> +	ret = file_update_time(file);
> +	if (ret)
> +		return ret;
>  
>  	if (iocb->ki_flags & IOCB_DIRECT) {
> -		loff_t pos, endbyte;
> -
> -		written = generic_file_direct_write(iocb, from);
> +		ret = generic_file_direct_write(iocb, from);
>  		/*
>  		 * If the write stopped short of completing, fall back to
>  		 * buffered writes.  Some filesystems do this for writes to
> @@ -4030,45 +4026,13 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		 * not succeed (even if it did, DAX does not handle dirty
>  		 * page-cache pages correctly).
>  		 */
> -		if (written < 0 || !iov_iter_count(from) || IS_DAX(inode))
> -			goto out;
> -
> -		pos = iocb->ki_pos;
> -		status = generic_perform_write(iocb, from);
> -		/*
> -		 * If generic_perform_write() returned a synchronous error
> -		 * then we want to return the number of bytes which were
> -		 * direct-written, or the error code if that was zero.  Note
> -		 * that this differs from normal direct-io semantics, which
> -		 * will return -EFOO even if some bytes were written.
> -		 */
> -		if (unlikely(status < 0)) {
> -			err = status;
> -			goto out;
> -		}
> -		/*
> -		 * We need to ensure that the page cache pages are written to
> -		 * disk and invalidated to preserve the expected O_DIRECT
> -		 * semantics.
> -		 */
> -		endbyte = pos + status - 1;
> -		err = filemap_write_and_wait_range(mapping, pos, endbyte);
> -		if (err == 0) {
> -			written += status;
> -			invalidate_mapping_pages(mapping,
> -						 pos >> PAGE_SHIFT,
> -						 endbyte >> PAGE_SHIFT);
> -		} else {
> -			/*
> -			 * We don't know how much we wrote, so just return
> -			 * the number of bytes which were direct-written
> -			 */
> -		}
> -	} else {
> -		written = generic_perform_write(iocb, from);
> +		if (ret < 0 || !iov_iter_count(from) || IS_DAX(inode))
> +			return ret;
> +		return direct_write_fallback(iocb, from, ret,
> +				generic_perform_write(iocb, from));
>  	}
> -out:
> -	return written ? written : err;
> +
> +	return generic_perform_write(iocb, from);
>  }
>  EXPORT_SYMBOL(__generic_file_write_iter);
>  
> -- 
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
