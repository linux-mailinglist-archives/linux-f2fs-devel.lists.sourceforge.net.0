Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D037BA28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 12:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgls9-0000wl-6q; Wed, 12 May 2021 10:13:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lgls8-0000wZ-Sf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 10:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=81KB5oGumZ/b36uDp1ZNMa3XLVeXk1h+kKqwJlk5eAA=; b=b5TTA44fW79ZiyQXQFYKWd38TC
 7EO4nNfnVVbkhdcMW2KufLLuCtlGcACzx2SK7zi10W7/lJIIrGrjrb1DkDMkhZtR92SI2H7hVRPNd
 yH/7stHgN2hGBD0Hn8bNfjZh0oLZ01S/KZ350yxFoQXznePUeOwrJQpfCemOqTr6nEUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=81KB5oGumZ/b36uDp1ZNMa3XLVeXk1h+kKqwJlk5eAA=; b=mc/4l8KlCoIE9XCrzEkt+1JMmw
 dv4XR0Efv+e73igCbR8GK51bMm+0L9VAiXbECszNgfDAptOAmQmYla9O2z5fP1Kb4k74W3n9ea4RV
 hRWd+CyvhA+PWwAvovdOEz06XMOqYRLZOgVk0pwSARZUXa1Wf/vgzr701NnBnolN1E2M=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgls1-0000Gs-MY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 10:13:44 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fg9Vz3gpGzWhZs;
 Wed, 12 May 2021 18:09:15 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 18:13:30 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210511214337.2857522-1-jaegeuk@kernel.org>
 <YJtS3qEDFIzqc5Ki@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5c359041-27e8-12d2-5a85-559ab56b835e@huawei.com>
Date: Wed, 12 May 2021 18:13:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJtS3qEDFIzqc5Ki@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx701-chm.china.huawei.com (10.1.199.48) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgls1-0000Gs-MY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid swapon failure by giving a
 warning first
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
Cc: kernel test robot <oliver.sang@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

On 2021/5/12 12:00, Jaegeuk Kim wrote:
> The final solution can be migrating blocks to form a section-aligned file
> internally. Meanwhile, let's ask users to do that when preparing the swap
> file initially like:
> 1) create()
> 2) ioctl(F2FS_IOC_SET_PIN_FILE)
> 3) fallocate()
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: 36e4d95891ed ("f2fs: check if swapfile is section-alligned")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

I've not tested yet though, any comments on below patch?

[PATCH RFC] f2fs: support migrating swapfile in aligned write mode

Thanks,

> ---
> v2:
>   - fix to warn out once
>   - cover check_swap_activate_fast
> 
>   fs/f2fs/data.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 33e56ae84e35..41e260680b27 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3801,6 +3801,7 @@ static int f2fs_is_file_aligned(struct inode *inode)
>   	block_t pblock;
>   	unsigned long nr_pblocks;
>   	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
> +	unsigned int not_aligned = 0;
>   	int ret = 0;
>   
>   	cur_lblock = 0;
> @@ -3833,13 +3834,20 @@ static int f2fs_is_file_aligned(struct inode *inode)
>   
>   		if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
>   			nr_pblocks & (blocks_per_sec - 1)) {
> -			f2fs_err(sbi, "Swapfile does not align to section");
> -			ret = -EINVAL;
> -			goto out;
> +			if (f2fs_is_pinned_file(inode)) {
> +				f2fs_err(sbi, "Swapfile does not align to section");
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			not_aligned++;
>   		}
>   
>   		cur_lblock += nr_pblocks;
>   	}
> +	if (not_aligned)
> +		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
> +			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
> +			not_aligned);
>   out:
>   	return ret;
>   }
> @@ -3858,6 +3866,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>   	int nr_extents = 0;
>   	unsigned long nr_pblocks;
>   	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
> +	unsigned int not_aligned = 0;
>   	int ret = 0;
>   
>   	/*
> @@ -3896,9 +3905,12 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>   
>   		if ((pblock - SM_I(sbi)->main_blkaddr) & (blocks_per_sec - 1) ||
>   				nr_pblocks & (blocks_per_sec - 1)) {
> -			f2fs_err(sbi, "Swapfile does not align to section");
> -			ret = -EINVAL;
> -			goto out;
> +			if (f2fs_is_pinned_file(inode)) {
> +				f2fs_err(sbi, "Swapfile does not align to section");
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			not_aligned++;
>   		}
>   
>   		if (cur_lblock + nr_pblocks >= sis->max)
> @@ -3927,6 +3939,11 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>   	sis->max = cur_lblock;
>   	sis->pages = cur_lblock - 1;
>   	sis->highest_bit = cur_lblock - 1;
> +
> +	if (not_aligned)
> +		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
> +			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
> +			not_aligned);
>   out:
>   	return ret;
>   }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
