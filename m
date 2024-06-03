Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9958D7CA1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 09:41:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE2Jp-0003cZ-Tu;
	Mon, 03 Jun 2024 07:41:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sE2Jn-0003cS-8b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 07:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X865uPHOvliOMJxWwEusHfbAySY4Y5ugK4YWn52vn+s=; b=gT7cfwrrCDZ7K6QDBWvvmfObq+
 7jTWa428uUgXYTnKi+JeJU4N63HxJQDd8rOWwonHv3TigFcITlBkiRCymaL9AcVMKk2byabml++Tc
 j6l/yw2ifFd+HNpSoiEWlEsrG7l8H8ZSgmVlPyTql09pbFdbeMCeozNzCcsbxo7g4990=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X865uPHOvliOMJxWwEusHfbAySY4Y5ugK4YWn52vn+s=; b=GAS322g32KlZTWh5ix5yQR8ZMR
 zwug9qbML2mXN7GYRESzXm2890ewi9AQvt/atxqZ/34L4SUQZ1l4QzsizdMaSYYW+dOyASXxNtryy
 Su8m54LIcc/qoJ19v8eg5JYpn+oFMcMi9DoPaAs0V8GHSzbHvG0KWiqbI8MiUTNfU9Vw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sE2Jn-0002jd-Df for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 07:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E07C8CE0AE0;
 Mon,  3 Jun 2024 07:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A737DC2BD10;
 Mon,  3 Jun 2024 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717400470;
 bh=m5aSQfeZKfHg4vKuPqJxxkdm7ckdPdrNRTojWDxZfOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D3TDhQx+ikubtIpRN6HbWJrEsSKFgxpx74aSdSV4vzZebcfSLn7jRnGagBGQFym+W
 5F6XCQwNaAlj8WUEdXF79haI/TTxYA7bO7Z1izqOspW+pbxmwYW9vAp8BdYD5S95ks
 Lv4r8i5k7JaIoXJZdqvHRuu2UdtBIGh41fDpyvrH5aA8SBJoJZzHVCdUlq4+eSuBuj
 BdtJg/x/Lcj7WmUyFJwUmJBx4Tp/F6T3rOsZx1UklazxSj7u6UqMHZ8xr4Hvr9+dtS
 UKIGTbrWPuL56sm2f7nKr/sBuw0nwwAYgKLfza6S5O0uyrK7akHwFxY596r5gFVGGy
 8GAOXTC/9nbYA==
Message-ID: <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
Date: Mon, 3 Jun 2024 15:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/20 19:36,
 Zhiguo Niu wrote: > Now atgc can be enabled
 based on the following conditions: > -ATGC mount option is set > -elapsed_time
 is more than atgc_age_threshold already > but these condi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sE2Jn-0002jd-Df
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/20 19:36, Zhiguo Niu wrote:
> Now atgc can be enabled based on the following conditions:
> -ATGC mount option is set
> -elapsed_time is more than atgc_age_threshold already
> but these conditions are check when umounted->mounted device again.
> If the device has not be umounted->mounted for a long time, atgc can
> not work even the above conditions met.
> 
> It is better to enable atgc dynamiclly when user change atgc_age_threshold
> meanwhile this vale is less than elapsed_time and ATGC mount option is on.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/f2fs.h    |  1 +
>   fs/f2fs/segment.c |  9 ++++-----
>   fs/f2fs/sysfs.c   | 16 ++++++++++++++++
>   3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 1974b6a..e441d2d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3694,6 +3694,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>   int f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
>   void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
>   void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> +int f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi);
>   int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   					unsigned int start, unsigned int end);
>   int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 71dc8042..44923d4 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2931,14 +2931,11 @@ static int get_atssr_segment(struct f2fs_sb_info *sbi, int type,
>   	return ret;
>   }
>   
> -static int __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
> +int f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
>   {
>   	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC);
>   	int ret = 0;
>   
> -	if (!sbi->am.atgc_enabled)
> -		return 0;
> -
>   	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>   
>   	mutex_lock(&curseg->curseg_mutex);
> @@ -2955,7 +2952,9 @@ static int __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
>   }
>   int f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi)
>   {
> -	return __f2fs_init_atgc_curseg(sbi);
> +	if (!sbi->am.atgc_enabled)
> +		return 0;
> +	return f2fs_init_atgc_curseg(sbi);
>   }
>   
>   static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 09d3ecf..72676c5 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -673,6 +673,22 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "atgc_age_threshold")) {
> +		if (t < 0)
> +			return -EINVAL;
> +		sbi->am.age_threshold = t;
> +		if (sbi->am.atgc_enabled)
> +			return count;
> +
> +		if (test_opt(sbi, ATGC) &&
> +			le64_to_cpu(sbi->ckpt->elapsed_time) >= t) {

Oh, I guess you want to fix this:

static void init_atgc_management(struct f2fs_sb_info *sbi)
{
...
	if (test_opt(sbi, ATGC) &&
		SIT_I(sbi)->elapsed_time >= DEF_GC_THREAD_AGE_THRESHOLD)
		am->atgc_enabled = true;

What about enabling atgc_enabled during checkpoint once elapsed time is
satisfed w/ the condition? I guess this can give another chance whenever
CP is been triggered, and it can avoid the racing condition as well.

Thanks,

> +			if (f2fs_init_atgc_curseg(sbi))
> +				return -EINVAL;
> +			sbi->am.atgc_enabled = true;
> +		}
> +		return count;
> +	}
> +
>   	if (!strcmp(a->attr.name, "gc_segment_mode")) {
>   		if (t < MAX_GC_MODE)
>   			sbi->gc_segment_mode = t;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
