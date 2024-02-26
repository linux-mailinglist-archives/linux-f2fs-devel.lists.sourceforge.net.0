Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD450866850
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 03:48:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reR2M-00029x-5v;
	Mon, 26 Feb 2024 02:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reR2L-00029r-20
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aavc5Go64T4ueDMoUUFRhsNpRWuJfJrhPTx9cEh4Ih8=; b=D1541AX6KD2m0/iNPxJy55Yrcf
 4EO+dSr5VyjR01jBZiGQDiuGCtr44AkcV19sYahuUc9We5SkH2Lg9eLRWD7Z8kJfLGPIe83u1trQ3
 TLUwA2kHrwKU9c9p7C868UbfebEdKhS/rXyhimtLfBUibJLo07HGskkx7Sjl7GzA8/+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aavc5Go64T4ueDMoUUFRhsNpRWuJfJrhPTx9cEh4Ih8=; b=W37LJqNljyvGeUyfa8r1Zc+fqv
 +sU2X+hkcn41jXAPl8haOW7dybevHto0YmCrGS8Ttq9DANcO1w0YQwH6RLxfTpazBxHilfXyhYMr+
 FhM9Ax4nSQeCrg4UFBKZbj4pXjycVWl/egC/3ebWCdStnqABXFy8TTo9TH8r2PE+6e8M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reR2K-0002EC-P5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9579CE10E0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 02:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF6AC433C7;
 Mon, 26 Feb 2024 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708915685;
 bh=UyE9kqRHnjuu/JVrTs6boGbg+Y9Veu3Y0uj4/okwmiw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mJwuEg+Y6GCM5bXijENcg5aLRgP20JTqgfG9ShYPXs1+0wDyxpwtrtWm9A/T2hxo+
 VilpbGXIyPKEZ9uzUkWrlj6wLK75I+E5QtyHdgJcHJ021rz/W2BtLBHJyN8efuUjUh
 gDuhb1Icg+kXLSlclOaMsAdKJOFehfaIw38TXnmvQddPdCrqtVPpk4F1Yz0ke49Giu
 46+mBmv0/GonV+6YdU7qYGdnLD7gyWg1SZz/g71t1XnTJYg+C0dLnejXZcz3Nuo1lG
 MNPh7yt/cfacDXPSk0GLjf//xpBl3cS/yC1JAsM5dBj/T689RdnByA8P0BoA3HaZ9+
 ibq4AI+ZQfZyg==
Message-ID: <68e95cb8-9bf5-4849-befc-bbbe8becfd68@kernel.org>
Date: Mon, 26 Feb 2024 10:48:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240223205535.307307-2-jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/24 4:55,
 Jaegeuk Kim wrote: > Even if the roll forward
 recovery stopped due to any error, we have to fix > the write pointers in
 order to mount the disk from the previous checkpoint. Jaegeuk, 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reR2K-0002EC-P5
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs: fix write pointers all the time
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/24 4:55, Jaegeuk Kim wrote:
> Even if the roll forward recovery stopped due to any error, we have to fix
> the write pointers in order to mount the disk from the previous checkpoint.

Jaegeuk,

IIUC, we may lost warm node chain once we allocate new section for all logs,
should we give some notification in log to indicate such condition that
filesystem doesn't process a full recovery flow?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/recovery.c | 2 +-
>   fs/f2fs/super.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index b3baec666afe..8bbecb5f9323 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -913,7 +913,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>   	 * and the f2fs is not read only, check and fix zoned block devices'
>   	 * write pointer consistency.
>   	 */
> -	if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb) &&
> +	if (fix_curseg_write_pointer && !f2fs_readonly(sbi->sb) &&
>   			f2fs_sb_has_blkzoned(sbi)) {
>   		err = f2fs_fix_curseg_write_pointer(sbi);
>   		if (!err)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 2e41142d07c0..4d03ce1109ad 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4673,7 +4673,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	 * If the f2fs is not readonly and fsync data recovery succeeds,
>   	 * check zoned block devices' write pointer consistency.
>   	 */
> -	if (!err && !f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
> +	if (!f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
>   		err = f2fs_check_write_pointer(sbi);
>   		if (err)
>   			goto free_meta;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
