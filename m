Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6D3723786
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 08:21:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6Q4e-0006PU-5e;
	Tue, 06 Jun 2023 06:21:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q6Q4c-0006PO-SQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cAMU1SW1MvUv4DTfWZBru2stG6xHVNKYJZ9ML7/R7JI=; b=d5//En8rEGM2Qe7x5vguhUHgd+
 rgilGW9mQok1U0uzk4eriHnWpbBfKjjbJoDjyWMiSWj03D9Qkjh9jFtEVzliNkbLYWPiP/80jalnx
 dIRkjwDMFwsO3juVI0oCsJ0eEcXn4oXi7Wkd+/xwcWEmHBiNxpqdTQYZ4vy0uUH4R2xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cAMU1SW1MvUv4DTfWZBru2stG6xHVNKYJZ9ML7/R7JI=; b=bEVMpySBj3PBZpvsx78Iqemxu1
 bsdKZIxW++gXRcUd49t4ki/19vNIfWipVtq2CG6crlG8ZY25g7AKjiXpNEK5r5fRmgURgGJmki81c
 FqJcoGGSE2LBEnNBOxE2LFrWXK3+xs2fPxTmX2/Y4q6IVcIdNUYWO5H8omP7LFBBD8SU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6Q4b-0001WD-NC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:21:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53F6D62D6E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Jun 2023 06:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6D9C433B4;
 Tue,  6 Jun 2023 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686032495;
 bh=7Y283N6eAfDc6+mkcJb/LEMLq42CKVcBrl7sj2/MNog=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CESdHtYEcYp02s8OIehmNezKAxoa9M9l0W5PoBGjUbJDEqHtdRTvqg+c93MRyy2GF
 KdKk8uRKAik+aDx7lMAK1lK8HZj9AXPQOKd5W0RDAX1g689EM5f5q1grrYjzMJxOuo
 OC5q/bBEsq5E9ZuSAW1KDwgVj3JUSdeVvs0xGIKbrP5/QXgHDq7MShDbkMwxjnfWW8
 0nBAk0CJcQrIcQjW3Ya1M+z45Y2Puvifpw4LXYAnFwWmaJ6XEgUNi+ZVT/3LEQ0Qzu
 vMc0Sq0OCyqZJkGT0JzrDQrnxtNvd1IG4Du7FxpVGzORQ0BIYtP39s6dr2pyxvZD0n
 FxLRjT3U6lhnw==
Message-ID: <58d14972-b7d5-364d-526f-b7e5fc248477@kernel.org>
Date: Tue, 6 Jun 2023 14:21:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20230529104709.2560779-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230529104709.2560779-1-chao@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Any comments on this patch? On 2023/5/29 18:47, Chao
 Yu wrote: > Compression option in inode should not be changed after they
 have > been used, however, it may happen in below race case: > > Thread A
 Thread B > - f2fs_ioc_set_co [...] 
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
X-Headers-End: 1q6Q4b-0001WD-NC
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid mmap vs
 set_compress_option case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Any comments on this patch?

On 2023/5/29 18:47, Chao Yu wrote:
> Compression option in inode should not be changed after they have
> been used, however, it may happen in below race case:
> 
> Thread A				Thread B
> - f2fs_ioc_set_compress_option
>   - check f2fs_is_mmap_file()
>   - check get_dirty_pages()
>   - check F2FS_HAS_BLOCKS()
> 					- f2fs_file_mmap
> 					 - set_inode_flag(FI_MMAP_FILE)
> 					- fault
> 					 - do_page_mkwrite
> 					  - f2fs_vm_page_mkwrite
> 					  - f2fs_get_block_locked
> 					 - fault_dirty_shared_page
> 					  - set_page_dirty
>   - update i_compress_algorithm
>   - update i_log_cluster_size
>   - update i_cluster_size
> 
> Avoid such race condition by covering f2fs_file_mmap() w/ inode lock,
> meanwhile add mmap file check condition in f2fs_may_compress() as well.
> 
> Fixes: e1e8debec656 ("f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add mmap file check condition in f2fs_may_compress()
>   fs/f2fs/f2fs.h |  3 ++-
>   fs/f2fs/file.c | 14 +++++++++++---
>   2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9bd83fb28439..0db8b37c7a4d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4487,7 +4487,8 @@ static inline bool f2fs_low_mem_mode(struct f2fs_sb_info *sbi)
>   static inline bool f2fs_may_compress(struct inode *inode)
>   {
>   	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
> -		f2fs_is_atomic_file(inode) || f2fs_has_inline_data(inode))
> +		f2fs_is_atomic_file(inode) || f2fs_has_inline_data(inode) ||
> +		f2fs_is_mmap_file(inode))
>   		return false;
>   	return S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode);
>   }
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7b097ab2f5e4..685ded62fc28 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -519,17 +519,25 @@ static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
>   static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct inode *inode = file_inode(file);
> +	int ret = 0;
>   
>   	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>   		return -EIO;
>   
> -	if (!f2fs_is_compress_backend_ready(inode))
> -		return -EOPNOTSUPP;
> +	inode_lock(inode);
> +
> +	if (!f2fs_is_compress_backend_ready(inode)) {
> +		ret = -EOPNOTSUPP;
> +		goto out_unlock;
> +	}
>   
>   	file_accessed(file);
>   	vma->vm_ops = &f2fs_file_vm_ops;
>   	set_inode_flag(inode, FI_MMAP_FILE);
> -	return 0;
> +
> +out_unlock:
> +	inode_unlock(inode);
> +	return ret;
>   }
>   
>   static int f2fs_file_open(struct inode *inode, struct file *filp)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
