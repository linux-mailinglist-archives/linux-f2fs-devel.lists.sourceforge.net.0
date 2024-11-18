Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC69D09D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 07:50:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tCvai-0006gG-Or;
	Mon, 18 Nov 2024 06:50:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tCvah-0006g8-SP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 06:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d5a4mynclkPSpBTeDN8RH3L/JnIj2rpXTcwO4+nrG7A=; b=a6iYDktyOziTT9VUp4vFIb0uru
 4+m22X9NRHjj5ACHx17XjYBksSrbcnixXjpMG8/shW6/9ovDa1SHvs5+7e8GNAV94qaSH1QxlHuHu
 szhJ+P9ULRh5GDyN7gzdlZG0Ej3pGf316G/9mQ0qb0VZ8vd8y1d9UePTq/KQlcUpgTbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d5a4mynclkPSpBTeDN8RH3L/JnIj2rpXTcwO4+nrG7A=; b=ITY6TS/iwoK0YPSwYdxdwVMAqs
 Odu1p61yhDmv3XZ3j/b6AplA+WldYth5BvJY8RCgIvkq1I+B0xRKtK6MqzZp1SB8zbb2pm7N378Co
 pSIVPrp42YGGtb/1jtIGWg1hb48+CnSDg2VhrmknYbxhNTqmrkKXry339blDv5g3tQEE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tCvah-0005oa-0g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 06:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B250EA416B3;
 Mon, 18 Nov 2024 06:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D52C4CECF;
 Mon, 18 Nov 2024 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731912620;
 bh=IVwXcCSE2hcVKxdz54VNN72fzQvGiz/2g22lE5lSgIs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PF/5EPrKeWQpOcWFSFFbABVKWF9k3ksPB/CSkzjBzp20QjwNyWID88E1OProgMntx
 s+uOwdUD3Wd7WG1fZzFUvz0yHlZX/d6I+K35ldJMUWAC5/4knLNx7To9yL4yeSYl7e
 JfCDq3GEr33D0Txi5EZW8S6ZazzEoKSdNguj5wlK3hNWM94V7EvthiWVkZt5Z3toVj
 y1jhX1cyVNUysQxOEA8y5O4e4jfG8u7QKKE4KftCF3RNWw0HGvxGde8jzhJRwis6Cr
 WYlPBqX1aDnV8yWie7bVDJGVDN3wLTSsLHVI3dbZtdJrYuWM6N4PhxCjfI0Eea2Ilh
 +fw5222iDpvhA==
Message-ID: <c1e90e9a-3b93-4caa-b28b-83a3380c8865@kernel.org>
Date: Mon, 18 Nov 2024 14:50:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20241111085058.4136077-1-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20241111085058.4136077-1-shengyong@oppo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/11 16:50, Sheng Yong wrote: > Fsync data recovery
 attempts to check and fix write pointer consistency > of cursegs and all
 other zones. If the write pointers of cursegs are > unaligned, cur [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tCvah-0005oa-0g
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix changing cursegs if recovery
 fails on zoned device
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

On 2024/11/11 16:50, Sheng Yong wrote:
> Fsync data recovery attempts to check and fix write pointer consistency
> of cursegs and all other zones. If the write pointers of cursegs are
> unaligned, cursegs are changed to new sections.
> 
> If recovery fails, zone write pointers are still checked and fixed,
> but the latest checkpoint cannot be written back. Additionally, retry-
> mount skips recovery and rolls back to reuse the old cursegs whose
> zones are already finished. This can lead to unaligned write later.
> 
> This patch addresses the issue by leaving writer pointers untouched if
> recovery fails. When retry-mount is performed, cursegs and other zones
> are checked and fixed after skipping recovery.
> 
> Signed-off-by: Song Feng <songfeng@oppo.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fs/f2fs/recovery.c |  2 +-
>   fs/f2fs/super.c    | 11 ++++++++---
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index e4d81b8705d1..324f948247ae 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -899,7 +899,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>   	 * and the f2fs is not read only, check and fix zoned block devices'
>   	 * write pointer consistency.
>   	 */
> -	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sbi->sb)) {
> +	if (!err && f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sbi->sb)) {
>   		int err2 = f2fs_fix_curseg_write_pointer(sbi);
>   
>   		if (!err2)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 87ab5696bd48..42224c71ae20 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4738,13 +4738,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   reset_checkpoint:
>   	/*
>   	 * If the f2fs is not readonly and fsync data recovery succeeds,
> -	 * check zoned block devices' write pointer consistency.
> +	 * write pointer consistency of cursegs and other zones are already
> +	 * checked and fixed during recovery. However, if recovery fails,
> +	 * write pointers are left untouched, and retry-mount should check
> +	 * them here.
>   	 */
> -	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sb)) {
> +	if (skip_recovery && f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sb)) {
>   		int err2;
>   
>   		f2fs_notice(sbi, "Checking entire write pointers");
> -		err2 = f2fs_check_write_pointer(sbi);
> +		err2 = f2fs_fix_curseg_write_pointer(sbi);
> +		if (!err2)
> +			err2 = f2fs_check_write_pointer(sbi);
>   		if (err2)
>   			err = err2;

What about wrapping above logic into f2fs_fix_and_check_write_pointer() and reuse in
f2fs_fill_super() and f2fs_recover_fsync_data()?

int f2fs_fix_and_check_write_pointer()
{
	int err;

	if (!f2fs_sb_has_blkzoned(sbi) || f2fs_readonly(sbi->sb))
		return 0;

	err = f2fs_fix_curseg_write_pointer(sbi);
	if (!err)
		err = f2fs_check_write_pointer(sbi);

	return err;
}

Thanks,

>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
