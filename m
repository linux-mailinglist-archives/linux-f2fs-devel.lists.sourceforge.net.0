Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78C9ABB25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 03:50:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3QW7-0003LW-3e;
	Wed, 23 Oct 2024 01:50:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3QW5-0003LP-Dw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 01:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y2bS0e7MGOkF3bSnFhLE0NevizDTgI9kOtZwTxjEnHg=; b=Z/wwTJy5hfVI6ZDNb8r9S1n8ye
 b8G4/Gen+FAzyWnwXnJlFWkQEfTYfzw2E5hWs6TgzxnN+TACAsSPcptUHfPW3S+V6cyy+6M1TlQjv
 cH8s1yZSfsH0GbtponSniSzTvX6xiikt5ghNY0zFRxbacrukKAcjoD/zXWIv7GSBifas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y2bS0e7MGOkF3bSnFhLE0NevizDTgI9kOtZwTxjEnHg=; b=diIKCOHaadXGOJZxAb4wrQDjBJ
 A3MtpwXiCyn1QDdwjMuwblL8W+MhaAiMSsMi3YkRbDeZlH1OA9FprjAGXjW0hQKvjOR/ouM+r5wFu
 XsXWGf8jRaPYOb0cw58UoyAf/Zlg2mgMzeRWDz5+jy2KMf4RVETXIxKaViz04uWPqUnE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3QW4-00017e-JY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 01:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B338DA4487B;
 Wed, 23 Oct 2024 01:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB6BC4CEC3;
 Wed, 23 Oct 2024 01:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729648217;
 bh=fuIHtiUsA+MbgN9XYHvhFtdP/SML3ljCvOyUzUZ4WFg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=KicYyBG9ekvv+qo87BnfJFJOQio1HD0iqzYU4dDgc2+In5PaQDsiHnB4hfXAH44h/
 dUWDLrLiQFErw+ufvqQMDTweJ6Eb7sXGFN2kT3MPd/Bj0FJF/SaBlAVe7rMJjfS5+s
 jC5DnQX4xLIVuAqi8IDUWRq6oV72Dzxu1LQ2uyIhjov3+Z0iczSBJEzn1DvLYv9yJn
 uIN0kz5sU/UHw9yW8Dq1gU8WX3GDdkahUAYiRXNNHyvRsP93+sn9Hgnx4dXmAP382v
 /c/WYuxSW99RFKxpGBX3KCbwU0qYNtTBTrp2MwK32qGw3uiiKw2p1bEK/sUkd50SUo
 mHfQskTq4rSkw==
Message-ID: <88cc50d5-b793-4faa-b29e-b9cf291dadde@kernel.org>
Date: Wed, 23 Oct 2024 09:50:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20241022091525.1808542-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20241022091525.1808542-1-hanqi@vivo.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/22 17:15, Qi Han wrote: > When the free segment
 is used up during CP disable, many write or > ioctl operations will get ENOSPC
 error codes, even if there are > still many blocks available. [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3QW4-00017e-JY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: modify f2fs_is_checkpoint_ready
 logic to allow more data to be written with the CP disable
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

On 2024/10/22 17:15, Qi Han wrote:
> When the free segment is used up during CP disable, many write or
> ioctl operations will get ENOSPC error codes, even if there are
> still many blocks available. We can reproduce it in the following
> steps:
> 
> dd if=/dev/zero of=f2fs.img bs=1M count=65
> mkfs.f2fs -f f2fs.img
> mount f2fs.img f2fs_dir -o checkpoint=disable:10%
> cd f2fs_dir
> i=1 ; while [[ $i -lt 50 ]] ; do (file_name=./2M_file$i ; dd \
> if=/dev/random of=$file_name bs=1M count=2); i=$((i+1)); done
> sync
> i=1 ; while [[ $i -lt 50 ]] ; do (file_name=./2M_file$i ; truncate \
> -s 1K $file_name); i=$((i+1)); done
> sync
> i=1; while [[ $i -lt 10000000 ]]; do (file_name=./file$i; dd \
> if=/dev/random of=$file_name bs=1M count=0); i=$((i+1)); done

'dd if=/dev/zero of=./file bs=1M count=20' will be more quick to
trigger SSR allocation.

> 
> In f2fs_need_SSR() function, it is allowed to use SSR to allocate
> blocks when CP is disabled, so in f2fs_is_checkpoint_ready function,
> can we judge the number of invalid blocks when free segment is not
> enough, and return ENOSPC only if the number of invalid blocks is
> also not enough?
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>
> ---
>   fs/f2fs/segment.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 71adb4a43bec..b7af84a07435 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -637,12 +637,31 @@ static inline bool has_enough_free_secs(struct f2fs_sb_info *sbi,
>   	return !has_not_enough_free_secs(sbi, freed, needed);
>   }
>   
> +static inline bool has_enough_free_blks(struct f2fs_sb_info *sbi)
> +{
> +	long long total_free_blocks = 0;
> +	block_t avail_user_block_count;

long long avail_user_block_count;

> +	block_t valid_block_count;
> +
> +	spin_lock(&sbi->stat_lock);
> +
> +	avail_user_block_count = get_available_block_count(sbi, NULL, true);
> +	valid_block_count = valid_user_blocks(sbi);
> +	total_free_blocks = avail_user_block_count - valid_block_count;

total_free_blocks =
	avail_user_block_count - (long long)valid_user_blocks(sbi);

Then, we can avoid allocating & assigning valid_block_count variable.

> +
> +	spin_unlock(&sbi->stat_lock);
> +
> +	return (total_free_blocks > 0) ? true : false;

return total_free_blocks > 0;

Thanks,

> +}
> +
>   static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
>   {
>   	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>   		return true;
>   	if (likely(has_enough_free_secs(sbi, 0, 0)))
>   		return true;
> +	if (likely(has_enough_free_blks(sbi)))
> +		return true;
>   	return false;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
