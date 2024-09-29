Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BD9892F1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2024 05:54:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sul16-0002fM-78;
	Sun, 29 Sep 2024 03:54:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sul14-0002fF-Fs
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 03:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7D3AE1d4fuVuWhuDDCsE3nlaheN1ZUgNAZfoYv9BshI=; b=PqhaBCg+V9R3cZH5bU7LBu3mUA
 b90lRl/v2moh/boap9OmJiUpCy2PhUX3F4mdiFaLBjMDrxFQWoTUioYDmRs9XBztRJElkTdG3HuNh
 n/8NpOvj5zvXibp5ib88L6UHm8x6nYvaJuJzWPok3eXSCDaRtzB1KyuQ0eqQfr2msphI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7D3AE1d4fuVuWhuDDCsE3nlaheN1ZUgNAZfoYv9BshI=; b=mAamBf+kXt91+ey9MiwwU3jrix
 6weVZQgg32uKgUj3ElxmIojjHh59aGCEeK9bueuUzXbCISYXmXXFBC0wq70O4OLleD22+6uGPlHgX
 OpSs98Qgvm3dFqfzYiVphDk61sqxKPPhbQ4eZ2kJJT0zpkItL5YRIoyXpgmsexWDiIzE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sul13-0000L3-PG for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 03:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D4657A40694;
 Sun, 29 Sep 2024 03:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3155EC4CEC6;
 Sun, 29 Sep 2024 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727582071;
 bh=jQnK/zdWBtGm7aEm9PQXE3LpQ7q2Wkf1+dqFPprS3rg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bd1kdb0/4I/cwnVfN61Z2dTw1qOrkXYgERk9PthE3i/QyAjfC3lE7ph7uHqJl2fOn
 04x5sjU1JVS0AYGO+Rhc2EZk4bbzwOzV8/rhLcaBYt2EhGYkstObGTnGRO6LIODpKt
 vpLDkLMgNEqzhVxb9EUKYsq3+A8XqJDG1aL0b2dvkHKkyk4TqfZygtyg+kyPe8+rCO
 jhbqTdKjA6949Zn55HvEaRWeZWrlw5A8Z4YfNVGq2mCGgWVSb73HIhThqCWiS6gFbU
 nOUh03cE3jQYW3oOfEILvUUuNwNfF4hi5iQq9ZE4STJHRpO9c7kk1GUR5x9UIEUxTL
 0X/VUrKOdl+6Q==
Message-ID: <8b368a3a-a25d-42c0-a5b5-f3da4f28c8cc@kernel.org>
Date: Sun, 29 Sep 2024 11:54:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20240929024343.3763975-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20240929024343.3763975-1-hanqi@vivo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/29 10:43, Qi Han wrote: > After release a file and
 subsequently reserve it, the FSCK flag is set > when the file is deleted,
 as shown in the following backtrace: > > F2FS-fs (dm-48): Inconsi [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sul13-0000L3-PG
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix inconsistent update of
 i_blocks in release_compress_blocks and reserve_compress_blocks
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

On 2024/9/29 10:43, Qi Han wrote:
> After release a file and subsequently reserve it, the FSCK flag is set
> when the file is deleted, as shown in the following backtrace:
> 
> F2FS-fs (dm-48): Inconsistent i_blocks, ino:401231, iblocks:1448, sectors:1472
> fs_rec_info_write_type+0x58/0x274
> f2fs_rec_info_write+0x1c/0x2c
> set_sbi_flag+0x74/0x98
> dec_valid_block_count+0x150/0x190
> f2fs_truncate_data_blocks_range+0x2d4/0x3cc
> f2fs_do_truncate_blocks+0x2fc/0x5f0
> f2fs_truncate_blocks+0x68/0x100
> f2fs_truncate+0x80/0x128
> f2fs_evict_inode+0x1a4/0x794
> evict+0xd4/0x280
> iput+0x238/0x284
> do_unlinkat+0x1ac/0x298
> __arm64_sys_unlinkat+0x48/0x68
> invoke_syscall+0x58/0x11c
> 
> For clusters of the following type, i_blocks are decremented by 1 and
> i_compr_blocks are incremented by 7 in release_compress_blocks, while
> updates to i_blocks and i_compr_blocks are skipped in reserve_compress_blocks.
> 
> raw node:
> D D D D D D D D
> after compress:
> C D D D D D D D
> after reserve:
> C D D D D D D D
> 
> Let's update i_blocks and i_compr_blocks properly in reserve_compress_blocks.

Hi, Qi,

Thank you for catching this.

> 
> Fixes: eb8fbaa53374 ("f2fs: compress: fix to check unreleased compressed cluster")
> Signed-off-by: Qi Han <hanqi@vivo.com>
> ---
>   fs/f2fs/file.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 9ae54c4c72fe..7500b4067996 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3791,12 +3791,6 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
>   
>   		to_reserved = cluster_size - compr_blocks - reserved;
>   
> -		/* for the case all blocks in cluster were reserved */
> -		if (to_reserved == 1) {

I think this case is trying to catch abnormal condition and try to
handle it correctly, e.g. compressed cluster was not released due
to it fails in release_compress_blocks(), so status of compress
cluster may be: C D N N N N N N.

So the right check condition should be?

if (reserved && to_reserved == 1)

Thoughts?

And I think we'd better add a testcase in fstests to cover all these
cases, let me figure out a patch soon.

Thanks,

> -			dn->ofs_in_node += cluster_size;
> -			goto next;
> -		}
> -
>   		ret = inc_valid_block_count(sbi, dn->inode,
>   						&to_reserved, false);
>   		if (unlikely(ret))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
