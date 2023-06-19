Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F224735940
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 16:13:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBFd9-00019n-Bz;
	Mon, 19 Jun 2023 14:13:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBFca-00019C-3t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VkVk6AAtIkYHOc1Q82xJKJRbA6xMitzvbcWpNgw+4jw=; b=d/xS/rrmq3Kg6pP6nYM7Pkg+zf
 Q0JNVhZQLb0aywaGl3y6eOKbrmMmdt+OQylJGm4+b/OB2KPkYWVURE4ftRlbrdGO+7NZBAaGei0gk
 AHYuLASvcbAyHVy/OM/xU5wqplCGLd1pHSBq+iaDQ2MZc4LcS+W/Z56AJIoOmUpPY9Z4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VkVk6AAtIkYHOc1Q82xJKJRbA6xMitzvbcWpNgw+4jw=; b=Ln6Wx6d34YGyXqWzjaiTz799Rr
 1hY0mdL1QkGAp+59DJRR3fpaoRt1KegdMFf5sLXcs68zHcVYYo1qI/zcM01TY1/FQ9FVqZ/fxqAH3
 yjwmquxJh5umD75RioK1mf9Ly8Cc5+HdoTn6gVUHC97zXt3K55mlhsaXO3IRhZr5oMzA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBFcX-008iy1-FP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:12:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 29C8060C8C;
 Mon, 19 Jun 2023 14:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1948C433C8;
 Mon, 19 Jun 2023 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687183954;
 bh=CqRTqiJFQTk3jD2WrhjvQdqX7arr7rpBJCYAKJ37+ro=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=j2a4iskVM1KNe2Lq0lDTaY6f9voTJpB3jVEMgajg8mGNLV6OuZGcEpPGlCDdrDd9e
 DVEw2fCLeAEJpx0Gw7J6bMJLfIvWmJhtCNZ8A2jdHZMom6KvP8Xt9aKG74se+vm3Fk
 Y9PL037YMkOYFhL7ZKrQ6D5vdQugR2f/wczXl8hvNeZHipOpfOD8vWEj9RO4REN5eZ
 AHlN543D1b8lfT8JPziUZReKoirnTx2pZ2OiF1jTncR6jrIRZjKFTlJjbnDQNaGkdK
 82Hh6KSMK9IAwe0+WZGxSl2DuqzP7G5nmFQBhl5UoGT1hGHK4HuozFPs38JxDe5qeU
 tEKE+NgEIThgQ==
Message-ID: <bbf01cf2-5730-3bb0-83a9-bb3553c754d6@kernel.org>
Date: Mon, 19 Jun 2023 22:12:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20230420062207.26879-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230420062207.26879-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/20 14:22,
 Yangtao Li wrote: > Similar to FAULT_LOCK_OP, 
 this patch supports to inject fault into > variant of _trylock(), including:
 > - inode_trylock > - down_read_trylock > - down_write_tr [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBFcX-008iy1-FP
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: support FAULT_LOCK type fault
 injection
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
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/20 14:22, Yangtao Li wrote:
> Similar to FAULT_LOCK_OP, this patch supports to inject fault into
> variant of _trylock(), including:
>    - inode_trylock
>    - down_read_trylock
>    - down_write_trylock
>    - mutex_trylock
>    - sb_start_write_trylock
>    - trylock_page
> 
> Usage:
>    a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or
>    b) mount -o fault_type=524288 <dev> <mountpoint>
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304031801.hGbHuuBP-lkp@intel.com/
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v6:
> -rebase
>   Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
>   Documentation/filesystems/f2fs.rst      |  1 +
>   fs/f2fs/checkpoint.c                    |  6 +-
>   fs/f2fs/compress.c                      |  2 +-
>   fs/f2fs/data.c                          |  8 +--
>   fs/f2fs/extent_cache.c                  |  6 +-
>   fs/f2fs/f2fs.h                          | 73 ++++++++++++++++++++++---
>   fs/f2fs/file.c                          | 31 ++++++-----
>   fs/f2fs/gc.c                            | 12 ++--
>   fs/f2fs/namei.c                         |  4 +-
>   fs/f2fs/node.c                          | 28 +++++-----
>   fs/f2fs/segment.c                       | 27 ++++-----
>   fs/f2fs/shrinker.c                      | 10 ++--
>   fs/f2fs/super.c                         |  7 ++-
>   fs/f2fs/sysfs.c                         |  2 +-
>   fs/f2fs/xattr.c                         | 15 ++---
>   16 files changed, 146 insertions(+), 87 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 8140fc98f5ae..5ada174cf30c 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -708,6 +708,7 @@ Description:	Support configuring fault injection type, should be
>   		FAULT_DQUOT_INIT         0x000010000
>   		FAULT_LOCK_OP            0x000020000
>   		FAULT_BLKADDR            0x000040000
> +		FAULT_LOCK               0x000080000
>   		===================      ===========
>   
>   What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index c57745375edb..fafae551df9e 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
>   			 FAULT_DQUOT_INIT	  0x000010000
>   			 FAULT_LOCK_OP		  0x000020000
>   			 FAULT_BLKADDR		  0x000040000
> +			 FAULT_LOCK		  0x000080000
>   			 ===================	  ===========
>   mode=%s			 Control block allocation mode which supports "adaptive"
>   			 and "lfs". In "lfs" mode, there should be no random
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 64b3860f50ee..2887d62b4a17 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -389,7 +389,7 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
>   		goto skip_write;
>   
>   	/* if locked failed, cp will flush dirty pages instead */
> -	if (!f2fs_down_write_trylock(&sbi->cp_global_sem))
> +	if (!f2fs_down_write_trylock(sbi, &sbi->cp_global_sem))
>   		goto skip_write;
>   
>   	trace_f2fs_writepages(mapping->host, wbc, META);
> @@ -1182,7 +1182,7 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>   	if (!is_journalled_quota(sbi))
>   		return false;
>   
> -	if (!f2fs_down_write_trylock(&sbi->quota_sem))
> +	if (!f2fs_down_write_trylock(sbi, &sbi->quota_sem))
>   		return true;
>   	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
>   		ret = false;
> @@ -1228,7 +1228,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
>   		f2fs_unlock_all(sbi);
>   
>   		/* only failed during mount/umount/freeze/quotactl */
> -		locked = down_read_trylock(&sbi->sb->s_umount);
> +		locked = f2fs_raw_down_read_trylock(sbi, &sbi->sb->s_umount);
>   		f2fs_quota_sync(sbi->sb, -1);
>   		if (locked)
>   			up_read(&sbi->sb->s_umount);
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 11653fa79289..b94c3d5087f3 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1228,7 +1228,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>   		 * checkpoint. This can only happen to quota writes which can cause
>   		 * the below discard race condition.
>   		 */
> -		f2fs_down_read(&sbi->node_write);
> +		f2fs_down_read(sbi, &sbi->node_write);
>   	} else if (!f2fs_trylock_op(sbi)) {
>   		goto out_free;
>   	}
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8df225014304..872ed5554c26 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -680,7 +680,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
>   			enum page_type btype = PAGE_TYPE_OF_BIO(type);
>   			struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
>   
> -			f2fs_down_read(&io->io_rwsem);
> +			f2fs_down_read(sbi, &io->io_rwsem);
>   			ret = __has_merged_page(io->bio, inode, page, ino);
>   			f2fs_up_read(&io->io_rwsem);
>   		}
> @@ -884,7 +884,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
>   		if (list_empty(head))
>   			continue;
>   
> -		f2fs_down_read(&io->bio_list_lock);
> +		f2fs_down_read(sbi, &io->bio_list_lock);
>   		list_for_each_entry(be, head, list) {
>   			if (target)
>   				found = (target == be->bio);
> @@ -1447,7 +1447,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
>   static void f2fs_map_lock(struct f2fs_sb_info *sbi, int flag)
>   {
>   	if (flag == F2FS_GET_BLOCK_PRE_AIO)
> -		f2fs_down_read(&sbi->node_change);
> +		f2fs_down_read(sbi, &sbi->node_change);
>   	else
>   		f2fs_lock_op(sbi);
>   }
> @@ -2839,7 +2839,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>   		 * the below discard race condition.
>   		 */
>   		if (IS_NOQUOTA(inode))
> -			f2fs_down_read(&sbi->node_write);
> +			f2fs_down_read(sbi, &sbi->node_write);
>   
>   		fio.need_lock = LOCK_DONE;
>   		err = f2fs_do_write_data_page(&fio);
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index bea6ab9d846a..bab36a42bacf 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -917,7 +917,7 @@ static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
>   	if (!atomic_read(&eti->total_zombie_tree))
>   		goto free_node;
>   
> -	if (!mutex_trylock(&eti->extent_tree_lock))
> +	if (!f2fs_mutex_trylock(sbi, &eti->extent_tree_lock))
>   		goto out;
>   
>   	/* 1. remove unreferenced extent tree */
> @@ -943,7 +943,7 @@ static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
>   
>   free_node:
>   	/* 2. remove LRU extent entries */
> -	if (!mutex_trylock(&eti->extent_tree_lock))
> +	if (!f2fs_mutex_trylock(sbi, &eti->extent_tree_lock))
>   		goto out;
>   
>   	remained = nr_shrink - (node_cnt + tree_cnt);
> @@ -955,7 +955,7 @@ static unsigned int __shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink
>   		en = list_first_entry(&eti->extent_list,
>   					struct extent_node, list);
>   		et = en->et;
> -		if (!write_trylock(&et->lock)) {
> +		if (!f2fs_write_trylock(sbi, &et->lock)) {
>   			/* refresh this extent node's position in extent list */
>   			list_move_tail(&en->list, &eti->extent_list);
>   			continue;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d8cb1dc09f9f..2bbac3a15c5a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -61,6 +61,7 @@ enum {
>   	FAULT_DQUOT_INIT,
>   	FAULT_LOCK_OP,
>   	FAULT_BLKADDR,
> +	FAULT_LOCK,
>   	FAULT_MAX,
>   };
>   
> @@ -2079,27 +2080,76 @@ static inline int f2fs_rwsem_is_contended(struct f2fs_rwsem *sem)
>   	return rwsem_is_contended(&sem->internal_rwsem);
>   }
>   
> -static inline void f2fs_down_read(struct f2fs_rwsem *sem)
> +static inline int f2fs_down_read_trylock(struct f2fs_sb_info *sbi,
> +					struct f2fs_rwsem *sem)
> +{
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return down_read_trylock(&sem->internal_rwsem);
> +}
> +
> +static inline void f2fs_down_read(struct f2fs_sb_info *sbi, struct f2fs_rwsem *sem)
>   {
>   #ifdef CONFIG_F2FS_UNFAIR_RWSEM
> -	wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
> +	wait_event(sem->read_waiters, f2fs_down_read_trylock(sbi, sem));

It may hang if we wait on sem->read_waiters w/ TASK_UNINTERRUPTIBLE once we
inject FAULT_LOCK to f2fs_down_read_trylock(), it is due to FAULT_LOCK simulates
there is a write lock user, but if there isn't any write lock user, nobody will
call f2fs_up_write() to wake up the waiter.

Thanks,

>   #else
>   	down_read(&sem->internal_rwsem);
>   #endif
>   }
>   
> -static inline int f2fs_down_read_trylock(struct f2fs_rwsem *sem)
> +static inline int f2fs_raw_down_read_trylock(struct f2fs_sb_info *sbi,
> +					struct rw_semaphore *sem)
>   {
> -	return down_read_trylock(&sem->internal_rwsem);
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return down_read_trylock(sem);
> +}
> +
> +static inline int f2fs_inode_trylock(struct f2fs_sb_info *sbi,
> +					struct inode *inode)
> +{
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return down_write_trylock(&inode->i_rwsem);
> +}
> +
> +static inline int f2fs_mutex_trylock(struct f2fs_sb_info *sbi,
> +					struct mutex *lock)
> +{
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return mutex_trylock(lock);
> +}
> +
> +static inline int f2fs_trylock_page(struct f2fs_sb_info *sbi, struct page *page)
> +{
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return trylock_page(page);
> +}
> +
> +static inline int f2fs_write_trylock(struct f2fs_sb_info *sbi, rwlock_t *lock)
> +{
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return write_trylock(lock);
> +}
> +
> +static inline bool f2fs_sb_start_write_trylock(struct f2fs_sb_info *sbi)
> +{
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
> +	return sb_start_write_trylock(sbi->sb);
>   }
>   
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
> -static inline void f2fs_down_read_nested(struct f2fs_rwsem *sem, int subclass)
> +static inline void f2fs_down_read_nested(struct f2fs_sb_info *sbi,
> +					struct f2fs_rwsem *sem, int subclass)
>   {
>   	down_read_nested(&sem->internal_rwsem, subclass);
>   }
>   #else
> -#define f2fs_down_read_nested(sem, subclass) f2fs_down_read(sem)
> +#define f2fs_down_read_nested(sbi, sem, subclass) f2fs_down_read(sbi, sem)
>   #endif
>   
>   static inline void f2fs_up_read(struct f2fs_rwsem *sem)
> @@ -2112,8 +2162,11 @@ static inline void f2fs_down_write(struct f2fs_rwsem *sem)
>   	down_write(&sem->internal_rwsem);
>   }
>   
> -static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
> +static inline int f2fs_down_write_trylock(struct f2fs_sb_info *sbi,
> +					struct f2fs_rwsem *sem)
>   {
> +	if (time_to_inject(sbi, FAULT_LOCK))
> +		return 0;
>   	return down_write_trylock(&sem->internal_rwsem);
>   }
>   
> @@ -2127,14 +2180,16 @@ static inline void f2fs_up_write(struct f2fs_rwsem *sem)
>   
>   static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
>   {
> -	f2fs_down_read(&sbi->cp_rwsem);
> +	f2fs_down_read(sbi, &sbi->cp_rwsem);
>   }
>   
>   static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
>   {
> +	struct f2fs_rwsem *sem = &sbi->cp_rwsem;
> +
>   	if (time_to_inject(sbi, FAULT_LOCK_OP))
>   		return 0;
> -	return f2fs_down_read_trylock(&sbi->cp_rwsem);
> +	return down_read_trylock(&sem->internal_rwsem);
>   }
>   
>   static inline void f2fs_unlock_op(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 720be239955d..ad4a3d79ddf5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -316,7 +316,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>   	 * Both of fdatasync() and fsync() are able to be recovered from
>   	 * sudden-power-off.
>   	 */
> -	f2fs_down_read(&F2FS_I(inode)->i_sem);
> +	f2fs_down_read(sbi, &F2FS_I(inode)->i_sem);
>   	cp_reason = need_do_checkpoint(inode);
>   	f2fs_up_read(&F2FS_I(inode)->i_sem);
>   
> @@ -2466,7 +2466,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   		return ret;
>   
>   	if (!sync) {
> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
> @@ -2510,7 +2510,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   
>   do_more:
>   	if (!range->sync) {
> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
> @@ -2805,7 +2805,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   	inode_lock(src);
>   	if (src != dst) {
>   		ret = -EBUSY;
> -		if (!inode_trylock(dst))
> +		if (!f2fs_inode_trylock(sbi, dst))
>   			goto out;
>   	}
>   
> @@ -2855,7 +2855,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   	f2fs_down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
>   	if (src != dst) {
>   		ret = -EBUSY;
> -		if (!f2fs_down_write_trylock(&F2FS_I(dst)->i_gc_rwsem[WRITE]))
> +		if (!f2fs_down_write_trylock(sbi, &F2FS_I(dst)->i_gc_rwsem[WRITE]))
>   			goto out_src;
>   	}
>   
> @@ -2975,7 +2975,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>   	end_segno = min(start_segno + range.segments, dev_end_segno);
>   
>   	while (start_segno < end_segno) {
> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
> @@ -3325,7 +3325,7 @@ static int f2fs_ioc_getfslabel(struct file *filp, unsigned long arg)
>   	if (!vbuf)
>   		return -ENOMEM;
>   
> -	f2fs_down_read(&sbi->sb_lock);
> +	f2fs_down_read(sbi, &sbi->sb_lock);
>   	count = utf16s_to_utf8s(sbi->raw_super->volume_name,
>   			ARRAY_SIZE(sbi->raw_super->volume_name),
>   			UTF16_LITTLE_ENDIAN, vbuf, MAX_VOLUME_NAME);
> @@ -4335,12 +4335,12 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   	trace_f2fs_direct_IO_enter(inode, iocb, count, READ);
>   
>   	if (iocb->ki_flags & IOCB_NOWAIT) {
> -		if (!f2fs_down_read_trylock(&fi->i_gc_rwsem[READ])) {
> +		if (!f2fs_down_read_trylock(sbi, &fi->i_gc_rwsem[READ])) {
>   			ret = -EAGAIN;
>   			goto out;
>   		}
>   	} else {
> -		f2fs_down_read(&fi->i_gc_rwsem[READ]);
> +		f2fs_down_read(sbi, &fi->i_gc_rwsem[READ]);
>   	}
>   
>   	/*
> @@ -4582,11 +4582,11 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>   			goto out;
>   		}
>   
> -		if (!f2fs_down_read_trylock(&fi->i_gc_rwsem[WRITE])) {
> +		if (!f2fs_down_read_trylock(sbi, &fi->i_gc_rwsem[WRITE])) {
>   			ret = -EAGAIN;
>   			goto out;
>   		}
> -		if (do_opu && !f2fs_down_read_trylock(&fi->i_gc_rwsem[READ])) {
> +		if (do_opu && !f2fs_down_read_trylock(sbi, &fi->i_gc_rwsem[READ])) {
>   			f2fs_up_read(&fi->i_gc_rwsem[WRITE]);
>   			ret = -EAGAIN;
>   			goto out;
> @@ -4596,9 +4596,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>   		if (ret)
>   			goto out;
>   
> -		f2fs_down_read(&fi->i_gc_rwsem[WRITE]);
> +		f2fs_down_read(sbi, &fi->i_gc_rwsem[WRITE]);
>   		if (do_opu)
> -			f2fs_down_read(&fi->i_gc_rwsem[READ]);
> +			f2fs_down_read(sbi, &fi->i_gc_rwsem[READ]);
>   	}
>   
>   	/*
> @@ -4675,13 +4675,14 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	struct inode *inode = file_inode(iocb->ki_filp);
>   	const loff_t orig_pos = iocb->ki_pos;
>   	const size_t orig_count = iov_iter_count(from);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	loff_t target_size;
>   	bool dio;
>   	bool may_need_sync = true;
>   	int preallocated;
>   	ssize_t ret;
>   
> -	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode)))) {
> +	if (unlikely(f2fs_cp_error(sbi))) {
>   		ret = -EIO;
>   		goto out;
>   	}
> @@ -4692,7 +4693,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	}
>   
>   	if (iocb->ki_flags & IOCB_NOWAIT) {
> -		if (!inode_trylock(inode)) {
> +		if (!f2fs_inode_trylock(sbi, inode)) {
>   			ret = -EAGAIN;
>   			goto out;
>   		}
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 61c5f9d26018..3a7947f7895a 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -76,7 +76,7 @@ static int gc_thread_func(void *data)
>   			f2fs_stop_checkpoint(sbi, false,
>   					STOP_CP_REASON_FAULT_INJECT);
>   
> -		if (!sb_start_write_trylock(sbi->sb)) {
> +		if (!f2fs_sb_start_write_trylock(sbi)) {
>   			stat_other_skip_bggc_count(sbi);
>   			continue;
>   		}
> @@ -104,7 +104,7 @@ static int gc_thread_func(void *data)
>   		if (foreground) {
>   			f2fs_down_write(&sbi->gc_lock);
>   			goto do_gc;
> -		} else if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
> +		} else if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
>   			stat_other_skip_bggc_count(sbi);
>   			goto next;
>   		}
> @@ -1573,7 +1573,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   				return submitted;
>   			}
>   
> -			if (!f2fs_down_write_trylock(
> +			if (!f2fs_down_write_trylock(sbi,
>   				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
>   				iput(inode);
>   				sbi->skipped_gc_rwsem++;
> @@ -1616,11 +1616,11 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   			int err;
>   
>   			if (S_ISREG(inode->i_mode)) {
> -				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[WRITE])) {
> +				if (!f2fs_down_write_trylock(sbi, &fi->i_gc_rwsem[WRITE])) {
>   					sbi->skipped_gc_rwsem++;
>   					continue;
>   				}
> -				if (!f2fs_down_write_trylock(
> +				if (!f2fs_down_write_trylock(sbi,
>   						&fi->i_gc_rwsem[READ])) {
>   					sbi->skipped_gc_rwsem++;
>   					f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> @@ -2142,7 +2142,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>   	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
>   
>   	/* stop other GC */
> -	if (!f2fs_down_write_trylock(&sbi->gc_lock))
> +	if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock))
>   		return -EAGAIN;
>   
>   	/* stop CP to protect MAIN_SEC in free_segment_range */
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 77a71276ecb1..4d4426cda93a 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -144,7 +144,7 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   		return;
>   
>   	/* Don't compress hot files. */
> -	f2fs_down_read(&sbi->sb_lock);
> +	f2fs_down_read(sbi, &sbi->sb_lock);
>   	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>   	hot_count = sbi->raw_super->hot_ext_count;
>   	for (i = cold_count; i < cold_count + hot_count; i++)
> @@ -185,7 +185,7 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>   	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
>   	int i, cold_count, hot_count;
>   
> -	f2fs_down_read(&sbi->sb_lock);
> +	f2fs_down_read(sbi, &sbi->sb_lock);
>   	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>   	hot_count = sbi->raw_super->hot_ext_count;
>   	for (i = 0; i < cold_count + hot_count; i++)
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index bd1dad523796..bd108b0feb45 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -383,7 +383,7 @@ int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
>   	struct nat_entry *e;
>   	bool need = false;
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   	e = __lookup_nat_cache(nm_i, nid);
>   	if (e) {
>   		if (!get_nat_flag(e, IS_CHECKPOINTED) &&
> @@ -400,7 +400,7 @@ bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid)
>   	struct nat_entry *e;
>   	bool is_cp = true;
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   	e = __lookup_nat_cache(nm_i, nid);
>   	if (e && !get_nat_flag(e, IS_CHECKPOINTED))
>   		is_cp = false;
> @@ -414,7 +414,7 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
>   	struct nat_entry *e;
>   	bool need_update = true;
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   	e = __lookup_nat_cache(nm_i, ino);
>   	if (e && get_nat_flag(e, HAS_LAST_FSYNC) &&
>   			(get_nat_flag(e, IS_CHECKPOINTED) ||
> @@ -517,7 +517,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
>   	struct f2fs_nm_info *nm_i = NM_I(sbi);
>   	int nr = nr_shrink;
>   
> -	if (!f2fs_down_write_trylock(&nm_i->nat_tree_lock))
> +	if (!f2fs_down_write_trylock(sbi, &nm_i->nat_tree_lock))
>   		return 0;
>   
>   	spin_lock(&nm_i->nat_list_lock);
> @@ -561,7 +561,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>   	ni->nid = nid;
>   retry:
>   	/* Check nat cache */
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   	e = __lookup_nat_cache(nm_i, nid);
>   	if (e) {
>   		ni->ino = nat_get_ino(e);
> @@ -580,7 +580,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>   	if (!f2fs_rwsem_is_locked(&sbi->cp_global_sem) || checkpoint_context) {
>   		down_read(&curseg->journal_rwsem);
>   	} else if (f2fs_rwsem_is_contended(&nm_i->nat_tree_lock) ||
> -				!down_read_trylock(&curseg->journal_rwsem)) {
> +				!f2fs_raw_down_read_trylock(sbi, &curseg->journal_rwsem)) {
>   		f2fs_up_read(&nm_i->nat_tree_lock);
>   		goto retry;
>   	}
> @@ -1618,10 +1618,10 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>   		goto redirty_out;
>   
>   	if (wbc->for_reclaim) {
> -		if (!f2fs_down_read_trylock(&sbi->node_write))
> +		if (!f2fs_down_read_trylock(sbi, &sbi->node_write))
>   			goto redirty_out;
>   	} else {
> -		f2fs_down_read(&sbi->node_write);
> +		f2fs_down_read(sbi, &sbi->node_write);
>   	}
>   
>   	/* This page is already truncated */
> @@ -1982,7 +1982,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>   lock_node:
>   			if (wbc->sync_mode == WB_SYNC_ALL)
>   				lock_page(page);
> -			else if (!trylock_page(page))
> +			else if (!f2fs_trylock_page(sbi, page))
>   				continue;
>   
>   			if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
> @@ -2233,7 +2233,7 @@ bool f2fs_nat_bitmap_enabled(struct f2fs_sb_info *sbi)
>   	unsigned int i;
>   	bool ret = true;
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   	for (i = 0; i < nm_i->nat_blocks; i++) {
>   		if (!test_bit_le(i, nm_i->nat_block_bitmap)) {
>   			ret = false;
> @@ -2423,7 +2423,7 @@ static void scan_free_nid_bits(struct f2fs_sb_info *sbi)
>   	unsigned int i, idx;
>   	nid_t nid;
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   
>   	for (i = 0; i < nm_i->nat_blocks; i++) {
>   		if (!test_bit_le(i, nm_i->nat_block_bitmap))
> @@ -2481,7 +2481,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
>   	f2fs_ra_meta_pages(sbi, NAT_BLOCK_OFFSET(nid), FREE_NID_PAGES,
>   							META_NAT, true);
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   
>   	while (1) {
>   		if (!test_bit_le(NAT_BLOCK_OFFSET(nid),
> @@ -2636,7 +2636,7 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
>   	if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
>   		return 0;
>   
> -	if (!mutex_trylock(&nm_i->build_lock))
> +	if (!f2fs_mutex_trylock(sbi, &nm_i->build_lock))
>   		return 0;
>   
>   	while (nr_shrink && nm_i->nid_cnt[FREE_NID] > MAX_FREE_NIDS) {
> @@ -2959,7 +2959,7 @@ void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi)
>   	struct f2fs_nm_info *nm_i = NM_I(sbi);
>   	unsigned int nat_ofs;
>   
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> +	f2fs_down_read(sbi, &nm_i->nat_tree_lock);
>   
>   	for (nat_ofs = 0; nat_ofs < nm_i->nat_blocks; nat_ofs++) {
>   		unsigned int valid = 0, nid_ofs = 0;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 641bd8cc54da..77bee39498cd 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2807,7 +2807,7 @@ static void __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
>   	if (!sbi->am.atgc_enabled)
>   		return;
>   
> -	f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(sbi, &SM_I(sbi)->curseg_lock);
>   
>   	mutex_lock(&curseg->curseg_mutex);
>   	down_write(&SIT_I(sbi)->sentry_lock);
> @@ -2956,7 +2956,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   	struct curseg_info *curseg = CURSEG_I(sbi, type);
>   	unsigned int segno;
>   
> -	f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(sbi, &SM_I(sbi)->curseg_lock);
>   	mutex_lock(&curseg->curseg_mutex);
>   	down_write(&SIT_I(sbi)->sentry_lock);
>   
> @@ -3003,7 +3003,7 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
>   
>   void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
>   {
> -	f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(sbi, &SM_I(sbi)->curseg_lock);
>   	down_write(&SIT_I(sbi)->sentry_lock);
>   	__allocate_new_segment(sbi, type, true, force);
>   	up_write(&SIT_I(sbi)->sentry_lock);
> @@ -3014,7 +3014,7 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
>   {
>   	int i;
>   
> -	f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(sbi, &SM_I(sbi)->curseg_lock);
>   	down_write(&SIT_I(sbi)->sentry_lock);
>   	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
>   		__allocate_new_segment(sbi, i, false, false);
> @@ -3322,7 +3322,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   	struct seg_entry *se = NULL;
>   	bool segment_full = false;
>   
> -	f2fs_down_read(&SM_I(sbi)->curseg_lock);
> +	f2fs_down_read(sbi, &SM_I(sbi)->curseg_lock);
>   
>   	mutex_lock(&curseg->curseg_mutex);
>   	down_write(&sit_i->sentry_lock);
> @@ -3451,17 +3451,18 @@ void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
>   static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>   {
>   	int type = __get_segment_type(fio);
> -	bool keep_order = (f2fs_lfs_mode(fio->sbi) && type == CURSEG_COLD_DATA);
> +	struct f2fs_sb_info *sbi = fio->sbi;
> +	bool keep_order = (f2fs_lfs_mode(sbi) && type == CURSEG_COLD_DATA);
>   
>   	if (keep_order)
> -		f2fs_down_read(&fio->sbi->io_order_lock);
> +		f2fs_down_read(sbi, &sbi->io_order_lock);
>   reallocate:
> -	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
> +	f2fs_allocate_data_block(sbi, fio->page, fio->old_blkaddr,
>   			&fio->new_blkaddr, sum, type, fio);
> -	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
> -		invalidate_mapping_pages(META_MAPPING(fio->sbi),
> +	if (GET_SEGNO(sbi, fio->old_blkaddr) != NULL_SEGNO) {
> +		invalidate_mapping_pages(META_MAPPING(sbi),
>   					fio->old_blkaddr, fio->old_blkaddr);
> -		f2fs_invalidate_compress_page(fio->sbi, fio->old_blkaddr);
> +		f2fs_invalidate_compress_page(sbi, fio->old_blkaddr);
>   	}
>   
>   	/* writeout dirty page into bdev */
> @@ -3471,10 +3472,10 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>   		goto reallocate;
>   	}
>   
> -	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
> +	f2fs_update_device_state(sbi, fio->ino, fio->new_blkaddr, 1);
>   
>   	if (keep_order)
> -		f2fs_up_read(&fio->sbi->io_order_lock);
> +		f2fs_up_read(&sbi->io_order_lock);
>   }
>   
>   void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 83d6fb97dcae..675758b509ee 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -40,17 +40,16 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
>   unsigned long f2fs_shrink_count(struct shrinker *shrink,
>   				struct shrink_control *sc)
>   {
> -	struct f2fs_sb_info *sbi;
>   	struct list_head *p;
>   	unsigned long count = 0;
>   
>   	spin_lock(&f2fs_list_lock);
>   	p = f2fs_list.next;
>   	while (p != &f2fs_list) {
> -		sbi = list_entry(p, struct f2fs_sb_info, s_list);
> +		struct f2fs_sb_info *sbi = list_entry(p, struct f2fs_sb_info, s_list);
>   
>   		/* stop f2fs_put_super */
> -		if (!mutex_trylock(&sbi->umount_mutex)) {
> +		if (!f2fs_mutex_trylock(sbi, &sbi->umount_mutex)) {
>   			p = p->next;
>   			continue;
>   		}
> @@ -80,7 +79,6 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
>   				struct shrink_control *sc)
>   {
>   	unsigned long nr = sc->nr_to_scan;
> -	struct f2fs_sb_info *sbi;
>   	struct list_head *p;
>   	unsigned int run_no;
>   	unsigned long freed = 0;
> @@ -91,13 +89,13 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
>   	} while (run_no == 0);
>   	p = f2fs_list.next;
>   	while (p != &f2fs_list) {
> -		sbi = list_entry(p, struct f2fs_sb_info, s_list);
> +		struct f2fs_sb_info *sbi = list_entry(p, struct f2fs_sb_info, s_list);
>   
>   		if (sbi->shrinker_run_no == run_no)
>   			break;
>   
>   		/* stop f2fs_put_super */
> -		if (!mutex_trylock(&sbi->umount_mutex)) {
> +		if (!f2fs_mutex_trylock(sbi, &sbi->umount_mutex)) {
>   			p = p->next;
>   			continue;
>   		}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9f15b03037db..4aa4b12e455d 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>   	[FAULT_DQUOT_INIT]	= "dquot initialize",
>   	[FAULT_LOCK_OP]		= "lock_op",
>   	[FAULT_BLKADDR]		= "invalid blkaddr",
> +	[FAULT_LOCK]		= "lock",
>   };
>   
>   void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
> @@ -2831,7 +2832,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>   		 *			      f2fs_down_read(quota_sem)
>   		 */
>   		f2fs_lock_op(sbi);
> -		f2fs_down_read(&sbi->quota_sem);
> +		f2fs_down_read(sbi, &sbi->quota_sem);
>   
>   		ret = f2fs_quota_sync_file(sbi, cnt);
>   
> @@ -2961,7 +2962,7 @@ static int f2fs_dquot_commit(struct dquot *dquot)
>   	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>   	int ret;
>   
> -	f2fs_down_read_nested(&sbi->quota_sem, SINGLE_DEPTH_NESTING);
> +	f2fs_down_read_nested(sbi, &sbi->quota_sem, SINGLE_DEPTH_NESTING);
>   	ret = dquot_commit(dquot);
>   	if (ret < 0)
>   		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> @@ -2974,7 +2975,7 @@ static int f2fs_dquot_acquire(struct dquot *dquot)
>   	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>   	int ret;
>   
> -	f2fs_down_read(&sbi->quota_sem);
> +	f2fs_down_read(sbi, &sbi->quota_sem);
>   	ret = dquot_acquire(dquot);
>   	if (ret < 0)
>   		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 8ea05340bad9..dccc0a122c25 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -738,7 +738,7 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
>   					a->struct_type == GC_THREAD);
>   
>   	if (gc_entry) {
> -		if (!down_read_trylock(&sbi->sb->s_umount))
> +		if (!f2fs_raw_down_read_trylock(sbi, &sbi->sb->s_umount))
>   			return -EAGAIN;
>   	}
>   	ret = __sbi_store(a, sbi, buf, count);
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index d92edbbdc30e..bb00c7e889da 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -513,6 +513,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
>   int f2fs_getxattr(struct inode *inode, int index, const char *name,
>   		void *buffer, size_t buffer_size, struct page *ipage)
>   {
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_xattr_entry *entry = NULL;
>   	int error;
>   	unsigned int size, len;
> @@ -527,7 +528,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>   	if (len > F2FS_NAME_LEN)
>   		return -ERANGE;
>   
> -	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_down_read(sbi, &F2FS_I(inode)->i_xattr_sem);
>   	error = lookup_all_xattrs(inode, ipage, index, len, name,
>   				&entry, &base_addr, &base_size, &is_inline);
>   	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> @@ -552,19 +553,20 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>   	}
>   	error = size;
>   out:
> -	xattr_free(F2FS_I_SB(inode), base_addr, is_inline);
> +	xattr_free(sbi, base_addr, is_inline);
>   	return error;
>   }
>   
>   ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>   {
>   	struct inode *inode = d_inode(dentry);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_xattr_entry *entry;
>   	void *base_addr, *last_base_addr;
>   	int error;
>   	size_t rest = buffer_size;
>   
> -	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_down_read(sbi, &F2FS_I(inode)->i_xattr_sem);
>   	error = read_all_xattrs(inode, NULL, &base_addr);
>   	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
>   	if (error)
> @@ -581,12 +583,11 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>   
>   		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
>   			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
> -			f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
> +			f2fs_err(sbi, "inode (%lu) has corrupted xattr",
>   						inode->i_ino);
> -			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>   			error = -EFSCORRUPTED;
> -			f2fs_handle_error(F2FS_I_SB(inode),
> -						ERROR_CORRUPTED_XATTR);
> +			f2fs_handle_error(sbi, ERROR_CORRUPTED_XATTR);
>   			goto cleanup;
>   		}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
