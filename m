Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCD166DCFB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 12:57:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHkad-00086o-4s;
	Tue, 17 Jan 2023 11:57:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pHkab-00086g-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 11:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dANBMAp4RAENWRZ6t/H2cMtwy5dX1USGXnBc/Bo/Oe8=; b=ivtoRPnAyZHLW+CqCZed77+SDk
 1grPE5/jz7ts0/EB0dVs8lRtjPBX0NYZsNDxOpy0p16eoxnAMnlU5Pw0RGJCo8kuxqZPRWBfpOTCn
 BXtd9Rhgs+lHbfKxw3KZiYXU/Av+y9DaTUjFXmlSKQXihIMAvWKd70hlB/JYsnxA7Clo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dANBMAp4RAENWRZ6t/H2cMtwy5dX1USGXnBc/Bo/Oe8=; b=PdiIqjJrKt7+GHFtOlIxRnkA18
 zPhVGBUkqUqCcTIlrj518evMMD4VDw1GqlqcS3bmfBVoUtR7/o3FR7gmZgOFYOc8/QOPqxWh4cQB5
 r1XwNbm4varrN5JQwMDDJ9Mk8C49t0qMCpuTjaaRhl2IwdtV6ETSAjrshUPMmYKdCFp0=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHkaX-0003YG-QM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 11:57:17 +0000
Received: by mail-pf1-f182.google.com with SMTP id 127so5982052pfe.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jan 2023 03:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dANBMAp4RAENWRZ6t/H2cMtwy5dX1USGXnBc/Bo/Oe8=;
 b=VSJnHLh7s1iiaeu991QJc0cXzh0unkpWjDRrnufHZZ/NNedjiL1s7qgJkBvmrOHl30
 i1IM9SJQFmu0MIuhdOPR85sH+95e1Be8axjATAkD/eYuOFDPxAlGCzXuwSqM427jMT9S
 v5qDzAhJ4YJvQOmMEOHEIGoIqiJIZpmPET651leAmkdgrl839LfFB6ILWRrK0zFAlXKX
 skKHnQitn4iEU62djPMlj5G5WvUa4C9qBdj1O/W6nOYwn5+Jlf6dQobgk+zStP54SH/f
 X4MHxvbGtjcv1AS4B79BJylW57zocqALfhjRRjx1Jweo+RBsW/L7oXlovO44fjE0nL9w
 Q1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dANBMAp4RAENWRZ6t/H2cMtwy5dX1USGXnBc/Bo/Oe8=;
 b=JRnVxlhGm+fuTUIpbbaRoOT1gRc3Q/U1snVyLG4tOSLiqEhm+Fc3YPoouPjXXubEWo
 FNrv/ej0MYOYk3nlehWAoSDyK2+IkaVtuwrJxhH/TQAr9f2bsVxpItyN95/2tPAk+/j0
 Zxg9oKpfQvE66UQ65MkrdIOhuuexGTucXIg4PxiMydseQIOtq57fZL4Qfblv55M8RIvv
 PJ0rlHfjsa7zYRZ7ndDUSYUQQ6RwbYEAMEPqs+VqAPf7CHFnzlXef5Zu2kAj3pfrS5I0
 Y0d/I1HBg/VOEQqKFNrZBNbKYgZJma4KLWV8Lp1ifPdgb0YMlA+/Lb7f5o/fLzUn8Mp3
 H80A==
X-Gm-Message-State: AFqh2kp1aO5WkV1qtTHXz4JvKdpPJbB2h40FAFAJfKxucBm5ifvTwvQT
 4uPX/m+hiREbpLzC0FgXoVQNUkQqWSv1wA==
X-Google-Smtp-Source: AMrXdXsfsAPFEBXS0noewcd9K0vd1wBtAXFK4aZRGgMCXc+TGFLj77ymMookAnSv9l/iR4zJrPChGw==
X-Received: by 2002:aa7:8f1a:0:b0:586:2f39:495a with SMTP id
 x26-20020aa78f1a000000b005862f39495amr3614019pfr.15.1673956628142; 
 Tue, 17 Jan 2023 03:57:08 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20066745pfb.0.2023.01.17.03.57.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:57:07 -0800 (PST)
Date: Tue, 17 Jan 2023 19:57:02 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230117115702.GA12653@mi-HP-ProDesk-680-G4-MT>
References: <20230117103042.2509-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117103042.2509-1-frank.li@vivo.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 17, 2023 at 06:30:42PM +0800,
 Yangtao Li via Linux-f2fs-devel
 wrote: > Commit 71644dff4811 ("f2fs: add block_age-based extent cache") >
 introduce age extent cache, which experimental data [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pHkaX-0003YG-QM
Subject: Re: [f2fs-dev] [PATCH] f2fs: set *_data_age_threshold according to
 user_block_count
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
 linux-f2fs-devel@lists.sourceforge.net, xiongping1@xiaomi.com,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 17, 2023 at 06:30:42PM +0800, Yangtao Li via Linux-f2fs-devel wrote:
> Commit 71644dff4811 ("f2fs: add block_age-based extent cache")
> introduce age extent cache, which experimental data is based on
> a 128G storage device, and hot and warm data age threshold are
> set to 1G and 10G respectively. But it is unreasonable to set
> this value to 1G or 10G by default, which varies depending on
> the environment. For small storage devices, some storage devices
> do not even have 10G.
> 
> Let's change hot and warm data age threshold to 1% and 10% of
> user_block_count respectively.
> 

Hi Yangtao,

Thanks for your patch.

The block age here refers to total data blocks allocated of filesystem
between two consecutive updates. So, it has nothing to do with storage
size.

> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++----
>  fs/f2fs/extent_cache.c                  | 2 --
>  fs/f2fs/f2fs.h                          | 9 +++++----
>  fs/f2fs/super.c                         | 2 ++
>  4 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 75420c242cc4..c7952f1baf59 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -660,15 +660,13 @@ What:		/sys/fs/f2fs/<disk>/hot_data_age_threshold
>  Date:		November 2022
>  Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>  Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
> -		the data blocks as hot. By default it was initialized as 262144 blocks
> -		(equals to 1GB).
> +		the data blocks as hot. By default it was initialized as 1% of user_block_count.
>  
>  What:		/sys/fs/f2fs/<disk>/warm_data_age_threshold
>  Date:		November 2022
>  Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>  Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
> -		the data blocks as warm. By default it was initialized as 2621440 blocks
> -		(equals to 10GB).
> +		the data blocks as warm. By default it was initialized as 10% of user_block_count.
>  
>  What:		/sys/fs/f2fs/<disk>/fault_rate
>  Date:		May 2016
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 1daf8c88c09b..9c7e304d5660 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -1235,8 +1235,6 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
>  
>  	/* initialize for block age extents */
>  	atomic64_set(&sbi->allocated_data_blocks, 0);
> -	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
> -	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
>  }
>  
>  int __init f2fs_create_extent_cache(void)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f3c5f7740c1a..3b853c302a43 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -615,11 +615,12 @@ enum {
>  #define SAME_AGE_REGION			1024
>  
>  /*
> - * Define data block with age less than 1GB as hot data
> - * define data block with age less than 10GB but more than 1GB as warm data
> + * Define data block with age less than 1% of user_block_count as hot data
> + * Define data block with age less than 10% of user_block_count but more
> + * than 1% of user_block_count as warm data
>   */
> -#define DEF_HOT_DATA_AGE_THRESHOLD	262144
> -#define DEF_WARM_DATA_AGE_THRESHOLD	2621440
> +#define DEF_HOT_DATA_AGE_THRESHOLD	1
> +#define DEF_WARM_DATA_AGE_THRESHOLD	10
>  
>  /* extent cache type */
>  enum extent_type {
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5fc83771042d..8333ea5b8ffd 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4088,6 +4088,8 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
>  					BIT(F2FS_IPU_HONOR_OPU_WRITE);
>  	}
>  
> +	sbi->hot_data_age_threshold = sbi->user_block_count * DEF_HOT_DATA_AGE_THRESHOLD / 100;
> +	sbi->warm_data_age_threshold = sbi->user_block_count * DEF_WARM_DATA_AGE_THRESHOLD / 100;
>  	sbi->readdir_ra = true;
>  }
>  
> -- 
> 2.25.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
