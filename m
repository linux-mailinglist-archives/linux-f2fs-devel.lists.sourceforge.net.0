Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 927649A1F19
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Oct 2024 11:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1NDW-0000u5-DI;
	Thu, 17 Oct 2024 09:54:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t1NDU-0000tw-EX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 09:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wu4DgEMXYxw4dxNMosvQr0GJ91OUuCeOhv1QNFSispM=; b=j60J7udEPGssCrgDANByZbT/AL
 FFpf6lSai9ywJ9EoFfLvSoS0L8H2Vd+MOCPITYCZtEDUkf6Tp8jHLpMIQwh2k0kuHBsqhmN6asBq4
 k/G6OYMjjCzdaPDv7L/Fk5D72hn69tmOp43wcejb9wbxkQtWKN9JO52KU0bhljxGQsFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wu4DgEMXYxw4dxNMosvQr0GJ91OUuCeOhv1QNFSispM=; b=bclIC81hhFgHOzJtP0s2QnWGoC
 28xljDLIAitaIGVCvE8+49C4hDj729X2goi+TTtbdDJuN6tpg7VnFTstZRB2VBj+KNK7cARWFeHCW
 zpRJHw/T8DHUgOXoGsH7gWeVD3ginHcvMVHMCqdWqem7WUpeyhEyKifq7Lqu3mlRnlLQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1NDT-0002Zo-1o for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 09:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33A155C5C37;
 Thu, 17 Oct 2024 09:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E2DC4CEC3;
 Thu, 17 Oct 2024 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729158876;
 bh=CbWD0YTmgOCj8bDmWVAY5RoLXCa/dTfp/GhXgw7q7LA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SKNLR4e/PFr8aXXZpvI0dF9g7CdYU27JbgNbuWqf/IOqDeHWftHTpNMN9CkSS60r8
 mLQMdVVqQrrWE4cmCeliO59E64r/kt+VW6tZ80/dMwz4NhEvEY8grw34YmwNFRoxFU
 SMINof5a2+OByouiEzPlmq7CXFElqq24KwJQ6B+FQxpByxp+cy532Ls3A7TcrCkal1
 OSxC3xxxMZaz4xIkWANArwY6Gu6r4bpaO8pqYSqV3omQaGxPjOIQp9CGDNrzgSHFD7
 YCdS7KoNVKfM/QewzV0Ijbs+WkD0ZHF4zl4oJYkKfn+aZCVZxc7a3uiu24/VBu9ePV
 80nF9P7HvX3NA==
Message-ID: <bdd890de-4794-4133-bca1-9c7e067e6e5c@kernel.org>
Date: Thu, 17 Oct 2024 17:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20241009102745.1390935-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20241009102745.1390935-1-hanqi@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/9 18:27, Qi Han wrote: > When the free segment
 is used up during CP disable, many write or > ioctl operations will get ENOSPC
 error codes, even if there are > still many blocks available. W [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1NDT-0002Zo-1o
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

Can you please try below patch?

 From 38b7c97dcc55ba83de4220c3dc54c2eb66148dd5 Mon Sep 17 00:00:00 2001
From: Chao Yu <chao@kernel.org>
Date: Thu, 17 Oct 2024 17:07:05 +0800
Subject: [PATCH] f2fs: revalidate empty segment when checkpoint is disabled

If checkpoint is off, let's set segment as free once all newly
written datas were removed.

Signed-off-by: Chao Yu <chao@kernel.org>
---
  fs/f2fs/segment.c | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f8d6e601e084..9bad13d70afb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -853,6 +853,17 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
  	valid_blocks = get_valid_blocks(sbi, segno, false);
  	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno, false);

+	/*
+	 * If checkpoint is off, let's set segment as free once all newly
+	 * written datas were removed.
+	 */
+	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
+		valid_blocks == 0 && ckpt_valid_blocks == 0) {
+		__remove_dirty_segment(sbi, segno, DIRTY);
+		__set_test_and_free(sbi, segno, false);
+		goto out_lock;
+	}
+
  	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
  		ckpt_valid_blocks == usable_blocks)) {
  		__locate_dirty_segment(sbi, segno, PRE);
@@ -863,7 +874,7 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
  		/* Recovery routine with SSR needs this */
  		__remove_dirty_segment(sbi, segno, DIRTY);
  	}
-
+out_lock:
  	mutex_unlock(&dirty_i->seglist_lock);
  }

-- 
2.40.1

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
