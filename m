Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C2CA190CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2025 12:41:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taZ6P-0001aw-IW;
	Wed, 22 Jan 2025 11:40:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1taZ6D-0001aA-OA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 11:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nbsq3BZYD86Tiz2sDMpwQPV67Stw5ypWafMZImGZcOA=; b=RDPUkiNiHgeqGWWXYt+Emy7lSc
 3rfoRz/Toi6pU9udFQHEkfreEN1EvxeADKBBpq2JLH6JXRo3MFtNWnOmQQ5tYBO4ODPPu9Q00/LVQ
 LN9DFIXx2DH+w3/Zm4xD19hYmCSB3X80BVpv3pZTnHbAovINemuCmQLNSGtxzDmgi3RE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nbsq3BZYD86Tiz2sDMpwQPV67Stw5ypWafMZImGZcOA=; b=CpfVC339dDA1RQzld/9WEZa/cb
 qTbsEXdEpnofzuMDKKVa+/pljj6ppiX78rszp4yHhtKxMGp7MC8/o9u/Cnzf3aCWTaCwz5lo7yNSC
 j7ss51qrw/poJY8T/GfBm7ugc6EGPftorbD+SY7uUagel/aMGTDBTPlSOCzkyFKdd/Hc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taZ6D-0005O7-1V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 11:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 405205C5D10;
 Wed, 22 Jan 2025 11:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0B9C4CED6;
 Wed, 22 Jan 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737546039;
 bh=R0HCeHA4SOr96wGuO6NZipjkw2IwS7Me1pYxGGgeURU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TIF7iU2DhngKRMbq72c5A+mUeacEZD5+hPJ0lEBHSVdC25JHeBSK6UwTiRd2fc6D3
 enuBYLIDffgq4mwpsHmwI0gYeBg8FvBwxYzNWxKoV648uT/Go3pEAhC8EYBWEsreZH
 eam+yJIEYV6Iqps5yTNMrWTVL6y7q1eEckO+jfh6KqHEO8EGcg/v55VcfQUp+8l1Pr
 riQ/WpKZCSTZRCaXWNGss3pmHO0f28vSZSONS2PsK4nkLiV7UQMVIytG31J/w8Xi9D
 E0+i7DxlOPZN+oaICQ969NkHlMJp+e0Qz9//do4vKarMqUFZPR65w65VijeIwD9seL
 IhieMmEGTISzA==
Message-ID: <d0b32f14-114b-4f18-94eb-fa83fc611cff@kernel.org>
Date: Wed, 22 Jan 2025 19:40:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: chenzhangqi79@163.com, jaegeuk@kernel.org
References: <20250113055702.1347172-1-chenzhangqi79@163.com>
Content-Language: en-US
In-Reply-To: <20250113055702.1347172-1-chenzhangqi79@163.com>
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Zhangqi, On 1/13/25 13:57, chenzhangqi79@163.com wrote:
 > From: Zhangqi Chen <chenzhangqi@xiaomi.com> > > In the function f2fs_fiemap, 
 when returning the file > map extent flag, the flag of the delayed allocat
 [...] Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taZ6D-0005O7-1V
Subject: Re: [f2fs-dev] [PATCH V0 RESEND] f2fs: fix error map extent flag
 while block not allocated
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Zhijun Li <lizhijun3@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Zhangqi,

On 1/13/25 13:57, chenzhangqi79@163.com wrote:
> From: Zhangqi Chen <chenzhangqi@xiaomi.com>
> 
> In the function f2fs_fiemap, when returning the file
> map extent flag, the flag of the delayed allocation
> block is set to FIEMAP_EXTENT_UNWRITTEN . At the same
> time, the phy address of the file map extent reassigned
> to 0 because it is not a valid address.
> 
> In this way, the file map extent with address 0 and
> FIEMAP_EXTENT_UNWRITTEN flag returned by ioctl, and
> may be used for writing by userspace programs, thereby
> destroying the superblock of the file system.

I agree with you.

FYI, there is a previous patch as below:

https://lore.kernel.org/linux-f2fs-devel/20230405144359.930253-1-chao@kernel.org/

It seems such change will fail some testcases of xfstest, have you check
this patch w/ 009, 092 and 094 in tests/generic/?

Thanks,

> 
> As mentioned in /Documentation/filesystems/fiemap.txt,
> FIEMAP_EXTENT_UNWRITTEN should mean that the block has
> been allocated but not filled with data. However, the
> actual situation in f2fs is that there is no allocated
> block, so it should be changed to FIEMAP_EXTENT_UNKNOWN
> and FIEMAP_EXTENT_DELALLOC.
> 
> Co-developed-by: Zhijun Li <lizhijun3@xiaomi.com>
> Signed-off-by: Zhijun Li <lizhijun3@xiaomi.com>
> Signed-off-by: Zhangqi Chen <chenzhangqi@xiaomi.com>
> ---
>  fs/f2fs/data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2ec0cfb41260..a945d1f1d40c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2023,7 +2023,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  				size += F2FS_BLKSIZE;
>  			}
>  		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
> -			flags = FIEMAP_EXTENT_UNWRITTEN;
> +			flags = FIEMAP_EXTENT_UNKNOWN | FIEMAP_EXTENT_DELALLOC;
>  		}
>  
>  		start_blk += F2FS_BYTES_TO_BLK(size);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
