Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C373E95180D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 11:50:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seAeD-0000RJ-6r;
	Wed, 14 Aug 2024 09:50:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seAeB-0000RD-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 09:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vya1bNzsxVtkBhNXi1E1+O6mMX5jLT+ZTbbFoFY1rZ4=; b=hXpeguHAD6MKQkq4dULZtaJJkC
 I1y/wAF9z8KcyqXB26vqnE62Jjfyk7xD1wDU2JvqgtLY9xsyFGZJuIjbrdKxhpaibncRmXUFe7iEP
 YuDJnV8E2wO6WDvMJiV9Bg30ZZToF7WhtOO0VvHWD6FYriVOO7+bn9cr3YWQsJnAO5nA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vya1bNzsxVtkBhNXi1E1+O6mMX5jLT+ZTbbFoFY1rZ4=; b=V/DP03sf2uwRVTkPu3l4YpsLOg
 ms58zq25UPc6OI6jWAN0vfeFZXEQEdrn49MpT4ADk1bh7SBbMpWbLL4Hdf7voL94G2UcVSMU4G0fn
 361NpzKpVOQL8JP1J1BwpJIKFTJxHpceHQUAbm292Q2vzzayfxGbGEifbTAzcZsvkC34=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seAe9-0003e1-No for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 09:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E32E4CE11E1;
 Wed, 14 Aug 2024 09:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67578C4AF0D;
 Wed, 14 Aug 2024 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723629012;
 bh=301oXL9Be4WKrU7++f6Fb1I0bax0v9/4TZOUrpwc8EQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UzUw+7mTmb669Okkkwlh2k+AJ6DGA7yTXI2MzkMEdR+po0KDC6asCBgzLuACXYC70
 YQ5I2rI2pNeY7FpSJ5HkVt0QWwZ1HlUmqStfJuLfo2u25XlDcNRULPWMyPafGQDSoL
 AusP6SpSMxEgoCkSn8+Uy7zQJoCxIcC5Y5uV5nD/Jg+WOD7xcPkgls9sTT9o+GE/d6
 QICdIYodf3+R0zdIYA5w8DpI7it8PWa1WpNRhnMLQTquRWAecKxyBnhKOSNVR1mGXf
 xfb7cSoIjUUg1M0BC7Jq94T028APt0kDUr7xJaCBr+1eTcQCpaZqRXFqQ78gI4bPpB
 PVBb7iFbJGqdw==
Message-ID: <7860b050-3948-4e23-b40f-a3df522477cd@kernel.org>
Date: Wed, 14 Aug 2024 17:50:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
 <20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/1 15:47, Daejun Park wrote: > This patch addresses
 the problem that when using LFS mode,
 unused blocks > may occur in f2fs_map_blocks()
 during block allocation for dio writes. > > If a new s [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seAe9-0003e1-No
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid unused block when dio write in
 LFS mode
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/1 15:47, Daejun Park wrote:
> This patch addresses the problem that when using LFS mode, unused blocks
> may occur in f2fs_map_blocks() during block allocation for dio writes.
> 
> If a new section is allocated during block allocation, it will not be
> included in the map struct by map_is_mergeable() if the LBA of the

I didn't get it, why below condition in map_is_mergeable() can not catch this
case? Can you please explain more?

	if (map->m_pblk != NEW_ADDR && blkaddr == (map->m_pblk + ofs))
		return true;

Thanks,

> allocated block is not contiguous. However, the block already allocated
> in this process will remain unused due to the LFS mode.
> 
> This patch avoids the possibility of unused blocks by escaping
> f2fs_map_blocks() when allocating the last block in a section.
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>   fs/f2fs/data.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index b6dcb3bcaef7..b27a3f448f32 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1711,6 +1711,19 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>   		dn.ofs_in_node = end_offset;
>   	}
>   
> +	if (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi)) {
> +		int segno = GET_SEGNO(sbi, blkaddr);
> +		bool last_seg, last_blk;
> +
> +		last_seg = !((segno + 1) % SEGS_PER_SEC(sbi));
> +		last_blk = (f2fs_usable_blks_in_seg(sbi, segno) - 1) ==
> +				GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
> +
> +		/* LBA of the next block to be allocated may not be contiguous. */
> +		if (last_seg && last_blk)
> +			goto sync_out;
> +	}
> +
>   	if (pgofs >= end)
>   		goto sync_out;
>   	else if (dn.ofs_in_node < end_offset)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
