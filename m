Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597354C2F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 09:54:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1NrI-0001Wx-4h; Wed, 15 Jun 2022 07:54:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o1NrH-0001Wr-4S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 07:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XUU68WGHctEiHauMlX5uNSU/+0zXxxZsW1BzgXXEfxY=; b=YrAUlClxUfT4VdrnDRGaDORSwa
 ChrWa8lHTFjGSPFYR6+FrLvK1K4dGP1q3yv9PJ/7g2B27fhL0fIYzKkqjGH2butd+nfxx3thAkJqG
 KW874Hg1aO5CFkR0bMlfYCaDV/mRPNfeQa95FioCfFX5REN5RznA2ycKDgKLzKgVq2mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XUU68WGHctEiHauMlX5uNSU/+0zXxxZsW1BzgXXEfxY=; b=Mjk+dHN5kSYWWD8mjuPAOLMtRo
 3xJWRCMCHPcZotTkWhlRAsBBpIqXGRuQFZJQDqEgeIQzIesQxTk3y0gJZS2QAIsoY2ODThCBrZNmL
 uM2OQCBbSY8EdsWQqC0hcWjbB9GJLTCe23m33WXDyFLJ8Y2+Ehd/EovhG+MyGT4b+SD8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1NrD-0004MR-O3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 07:54:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 979C761920;
 Wed, 15 Jun 2022 07:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AB9C3411C;
 Wed, 15 Jun 2022 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655279667;
 bh=O27LTX42zGjhpVAJo5AIuYKbxsnXBd8hXyMw7Ghakc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gEvXaRNDwAUoA5SimDag+4176A6CI6nTUpdeN3jUHgwB6QUF4ogiQYPwzuFlUDq5q
 sUinHYkmFPHGpPjOmyl01Sfy0j3yE0LLEKwYU0Y8UF/9ebHv/lz/vZu5N+kVauu0w3
 3TzzqWEwlsyzHByydF/NOY8uMyvR95BLCeHNvF7/td29NRlNSJW76vldqSM/qwfgm8
 Dhgup808dXTJrJK4R//VIoifHgxoz3ggithpVT1Ral1cziw39Dbnz7ltD31xIzIJdk
 TNRtivl+L4qIPsJZC7sgl6aZdUBZs9x9vLeDhI9QwzjLsdQhaEI4R8FucJp7wghQLX
 GCj3CPXfxdjDg==
Message-ID: <1815f3c2-0802-5b3f-7e98-9f89c5b9e07d@kernel.org>
Date: Wed, 15 Jun 2022 15:54:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20220610183240.2269085-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220610183240.2269085-1-daeho43@gmail.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/11 2:32, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Made iostat related locks safe to be called from
 irq context again. > Will be better to add a 'Fixes' line? Thanks, 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1NrD-0004MR-O3
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat related lock protection
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

On 2022/6/11 2:32, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Made iostat related locks safe to be called from irq context again.
> 

Will be better to add a 'Fixes' line?

Thanks,

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/iostat.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> index be599f31d3c4..d84c5f6cc09d 100644
> --- a/fs/f2fs/iostat.c
> +++ b/fs/f2fs/iostat.c
> @@ -91,8 +91,9 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>   	unsigned int cnt;
>   	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
>   	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
> +	unsigned long flags;
>   
> -	spin_lock_bh(&sbi->iostat_lat_lock);
> +	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
>   	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
>   		for (io = 0; io < NR_PAGE_TYPE; io++) {
>   			cnt = io_lat->bio_cnt[idx][io];
> @@ -106,7 +107,7 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>   			io_lat->bio_cnt[idx][io] = 0;
>   		}
>   	}
> -	spin_unlock_bh(&sbi->iostat_lat_lock);
> +	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
>   
>   	trace_f2fs_iostat_latency(sbi, iostat_lat);
>   }
> @@ -115,14 +116,15 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>   {
>   	unsigned long long iostat_diff[NR_IO_TYPE];
>   	int i;
> +	unsigned long flags;
>   
>   	if (time_is_after_jiffies(sbi->iostat_next_period))
>   		return;
>   
>   	/* Need double check under the lock */
> -	spin_lock_bh(&sbi->iostat_lock);
> +	spin_lock_irqsave(&sbi->iostat_lock, flags);
>   	if (time_is_after_jiffies(sbi->iostat_next_period)) {
> -		spin_unlock_bh(&sbi->iostat_lock);
> +		spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>   		return;
>   	}
>   	sbi->iostat_next_period = jiffies +
> @@ -133,7 +135,7 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>   				sbi->prev_rw_iostat[i];
>   		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
>   	}
> -	spin_unlock_bh(&sbi->iostat_lock);
> +	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>   
>   	trace_f2fs_iostat(sbi, iostat_diff);
>   
> @@ -145,25 +147,27 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>   	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>   	int i;
>   
> -	spin_lock_bh(&sbi->iostat_lock);
> +	spin_lock_irq(&sbi->iostat_lock);
>   	for (i = 0; i < NR_IO_TYPE; i++) {
>   		sbi->rw_iostat[i] = 0;
>   		sbi->prev_rw_iostat[i] = 0;
>   	}
> -	spin_unlock_bh(&sbi->iostat_lock);
> +	spin_unlock_irq(&sbi->iostat_lock);
>   
> -	spin_lock_bh(&sbi->iostat_lat_lock);
> +	spin_lock_irq(&sbi->iostat_lat_lock);
>   	memset(io_lat, 0, sizeof(struct iostat_lat_info));
> -	spin_unlock_bh(&sbi->iostat_lat_lock);
> +	spin_unlock_irq(&sbi->iostat_lat_lock);
>   }
>   
>   void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>   			enum iostat_type type, unsigned long long io_bytes)
>   {
> +	unsigned long flags;
> +
>   	if (!sbi->iostat_enable)
>   		return;
>   
> -	spin_lock_bh(&sbi->iostat_lock);
> +	spin_lock_irqsave(&sbi->iostat_lock, flags);
>   	sbi->rw_iostat[type] += io_bytes;
>   
>   	if (type == APP_BUFFERED_IO || type == APP_DIRECT_IO)
> @@ -172,7 +176,7 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>   	if (type == APP_BUFFERED_READ_IO || type == APP_DIRECT_READ_IO)
>   		sbi->rw_iostat[APP_READ_IO] += io_bytes;
>   
> -	spin_unlock_bh(&sbi->iostat_lock);
> +	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>   
>   	f2fs_record_iostat(sbi);
>   }
> @@ -185,6 +189,7 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
>   	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
>   	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>   	int idx;
> +	unsigned long flags;
>   
>   	if (!sbi->iostat_enable)
>   		return;
> @@ -202,12 +207,12 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
>   			idx = WRITE_ASYNC_IO;
>   	}
>   
> -	spin_lock_bh(&sbi->iostat_lat_lock);
> +	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
>   	io_lat->sum_lat[idx][iotype] += ts_diff;
>   	io_lat->bio_cnt[idx][iotype]++;
>   	if (ts_diff > io_lat->peak_lat[idx][iotype])
>   		io_lat->peak_lat[idx][iotype] = ts_diff;
> -	spin_unlock_bh(&sbi->iostat_lat_lock);
> +	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
>   }
>   
>   void iostat_update_and_unbind_ctx(struct bio *bio, int rw)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
