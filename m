Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7075551914E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 00:25:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nm0xQ-0006sA-0z; Tue, 03 May 2022 22:25:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nm0xO-0006rz-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 22:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Dq4o/MOidrBhdT8EiCimuzd7yz0eIcmgBrx86N/LlQ=; b=CMdOOwXVi1D8sXZx0Gbso5n+48
 0CHGpOz21R9PthWi4nBkvKgG6yQVJaymTdsAdITfzb6K1UXv8ouAQ/S29TFkEXTSd/QwCi3IEu6MT
 /lKLHoNwha+n/9NtOy9DBBTANMS+So+HLQpupNCjkxPBFOZWBqeiCFjovXUBprHdAx8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Dq4o/MOidrBhdT8EiCimuzd7yz0eIcmgBrx86N/LlQ=; b=HQ96viLlbc2a/yZy3Z6kCI20V0
 As4bYI5pZ42FrXaXH/SX2ur8GbeMUTfn2En2gLIPTmDi1JWdupo41ML7rMAUq1zSJVRmH5Yr3qeWJ
 Z3vDRh8LAjmOh5dTtDaHoiW59Qb3YwgglLE2rB7vGY8YGVuOiYYsKylQ8UPyHrVeWDKQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nm0xJ-00012k-NU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 22:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C282B82201;
 Tue,  3 May 2022 22:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED467C385A9;
 Tue,  3 May 2022 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651616702;
 bh=Gq/fueWpXLku85WUlyGq7Fe4Dx3APSdMq6q4gayT7PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xxr/MaWDJqiadPMG7VGDJpekoL14jhrzBzbHxiLQ0q8CJwi41o1G230jImRmQRWdx
 Q4of6lxctHxejbnevqTjyFSWGWlqx7WF26O4p2/ardn6n47tByAcpnrSwT/xAhUF8C
 kXsxoBdtCnANrlpHbzxETth9Jymp/8ZEsHhRYCcb3NS6uA+qW96HXjlSMLpiP8IIv8
 yEoSuzPl4+HDUkZJzvalQpQj5lkvIaL7RjIWYEG4M/4khabFgFU2Tu+7U38VdPEXz/
 HkaU/+5LSTiwE0VVWJcqXyYQb/k3F91/VIgTC/Lug2NH89VIeK7ad87/JhHlmIUeCu
 zoJjGr5G5ybGQ==
Date: Tue, 3 May 2022 15:25:00 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YnGrvEjxgaXDnxxi@google.com>
References: <20220429204631.7241-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429204631.7241-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/30, Chao Yu wrote: > As Yanming reported in bugzilla:
 > > https://bugzilla.kernel.org/show_bug.cgi?id=215914 > > The root cause
 is: in a very small sized image, it's very easy to > exceed thresh [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nm0xJ-00012k-NU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix deadloop in foreground GC
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/30, Chao Yu wrote:
> As Yanming reported in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215914
> 
> The root cause is: in a very small sized image, it's very easy to
> exceed threshold of foreground GC, if we calculate free space and
> dirty data based on section granularity, in corner case,
> has_not_enough_free_secs() will always return true, result in
> deadloop in f2fs_gc().

Performance regression was reported. Can we check this for very small sized
image only?

> 
> So this patch refactors has_not_enough_free_secs() as below to fix
> this issue:
> 1. calculate needed space based on block granularity, and separate
> all blocks to two parts, section part, and block part, comparing
> section part to free section, and comparing block part to free space
> in openned log.
> 2. account F2FS_DIRTY_NODES, F2FS_DIRTY_IMETA and F2FS_DIRTY_DENTS
> as node block consumer;
> 3. account F2FS_DIRTY_DENTS as data block consumer;
> 
> Cc: stable@vger.kernel.org
> Reported-by: Ming Yan <yanming@tju.edu.cn>
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
>  fs/f2fs/segment.h | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 8a591455d796..28f7aa9b40bf 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -575,11 +575,10 @@ static inline int reserved_sections(struct f2fs_sb_info *sbi)
>  	return GET_SEC_FROM_SEG(sbi, reserved_segments(sbi));
>  }
>  
> -static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
> +static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
> +			unsigned int node_blocks, unsigned int dent_blocks)
>  {
> -	unsigned int node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
> -					get_pages(sbi, F2FS_DIRTY_DENTS);
> -	unsigned int dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
> +
>  	unsigned int segno, left_blocks;
>  	int i;
>  
> @@ -605,19 +604,24 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
>  static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>  					int freed, int needed)
>  {
> -	int node_secs = get_blocktype_secs(sbi, F2FS_DIRTY_NODES);
> -	int dent_secs = get_blocktype_secs(sbi, F2FS_DIRTY_DENTS);
> -	int imeta_secs = get_blocktype_secs(sbi, F2FS_DIRTY_IMETA);
> +	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
> +					get_pages(sbi, F2FS_DIRTY_DENTS) +
> +					get_pages(sbi, F2FS_DIRTY_IMETA);
> +	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
> +	unsigned int node_secs = total_node_blocks / BLKS_PER_SEC(sbi);
> +	unsigned int dent_secs = total_dent_blocks / BLKS_PER_SEC(sbi);
> +	unsigned int node_blocks = total_node_blocks % BLKS_PER_SEC(sbi);
> +	unsigned int dent_blocks = total_dent_blocks % BLKS_PER_SEC(sbi);
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  		return false;
>  
> -	if (free_sections(sbi) + freed == reserved_sections(sbi) + needed &&
> -			has_curseg_enough_space(sbi))
> -		return false;
> -	return (free_sections(sbi) + freed) <=
> -		(node_secs + 2 * dent_secs + imeta_secs +
> -		reserved_sections(sbi) + needed);
> +	if (free_sections(sbi) + freed <=
> +			node_secs + dent_secs + reserved_sections(sbi) + needed)
> +		return true;
> +	if (!has_curseg_enough_space(sbi, node_blocks, dent_blocks))
> +		return true;
> +	return false;
>  }
>  
>  static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
