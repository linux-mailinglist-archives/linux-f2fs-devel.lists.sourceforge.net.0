Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3867F67F3EA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 03:08:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLadU-0001Gw-MM;
	Sat, 28 Jan 2023 02:08:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLadT-0001Gp-Dq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 02:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BjQ81q0Vfxs/duMR44D4SUrNx4kicPiikGiJeV38SlU=; b=Z3jcfN+DoG1aLlljjt+TmtUueo
 rJ/4grM7xZzLyCPE8fySA9Ps1C+pdEDXCaB8Ka3xXCdKd2PG2lWNdddDJawUtY5DT6Lh/23jneb+0
 34nwB7wBXPxqGKrRAIFv+UWAwBDfwXEzLaQb5xcxJCh7qNXvsZSwgrKnT6tfpVPc7jKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BjQ81q0Vfxs/duMR44D4SUrNx4kicPiikGiJeV38SlU=; b=DOg6Ehi3LetwTN1n1U1MefJ1hm
 0Nz0Rh9lc9Hef6KA0au5kF1L0WNsHoacUNaNMTp8X/bnh6bJuG2XDVx9c+NGAlRcWIFfXOOJBiybv
 ucQ+DO9wlmh7Raj4u7pEk7hNBDqBlmHtmVDaBHeeZq/l2IBm3VvhbKGHgd6Eyxb8P41c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLadQ-0000jT-Cg for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 02:08:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0E4561DD3;
 Sat, 28 Jan 2023 02:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724E0C433EF;
 Sat, 28 Jan 2023 02:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674871675;
 bh=xgzCRzmI0lEryWo5hfa+X56jGl8dwqUVxbtlBrWeTJ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QLjkhLTOehTSsfYs+XlzYgoTWNywLpaOOD/rrOee6Nda8wCsRGMWtXoJyo+0EYY9g
 BpVDLLW3Pp1RzKD3Z33u3jmUEJwtJWhauUchgGYdUZ9qz5ICnx/QZGs6A+zWo6Ieob
 DBWRclqJsqT9a36iy8oE3ggScDqx27MCGWZnKrNTbY0aXh4FK/nOrDXYfH2oBskJ3K
 BK55KV2x0BJ7HdOxBR+6r6FtTTBP0lvcTnkJCtMbFuOOHV1qVKxW8vsr4WUluXGok3
 GRX4zKim8qK63V3pHwxLDo3f6ZNhls5g7yUnkdddcGROhUY3mrzNtRhc3oGDYo7kkN
 /15Rm9/SraZWQ==
Message-ID: <ed5f65a7-13bb-581c-cfb5-df5ab30fbc4c@kernel.org>
Date: Sat, 28 Jan 2023 10:07:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230113004933.2082072-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230113004933.2082072-1-daeho43@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daeho, Jaegeuk, Please take a look at patchset in below
 link:
 https://lore.kernel.org/linux-f2fs-devel/20230109034453.490176-1-chao@kernel.org/T/#t
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLadQ-0000jT-Cg
Subject: Re: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: Daeho Jeong <daehojeong@google.com>,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho, Jaegeuk,

Please take a look at patchset in below link:

https://lore.kernel.org/linux-f2fs-devel/20230109034453.490176-1-chao@kernel.org/T/#t

In PATCH 4/5, I'm trying to fix the same issue w/ alternative way, let me
know your preference. :)

One comment as below.

On 2023/1/13 8:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> To fix a race condition between atomic write aborts, I use the inode
> lock and make COW inode to be re-usable thoroughout the whole
> atomic file inode lifetime.
> 
> Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/file.c    | 43 ++++++++++++++++++++++++++++---------------
>   fs/f2fs/inode.c   | 11 +++++++++--
>   fs/f2fs/segment.c |  3 ---
>   fs/f2fs/super.c   |  2 --
>   4 files changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ecbc8c135b49..ff072a9ed258 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1866,7 +1866,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
>   			atomic_read(&inode->i_writecount) != 1)
>   		return 0;
>   
> +	inode_lock(inode);
>   	f2fs_abort_atomic_write(inode, true);
> +	inode_unlock(inode);
> +
>   	return 0;
>   }
>   
> @@ -1880,8 +1883,11 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
>   	 * until all the writers close its file. Since this should be done
>   	 * before dropping file lock, it needs to do in ->flush.
>   	 */
> -	if (F2FS_I(inode)->atomic_write_task == current)
> +	if (F2FS_I(inode)->atomic_write_task == current) {
> +		inode_lock(inode);
>   		f2fs_abort_atomic_write(inode, true);
> +		inode_unlock(inode);
> +	}
>   	return 0;
>   }
>   
> @@ -2087,19 +2093,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   		goto out;
>   	}
>   
> -	/* Create a COW inode for atomic write */
> -	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> -	if (IS_ERR(pinode)) {
> -		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> -		ret = PTR_ERR(pinode);
> -		goto out;
> -	}
> +	/* Check if the inode already has a COW inode */
> +	if (fi->cow_inode == NULL) {
> +		/* Create a COW inode for atomic write */
> +		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> +		if (IS_ERR(pinode)) {
> +			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			ret = PTR_ERR(pinode);
> +			goto out;
> +		}
>   
> -	ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
> -	iput(pinode);
> -	if (ret) {
> -		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> -		goto out;
> +		ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
> +		iput(pinode);
> +		if (ret) {
> +			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> +			goto out;
> +		}
> +
> +		set_inode_flag(fi->cow_inode, FI_COW_FILE);
> +		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> +	} else {
> +		/* Reuse the already created COW inode */
> +		f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>   	}
>   
>   	f2fs_write_inode(inode, NULL);
> @@ -2107,8 +2122,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   	stat_inc_atomic_inode(inode);
>   
>   	set_inode_flag(inode, FI_ATOMIC_FILE);
> -	set_inode_flag(fi->cow_inode, FI_COW_FILE);
> -	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>   
>   	isize = i_size_read(inode);
>   	fi->original_i_size = isize;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index ff6cf66ed46b..4921f7209e28 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -766,11 +766,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>   void f2fs_evict_inode(struct inode *inode)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	nid_t xnid = fi->i_xattr_nid;
>   	int err = 0;
>   
>   	f2fs_abort_atomic_write(inode, true);
>   
> +	if (fi->cow_inode) {
> +		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> +		iput(fi->cow_inode);
> +		fi->cow_inode = NULL;
> +	}
> +
>   	trace_f2fs_evict_inode(inode);
>   	truncate_inode_pages_final(&inode->i_data);
>   
> @@ -857,7 +864,7 @@ void f2fs_evict_inode(struct inode *inode)
>   	stat_dec_inline_inode(inode);
>   	stat_dec_compr_inode(inode);
>   	stat_sub_compr_blocks(inode,
> -			atomic_read(&F2FS_I(inode)->i_compr_blocks));
> +			atomic_read(&fi->i_compr_blocks));
>   
>   	if (likely(!f2fs_cp_error(sbi) &&
>   				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index ae3c4e5474ef..536d7c674b04 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -192,9 +192,6 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>   	if (!f2fs_is_atomic_file(inode))
>   		return;
>   
> -	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> -	iput(fi->cow_inode);
> -	fi->cow_inode = NULL;
>   	release_atomic_write_cnt(inode);
>   	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
>   	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1f812b9ce985..10463f084d30 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1430,8 +1430,6 @@ static int f2fs_drop_inode(struct inode *inode)
>   			atomic_inc(&inode->i_count);
>   			spin_unlock(&inode->i_lock);
>   
> -			f2fs_abort_atomic_write(inode, true);

In order to avoid caching obsolete page of cow_inode, how about truncating
them here?

if (f2fs_is_atomic_file() && cow_inode)
	truncate_inode_pages_final(&cow_inode->i_data);

Thanks,

> -
>   			/* should remain fi->extent_tree for writepage */
>   			f2fs_destroy_extent_node(inode);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
