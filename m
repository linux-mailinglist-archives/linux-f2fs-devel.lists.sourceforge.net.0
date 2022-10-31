Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A761347D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Oct 2022 12:28:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opSxh-0007TN-8Y;
	Mon, 31 Oct 2022 11:28:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1opSxX-0007TB-80
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 11:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKPI5yRxVTKFtgumlu/CUnO4v6ROaa6qGM+N7FESgvY=; b=GeT6IqYkpo59PwaCu2CAmhpLhJ
 Zwya1DO8kgm9eOt8YbXRRaJt6+Q1xrpz9nGh36aOGnp/ZmCCfTDVKAtyMHh5W0vE0iZr2TYCvojAr
 ++KH/KBU2ofPwHx2Bj6QZF5FL8SoL8Ax+m8x0wZD6d2syrjsO7upOO+RBztlkATfWV9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TKPI5yRxVTKFtgumlu/CUnO4v6ROaa6qGM+N7FESgvY=; b=VxqQeQgnXkt1pf08BIU8KwYnbQ
 2IsIuGjgNuwmT28H4PnaFP8Z/ItSzWvEbBPnmq7xjPpj3TywpdK5VEpsrxY0DXcpJFH+su/S9SrWh
 ZkLdyJzsiGHbZ+hj5QZK06g1xprHhH2IwoPJdkDmPfK2dpDiIIwL2GQN9GhAoQmFpUxo=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1opSxT-006kVx-16 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 11:28:03 +0000
Received: by mail-pf1-f180.google.com with SMTP id k22so10433136pfd.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Oct 2022 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKPI5yRxVTKFtgumlu/CUnO4v6ROaa6qGM+N7FESgvY=;
 b=LT39UhB5T9y5tPam8V/nJCDvqs/c5nXKUv0RbG04WnsSKOsRpmnua6u8vyEs1AJ2DE
 9j9bssNQQRQKwAeydagctfVjiHGtK8naWVz/3f9x7aQdKc/09i+R7py/lvY2DsfbmIwC
 gCD8fxgVyp/nhEtgQhAV2i8U51eKV2lCXjKsjIHlSnOkfnr/GEZdgY5GfieQgkSoev3Z
 KZDfF1ApFms1kJluJqqdMZMuZZCyqCmGmFMJfVamZJFcqNz3k5YtbTBlOHwwUiBkcxZw
 XJYrLBLbD4a987FY3CHDW1rhKkq75VHra7UFvv+vSmDRkgfXrsCrfQjXv57EJgMballd
 VPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKPI5yRxVTKFtgumlu/CUnO4v6ROaa6qGM+N7FESgvY=;
 b=rCGJGN+32N/IG/P9i40pba4eTg+n8dEOY/k96sGhqEd6uXJt2AuW6JCDv73SoST9fC
 FMpBUG/wPpvHiUspdq82f0piUVBuFfljRtFWrcNwGB+f6I9iiBHwMIg9xAQARKYZ/pGT
 Se6emccNScTeraojX494oG06D4iKz/u/2by4bcGs5h/oZj2b3DXvXbIPEnyc/GJwvUe6
 YVCygfxPf+JXhY4enL6gOQBX0cO6C5eraZYsk4YZJAbrM2YkdyWTH99+etoZzxtU3veH
 RhCoxRz1A2UvexaK2BiHwuZbcWo13AhjWboDu8OYXSz/L/KP08tyetGJLOM3M2zOHSiW
 0Kow==
X-Gm-Message-State: ACrzQf0T75fO430cJ/8YQXfkSihjMALy+j8QoSZPfze7BSeCPJo7Prdu
 Zu+5ieM+NiDXUaKGiGnUMfM=
X-Google-Smtp-Source: AMsMyM4YLfIkdzMz+5bQQP5GgFUPAyaEGJK/wwQds5AmW2XQcMtAh1zCSaNxV/nyY6zka22bFq7/vA==
X-Received: by 2002:a63:e158:0:b0:464:8d6:8b91 with SMTP id
 h24-20020a63e158000000b0046408d68b91mr11898674pgk.124.1667215673550; 
 Mon, 31 Oct 2022 04:27:53 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a17090a3f8a00b002008d0e5cb5sm3946564pjc.47.2022.10.31.04.27.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Oct 2022 04:27:52 -0700 (PDT)
Date: Mon, 31 Oct 2022 19:27:47 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <20221031112747.GA22857@mi-HP-ProDesk-680-G4-MT>
References: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Friendly ping... On Fri, Oct 21, 2022 at 10:31:36AM +0800,
 qixiaoyu1 wrote: > Currently IPU policy for fdatasync is coupled with
 F2FS_IPU_FSYNC.
 > Fix to apply it to all IPU policy. > > Signed-off-by: qixiaoyu1 > -- [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1opSxT-006kVx-16
Subject: Re: [f2fs-dev] [PATCH] f2fs: separate IPU policy for fdatasync from
 F2FS_IPU_FSYNC
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Friendly ping...

On Fri, Oct 21, 2022 at 10:31:36AM +0800, qixiaoyu1 wrote:
> Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
> Fix to apply it to all IPU policy.
> 
> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> ---
>  fs/f2fs/data.c | 8 +++-----
>  fs/f2fs/file.c | 4 +++-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a71e818cd67b..fec8e15fe820 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
>  	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
>  			is_inode_flag_set(inode, FI_OPU_WRITE))
>  		return false;
> +	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
> +	if (is_inode_flag_set(inode, FI_NEED_IPU))
> +		return true;
>  	if (policy & (0x1 << F2FS_IPU_FORCE))
>  		return true;
>  	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
> @@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
>  			!IS_ENCRYPTED(inode))
>  		return true;
>  
> -	/* this is only set during fdatasync */
> -	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> -			is_inode_flag_set(inode, FI_NEED_IPU))
> -		return true;
> -
>  	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>  			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
>  		return true;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82cda1258227..08091550cdf2 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  		goto go_write;
>  
>  	/* if fdatasync is triggered, let's do in-place-update */
> -	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
> +	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
> +			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
>  		set_inode_flag(inode, FI_NEED_IPU);
> +
>  	ret = file_write_and_wait_range(file, start, end);
>  	clear_inode_flag(inode, FI_NEED_IPU);
>  
> -- 
> 2.36.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
