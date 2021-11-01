Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 105964413CB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 07:37:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhQwW-00034x-Sf; Mon, 01 Nov 2021 06:37:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mhQwV-00034r-Kn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 06:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6T+XR+QSO2chiaZFEEATGgr7KV2IRbwTlkm8eDyFHLo=; b=L7gfmgcS1AHnGoIyq3SeLmgn44
 7ViBz+lnJBy3W9/SWl8FfRVzABcc+JYRtXJ0aHQbk72uu+analeLuaRgi3B+Lm0lKZBdAo+b1USSx
 FhIZ0b+BbdQCMAn3TCYxYDrvZAhFYrBMsD/wjk/mt0jywBpIUh1h5sJS4Z9ZqiD7gJP0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6T+XR+QSO2chiaZFEEATGgr7KV2IRbwTlkm8eDyFHLo=; b=H7Qbcw0GIqMbAZkjyPOxXzcgMN
 6noHbWOWrsnWLOjzJffdK5WaeBLg0U5z9xaeFJbBW/eg4SSaKL5G2JZCtMIxj7A2LuKwzPa0oInFu
 lIwAdCFXoRTXHuYexH6hsXxeN2bXKstmg2k9SMVB5qeDHJCPwy0PenWHJDSzo/AwMgB4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhQwP-0001kT-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 06:37:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CB9160F45;
 Mon,  1 Nov 2021 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635748116;
 bh=Q35jh+CN4KR3qBGtwUC476UVincVnoNSqWeaxprxOfI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R2IlUzHUzSP/BewvftxjuQt8MwiNhPrq/OUyksH0OCvt2gQUexj7tfumXGgRJ5ysH
 rBdJn/1Gt+FB9eFiy5mUlc4U3OVocTYbGeqknoXVBdq9kMK7EFI5ENtdPrXHVnjMxP
 w+guFrtqhmIBZsm+TVMetoH6eHpGE9AAOoL0H4t/138d5cH884XqggGw24uc1UbVHW
 vX5tmklSWetaX6jRIRn8PIbp7NY201+TBIYrqzKmNAke05Xdycho+1M6YHQSHYmeh0
 PPz3mFkWFRA9M4JQVyAFYglf/1ro/KbYmJ++ULKiP1gycUDDjCN0M7O3NTvLCOHHiC
 T0HvGDOfZfXFQ==
Message-ID: <d1929b64-15a3-feaf-5401-1552b2eb2461@kernel.org>
Date: Mon, 1 Nov 2021 14:28:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Hyeong-Jun Kim <hj514.kim@samsung.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CGME20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94@epcas1p3.samsung.com>
 <20211101054214.24456-1-hj514.kim@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211101054214.24456-1-hj514.kim@samsung.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/1 13:42, Hyeong-Jun Kim wrote: > Encrypted pages
 during GC are read and cached in META_MAPPING. > However, due to cached pages
 in META_MAPPING, there is an issue where > newly written pages [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mhQwP-0001kT-HJ
Subject: Re: [f2fs-dev] [PATCH] F2FS: invalidate META_MAPPING before IPU/DIO
 write
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

On 2021/11/1 13:42, Hyeong-Jun Kim wrote:
> Encrypted pages during GC are read and cached in META_MAPPING.
> However, due to cached pages in META_MAPPING, there is an issue where
> newly written pages are lost by IPU or DIO writes.
> 
> Thread A                              Thread B
> - f2fs_gc(): blk 0x10 -> 0x20 (a)
>                                        - IPU or DIO write on blk 0x20 (b)
> - f2fs_gc(): blk 0x20 -> 0x30 (c)
> 
> (a) page for blk 0x20 is cached in META_MAPPING and page for blk 0x10
>      is invalidated from META_MAPPING.
> (b) write new data to blk 0x200 using IPU or DIO, but outdated data
>      still remains in META_MAPPING.
> (c) f2fs_gc() try to move blk from 0x20 to 0x30 using cached page in
>      META_MAPPING. In conclusion, the newly written data in (b) is lost.

In c), f2fs_gc() will readahead encrypted block from disk via ra_data_block() anyway,
not matter cached encrypted page of meta inode is uptodate or not, so it's safe, right?

Am I missing anything?

Thanks,

> 
> To address this issue, invalidating pages in META_MAPPING before IPU or
> DIO write.
> 
> Signed-off-by: Hyeong-Jun Kim <hj514.kim@samsung.com>
> ---
>   fs/f2fs/data.c    | 2 ++
>   fs/f2fs/segment.c | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 74e1a350c1d8..9f754aaef558 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1708,6 +1708,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>   		 */
>   		f2fs_wait_on_block_writeback_range(inode,
>   						map->m_pblk, map->m_len);
> +		invalidate_mapping_pages(META_MAPPING(sbi),
> +						map->m_pblk, map->m_pblk);
>   
>   		if (map->m_multidev_dio) {
>   			block_t blk_addr = map->m_pblk;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 526423fe84ce..f57c55190f9e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3652,6 +3652,9 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>   		goto drop_bio;
>   	}
>   
> +	invalidate_mapping_pages(META_MAPPING(fio->sbi),
> +				fio->new_blkaddr, fio->new_blkaddr);
> +
>   	stat_inc_inplace_blocks(fio->sbi);
>   
>   	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
