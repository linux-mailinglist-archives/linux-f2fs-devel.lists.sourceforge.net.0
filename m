Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A40628359
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 15:59:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouavz-0002cr-BR;
	Mon, 14 Nov 2022 14:59:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ouavy-0002ce-0u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 14:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ByTc2YJk9RxcuSI4NZqh760o19HI+1HNd86BpAFnp30=; b=LLdY82C2a6mLgKgKnCAFyNG4Rm
 n60W13041Zb4KGD94yx0Um9mUXL/8lPZGp07xvCUPAr0IAGX2YTf0EjlIiMPVu5VzFMhUYo5EEmSQ
 87ZC7AThtth7pwBxpVZ/Vlgn8DQS6UwMGDNQKBoGldU5zpaDQEopIeCOOuudOMOJDBxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ByTc2YJk9RxcuSI4NZqh760o19HI+1HNd86BpAFnp30=; b=Wz/MGtnLjoNiVdd1FZetgh7Wjo
 8/gAxIanK01dbZ02L8MpXYr55h1CjnDSmShd96Pf4krxZEa04W6R/g/lgBRH7vSj7fdaXlyIC5/6z
 6rBbfzESu50SfiS3OE5CretUOHeiIx6SsF0s++gjAh35XJev3AcRnqk7RnRfZU6z7BI4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouavt-008161-I7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 14:59:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40AF6B80F98;
 Mon, 14 Nov 2022 14:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB9AC433D6;
 Mon, 14 Nov 2022 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668437965;
 bh=MyGp7ncnUOUDJYrcTaf14fF06apJ3gX8OEBOWs6Q5mA=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=eEqfDIWL9mH8h3V7HI/UEJtJgKdlXBpk8S7Hz42jvY0swo4bOhFpQ9o9rRbDT5fuJ
 qAPT5sr8lBX1yrXYvZf2fh1B6WwdJjxYCNQiRLtV3R3zzWKGzXLbQ2bQCb5NWsWuOT
 UJ6q8bTiPqplUHaYDSEByv3pt2Ez1l0IFZvzwA5gk7TpFM9iZeoAel5sGyvFVCcB6j
 K9ZI/LNr+I1ocSkgKHkMG3+L6UUlNBKfxCgMlEThidssKSuSj4xl6koLf/6laB3zdi
 VOHUR1ve5vDRygDpw2+jYlH6guBCKm5EaOauY4hxnNInEJZbV+gN7bVTGhUR2EbgjE
 xUgCKKCaQlv8g==
Message-ID: <420531c0-2649-bf2a-140d-2f4f13036b0d@kernel.org>
Date: Mon, 14 Nov 2022 22:59:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
 <20221112083250.295700-4-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221112083250.295700-4-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/12 16:32, Yuwei Guan wrote: > Before this patch, 
 the varibale 'readdir_ra' takes effect if it's equal > to '1' or not, so
 we can change type for it from 'int' to 'bool'. > > Signed-off-by: [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouavt-008161-I7
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: change type for 'sbi->readdir_ra'
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

On 2022/11/12 16:32, Yuwei Guan wrote:
> Before this patch, the varibale 'readdir_ra' takes effect if it's equal
> to '1' or not, so we can change type for it from 'int' to 'bool'.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> ---
>   fs/f2fs/dir.c   | 7 +++----
>   fs/f2fs/f2fs.h  | 2 +-
>   fs/f2fs/super.c | 2 +-
>   fs/f2fs/sysfs.c | 5 +++++
>   4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 21960a899b6a..06d9bf98f5ae 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -1000,13 +1000,12 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>   	struct fscrypt_str de_name = FSTR_INIT(NULL, 0);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(d->inode);
>   	struct blk_plug plug;
> -	bool readdir_ra = sbi->readdir_ra == 1;
>   	bool found_valid_dirent = false;
>   	int err = 0;
>   
>   	bit_pos = ((unsigned long)ctx->pos % d->max);
>   
> -	if (readdir_ra)
> +	if (sbi->readdir_ra)
>   		blk_start_plug(&plug);
>   
>   	while (bit_pos < d->max) {
> @@ -1064,14 +1063,14 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>   			goto out;
>   		}
>   
> -		if (readdir_ra)
> +		if (sbi->readdir_ra)
>   			f2fs_ra_node_page(sbi, le32_to_cpu(de->ino));
>   
>   		ctx->pos = start_pos + bit_pos;
>   		found_valid_dirent = true;
>   	}
>   out:
> -	if (readdir_ra)
> +	if (sbi->readdir_ra)

I don't think this is the right way... due to below case:

if (sbi->readdir_ra)	// readdir_ra is 1 by default
	blk_start_plug(&plug);

if (sbi->readdir_ra)	// readdir_ra is updated to 0, it will miss to unplug.
	blk_finish_plug(&plug);

Thanks,

>   		blk_finish_plug(&plug);
>   	return err;
>   }
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6355a5683b7..384840216e7f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1693,7 +1693,7 @@ struct f2fs_sb_info {
>   	unsigned int total_node_count;		/* total node block count */
>   	unsigned int total_valid_node_count;	/* valid node block count */
>   	int dir_level;				/* directory level */
> -	int readdir_ra;				/* readahead inode in readdir */
> +	bool readdir_ra;			/* readahead inode in readdir */
>   	u64 max_io_bytes;			/* max io bytes to merge IOs */
>   
>   	block_t user_block_count;		/* # of user blocks */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index f18ae5410b2c..da304861890f 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2202,7 +2202,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi, bool is_remount)
>   	}
>   
>   	if (!is_remount)
> -		sbi->readdir_ra = 1;
> +		sbi->readdir_ra = true;
>   }
>   
>   static int f2fs_remount(struct super_block *sb, int *flags, char *data)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index df27afd71ef4..53fbbb87dd0f 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -649,6 +649,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "readdir_ra")) {
> +		sbi->readdir_ra = !!t;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
