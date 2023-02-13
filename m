Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9066941D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 10:48:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRVRJ-00078b-Pd;
	Mon, 13 Feb 2023 09:48:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRVRF-00078T-SJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 09:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wf6pW9FA1+09S5Zx1h7SRBjRy2PnCMLsQdScBqkACAk=; b=hVTbW+TFpdoiSWD1I+QMTT+RRZ
 uLFs/e6z2yTyaifHY6WwmIhqgsLj0UX3l48l0UYr7zOuEvdJN8WvrXDXUopivPmFKELv48kZEy3KE
 aAOZUBuUB+toRbyIMTJbu3HzbS4UpNfoqU//FtLRL3kj8Sy6+wfnDCXRAQUEn6TlFAZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wf6pW9FA1+09S5Zx1h7SRBjRy2PnCMLsQdScBqkACAk=; b=hrnuD6R0avSqTgfvPsCZutW+dc
 eo3INcdnn0bXTKePvbKnyRsZkb/cijieunV4hkL36m9LsZf8lCTetCt25vi3onogt9dFq4fg89Hcq
 csej+NpYHhupCnh81ip7BXdMVV6w9gRw66LTiiX+AY6y+cga3ypXYhqb2DBgvA3pKyAo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRVRE-002dpW-92 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 09:47:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 028CDB80EF5;
 Mon, 13 Feb 2023 09:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE9FC433D2;
 Mon, 13 Feb 2023 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676281668;
 bh=8r8Y60pNtk+S3BalCGthKagMM+Ir5ms1SJvpxVkQlTM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CZgA536DRUu87AhDE/poQpGMXbTyi3XIUVjSAPVGZexfnE+rCzUBsXFPXaw8rrgqF
 YWGYHWwRSVrzq1u1f4H47Rb6mzDTrbspTT3CDYnFeuDzyGQoZ8aPHTaj08TiGKFP3d
 wY0TmFQMGTBc0d9nnd0DtGRMH1E6g+vjiGFb/SBOz0n625DDK5BQx3Upops9efdUh9
 zjhzGA6lfp5c8H7LTO6jwalcKQgQmYCqLbUz9VTkk/N8GVNPaqrBu4PQunAIX7CjmR
 ZpMt14gibVjcTlmUM4L7zlc4LdrpdegF/5PG80k6QhatCGXAW0gVo3+EIZQcHzTAZR
 8bbf1W7cXsN9Q==
Message-ID: <18916dd5-67cc-fe21-f78b-8a6dfbcb1c97@kernel.org>
Date: Mon, 13 Feb 2023 17:47:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230209181819.2333522-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230209181819.2333522-1-daeho43@gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/10 2:18, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > To fix a race condition between atomic write
 aborts, 
 I use the inode > lock and make COW inode to be re-usable tho [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRVRE-002dpW-92
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

On 2023/2/10 2:18, Daeho Jeong wrote:
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
>   fs/f2fs/file.c    | 44 +++++++++++++++++++++++++++++---------------
>   fs/f2fs/inode.c   | 11 +++++++++--
>   fs/f2fs/segment.c |  3 ---
>   fs/f2fs/super.c   |  2 --
>   4 files changed, 38 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 300eae8b5415..6436c52e7913 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1863,7 +1863,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
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
> @@ -1878,8 +1881,12 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
>   	 * before dropping file lock, it needs to do in ->flush.
>   	 */
>   	if (F2FS_I(inode)->atomic_write_task == current &&
> -				(current->flags & PF_EXITING))
> +				(current->flags & PF_EXITING)) {
> +		inode_lock(inode);
>   		f2fs_abort_atomic_write(inode, true);
> +		inode_unlock(inode);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -2085,19 +2092,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
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
> @@ -2105,8 +2121,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   	stat_inc_atomic_inode(inode);
>   
>   	set_inode_flag(inode, FI_ATOMIC_FILE);
> -	set_inode_flag(fi->cow_inode, FI_COW_FILE);
> -	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>   
>   	isize = i_size_read(inode);
>   	fi->original_i_size = isize;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 28c9c72dda2a..7bf660d4cad9 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -777,11 +777,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
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

It looks "fi->cow_inode = NULL" here may race w/ cow_inode allocation in
f2fs_ioc_start_atomic_write due to f2fs_write_inode() has not been covered
by inode_lock()? IIUC.

Thanks,

> +
>   	trace_f2fs_evict_inode(inode);
>   	truncate_inode_pages_final(&inode->i_data);
>   
> @@ -866,7 +873,7 @@ void f2fs_evict_inode(struct inode *inode)
>   	stat_dec_inline_inode(inode);
>   	stat_dec_compr_inode(inode);
>   	stat_sub_compr_blocks(inode,
> -			atomic_read(&F2FS_I(inode)->i_compr_blocks));
> +			atomic_read(&fi->i_compr_blocks));
>   
>   	if (likely(!f2fs_cp_error(sbi) &&
>   				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index ead3f35f501d..719329c1808c 100644
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
> index c11a161ba5be..aa55dc12aff2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1427,8 +1427,6 @@ static int f2fs_drop_inode(struct inode *inode)
>   			atomic_inc(&inode->i_count);
>   			spin_unlock(&inode->i_lock);
>   
> -			f2fs_abort_atomic_write(inode, true);
> -
>   			/* should remain fi->extent_tree for writepage */
>   			f2fs_destroy_extent_node(inode);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
