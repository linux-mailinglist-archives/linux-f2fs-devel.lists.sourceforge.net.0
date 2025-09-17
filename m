Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED34B80D01
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 17:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Duw4DAAhYDT/gNFMXq7ymnGoM3elS0Iw0giJ2ZMT1Pk=; b=F9qbfOGG6WdFDvsd7ruaQ7sw5/
	Ojvq6rmIbP2Tw1FeajxMl9ca9V1F3btQJQKKnqMYBQ6e12j0j+mk7DxRADmjVNR18LZoy7/qhlr3u
	hWo29Z7+SS4g0agMpd59giL1hzzwLcK3sQantLhpbpX5CQDfvNiLsnHnl9ocM2pPOkwM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyuZI-0003Dr-7x;
	Wed, 17 Sep 2025 15:59:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uyuZG-0003Dh-LT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 15:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OO41h5tkuWMMm1y5jOW4u2QJm/h/TKJskepU6csDOlY=; b=lMQToXCi0LNBqU8WU6G/l7HfTx
 E6XrzC3iWcgWzt0/G7UvJ+NVD/HEhhtoPdjRE9NITxCOxj6RZoS6KvuMJlqRKnKgbhs3rpKgOYFpO
 qDomYi0SWrNqHxwteSn47ahZf9ZfwrxaPdsVSLxJwYMIpOMV3bz8e8CE0bzerIWpIf9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OO41h5tkuWMMm1y5jOW4u2QJm/h/TKJskepU6csDOlY=; b=Pdkwwv0NiKJWbIgxXc99WpYfqn
 2qaDB8oY6NC/Sn2mGf0TAnHdYRyQHGhmkDw8IeBnA5RxLblQjy/RCxnlSPSKa+JoPkds1eNLy+PMV
 3L+AmgSMtD2/X5fBd1rFlOpBsOX8mq5X4cD922R+eaIC+8zsJyvUExOM9HcUHpqklYEA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyuZF-0008AA-SN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 15:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD13260233;
 Wed, 17 Sep 2025 15:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC55C4CEE7;
 Wed, 17 Sep 2025 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758124765;
 bh=NnGX677nwdyHGZdxlN31q3yooL9zbXMipdVwiJ+dzBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5M0aTe4F3gwnP33KkGj3X8l9LNtVvODxOO439YyMDX8reXD3J2xZQKP2LPN80SUN
 QTeoMVUo+TBPRblP8kq9PZv3voN3GLMYqEPMapXyBniyJFmT5OEBu/TS8j7Ndvy779
 crFuKVgbx8LSbXpNeHsnZ+hHEzY+cfYIhCoNkYLJdNByCAhgmI6C0CMXPglVjy3ZGW
 f4z+3adIG8moNfUJ/zvM+4gpd5Kc5bNF2EBoD8lGnD7lfCF0ntXGKUxgnpOM3tY665
 LeBhLS2TIZGSIfBGTiHv8Yo3B8lSbyg4/x8nVjs0ssRxrHfM2sSCujVc5JXA9yVmHX
 vv8NLMVkpcDlA==
Date: Wed, 17 Sep 2025 15:59:23 +0000
To: wangzijie <wangzijie1@honor.com>
Message-ID: <aMra2_bW9cPCRcTs@google.com>
References: <20250917023622.516052-1-wangzijie1@honor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917023622.516052-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/17, wangzijie wrote: > Script to reproduce: > f2fs_io
 write 1 0 1881 rand dsync testfile > f2fs_io fallocate 0 7708672 4096 testfile
 > f2fs_io write 1 1881 1 rand buffered testfile > fsync testf [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyuZF-0008AA-SN
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix zero-sized extent for
 precache extents
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/17, wangzijie wrote:
> Script to reproduce:
> f2fs_io write 1 0 1881 rand dsync testfile
> f2fs_io fallocate 0 7708672 4096 testfile
> f2fs_io write 1 1881 1 rand buffered testfile
> fsync testfile
> umount
> mount
> f2fs_io precache_extents testfile
> 
> When the data layout is something like this:
> dnode1:                     dnode2:
> [0]      A                  [0]    NEW_ADDR
> [1]      A+1                [1]    0x0
> ...
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> During precache_extents, we map the last block(valid blkaddr) in dnode1:
> map->m_flags |= F2FS_MAP_MAPPED;
> map->m_pblk = blkaddr(valid blkaddr);
> map->m_len = 1;
> then we goto next_dnode, meet the first block in dnode2(hole), goto sync_out:
> map->m_flags & F2FS_MAP_MAPPED == true, and we make zero-sized extent:
> 
> map->m_len = 1
> ofs = start_pgofs - map->m_lblk = 1882 - 1881 = 1
> ei.fofs = start_pgofs = 1882
> ei.len = map->m_len - ofs = 1 - 1 = 0
> 
> 
> Rebased on patch[1], this patch can cover these cases to avoid zero-sized extent:
> A,B,C is valid blkaddr
> case1:
> dnode1:                     dnode2:
> [0]      A                  [0]    NEW_ADDR
> [1]      A+1                [1]    0x0
> ...                         ....
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> case2:
> dnode1:                     dnode2:
> [0]      A                  [0]    C (C!=B+1)
> [1]      A+1                [1]    C+1
> ...                         ....
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> case3:
> dnode1:                     dnode2:
> [0]      A                  [0]    C (C!=B+2)
> [1]      A+1                [1]    C+1
> ...                         ....
> [1015]   A+1015
> [1016]   B (B!=A+1016)
> [1017]   B+1                [1017] 0x0
> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20250912081250.44383-1-chao@kernel.org/
> 
> Fixes: c4020b2da4c9 ("f2fs: support F2FS_IOC_PRECACHE_EXTENTS")
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> Rebased on:
> https://lore.kernel.org/linux-f2fs-devel/20250912081250.44383-1-chao@kernel.org/
> v2:
> https://lore.kernel.org/linux-f2fs-devel/20250915035246.98055-1-wangzijie1@honor.com/
> ---
>  fs/f2fs/data.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 838eae39d..7a5170b32 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1778,9 +1778,10 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  		if (map->m_flags & F2FS_MAP_MAPPED) {
>  			unsigned int ofs = start_pgofs - map->m_lblk;
>  
> -			f2fs_update_read_extent_cache_range(&dn,
> -				start_pgofs, map->m_pblk + ofs,
> -				map->m_len - ofs);
> +			if (map->m_len - ofs > 0)

Applied with
			if (map->m_len > ofs)

> +				f2fs_update_read_extent_cache_range(&dn,
> +					start_pgofs, map->m_pblk + ofs,
> +					map->m_len - ofs);
>  		}
>  		if (map->m_next_extent)
>  			*map->m_next_extent = is_hole ? pgofs + 1 : pgofs;
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
