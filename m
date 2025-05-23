Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D0AC1A03
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 04:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osRdSll7UDLTMTK/vS53ZSA7QvdHVZPIeaiBZCVFIas=; b=Mh9hils1ap6J6U/IBpJfhKc0ZH
	v6hysbG19ftKOF6bsnfVDAZc+jWV9u40YYB2O48LpmppgBfMEfgrnXjZzlJqjE48MqLnL4MDwFmmm
	vo6V+dXwIr+qKg3N1KskU14pnnYVcJQRY5E/eOWH4bNt5iRK6LyN67ewBQ7G62GaHjSE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uII0v-0000kE-Dh;
	Fri, 23 May 2025 02:20:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uII0u-0000jS-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 02:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jMio1exfnm9tU7fxvSjXG8nB8ZYBTzIqgqK6awXrW+I=; b=RCZNek7IUFM2LkMXkae871z4fY
 kF10CSIDs7lL/npHBw9H+IKMcS1lGX9XNjeH2W3erHF2R5EhQNKAl/1njLoVVbGAovTFPCu3MnXXW
 K0ObMEZnObSacqtKCQwWvc3BQnY9n5pcABTDJTHOkR/Ydqmluld2xgD//njU3iaDTCmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jMio1exfnm9tU7fxvSjXG8nB8ZYBTzIqgqK6awXrW+I=; b=PaCtT1gcA/2KOZFMKcY/iKN3J5
 RedUsyp0BZ1vcLh7q0LjouBT1ksh96LJAdZlm5EZqa6vFG6yO4CIU1JxEMIrPdp1Bd7vNapry8oyg
 8Eml/NlYqSXG9cmZAa65Bsnwht1C1e361Zbd22GxxOEn7NsxAwbuZxxv81HshRiStGs8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uII0t-0003KR-ML for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 02:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 130D3A494FC;
 Fri, 23 May 2025 02:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E136C4CEE4;
 Fri, 23 May 2025 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747966793;
 bh=XiRD1ZTdrDd/+WnwCgXmWMh44zeaMtvWvY4bQQPbBYo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Nmeiuq3HYOLlLYm1vA2r/9hfnTgBxRH+WIc3Nahr2qmjVRAfarCqLnWipOtjz97+C
 v3krBo3TulWAj04NIYojX/OO/jHttqc1xW69kBRyP42zTK/zoEKizPP7jdb5O90qML
 0r72ajp8/XG9wa/B6WHzLXafSu1rPQYyqvxTQpmd/OLUMfypFJhDabVfr7ybboPN6u
 IY6+K6NzwXgB8zKs+2ET+GyQ5r+Q9A9ImXVInCppsANXpHalKdLLaipyscUIj/Eg4G
 6Ebp893qTguoQa4ly6onqZS+V1aFGMYe7lNES4VxhLwenUd2v8qXn/iAjjT7v6CIGv
 UM054D4cbzSSg==
Message-ID: <2e20d818-56d7-4b34-90a5-3503dc02b164@kernel.org>
Date: Fri, 23 May 2025 10:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250523002146.763-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250523002146.763-1-yohan.joung@sk.com>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/23/25 08:21,
 yohan.joung wrote: > to allow users to dynamically
 tune > the boost_zoned_gc_percent parameter > > Signed-off-by: yohan.joung
 <yohan.joung@sk.com> > --- > fs/f2fs/gc.h | 4 +++- > 1 f [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uII0t-0003KR-ML
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable tuning of
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

On 5/23/25 08:21, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/gc.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..f9ff68dc2bcc 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -194,6 +194,8 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>  static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>  {
>  	if (f2fs_sb_has_blkzoned(sbi))
> -		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
> +		return !has_enough_free_blocks(sbi,
> +			sbi->gc_thread->boost_zoned_gc_percent < 100
> +			? sbi->gc_thread->boost_zoned_gc_percent : 100);

How about checking lower/upper boundary for boost_zoned_gc_percent
during setting its value via sysfs? Also update the manual page?

Then we can use sbi->gc_thread->boost_zoned_gc_percent directly here?

Thanks,

>  	return has_enough_invalid_blocks(sbi);
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
