Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A19348D31B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 10:40:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCErJ-0003aE-A7;
	Wed, 29 May 2024 08:40:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCErI-0003a6-1H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYyNXXfiEE9wImJ99ywU8pNui9idjYpsv/xL9VHTjmk=; b=hdjTeQwBSCHiHxs47nCcRpCs8h
 XOdLy7zlTuWxPZG3fXdG3DRN6KBnYqaNxVA/x5zOGJz2OpgSVEX6HC7fiRfK+s6IX6RDsTh1w0Qp/
 jz/6enVSWC4Y/EitAv7i1zP45C8fJWNSr6bpJNlHslG1sMBTqyZJMNZYmkbf7GjTfacM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KYyNXXfiEE9wImJ99ywU8pNui9idjYpsv/xL9VHTjmk=; b=j+89R4NSUGW81OyxWwRtc+UTTz
 3N6eRUE07/+r4OKMKvqQ0WorA9/c5cy+1SEvDe10wRb/XDZMN3lbKaaaLhQZyLNz33J0bYzlFJqlr
 w6HCAmHBYVpe+nBvjF/i8dwAXhvVnfc/ys1Gx88j0MsI54yYDcQK1Hj90W8iRq0YUU6U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCErI-0001rv-2d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 916B3CE1682;
 Wed, 29 May 2024 08:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10A8C2BD10;
 Wed, 29 May 2024 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716972018;
 bh=BwUxRk7Asx85AyGi+Q5sBXOAO5knNtBwrnzi+v7Uquw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RaI9MNmqjwhvpPxJOJPpmP5U+qgttFG6H9ldj0Wlq8QeEHOv1svjJYWpgI73cqTYd
 F/HiXnWg+3BTVItYKitIdWDcDRyMo99xzr4FaKVZByyYt3v1Br8hJp6XiJ74rWuGoo
 XuEnSb2fI0DgrpJ6sKEsQfQv3Bd7xISPsGEq1s1n+jlQcgwn5KNMC6jBaDUX6PSiYs
 3XcGqG/IGtSalsnAPa2AT7WXE4WuoRmB3pBvN9DF9VgH8dFIg3e+hD9hZ3CvtU9+tY
 Naxi3joH1HjleApxcvbO8NZtCt8g4p9rGXljK5+kUrfqDunLcq7qvv2+L2hU22G17U
 miog6Xte7cE/A==
Message-ID: <98d2930c-3fb8-4fa2-abe8-c90dbb315eec@kernel.org>
Date: Wed, 29 May 2024 16:40:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1716970779-27896-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1716970779-27896-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/29 16:19, Zhiguo Niu wrote: > SSR allocate mode
 will be used when doing file defragment > if ATGC is working at the same time, 
 that is because > set_page_private_gcing may make CURSEG_ALL_DA [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCErI-0001rv-2d
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid use SSR allocate when do
 defragment
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
Cc: Hao_hao.Wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/29 16:19, Zhiguo Niu wrote:
> SSR allocate mode will be used when doing file defragment
> if ATGC is working at the same time, that is because
> set_page_private_gcing may make CURSEG_ALL_DATA_ATGC segment
> type got in f2fs_allocate_data_block when defragment page
> is writeback, which may cause file fragmentation is worse.
> 
> A file with 2 fragmentations is changed as following after defragment:
> 
> ----------------file info-------------------
> sensorsdata :
> --------------------------------------------
> dev       [254:48]
> ino       [0x    3029 : 12329]
> mode      [0x    81b0 : 33200]
> nlink     [0x       1 : 1]
> uid       [0x    27e6 : 10214]
> gid       [0x    27e6 : 10214]
> size      [0x  242000 : 2367488]
> blksize   [0x    1000 : 4096]
> blocks    [0x    1210 : 4624]
> --------------------------------------------
> 
> file_pos   start_blk     end_blk        blks
>         0    11361121    11361207          87
>    356352    11361215    11361216           2
>    364544    11361218    11361218           1
>    368640    11361220    11361221           2
>    376832    11361224    11361225           2
>    385024    11361227    11361238          12
>    434176    11361240    11361252          13
>    487424    11361254    11361254           1
>    491520    11361271    11361279           9
>    528384     3681794     3681795           2
>    536576     3681797     3681797           1
>    540672     3681799     3681799           1
>    544768     3681803     3681803           1
>    548864     3681805     3681805           1
>    552960     3681807     3681807           1
>    557056     3681809     3681809           1
> 
> A new FI flag FI_DEFRAG_IN_PROGRESS is introduced to avoid
> this scenarios.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/f2fs.h    | 1 +
>   fs/f2fs/file.c    | 2 ++
>   fs/f2fs/segment.c | 3 ++-
>   3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4044e67..9281c5e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -803,6 +803,7 @@ enum {
>   	FI_COW_FILE,		/* indicate COW file */
>   	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
>   	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
> +	FI_DEFRAG_IN_PROGRESS,	/* indicate file was defragmenting */
>   	FI_MAX,			/* max flag, never be used */
>   };
>   
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5c0b281..93d2767 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2717,6 +2717,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>   		goto out;
>   	}
>   
> +	set_inode_flag(inode, FI_DEFRAG_IN_PROGRESS);
>   	map.m_lblk = pg_start;
>   	map.m_len = pg_end - pg_start;
>   	total = 0;
> @@ -2772,6 +2773,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>   clear_out:
>   	clear_inode_flag(inode, FI_SKIP_WRITES);
>   out:
> +	clear_inode_flag(inode, FI_DEFRAG_IN_PROGRESS);
>   	clear_inode_flag(inode, FI_OPU_WRITE);
>   unlock_out:
>   	inode_unlock(inode);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 7caf20a..dd6f8ac 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3482,7 +3482,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>   		if (page_private_gcing(fio->page)) {
>   			if (fio->sbi->am.atgc_enabled &&
>   				(fio->io_type == FS_DATA_IO) &&
> -				(fio->sbi->gc_mode != GC_URGENT_HIGH))
> +				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&
> +				!is_inode_flag_set(inode, FI_DEFRAG_IN_PROGRESS))

How about checking FI_OPU_WRITE flag?

Thanks,

>   				return CURSEG_ALL_DATA_ATGC;
>   			else
>   				return CURSEG_COLD_DATA;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
