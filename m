Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F041707789
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 03:43:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzSfk-0008Oz-6s;
	Thu, 18 May 2023 01:43:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pzSfj-0008Ot-4v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vVq2F3fkmtc+HLm92hS3VahY7uZnMyM4ox0PvWU/9+w=; b=hkObCoDnBqSreQSja6+GL7GrcB
 1u+Dky9OMy0Tl/3TaYO/F+3be5P3FM4k+gv1hmhoWGeHkGFyGnqy9XzpXtZofYZEXsF/QFv+zDJk5
 JEppy7BwwVC/IjBebaVLf8InoX1Nilyp94kusK/5rofAdOvUIzFqlCmXvLXnHofGAm+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vVq2F3fkmtc+HLm92hS3VahY7uZnMyM4ox0PvWU/9+w=; b=W1n2OcFQmGb5dnz6Gj+w2RMQgv
 z39nJyrLmDs8DqsXmiOCIVaeaJWDQTOp+Wr74v+pkV9oP8P5qoUFCSjC5dzglI35MFya/HMd0+V0Y
 5rahRNB4dy+YNb7NvaeGgTZbvertmEqAMjWC83JgaK4iv+RaCbEhD4SBzcKWyapG18Cg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzSfh-00BlBW-BL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:43:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F158C64C31
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 01:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C21AC433D2;
 Thu, 18 May 2023 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684374187;
 bh=V1QyoFTT+Ee/QBXVRzPRa7RvNORRIM/WD7FTNTXvJFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZqfaSVcCrvRNg0YPnrXy6Hiv86b0rqwYmk4gmHd7F3jBBr4HGqgRV02uNa+D5NzRc
 9Qv4r0Lw22HKDZFEuI2o9auVMBmF1Khh91DaarMmNMoox4jq4hnUQUWwLALfbWZchc
 JVCGO+VKK5CQdoA4ta7rLgT0TFfjufLbIIOH1dMmlRUu0w4WAETwQWJ50eEzIsohT9
 WQu/rD7qpxvEM9JDJ+hOAxTmAjauDpjiNlW1kWIah2rUsVXP8AthxMU5RquGTtIMIw
 2l0M8xbSvyHVXw0xnXZL+Gz7xWZJSa8VabQl3xMHTgjgc8wYCrm33L4IqRFyHLInMl
 9oKzppjvXTv8A==
Date: Wed, 17 May 2023 18:43:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZGWCqZeMS/wsjg7W@google.com>
References: <20230516145911.162431-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516145911.162431-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/16, Chao Yu wrote: > In IRQ context,
 it wakes up workqueue
 to record errors into on-disk > superblock fields rather than in-memory
 fields.
 > Fixes:? > Signed-off-by: Chao Yu <chao@kernel.org> > --- > v2: > - make
 f2fs_record_errors() static. > fs/f2fs/compress.c | 2 +- > fs/f2fs/f2fs.h
 | 1 + > fs/f2fs/super.c | 26 +++++++++++++++++++++++--- > 3 fi [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzSfh-00BlBW-BL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: flush error flags in workqueue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/16, Chao Yu wrote:
> In IRQ context, it wakes up workqueue to record errors into on-disk
> superblock fields rather than in-memory fields.
> 

Fixes:?

> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - make f2fs_record_errors() static.
>  fs/f2fs/compress.c |  2 +-
>  fs/f2fs/f2fs.h     |  1 +
>  fs/f2fs/super.c    | 26 +++++++++++++++++++++++---
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 10b545a1088e..75d3d99fffcc 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -744,7 +744,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
>  
>  		/* Avoid f2fs_commit_super in irq context */
>  		if (!in_task)
> -			f2fs_save_errors(sbi, ERROR_FAIL_DECOMPRESSION);
> +			f2fs_handle_error_async(sbi, ERROR_FAIL_DECOMPRESSION);
>  		else
>  			f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
>  		goto out_release;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0f05c1dd633f..99edc4981edf 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3563,6 +3563,7 @@ void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
>  void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
>  							bool irq_context);
>  void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
> +void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error);
>  int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
>  int f2fs_sync_fs(struct super_block *sb, int sync);
>  int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 51812f459581..17082dc3c1a3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3980,6 +3980,11 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
>  	f2fs_down_write(&sbi->sb_lock);
>  
>  	spin_lock_irqsave(&sbi->error_lock, flags);
> +	if (sbi->error_dirty) {
> +		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
> +							MAX_F2FS_ERRORS);
> +		sbi->error_dirty = false;
> +	}
>  	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
>  	spin_unlock_irqrestore(&sbi->error_lock, flags);
>  
> @@ -4019,12 +4024,10 @@ static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
>  	return need_update;
>  }
>  
> -void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
> +static void f2fs_record_errors(struct f2fs_sb_info *sbi, unsigned char error)
>  {
>  	int err;
>  
> -	f2fs_save_errors(sbi, error);
> -
>  	f2fs_down_write(&sbi->sb_lock);
>  
>  	if (!f2fs_update_errors(sbi))
> @@ -4038,6 +4041,23 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
>  	f2fs_up_write(&sbi->sb_lock);
>  }
>  
> +void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
> +{
> +	f2fs_save_errors(sbi, error);
> +	f2fs_record_errors(sbi, error);
> +}
> +
> +void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error)
> +{
> +	f2fs_save_errors(sbi, error);
> +
> +	if (!sbi->error_dirty)
> +		return;
> +	if (!test_bit(error, (unsigned long *)sbi->errors))
> +		return;
> +	schedule_work(&sbi->s_error_work);
> +}
> +
>  static bool system_going_down(void)
>  {
>  	return system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
