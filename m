Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AA9F9BDA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 22:22:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOkS0-0007s2-2J;
	Fri, 20 Dec 2024 21:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tOkRy-0007rs-G6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 21:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QXllePN/dn6Qet7r3jW1f129xLhyt/FMm7S2iHhIlH8=; b=AyuczVz+a9dOwLFbLDlkmZRnUV
 1q1TKnlkCj4HliP4br84afw1K0o6chVsHu8xDkVAX28zoZQEAZbh/4dLjZrY08jUMYSJDIWSjxaKB
 AUlugUb15sxRUdfz8ZsJiK+Ap+bZ7dq1hfJmKIa4Y91hFQYrB8KfqfXoHCuyHoWDWjLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QXllePN/dn6Qet7r3jW1f129xLhyt/FMm7S2iHhIlH8=; b=Ldbe39wgVvLYg6TXhVnuhaBTu0
 /BpbYuSiFddT+bY9zcPqmnEDMUQYrrj3jLpo52nNHZFjfwVKaFx7pikZbjha/E92BaiNaexT8NMaY
 xk9cyVT/3/dKfdXW+2SHDozHJ/6dhWRBy6Gbifq3sTX5y+9AX7zIFDUEaK+dzMyXr7xk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOkRx-0000hU-5B for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 21:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D662C5C6A86;
 Fri, 20 Dec 2024 21:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13465C4CECD;
 Fri, 20 Dec 2024 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734729730;
 bh=LGgD27lhXi53yEACx74DJaWK5dxFAJH+qe2RZEy4PuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZ9U7b3IwwEdIhqSRazEeApVi6jmgt/YU4R5i985K+AixDM4Z3CWCuBLSzYcl+c0I
 ho+oOsn06CDesy1THHvOgQQhP27iDcLGDD0hPLx78Uszy4XASeeF7gIPdY39wXfk/F
 +kmNuP65YBq9JgZmP5WICYTRDoUgbGHweUD+iae19qsxsDvWycSg4CQNV2/+SLuali
 rlEbd4SqiT9n1Rfkdp0/bp87EnFzhVpr3guUcNhTELJwOQA9xlwWQjNRzK/Q8ZPGtB
 6b8TrY6NF8PJ3V9rrQ6CgtBna+d6NZM2jGjzaxeC8lDM5AlE/0yZHewoxwWJ5iGlXq
 tC3VbGqxJMESQ==
Date: Fri, 20 Dec 2024 21:22:08 +0000
To: Yi Sun <yi.sun@unisoc.com>
Message-ID: <Z2XgAMRm6uMAT2XM@google.com>
References: <20241104034545.497907-1-yi.sun@unisoc.com>
 <20241104034545.497907-4-yi.sun@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104034545.497907-4-yi.sun@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This makes the code being inconsistent. Can you refactor
 first
 and add the loop later separately? For example, 1) add two functions,
 update_sit_entry_for_alloc()
 and update_sit_entry_for_release() 2) add a loop in
 update_sit_entry_for_release()
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOkRx-0000hU-5B
Subject: Re: [f2fs-dev] [PATCH v3 3/5] f2fs: introduce
 update_sit_entry_for_release()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This makes the code being inconsistent. Can you refactor first and add the loop
later separately?

For example,
1) add two functions, update_sit_entry_for_alloc() and update_sit_entry_for_release()
2) add a loop in update_sit_entry_for_release()

Thanks,

On 11/04, Yi Sun wrote:
> This function can process some consecutive blocks at a time.
> 
> When using update_sit_entry() to release consecutive blocks,
> ensure that the consecutive blocks belong to the same segment.
> Because after update_sit_entry_for_realese(), @segno is still
> in use in update_sit_entry().
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>
> ---
>  fs/f2fs/segment.c | 103 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 68 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 5386ae18d808..843171ce414b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2424,6 +2424,70 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
>  		SIT_I(sbi)->max_mtime = ctime;
>  }
>  
> +/*
> + * NOTE: when updating multiple blocks at the same time, please ensure
> + * that the consecutive input blocks belong to the same segment.
> + */
> +
> +static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
> +				block_t blkaddr, unsigned int offset, int del)
> +{
> +	bool exist;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +	bool mir_exist;
> +#endif
> +	int i;
> +	int del_count = -del;
> +
> +	f2fs_bug_on(sbi, GET_SEGNO(sbi, blkaddr) != GET_SEGNO(sbi, blkaddr + del_count - 1));
> +
> +	for (i = 0; i < del_count; i++) {
> +		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
> +#ifdef CONFIG_F2FS_CHECK_FS
> +		mir_exist = f2fs_test_and_clear_bit(offset + i,
> +						se->cur_valid_map_mir);
> +		if (unlikely(exist != mir_exist)) {
> +			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
> +				 blkaddr + i, exist);
> +			f2fs_bug_on(sbi, 1);
> +		}
> +#endif
> +		if (unlikely(!exist)) {
> +			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u",
> +				 blkaddr + i);
> +			f2fs_bug_on(sbi, 1);
> +			se->valid_blocks++;
> +			del += 1;
> +		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +			/*
> +			 * If checkpoints are off, we must not reuse data that
> +			 * was used in the previous checkpoint. If it was used
> +			 * before, we must track that to know how much space we
> +			 * really have.
> +			 */
> +			if (f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
> +				spin_lock(&sbi->stat_lock);
> +				sbi->unusable_block_count++;
> +				spin_unlock(&sbi->stat_lock);
> +			}
> +		}
> +
> +		if (f2fs_block_unit_discard(sbi) &&
> +			f2fs_test_and_clear_bit(offset + i, se->discard_map))
> +			sbi->discard_blks++;
> +
> +		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
> +			se->ckpt_valid_blocks -= 1;
> +	}
> +
> +	return del;
> +}
> +
> +/*
> + * If releasing blocks, this function supports updating multiple consecutive blocks
> + * at one time, but please note that these consecutive blocks need to belong to the
> + * same segment.
> + */
>  static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  {
>  	struct seg_entry *se;
> @@ -2479,43 +2543,12 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
>  				se->ckpt_valid_blocks++;
>  		}
> -	} else {
> -		exist = f2fs_test_and_clear_bit(offset, se->cur_valid_map);
> -#ifdef CONFIG_F2FS_CHECK_FS
> -		mir_exist = f2fs_test_and_clear_bit(offset,
> -						se->cur_valid_map_mir);
> -		if (unlikely(exist != mir_exist)) {
> -			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
> -				 blkaddr, exist);
> -			f2fs_bug_on(sbi, 1);
> -		}
> -#endif
> -		if (unlikely(!exist)) {
> -			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u",
> -				 blkaddr);
> -			f2fs_bug_on(sbi, 1);
> -			se->valid_blocks++;
> -			del = 0;
> -		} else if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> -			/*
> -			 * If checkpoints are off, we must not reuse data that
> -			 * was used in the previous checkpoint. If it was used
> -			 * before, we must track that to know how much space we
> -			 * really have.
> -			 */
> -			if (f2fs_test_bit(offset, se->ckpt_valid_map)) {
> -				spin_lock(&sbi->stat_lock);
> -				sbi->unusable_block_count++;
> -				spin_unlock(&sbi->stat_lock);
> -			}
> -		}
>  
> -		if (f2fs_block_unit_discard(sbi) &&
> -			f2fs_test_and_clear_bit(offset, se->discard_map))
> -			sbi->discard_blks++;
> +		if (!f2fs_test_bit(offset, se->ckpt_valid_map))
> +			se->ckpt_valid_blocks += del;
> +	} else {
> +		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
>  	}
> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
> -		se->ckpt_valid_blocks += del;
>  
>  	__mark_sit_entry_dirty(sbi, segno);
>  
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
