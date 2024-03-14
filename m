Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6C287BD43
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 14:06:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkkn2-00017e-Sb;
	Thu, 14 Mar 2024 13:06:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rkkn1-00017W-OG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 13:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+0I2HrXbEpUv6i1WJ91Jj0oB7xChy4TAIrPDK+lVA4=; b=JQWSzNzYrLIly8Z/VO21KPlYuC
 TIphdG1R5QSEfCcLM0WqyZEk10d7v2iavEDaJVz6xRt8FgA91jFSDCfRot7nfmuBVoItZkpX6gQlx
 WqQDe3B2r1QYjzm76Ve5tR9r68mSTwWWVIbz0AwftnzaqnrQHcYUQ6bIRVha/COlTUnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8+0I2HrXbEpUv6i1WJ91Jj0oB7xChy4TAIrPDK+lVA4=; b=NriE5onlj9WxVcwMcmDfvGo23m
 tp6MNXO7v8MXYrEAJeMZoNLZehLRvNYtATf93FgHWJd54h9xdFQD1WUonJo7g/HS27WPqrFWvjscD
 fhAYHJ//xbY/xXvDoFWukDRGh58I6N6lvJp+L9nmsw68EYtWDq2Hp7QZQP+0Mt9Osp8A=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkkmr-0002v8-7v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 13:06:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ADF1BCE1626;
 Thu, 14 Mar 2024 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD80C433C7;
 Thu, 14 Mar 2024 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710421580;
 bh=MElPHl186ioKAc0FmIFa1N/21frTBw3U+yXB0xz9r5Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aBpVYAmgsE/0H0WsN6O7VV/6lHtyT164V9jLi4xhHLVPQJZ0lG2WyEs4WOdw1AYeH
 DO/TIknKEnHW5hDy+XyWMGkMfz6HgZ3g2Hg9eRLKDU1jtNvi08vcf3WDFjfkMoNW3j
 hLD7Ve3qeP3jx2KxPYV7WshocToOOawZJk0Z0EGk6KYuACLEEfbF5Hc4QYa5TMMaER
 8JZZ1F1PXo6yBGRlgiVEXdDiApVkC0GnW8FAvSy5d3R/wf0F4vmRQ1yNI4vY8nJxkp
 ERbKMg5cKgD1DxC1EjYsWqS/Kf7ENHWpmJqbvcVlfCiy6UB0SG5eksx7ku3VOYZKv+
 zw/F5VVR31OQg==
Message-ID: <eeefebcb-54db-4087-9319-dd5f9b63a1da@kernel.org>
Date: Thu, 14 Mar 2024 21:06:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1710303061-16822-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1710303061-16822-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/13 12:11, Zhiguo Niu wrote: > some user behaviors
 requested filesystem operations, which > will cause filesystem not idle.
 > Meanwhile adjust f2fs_update_time(REQ_TIME) of > f2fs_ioc_defragm [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkkmr-0002v8-7v
Subject: Re: [f2fs-dev] [PATCH] f2fs: add REQ_TIME time update for some user
 behaviors
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/13 12:11, Zhiguo Niu wrote:
> some user behaviors requested filesystem operations, which
> will cause filesystem not idle.
> Meanwhile adjust f2fs_update_time(REQ_TIME) of
> f2fs_ioc_defragment to successful case.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/file.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4dfe38e..dac3836 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2784,7 +2784,6 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
>   	err = f2fs_defragment_range(sbi, filp, &range);
>   	mnt_drop_write_file(filp);
>   
> -	f2fs_update_time(sbi, REQ_TIME);

I guess we need to call f2fs_update_time() here if any data was
migrated.

if (range->len)
	f2fs_update_time(sbi, REQ_TIME);

>   	if (err < 0)
>   		return err;
>   
> @@ -2792,6 +2791,7 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
>   							sizeof(range)))
>   		return -EFAULT;
>   
> +	f2fs_update_time(sbi, REQ_TIME);
>   	return 0;
>   }
>   
> @@ -3331,6 +3331,7 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
>   	if (copy_from_user(&block_count, (void __user *)arg,
>   			   sizeof(block_count)))
>   		return -EFAULT;
> +	f2fs_update_time(sbi, REQ_TIME);

There will be no further IO in the end of f2fs_ioc_resize_fs(), so we don't
need to update time to delay gc/discard thread?

>   
>   	return f2fs_resize_fs(filp, block_count);
>   }
> @@ -3424,6 +3425,7 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
>   	f2fs_up_write(&sbi->sb_lock);
>   
>   	mnt_drop_write_file(filp);
> +	f2fs_update_time(sbi, REQ_TIME);

Ditto,

Thanks,

>   out:
>   	kfree(vbuf);
>   	return err;
> @@ -3597,6 +3599,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>   
>   	filemap_invalidate_unlock(inode->i_mapping);
>   	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	inode_unlock(inode);
>   
> @@ -3766,6 +3769,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
>   		inode_set_ctime_current(inode);
>   		f2fs_mark_inode_dirty_sync(inode, true);
> +		f2fs_update_time(sbi, REQ_TIME);
>   	}
>   unlock_inode:
>   	inode_unlock(inode);
> @@ -3964,6 +3968,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>   	if (len)
>   		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
>   				prev_block, len, range.flags);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	filemap_invalidate_unlock(mapping);
>   	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -4173,6 +4178,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
>   	if (ret)
>   		f2fs_warn(sbi, "%s: The file might be partially decompressed (errno=%d). Please delete the file.",
>   			  __func__, ret);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	inode_unlock(inode);
>   	file_end_write(filp);
> @@ -4252,6 +4258,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
>   	if (ret)
>   		f2fs_warn(sbi, "%s: The file might be partially compressed (errno=%d). Please delete the file.",
>   			  __func__, ret);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	inode_unlock(inode);
>   	file_end_write(filp);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
