Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A2548942B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jan 2022 09:49:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n6qN0-0006xR-IP; Mon, 10 Jan 2022 08:49:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+996bc53df2b455107366+6714+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1n6qMy-0006wp-Cb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Jan 2022 08:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6z7iyCSv06HNRpcmff3Fph4Gk7yUcEiZ1at/AaKsGzg=; b=mMei25T1FQRbJ/2ooLIJj5OTIM
 ++oJagtKHXl2cxFTqB4Rq+D44Tbsz/g65TVsdFR13IePs/Do6eWxXuuT8aOQvtZnDpw42vQ1b7ohG
 FsG1uH0bEZ8nJH1JWi5Ug5aVTurMZs+i/0b06ygzZw5dpjkYDsFHUrt92kZRqXyi7uqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6z7iyCSv06HNRpcmff3Fph4Gk7yUcEiZ1at/AaKsGzg=; b=DdfETaTSdh0T9/FsYNSCOEo/uS
 Ud9zg7KiHPIIwWeisCT77Dfu8fJqX+Sp/3dKp1QgOg/qphHmYs6NO6UNI+4krTlgv5TN1bHnGYsDy
 BMbFS+Qjcvhal9Ztu9piShe4rm3z4nP8DF1JUC23WfIZ8oCfZ1tCK32E6IOmClyeCw9Y=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n6qMt-00AFLp-Tw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Jan 2022 08:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6z7iyCSv06HNRpcmff3Fph4Gk7yUcEiZ1at/AaKsGzg=; b=tO/p3eWbADKJnnJYxugwAMfH8q
 Ih5uQ4mDdbrUkoykSUoNCSikSfxV6/S5WrrSOSYN0StqlDZ/p/ywkyc6rua5dIyuQ2qmsFh0uG6zI
 PyqFm43rU2UvJa7M0313lkECV6WlEzCmgJC1cx2mGXc6TZfSR9RvLPt4NPV/KlB+hATm3ZOH7N02I
 Rjg3Hs8pZ3mq9LCawpFqsiwUQZCuwEQBypU3/Lvys8VyQYL+WOcW0nGMPfnD8csHexOFsJyMAN5pZ
 FWpKcKLzJKNgJ0rNWYE7+vCbuRxhIdIbPNbWvNPAUIS9iVkCB3UhoYaZpNvN0j46RWigx95zzxFLo
 wbsQv5Qg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n6pgE-009lqe-1a; Mon, 10 Jan 2022 08:05:26 +0000
Date: Mon, 10 Jan 2022 00:05:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YdvoxkAAquI17UbX@infradead.org>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108164617.3130175-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Adding the locking primitive maintainers to this patch adding
 open coded locking primitives.. On Sat, Jan 08, 2022 at 08:46:17AM -0800,
 Jaegeuk Kim wrote: > From: Tim Murray <timmurray@google.com> > > f2fs
 rw_semaphores
 work better if writers can starve readers, > especially for the checkpoint
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n6qMt-00AFLp-Tw
Subject: Re: [f2fs-dev] [PATCH] f2fs: move f2fs to use reader-unfair rwsems
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
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Tim Murray <timmurray@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Adding the locking primitive maintainers to this patch adding open coded
locking primitives..

On Sat, Jan 08, 2022 at 08:46:17AM -0800, Jaegeuk Kim wrote:
> From: Tim Murray <timmurray@google.com>
> 
> f2fs rw_semaphores work better if writers can starve readers,
> especially for the checkpoint thread, because writers are strictly
> more important than reader threads. This prevents significant priority
> inversion between low-priority readers that blocked while trying to
> acquire the read lock and a second acquisition of the write lock that
> might be blocking high priority work.
> 
> Signed-off-by: Tim Murray <timmurray@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c |  34 ++++++-------
>  fs/f2fs/compress.c   |   6 +--
>  fs/f2fs/data.c       |  50 +++++++++----------
>  fs/f2fs/dir.c        |  12 ++---
>  fs/f2fs/f2fs.h       | 110 ++++++++++++++++++++++++++++++++++--------
>  fs/f2fs/file.c       | 112 +++++++++++++++++++++----------------------
>  fs/f2fs/gc.c         |  46 +++++++++---------
>  fs/f2fs/inline.c     |   4 +-
>  fs/f2fs/namei.c      |  34 ++++++-------
>  fs/f2fs/node.c       |  84 ++++++++++++++++----------------
>  fs/f2fs/recovery.c   |   4 +-
>  fs/f2fs/segment.c    |  44 ++++++++---------
>  fs/f2fs/super.c      |  56 +++++++++++-----------
>  fs/f2fs/sysfs.c      |   4 +-
>  fs/f2fs/verity.c     |   4 +-
>  fs/f2fs/xattr.c      |  12 ++---
>  16 files changed, 342 insertions(+), 274 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 982f0170639f..deeda95688f0 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -351,13 +351,13 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
>  		goto skip_write;
>  
>  	/* if locked failed, cp will flush dirty pages instead */
> -	if (!down_write_trylock(&sbi->cp_global_sem))
> +	if (!f2fs_down_write_trylock(&sbi->cp_global_sem))
>  		goto skip_write;
>  
>  	trace_f2fs_writepages(mapping->host, wbc, META);
>  	diff = nr_pages_to_write(sbi, META, wbc);
>  	written = f2fs_sync_meta_pages(sbi, META, wbc->nr_to_write, FS_META_IO);
> -	up_write(&sbi->cp_global_sem);
> +	f2fs_up_write(&sbi->cp_global_sem);
>  	wbc->nr_to_write = max((long)0, wbc->nr_to_write - written - diff);
>  	return 0;
>  
> @@ -1159,7 +1159,7 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>  	if (!is_journalled_quota(sbi))
>  		return false;
>  
> -	if (!down_write_trylock(&sbi->quota_sem))
> +	if (!f2fs_down_write_trylock(&sbi->quota_sem))
>  		return true;
>  	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
>  		ret = false;
> @@ -1171,7 +1171,7 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>  	} else if (get_pages(sbi, F2FS_DIRTY_QDATA)) {
>  		ret = true;
>  	}
> -	up_write(&sbi->quota_sem);
> +	f2fs_up_write(&sbi->quota_sem);
>  	return ret;
>  }
>  
> @@ -1228,10 +1228,10 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  	 * POR: we should ensure that there are no dirty node pages
>  	 * until finishing nat/sit flush. inode->i_blocks can be updated.
>  	 */
> -	down_write(&sbi->node_change);
> +	f2fs_down_write(&sbi->node_change);
>  
>  	if (get_pages(sbi, F2FS_DIRTY_IMETA)) {
> -		up_write(&sbi->node_change);
> +		f2fs_up_write(&sbi->node_change);
>  		f2fs_unlock_all(sbi);
>  		err = f2fs_sync_inode_meta(sbi);
>  		if (err)
> @@ -1241,15 +1241,15 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  	}
>  
>  retry_flush_nodes:
> -	down_write(&sbi->node_write);
> +	f2fs_down_write(&sbi->node_write);
>  
>  	if (get_pages(sbi, F2FS_DIRTY_NODES)) {
> -		up_write(&sbi->node_write);
> +		f2fs_up_write(&sbi->node_write);
>  		atomic_inc(&sbi->wb_sync_req[NODE]);
>  		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
>  		atomic_dec(&sbi->wb_sync_req[NODE]);
>  		if (err) {
> -			up_write(&sbi->node_change);
> +			f2fs_up_write(&sbi->node_change);
>  			f2fs_unlock_all(sbi);
>  			return err;
>  		}
> @@ -1262,13 +1262,13 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  	 * dirty node blocks and some checkpoint values by block allocation.
>  	 */
>  	__prepare_cp_block(sbi);
> -	up_write(&sbi->node_change);
> +	f2fs_up_write(&sbi->node_change);
>  	return err;
>  }
>  
>  static void unblock_operations(struct f2fs_sb_info *sbi)
>  {
> -	up_write(&sbi->node_write);
> +	f2fs_up_write(&sbi->node_write);
>  	f2fs_unlock_all(sbi);
>  }
>  
> @@ -1612,7 +1612,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  		f2fs_warn(sbi, "Start checkpoint disabled!");
>  	}
>  	if (cpc->reason != CP_RESIZE)
> -		down_write(&sbi->cp_global_sem);
> +		f2fs_down_write(&sbi->cp_global_sem);
>  
>  	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
>  		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
> @@ -1693,7 +1693,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
>  out:
>  	if (cpc->reason != CP_RESIZE)
> -		up_write(&sbi->cp_global_sem);
> +		f2fs_up_write(&sbi->cp_global_sem);
>  	return err;
>  }
>  
> @@ -1741,9 +1741,9 @@ static int __write_checkpoint_sync(struct f2fs_sb_info *sbi)
>  	struct cp_control cpc = { .reason = CP_SYNC, };
>  	int err;
>  
> -	down_write(&sbi->gc_lock);
> +	f2fs_down_write(&sbi->gc_lock);
>  	err = f2fs_write_checkpoint(sbi, &cpc);
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->gc_lock);
>  
>  	return err;
>  }
> @@ -1831,9 +1831,9 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
>  	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC) {
>  		int ret;
>  
> -		down_write(&sbi->gc_lock);
> +		f2fs_down_write(&sbi->gc_lock);
>  		ret = f2fs_write_checkpoint(sbi, &cpc);
> -		up_write(&sbi->gc_lock);
> +		f2fs_up_write(&sbi->gc_lock);
>  
>  		return ret;
>  	}
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d0c3aeba5945..67bac2792e57 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1267,7 +1267,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  		 * checkpoint. This can only happen to quota writes which can cause
>  		 * the below discard race condition.
>  		 */
> -		down_read(&sbi->node_write);
> +		f2fs_down_read(&sbi->node_write);
>  	} else if (!f2fs_trylock_op(sbi)) {
>  		goto out_free;
>  	}
> @@ -1384,7 +1384,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  
>  	f2fs_put_dnode(&dn);
>  	if (IS_NOQUOTA(inode))
> -		up_read(&sbi->node_write);
> +		f2fs_up_read(&sbi->node_write);
>  	else
>  		f2fs_unlock_op(sbi);
>  
> @@ -1410,7 +1410,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  	f2fs_put_dnode(&dn);
>  out_unlock_op:
>  	if (IS_NOQUOTA(inode))
> -		up_read(&sbi->node_write);
> +		f2fs_up_read(&sbi->node_write);
>  	else
>  		f2fs_unlock_op(sbi);
>  out_free:
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0fc6e0245732..50074c746161 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -591,7 +591,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
>  	enum page_type btype = PAGE_TYPE_OF_BIO(type);
>  	struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
>  
> -	down_write(&io->io_rwsem);
> +	f2fs_down_write(&io->io_rwsem);
>  
>  	/* change META to META_FLUSH in the checkpoint procedure */
>  	if (type >= META_FLUSH) {
> @@ -602,7 +602,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
>  			io->fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
>  	}
>  	__submit_merged_bio(io);
> -	up_write(&io->io_rwsem);
> +	f2fs_up_write(&io->io_rwsem);
>  }
>  
>  static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
> @@ -617,9 +617,9 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
>  			enum page_type btype = PAGE_TYPE_OF_BIO(type);
>  			struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
>  
> -			down_read(&io->io_rwsem);
> +			f2fs_down_read(&io->io_rwsem);
>  			ret = __has_merged_page(io->bio, inode, page, ino);
> -			up_read(&io->io_rwsem);
> +			f2fs_up_read(&io->io_rwsem);
>  		}
>  		if (ret)
>  			__f2fs_submit_merged_write(sbi, type, temp);
> @@ -743,9 +743,9 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
>  	if (bio_add_page(bio, page, PAGE_SIZE, 0) != PAGE_SIZE)
>  		f2fs_bug_on(sbi, 1);
>  
> -	down_write(&io->bio_list_lock);
> +	f2fs_down_write(&io->bio_list_lock);
>  	list_add_tail(&be->list, &io->bio_list);
> -	up_write(&io->bio_list_lock);
> +	f2fs_up_write(&io->bio_list_lock);
>  }
>  
>  static void del_bio_entry(struct bio_entry *be)
> @@ -767,7 +767,7 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  		struct list_head *head = &io->bio_list;
>  		struct bio_entry *be;
>  
> -		down_write(&io->bio_list_lock);
> +		f2fs_down_write(&io->bio_list_lock);
>  		list_for_each_entry(be, head, list) {
>  			if (be->bio != *bio)
>  				continue;
> @@ -791,7 +791,7 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  			__submit_bio(sbi, *bio, DATA);
>  			break;
>  		}
> -		up_write(&io->bio_list_lock);
> +		f2fs_up_write(&io->bio_list_lock);
>  	}
>  
>  	if (ret) {
> @@ -817,7 +817,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
>  		if (list_empty(head))
>  			continue;
>  
> -		down_read(&io->bio_list_lock);
> +		f2fs_down_read(&io->bio_list_lock);
>  		list_for_each_entry(be, head, list) {
>  			if (target)
>  				found = (target == be->bio);
> @@ -827,14 +827,14 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
>  			if (found)
>  				break;
>  		}
> -		up_read(&io->bio_list_lock);
> +		f2fs_up_read(&io->bio_list_lock);
>  
>  		if (!found)
>  			continue;
>  
>  		found = false;
>  
> -		down_write(&io->bio_list_lock);
> +		f2fs_down_write(&io->bio_list_lock);
>  		list_for_each_entry(be, head, list) {
>  			if (target)
>  				found = (target == be->bio);
> @@ -847,7 +847,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
>  				break;
>  			}
>  		}
> -		up_write(&io->bio_list_lock);
> +		f2fs_up_write(&io->bio_list_lock);
>  	}
>  
>  	if (found)
> @@ -907,7 +907,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  
>  	f2fs_bug_on(sbi, is_read_io(fio->op));
>  
> -	down_write(&io->io_rwsem);
> +	f2fs_down_write(&io->io_rwsem);
>  next:
>  	if (fio->in_list) {
>  		spin_lock(&io->io_lock);
> @@ -974,7 +974,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
>  				!f2fs_is_checkpoint_ready(sbi))
>  		__submit_merged_bio(io);
> -	up_write(&io->io_rwsem);
> +	f2fs_up_write(&io->io_rwsem);
>  }
>  
>  static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
> @@ -1384,9 +1384,9 @@ void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
>  {
>  	if (flag == F2FS_GET_BLOCK_PRE_AIO) {
>  		if (lock)
> -			down_read(&sbi->node_change);
> +			f2fs_down_read(&sbi->node_change);
>  		else
> -			up_read(&sbi->node_change);
> +			f2fs_up_read(&sbi->node_change);
>  	} else {
>  		if (lock)
>  			f2fs_lock_op(sbi);
> @@ -2762,13 +2762,13 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  		 * the below discard race condition.
>  		 */
>  		if (IS_NOQUOTA(inode))
> -			down_read(&sbi->node_write);
> +			f2fs_down_read(&sbi->node_write);
>  
>  		fio.need_lock = LOCK_DONE;
>  		err = f2fs_do_write_data_page(&fio);
>  
>  		if (IS_NOQUOTA(inode))
> -			up_read(&sbi->node_write);
> +			f2fs_up_read(&sbi->node_write);
>  
>  		goto done;
>  	}
> @@ -3226,14 +3226,14 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
>  
>  	/* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
>  	if (to > i_size && !f2fs_verity_in_progress(inode)) {
> -		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		filemap_invalidate_lock(inode->i_mapping);
>  
>  		truncate_pagecache(inode, i_size);
>  		f2fs_truncate_blocks(inode, i_size, true);
>  
>  		filemap_invalidate_unlock(inode->i_mapping);
> -		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	}
>  }
>  
> @@ -3734,13 +3734,13 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  	unsigned int end_sec = secidx + blkcnt / blk_per_sec;
>  	int ret = 0;
>  
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(inode->i_mapping);
>  
>  	set_inode_flag(inode, FI_ALIGNED_WRITE);
>  
>  	for (; secidx < end_sec; secidx++) {
> -		down_write(&sbi->pin_sem);
> +		f2fs_down_write(&sbi->pin_sem);
>  
>  		f2fs_lock_op(sbi);
>  		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
> @@ -3754,7 +3754,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  
>  			page = f2fs_get_lock_data_page(inode, blkidx, true);
>  			if (IS_ERR(page)) {
> -				up_write(&sbi->pin_sem);
> +				f2fs_up_write(&sbi->pin_sem);
>  				ret = PTR_ERR(page);
>  				goto done;
>  			}
> @@ -3767,7 +3767,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  
>  		ret = filemap_fdatawrite(inode->i_mapping);
>  
> -		up_write(&sbi->pin_sem);
> +		f2fs_up_write(&sbi->pin_sem);
>  
>  		if (ret)
>  			break;
> @@ -3778,7 +3778,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  	clear_inode_flag(inode, FI_ALIGNED_WRITE);
>  
>  	filemap_invalidate_unlock(inode->i_mapping);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
>  	return ret;
>  }
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 1820e9c106f7..011df7058c42 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -766,7 +766,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
>  	f2fs_wait_on_page_writeback(dentry_page, DATA, true, true);
>  
>  	if (inode) {
> -		down_write(&F2FS_I(inode)->i_sem);
> +		f2fs_down_write(&F2FS_I(inode)->i_sem);
>  		page = f2fs_init_inode_metadata(inode, dir, fname, NULL);
>  		if (IS_ERR(page)) {
>  			err = PTR_ERR(page);
> @@ -793,7 +793,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
>  	f2fs_update_parent_metadata(dir, inode, current_depth);
>  fail:
>  	if (inode)
> -		up_write(&F2FS_I(inode)->i_sem);
> +		f2fs_up_write(&F2FS_I(inode)->i_sem);
>  
>  	f2fs_put_page(dentry_page, 1);
>  
> @@ -858,7 +858,7 @@ int f2fs_do_tmpfile(struct inode *inode, struct inode *dir)
>  	struct page *page;
>  	int err = 0;
>  
> -	down_write(&F2FS_I(inode)->i_sem);
> +	f2fs_down_write(&F2FS_I(inode)->i_sem);
>  	page = f2fs_init_inode_metadata(inode, dir, NULL, NULL);
>  	if (IS_ERR(page)) {
>  		err = PTR_ERR(page);
> @@ -869,7 +869,7 @@ int f2fs_do_tmpfile(struct inode *inode, struct inode *dir)
>  	clear_inode_flag(inode, FI_NEW_INODE);
>  	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>  fail:
> -	up_write(&F2FS_I(inode)->i_sem);
> +	f2fs_up_write(&F2FS_I(inode)->i_sem);
>  	return err;
>  }
>  
> @@ -877,7 +877,7 @@ void f2fs_drop_nlink(struct inode *dir, struct inode *inode)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>  
> -	down_write(&F2FS_I(inode)->i_sem);
> +	f2fs_down_write(&F2FS_I(inode)->i_sem);
>  
>  	if (S_ISDIR(inode->i_mode))
>  		f2fs_i_links_write(dir, false);
> @@ -888,7 +888,7 @@ void f2fs_drop_nlink(struct inode *dir, struct inode *inode)
>  		f2fs_i_links_write(inode, false);
>  		f2fs_i_size_write(inode, 0);
>  	}
> -	up_write(&F2FS_I(inode)->i_sem);
> +	f2fs_up_write(&F2FS_I(inode)->i_sem);
>  
>  	if (inode->i_nlink == 0)
>  		f2fs_add_orphan_inode(inode);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 842020311f83..5249bb11b1d7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -121,6 +121,18 @@ typedef u32 nid_t;
>  
>  #define COMPRESS_EXT_NUM		16
>  
> +/*
> + * An implementation of an rwsem that is explicitly unfair to readers. This
> + * prevents priority inversion when a low-priority reader acquires the read lock
> + * while sleeping on the write lock but the write lock is needed by
> + * higher-priority clients.
> + */
> +
> +struct f2fs_rwsem {
> +        struct rw_semaphore internal_rwsem;
> +        wait_queue_head_t read_waiters;
> +};
> +
>  struct f2fs_mount_info {
>  	unsigned int opt;
>  	int write_io_size_bits;		/* Write IO size bits */
> @@ -750,7 +762,7 @@ struct f2fs_inode_info {
>  
>  	/* Use below internally in f2fs*/
>  	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
> -	struct rw_semaphore i_sem;	/* protect fi info */
> +	struct f2fs_rwsem i_sem;	/* protect fi info */
>  	atomic_t dirty_pages;		/* # of dirty pages */
>  	f2fs_hash_t chash;		/* hash value of given file name */
>  	unsigned int clevel;		/* maximum level of given file name */
> @@ -775,8 +787,8 @@ struct f2fs_inode_info {
>  	struct extent_tree *extent_tree;	/* cached extent_tree entry */
>  
>  	/* avoid racing between foreground op and gc */
> -	struct rw_semaphore i_gc_rwsem[2];
> -	struct rw_semaphore i_xattr_sem; /* avoid racing between reading and changing EAs */
> +	struct f2fs_rwsem i_gc_rwsem[2];
> +	struct f2fs_rwsem i_xattr_sem; /* avoid racing between reading and changing EAs */
>  
>  	int i_extra_isize;		/* size of extra space located in i_addr */
>  	kprojid_t i_projid;		/* id for project quota */
> @@ -902,7 +914,7 @@ struct f2fs_nm_info {
>  	/* NAT cache management */
>  	struct radix_tree_root nat_root;/* root of the nat entry cache */
>  	struct radix_tree_root nat_set_root;/* root of the nat set cache */
> -	struct rw_semaphore nat_tree_lock;	/* protect nat entry tree */
> +	struct f2fs_rwsem nat_tree_lock;	/* protect nat entry tree */
>  	struct list_head nat_entries;	/* cached nat entry list (clean) */
>  	spinlock_t nat_list_lock;	/* protect clean nat entry list */
>  	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
> @@ -1015,7 +1027,7 @@ struct f2fs_sm_info {
>  	struct dirty_seglist_info *dirty_info;	/* dirty segment information */
>  	struct curseg_info *curseg_array;	/* active segment information */
>  
> -	struct rw_semaphore curseg_lock;	/* for preventing curseg change */
> +	struct f2fs_rwsem curseg_lock;	/* for preventing curseg change */
>  
>  	block_t seg0_blkaddr;		/* block address of 0'th segment */
>  	block_t main_blkaddr;		/* start block address of main area */
> @@ -1199,11 +1211,11 @@ struct f2fs_bio_info {
>  	struct bio *bio;		/* bios to merge */
>  	sector_t last_block_in_bio;	/* last block number */
>  	struct f2fs_io_info fio;	/* store buffered io info. */
> -	struct rw_semaphore io_rwsem;	/* blocking op for bio */
> +	struct f2fs_rwsem io_rwsem;	/* blocking op for bio */
>  	spinlock_t io_lock;		/* serialize DATA/NODE IOs */
>  	struct list_head io_list;	/* track fios */
>  	struct list_head bio_list;	/* bio entry list head */
> -	struct rw_semaphore bio_list_lock;	/* lock to protect bio entry list */
> +	struct f2fs_rwsem bio_list_lock;	/* lock to protect bio entry list */
>  };
>  
>  #define FDEV(i)				(sbi->devs[i])
> @@ -1569,7 +1581,7 @@ struct f2fs_sb_info {
>  	struct super_block *sb;			/* pointer to VFS super block */
>  	struct proc_dir_entry *s_proc;		/* proc entry */
>  	struct f2fs_super_block *raw_super;	/* raw super block pointer */
> -	struct rw_semaphore sb_lock;		/* lock for raw super block */
> +	struct f2fs_rwsem sb_lock;		/* lock for raw super block */
>  	int valid_super_block;			/* valid super block no */
>  	unsigned long s_flag;				/* flags for sbi */
>  	struct mutex writepages;		/* mutex for writepages() */
> @@ -1589,7 +1601,7 @@ struct f2fs_sb_info {
>  	/* for bio operations */
>  	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
>  	/* keep migration IO order for LFS mode */
> -	struct rw_semaphore io_order_lock;
> +	struct f2fs_rwsem io_order_lock;
>  	mempool_t *write_io_dummy;		/* Dummy pages */
>  
>  	/* for checkpoint */
> @@ -1597,10 +1609,10 @@ struct f2fs_sb_info {
>  	int cur_cp_pack;			/* remain current cp pack */
>  	spinlock_t cp_lock;			/* for flag in ckpt */
>  	struct inode *meta_inode;		/* cache meta blocks */
> -	struct rw_semaphore cp_global_sem;	/* checkpoint procedure lock */
> -	struct rw_semaphore cp_rwsem;		/* blocking FS operations */
> -	struct rw_semaphore node_write;		/* locking node writes */
> -	struct rw_semaphore node_change;	/* locking node change */
> +	struct f2fs_rwsem cp_global_sem;	/* checkpoint procedure lock */
> +	struct f2fs_rwsem cp_rwsem;		/* blocking FS operations */
> +	struct f2fs_rwsem node_write;		/* locking node writes */
> +	struct f2fs_rwsem node_change;	/* locking node change */
>  	wait_queue_head_t cp_wait;
>  	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
>  	long interval_time[MAX_TIME];		/* to store thresholds */
> @@ -1660,7 +1672,7 @@ struct f2fs_sb_info {
>  	block_t unusable_block_count;		/* # of blocks saved by last cp */
>  
>  	unsigned int nquota_files;		/* # of quota sysfile */
> -	struct rw_semaphore quota_sem;		/* blocking cp for flags */
> +	struct f2fs_rwsem quota_sem;		/* blocking cp for flags */
>  
>  	/* # of pages, see count_type */
>  	atomic_t nr_pages[NR_COUNT_TYPE];
> @@ -1676,7 +1688,7 @@ struct f2fs_sb_info {
>  	struct f2fs_mount_info mount_opt;	/* mount options */
>  
>  	/* for cleaning operations */
> -	struct rw_semaphore gc_lock;		/*
> +	struct f2fs_rwsem gc_lock;		/*
>  						 * semaphore for GC, avoid
>  						 * race between GC and GC or CP
>  						 */
> @@ -1696,7 +1708,7 @@ struct f2fs_sb_info {
>  
>  	/* threshold for gc trials on pinned files */
>  	u64 gc_pin_file_threshold;
> -	struct rw_semaphore pin_sem;
> +	struct f2fs_rwsem pin_sem;
>  
>  	/* maximum # of trials to find a victim segment for SSR and GC */
>  	unsigned int max_victim_search;
> @@ -2090,9 +2102,65 @@ static inline void clear_ckpt_flags(struct f2fs_sb_info *sbi, unsigned int f)
>  	spin_unlock_irqrestore(&sbi->cp_lock, flags);
>  }
>  
> +static inline void init_f2fs_rwsem(struct f2fs_rwsem *sem)
> +{
> +	init_rwsem(&sem->internal_rwsem);
> +	init_waitqueue_head(&sem->read_waiters);
> +}
> +
> +static inline int f2fs_rwsem_is_locked(struct f2fs_rwsem *sem)
> +{
> +	return rwsem_is_locked(&sem->internal_rwsem);
> +}
> +
> +static inline int f2fs_rwsem_is_contended(struct f2fs_rwsem *sem)
> +{
> +	return rwsem_is_contended(&sem->internal_rwsem);
> +}
> +
> +static inline void f2fs_down_read(struct f2fs_rwsem *sem)
> +{
> +	wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
> +}
> +
> +static inline int f2fs_down_read_trylock(struct f2fs_rwsem *sem)
> +{
> +	return down_read_trylock(&sem->internal_rwsem);
> +}
> +
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +static inline void f2fs_down_read_nested(struct f2fs_rwsem *sem, int subclass)
> +{
> +	down_read_nested(&sem->internal_rwsem, subclass);
> +}
> +#else
> +#define f2fs_down_read_nested(sem, subclass) f2fs_down_read(sem)
> +#endif
> +
> +static inline void f2fs_up_read(struct f2fs_rwsem *sem)
> +{
> +	up_read(&sem->internal_rwsem);
> +}
> +
> +static inline void f2fs_down_write(struct f2fs_rwsem *sem)
> +{
> +	down_write(&sem->internal_rwsem);
> +}
> +
> +static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
> +{
> +	return down_write_trylock(&sem->internal_rwsem);
> +}
> +
> +static inline void f2fs_up_write(struct f2fs_rwsem *sem)
> +{
> +	up_write(&sem->internal_rwsem);
> +	wake_up_all(&sem->read_waiters);
> +}
> +
>  static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
>  {
> -	down_read(&sbi->cp_rwsem);
> +	f2fs_down_read(&sbi->cp_rwsem);
>  }
>  
>  static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
> @@ -2101,22 +2169,22 @@ static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
>  		f2fs_show_injection_info(sbi, FAULT_LOCK_OP);
>  		return 0;
>  	}
> -	return down_read_trylock(&sbi->cp_rwsem);
> +	return f2fs_down_read_trylock(&sbi->cp_rwsem);
>  }
>  
>  static inline void f2fs_unlock_op(struct f2fs_sb_info *sbi)
>  {
> -	up_read(&sbi->cp_rwsem);
> +	f2fs_up_read(&sbi->cp_rwsem);
>  }
>  
>  static inline void f2fs_lock_all(struct f2fs_sb_info *sbi)
>  {
> -	down_write(&sbi->cp_rwsem);
> +	f2fs_down_write(&sbi->cp_rwsem);
>  }
>  
>  static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
>  {
> -	up_write(&sbi->cp_rwsem);
> +	f2fs_up_write(&sbi->cp_rwsem);
>  }
>  
>  static inline int __get_cp_reason(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f540c1cbddca..f39feedc9816 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -237,13 +237,13 @@ static void try_to_fix_pino(struct inode *inode)
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>  	nid_t pino;
>  
> -	down_write(&fi->i_sem);
> +	f2fs_down_write(&fi->i_sem);
>  	if (file_wrong_pino(inode) && inode->i_nlink == 1 &&
>  			get_parent_ino(inode, &pino)) {
>  		f2fs_i_pino_write(inode, pino);
>  		file_got_pino(inode);
>  	}
> -	up_write(&fi->i_sem);
> +	f2fs_up_write(&fi->i_sem);
>  }
>  
>  static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> @@ -318,9 +318,9 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  	 * Both of fdatasync() and fsync() are able to be recovered from
>  	 * sudden-power-off.
>  	 */
> -	down_read(&F2FS_I(inode)->i_sem);
> +	f2fs_down_read(&F2FS_I(inode)->i_sem);
>  	cp_reason = need_do_checkpoint(inode);
> -	up_read(&F2FS_I(inode)->i_sem);
> +	f2fs_up_read(&F2FS_I(inode)->i_sem);
>  
>  	if (cp_reason) {
>  		/* all the dirty node pages should be flushed for POR */
> @@ -958,7 +958,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
>  				return err;
>  		}
>  
> -		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		filemap_invalidate_lock(inode->i_mapping);
>  
>  		truncate_setsize(inode, attr->ia_size);
> @@ -970,7 +970,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
>  		 * larger than i_size.
>  		 */
>  		filemap_invalidate_unlock(inode->i_mapping);
> -		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		if (err)
>  			return err;
>  
> @@ -1112,7 +1112,7 @@ static int punch_hole(struct inode *inode, loff_t offset, loff_t len)
>  			blk_start = (loff_t)pg_start << PAGE_SHIFT;
>  			blk_end = (loff_t)pg_end << PAGE_SHIFT;
>  
> -			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +			f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  			filemap_invalidate_lock(inode->i_mapping);
>  
>  			truncate_pagecache_range(inode, blk_start, blk_end - 1);
> @@ -1122,7 +1122,7 @@ static int punch_hole(struct inode *inode, loff_t offset, loff_t len)
>  			f2fs_unlock_op(sbi);
>  
>  			filemap_invalidate_unlock(inode->i_mapping);
> -			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		}
>  	}
>  
> @@ -1355,7 +1355,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
>  	f2fs_balance_fs(sbi, true);
>  
>  	/* avoid gc operation during block exchange */
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(inode->i_mapping);
>  
>  	f2fs_lock_op(sbi);
> @@ -1365,7 +1365,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
>  	f2fs_unlock_op(sbi);
>  
>  	filemap_invalidate_unlock(inode->i_mapping);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	return ret;
>  }
>  
> @@ -1500,7 +1500,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>  			unsigned int end_offset;
>  			pgoff_t end;
>  
> -			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +			f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  			filemap_invalidate_lock(mapping);
>  
>  			truncate_pagecache_range(inode,
> @@ -1514,7 +1514,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>  			if (ret) {
>  				f2fs_unlock_op(sbi);
>  				filemap_invalidate_unlock(mapping);
> -				up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  				goto out;
>  			}
>  
> @@ -1526,7 +1526,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>  
>  			f2fs_unlock_op(sbi);
>  			filemap_invalidate_unlock(mapping);
> -			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
>  			f2fs_balance_fs(sbi, dn.node_changed);
>  
> @@ -1600,7 +1600,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
>  	idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
>  
>  	/* avoid gc operation during block exchange */
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(mapping);
>  	truncate_pagecache(inode, offset);
>  
> @@ -1618,7 +1618,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
>  		f2fs_unlock_op(sbi);
>  	}
>  	filemap_invalidate_unlock(mapping);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
>  	/* write out all moved pages, if possible */
>  	filemap_invalidate_lock(mapping);
> @@ -1674,13 +1674,13 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  next_alloc:
>  		if (has_not_enough_free_secs(sbi, 0,
>  			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
> -			down_write(&sbi->gc_lock);
> +			f2fs_down_write(&sbi->gc_lock);
>  			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
>  			if (err && err != -ENODATA && err != -EAGAIN)
>  				goto out_err;
>  		}
>  
> -		down_write(&sbi->pin_sem);
> +		f2fs_down_write(&sbi->pin_sem);
>  
>  		f2fs_lock_op(sbi);
>  		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
> @@ -1690,7 +1690,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
>  		file_dont_truncate(inode);
>  
> -		up_write(&sbi->pin_sem);
> +		f2fs_up_write(&sbi->pin_sem);
>  
>  		expanded += map.m_len;
>  		sec_len -= map.m_len;
> @@ -2016,7 +2016,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  	if (ret)
>  		goto out;
>  
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
>  	/*
>  	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
> @@ -2027,7 +2027,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  			  inode->i_ino, get_dirty_pages(inode));
>  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>  	if (ret) {
> -		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		goto out;
>  	}
>  
> @@ -2040,7 +2040,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  	/* add inode in inmem_list first and set atomic_file */
>  	set_inode_flag(inode, FI_ATOMIC_FILE);
>  	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
>  	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>  	F2FS_I(inode)->inmem_task = current;
> @@ -2347,7 +2347,7 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
>  	if (err)
>  		return err;
>  
> -	down_write(&sbi->sb_lock);
> +	f2fs_down_write(&sbi->sb_lock);
>  
>  	if (uuid_is_nonzero(sbi->raw_super->encrypt_pw_salt))
>  		goto got_it;
> @@ -2366,7 +2366,7 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
>  									16))
>  		err = -EFAULT;
>  out_err:
> -	up_write(&sbi->sb_lock);
> +	f2fs_up_write(&sbi->sb_lock);
>  	mnt_drop_write_file(filp);
>  	return err;
>  }
> @@ -2443,12 +2443,12 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>  		return ret;
>  
>  	if (!sync) {
> -		if (!down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>  			ret = -EBUSY;
>  			goto out;
>  		}
>  	} else {
> -		down_write(&sbi->gc_lock);
> +		f2fs_down_write(&sbi->gc_lock);
>  	}
>  
>  	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO);
> @@ -2479,12 +2479,12 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>  
>  do_more:
>  	if (!range->sync) {
> -		if (!down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>  			ret = -EBUSY;
>  			goto out;
>  		}
>  	} else {
> -		down_write(&sbi->gc_lock);
> +		f2fs_down_write(&sbi->gc_lock);
>  	}
>  
>  	ret = f2fs_gc(sbi, range->sync, true, false,
> @@ -2816,10 +2816,10 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>  
>  	f2fs_balance_fs(sbi, true);
>  
> -	down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
>  	if (src != dst) {
>  		ret = -EBUSY;
> -		if (!down_write_trylock(&F2FS_I(dst)->i_gc_rwsem[WRITE]))
> +		if (!f2fs_down_write_trylock(&F2FS_I(dst)->i_gc_rwsem[WRITE]))
>  			goto out_src;
>  	}
>  
> @@ -2837,9 +2837,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>  	f2fs_unlock_op(sbi);
>  
>  	if (src != dst)
> -		up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
>  out_src:
> -	up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
>  out_unlock:
>  	if (src != dst)
>  		inode_unlock(dst);
> @@ -2934,7 +2934,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>  	end_segno = min(start_segno + range.segments, dev_end_segno);
>  
>  	while (start_segno < end_segno) {
> -		if (!down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>  			ret = -EBUSY;
>  			goto out;
>  		}
> @@ -3211,9 +3211,9 @@ int f2fs_precache_extents(struct inode *inode)
>  	while (map.m_lblk < end) {
>  		map.m_len = end - map.m_lblk;
>  
> -		down_write(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>  		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_PRECACHE);
> -		up_write(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>  		if (err)
>  			return err;
>  
> @@ -3290,11 +3290,11 @@ static int f2fs_ioc_getfslabel(struct file *filp, unsigned long arg)
>  	if (!vbuf)
>  		return -ENOMEM;
>  
> -	down_read(&sbi->sb_lock);
> +	f2fs_down_read(&sbi->sb_lock);
>  	count = utf16s_to_utf8s(sbi->raw_super->volume_name,
>  			ARRAY_SIZE(sbi->raw_super->volume_name),
>  			UTF16_LITTLE_ENDIAN, vbuf, MAX_VOLUME_NAME);
> -	up_read(&sbi->sb_lock);
> +	f2fs_up_read(&sbi->sb_lock);
>  
>  	if (copy_to_user((char __user *)arg, vbuf,
>  				min(FSLABEL_MAX, count)))
> @@ -3322,7 +3322,7 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
>  	if (err)
>  		goto out;
>  
> -	down_write(&sbi->sb_lock);
> +	f2fs_down_write(&sbi->sb_lock);
>  
>  	memset(sbi->raw_super->volume_name, 0,
>  			sizeof(sbi->raw_super->volume_name));
> @@ -3332,7 +3332,7 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
>  
>  	err = f2fs_commit_super(sbi, false);
>  
> -	up_write(&sbi->sb_lock);
> +	f2fs_up_write(&sbi->sb_lock);
>  
>  	mnt_drop_write_file(filp);
>  out:
> @@ -3458,7 +3458,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
>  		goto out;
>  
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(inode->i_mapping);
>  
>  	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> @@ -3495,7 +3495,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  	}
>  
>  	filemap_invalidate_unlock(inode->i_mapping);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  out:
>  	inode_unlock(inode);
>  
> @@ -3611,7 +3611,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  		goto unlock_inode;
>  	}
>  
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(inode->i_mapping);
>  
>  	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> @@ -3648,7 +3648,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  	}
>  
>  	filemap_invalidate_unlock(inode->i_mapping);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
>  	if (ret >= 0) {
>  		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> @@ -3766,7 +3766,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  	if (ret)
>  		goto err;
>  
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(mapping);
>  
>  	ret = filemap_write_and_wait_range(mapping, range.start,
> @@ -3855,7 +3855,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  				prev_block, len, range.flags);
>  out:
>  	filemap_invalidate_unlock(mapping);
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  err:
>  	inode_unlock(inode);
>  	file_end_write(filp);
> @@ -4287,12 +4287,12 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	trace_f2fs_direct_IO_enter(inode, iocb, count, READ);
>  
>  	if (iocb->ki_flags & IOCB_NOWAIT) {
> -		if (!down_read_trylock(&fi->i_gc_rwsem[READ])) {
> +		if (!f2fs_down_read_trylock(&fi->i_gc_rwsem[READ])) {
>  			ret = -EAGAIN;
>  			goto out;
>  		}
>  	} else {
> -		down_read(&fi->i_gc_rwsem[READ]);
> +		f2fs_down_read(&fi->i_gc_rwsem[READ]);
>  	}
>  
>  	/*
> @@ -4311,7 +4311,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		ret = iomap_dio_complete(dio);
>  	}
>  
> -	up_read(&fi->i_gc_rwsem[READ]);
> +	f2fs_up_read(&fi->i_gc_rwsem[READ]);
>  
>  	file_accessed(file);
>  out:
> @@ -4493,12 +4493,12 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  			goto out;
>  		}
>  
> -		if (!down_read_trylock(&fi->i_gc_rwsem[WRITE])) {
> +		if (!f2fs_down_read_trylock(&fi->i_gc_rwsem[WRITE])) {
>  			ret = -EAGAIN;
>  			goto out;
>  		}
> -		if (do_opu && !down_read_trylock(&fi->i_gc_rwsem[READ])) {
> -			up_read(&fi->i_gc_rwsem[WRITE]);
> +		if (do_opu && !f2fs_down_read_trylock(&fi->i_gc_rwsem[READ])) {
> +			f2fs_up_read(&fi->i_gc_rwsem[WRITE]);
>  			ret = -EAGAIN;
>  			goto out;
>  		}
> @@ -4507,9 +4507,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  		if (ret)
>  			goto out;
>  
> -		down_read(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_down_read(&fi->i_gc_rwsem[WRITE]);
>  		if (do_opu)
> -			down_read(&fi->i_gc_rwsem[READ]);
> +			f2fs_down_read(&fi->i_gc_rwsem[READ]);
>  	}
>  	if (whint_mode == WHINT_MODE_OFF)
>  		iocb->ki_hint = WRITE_LIFE_NOT_SET;
> @@ -4538,8 +4538,8 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  	if (whint_mode == WHINT_MODE_OFF)
>  		iocb->ki_hint = hint;
>  	if (do_opu)
> -		up_read(&fi->i_gc_rwsem[READ]);
> -	up_read(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_up_read(&fi->i_gc_rwsem[READ]);
> +	f2fs_up_read(&fi->i_gc_rwsem[WRITE]);
>  
>  	if (ret < 0)
>  		goto out;
> @@ -4640,12 +4640,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  
>  	/* Don't leave any preallocated blocks around past i_size. */
>  	if (preallocated && i_size_read(inode) < target_size) {
> -		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		filemap_invalidate_lock(inode->i_mapping);
>  		if (!f2fs_truncate(inode))
>  			file_dont_truncate(inode);
>  		filemap_invalidate_unlock(inode->i_mapping);
> -		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	} else {
>  		file_dont_truncate(inode);
>  	}
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a6accec60d04..7a486bbf9c07 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -105,21 +105,21 @@ static int gc_thread_func(void *data)
>  			spin_unlock(&sbi->gc_urgent_high_lock);
>  
>  			wait_ms = gc_th->urgent_sleep_time;
> -			down_write(&sbi->gc_lock);
> +			f2fs_down_write(&sbi->gc_lock);
>  			goto do_gc;
>  		}
>  
>  		if (foreground) {
> -			down_write(&sbi->gc_lock);
> +			f2fs_down_write(&sbi->gc_lock);
>  			goto do_gc;
> -		} else if (!down_write_trylock(&sbi->gc_lock)) {
> +		} else if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>  			stat_other_skip_bggc_count(sbi);
>  			goto next;
>  		}
>  
>  		if (!is_idle(sbi, GC_TIME)) {
>  			increase_sleep_time(gc_th, &wait_ms);
> -			up_write(&sbi->gc_lock);
> +			f2fs_up_write(&sbi->gc_lock);
>  			stat_io_skip_bggc_count(sbi);
>  			goto next;
>  		}
> @@ -1230,7 +1230,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
>  
>  	if (lfs_mode)
> -		down_write(&fio.sbi->io_order_lock);
> +		f2fs_down_write(&fio.sbi->io_order_lock);
>  
>  	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
>  					fio.old_blkaddr, false);
> @@ -1316,7 +1316,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  							true, true, true);
>  up_out:
>  	if (lfs_mode)
> -		up_write(&fio.sbi->io_order_lock);
> +		f2fs_up_write(&fio.sbi->io_order_lock);
>  put_out:
>  	f2fs_put_dnode(&dn);
>  out:
> @@ -1476,7 +1476,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  					special_file(inode->i_mode))
>  				continue;
>  
> -			if (!down_write_trylock(
> +			if (!f2fs_down_write_trylock(
>  				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
>  				iput(inode);
>  				sbi->skipped_gc_rwsem++;
> @@ -1489,7 +1489,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  			if (f2fs_post_read_required(inode)) {
>  				int err = ra_data_block(inode, start_bidx);
>  
> -				up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  				if (err) {
>  					iput(inode);
>  					continue;
> @@ -1500,7 +1500,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  
>  			data_page = f2fs_get_read_data_page(inode,
>  						start_bidx, REQ_RAHEAD, true);
> -			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  			if (IS_ERR(data_page)) {
>  				iput(inode);
>  				continue;
> @@ -1519,14 +1519,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  			int err;
>  
>  			if (S_ISREG(inode->i_mode)) {
> -				if (!down_write_trylock(&fi->i_gc_rwsem[READ])) {
> +				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[READ])) {
>  					sbi->skipped_gc_rwsem++;
>  					continue;
>  				}
> -				if (!down_write_trylock(
> +				if (!f2fs_down_write_trylock(
>  						&fi->i_gc_rwsem[WRITE])) {
>  					sbi->skipped_gc_rwsem++;
> -					up_write(&fi->i_gc_rwsem[READ]);
> +					f2fs_up_write(&fi->i_gc_rwsem[READ]);
>  					continue;
>  				}
>  				locked = true;
> @@ -1549,8 +1549,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  				submitted++;
>  
>  			if (locked) {
> -				up_write(&fi->i_gc_rwsem[WRITE]);
> -				up_write(&fi->i_gc_rwsem[READ]);
> +				f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +				f2fs_up_write(&fi->i_gc_rwsem[READ]);
>  			}
>  
>  			stat_inc_data_blk_count(sbi, 1, gc_type);
> @@ -1808,7 +1808,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>  				reserved_segments(sbi),
>  				prefree_segments(sbi));
>  
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->gc_lock);
>  
>  	put_gc_inode(&gc_list);
>  
> @@ -1937,7 +1937,7 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
>  	long long block_count;
>  	int segs = secs * sbi->segs_per_sec;
>  
> -	down_write(&sbi->sb_lock);
> +	f2fs_down_write(&sbi->sb_lock);
>  
>  	section_count = le32_to_cpu(raw_sb->section_count);
>  	segment_count = le32_to_cpu(raw_sb->segment_count);
> @@ -1958,7 +1958,7 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
>  						cpu_to_le32(dev_segs + segs);
>  	}
>  
> -	up_write(&sbi->sb_lock);
> +	f2fs_up_write(&sbi->sb_lock);
>  }
>  
>  static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
> @@ -2032,7 +2032,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
>  
>  	/* stop other GC */
> -	if (!down_write_trylock(&sbi->gc_lock))
> +	if (!f2fs_down_write_trylock(&sbi->gc_lock))
>  		return -EAGAIN;
>  
>  	/* stop CP to protect MAIN_SEC in free_segment_range */
> @@ -2052,15 +2052,15 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  
>  out_unlock:
>  	f2fs_unlock_op(sbi);
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->gc_lock);
>  	if (err)
>  		return err;
>  
>  	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  
>  	freeze_super(sbi->sb);
> -	down_write(&sbi->gc_lock);
> -	down_write(&sbi->cp_global_sem);
> +	f2fs_down_write(&sbi->gc_lock);
> +	f2fs_down_write(&sbi->cp_global_sem);
>  
>  	spin_lock(&sbi->stat_lock);
>  	if (shrunk_blocks + valid_user_blocks(sbi) +
> @@ -2105,8 +2105,8 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		spin_unlock(&sbi->stat_lock);
>  	}
>  out_err:
> -	up_write(&sbi->cp_global_sem);
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->cp_global_sem);
> +	f2fs_up_write(&sbi->gc_lock);
>  	thaw_super(sbi->sb);
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  	return err;
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 4b5cefa3f90c..a578bf83b803 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -629,7 +629,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
>  	}
>  
>  	if (inode) {
> -		down_write(&F2FS_I(inode)->i_sem);
> +		f2fs_down_write(&F2FS_I(inode)->i_sem);
>  		page = f2fs_init_inode_metadata(inode, dir, fname, ipage);
>  		if (IS_ERR(page)) {
>  			err = PTR_ERR(page);
> @@ -658,7 +658,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
>  	f2fs_update_parent_metadata(dir, inode, 0);
>  fail:
>  	if (inode)
> -		up_write(&F2FS_I(inode)->i_sem);
> +		f2fs_up_write(&F2FS_I(inode)->i_sem);
>  out:
>  	f2fs_put_page(ipage, 1);
>  	return err;
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index a728a0af9ce0..0347c5780910 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -196,7 +196,7 @@ static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *
>  	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
>  	int i, cold_count, hot_count;
>  
> -	down_read(&sbi->sb_lock);
> +	f2fs_down_read(&sbi->sb_lock);
>  
>  	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>  	hot_count = sbi->raw_super->hot_ext_count;
> @@ -206,7 +206,7 @@ static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *
>  			break;
>  	}
>  
> -	up_read(&sbi->sb_lock);
> +	f2fs_up_read(&sbi->sb_lock);
>  
>  	if (i == cold_count + hot_count)
>  		return;
> @@ -299,19 +299,19 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>  			(!ext_cnt && !noext_cnt))
>  		return;
>  
> -	down_read(&sbi->sb_lock);
> +	f2fs_down_read(&sbi->sb_lock);
>  
>  	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>  	hot_count = sbi->raw_super->hot_ext_count;
>  
>  	for (i = cold_count; i < cold_count + hot_count; i++) {
>  		if (is_extension_exist(name, extlist[i], false)) {
> -			up_read(&sbi->sb_lock);
> +			f2fs_up_read(&sbi->sb_lock);
>  			return;
>  		}
>  	}
>  
> -	up_read(&sbi->sb_lock);
> +	f2fs_up_read(&sbi->sb_lock);
>  
>  	for (i = 0; i < noext_cnt; i++) {
>  		if (is_extension_exist(name, noext[i], false)) {
> @@ -1023,11 +1023,11 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>  		new_page = NULL;
>  
>  		new_inode->i_ctime = current_time(new_inode);
> -		down_write(&F2FS_I(new_inode)->i_sem);
> +		f2fs_down_write(&F2FS_I(new_inode)->i_sem);
>  		if (old_dir_entry)
>  			f2fs_i_links_write(new_inode, false);
>  		f2fs_i_links_write(new_inode, false);
> -		up_write(&F2FS_I(new_inode)->i_sem);
> +		f2fs_up_write(&F2FS_I(new_inode)->i_sem);
>  
>  		if (!new_inode->i_nlink)
>  			f2fs_add_orphan_inode(new_inode);
> @@ -1048,13 +1048,13 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>  			f2fs_i_links_write(new_dir, true);
>  	}
>  
> -	down_write(&F2FS_I(old_inode)->i_sem);
> +	f2fs_down_write(&F2FS_I(old_inode)->i_sem);
>  	if (!old_dir_entry || whiteout)
>  		file_lost_pino(old_inode);
>  	else
>  		/* adjust dir's i_pino to pass fsck check */
>  		f2fs_i_pino_write(old_inode, new_dir->i_ino);
> -	up_write(&F2FS_I(old_inode)->i_sem);
> +	f2fs_up_write(&F2FS_I(old_inode)->i_sem);
>  
>  	old_inode->i_ctime = current_time(old_inode);
>  	f2fs_mark_inode_dirty_sync(old_inode, false);
> @@ -1214,38 +1214,38 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
>  	/* update directory entry info of old dir inode */
>  	f2fs_set_link(old_dir, old_entry, old_page, new_inode);
>  
> -	down_write(&F2FS_I(old_inode)->i_sem);
> +	f2fs_down_write(&F2FS_I(old_inode)->i_sem);
>  	if (!old_dir_entry)
>  		file_lost_pino(old_inode);
>  	else
>  		/* adjust dir's i_pino to pass fsck check */
>  		f2fs_i_pino_write(old_inode, new_dir->i_ino);
> -	up_write(&F2FS_I(old_inode)->i_sem);
> +	f2fs_up_write(&F2FS_I(old_inode)->i_sem);
>  
>  	old_dir->i_ctime = current_time(old_dir);
>  	if (old_nlink) {
> -		down_write(&F2FS_I(old_dir)->i_sem);
> +		f2fs_down_write(&F2FS_I(old_dir)->i_sem);
>  		f2fs_i_links_write(old_dir, old_nlink > 0);
> -		up_write(&F2FS_I(old_dir)->i_sem);
> +		f2fs_up_write(&F2FS_I(old_dir)->i_sem);
>  	}
>  	f2fs_mark_inode_dirty_sync(old_dir, false);
>  
>  	/* update directory entry info of new dir inode */
>  	f2fs_set_link(new_dir, new_entry, new_page, old_inode);
>  
> -	down_write(&F2FS_I(new_inode)->i_sem);
> +	f2fs_down_write(&F2FS_I(new_inode)->i_sem);
>  	if (!new_dir_entry)
>  		file_lost_pino(new_inode);
>  	else
>  		/* adjust dir's i_pino to pass fsck check */
>  		f2fs_i_pino_write(new_inode, old_dir->i_ino);
> -	up_write(&F2FS_I(new_inode)->i_sem);
> +	f2fs_up_write(&F2FS_I(new_inode)->i_sem);
>  
>  	new_dir->i_ctime = current_time(new_dir);
>  	if (new_nlink) {
> -		down_write(&F2FS_I(new_dir)->i_sem);
> +		f2fs_down_write(&F2FS_I(new_dir)->i_sem);
>  		f2fs_i_links_write(new_dir, new_nlink > 0);
> -		up_write(&F2FS_I(new_dir)->i_sem);
> +		f2fs_up_write(&F2FS_I(new_dir)->i_sem);
>  	}
>  	f2fs_mark_inode_dirty_sync(new_dir, false);
>  
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e0b5eb28d383..6ce0d7e92cac 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -382,14 +382,14 @@ int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
>  	struct nat_entry *e;
>  	bool need = false;
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  	e = __lookup_nat_cache(nm_i, nid);
>  	if (e) {
>  		if (!get_nat_flag(e, IS_CHECKPOINTED) &&
>  				!get_nat_flag(e, HAS_FSYNCED_INODE))
>  			need = true;
>  	}
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  	return need;
>  }
>  
> @@ -399,11 +399,11 @@ bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid)
>  	struct nat_entry *e;
>  	bool is_cp = true;
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  	e = __lookup_nat_cache(nm_i, nid);
>  	if (e && !get_nat_flag(e, IS_CHECKPOINTED))
>  		is_cp = false;
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  	return is_cp;
>  }
>  
> @@ -413,13 +413,13 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
>  	struct nat_entry *e;
>  	bool need_update = true;
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  	e = __lookup_nat_cache(nm_i, ino);
>  	if (e && get_nat_flag(e, HAS_LAST_FSYNC) &&
>  			(get_nat_flag(e, IS_CHECKPOINTED) ||
>  			 get_nat_flag(e, HAS_FSYNCED_INODE)))
>  		need_update = false;
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  	return need_update;
>  }
>  
> @@ -431,14 +431,14 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
>  	struct nat_entry *new, *e;
>  
>  	/* Let's mitigate lock contention of nat_tree_lock during checkpoint */
> -	if (rwsem_is_locked(&sbi->cp_global_sem))
> +	if (f2fs_rwsem_is_locked(&sbi->cp_global_sem))
>  		return;
>  
>  	new = __alloc_nat_entry(sbi, nid, false);
>  	if (!new)
>  		return;
>  
> -	down_write(&nm_i->nat_tree_lock);
> +	f2fs_down_write(&nm_i->nat_tree_lock);
>  	e = __lookup_nat_cache(nm_i, nid);
>  	if (!e)
>  		e = __init_nat_entry(nm_i, new, ne, false);
> @@ -447,7 +447,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
>  				nat_get_blkaddr(e) !=
>  					le32_to_cpu(ne->block_addr) ||
>  				nat_get_version(e) != ne->version);
> -	up_write(&nm_i->nat_tree_lock);
> +	f2fs_up_write(&nm_i->nat_tree_lock);
>  	if (e != new)
>  		__free_nat_entry(new);
>  }
> @@ -459,7 +459,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
>  	struct nat_entry *e;
>  	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
>  
> -	down_write(&nm_i->nat_tree_lock);
> +	f2fs_down_write(&nm_i->nat_tree_lock);
>  	e = __lookup_nat_cache(nm_i, ni->nid);
>  	if (!e) {
>  		e = __init_nat_entry(nm_i, new, NULL, true);
> @@ -508,7 +508,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
>  			set_nat_flag(e, HAS_FSYNCED_INODE, true);
>  		set_nat_flag(e, HAS_LAST_FSYNC, fsync_done);
>  	}
> -	up_write(&nm_i->nat_tree_lock);
> +	f2fs_up_write(&nm_i->nat_tree_lock);
>  }
>  
>  int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
> @@ -516,7 +516,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>  	int nr = nr_shrink;
>  
> -	if (!down_write_trylock(&nm_i->nat_tree_lock))
> +	if (!f2fs_down_write_trylock(&nm_i->nat_tree_lock))
>  		return 0;
>  
>  	spin_lock(&nm_i->nat_list_lock);
> @@ -538,7 +538,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
>  	}
>  	spin_unlock(&nm_i->nat_list_lock);
>  
> -	up_write(&nm_i->nat_tree_lock);
> +	f2fs_up_write(&nm_i->nat_tree_lock);
>  	return nr - nr_shrink;
>  }
>  
> @@ -560,13 +560,13 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>  	ni->nid = nid;
>  retry:
>  	/* Check nat cache */
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  	e = __lookup_nat_cache(nm_i, nid);
>  	if (e) {
>  		ni->ino = nat_get_ino(e);
>  		ni->blk_addr = nat_get_blkaddr(e);
>  		ni->version = nat_get_version(e);
> -		up_read(&nm_i->nat_tree_lock);
> +		f2fs_up_read(&nm_i->nat_tree_lock);
>  		return 0;
>  	}
>  
> @@ -576,11 +576,11 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>  	 * nat_tree_lock. Therefore, we should retry, if we failed to grab here
>  	 * while not bothering checkpoint.
>  	 */
> -	if (!rwsem_is_locked(&sbi->cp_global_sem) || checkpoint_context) {
> +	if (!f2fs_rwsem_is_locked(&sbi->cp_global_sem) || checkpoint_context) {
>  		down_read(&curseg->journal_rwsem);
> -	} else if (rwsem_is_contended(&nm_i->nat_tree_lock) ||
> +	} else if (f2fs_rwsem_is_contended(&nm_i->nat_tree_lock) ||
>  				!down_read_trylock(&curseg->journal_rwsem)) {
> -		up_read(&nm_i->nat_tree_lock);
> +		f2fs_up_read(&nm_i->nat_tree_lock);
>  		goto retry;
>  	}
>  
> @@ -589,15 +589,15 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>  		ne = nat_in_journal(journal, i);
>  		node_info_from_raw_nat(ni, &ne);
>  	}
> -	up_read(&curseg->journal_rwsem);
> +        up_read(&curseg->journal_rwsem);
>  	if (i >= 0) {
> -		up_read(&nm_i->nat_tree_lock);
> +		f2fs_up_read(&nm_i->nat_tree_lock);
>  		goto cache;
>  	}
>  
>  	/* Fill node_info from nat page */
>  	index = current_nat_addr(sbi, nid);
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  
>  	page = f2fs_get_meta_page(sbi, index);
>  	if (IS_ERR(page))
> @@ -1609,17 +1609,17 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>  		goto redirty_out;
>  
>  	if (wbc->for_reclaim) {
> -		if (!down_read_trylock(&sbi->node_write))
> +		if (!f2fs_down_read_trylock(&sbi->node_write))
>  			goto redirty_out;
>  	} else {
> -		down_read(&sbi->node_write);
> +		f2fs_down_read(&sbi->node_write);
>  	}
>  
>  	/* This page is already truncated */
>  	if (unlikely(ni.blk_addr == NULL_ADDR)) {
>  		ClearPageUptodate(page);
>  		dec_page_count(sbi, F2FS_DIRTY_NODES);
> -		up_read(&sbi->node_write);
> +		f2fs_up_read(&sbi->node_write);
>  		unlock_page(page);
>  		return 0;
>  	}
> @@ -1627,7 +1627,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>  	if (__is_valid_data_blkaddr(ni.blk_addr) &&
>  		!f2fs_is_valid_blkaddr(sbi, ni.blk_addr,
>  					DATA_GENERIC_ENHANCE)) {
> -		up_read(&sbi->node_write);
> +		f2fs_up_read(&sbi->node_write);
>  		goto redirty_out;
>  	}
>  
> @@ -1648,7 +1648,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>  	f2fs_do_write_node_page(nid, &fio);
>  	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(page));
>  	dec_page_count(sbi, F2FS_DIRTY_NODES);
> -	up_read(&sbi->node_write);
> +	f2fs_up_read(&sbi->node_write);
>  
>  	if (wbc->for_reclaim) {
>  		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, NODE);
> @@ -2225,14 +2225,14 @@ bool f2fs_nat_bitmap_enabled(struct f2fs_sb_info *sbi)
>  	unsigned int i;
>  	bool ret = true;
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  	for (i = 0; i < nm_i->nat_blocks; i++) {
>  		if (!test_bit_le(i, nm_i->nat_block_bitmap)) {
>  			ret = false;
>  			break;
>  		}
>  	}
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  
>  	return ret;
>  }
> @@ -2415,7 +2415,7 @@ static void scan_free_nid_bits(struct f2fs_sb_info *sbi)
>  	unsigned int i, idx;
>  	nid_t nid;
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  
>  	for (i = 0; i < nm_i->nat_blocks; i++) {
>  		if (!test_bit_le(i, nm_i->nat_block_bitmap))
> @@ -2438,7 +2438,7 @@ static void scan_free_nid_bits(struct f2fs_sb_info *sbi)
>  out:
>  	scan_curseg_cache(sbi);
>  
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  }
>  
>  static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
> @@ -2473,7 +2473,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
>  	f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), FREE_NID_PAGES,
>  							META_NAT, true);
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  
>  	while (1) {
>  		if (!test_bit_le(NAT_BLOCK_OFFSET(nid),
> @@ -2488,7 +2488,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
>  			}
>  
>  			if (ret) {
> -				up_read(&nm_i->nat_tree_lock);
> +				f2fs_up_read(&nm_i->nat_tree_lock);
>  				f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
>  				return ret;
>  			}
> @@ -2508,7 +2508,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
>  	/* find free nids from current sum_pages */
>  	scan_curseg_cache(sbi);
>  
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  
>  	f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nm_i->next_scan_nid),
>  					nm_i->ra_nid_pages, META_NAT, false);
> @@ -2953,7 +2953,7 @@ void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi)
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>  	unsigned int nat_ofs;
>  
> -	down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(&nm_i->nat_tree_lock);
>  
>  	for (nat_ofs = 0; nat_ofs < nm_i->nat_blocks; nat_ofs++) {
>  		unsigned int valid = 0, nid_ofs = 0;
> @@ -2973,7 +2973,7 @@ void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi)
>  		__update_nat_bits(nm_i, nat_ofs, valid);
>  	}
>  
> -	up_read(&nm_i->nat_tree_lock);
> +	f2fs_up_read(&nm_i->nat_tree_lock);
>  }
>  
>  static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
> @@ -3071,15 +3071,15 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	 * nat_cnt[DIRTY_NAT].
>  	 */
>  	if (cpc->reason & CP_UMOUNT) {
> -		down_write(&nm_i->nat_tree_lock);
> +		f2fs_down_write(&nm_i->nat_tree_lock);
>  		remove_nats_in_journal(sbi);
> -		up_write(&nm_i->nat_tree_lock);
> +		f2fs_up_write(&nm_i->nat_tree_lock);
>  	}
>  
>  	if (!nm_i->nat_cnt[DIRTY_NAT])
>  		return 0;
>  
> -	down_write(&nm_i->nat_tree_lock);
> +	f2fs_down_write(&nm_i->nat_tree_lock);
>  
>  	/*
>  	 * if there are no enough space in journal to store dirty nat
> @@ -3108,7 +3108,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  			break;
>  	}
>  
> -	up_write(&nm_i->nat_tree_lock);
> +	f2fs_up_write(&nm_i->nat_tree_lock);
>  	/* Allow dirty nats by node block allocation in write_begin */
>  
>  	return err;
> @@ -3228,7 +3228,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>  
>  	mutex_init(&nm_i->build_lock);
>  	spin_lock_init(&nm_i->nid_list_lock);
> -	init_rwsem(&nm_i->nat_tree_lock);
> +	init_f2fs_rwsem(&nm_i->nat_tree_lock);
>  
>  	nm_i->next_scan_nid = le32_to_cpu(sbi->ckpt->next_free_nid);
>  	nm_i->bitmap_size = __bitmap_size(sbi, NAT_BITMAP);
> @@ -3334,7 +3334,7 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
>  	spin_unlock(&nm_i->nid_list_lock);
>  
>  	/* destroy nat cache */
> -	down_write(&nm_i->nat_tree_lock);
> +	f2fs_down_write(&nm_i->nat_tree_lock);
>  	while ((found = __gang_lookup_nat_cache(nm_i,
>  					nid, NATVEC_SIZE, natvec))) {
>  		unsigned idx;
> @@ -3364,7 +3364,7 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
>  			kmem_cache_free(nat_entry_set_slab, setvec[idx]);
>  		}
>  	}
> -	up_write(&nm_i->nat_tree_lock);
> +	f2fs_up_write(&nm_i->nat_tree_lock);
>  
>  	kvfree(nm_i->nat_block_bitmap);
>  	if (nm_i->free_nid_bitmap) {
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index e65c73c4411d..be784f983b4a 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -796,7 +796,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	INIT_LIST_HEAD(&dir_list);
>  
>  	/* prevent checkpoint */
> -	down_write(&sbi->cp_global_sem);
> +	f2fs_down_write(&sbi->cp_global_sem);
>  
>  	/* step #1: find fsynced inode numbers */
>  	err = find_fsync_dnodes(sbi, &inode_list, check_only);
> @@ -845,7 +845,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	if (!err)
>  		clear_sbi_flag(sbi, SBI_POR_DOING);
>  
> -	up_write(&sbi->cp_global_sem);
> +	f2fs_up_write(&sbi->cp_global_sem);
>  
>  	/* let's drop all the directory inodes for clean checkpoint */
>  	destroy_fsync_dnodes(&dir_list, err);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b4a2f8c36149..b1a0769c0fad 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -474,7 +474,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
>  
>  	f2fs_balance_fs(sbi, true);
>  
> -	down_write(&fi->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>  
>  	f2fs_lock_op(sbi);
>  	set_inode_flag(inode, FI_ATOMIC_COMMIT);
> @@ -486,7 +486,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
>  	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
>  
>  	f2fs_unlock_op(sbi);
> -	up_write(&fi->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>  
>  	return err;
>  }
> @@ -524,7 +524,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  			io_schedule();
>  			finish_wait(&sbi->gc_thread->fggc_wq, &wait);
>  		} else {
> -			down_write(&sbi->gc_lock);
> +			f2fs_down_write(&sbi->gc_lock);
>  			f2fs_gc(sbi, false, false, false, NULL_SEGNO);
>  		}
>  	}
> @@ -532,7 +532,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  
>  static inline bool excess_dirty_threshold(struct f2fs_sb_info *sbi)
>  {
> -	int factor = rwsem_is_locked(&sbi->cp_rwsem) ? 3 : 2;
> +	int factor = f2fs_rwsem_is_locked(&sbi->cp_rwsem) ? 3 : 2;
>  	unsigned int dents = get_pages(sbi, F2FS_DIRTY_DENTS);
>  	unsigned int qdata = get_pages(sbi, F2FS_DIRTY_QDATA);
>  	unsigned int nodes = get_pages(sbi, F2FS_DIRTY_NODES);
> @@ -573,7 +573,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
>  
>  	/* there is background inflight IO or foreground operation recently */
>  	if (is_inflight_io(sbi, REQ_TIME) ||
> -		(!f2fs_time_over(sbi, REQ_TIME) && rwsem_is_locked(&sbi->cp_rwsem)))
> +		(!f2fs_time_over(sbi, REQ_TIME) && f2fs_rwsem_is_locked(&sbi->cp_rwsem)))
>  		return;
>  
>  	/* exceed periodical checkpoint timeout threshold */
> @@ -2824,7 +2824,7 @@ static void __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
>  	if (!sbi->am.atgc_enabled)
>  		return;
>  
> -	down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>  
>  	mutex_lock(&curseg->curseg_mutex);
>  	down_write(&SIT_I(sbi)->sentry_lock);
> @@ -2834,7 +2834,7 @@ static void __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
>  	up_write(&SIT_I(sbi)->sentry_lock);
>  	mutex_unlock(&curseg->curseg_mutex);
>  
> -	up_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_up_read(&SM_I(sbi)->curseg_lock);
>  
>  }
>  void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi)
> @@ -2985,7 +2985,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	unsigned int segno;
>  
> -	down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>  	mutex_lock(&curseg->curseg_mutex);
>  	down_write(&SIT_I(sbi)->sentry_lock);
>  
> @@ -3009,7 +3009,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>  			    type, segno, curseg->segno);
>  
>  	mutex_unlock(&curseg->curseg_mutex);
> -	up_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_up_read(&SM_I(sbi)->curseg_lock);
>  }
>  
>  static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
> @@ -3041,23 +3041,23 @@ static void __allocate_new_section(struct f2fs_sb_info *sbi,
>  
>  void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
>  {
> -	down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>  	down_write(&SIT_I(sbi)->sentry_lock);
>  	__allocate_new_section(sbi, type, force);
>  	up_write(&SIT_I(sbi)->sentry_lock);
> -	up_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_up_read(&SM_I(sbi)->curseg_lock);
>  }
>  
>  void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
>  {
>  	int i;
>  
> -	down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>  	down_write(&SIT_I(sbi)->sentry_lock);
>  	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
>  		__allocate_new_segment(sbi, i, false, false);
>  	up_write(&SIT_I(sbi)->sentry_lock);
> -	up_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_up_read(&SM_I(sbi)->curseg_lock);
>  }
>  
>  static const struct segment_allocation default_salloc_ops = {
> @@ -3195,9 +3195,9 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>  	if (sbi->discard_blks == 0)
>  		goto out;
>  
> -	down_write(&sbi->gc_lock);
> +	f2fs_down_write(&sbi->gc_lock);
>  	err = f2fs_write_checkpoint(sbi, &cpc);
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->gc_lock);
>  	if (err)
>  		goto out;
>  
> @@ -3434,7 +3434,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  	bool from_gc = (type == CURSEG_ALL_DATA_ATGC);
>  	struct seg_entry *se = NULL;
>  
> -	down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>  
>  	mutex_lock(&curseg->curseg_mutex);
>  	down_write(&sit_i->sentry_lock);
> @@ -3517,7 +3517,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  
>  	mutex_unlock(&curseg->curseg_mutex);
>  
> -	up_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_up_read(&SM_I(sbi)->curseg_lock);
>  }
>  
>  void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
> @@ -3553,7 +3553,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>  	bool keep_order = (f2fs_lfs_mode(fio->sbi) && type == CURSEG_COLD_DATA);
>  
>  	if (keep_order)
> -		down_read(&fio->sbi->io_order_lock);
> +		f2fs_down_read(&fio->sbi->io_order_lock);
>  reallocate:
>  	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
>  			&fio->new_blkaddr, sum, type, fio);
> @@ -3573,7 +3573,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>  	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
>  
>  	if (keep_order)
> -		up_read(&fio->sbi->io_order_lock);
> +		f2fs_up_read(&fio->sbi->io_order_lock);
>  }
>  
>  void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
> @@ -3708,7 +3708,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	se = get_seg_entry(sbi, segno);
>  	type = se->type;
>  
> -	down_write(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_write(&SM_I(sbi)->curseg_lock);
>  
>  	if (!recover_curseg) {
>  		/* for recovery flow */
> @@ -3777,7 +3777,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  
>  	up_write(&sit_i->sentry_lock);
>  	mutex_unlock(&curseg->curseg_mutex);
> -	up_write(&SM_I(sbi)->curseg_lock);
> +	f2fs_up_write(&SM_I(sbi)->curseg_lock);
>  }
>  
>  void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
> @@ -5261,7 +5261,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
>  
>  	INIT_LIST_HEAD(&sm_info->sit_entry_set);
>  
> -	init_rwsem(&sm_info->curseg_lock);
> +	init_f2fs_rwsem(&sm_info->curseg_lock);
>  
>  	if (!f2fs_readonly(sbi->sb)) {
>  		err = f2fs_create_flush_cmd_control(sbi);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 053b508d1e4f..2c43a38af733 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1362,16 +1362,16 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>  	/* Initialize f2fs-specific inode info */
>  	atomic_set(&fi->dirty_pages, 0);
>  	atomic_set(&fi->i_compr_blocks, 0);
> -	init_rwsem(&fi->i_sem);
> +	init_f2fs_rwsem(&fi->i_sem);
>  	spin_lock_init(&fi->i_size_lock);
>  	INIT_LIST_HEAD(&fi->dirty_list);
>  	INIT_LIST_HEAD(&fi->gdirty_list);
>  	INIT_LIST_HEAD(&fi->inmem_ilist);
>  	INIT_LIST_HEAD(&fi->inmem_pages);
>  	mutex_init(&fi->inmem_lock);
> -	init_rwsem(&fi->i_gc_rwsem[READ]);
> -	init_rwsem(&fi->i_gc_rwsem[WRITE]);
> -	init_rwsem(&fi->i_xattr_sem);
> +	init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
> +	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
> +	init_f2fs_rwsem(&fi->i_xattr_sem);
>  
>  	/* Will be used by directory only */
>  	fi->i_dir_level = F2FS_SB(sb)->dir_level;
> @@ -2095,7 +2095,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  	f2fs_update_time(sbi, DISABLE_TIME);
>  
>  	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
> -		down_write(&sbi->gc_lock);
> +		f2fs_down_write(&sbi->gc_lock);
>  		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
>  		if (err == -ENODATA) {
>  			err = 0;
> @@ -2117,7 +2117,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  		goto restore_flag;
>  	}
>  
> -	down_write(&sbi->gc_lock);
> +	f2fs_down_write(&sbi->gc_lock);
>  	cpc.reason = CP_PAUSE;
>  	set_sbi_flag(sbi, SBI_CP_DISABLED);
>  	err = f2fs_write_checkpoint(sbi, &cpc);
> @@ -2129,7 +2129,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  	spin_unlock(&sbi->stat_lock);
>  
>  out_unlock:
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->gc_lock);
>  restore_flag:
>  	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
>  	return err;
> @@ -2149,12 +2149,12 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
>  	if (unlikely(retry < 0))
>  		f2fs_warn(sbi, "checkpoint=enable has some unwritten data.");
>  
> -	down_write(&sbi->gc_lock);
> +	f2fs_down_write(&sbi->gc_lock);
>  	f2fs_dirty_to_prefree(sbi);
>  
>  	clear_sbi_flag(sbi, SBI_CP_DISABLED);
>  	set_sbi_flag(sbi, SBI_IS_DIRTY);
> -	up_write(&sbi->gc_lock);
> +	f2fs_up_write(&sbi->gc_lock);
>  
>  	f2fs_sync_fs(sbi->sb, 1);
>  }
> @@ -2715,18 +2715,18 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>  		/*
>  		 * do_quotactl
>  		 *  f2fs_quota_sync
> -		 *  down_read(quota_sem)
> +		 *  f2fs_down_read(quota_sem)
>  		 *  dquot_writeback_dquots()
>  		 *  f2fs_dquot_commit
>  		 *			      block_operation
> -		 *			      down_read(quota_sem)
> +		 *			      f2fs_down_read(quota_sem)
>  		 */
>  		f2fs_lock_op(sbi);
> -		down_read(&sbi->quota_sem);
> +		f2fs_down_read(&sbi->quota_sem);
>  
>  		ret = f2fs_quota_sync_file(sbi, cnt);
>  
> -		up_read(&sbi->quota_sem);
> +		f2fs_up_read(&sbi->quota_sem);
>  		f2fs_unlock_op(sbi);
>  
>  		inode_unlock(dqopt->files[cnt]);
> @@ -2851,11 +2851,11 @@ static int f2fs_dquot_commit(struct dquot *dquot)
>  	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>  	int ret;
>  
> -	down_read_nested(&sbi->quota_sem, SINGLE_DEPTH_NESTING);
> +	f2fs_down_read_nested(&sbi->quota_sem, SINGLE_DEPTH_NESTING);
>  	ret = dquot_commit(dquot);
>  	if (ret < 0)
>  		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> -	up_read(&sbi->quota_sem);
> +	f2fs_up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
> @@ -2864,11 +2864,11 @@ static int f2fs_dquot_acquire(struct dquot *dquot)
>  	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>  	int ret;
>  
> -	down_read(&sbi->quota_sem);
> +	f2fs_down_read(&sbi->quota_sem);
>  	ret = dquot_acquire(dquot);
>  	if (ret < 0)
>  		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> -	up_read(&sbi->quota_sem);
> +	f2fs_up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
> @@ -3609,14 +3609,14 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>  
>  	INIT_LIST_HEAD(&sbi->s_list);
>  	mutex_init(&sbi->umount_mutex);
> -	init_rwsem(&sbi->io_order_lock);
> +	init_f2fs_rwsem(&sbi->io_order_lock);
>  	spin_lock_init(&sbi->cp_lock);
>  
>  	sbi->dirty_device = 0;
>  	spin_lock_init(&sbi->dev_lock);
>  
> -	init_rwsem(&sbi->sb_lock);
> -	init_rwsem(&sbi->pin_sem);
> +	init_f2fs_rwsem(&sbi->sb_lock);
> +	init_f2fs_rwsem(&sbi->pin_sem);
>  }
>  
>  static int init_percpu_info(struct f2fs_sb_info *sbi)
> @@ -4068,11 +4068,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	/* init f2fs-specific super block info */
>  	sbi->valid_super_block = valid_super_block;
> -	init_rwsem(&sbi->gc_lock);
> +	init_f2fs_rwsem(&sbi->gc_lock);
>  	mutex_init(&sbi->writepages);
> -	init_rwsem(&sbi->cp_global_sem);
> -	init_rwsem(&sbi->node_write);
> -	init_rwsem(&sbi->node_change);
> +	init_f2fs_rwsem(&sbi->cp_global_sem);
> +	init_f2fs_rwsem(&sbi->node_write);
> +	init_f2fs_rwsem(&sbi->node_change);
>  
>  	/* disallow all the data/node/meta page writes */
>  	set_sbi_flag(sbi, SBI_POR_DOING);
> @@ -4093,18 +4093,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		}
>  
>  		for (j = HOT; j < n; j++) {
> -			init_rwsem(&sbi->write_io[i][j].io_rwsem);
> +			init_f2fs_rwsem(&sbi->write_io[i][j].io_rwsem);
>  			sbi->write_io[i][j].sbi = sbi;
>  			sbi->write_io[i][j].bio = NULL;
>  			spin_lock_init(&sbi->write_io[i][j].io_lock);
>  			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
>  			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
> -			init_rwsem(&sbi->write_io[i][j].bio_list_lock);
> +			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
>  		}
>  	}
>  
> -	init_rwsem(&sbi->cp_rwsem);
> -	init_rwsem(&sbi->quota_sem);
> +	init_f2fs_rwsem(&sbi->cp_rwsem);
> +	init_f2fs_rwsem(&sbi->quota_sem);
>  	init_waitqueue_head(&sbi->cp_wait);
>  	init_sb_info(sbi);
>  
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f8a14b1e2ef7..c81726096c71 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -364,7 +364,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		if (!strlen(name) || strlen(name) >= F2FS_EXTENSION_LEN)
>  			return -EINVAL;
>  
> -		down_write(&sbi->sb_lock);
> +		f2fs_down_write(&sbi->sb_lock);
>  
>  		ret = f2fs_update_extension_list(sbi, name, hot, set);
>  		if (ret)
> @@ -374,7 +374,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		if (ret)
>  			f2fs_update_extension_list(sbi, name, hot, !set);
>  out:
> -		up_write(&sbi->sb_lock);
> +		f2fs_up_write(&sbi->sb_lock);
>  		return ret ? ret : count;
>  	}
>  
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index fe5acdccaae1..3d793202cc9f 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -208,7 +208,7 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  	 * from re-instantiating cached pages we are truncating (since unlike
>  	 * normal file accesses, garbage collection isn't limited by i_size).
>  	 */
> -	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	truncate_inode_pages(inode->i_mapping, inode->i_size);
>  	err2 = f2fs_truncate(inode);
>  	if (err2) {
> @@ -216,7 +216,7 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  			 err2);
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  	}
> -	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
>  	return err ?: err2;
>  }
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 8e5cd9c916ff..c76c15086e5f 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -525,10 +525,10 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>  	if (len > F2FS_NAME_LEN)
>  		return -ERANGE;
>  
> -	down_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
>  	error = lookup_all_xattrs(inode, ipage, index, len, name,
>  				&entry, &base_addr, &base_size, &is_inline);
> -	up_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
>  	if (error)
>  		return error;
>  
> @@ -562,9 +562,9 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  	int error;
>  	size_t rest = buffer_size;
>  
> -	down_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
>  	error = read_all_xattrs(inode, NULL, &base_addr);
> -	up_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
>  	if (error)
>  		return error;
>  
> @@ -786,9 +786,9 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
>  	f2fs_balance_fs(sbi, true);
>  
>  	f2fs_lock_op(sbi);
> -	down_write(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
>  	err = __f2fs_setxattr(inode, index, name, value, size, ipage, flags);
> -	up_write(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
>  	f2fs_unlock_op(sbi);
>  
>  	f2fs_update_time(sbi, REQ_TIME);
> -- 
> 2.34.1.575.g55b058a8bb-goog
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
