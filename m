Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927D4E50A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 11:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heGFy-0007hm-Gr; Fri, 21 Jun 2019 09:54:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1heGFx-0007hO-BD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 09:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDev0r7o29mgtF+85WipHnZ7mNl/oLfOiQLKM/gad6o=; b=PjMQwQ+MMCDYzKrMqM55tGOPN0
 zHlwSbhcGM8XDDnBc9GLUuEDwCT18rBwVxeNi5tj/6sV4nQkgwRDDZDkE7v5xb0skPn50KzyfHITv
 eykoylpvsUTZ4vjyc/BMhvyPbm0TAjLqF5UcxYdnrMcZNZMo8J4VcHKUyg+sGlWKN1sU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xDev0r7o29mgtF+85WipHnZ7mNl/oLfOiQLKM/gad6o=; b=RUwACQ5J28lNHjRG6wFxVodRgu
 fIkh4A051TfcWcwOuEemASRBz/Hnlr/ZkO5imVrLRnSmfqB49XqaMXTxpCdxf/x8D7oVkOmx9xR4k
 HHk6jmn4m+Ko1+ChygTCQme7sM2CguIjiM17z1KESMZ6BH9dIpQRWWL524WMRvmYfkOM=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heGFy-007b9v-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 09:54:56 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CE75F25CFA34DA6EF421;
 Fri, 21 Jun 2019 17:54:46 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 17:54:39 +0800
To: Geert Uytterhoeven <geert@linux-m68k.org>, Qiuyang Sun
 <sunqiuyang@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190620143800.20640-1-geert@linux-m68k.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <dd980fec-d507-6969-cd86-971bafb401c2@huawei.com>
Date: Fri, 21 Jun 2019 17:54:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190620143800.20640-1-geert@linux-m68k.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heGFy-007b9v-Gp
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Use div_u64*() for 64-bit
 divisions
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Geert,

Since the original patch hasn't been merged to upstream, I think we can merge
this into original patch, how do you think?

On 2019/6/20 22:38, Geert Uytterhoeven wrote:
> On 32-bit (e.g. m68k):
> 
>     fs/f2fs/gc.o: In function `f2fs_resize_fs':
>     gc.c:(.text+0x3056): undefined reference to `__umoddi3'
>     gc.c:(.text+0x30c4): undefined reference to `__udivdi3'
> 
> Fix this by using div_u64_rem() and div_u64() for 64-by-32 modulo resp.
> division operations.
> 
> Reported-by: noreply@ellerman.id.au
> Fixes: d2ae7494d043bfaf ("f2fs: ioctl for removing a range from F2FS")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> This assumes BLKS_PER_SEC(sbi) is 32-bit.
> 
>     #define BLKS_PER_SEC(sbi)                                       \
> 	    ((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
> 
> Notes:
>   1. f2fs_sb_info.segs_per_sec and f2fs_sb_info.blocks_per_seg are both
>      unsigned int,
>   2. The multiplication is done in 32-bit arithmetic, hence the result
>      is of type unsigned int.
>   3. Is it guaranteed that the result will always fit in 32-bit, or can
>      this overflow?
>   4. fs/f2fs/debug.c:update_sit_info() assigns BLKS_PER_SEC(sbi) to
>      unsigned long long blks_per_sec, anticipating a 64-bit value.
> ---
>  fs/f2fs/gc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5b1076505ade9f84..c65f87f11de029f4 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1438,13 +1438,15 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  	unsigned int secs;
>  	int gc_mode, gc_type;
>  	int err = 0;
> +	__u32 rem;
>  
>  	old_block_count = le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);
>  	if (block_count > old_block_count)
>  		return -EINVAL;
>  
>  	/* new fs size should align to section size */
> -	if (block_count % BLKS_PER_SEC(sbi))
> +	div_u64_rem(block_count, BLKS_PER_SEC(sbi), &rem);
> +	if (rem)
>  		return -EINVAL;
>  
>  	if (block_count == old_block_count)
> @@ -1463,7 +1465,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  	freeze_bdev(sbi->sb->s_bdev);
>  
>  	shrunk_blocks = old_block_count - block_count;
> -	secs = shrunk_blocks / BLKS_PER_SEC(sbi);
> +	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
>  	spin_lock(&sbi->stat_lock);
>  	if (shrunk_blocks + valid_user_blocks(sbi) +
>  		sbi->current_reserved_blocks + sbi->unusable_block_count +
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
