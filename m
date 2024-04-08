Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5089CBBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Apr 2024 20:35:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rttpi-0001BZ-8z;
	Mon, 08 Apr 2024 18:35:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rttph-0001BT-Jr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 18:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e5oJ+0XuliFpwvmKl/Jftm4WYX1WZzY1atJry+uXlYw=; b=OM2E5Mt8TgQLds43jydDy8Wy8W
 b3K9ZI6W9rPso69HmqYLazaZRg/SUnzAKqbvDNd3UkSjbuVBuv/al5ZmZze25k1x5FxtHZ5xguoMp
 Ha0sDY65TCH6uL2uzksqPQTq/yIWkJR7mWYABmJyeWDYkGQfbrTRiLGyg5aitMHeLXb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e5oJ+0XuliFpwvmKl/Jftm4WYX1WZzY1atJry+uXlYw=; b=Xe5kx42sWgRfl3wtS9s03dvzr5
 3adi9JsnA4OwWDXEZa+2gllBLp40L8+ppaeckUTP3fKF6VIVjXDrLUACMdOcOun8dwVWCad9G4JC8
 vTeK1aQisUDaEakkBMq67b98eEmP/VzqmUz9mFiynvXBEWwh2AcoL3Wd6ZhvsN2k5a9g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rttpd-0004iL-BD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 18:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E5816137A;
 Mon,  8 Apr 2024 18:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970D4C433F1;
 Mon,  8 Apr 2024 18:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712601290;
 bh=Wa0em0v4uNc5LcrcJZOdAno3VTgfvvOXBz5t5lWf1RM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDX/sTk/H4b3E55t9VOVqfY74UrPISydL3jSCm5bs88WFpA+wYJyHyGqD1a5GlG45
 cQeP35KH20HRsYYPTC3wUVFotiHge5CB9AIn6zgm1ymgjRHckgqVEMYHLL7e4qPm3c
 QqzPex/LIUchRVMd5M9PvkVnXted/qAmzvWDzSGmQ9tBwndmAgyoOPzc4874nXVLwH
 icbVOvFeghgU/6l45asvmQgVO9P6wY9Fqe2ZTDaqwb2RPWIfCDQH7DrzYRh/Wn1WM7
 t5GctdVCLMW3qzjIGvWVL6BgfOC5Hz7+JWugC5BKPfzWwhzp6wds+sxBp7RJUQKtQj
 geO/SfVOYsrzw==
Date: Mon, 8 Apr 2024 18:34:49 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <ZhQ4yRwASLuwnzpm@google.com>
References: <20240408131157.4100204-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408131157.4100204-1-shengyong@oppo.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/08, Sheng Yong wrote: > Althrough old and new sb have
 the same value for now, it would be better > to build new checkpoint according
 to new sb. May need to add assert, if they're different? > > Signed-off-by:
 Sheng Yong <shengyong@oppo.com> > --- > fsck/resize.c | 7 ++++--- > 1 file
 changed, 4 insertions(+),
 3 deletions(-) > > diff --git a/fsck/resize.c b/fsck/resize.c
 > index 049ddd3..1 [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rttpd-0004iL-BD
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: get value from new sb during
 rebuilding cp
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/08, Sheng Yong wrote:
> Althrough old and new sb have the same value for now, it would be better
> to build new checkpoint according to new sb.

May need to add assert, if they're different?

> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fsck/resize.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fsck/resize.c b/fsck/resize.c
> index 049ddd3..1b4ae85 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -481,7 +481,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>  		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
>  
>  	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
> -						2 * get_sb(segs_per_sec));
> +						2 * get_newsb(segs_per_sec));
>  
>  	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
>  	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
> @@ -551,11 +551,12 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>  							cpu_to_le32(crc);
>  
>  	/* Write a new checkpoint in the other set */
> -	new_cp_blk_no = old_cp_blk_no = get_sb(cp_blkaddr);
> +	old_cp_blk_no = get_sb(cp_blkaddr);
> +	new_cp_blk_no = get_newsb(cp_blkaddr);
>  	if (sbi->cur_cp == 2)
>  		old_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>  	else
> -		new_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
> +		new_cp_blk_no += 1 << get_newsb(log_blocks_per_seg);
>  
>  	/* write first cp */
>  	ret = dev_write_block(new_cp, new_cp_blk_no++);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
