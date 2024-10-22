Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7319A966F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 04:53:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t351V-0003NB-E8;
	Tue, 22 Oct 2024 02:53:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t351T-0003My-U8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 02:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=poJS1GHBmNOOBqSc1Zrc44TLg2eb0Vn2chSrvUtsfVk=; b=mvpzd3cZFI+WibYTicYhsoUEJ9
 CCmNqQjYuCfp+nxXbmoY89Y42eH7HOx3q6iAq06mpGkPfFgn3IELnxx8cVbnkiwH+45fhdAH6VUzy
 2oLNfy5mXFnoj1wmLScLE7hfEU4l1PzokmbGuJ7Q5xypww1Xr5aiLM/jUh47qk9iCUP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=poJS1GHBmNOOBqSc1Zrc44TLg2eb0Vn2chSrvUtsfVk=; b=BhrbLQ08x16TmwhEm7GbcbZdCZ
 i3qE6erBufXhFQG9kg7bFO1DEv1Ct01KS77Ps2WE/UfJdTWPQxQy2s8GIqPCDo2rqWqw4TjUhO5BS
 3cMCI/XzlxBrf4Bx4465JiDfAiAOO5WXpAhksmU8uaqy7avmV19XONKiJuPhDhTQ2BCU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t351T-00084r-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 02:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 063A1A429BA;
 Tue, 22 Oct 2024 02:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B26C4CEC3;
 Tue, 22 Oct 2024 02:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729565596;
 bh=sNTXpWjfoKvwLxtmQeFQxt8wmx98bEnvCNRQlkYhr7M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=p2rfxzi4qTw+Pxla/E70st1xsXxeytMvQwgbOf9JyPSP/rlz3z/RJxiJ9WUEWZlsc
 gAbYc/tICz8A+3CEmhivclaIzR43Y73xFTWtrlwWE2UPPkGej1AIw8rZIcyjAmZGPp
 VEl+MMeHArPR5cFyfJ43z3G4rmpBUSa2n7hscGBHSFL7tqbanhQvrTYN8rgimP1xsV
 Hrrc4zYSfZc/qkkP8gdKUwg25KFJibAyJlk07YMzRXa4f8E2nEph7R4Fq2Ak5qPvAr
 GsniNGY0k4xXbDvqmeRQiwmnOnD8/00zX9dy/9n+GbbyzvELnqeT2qivxlJ2NiwI4k
 RWmz0FwMS0p0Q==
Message-ID: <3fdd8fdd-8b80-4989-8cfd-78051bd85936@kernel.org>
Date: Tue, 22 Oct 2024 10:53:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20241009102745.1390935-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20241009102745.1390935-1-hanqi@vivo.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/9 18:27, Qi Han wrote: > When the free segment
 is used up during CP disable, many write or > ioctl operations will get ENOSPC
 error codes, even if there are > still many blocks available. W [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t351T-00084r-Rj
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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

On 2024/10/9 18:27, Qi Han wrote:
> When the free segment is used up during CP disable, many write or
> ioctl operations will get ENOSPC error codes, even if there are
> still many blocks available. We can reproduce it in the following
> steps:
> 
> dd if=/dev/zero of=f2fs.img bs=1M count=55
> mkfs.f2fs -f f2fs.img
> mount f2fs.img f2fs_dir -o checkpoint=disable:10%
> cd f2fs_dir
> dd if=/dev/zero of=bigfile bs=1M count=50
> sync
> rm bigfile
> i=1; while [[ $i -lt 10000000 ]]; do (file_name=./file$i; dd \
> if=/dev/random of=$file_name bs=1M count=0); i=$((i+1)); done
> stat -f ./
> 
> In f2fs_need_SSR() function, it is allowed to use SSR to allocate
> blocks when CP is disabled, so in f2fs_is_checkpoint_ready function,
> can we judge the number of invalid blocks when free segment is not
> enough, and return ENOSPC only if the number of invalid blocks is
> also not enough?
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>
> ---
>   fs/f2fs/segment.h | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 71adb4a43bec..9bf0cf3a6a31 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -637,12 +637,33 @@ static inline bool has_enough_free_secs(struct f2fs_sb_info *sbi,
>   	return !has_not_enough_free_secs(sbi, freed, needed);
>   }
>   
> +static inline bool has_enough_available_blocks(struct f2fs_sb_info *sbi)
> +{
> +	unsigned int total_free_blocks = sbi->user_block_count -
> +					valid_user_blocks(sbi) -
> +					sbi->current_reserved_blocks;
> +
> +	if (total_free_blocks <= sbi->unusable_block_count)
> +		total_free_blocks = 0;
> +	else
> +		total_free_blocks -= sbi->unusable_block_count;
> +
> +	if (total_free_blocks > F2FS_OPTION(sbi).root_reserved_blocks)
> +		total_free_blocks -= F2FS_OPTION(sbi).root_reserved_blocks;
> +	else
> +		total_free_blocks = 0;
> +
> +	return (total_free_blocks > 0) ? true : false;

Can you please reuse get_available_block_count() as much as possible?
and cover it w/ stat_lock?

Thanks,

> +}
> +
>   static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
>   {
>   	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>   		return true;
>   	if (likely(has_enough_free_secs(sbi, 0, 0)))
>   		return true;
> +	if (likely(has_enough_available_blocks(sbi)))
> +		return true;
>   	return false;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
