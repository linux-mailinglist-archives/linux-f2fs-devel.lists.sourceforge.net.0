Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FEF859ED6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 09:53:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbzOl-00032H-92;
	Mon, 19 Feb 2024 08:53:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rbzOX-000319-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 08:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U4g/yKPHywO0Rfh8Id3c8waWD7jjY125zNMhUcZt1No=; b=f1kCHjg0Sm9Y+Hyqt5ExEmk+5K
 0pFmRNENtrh/X1lTR26uICQ+R6Y6tYOFYtQMpGjYZ4RuKcwrCbDcVnyL73Tc3TXp1XEOuUhhuj/7t
 kIcHbHh1YJhQ0aFQbTqUXiDI+ynCsw9d5ir0775YG6HuQrD7LcUMhX7avuEkd9+EaymA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U4g/yKPHywO0Rfh8Id3c8waWD7jjY125zNMhUcZt1No=; b=DRI+GGb2TQh7oANwZgfelvfUPg
 yY2vbxuSC4vBNjqipJopGeKH4lIplQY720+XnEqtxQwDZm7ngBKnlnD3vUpIrHpzFDdcm0pbGmE3m
 WKYknmXB9Qock6ixA9zUuzLQgyFiZZyY50y9BObb0WbmuRfo9QRjX4TgO5GICcOBY8es=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbzOW-0005PV-1E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 08:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F395660B71
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Feb 2024 08:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA862C433F1;
 Mon, 19 Feb 2024 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708332770;
 bh=A8qPA802yUnOnRI0lcZYzdQTNt8OqoBRlHRFZy/PbDs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R1yW0m0+Q9dkYPoVMEPpHO8HDflDJh71kyB4NwNoI0ioNc0aHOuTDflQKXFUNyGTE
 IxdZHI86LyC2Cx0sWhNfLOJKSZxMCavnNCCnoPJhOFr+97RSoxF7zUkqWtB+KKJb4T
 onD/EiqoqrxIMQscCtPof4VcrYPAW+m7VMLERe1mICW79Q3iqeBI2VbTGAhz3fFqUH
 dX5QS9Fc9nxUNEKi4ZkjOEX4bQoTeXAJnnnGDX28ijYPBoTff02QmDp0LsdJbH1aPA
 n/ZaZVas+kzIP83yYy0zB1pnhKp5t1B43GVo+54Jh37wvEk+OUATyNOxFmzZxtQi3B
 BfllvB1aweOHQ==
Message-ID: <60e2dbf9-1ced-40a8-ae17-5b156f0effb2@kernel.org>
Date: Mon, 19 Feb 2024 16:52:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20240124144342.14612-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240124144342.14612-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, Since there is conflict while applying to last dev-test,
 let me rebase the code in v2. On 2024/1/24 22:43, Chao Yu wrote: > There
 are very similar codes in inc_valid_block_count() and > inc_valid_node_count()
 which is used for available user block > count calculation. > > This patch
 int [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbzOW-0005PV-1E
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce get_available_block_count()
 for cleanup
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

Ping,

Since there is conflict while applying to last dev-test, let me
rebase the code in v2.

On 2024/1/24 22:43, Chao Yu wrote:
> There are very similar codes in inc_valid_block_count() and
> inc_valid_node_count() which is used for available user block
> count calculation.
> 
> This patch introduces a new helper get_available_block_count()
> to include those common codes, and used it to clean up codes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/f2fs.h | 61 +++++++++++++++++++++++++-------------------------
>   1 file changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5d19643a92af..0094a8c85f4a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2253,6 +2253,31 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
>   	return false;
>   }
>   
> +static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
> +						struct inode *inode, bool cap)
> +{
> +	block_t avail_user_block_count;
> +
> +	avail_user_block_count = sbi->user_block_count -
> +					sbi->current_reserved_blocks;
> +
> +	if (!__allow_reserved_blocks(sbi, inode, cap))
> +		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> +
> +	if (F2FS_IO_ALIGNED(sbi))
> +		avail_user_block_count -= sbi->blocks_per_seg *
> +				SM_I(sbi)->additional_reserved_segments;
> +
> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +		if (avail_user_block_count > sbi->unusable_block_count)
> +			avail_user_block_count -= sbi->unusable_block_count;
> +		else
> +			avail_user_block_count = 0;
> +	}
> +
> +	return avail_user_block_count;
> +}
> +
>   static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
>   static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>   				 struct inode *inode, blkcnt_t *count, bool partial)
> @@ -2278,22 +2303,8 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>   
>   	spin_lock(&sbi->stat_lock);
>   	sbi->total_valid_block_count += (block_t)(*count);
> -	avail_user_block_count = sbi->user_block_count -
> -					sbi->current_reserved_blocks;
> -
> -	if (!__allow_reserved_blocks(sbi, inode, true))
> -		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> +	avail_user_block_count = get_available_block_count(sbi, inode, true);
>   
> -	if (F2FS_IO_ALIGNED(sbi))
> -		avail_user_block_count -= sbi->blocks_per_seg *
> -				SM_I(sbi)->additional_reserved_segments;
> -
> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> -		if (avail_user_block_count > sbi->unusable_block_count)
> -			avail_user_block_count -= sbi->unusable_block_count;
> -		else
> -			avail_user_block_count = 0;
> -	}
>   	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
>   		if (!partial) {
>   			spin_unlock(&sbi->stat_lock);
> @@ -2609,7 +2620,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>   					struct inode *inode, bool is_inode)
>   {
>   	block_t	valid_block_count;
> -	unsigned int valid_node_count, user_block_count;
> +	unsigned int valid_node_count;
> +	unsigned int avail_user_block_count;
>   	int err;
>   
>   	if (is_inode) {
> @@ -2629,21 +2641,10 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>   
>   	spin_lock(&sbi->stat_lock);
>   
> -	valid_block_count = sbi->total_valid_block_count +
> -					sbi->current_reserved_blocks + 1;
> -
> -	if (!__allow_reserved_blocks(sbi, inode, false))
> -		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
> -
> -	if (F2FS_IO_ALIGNED(sbi))
> -		valid_block_count += sbi->blocks_per_seg *
> -				SM_I(sbi)->additional_reserved_segments;
> -
> -	user_block_count = sbi->user_block_count;
> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> -		user_block_count -= sbi->unusable_block_count;
> +	valid_block_count = sbi->total_valid_block_count + 1;
> +	avail_user_block_count = get_available_block_count(sbi, inode, false);
>   
> -	if (unlikely(valid_block_count > user_block_count)) {
> +	if (unlikely(valid_block_count > avail_user_block_count)) {
>   		spin_unlock(&sbi->stat_lock);
>   		goto enospc;
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
