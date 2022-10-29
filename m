Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0AB611F68
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 04:49:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oobuF-00066z-TO;
	Sat, 29 Oct 2022 02:49:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oobuE-00066t-FF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 02:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hpELaOqGkZOvesQXJo6yj4ho41p8J22szU8Z7W5OfOs=; b=PVltVi2lr2f+Kb+JHptDZcg4OG
 q5mbX5Te4hMoKvUb/c5vkOqqtEY4A9RYtVxxXgVYElKauJ6oxMuyUqrVluP+cfB5JQ0RiAbVYPLob
 iQe4wrjOSbBlz/Gt/hCNx7BOuDRnR5csGnPQbn6sl3oz6sAB/h0uS2BFCQ/8CF3sUfWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hpELaOqGkZOvesQXJo6yj4ho41p8J22szU8Z7W5OfOs=; b=EBCd3hj16C9d9syokSTc3MTzMn
 FWXpGzO3REkAsPuC2/UIM8hdRdZ6ynIsQk2EIsyndx0LTtfF594QcMW971+a7squ338VY29K7XHOR
 iImf37E/7TBe7/WsK0tSKXF4P1liMRKFK1jLZrjvZraZSGLh1jJPuGsvc/fP7eo+8ZhQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oobuA-0045fl-7f for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 02:49:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3BBC62B4D;
 Sat, 29 Oct 2022 02:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCFBC433C1;
 Sat, 29 Oct 2022 02:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667011736;
 bh=7jQbo94aKu8aU99NY3eH3Ias5rI4nToMN7XO+LXtYAg=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=arOetEBdlpi4GScMBJR4KHHU7cPzVqMx8WU+cnp90uQD6f4vBJ7OMndP3AH2am1EA
 A9vdmE8CGZSonCjmM6FbjA353uO6RyYmyNY/2DTy3hEHYqWD5TmNfMN3r1iB8R0Azl
 Co6GpmGS7uTJxMgk98ufUZiNZajmCaNxwfrpZsfNiEm0r2oORwwJmoIahMITssFeZL
 9gEmEExhBzDNYoWWh8216OOyJZKN3hYIJnG18igjiio1F107F628ryklKkhlCh/dNC
 pPWP2cKebzrknI9rtZY2u833CFcYpK1XDNeypje4DUMyb+R0f7yNfXyeMbM6YPeEEY
 3IWyYdt2fLSPw==
Message-ID: <4bbefd79-7f01-efc3-7c7e-339a8d5d9952@kernel.org>
Date: Sat, 29 Oct 2022 10:48:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20221018170017.672824-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221018170017.672824-1-daeho43@gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/19 1:00, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We need to make sure i_size doesn't change until
 atomic write commit is > successful and restore it when commit i [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oobuA-0045fl-7f
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: correct i_size change for
 atomic writes
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/19 1:00, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We need to make sure i_size doesn't change until atomic write commit is
> successful and restore it when commit is failed.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v5: prevent only i_size update for atomic files when dirtying inode
> v4: move i_size update after clearing atomic file flag in
>      f2fs_abort_atomic_write()
> v3: make sure inode is clean while atomic writing
> ---
>   fs/f2fs/f2fs.h    |  8 ++++++++
>   fs/f2fs/file.c    | 18 +++++++++++-------
>   fs/f2fs/inode.c   |  5 ++++-
>   fs/f2fs/segment.c | 14 ++++++++++----
>   4 files changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e7e750e6b332..68d2a3383c38 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -764,6 +764,7 @@ enum {
>   	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
>   	FI_ALIGNED_WRITE,	/* enable aligned write */
>   	FI_COW_FILE,		/* indicate COW file */
> +	FI_ATOMIC_COMMIT,	/* indicate atomic commit completed except disk sync */

How about FI_ATOMIC_WRITTEN or FI_ATOMIC_COMMITTED? which may be
more readable?

>   	FI_MAX,			/* max flag, never be used */
>   };
>   
> @@ -822,6 +823,7 @@ struct f2fs_inode_info {
>   	unsigned int i_cluster_size;		/* cluster size */
>   
>   	unsigned int atomic_write_cnt;
> +	loff_t original_i_size;		/* original i_size before atomic write */
>   };
>   
>   static inline void get_extent_info(struct extent_info *ext,
> @@ -3072,6 +3074,8 @@ static inline void f2fs_i_blocks_write(struct inode *inode,
>   		set_inode_flag(inode, FI_AUTO_RECOVER);
>   }
>   
> +static inline bool f2fs_is_atomic_file(struct inode *inode);
> +
>   static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
>   {
>   	bool clean = !is_inode_flag_set(inode, FI_DIRTY_INODE);
> @@ -3081,6 +3085,10 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
>   		return;
>   
>   	i_size_write(inode, i_size);
> +
> +	if (f2fs_is_atomic_file(inode))
> +		return;
> +
>   	f2fs_mark_inode_dirty_sync(inode, true);
>   	if (clean || recover)
>   		set_inode_flag(inode, FI_AUTO_RECOVER);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ec9ee0f6d502..7ce629c95f4a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1991,6 +1991,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct inode *pinode;
> +	loff_t isize;
>   	int ret;
>   
>   	if (!inode_owner_or_capable(mnt_userns, inode))
> @@ -2049,7 +2050,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>   		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>   		goto out;
>   	}
> -	f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
> +
> +	f2fs_write_inode(inode, NULL);
> +
> +	isize = i_size_read(inode);
> +	fi->original_i_size = isize;
> +	f2fs_i_size_write(fi->cow_inode, isize);
>   
>   	stat_inc_atomic_inode(inode);
>   
> @@ -2087,16 +2093,14 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
>   
>   	if (f2fs_is_atomic_file(inode)) {
>   		ret = f2fs_commit_atomic_write(inode);
> -		if (ret)
> -			goto unlock_out;
> -
> -		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
>   		if (!ret)
> -			f2fs_abort_atomic_write(inode, false);
> +			ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
> +
> +		f2fs_abort_atomic_write(inode, ret);
>   	} else {
>   		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
>   	}
> -unlock_out:
> +
>   	inode_unlock(inode);
>   	mnt_drop_write_file(filp);
>   	return ret;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 9f0d3864d9f1..044f132b87bc 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -621,9 +621,12 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>   	ri->i_uid = cpu_to_le32(i_uid_read(inode));
>   	ri->i_gid = cpu_to_le32(i_gid_read(inode));
>   	ri->i_links = cpu_to_le32(inode->i_nlink);
> -	ri->i_size = cpu_to_le64(i_size_read(inode));
>   	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
>   
> +	if (!f2fs_is_atomic_file(inode) ||
> +			is_inode_flag_set(inode, FI_ATOMIC_COMMIT))
> +		ri->i_size = cpu_to_le64(i_size_read(inode));

So we expect that below flow can update i_size correctly, right?

- f2fs_ioc_commit_atomic_write
  - f2fs_do_sync_file
   - f2fs_skip_inode_update
   - f2fs_write_inode
    - f2fs_update_inode_page
     - f2fs_update_inode

Thanks,

> +
>   	if (et) {
>   		read_lock(&et->lock);
>   		set_raw_extent(&et->largest, &ri->i_ext);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 289bcb7ca300..264b4e352319 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -192,14 +192,18 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>   	if (!f2fs_is_atomic_file(inode))
>   		return;
>   
> -	if (clean)
> -		truncate_inode_pages_final(inode->i_mapping);
>   	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>   	iput(fi->cow_inode);
>   	fi->cow_inode = NULL;
>   	release_atomic_write_cnt(inode);
> +	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
>   	clear_inode_flag(inode, FI_ATOMIC_FILE);
>   	stat_dec_atomic_inode(inode);
> +
> +	if (clean) {
> +		truncate_inode_pages_final(inode->i_mapping);
> +		f2fs_i_size_write(inode, fi->original_i_size);
> +	}
>   }
>   
>   static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
> @@ -335,10 +339,12 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>   	}
>   
>   out:
> -	if (ret)
> +	if (ret) {
>   		sbi->revoked_atomic_block += fi->atomic_write_cnt;
> -	else
> +	} else {
>   		sbi->committed_atomic_block += fi->atomic_write_cnt;
> +		set_inode_flag(inode, FI_ATOMIC_COMMIT);
> +	}
>   
>   	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
