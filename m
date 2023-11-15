Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5637EC677
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 15:57:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3HKO-0002KF-NS;
	Wed, 15 Nov 2023 14:57:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r3HKN-0002K8-7V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 14:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=92MEAvYvaC8YEtZiHNidnapRwPjVt4JSanYNKB9xBoI=; b=nQZp2XNlix8ysEKEH680jNDb1N
 Xo59udeJZrwab+kz1weakuD6SHboIvi6Va2FXnkzbRVk5bBucMpvi6E4c6xltYcB8TsiMXIuAx1p2
 OLwu5iScfzT2S+GO7Zrla19Iu0Ia5bGFkTztXGll1LcVlmdNa+gJ+QP0zMO7XjMBlzpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=92MEAvYvaC8YEtZiHNidnapRwPjVt4JSanYNKB9xBoI=; b=J4ZOTM9SCSmV+e1By1nYf333MF
 bUtbpCPZ4aFPxzX1bPWYON+flXlVfHQdWmcuLGRLTjySALttejUFRnax+J2Hq4YeCvsZ1zcCX6RWU
 s9u1g2UzEkITWODPlMW8VWLwJb1AYwZ/5x7Et5FbrAiD4kdYBULmcbYp2dCy0PkM36jU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3HKH-006Z8i-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 14:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6124CE1D73;
 Wed, 15 Nov 2023 14:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2EEC433C8;
 Wed, 15 Nov 2023 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700060222;
 bh=DbC/RlTt46G/vcvasCDLPs0jylhf+xjP8xII2Uu+weU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dQvpWSOrDccdTNU5lSrfOvUM+KXPgaQi7dD9rDxVqWyXDm8+3FCwtvWBBnkhGd7tb
 E9ys82d1mwVUOpFIU0jD1fAoD9Rfb8zCq8ASsam/ughEJcjPmZ4JidyDpNkFFn0/Tu
 PvC/2GXhU+Js1Rwy9KBlBSvT84+nXc28Hh9tgctemyHC/+wif8Sxx0Tv6yScPwyXbv
 XpI9Dr/3r6TNrAIm/7drMX2N+Pw4KJqrT65mBlvB8UMmUUq5gO4Yw/t/CSn07UEhZK
 tKcmoOGalwISoNvbKitf/4WuU51De92NLjLk3NcIKExqSibc3RU1s0GP3kxeRyS8Wg
 hjURTfRCxS/kA==
Message-ID: <f2d4f2d9-ab6a-de4f-e950-a37502be01d0@kernel.org>
Date: Wed, 15 Nov 2023 22:56:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20231027154935.1384979-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231027154935.1384979-1-daeho43@gmail.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/27 23:49, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > If we write CP_UMOUNT_FLAG in fsck, f2fs will
 not do foll forward recovery :s/foll/roll Otherwise, it looks good to me.
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r3HKH-006Z8i-Lf
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: do not put CP_UMOUNT_FLAG for
 roll forward recovery
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/27 23:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> If we write CP_UMOUNT_FLAG in fsck, f2fs will not do foll forward recovery

:s/foll/roll

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> even though it has to do.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fsck/fsck.c       | 3 ++-
>   fsck/mount.c      | 5 ++++-
>   include/f2fs_fs.h | 1 +
>   3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index f1a55db..126458c 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2526,7 +2526,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>   	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>   	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>   	unsigned long long cp_blk_no;
> -	u32 flags = c.alloc_failed ? CP_FSCK_FLAG: CP_UMOUNT_FLAG;
> +	u32 flags = c.alloc_failed ? CP_FSCK_FLAG :
> +			(c.roll_forward ? 0 : CP_UMOUNT_FLAG);
>   	block_t orphan_blks = 0;
>   	block_t cp_blocks;
>   	u32 i;
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 3b02d73..805671c 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3218,7 +3218,7 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>   	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>   	block_t orphan_blks = 0;
>   	unsigned long long cp_blk_no;
> -	u32 flags = CP_UMOUNT_FLAG;
> +	u32 flags = c.roll_forward ? 0 : CP_UMOUNT_FLAG;
>   	int i, ret;
>   	uint32_t crc = 0;
>   
> @@ -3837,6 +3837,9 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
>   	if (ret)
>   		goto out;
>   
> +	if (c.func == FSCK && inode_list.next != &inode_list)
> +		c.roll_forward = 1;
> +
>   	ret = late_build_segment_manager(sbi);
>   	if (ret < 0) {
>   		ERR_MSG("late_build_segment_manager failed\n");
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index abd5abf..faa5d6b 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1513,6 +1513,7 @@ struct f2fs_configuration {
>   	unsigned int feature;			/* defined features */
>   	unsigned int quota_bits;	/* quota bits */
>   	time_t fixed_time;
> +	int roll_forward;
>   
>   	/* mkfs parameters */
>   	int fake_seed;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
