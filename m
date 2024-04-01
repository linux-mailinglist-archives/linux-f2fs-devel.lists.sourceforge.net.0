Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 133418936C9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Apr 2024 03:47:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rr6l5-0007Ju-TX;
	Mon, 01 Apr 2024 01:46:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rr6l4-0007Jo-Qi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Apr 2024 01:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y00O9sIeF6f86dYvFPHi1NQMF/sweINBJ7gnteRCcHw=; b=aH5NEXlWf2hW05jFC2pFeuNGg/
 ahPsCSnIm+XhJ357xQzwiDdRpw18PEqk72Wgi6y5je02YttWV8TUFFbbuIZ0wyrK5ZJrBxR1XP3x1
 9KDxdYlNAIk+3uVlsq/yUBVyOicEerAR0Tiva1DzpB1N3+6Ebd25IigKhOI5F/igJ3yY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y00O9sIeF6f86dYvFPHi1NQMF/sweINBJ7gnteRCcHw=; b=LO5+Lc8EF/A0irXuZ0wVxM4QJA
 Yw4ffHb/jOSV/fX5RKaltbP8az9C59Jy01shZElPdLy8+snZkGjafEOcJtbsEZm9XCNaZDXsnUl40
 Eu3IpIGxcnvCO4EmUVjnV5NtkORJk/eWOnNrffVFdCRiUWUUUVucTnZs4e4uJwXhuPps=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rr6l3-0006ym-HE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Apr 2024 01:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 076C2CE0E12;
 Mon,  1 Apr 2024 01:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F186C433F1;
 Mon,  1 Apr 2024 01:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711935998;
 bh=n3Cg0Rt5TLrDEys702tEPBe46QCsW8f9s+oMuGbfLkQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vQdDr8XofZ2TMfnX7FAAYbjaLXBv3dbgMZASp4rc9zGlBvl7QgOEiyK0q7Be/tvYD
 I3gu5BDlIlsdUWJXD1JlSaBUsGDuUr9ePXpisxqCfUHiBxREsRsVbXz7+JKxfNGXGn
 F5veV3CZtKzBW5rfiEoMBIdBw3JEHjJiNea5hp3BKQ1avNdK4+a+A2aq1qIlDRGkSQ
 LwA6LE/GqKQNyRpgw4Z+4RHjv0AOqHYSuloESsHSV+S0DP5g2nRUJZh7CN9GCWsJiC
 QxJeBdfBXZnt1rcnkJ5cbrWI9M+a9PjI7fA8TaAR2txuVRrmP+TGNnH3HNMgYPUr+z
 6gP7cAbvKz8dw==
Message-ID: <4514eda4-0e32-4529-8b45-43222fbf739b@kernel.org>
Date: Mon, 1 Apr 2024 09:46:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240329191324.3233324-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240329191324.3233324-1-daeho43@gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/30 3:13, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In a case writing without fallocate(), we can't
 guarantee it's allocated > in the conventional area for zoned stro [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rr6l3-0006ym-HE
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: prevent writing without fallocate()
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

On 2024/3/30 3:13, Daeho Jeong wrote:
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
> v6: check a hole for pinned files in mkwrite()
> ---
>   fs/f2fs/data.c | 20 ++++++++++++++++----
>   fs/f2fs/file.c | 20 +++++++++++---------
>   2 files changed, 27 insertions(+), 13 deletions(-)
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
> index 82277e95c88f..6793c96019a2 100644
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
> @@ -114,19 +114,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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
> +		if (f2fs_is_pinned_file(inode) && dn.data_blkaddr == NULL_ADDR)

if (f2fs_is_pinned_file(inode) && !__is_valid_data_blkaddr(dn.data_blkaddr))

Thanks,

> +			err = -EIO;
>   	}
> -#endif
> +
>   	if (err) {
>   		unlock_page(page);
>   		goto out_sem;
> @@ -3235,7 +3233,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   		goto done;
>   	}
>   
> -	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
> +	if (F2FS_HAS_BLOCKS(inode)) {
>   		ret = -EFBIG;
>   		goto out;
>   	}
> @@ -4611,6 +4609,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
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
