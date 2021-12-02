Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F4465C89
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 04:10:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mscUq-0003fg-74; Thu, 02 Dec 2021 03:10:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mscUp-0003fa-4v
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 03:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Siu9uS1pDLfDqotOz/iCVcKDS+XLiAMXqlBaPm6rVbc=; b=M95RCnXmFDSjjHJDQioquGboQ0
 7aH9WfSR2b3n+Su25CmfpVa3DgGZFjqBpjyh/xZcfLtg/Gfd4B/OU3QgUCCAm6uLuowzAak8KkBx/
 r3zsiSkUgUejdP5FtnAE9qtq+N/vByQCS4Q57EacX212EaAtPF4+QgdhuMNphpGhm8+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Siu9uS1pDLfDqotOz/iCVcKDS+XLiAMXqlBaPm6rVbc=; b=FGc2gtQmIkqyTLxLzdU0sEaTDR
 avj1n3GRps+Ere/VqHd5RIgRtXoFQhNHFaS3ytpRBFXUXPKdBCCUmSiOD8/3tPeb2+ItZAAAOCYJR
 VzY+MLqn9vb10x/0wOGcrATJZwq0IYE4NbHiTbz+DdaExOPVsvNpmCUiYNTTX3ciT2mA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mscUl-0005sQ-JE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 03:10:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29F1DB80D51;
 Thu,  2 Dec 2021 03:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D176C00446;
 Thu,  2 Dec 2021 03:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638414644;
 bh=6x02M+oNKOcHx0oToe06+vo2NwN8rWx6I9CTKjVOHxM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h2C575LQW6nb/vJouchWkl/9mndJyqNhKDfgMPA+1N+rxNgA5iKLLd7L7gpxiq3Vd
 LKVW77c+N0EZdXO7L61BjNpei4TcWVTmPSW4do4xL7IxTXBGLyJuox2heXpoL9wG7u
 /Po6wJF46Q9pezxz8kSbZfjdwVkywXex7BZ0xZMj+u/XF0TGGgQB72zKRsWoZvyBkg
 FL7Z+uwDqkc4go/SjLz8h2KkMC91Mbl/GeQ5DAMv3o14IwyVU20Mu9nkTitn7XGSG9
 rmELpggDuvFxIZkod1XDLmfYLfawVjNCbNiE9uBrfIG99E+IO+qSb9sfbA0r2QsZsS
 vZZHZBvQLpkbw==
Message-ID: <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
Date: Thu, 2 Dec 2021 11:10:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211116214510.2934905-5-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/17 5:45, Jaegeuk Kim wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Implement 'struct iomap_ops' for f2fs, in preparation
 for making f2fs > use iomap for direct I/O. > > Note that th [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mscUl-0005sQ-JE
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: implement iomap operations
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/17 5:45, Jaegeuk Kim wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Implement 'struct iomap_ops' for f2fs, in preparation for making f2fs
> use iomap for direct I/O.
> 
> Note that this may be used for other things besides direct I/O in the
> future; however, for now I've only tested it for direct I/O.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/Kconfig |  1 +
>   fs/f2fs/data.c  | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
>   fs/f2fs/f2fs.h  |  1 +
>   3 files changed, 60 insertions(+)
> 
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 7eea3cfd894d..f46a7339d6cf 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -7,6 +7,7 @@ config F2FS_FS
>   	select CRYPTO_CRC32
>   	select F2FS_FS_XATTR if FS_ENCRYPTION
>   	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
> +	select FS_IOMAP
>   	select LZ4_COMPRESS if F2FS_FS_LZ4
>   	select LZ4_DECOMPRESS if F2FS_FS_LZ4
>   	select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7ac1a39fcad2..43b3ca7cabe0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -21,6 +21,7 @@
>   #include <linux/cleancache.h>
>   #include <linux/sched/signal.h>
>   #include <linux/fiemap.h>
> +#include <linux/iomap.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -4236,3 +4237,60 @@ void f2fs_destroy_bio_entry_cache(void)
>   {
>   	kmem_cache_destroy(bio_entry_slab);
>   }
> +
> +static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> +			    unsigned int flags, struct iomap *iomap,
> +			    struct iomap *srcmap)
> +{
> +	struct f2fs_map_blocks map = {};
> +	pgoff_t next_pgofs = 0;
> +	int err;
> +
> +	map.m_lblk = bytes_to_blks(inode, offset);
> +	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
> +	map.m_next_pgofs = &next_pgofs;
> +	map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
> +	if (flags & IOMAP_WRITE)
> +		map.m_may_create = true;
> +
> +	err = f2fs_map_blocks(inode, &map, flags & IOMAP_WRITE,
> +			      F2FS_GET_BLOCK_DIO);
> +	if (err)
> +		return err;
> +
> +	iomap->offset = blks_to_bytes(inode, map.m_lblk);
> +
> +	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
> +		iomap->length = blks_to_bytes(inode, map.m_len);
> +		if (map.m_flags & F2FS_MAP_MAPPED) {
> +			iomap->type = IOMAP_MAPPED;
> +			iomap->flags |= IOMAP_F_MERGED;
> +		} else {
> +			iomap->type = IOMAP_UNWRITTEN;
> +		}
> +		if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
> +			return -EINVAL;
> +		iomap->addr = blks_to_bytes(inode, map.m_pblk);
> +
> +		if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
> +			return -EINVAL;

Why not relocating this check before f2fs_map_blocks()?

Thanks,

> +		iomap->bdev = inode->i_sb->s_bdev;
> +	} else {
> +		iomap->length = blks_to_bytes(inode, next_pgofs) -
> +				iomap->offset;
> +		iomap->type = IOMAP_HOLE;
> +		iomap->addr = IOMAP_NULL_ADDR;
> +	}
> +
> +	if (map.m_flags & F2FS_MAP_NEW)
> +		iomap->flags |= IOMAP_F_NEW;
> +	if ((inode->i_state & I_DIRTY_DATASYNC) ||
> +	    offset + length > i_size_read(inode))
> +		iomap->flags |= IOMAP_F_DIRTY;
> +
> +	return 0;
> +}
> +
> +const struct iomap_ops f2fs_iomap_ops = {
> +	.iomap_begin	= f2fs_iomap_begin,
> +};
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 14bea669f87e..0d199e8f2c1d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3654,6 +3654,7 @@ int f2fs_init_post_read_processing(void);
>   void f2fs_destroy_post_read_processing(void);
>   int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
> +extern const struct iomap_ops f2fs_iomap_ops;
>   
>   /*
>    * gc.c
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
