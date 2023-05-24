Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E070F921
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 16:50:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1pp3-0005Xn-Ng;
	Wed, 24 May 2023 14:50:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1q1pp1-0005XV-Df
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 14:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ifumMCIgqPbmknbvOWqVwTKuKkv/eK5gkm/9sbYBJ4s=; b=eHoaVQ1mwGkHeMlIQAtpK8S1gt
 XqEyhUEFD43srxaGEnm/FXcHEvJEm3hQ6ZoHT08SyMMHdrT6T+Vzkvakb5m4WK9GYSheNs5GJoF8/
 ZXkUt6Xe743x2fDXG96EonKvh94jxMiH7dB9Gz7YUFHO7IHZdTqTR430Mb0VVU9bSQo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ifumMCIgqPbmknbvOWqVwTKuKkv/eK5gkm/9sbYBJ4s=; b=cSj6yXg4EzTNEXp1ubXf5q2Xd+
 5/CDH/SNKon2hgsOB7BSz61LBipwWoHMCyNgmHI1yd+/2DSe0q/EjGuBh8nAbCU4I5XYgZUsyG4/C
 mCDYwHIeDhMgmfmyK11r2hqUbzLbqD2EVnTrijgnlfvtOpq/tS71ByLbhXQEplYDVEx4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1pp1-001S0Z-DB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 14:50:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9FB663DED;
 Wed, 24 May 2023 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F49C433D2;
 Wed, 24 May 2023 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684939829;
 bh=tO2IMEGijtd57Gf9dwTbwdnlrcrYP93IAJz+fPhyfYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Knvw+aNnLCkCrn91eEu9btjgwuW9tUet6Mr/qVPia+A/hRem1D5rmDrUnfgfneoWX
 9OvAAnltzB0vKktDVYgUrSn0y0m6O2qzq3wNznJQEz9v2FJe2TDlPhgvQy9rjgt5Xr
 xGY/Cwiwk+Lq8lwkotO3qFaRbfZ3MtPWGor1A4nMUjEa6zkr5cNC4H8xvOAjA08mLK
 ddj6+YB7K+B/3YgntOYamQZrMJ/Gr8yJtruyyXGWQmdOa7MThCT0RHGZ1sA5s4sQ7I
 R8ZdIH3OXjFCsifx9UShNhQ4siE2ISFsl1RfsQTR1onDe6iO73voe6d46Zsjsbtl/8
 q08CdMKBPGpPw==
Date: Wed, 24 May 2023 07:50:28 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230524145028.GH11620@frogsfrogsfrogs>
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524063810.1595778-2-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 24, 2023 at 08:38:00AM +0200, Christoph Hellwig
 wrote: > The last user of current->backing_dev_info disappeared in commit
 > b9b1335e6403 ("remove bdi_congested() and wb_congested() and rel [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1pp1-001S0Z-DB
Subject: Re: [f2fs-dev] [PATCH 01/11] backing_dev: remove
 current->backing_dev_info
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
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 24, 2023 at 08:38:00AM +0200, Christoph Hellwig wrote:
> The last user of current->backing_dev_info disappeared in commit
> b9b1335e6403 ("remove bdi_congested() and wb_congested() and related
> functions").  Remove the field and all assignments to it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Yay code removal!!!! :)

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/btrfs/file.c       | 6 +-----
>  fs/ceph/file.c        | 4 ----
>  fs/ext4/file.c        | 2 --
>  fs/f2fs/file.c        | 2 --
>  fs/fuse/file.c        | 4 ----
>  fs/gfs2/file.c        | 2 --
>  fs/nfs/file.c         | 5 +----
>  fs/ntfs/file.c        | 2 --
>  fs/ntfs3/file.c       | 3 ---
>  fs/xfs/xfs_file.c     | 4 ----
>  include/linux/sched.h | 3 ---
>  mm/filemap.c          | 3 ---
>  12 files changed, 2 insertions(+), 38 deletions(-)
> 
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index f649647392e0e4..ecd43ab66fa6c7 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1145,7 +1145,6 @@ static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
>  	    !(BTRFS_I(inode)->flags & (BTRFS_INODE_NODATACOW | BTRFS_INODE_PREALLOC)))
>  		return -EAGAIN;
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	ret = file_remove_privs(file);
>  	if (ret)
>  		return ret;
> @@ -1165,10 +1164,8 @@ static int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from,
>  		loff_t end_pos = round_up(pos + count, fs_info->sectorsize);
>  
>  		ret = btrfs_cont_expand(BTRFS_I(inode), oldsize, end_pos);
> -		if (ret) {
> -			current->backing_dev_info = NULL;
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
>  	return 0;
> @@ -1689,7 +1686,6 @@ ssize_t btrfs_do_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  	if (sync)
>  		atomic_dec(&inode->sync_writers);
>  
> -	current->backing_dev_info = NULL;
>  	return num_written;
>  }
>  
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index f4d8bf7dec88a8..c8ef72f723badd 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1791,9 +1791,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	else
>  		ceph_start_io_write(inode);
>  
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>  	if (iocb->ki_flags & IOCB_APPEND) {
>  		err = ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false);
>  		if (err < 0)
> @@ -1940,7 +1937,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		ceph_end_io_write(inode);
>  out_unlocked:
>  	ceph_free_cap_flush(prealloc_cf);
> -	current->backing_dev_info = NULL;
>  	return written ? written : err;
>  }
>  
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index d101b3b0c7dad8..bc430270c23c19 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -285,9 +285,7 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
>  	if (ret <= 0)
>  		goto out;
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	ret = generic_perform_write(iocb, from);
> -	current->backing_dev_info = NULL;
>  
>  out:
>  	inode_unlock(inode);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5ac53d2627d20d..4f423d367a44b9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4517,9 +4517,7 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
>  	if (iocb->ki_flags & IOCB_NOWAIT)
>  		return -EOPNOTSUPP;
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	ret = generic_perform_write(iocb, from);
> -	current->backing_dev_info = NULL;
>  
>  	if (ret > 0) {
>  		iocb->ki_pos += ret;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 89d97f6188e05e..97d435874b14aa 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1362,9 +1362,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  writethrough:
>  	inode_lock(inode);
>  
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>  	err = generic_write_checks(iocb, from);
>  	if (err <= 0)
>  		goto out;
> @@ -1409,7 +1406,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			iocb->ki_pos += written;
>  	}
>  out:
> -	current->backing_dev_info = NULL;
>  	inode_unlock(inode);
>  	if (written > 0)
>  		written = generic_write_sync(iocb, written);
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 300844f50dcd28..904a0d6ac1a1a9 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -1041,11 +1041,9 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
>  			goto out_unlock;
>  	}
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	pagefault_disable();
>  	ret = iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
>  	pagefault_enable();
> -	current->backing_dev_info = NULL;
>  	if (ret > 0) {
>  		iocb->ki_pos += ret;
>  		written += ret;
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index f0edf5a36237d1..665ce3fc62eaf4 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -648,11 +648,8 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
>  	since = filemap_sample_wb_err(file->f_mapping);
>  	nfs_start_io_write(inode);
>  	result = generic_write_checks(iocb, from);
> -	if (result > 0) {
> -		current->backing_dev_info = inode_to_bdi(inode);
> +	if (result > 0)
>  		result = generic_perform_write(iocb, from);
> -		current->backing_dev_info = NULL;
> -	}
>  	nfs_end_io_write(inode);
>  	if (result <= 0)
>  		goto out;
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index c481b14e4fd989..e296f804a9c442 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -1911,11 +1911,9 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  
>  	inode_lock(vi);
>  	/* We can write back this queue in page reclaim. */
> -	current->backing_dev_info = inode_to_bdi(vi);
>  	err = ntfs_prepare_file_for_write(iocb, from);
>  	if (iov_iter_count(from) && !err)
>  		written = ntfs_perform_write(file, from, iocb->ki_pos);
> -	current->backing_dev_info = NULL;
>  	inode_unlock(vi);
>  	iocb->ki_pos += written;
>  	if (likely(written > 0))
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 9a3d55c367d920..86d16a2c8339ca 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -820,7 +820,6 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>  	if (!pages)
>  		return -ENOMEM;
>  
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	err = file_remove_privs(file);
>  	if (err)
>  		goto out;
> @@ -993,8 +992,6 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>  out:
>  	kfree(pages);
>  
> -	current->backing_dev_info = NULL;
> -
>  	if (err < 0)
>  		return err;
>  
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index aede746541f8ae..431c3fd0e2b598 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -717,9 +717,6 @@ xfs_file_buffered_write(
>  	if (ret)
>  		goto out;
>  
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
>  			&xfs_buffered_write_iomap_ops);
> @@ -753,7 +750,6 @@ xfs_file_buffered_write(
>  		goto write_retry;
>  	}
>  
> -	current->backing_dev_info = NULL;
>  out:
>  	if (iolock)
>  		xfs_iunlock(ip, iolock);
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index eed5d65b8d1f4d..54780571fe9a07 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -41,7 +41,6 @@
>  
>  /* task_struct member predeclarations (sorted alphabetically): */
>  struct audit_context;
> -struct backing_dev_info;
>  struct bio_list;
>  struct blk_plug;
>  struct bpf_local_storage;
> @@ -1186,8 +1185,6 @@ struct task_struct {
>  	/* VM state: */
>  	struct reclaim_state		*reclaim_state;
>  
> -	struct backing_dev_info		*backing_dev_info;
> -
>  	struct io_context		*io_context;
>  
>  #ifdef CONFIG_COMPACTION
> diff --git a/mm/filemap.c b/mm/filemap.c
> index b4c9bd368b7e58..33b54660ad2b39 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3991,8 +3991,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	ssize_t		err;
>  	ssize_t		status;
>  
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
>  	err = file_remove_privs(file);
>  	if (err)
>  		goto out;
> @@ -4053,7 +4051,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			iocb->ki_pos += written;
>  	}
>  out:
> -	current->backing_dev_info = NULL;
>  	return written ? written : err;
>  }
>  EXPORT_SYMBOL(__generic_file_write_iter);
> -- 
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
