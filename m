Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9038E86C674
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 11:10:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfdMi-0005Qi-6j;
	Thu, 29 Feb 2024 10:10:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rfdMg-0005QX-RF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 10:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpnCMeSe798693txwKzx+QsgT+NTWESa+LDH2VJuidg=; b=k3wZknrmSmv9B2fht+TcK3GxHE
 GUs9miiuQiswORjiAbDi6tgiF/zn0Mtp3wThymxyRpEsbETQA/r4LOKJDJt/m4RFZy88ywqSP9KUg
 xmUyVkRRgWa5vAMcxZqo6ENLYJVLH1dNQirY521Yl90heqqHXeinIrx6kL85pc6g4VUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qpnCMeSe798693txwKzx+QsgT+NTWESa+LDH2VJuidg=; b=BOgt80BjVtDwXnXUK5lhqslvLZ
 JuzTmuYutIeTo224KsBy3CFS+YRszpK4n0hP+/t6WF2BwUQfIr1Q+8D4Iw4wwd4iPwX2Qza74uEJ1
 xGAFSqSihert8TCgeGa5H03DX/8/qUwDfGo+EB/QE66t0pAWRF0O5gHDxpdGWD+AnS2k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfdMc-0000cx-St for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 10:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76B6A615E6;
 Thu, 29 Feb 2024 10:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CA8C433C7;
 Thu, 29 Feb 2024 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709201401;
 bh=NFCnMoMrVuC4cCuJvgRycjqyC2YcWg3DtXlKvOroRlc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h7dYoOTyoUUwJfUYKS8oc/GOmVFCi8gYJOMVwQbnlmCkF71wUj/BjdSpyavLaqZAF
 /yr1BrQ4NDTDhRqWHMrV6k5OtKvz0ncEGnszdFth4oVSBafR9nc3kcrpvxSfXl6kZz
 PLjtxRSsf5QuzJ+CKvdXlBvik7E7v2mzKPGPIb3+WDmc4FrFyNH7B51w2e8KmgUUBh
 DkAUyzz9sQ72N6vTA7Ht5/glAnJlC3jBMWQCQuNEDnniCiBhij7ERX6x/W93UbIyZV
 dgtYvgHoNTqbhz4MAnlx80D1XtTPFJM4hs+egJ9ueV/Bf3tGygu6NxEzZnemyxjfBZ
 U8DWDAUF7NBFg==
Message-ID: <2b81aa6f-db51-4a7c-97ab-2af2c2fea056@kernel.org>
Date: Thu, 29 Feb 2024 18:09:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>
References: <20240226013208.2389246-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240226013208.2389246-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Daeho, Any comments on this serials? Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfdMc-0000cx-St
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix blkofs_end correctly in
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, Daeho,

Any comments on this serials?

Thanks,

On 2024/2/26 9:32, Chao Yu wrote:
> In f2fs_migrate_blocks(), when traversing blocks in last section,
> blkofs_end should be (start_blk + blkcnt - 1) % blk_per_sec, fix it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/data.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c21b92f18463..0c728e82d936 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3841,13 +3841,14 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	unsigned int blkofs;
>   	unsigned int blk_per_sec = BLKS_PER_SEC(sbi);
> +	unsigned int end_blk = start_blk + blkcnt - 1;
>   	unsigned int secidx = start_blk / blk_per_sec;
>   	unsigned int end_sec;
>   	int ret = 0;
>   
>   	if (!blkcnt)
>   		return 0;
> -	end_sec = secidx + (blkcnt - 1) / blk_per_sec;
> +	end_sec = end_blk / blk_per_sec;
>   
>   	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   	filemap_invalidate_lock(inode->i_mapping);
> @@ -3857,7 +3858,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>   
>   	for (; secidx <= end_sec; secidx++) {
>   		unsigned int blkofs_end = secidx == end_sec ?
> -			(blkcnt - 1) % blk_per_sec : blk_per_sec - 1;
> +				end_blk % blk_per_sec : blk_per_sec - 1;
>   
>   		f2fs_down_write(&sbi->pin_sem);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
