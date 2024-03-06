Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5D872C5F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 02:52:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhgS7-00015M-3a;
	Wed, 06 Mar 2024 01:52:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhgS6-00015G-83
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 01:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TnRNOU9nKba7ba887pjqIui41IKr2WrMUgD097id/+k=; b=LJj7TFiip659WrMEdJ8S0/V/Gk
 TX1Td/gWYZ2grEK96eart+mfoHj/uEzyrn2oEOFUXB0acq4PDYP2ml1ucLUBQ6wrurNz6MjCmjZrI
 RSBUshCPf7SqzqKbl10zXZ+J/WaA6afQpQS9NKLRl/I+uY9oHtcGTkgrVCfxwS0lm0bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TnRNOU9nKba7ba887pjqIui41IKr2WrMUgD097id/+k=; b=DweMC/qgp8uU+HyYNO4+QrJb3a
 DRgLs/FIk3tyD6rxH6PXD1NCdGeJ3kkhWE84WjPIKFc4gaZXv/lOkagmigj4hSfljwQth97028P3W
 KOEPkFpOyXoKskH0XlG91Bn/nwHSs9ItAH8Tqme3YFOgV9V07jCOANTMumOJuBJuUP1s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhgRz-0005gj-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 01:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 24DB3617AD;
 Wed,  6 Mar 2024 01:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A360EC433F1;
 Wed,  6 Mar 2024 01:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709689922;
 bh=pjR8YIBGq1VNa51QiHXbbJg32nHSnWWaN8QomRREMxg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mEfbDRIVBOG3N/to2d9M9OyD8pavLacY7xA6M0dCBYF3+yCwNfpKJHE6PZY9aSkyK
 fxOg3yMuv9s6UwhwvaRHtz7NcMpxGTFX0yJRb3F0GqjdGT/As8DLtfzP1XUwnbzf7M
 abS0A2sQH5ZHwcUPJu99IfhR31tYhQe5lJk5MCUVx/a9g0Of21GX2fMb9+S2hiG3cU
 6Iiby7rxMELga0D8EgoYLg3n28/cqAx0a3sMruRb7oC6KdypIyF0+cWz/5nElMqfW0
 5IJXL14zQJsqo3g0FziOt2u0dXLUStgqxeR5QESaB0pz93VzENEzJIdnNdTJfx6Qrd
 yHYRhP//SuDmQ==
Message-ID: <61637917-440e-4ed1-8820-fc7af8b8b4f3@kernel.org>
Date: Wed, 6 Mar 2024 09:51:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240305084023.3686070-1-xiuhong.wang@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240305084023.3686070-1-xiuhong.wang@unisoc.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/5 16:40,
 Xiuhong Wang wrote: > The following f2fs_io
 test will get a "0" result instead of -EINVAL, > unisoc # ./f2fs_io compress
 file > unisoc # ./f2fs_io reserve_cblocks file > 0 > it's no [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhgRz-0005gj-Fj
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: compress: relocate some judgments
 in f2fs_reserve_compress_blocks
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hongyu.jin.cn@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/5 16:40, Xiuhong Wang wrote:
> The following f2fs_io test will get a "0" result instead of -EINVAL,
> unisoc # ./f2fs_io compress file
> unisoc # ./f2fs_io reserve_cblocks file
>   0
> it's not reasonable, so the judgement of
> atomic_read(&F2FS_I(inode)->i_compr_blocks) should be placed after
> the judgement of is_inode_flag_set(inode, FI_COMPRESS_RELEASED).
> 
> Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/file.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4ca6c693b33a..572d7bd4d161 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3720,18 +3720,18 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   	if (ret)
>   		return ret;
>   
> -	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
> -		goto out;
> -
>   	f2fs_balance_fs(sbi, true);
>   
>   	inode_lock(inode);
>   
>   	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
>   		ret = -EINVAL;
> -		goto unlock_inode;

Nitpick, maybe keep unlock_inode label is better.

> +		goto out;
>   	}
>   
> +	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
> +		goto out;

goto unlock_inode

Thanks,

> +
>   	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   	filemap_invalidate_lock(inode->i_mapping);
>   
> @@ -3776,9 +3776,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   		inode_set_ctime_current(inode);
>   		f2fs_mark_inode_dirty_sync(inode, true);
>   	}
> -unlock_inode:
> -	inode_unlock(inode);
>   out:
> +	inode_unlock(inode);
>   	mnt_drop_write_file(filp);
>   
>   	if (ret >= 0) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
