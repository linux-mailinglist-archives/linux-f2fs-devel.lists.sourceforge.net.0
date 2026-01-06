Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D1CF7778
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 10:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbt1H+Th5So5DoQFIlGX4hXtQTxGVQ2J54LN+8r1lV8=; b=GPWeA0ONcJE7z9tI0mSqgpttaP
	n+HEOE4/Nibqbr0+a3DRI0myJbLIN0YyAKDcJJX29dLlpBFCDLStkOQL6d05twCkyHTN9lhaRjlt7
	/Lc3yqdZWv5bv91awyXKAyWMo88D2HUVp40ZA81p3ZDM7sUUXRyxxCyQxH2/VqCE6QCI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd3Dm-0001zj-CZ;
	Tue, 06 Jan 2026 09:19:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd3Dl-0001zd-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ps/e37RJ01DNe1bWYU9xGhvay+TuOEIKnFPB3iivjgI=; b=C4gE7z6D2SDQEwpCND1gxgiEPX
 U39TbcuKB8Dkiu6SHtwMDhXnPKZcb/NAqSlwGlJsGKCqlAKuzcv/tqfYlsDt7dZDzVxFyXtUR6QZP
 MUG6qQxgpux0MsCVuU4chFG2zp34D+8vNtC0jQGIJ/9ykDKTaTOembOfH6ZGvnoV+V6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ps/e37RJ01DNe1bWYU9xGhvay+TuOEIKnFPB3iivjgI=; b=K2pEn0F3axK4AbRXVb2eCjYtK4
 LevmxH7Jtn+YdRiqdgrkqmKVNCFif802sfpdhdbZEXt5o9oBNjdgvh/5G580qamIuOpFICJuOPJWG
 OAkx8IrUCaN84tSWCJ7TkfpbouJw0HG0IDzvymmt7vBN0MRMaFzYiHVQfdJ3kyaVQ41Y=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd3Dk-0001cC-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2512E60147;
 Tue,  6 Jan 2026 09:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1792C116C6;
 Tue,  6 Jan 2026 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767691149;
 bh=HM7bO4kGE61iGCmc+DywYU7RkkXgKI7ZuQwEXodrOqk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pclQmq9d9pAdkLxYlolSQoK+5cNcFgY/EVKwrbZ7SNWkezoewCWmR6EomVXPkiKB6
 ksxv+lemSzPr+DrBbUFJX8hQ56A99sEQfSsksSgFM+LjcVqgWBvHIeXfFj2kI3sr+m
 C3fFTbWe1T2JGlnto0QmoT3l9ZqbUV+nZP6WV8gRm/FWz/xl5FBtzhckCH/j2gWRgl
 IMzfWUTlqpYgXQiRAnB0s/8xyWknT79Pqcvi4ovuSPWvhaalMCoAOG3sZVfbe7R2I1
 2+YidKDs9T3QYqKnF5GOSNYSCRSuBLQiqdYTBHazaL6rMac2RrFy4mI3C/iHJJFj74
 lfyJjDDobgCnA==
Message-ID: <9b4f9818-f8fd-4af2-8f5e-bab768bac8c9@kernel.org>
Date: Tue, 6 Jan 2026 17:19:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>, Kim Jaegeuk <jaegeuk@kernel.org>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-4-nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <20260105153101.152892-4-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/5/2026 11:30 PM,
 Nanzhe Zhao wrote: > f2fs_read_data_large_folio()
 relies on f2fs_map_blocks() to decide whether > a subpage should be
 zero-filled
 or queued to a read bio. > > However, f2fs_map_b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd3Dk-0001cC-O8
Subject: Re: [f2fs-dev] [PATCH v1 3/5] f2fs: add f2fs_block_needs_zeroing()
 to handle hole blocks
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/5/2026 11:30 PM, Nanzhe Zhao wrote:
> f2fs_read_data_large_folio() relies on f2fs_map_blocks() to decide whether
> a subpage should be zero-filled or queued to a read bio.
> 
> However, f2fs_map_blocks() can set F2FS_MAP_MAPPED for NULL_ADDR and
> NEW_ADDR in the non-DIO, no-create path. The large folio read code then

Nanzhe,

IIUC, f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT) won't map hole
space, or am I missing something?

Thanks,

> treats such hole blocks as mapped blocks, and may account them
> in read_pages_pending and attempt to build bios for them, which can
> leave tasks stuck in readahead for heavily fragmented files.
> 
> Add a helper, f2fs_block_needs_zeroing(), which detects NULL_ADDR and
> NEW_ADDR from struct f2fs_map_blocks. Use it to prioritize the zeroing
> path by checking f2fs_block_needs_zeroing() before
> (map.m_flags & F2FS_MAP_MAPPED) under got_it: label.
> 
> Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
> ---
>   fs/f2fs/data.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 4bef04560924..66ab7a43a56f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2413,6 +2413,11 @@ static void ffs_detach_free(struct folio *folio)
>   	kmem_cache_free(ffs_entry_slab, ffs);
>   }
> 
> +static inline bool f2fs_block_needs_zeroing(const struct f2fs_map_blocks *map)
> +{
> +	return map->m_pblk == NULL_ADDR || map->m_pblk == NEW_ADDR;
> +}
> +
>   static int f2fs_read_data_large_folio(struct inode *inode,
>   		struct readahead_control *rac, struct folio *folio)
>   {
> @@ -2468,14 +2473,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   		if (ret)
>   			goto err_out;
>   got_it:
> -		if ((map.m_flags & F2FS_MAP_MAPPED)) {
> -			block_nr = map.m_pblk + index - map.m_lblk;
> -			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
> -						DATA_GENERIC_ENHANCE_READ)) {
> -				ret = -EFSCORRUPTED;
> -				goto err_out;
> -			}
> -		} else {
> +		if ((f2fs_block_needs_zeroing(&map))) {
>   			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
>   			if (f2fs_need_verity(inode, index) &&
>   			    !fsverity_verify_page(folio_file_page(folio,
> @@ -2484,6 +2482,13 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   				goto err_out;
>   			}
>   			continue;
> +		} else if((map.m_flags & F2FS_MAP_MAPPED)) {
> +			block_nr = map.m_pblk + index - map.m_lblk;
> +			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
> +						DATA_GENERIC_ENHANCE_READ)) {
> +				ret = -EFSCORRUPTED;
> +				goto err_out;
> +			}
>   		}
> 
>   		/* We must increment read_pages_pending before possible BIOs submitting
> --
> 2.34.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
