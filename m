Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 513AC6054FF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 03:30:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olKNz-0004ro-8h;
	Thu, 20 Oct 2022 01:30:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1olKNj-0004rI-2j
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 01:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OqId3pwLq0kMnNMw5KrMSUKBZOeLQq77vGIND0dclQA=; b=lXVBRaXvEJ4C8ZaeIXk8+XdAmn
 n8bzva6OXl/yCbz5QYAvOF7jQRNE+lYAIEsqtMyqeMt7/rL7KjDr1gKoQoUpV5/ubo0zhyoURwADd
 E4aHz9Lt8HS7Vljr9SdrBAim03FyW1KUPSBLTxx4I+Pl8twS4YhFU0N7Ez54Ue2kDwgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OqId3pwLq0kMnNMw5KrMSUKBZOeLQq77vGIND0dclQA=; b=M1c4xay9qvEon/DlNc3tMbkl0h
 wBWPVZrir5kpksy81zcix1VWSzQkZN5xKLpdYvwmEovcPCrWKmJD6DSbRmfn6elxFSF1QQbsUQLqX
 BZpaoVHujwwePkYT2ydujK5a2TRfhL4+cJbDCsdSVo2c7M/ZPklPnDppp0mzgyuTEf/E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olKNg-00ANWu-W9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 01:29:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92C00619B3;
 Thu, 20 Oct 2022 01:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D669C433D6;
 Thu, 20 Oct 2022 01:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666229391;
 bh=mD6OfYACTrkKxSXaKlU8LzwrJmUJG4CeikdgThM3nP8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oOb+lyOf9VTTXf52CbzF+bjBEoRSBag5I7czKLHcp8Bfk2aN4fZ8WFugVKD/cLq6p
 EMO+mJfCEVcYhjL5LILXo9Skphjoq42qIiVeFuGjd8Yyga5Q0kr67GTe/v9wcx02Qi
 vAZOenilcGL5vWXMGnfljoch27PFoCD+hYaA5H4/U0IDvdHwJBGV/8lRVVFahZ3Npn
 mxeyyjECt36F7NR1Wr3EjBMAIvoCT7DS5OVUU1XB0cbyVS1bgYzELsHGxrCq2UGOUN
 pl4sJgdWN2ar1GWNVVlT/J9E7znhKREimLFkpvvKS9rCeXtuAbTgldx4Q8BZcUkIdf
 tPpy8V2DEg5jg==
Message-ID: <35811a40-cc69-a50d-b348-62eed5ed1227@kernel.org>
Date: Thu, 20 Oct 2022 09:29:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20221018024532.44184-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221018024532.44184-1-zhangqilong3@huawei.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/18 10:45, Zhang Qilong wrote: > In the following
 case: > process 1 process 2 > ->open A > ->mmap > ->read # the first time
 > ->ioctl w/h F2FS_IOC_MOVE_RANGE > # (range A->B) > ->read # the [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olKNg-00ANWu-W9
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix data consistency in
 f2fs_move_file_range()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/18 10:45, Zhang Qilong wrote:
> In the following case:
> process 1			process 2
>   ->open A
>    ->mmap
>     ->read # the first time
>     				 ->ioctl w/h F2FS_IOC_MOVE_RANGE
> 				        	# (range A->B)
>     ->read # the second time

How about checking B as well? Previous mapped data can still be accessed
after F2FS_IOC_MOVE_RANGE?

Thanks,

> 
> We will read old data at the second time. The root cause is that
> user still can see the previous source data after being moved. We
> fix it by adding truncating after __exchange_data_block.
> 
> Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - moving truncating to the range of f2fs_lock_op()
> 
> v3:
> - modify the title and commit message
> ---
>   fs/f2fs/file.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82cda1258227..e9dfa41baf9e 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2824,6 +2824,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   			goto out_src;
>   	}
>   
> +	filemap_invalidate_lock(src->i_mapping);
>   	f2fs_lock_op(sbi);
>   	ret = __exchange_data_block(src, dst, pos_in >> F2FS_BLKSIZE_BITS,
>   				pos_out >> F2FS_BLKSIZE_BITS,
> @@ -2835,7 +2836,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   		else if (dst_osize != dst->i_size)
>   			f2fs_i_size_write(dst, dst_osize);
>   	}
> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
>   	f2fs_unlock_op(sbi);
> +	filemap_invalidate_unlock(src->i_mapping);
>   
>   	if (src != dst)
>   		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
