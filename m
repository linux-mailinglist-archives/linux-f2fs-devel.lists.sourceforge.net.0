Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB45B52B74
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Sep 2025 10:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjAVBUAz1CjLv0bd0yZWrXX4PrUCuYvy5c4XNYIZ8Oc=; b=iYGZ/Nyi+vvKhs+W74fp/x+6iJ
	X9D0dhi0gYlEQoVaAByjDQuyQD35wquLTmYRa4z96nTlwCYIOkvFHRwhGqdba3WuSUZ8SemhZvp+G
	pNvbbG7r35XYO8xaBIu6G6R7qSWuH5mUHy4qfsL80D3aJNaYaemo0PCcNE3u5dEyUz54=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwcWm-00073N-J1;
	Thu, 11 Sep 2025 08:19:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uwcWY-0006yE-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 08:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=njgzVt/4UbfShMBLXCIAdwaRom1oP2hL/bg4SMdgch8=; b=K0Iw6KKaNSlyudM/mbdkcnBrwD
 p7D3WrV0UFUuy8324se/Jv4aCR719UzMbmWbGECGEgyXGg/SW0M6N6GDnUovzre4lxIHUmbixK4kZ
 Oz+O4bIb2T7IuleQcBb1dio32tPpswYdKZqpGGDaRyUVary/c1Hlog1THQvz3gCyPc3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=njgzVt/4UbfShMBLXCIAdwaRom1oP2hL/bg4SMdgch8=; b=ENryeDxXqRjCrBU4vXybLCqt/r
 L7Ut/wW7ll7onM4O1396riSGgsG8n7msvaa0oDBFxa4H+5dxCpOdXUixW9eCsbglml0w7YUip7rJY
 8WV7ReLo0SdKBYYhLZQSbkmno1NPYzB0vY/oJHOxaR6l6gVhAh9cKY90t83KcOU3mnf4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwcWY-0001n5-4P for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 08:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 598656013D;
 Thu, 11 Sep 2025 08:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5A5C4CEF1;
 Thu, 11 Sep 2025 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757578751;
 bh=cZKbUYp1WeU6O2Sr+ZScff3E+oh6kWfDkkGDRRWbqps=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bwrP0B0KI52C49vphmiXlCAUfUPhjA/eLP3sbHbmhHQ8xhc0meD44MvqS3Hbq6ji+
 OsYV6IMOG8bOefByzk5fJurE7mmS/8/ixiltRvyCM6xNgiTHFTcAlOGSm8bWfi8vDN
 /uWH0aVqypOHrcNKZyT379GdjrUMiLKgHVafRrGUPZPLffipGAZbEGPkKi25FvPn/u
 gOf6DBO8JOzXkpyJ9u2TwGRQrmLiS0WRVCL1D76hSUx0cO6RNiUDOaVAFH4/eRBzlB
 Stwij7Hngz2t7Or0PziyrW2dmmzrCOS/LbwVG4llYqQ19o+IMI/vz2kbnxNpdk/X7r
 TmtJzds5G66MA==
Message-ID: <228203f5-d3bf-46fb-b990-3de2eb2ff3e8@kernel.org>
Date: Thu, 11 Sep 2025 16:19:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250910135835.2751574-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250910135835.2751574-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/10/25 21:58, wangzijie wrote: > When the data layout
 is like this: > dnode1: dnode2: > [0] A [0] NEW_ADDR > [1] A+1 [1] 0x0 > ...
 .... > [1016] A+1016 > [1017] B (B!=A+1017) [1017] 0x0 > > We can [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uwcWY-0001n5-4P
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong extent_info data for
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/10/25 21:58, wangzijie wrote:
> When the data layout is like this:
> dnode1:                     dnode2:
> [0]      A                  [0]    NEW_ADDR
> [1]      A+1                [1]    0x0
> ...                         ....
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> We can build this kind of layout by following steps(with i_extra_isize:36):
> ./f2fs_io write 1 0 1881 rand dsync testfile
> ./f2fs_io write 1 1881 1 rand buffered testfile
> ./f2fs_io fallocate 0 7708672 4096 testfile
> 
> And when we map first data block in dnode2, we will get wrong extent_info data:
> map->m_len = 1
> ofs = start_pgofs - map->m_lblk = 1882 - 1881 = 1
> 
> ei.fofs = start_pgofs = 1882
> ei.len = map->m_len - ofs = 1 - 1 = 0
> 
> Fix it by skipping updating this kind of extent info.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/data.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7961e0ddf..b8bb71852 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1649,6 +1649,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  
>  		switch (flag) {
>  		case F2FS_GET_BLOCK_PRECACHE:
> +			if (__is_valid_data_blkaddr(map->m_pblk) &&
> +				start_pgofs - map->m_lblk == map->m_len)
> +				map->m_flags &= ~F2FS_MAP_MAPPED;

It looks we missed to reset value for map variable in f2fs_precache_extents(),
what do you think of this?

---
 fs/f2fs/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1aae4361d0a8..2b14151d4130 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3599,7 +3599,7 @@ static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
 int f2fs_precache_extents(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct f2fs_map_blocks map;
+	struct f2fs_map_blocks map = { 0 };
 	pgoff_t m_next_extent;
 	loff_t end;
 	int err;
@@ -3617,6 +3617,8 @@ int f2fs_precache_extents(struct inode *inode)

 	while (map.m_lblk < end) {
 		map.m_len = end - map.m_lblk;
+		map.m_pblk = 0;
+		map.m_flags = 0;

 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRECACHE);
-- 
2.49.0

Thanks,

>  			goto sync_out;
>  		case F2FS_GET_BLOCK_BMAP:
>  			map->m_pblk = 0;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
