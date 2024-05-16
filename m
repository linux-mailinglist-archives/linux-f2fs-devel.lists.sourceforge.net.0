Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62CC8C726F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2024 10:06:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7W8T-00079y-TM;
	Thu, 16 May 2024 08:06:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s7W8S-00079C-7E
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 08:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S4cZJXilPFReiDfTtuJk20G3/oAWwraZSP3dwHi93c0=; b=EVQdHpk5hWdHDelLGkGOhlLDU9
 D4JG/AAni3FThqxpiKV4VeMnrtL4ON8YeVyNa60RRFoDeufX+32tB4Dilrj2pltGddgiee0Yzx1e8
 b5zDlQWheaYUmWUjk5xWU2WQCmW1+6s89Dw2d+qXtL5I9447Oc9kc9CHdjLvW/0VVSnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S4cZJXilPFReiDfTtuJk20G3/oAWwraZSP3dwHi93c0=; b=Nk03GJDXQIC9FgMkVMJHOrNXfs
 n0Z4Fmb7y/Eg+pAgKDedFk5SkcunOq21znHd0s2DtMIW/NkJVj4q5n5I7hJHFvaMlmU66SoKFNIsH
 uD0tiY4mwA6dnI8Ibvy0S877vlrf9NAoTsG/dPSzxK5nCHm6Yna3XeAf6wCcjp1eq26I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7W8T-00062D-D3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 08:06:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47EC061680;
 Thu, 16 May 2024 08:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C0BC32781;
 Thu, 16 May 2024 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715846798;
 bh=Cpes2UwySJ5Ss9+H0DDEAlFZX5mKWDHgKLb1yKMu3OI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vco1HtXF/lVJfAJo4GYPqv/q5dp57R2B9PypCmBdhq/n/3Hjebue4fGhBUEUb1m8o
 EInyD9fNStefU14k2Q3xO5GKF44UFEphHfSSAXqGp7SzkdtDybBhupHbbg9J+XHmz4
 AAGA0oHGuyV5ET5zZ59HFjz/gfmxAbWFhQHhuzZCaV4TjeLxjjtU+b05Eyg0QgkIrM
 iQOBy30ImeILZIL/HRvUdxZIKyC3a0+9d2fszXSdRUJwvQC1zuP00MxJcDxI6PBXa+
 hrkgdVbbJQ2E8uJJhAJb+HjZb8cfBeLqRpi42fN49u+OQPqjg029NZelaC2Hoq2SQJ
 Kgmq4h6LRsRzg==
Message-ID: <c9c8b609-68b8-4f44-98eb-8d04e1a270fb@kernel.org>
Date: Thu, 16 May 2024 16:06:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240515082433.24411-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240515082433.24411-1-liaoyuanhong@vivo.com>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/15 16:24, Liao Yuanhong wrote: > Currently, when
 we allocating a swap file on zone UFS, this file will > created on conventional
 UFS. If the swap file size is not aligned with the > zone siz [...] 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: aligned.to]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s7W8T-00062D-D3
Subject: Re: [f2fs-dev] [PATCH] f2fs:modify the entering condition for
 f2fs_migrate_blocks()
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
Cc: linux-kernel@vger.kernel.org, bo.wu@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/15 16:24, Liao Yuanhong wrote:
> Currently, when we allocating a swap file on zone UFS, this file will
> created on conventional UFS. If the swap file size is not aligned with the
> zone size, the last extent will enter f2fs_migrate_blocks(), resulting in
> significant additional I/O overhead and prolonged lock occupancy. In most
> cases, this is unnecessary, because on Conventional UFS, as long as the
> start block of the swap file is aligned with zone, it is sequentially
> aligned.To circumvent this issue, we have altered the conditions for
> entering f2fs_migrate_blocks(). Now, if the start block of the last extent
> is aligned with the start of zone, we avoids entering
> f2fs_migrate_blocks().

Hi,

Is it possible that we can pin swapfile, and fallocate on it aligned to
zone size, then mkswap and swapon?

Thanks,

> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>   fs/f2fs/data.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 50ceb25b3..4d58fb6c2 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3925,10 +3925,12 @@ static int check_swap_activate(struct swap_info_struct *sis,
>          block_t pblock;
>          block_t lowest_pblock = -1;
>          block_t highest_pblock = 0;
> +       block_t blk_start;
>          int nr_extents = 0;
>          unsigned int nr_pblocks;
>          unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
>          unsigned int not_aligned = 0;
> +       unsigned int cur_sec;
>          int ret = 0;
> 
>          /*
> @@ -3965,23 +3967,39 @@ static int check_swap_activate(struct swap_info_struct *sis,
>                  pblock = map.m_pblk;
>                  nr_pblocks = map.m_len;
> 
> -               if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
> +               blk_start = pblock - SM_I(sbi)->main_blkaddr;
> +
> +               if (blk_start % blks_per_sec ||
>                                  nr_pblocks % blks_per_sec ||
>                                  !f2fs_valid_pinned_area(sbi, pblock)) {
>                          bool last_extent = false;
> 
>                          not_aligned++;
> 
> +                       cur_sec = (blk_start + nr_pblocks) / BLKS_PER_SEC(sbi);
>                          nr_pblocks = roundup(nr_pblocks, blks_per_sec);
> -                       if (cur_lblock + nr_pblocks > sis->max)
> +                       if (cur_lblock + nr_pblocks > sis->max) {
>                                  nr_pblocks -= blks_per_sec;
> 
> +                               /* the start address is aligned to section */
> +                               if (!(blk_start % blks_per_sec))
> +                                       last_extent = true;
> +                       }
> +
>                          /* this extent is last one */
>                          if (!nr_pblocks) {
>                                  nr_pblocks = last_lblock - cur_lblock;
>                                  last_extent = true;
>                          }
> 
> +                       /*
> +                        * the last extent which located on conventional UFS doesn't
> +                        * need migrate
> +                        */
> +                       if (last_extent && f2fs_sb_has_blkzoned(sbi) &&
> +                               cur_sec < GET_SEC_FROM_SEG(sbi, first_zoned_segno(sbi)))
> +                               goto next;
> +
>                          ret = f2fs_migrate_blocks(inode, cur_lblock,
>                                                          nr_pblocks);
>                          if (ret) {
> @@ -3994,6 +4012,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>                                  goto retry;
>                  }
> 
> +next:
>                  if (cur_lblock + nr_pblocks >= sis->max)
>                          nr_pblocks = sis->max - cur_lblock;
> 
> --
> 2.25.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
