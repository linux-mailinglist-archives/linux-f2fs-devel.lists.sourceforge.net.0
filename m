Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD123ADC1D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 07:38:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unQ9Al+nzAYbEFij+hviH6QiKjS+z2BWLrdcGqW+cik=; b=IbqKrqKrygsDwh5N5+zVGsdzON
	fUiwN9nxDf/QLDbeG0STZQPGec/WWaX0a9MKX1UvVAoyGK7wiB8Fs2940RoMuusbZa5n1qAIWHc3i
	nPAW4DnfzMLzIJvDKkqn41p8Ja6ECrWdUc4XLehF4HfQ84LynMDMrNlPw+T3A5lg+onE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRP1a-0002Op-Fq;
	Tue, 17 Jun 2025 05:38:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uRP1V-0002Of-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 05:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DLCsjEo6jEcNDySaQhIrgTeAu0wsZh4LpzfoSFa+BAM=; b=OrDtsgu8gLYjLJIT/IdWmHzF30
 nMY1obAC4zqm4STDI1rzgJII1I0TrTHRejXLyCa6zPqOLPBsjlbDaSpilm94bUR14BWLuSnWkTKxJ
 jIl8t0SlnNF4pzahy9YDarmoRrxHql4P58MuAM9qoomjz3bsMdcWfGzQQedzX4UCwae4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DLCsjEo6jEcNDySaQhIrgTeAu0wsZh4LpzfoSFa+BAM=; b=Ubp81wVy7VcGXlJxob2qSAt/Nz
 nrSgFp6SA6Im35kXNDgba4qmJwyeuqnemQxgIg3ME8zfJQZ0F5sh6Q5kvlinA16esR2uaznFPnEyb
 z+71Oo2egGQNna10gOmknf/05XlQ2YB70jk35myOWbOvQq2HBP3UdPP9NAlNFHdfO3D8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRP1V-0003v3-4P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 05:38:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7FE5BA43163;
 Tue, 17 Jun 2025 05:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BD6C4CEE3;
 Tue, 17 Jun 2025 05:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750138691;
 bh=FbkeenEsIpXeuGcFiRuqBUmJZXXbBLKDpHvRSQRQAhQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=G8Qlw7dxlyuAis5O7Xfc+47Z9gkeDoib0rJUeVaZ5/iHFGpKrbym5CTqwK+WfDYYp
 BT2ND9ZuLAW6HvIA+/X8gusnUmtBWKZ+oKrMfGEyplZgOEBn/9VG3exHEX2Oii/slk
 CApO7i7WCF29ZoPSN20urMOE/5Qps6p7jORMWRuhIEt7OyUYl1GjXC8ASlZ8GK0vSb
 J2zgZPjISXmgHmnx2D4mgAdnrwBdnFfd3JAcS/xgH9dctL2Kc09j1yff56qAuQFbv1
 cN1MjQ1MX1xLLIWbvWTBZ63jK0IO6zJPGqEOwezVmQk9OkozKCgpppFrLGGEDQmMy6
 CrTwk99tkQ4pQ==
Message-ID: <5e0b43d2-df0f-4378-91c2-d7ad204c4380@kernel.org>
Date: Tue, 17 Jun 2025 13:38:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250616050445.1492-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250616050445.1492-1-yohan.joung@sk.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/16/25 13:04,
 yohan.joung wrote: > to allow users to dynamically
 tune > the boost_zoned_gc_percent parameter > > Signed-off-by: yohan.joung
 <yohan.joung@sk.com> > --- > fs/f2fs/gc.h | 3 ++- > fs/f [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRP1V-0003v3-4P
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: enable tuning of
 boost_zoned_gc_percent via sysfs
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/16/25 13:04, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.h    | 3 ++-
>  fs/f2fs/sysfs.c | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..11fba7636af7 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>  static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>  {
>  	if (f2fs_sb_has_blkzoned(sbi))
> -		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
> +		return !has_enough_free_blocks(sbi,
> +				sbi->gc_thread->boost_zoned_gc_percent);
>  	return has_enough_invalid_blocks(sbi);
>  }
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..6c26b5e10c8f 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -628,6 +628,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
> +		if (t > 100)
> +			return -EINVAL;

We'd better assign boost_zoned_gc_percent here and return directly to
avoid all below unnecessary comparison between a->attr.name and entry
names.

Thanks,

> +	}
> +
>  #ifdef CONFIG_F2FS_IOSTAT
>  	if (!strcmp(a->attr.name, "iostat_enable")) {
>  		sbi->iostat_enable = !!t;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
