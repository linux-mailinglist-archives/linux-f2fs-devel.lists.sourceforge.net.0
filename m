Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63587A102
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:51:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDmT-0001SN-Fi;
	Wed, 13 Mar 2024 01:51:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rkDmS-0001SH-JO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O/S+KiaPPcQxJdZCYlcsqJ+2zljOd4VP+iQlNTKVQzs=; b=BCKUfsQEfUiiQaKXYrQqePXjxF
 JmtOp0UvfILugKPp0LUvqWSL327SSX0OCsup6ano4W/ddWwwpxKC8ip5MXExfJ/7LNy/GJ6MWK+Zc
 bp1DQx/TVX3II25cFgkMeG6kWHpy84Gx7rbEx6k4t7qGWKwnT4L2O5c1FRSup9lGQi2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O/S+KiaPPcQxJdZCYlcsqJ+2zljOd4VP+iQlNTKVQzs=; b=XOQ+z5v758XYySf4+Qiavdho+k
 MpLtlWkG8WJbSLfmw6iLvk+UpXS9NW4PVncDGg25bgu7knGi/y7+VfVU+KIZ2wHulLsP42+6g12Rg
 scFuHhvq4mHchL+DTtMJGSjQN8yOPjaKhftKnUYqkHZVj4uzMtpdb9izAEeROPciy40M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDmI-0003D3-De for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 288C86134B;
 Wed, 13 Mar 2024 01:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D13C433F1;
 Wed, 13 Mar 2024 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710294694;
 bh=4kOZOKrwpxycV31Soe7VOjD1j4/cP7uDCINqygA075M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BlSXJSsoEXr62v5CronP73gke/CQqDUcgdnXWx6npy6aPeRl5ixS96WvB2+4yACse
 bNipCUllfqCXvzUkzgTaIo5x0KxFXfDFLqujzd97rxlYfJHvK3x9v3yVYc/ae5JrFS
 lqpTQwcJ4iWSnNgn+0B7FMlvZA7fOe1upIydbgeHtiEnNhD51kgx4a0+mFSjVFCDha
 biMmBOj4IAIeQ/TtBdXk+hye/I99gMDeUGeOR7t8Sxf+JaMyAFF/ZMYUKmZ8PSl/Hh
 HlbBkjAQd81rCVBNRNYUd9plvvlf0IJXTl/YdHcDxMOnEALg5STJoxTpngisGjc2ME
 rZEP/saa8AveA==
Message-ID: <9fefaf48-fdd8-491f-8d5d-6a57286e6071@kernel.org>
Date: Wed, 13 Mar 2024 09:51:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240312204934.2249696-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240312204934.2249696-1-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/13 4:49, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In a case writing without fallocate(), we can't
 guarantee it's allocated > in the conventional area for zoned stro [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDmI-0003D3-De
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: prevent writing without fallocate()
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

On 2024/3/13 4:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In a case writing without fallocate(), we can't guarantee it's allocated
> in the conventional area for zoned stroage.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: covered the direct io case

Oh, one more missed case, mkwrite?

Thanks,

> ---
>   fs/f2fs/data.c | 14 ++++++++++++--
>   fs/f2fs/file.c |  4 ++++
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c21b92f18463..d3e5ab2736a6 100644
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
> +		    (f2fs_is_pinned_file(inode) && is_hole &&
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
> @@ -3407,6 +3412,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   
>   	if (!f2fs_lookup_read_extent_cache_block(inode, index,
>   						 &dn.data_blkaddr)) {
> +		if (f2fs_is_pinned_file(inode)) {
> +			err = -EIO;
> +			goto out;
> +		}
> +
>   		if (locked) {
>   			err = f2fs_reserve_block(&dn, index);
>   			goto out;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82277e95c88f..f98730932fc4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4611,6 +4611,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
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
