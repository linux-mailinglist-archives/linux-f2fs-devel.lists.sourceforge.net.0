Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D63EE3E3D56
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 02:30:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCtBJ-0002hz-3Q; Mon, 09 Aug 2021 00:30:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mCtBH-0002hm-OF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 00:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCXwqgx3Sdkb3S/Hc+zvy0m1dZC9jyBvYoEkr7yQOxw=; b=AsHN8/97l3Z2hJN9wIxtdTf35x
 FwM2HaTomMiurVR3TqNPNBtzxT5kK/Ao5MFY2zOjW7Ou7Z89mLpb8qVfZOgdRqCFNHvfikefJGxst
 GeOGey5LPgC9FnkXDNvMiK35pDy0IBSsUZ5thOSMbYGDVT6OIbhphP+4a9Z+//E/VgQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JCXwqgx3Sdkb3S/Hc+zvy0m1dZC9jyBvYoEkr7yQOxw=; b=kTgrTIrQ0c9k6bpEJqSMmODDrn
 +i7urz141sWyfmoduqvLgcwvTlVxwjT8WoC3kk/cTYNY5f7FQrHIgoV3G1zNIFbn2pVtqinA02/Rk
 3qN96SkDYaoUWWtsVzrljNvuKvBT6IsTseb5Q8V9eL1ZoMuXAx2ucQ4069xcwwN0prUc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mCtBE-00HMHW-0t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 00:30:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DD3E60F42;
 Mon,  9 Aug 2021 00:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628469000;
 bh=D1v22NYVPyg54nb9/JQY/Mm03KuJ51uOxKb1tCQIJW4=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=gjZQ1jQPjeTrlLOyu9xiEhOukwNZjVDQfnVJtA5LIjRiqx9Ca1w5HAk5bycs6gCIt
 vFoGCasz6Ow8WcVCGqh5GZMtrFi8wYpLWvwTj+++ci44LKVBy4bPht6H4cGPJD27a0
 CjwN+1LutC/9CvKVV90pWfcXGObMgFODkTjP1E2JfbOI8hnrMUyJFT8MenV8+Tto9r
 FehsT0eENaC3/3ZO9a36OPG1P+kZ4pUazGGmSqTAudQFlqHhjMfn75bJYXFRtgtbgX
 L/2cR1X5uL0WOr+aYLHGk+igyoBFyHQvR5fFJFFpbDooupW7ONFXSRFIArB9wa9WP4
 mujIZO/JlZPzg==
From: Chao Yu <chao@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210806095900.212858-1-changfengnan@vivo.com>
Message-ID: <cd88df3d-eb1f-bdd7-44b0-cc4fe1eaf705@kernel.org>
Date: Mon, 9 Aug 2021 08:30:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210806095900.212858-1-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mCtBE-00HMHW-0t
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: allow write compress
 released file after truncate to zero
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/6 17:59, Fengnan Chang wrote:
> For compressed file, after release compress blocks, don't allow write
> direct, but we should allow write direct after truncate to zero.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   Documentation/filesystems/f2fs.rst | 7 +++++--
>   fs/f2fs/file.c                     | 8 ++++++++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 8f251a662542..d4de7ea4a83d 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -865,8 +865,11 @@ Compression implementation
>     directly in order to guarantee potential data updates later to the space.
>     Instead, the main goal is to reduce data writes to flash disk as much as
>     possible, resulting in extending disk life time as well as relaxing IO
> -  congestion. Alternatively, we've added ioctl interface to reclaim compressed
> -  space and show it to user after putting the immutable bit.
> +  congestion. Alternatively, we've added ioctl(F2FS_IOC_RELEASE_COMPRESS_BLOCKS)
> +  interface to reclaim compressed space and show it to user after putting the
> +  immutable bit. After call ioctl release compreesed space, don't allow write

immutable bit, after release, it doesn't allow writing/mmaping on the file,
until reserving compressed space via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS)
or truncating filesize to zero.

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> +  file directly, unless call ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) to reserve
> +  compreesed space or file truncated be zero.
>   
>   Compress metadata layout::
>   
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7d8ee60f6c1f..d4fc5e0d2ffe 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -753,6 +753,14 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>   		return err;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/*
> +	 * For compressed file, after release compress blocks, don't allow write
> +	 * direct, but we should allow write direct after truncate to zero.
> +	 */
> +	if (f2fs_compressed_file(inode) && !free_from
> +			&& is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
> +		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> +
>   	if (from != free_from) {
>   		err = f2fs_truncate_partial_cluster(inode, from, lock);
>   		if (err)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
