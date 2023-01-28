Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32F67F765
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 11:52:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLipG-00068i-Oh;
	Sat, 28 Jan 2023 10:52:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLipF-00068b-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 10:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tFVmasp6A+4Upv0MDtZYoKOLpgdnEsjlziIL0av4uW4=; b=hxuaiQRMp5oXc6zXGBYimFv0+T
 YIluMs91ZpNp3fWEliCwLba0oyDXCx0W6XHWKoJeFwtlSMWcD0By9za7oex4a+I1nrnOwVaCSQXZR
 P0ZB/t/usp/6qaNSEv29+fhyonGXd4gpDhI0Xk4YADSBucqGhmgOWWgNOoQymmBsfgzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tFVmasp6A+4Upv0MDtZYoKOLpgdnEsjlziIL0av4uW4=; b=LlxeHgMR42dWCOYHUE52mPghqu
 Gm9MTLFlKZ41T0/cMqi5Pp9joMhhBZbHuinL6I4fVLf9TfKoOF/J4H2V+Yi1ufQt4vzU08jwMyEiD
 MZuhC551/5rjFUbOXmgPT60ueCYPY6Wd7T4uSgBOzn81BtoCXVGFmcq/kptsWzvds9nA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLipE-001bFd-2n for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 10:52:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 490F560BA3;
 Sat, 28 Jan 2023 10:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED95C433D2;
 Sat, 28 Jan 2023 10:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674903159;
 bh=mU2sofQsfLRtbvo6AS8tXDrNPsvRuHKvOKXxOJsK5ww=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H8+yTe4zMaG4kMrrje1tbCEoSzqBK3kbi9G6RiLUrfEDxSAuxgHPwfUZE+wU+/4iN
 KcaUHqPOCdoy1yJZjJurz5omB73iS0rpuE+SWjrcBcLllKI76JUb0GaTmS5vfELYEg
 arjNt6Hnm8iu/0IZ9tjTV2/3/3pT6EdT1q/gffYNuXI5TGtc5lmH+BMQv6hffFmVzf
 gMw1EHEioncmp27vPIVzqbCfuj4Cp3/wn88MHnpM0LinFkpDaywdCsOxdvBWNsWsBH
 OIb0mRIrLZAFw0Au4mri+pTt5mp465NpQwe9XWzw1+WvSZolCfFqMK+npjDh5BJ+Jk
 /wjLBM0KqYIbw==
Message-ID: <70c2cbde-3443-7833-68cc-646a65b11d81@kernel.org>
Date: Sat, 28 Jan 2023 18:52:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230112143151.23921-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230112143151.23921-1-frank.li@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/12 22:31, Yangtao Li wrote: > is_extension_exist()
 only return two values, 0 or 1. > So there is no need to use int type. It's
 too trivial to do such change one by one, how about merging all similar changes
 into one patch? 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLipE-001bFd-2n
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert is_extension_exist() to return
 bool type
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

On 2023/1/12 22:31, Yangtao Li wrote:
> is_extension_exist() only return two values, 0 or 1.
> So there is no need to use int type.

It's too trivial to do such change one by one, how about merging all
similar changes into one patch?

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/namei.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 6032589099ce..516968cbc6d6 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -22,7 +22,7 @@
>   #include "acl.h"
>   #include <trace/events/f2fs.h>
>   
> -static inline int is_extension_exist(const unsigned char *s, const char *sub,
> +static inline bool is_extension_exist(const unsigned char *s, const char *sub,
>   						bool tmp_ext)
>   {
>   	size_t slen = strlen(s);
> @@ -30,19 +30,19 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub,
>   	int i;
>   
>   	if (sublen == 1 && *sub == '*')
> -		return 1;
> +		return true;
>   
>   	/*
>   	 * filename format of multimedia file should be defined as:
>   	 * "filename + '.' + extension + (optional: '.' + temp extension)".
>   	 */
>   	if (slen < sublen + 2)
> -		return 0;
> +		return false;
>   
>   	if (!tmp_ext) {
>   		/* file has no temp extension */
>   		if (s[slen - sublen - 1] != '.')
> -			return 0;
> +			return false;
>   		return !strncasecmp(s + slen - sublen, sub, sublen);
>   	}
>   
> @@ -50,10 +50,10 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub,
>   		if (s[i] != '.')
>   			continue;
>   		if (!strncasecmp(s + i + 1, sub, sublen))
> -			return 1;
> +			return true;
>   	}
>   
> -	return 0;
> +	return false;
>   }
>   
>   int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
