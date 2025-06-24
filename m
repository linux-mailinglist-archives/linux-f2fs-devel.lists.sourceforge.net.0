Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B30AE6056
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 11:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGh706yDqvzP61tyhewyzqHfJKK8ooEA2T6LOYVHEzI=; b=eiqFDXLiDtyJ2E9DzkmCAt1Rd9
	i0gxzFWNccZFv8l1rXlTS3ogQq8NTHjLx6O9t7VIBRSKA9PfPXhYHAnjmXIjZjfzj49IDIXpltSLy
	FEWV8oQiW4oQBnghDglixdluF4SiKn1pmArp+wkXC+YwVytRJBXqMaeKEkth3ypDeAiU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTzfM-0003qR-QU;
	Tue, 24 Jun 2025 09:10:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uTzfL-0003qI-N5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 09:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/akWVH5OcOSA8mS4c+1R9W+Pjt+98pFtWRowpSZhDo=; b=L5Wo8SrFK4dxUyY/DT3Hn2uGkE
 sheIDmZDIbhF/7+VrZ+/MUJgZ/ZqleaM8iBYzVM3Mf6a2BJQ7fVcJZD5ZyIPnUJUCXauf1IiEC4iY
 MI13HthG/SXQjcu+1DTlKEuOrV8eXoYTCXXG5RguFiMLFyDQcF1n0XMnhQ0PnwS07TGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a/akWVH5OcOSA8mS4c+1R9W+Pjt+98pFtWRowpSZhDo=; b=HV/Biu7xGZ3vVPeaR4MzgBWhYr
 HSL3ZPhi1+8coEL/K6fRiGibrPNLyB9ODh5cShEJWk5SyzVp2lYvJlVa79ZRMWZxIv6I5vRXhv5LE
 dLzbLPukU2NzB8MswTW0VhtNwdW0nFVa+IZN02O0O4OkGI8jUau+w3JGu+JsPFKCaPkw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTzfL-0001no-78 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 09:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3AE10629CD;
 Tue, 24 Jun 2025 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3373C4CEE3;
 Tue, 24 Jun 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750756195;
 bh=oxJVBcprBlyRyXuehTvJpzRAd0H/PXSR6otU+soCaI8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RtFonMOkAIH5R3soF88T3khCH09DQhDHemHywOhVptjn8Y7Bcx+/tQW9n29UOZE9e
 HAAggi4Rtzjs9wa2bRETGm83JjdMkOMf1yDmyszcd/GDgb+Aky+fzHAiktLqXHa7Cx
 JlUbjYUYIggsPRYr/OFXXxxGA74hW3IQNW4hnWEAqKDDZ2HzPKEkYVIr5AcY6S4XxC
 Oyuuas+FVPuN8TYMseHNEeLSkFCU//WV1lsQ6hDFeYMQff2n0KqPBtWVKLmL6q6Sb7
 WGJ4NB+UBX+u8593d50hlX6aOK/tQI0A2LPtBB1cvZKOHaxQ2/SlxNNWycQhwAhY/H
 71WSauuwALKgw==
Message-ID: <02756532-4e17-4b41-9f48-157b0dbc1db2@kernel.org>
Date: Tue, 24 Jun 2025 17:09:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250618060414.97-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250618060414.97-1-yohan.joung@sk.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/18 14:04, yohan.joung wrote: > to allow users to
 dynamically tune > the boost_zoned_gc_percent parameter Well, it seem this
 patch did two things: 1. fix to check upper boundary for value of
 gc_boost_zoned_gc_percent.
 2. allow need_to_boost_gc() to use last value of boost_zoned_gc_percent
 dynamically.
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
X-Headers-End: 1uTzfL-0001no-78
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: enable tuning of
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/18 14:04, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter

Well, it seem this patch did two things:

1. fix to check upper boundary for value of gc_boost_zoned_gc_percent.
2. allow need_to_boost_gc() to use last value of boost_zoned_gc_percent 
dynamically.

Can you please split this patch to two?

Thanks,

> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>   fs/f2fs/gc.h    | 3 ++-
>   fs/f2fs/sysfs.c | 7 +++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..11fba7636af7 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -194,6 +194,7 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>   static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>   {
>   	if (f2fs_sb_has_blkzoned(sbi))
> -		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
> +		return !has_enough_free_blocks(sbi,
> +				sbi->gc_thread->boost_zoned_gc_percent);
>   	return has_enough_invalid_blocks(sbi);
>   }
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..d0ec9963ff1b 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -628,6 +628,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_boost_zoned_gc_percent")) {
> +		if (t > 100)
> +			return -EINVAL;
> +		*ui = (unsigned int)t;
> +		return count;
> +	}
> +
>   #ifdef CONFIG_F2FS_IOSTAT
>   	if (!strcmp(a->attr.name, "iostat_enable")) {
>   		sbi->iostat_enable = !!t;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
