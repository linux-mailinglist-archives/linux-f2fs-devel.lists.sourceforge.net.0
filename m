Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A90688916C2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Mar 2024 11:27:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rq9SU-0002S8-I2;
	Fri, 29 Mar 2024 10:27:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rq9ST-0002S2-3o
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 10:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Pkv6qlinXe1eOJh8BsuMc+zxZET/h+TOL3hzurhBlY=; b=lvXHdlwzfIe3WLTPBwXaD0feU2
 YELck50S43wOdszkK3d7KIJ2uy4+EuBvTFAxMysdR4f/Kv/jqftXzxUNZD0RXorzkiHJsL+S7Df9F
 0ccnMoTqxsikStzEAAY6MJcFH17KPQlqpjXCLxIUD7tyCy2cofrbUMl5mcHXwOXfz228=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Pkv6qlinXe1eOJh8BsuMc+zxZET/h+TOL3hzurhBlY=; b=kfHtG0bLcmuvT9sHpegI6g3fV9
 DLbbtG/0vRLvAEZXcvitEd04xK4AuVH7nCfe0ay6tv7p1po84n78P29A9bxoKjhqpApiXVi/7HdOW
 yYXCtVg4Zw+1QRBlzDD16TCMLz4okKZaE8CiS4lVrxQmB4SvacvmpjpRPZmoCaak7JZY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rq9SS-000710-Gx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Mar 2024 10:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 655D5618F9;
 Fri, 29 Mar 2024 10:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D599DC433C7;
 Fri, 29 Mar 2024 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711708046;
 bh=8xMeaCmofKZN4p34vXY4FFK17GcCRICBaE1lcyCzeBM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PIyOpwrCPivcOVF6EfUHGrLZj2HiAf2Wi9ge1bXQnB5kBkAOtIFQyxiG5bM6VToQF
 ny+g2wHOlBFl0qixv6urftD3AHuJp3tvnXCGJfshh9EbiyihhrO9f08e3DcisC0Vpn
 gwkm8Yfmb3AeAJmu79QCSNaf2PatMbZ7/SD9mnDLYTeXZcEhROsWsCyqDJ4g2BzNwT
 FtO9RFZQIgH1sn8D6l+t+KOK2a1yWStYkG+xY7vkjO38BvVH4JqWKktkcztTcH/1dq
 QgJ0TNQgIH8cQsJm9k4KVPvPsqlQYrKwKxCrC0HrPlDRSkTv5JyxmEd/QWF8FXWNa7
 sjmzuvCv5fZtg==
Message-ID: <9172f17e-deb4-4219-b917-330cdffa5a81@kernel.org>
Date: Fri, 29 Mar 2024 18:27:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240329065508.2398202-1-bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240329065508.2398202-1-bo.wu@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/29 14:55, Wu Bo wrote: > Consider of a f2fs system
 with 2 devices: > Info: Device[0] : /dev/block/dm-46 blkaddr = 0--3fffff
 > Info: Device[1] : /dev/block/dm-47 blkaddr = 400000--67fffff > > [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rq9SS-000710-Gx
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 0 addr of multi devices when dio
 mapping
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/29 14:55, Wu Bo wrote:
> Consider of a f2fs system with 2 devices:
> Info: Device[0] : /dev/block/dm-46 blkaddr = 0--3fffff
> Info: Device[1] : /dev/block/dm-47 blkaddr = 400000--67fffff
> 
> f2fs_map_blocks will return logical addr of fs when doing buffered io:
> f2fs_map_blocks: dev = (254,46), ino = 40020, file offset = 462865, start blkaddr = 0x400000
> 
> While dio mapping will return the addr of device:
> f2fs_map_blocks: dev = (254,47), ino = 40020, file offset = 462865, start blkaddr = 0x0
> 
> So the addr=0 is valid when the map.m_bdev is not s_bdev.

Thanks for catching this, there is already a formal patch as below link:

https://lore.kernel.org/linux-f2fs-devel/20240327074223.2216487-1-chao@kernel.org

Thanks,

> 
> Fixes: 8d3c1fa3fa5e ("f2fs: don't rely on F2FS_MAP_* in f2fs_iomap_begin")
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>   fs/f2fs/data.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d9494b5fc7c1..dca3628932c7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4185,7 +4185,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
>   		return -EINVAL;
>   
> -	if (map.m_pblk != NULL_ADDR) {
> +	if (map.m_pblk != NULL_ADDR ||
> +		(map.m_multidev_dio && map.m_bdev != inode->i_sb->s_bdev)) {
>   		iomap->length = blks_to_bytes(inode, map.m_len);
>   		iomap->type = IOMAP_MAPPED;
>   		iomap->flags |= IOMAP_F_MERGED;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
