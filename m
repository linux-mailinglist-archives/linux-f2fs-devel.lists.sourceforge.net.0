Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9B8913BC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Mar 2024 07:25:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rq5gG-0002Fr-NH;
	Fri, 29 Mar 2024 06:25:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rq5gF-0002Fk-Mq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 06:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lWrdgHmsESKbedy31VzHQAkJjOll9ExjWbZCHNXDf0I=; b=aHbYYOvplrBmqF47tiViRD1Lv2
 Ujkc6Q2hPqVGKGmy/97WK54KvzuYAJbZTGn8AbDi5L7K2/sF3Lmc2AaiDcAtmJ+1wc6cjkg/hqP8L
 QKN3vC7EUcweSJNzQ0yKcmuR9DimCvcXqFaelt3qnK623KUl5mURtx+troVVRi56jBqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lWrdgHmsESKbedy31VzHQAkJjOll9ExjWbZCHNXDf0I=; b=cBx8CaoPO525TSCzHVQuumCFbX
 WE5bHwtmj9b6BbgDsNVTHb2SibmbN2Uc+vyAKYgtJO6Flb4FkV+TbobaXyt3NojFu0ZwxfJY+KJMY
 ESfzCKyij5O9i+RF/p6xoN1R4q1ZvgF8cW/bn87QoQ+UDwa4tzFHAfP4OfrRe5pT9Wn8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rq5gE-0004No-Eh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 06:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15EBACE2B84;
 Fri, 29 Mar 2024 06:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9815C433F1;
 Fri, 29 Mar 2024 06:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711693521;
 bh=vUpji8lxw+W9+6bxPOhocySoPz9eyx3y0fD1yHTt1v4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S1l/nezyA+C9Xgtn9Texc5PiloCR+CjIGemPR69MRn4mNBh/+0+aT7iNIC0RJCjtT
 yoTVbPUYlfy1NDIBbuCVDHfnsfaj9nvz6os5TQyvG8eqWyQzMzxswYuJAvT7gU3QLF
 KBVaiuk+K/ebD3MIKxS73xsMgwwusddvMr/eKPxV8S4aFY9qP+XnKGfucfKKEpYqyz
 +r4MHg1s/CxLvKTCo2cnt+nMZQmNDMwtdZ+Y9aejGtB7AzJpJxA8ie92KGKWFig13J
 eXLF6o+CdM9FdHmbDO6LHV3BJgxn/XU7xmxdfOpV0SVyqhdZwGSptvPRoWW0khSlfI
 PtU4ghkPLbSDQ==
Message-ID: <2afb0fcb-afb6-4cb6-bfa2-e8e186f79d8c@kernel.org>
Date: Fri, 29 Mar 2024 14:25:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240326203130.85748-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240326203130.85748-1-daeho43@gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/27 4:31, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In a case writing without fallocate(), we can't
 guarantee it's allocated > in the conventional area for zoned stro [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rq5gE-0004No-Eh
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: prevent writing without fallocate()
 for pinned files
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

On 2024/3/27 4:31, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In a case writing without fallocate(), we can't guarantee it's allocated
> in the conventional area for zoned stroage. To make it consistent across
> storage devices, we disallow it regardless of storage device types.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: covered the direct io case
> v3: covered the mkwrite case
> v4: moved pin file check position in prepare_write_begin()
> v5: removed unnecessary condition in f2fs_map_blocks() and disallowed
>      pre-written inodes for file pinning
> ---
>   fs/f2fs/data.c | 20 ++++++++++++++++----
>   fs/f2fs/file.c | 18 +++++++++---------
>   2 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c21b92f18463..1b02a9291176 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1584,8 +1584,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>   
>   	/* use out-place-update for direct IO under LFS mode */
>   	if (map->m_may_create &&
> -	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO))) {
> -		if (unlikely(f2fs_cp_error(sbi))) {
> +	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> +			 !f2fs_is_pinned_file(inode)))) {
> +		if (unlikely(f2fs_cp_error(sbi)) ||
> +		    (f2fs_is_pinned_file(inode) &&
> +		     flag != F2FS_GET_BLOCK_PRE_DIO)) {
>   			err = -EIO;
>   			goto sync_out;
>   		}
> @@ -3378,6 +3381,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   		f2fs_map_lock(sbi, flag);
>   		locked = true;
>   	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
> +		if (f2fs_is_pinned_file(inode))
> +			return -EIO;
>   		f2fs_map_lock(sbi, flag);
>   		locked = true;
>   	}
> @@ -3414,8 +3419,15 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   
>   		/* hole case */
>   		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> -		if (!err && dn.data_blkaddr != NULL_ADDR)
> -			goto out;
> +		if (!err) {
> +			if (dn.data_blkaddr != NULL_ADDR) {
> +				goto out;
> +			} else if (f2fs_is_pinned_file(inode)) {
> +				err = -EIO;
> +				goto out;
> +			}
> +		}
> +
>   		f2fs_put_dnode(&dn);
>   		f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
>   		WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82277e95c88f..7aa53cf553a1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -57,7 +57,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   	struct inode *inode = file_inode(vmf->vma->vm_file);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct dnode_of_data dn;
> -	bool need_alloc = true;
> +	bool need_alloc = !f2fs_is_pinned_file(inode);
>   	int err = 0;
>   	vm_fault_t ret;
>   
> @@ -114,19 +114,15 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>   		goto out_sem;
>   	}
>   
> +	set_new_dnode(&dn, inode, NULL, NULL, 0);
>   	if (need_alloc) {
>   		/* block allocation */
> -		set_new_dnode(&dn, inode, NULL, NULL, 0);
>   		err = f2fs_get_block_locked(&dn, page->index);
> -	}
> -
> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> -	if (!need_alloc) {
> -		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +	} else {
>   		err = f2fs_get_dnode_of_data(&dn, page->index, LOOKUP_NODE);
>   		f2fs_put_dnode(&dn);
>   	}

It needs to check dn.data_blkaddr for pinfile? return EIO if it hits a hole?

Thanks,

> -#endif
> +
>   	if (err) {
>   		unlock_page(page);
>   		goto out_sem;
> @@ -3235,7 +3231,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   		goto done;
>   	}
>   
> -	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
> +	if (F2FS_HAS_BLOCKS(inode)) {
>   		ret = -EFBIG;
>   		goto out;
>   	}
> @@ -4611,6 +4607,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>   			return ret;
>   	}
>   
> +	/* For pinned files, it should be fallocate()-ed in advance. */
> +	if (f2fs_is_pinned_file(inode))
> +		return 0;
> +
>   	/* Do not preallocate blocks that will be written partially in 4KB. */
>   	map.m_lblk = F2FS_BLK_ALIGN(pos);
>   	map.m_len = F2FS_BYTES_TO_BLK(pos + count);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
