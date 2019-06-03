Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5932DC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2019 12:40:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXkOK-00050C-7M; Mon, 03 Jun 2019 10:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hXkOI-0004zb-3Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 10:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q8CTbh+ZncNxVUqKUYUg46BtZv9RoOYRt3vZcqsdmbM=; b=lNuCPJYCFPX5343NXcoO0Wlht1
 F5wRoi9F/AhTSzi7SO+c2XvNxgnA8z6ERLiLGy4y7R7mojwjeqFFX92ujQ7z+8c2i+3Hc2eqn4hBN
 WAuOqvjmk9yuOby4PZDyVKyP0/0v5kEYCoS8R+5Sn1tW2FOjQLbORPvxIZAtXQDJeCsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q8CTbh+ZncNxVUqKUYUg46BtZv9RoOYRt3vZcqsdmbM=; b=eRpZx6SkHmcDyTkNciJZhRCkSJ
 HBt8WjjtzDQLhIydnPuoTqovWlxhFmGtZrql5p1ffYyD0TNP/SOdtRghDD3DJUr/5QHzaIFQzw1w3
 KE7cXsqbYmmMKwkLxNl1H30/0OFLGposHj/rQyj7WN0SppvDT/ooQkfgSh/6ql680RQE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hXkOG-003a46-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 10:40:33 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E7154A3224CBF0D18B26;
 Mon,  3 Jun 2019 18:39:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 18:39:29 +0800
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190530004906.261170-1-drosen@google.com>
 <20190530004906.261170-4-drosen@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c99079bd-99e1-e100-08f6-1e8adae5e722@huawei.com>
Date: Mon, 3 Jun 2019 18:39:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190530004906.261170-4-drosen@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hXkOG-003a46-OZ
Subject: Re: [f2fs-dev] [PATCH v3 3/4] f2fs: Fix accounting for unusable
 blocks
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/5/30 8:49, Daniel Rosenberg wrote:
> Fixes possible underflows when dealing with unusable blocks.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/f2fs.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9b3d9977cd1ef..a39cc4ffeb4b1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1769,8 +1769,12 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>  
>  	if (!__allow_reserved_blocks(sbi, inode, true))
>  		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> -		avail_user_block_count -= sbi->unusable_block_count;
> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +		if (avail_user_block_count > sbi->unusable_block_count)
> +			avail_user_block_count = 0;

avail_user_block_count -= sbi->unusable_block_count;

> +		else
> +			avail_user_block_count -= sbi->unusable_block_count;

avail_user_block_count = 0;

Thanks,

> +	}
>  	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
>  		diff = sbi->total_valid_block_count - avail_user_block_count;
>  		if (diff > *count)
> @@ -1970,7 +1974,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  					struct inode *inode, bool is_inode)
>  {
>  	block_t	valid_block_count;
> -	unsigned int valid_node_count;
> +	unsigned int valid_node_count, user_block_count;
>  	int err;
>  
>  	if (is_inode) {
> @@ -1997,10 +2001,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  
>  	if (!__allow_reserved_blocks(sbi, inode, false))
>  		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
> +	user_block_count = sbi->user_block_count;
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> -		valid_block_count += sbi->unusable_block_count;
> +		user_block_count -= sbi->unusable_block_count;
>  
> -	if (unlikely(valid_block_count > sbi->user_block_count)) {
> +	if (unlikely(valid_block_count > user_block_count)) {
>  		spin_unlock(&sbi->stat_lock);
>  		goto enospc;
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
