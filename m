Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571D996113
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Oct 2024 09:40:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syRIl-0001wE-IO;
	Wed, 09 Oct 2024 07:40:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1syRIk-0001w7-Dk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Oct 2024 07:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQyVxWxiW8CoQlzTRipl8NMWHJ/XEy3ZT1UAyWWLrW8=; b=F2WPRGa327Undg077HB5747vjN
 3/OFJ2YxRKqXJzvLW80B3U+GTmmBmIEETAeu0qB2RuDbRpn/5owGoR45R+l7tOEmzLyEk7zaP8b1U
 3jKQwmoTPPAYe/bN8OdzbSp5IHPpZnsaEQEO++OBKzZCIKcNnt96HYihBcfQKWjVdi+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQyVxWxiW8CoQlzTRipl8NMWHJ/XEy3ZT1UAyWWLrW8=; b=aEoBfYTJWtFhlemK8/JlK5fyNG
 Gl0PBg4pgbSuSCHA4weiaU6S30cif5yfG00M93SvQOAXsbAk0DIh33dSTuIaQR/kqs/JclIahkjjB
 HjjUaU4UCCjSUyhwQrfdWIRVHHvLSKMakardGe2y66p7FlO3cKNQI5IZTXiAO+BQkcxY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1syRIk-0005A8-2i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Oct 2024 07:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A75AA41672;
 Wed,  9 Oct 2024 07:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E928C4CECE;
 Wed,  9 Oct 2024 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728459594;
 bh=dnzlc1VWzpkmxxhS5ccO7X0laqxK6Ptv5GnMR37hZhQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Ukj7pfxl6BPr6vxUtr/OrU0Gp1B/0rQZWFO1jpzQweP/mFsD+fODF/pO6soIHpomX
 PdSHO6OVu4XVUT66SGwv5LEG+wq6jAQgYLvAqMa+nfaUpZRyuX9ULRPueVrsH7YEtC
 Z6i9lJZ9m+EiR0hB2rNysdrz2JP5yk8qk6pVSBgmJLB2EluFKZnM+mz0yjWvd8vz2/
 eJ6GZ01KBsfEAW43ZBro7MhfL2AJYOmtbitLo9Vn3HGIcEvQada1bvjFgRqdKm8o/m
 nZTUJcu7A1JT08NEq2ICJPHc0nlkuhHkaQKoTI6b2ZlKlOfRdy9wa8EYYklmFg9uGD
 sB3nZT1E/zZAw==
Message-ID: <bcaef79d-29f9-47fa-9f92-64e665e95fa2@kernel.org>
Date: Wed, 9 Oct 2024 15:39:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240924095636.19457-1-liaoyuanhong@vivo.com>
Content-Language: en-US
In-Reply-To: <20240924095636.19457-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/24 17:56, Liao Yuanhong wrote: > The f2fs-tools
 support manual configuration of rsvd and ovp rate. In cases > where only a
 small rsvd is set, the automatically calculated ovp rate can > be v [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1syRIk-0005A8-2i
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools:provide a more reasonable ovp
 rate for manually setting rsvd
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

On 2024/9/24 17:56, Liao Yuanhong wrote:
> The f2fs-tools support manual configuration of rsvd and ovp rate. In cases
> where only a small rsvd is set, the automatically calculated ovp rate can
> be very large, resulting in the reserved space of the entire file system
> being almost the same as before, failing to achieve the goal of reducing
> space usage. Therefore, for cases where only rsvd is set and ovp rate is
> not, we will provide the same ovp rate as in normal situations, which
> exceeds overprovision_segment_buffer, and does not occupy additional space.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   fsck/resize.c      |  2 +-
>   include/f2fs_fs.h  |  8 ++++----
>   mkfs/f2fs_format.c | 15 ++++++++++++---
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/fsck/resize.c b/fsck/resize.c
> index 049ddd3..eca6555 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -147,7 +147,7 @@ safe_resize:
>   
>   	/* Let's determine the best reserved and overprovisioned space */
>   	if (c.new_overprovision == 0)
> -		c.new_overprovision = get_best_overprovision(sb);
> +		c.new_overprovision = get_best_overprovision(sb, true);
>   
>   	c.new_reserved_segments =
>   		(100 / c.new_overprovision + 1 + NR_CURSEG_TYPE) *
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 870a6e4..038002a 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1760,13 +1760,13 @@ extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
>   #define ZONE_ALIGN(blks)	SIZE_ALIGN(blks, c.blks_per_seg * \
>   					c.segs_per_zone)
>   
> -static inline uint32_t get_reserved(struct f2fs_super_block *sb, double ovp)
> +static inline uint32_t get_reserved(struct f2fs_super_block *sb, double ovp, bool conf_reserved)
>   {
>   	uint32_t usable_main_segs = f2fs_get_usable_segments(sb);
>   	uint32_t segs_per_sec = round_up(usable_main_segs, get_sb(section_count));
>   	uint32_t reserved;
>   
> -	if (c.conf_reserved_sections)
> +	if (c.conf_reserved_sections && conf_reserved)
>   		reserved = c.conf_reserved_sections * segs_per_sec;
>   	else
>   		reserved = (100 / ovp + 1 + NR_CURSEG_TYPE) * segs_per_sec;
> @@ -1781,7 +1781,7 @@ static inline uint32_t overprovision_segment_buffer(struct f2fs_super_block *sb)
>   	return 6 * get_sb(segs_per_sec);
>   }
>   
> -static inline double get_best_overprovision(struct f2fs_super_block *sb)
> +static inline double get_best_overprovision(struct f2fs_super_block *sb, bool conf_reserved)
>   {
>   	double ovp, candidate, end, diff, space;
>   	double max_ovp = 0, max_space = 0;
> @@ -1799,7 +1799,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
>   	}
>   
>   	for (; candidate <= end; candidate += diff) {
> -		reserved = get_reserved(sb, candidate);
> +		reserved = get_reserved(sb, candidate, conf_reserved);
>   		ovp = (usable_main_segs - reserved) * candidate / 100;
>   		if (ovp < 0)
>   			continue;
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index e26a513..9c917c9 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -480,10 +480,19 @@ static int f2fs_prepare_super_block(void)
>   	 * overprovision ratio and reserved seg count based on avg usable
>   	 * segs_per_sec.
>   	 */
> -	if (c.overprovision == 0)
> -		c.overprovision = get_best_overprovision(sb);
> +	if (c.overprovision == 0) {
>   
> -	c.reserved_segments = get_reserved(sb, c.overprovision);
> +		/*
> +		 * If rsvd is manually set but ovp rate is not,
> +		 * provide the same ovp rate as in normal allocation.
> +		 */
> +		if (c.conf_reserved_sections)
> +			c.overprovision = get_best_overprovision(sb, false);
> +		else
> +			c.overprovision = get_best_overprovision(sb, true);

get_best_overprovision() can provide a pair value [ovp, reserved], which can
maximize available space for user. If we just pick one of them, and use configured
one instead of another of them, it's weird.

For your case, maybe we can introduce a default ovp value, and use it w/ configured
reserved value? or you can assign ovp/reserved secs directly by using -o and -Z?

Thanks,

> +	}
> +
> +	c.reserved_segments = get_reserved(sb, c.overprovision, true);
>   
>   	if (c.feature & F2FS_FEATURE_RO) {
>   		c.overprovision = 0;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
