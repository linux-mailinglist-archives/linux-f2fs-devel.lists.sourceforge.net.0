Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B707DA55C38
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 01:50:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqLun-00046T-G3;
	Fri, 07 Mar 2025 00:50:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tqLuh-00045l-2c
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 00:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lif7bFVNzPUiMf8iCeX/UUno3F5tlUHa++gVoKnOvTE=; b=lciPRGJP5WThcxgQQcSxtyB3oC
 K05EuJoE1UGuKWhsELxEzJGD5q9rXWF3AjVsd+/Vdh+kAJw+bQD8jhr0WskwDFfivGqmK50xIaB/o
 cOTu06cU3pO/Bnauy0ngw4WfjJf+Unl+pHbygsQbyPNK2AoqFJ8fmSJnBRwhvTXmTMHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lif7bFVNzPUiMf8iCeX/UUno3F5tlUHa++gVoKnOvTE=; b=in88dUDgStdUUGsCAQ+WgGeKBC
 P8nVsWpAGW+PsipbbZdK8W2LoXtP6pWhuWhAtpDq303sUsuTSbshpbciQiw5gCeosHVQyfqG/Ud5i
 A81h2xVLwqvP31l/0+ZTzBdV9RSBk/9XqNbau9I35fyAowllx0Fv8APWy/h4eZeNI7ZE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqLua-0002Js-UE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 00:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9C7C7A45347
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Mar 2025 00:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42DDC4CEE8;
 Fri,  7 Mar 2025 00:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741308594;
 bh=fpoaWsRiHn6XpxRLaa5x7AgNj/x/Ex9NNMz8rwF5vqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zs4VS2Ie9NQOLRAFvH0nlj92KHYNvmHSOt6xBo1xCIDlGGTz46FPQSmNN/NdX/kNn
 2o2h+j4acrmx6Ycxwe2oBGH7lCiq4XCDEI0h3Hw8ZeN/7qLaH6AbiOigicsUTNPSyi
 QLl0jtagXHCe2QorUt9oC1LSwlaKRfKRN57hpRhDh6eFMNG0xmPCXnj8XMry7jwlR4
 As/hYmkUzfFAwT6ytrNceKI2HFV351d+CDOXdqASBMFAyPi2T5sAhfXTD+hqaXhgGQ
 A+MvKAgpeNP9Gx7iE0rLFWXjUsqi21MigvkGLp7MBh2WUIme8LAd6lS+zLXD7SJVwx
 SCqutjojdSBBA==
Date: Fri, 7 Mar 2025 00:49:52 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z8pCsM6arGKb75bX@google.com>
References: <20250305110506.2113560-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305110506.2113560-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/05,
 Chao Yu wrote: > This patch turns off nat_bits feature
 by default in Android, > for other scenario, keep it on and keep an eye on
 it. > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > fsc [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqLua-0002Js-UE
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: disable nat_bits by default in
 Android
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/05, Chao Yu wrote:
> This patch turns off nat_bits feature by default in Android,
> for other scenario, keep it on and keep an eye on it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fsck/mount.c            | 3 ++-
>  include/f2fs_fs.h       | 6 ++++++
>  mkfs/f2fs_format.c      | 3 ++-
>  mkfs/f2fs_format_main.c | 1 +
>  4 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index a189ba7..2f4c631 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -1708,7 +1708,8 @@ u32 update_nat_bits_flags(struct f2fs_super_block *sb,
>  	nat_bits_bytes = get_sb(segment_count_nat) << 5;
>  	nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) + 8 +
>  						F2FS_BLKSIZE - 1);
> -	if (get_cp(cp_pack_total_block_count) <=
> +	if (!(c.disabled_feature & F2FS_FEATURE_NAT_BITS) &&

We need to set c.diabled_feature |= F2FS_FEATURE_NAT_BITS in fsck and others?

> +			get_cp(cp_pack_total_block_count) <=
>  			(1 << get_sb(log_blocks_per_seg)) - nat_bits_blocks)
>  		flags |= CP_NAT_BITS_FLAG;
>  	else
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 0cb9228..bb40adc 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1471,6 +1471,11 @@ enum {
>  
>  #define MAX_CACHE_SUMS			8
>  
> +/* feature list in Android */
> +enum {
> +	F2FS_FEATURE_NAT_BITS = 0x0001,
> +};
> +
>  struct f2fs_configuration {
>  	uint32_t conf_reserved_sections;
>  	uint32_t reserved_segments;
> @@ -1537,6 +1542,7 @@ struct f2fs_configuration {
>  	int large_nat_bitmap;
>  	int fix_chksum;			/* fix old cp.chksum position */
>  	unsigned int feature;			/* defined features */
> +	unsigned int disabled_feature;	/* disabled feature, used for Android only */
>  	unsigned int quota_bits;	/* quota bits */
>  	time_t fixed_time;
>  	int roll_forward;
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 6635eed..c28ebb0 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -893,7 +893,8 @@ static int f2fs_write_check_point_pack(void)
>  	/* cp page (2), data summaries (1), node summaries (3) */
>  	set_cp(cp_pack_total_block_count, 6 + get_sb(cp_payload));
>  	flags = CP_UMOUNT_FLAG | CP_COMPACT_SUM_FLAG;
> -	if (get_cp(cp_pack_total_block_count) <=
> +	if (!(c.disabled_feature & F2FS_FEATURE_NAT_BITS) &&
> +			get_cp(cp_pack_total_block_count) <=
>  			(1 << get_sb(log_blocks_per_seg)) - nat_bits_blocks)
>  		flags |= CP_NAT_BITS_FLAG;
>  
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index 9407f5b..5b4569d 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -143,6 +143,7 @@ static void add_default_options(void)
>  		force_overwrite = 1;
>  		c.wanted_sector_size = F2FS_BLKSIZE;
>  		c.root_uid = c.root_gid = 0;
> +		c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
>  
>  		/* RO doesn't need any other features */
>  		if (c.feature & F2FS_FEATURE_RO)
> -- 
> 2.48.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
