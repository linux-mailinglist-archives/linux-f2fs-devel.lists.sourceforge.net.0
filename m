Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 584BD67F6B2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 10:28:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLhVF-0001jM-J4;
	Sat, 28 Jan 2023 09:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLhV3-0001it-3B
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 09:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w86m2iSmquHGv0c9vODGGaq4gvXEhF/PPoVUdD+WrLM=; b=BgnEYCWccjyOqD1GOdCi1A8XEZ
 lKPIchj2fvyvjvXCXG2xeMwM7bh8g6aQ84tBcIBZgotTFVp/6hbBosd/5nK4u3qUJL+1+nkRKYeHu
 SRebUR1s3dlRh8G7WACkgaWks924i18pX1o+wEH4TQI1biuC9ki0zN7Ofa3V9e4XcRO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w86m2iSmquHGv0c9vODGGaq4gvXEhF/PPoVUdD+WrLM=; b=dLwrJS3MNdYRQb3390DxXMTYPH
 J/BbbuppQUvYEp2B6/M1l63e8Y65+VBksUyoOeQFzEudJNVY8EFTEqmO7ehG5lHW+qa4i0Rv02Jrp
 t7sn8Eo+Kop/hteSYKK3OjlmsKJvk5BNpyvtYEs2awmvUIhv8qRjB7up4S99KItOsAu0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLhUy-001XyV-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 09:27:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 037CE60B39;
 Sat, 28 Jan 2023 09:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CB3C433EF;
 Sat, 28 Jan 2023 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674898062;
 bh=4Dv7QkvdER9TZanR4lMkHN9joTX2h7mC+e7lcohFgbI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GjRuREBY9L0bvO/gx9+DDQqZKXHgGn6nDQ8XbVYfw3ZmV0aSdb58JCybzbnoPh5/T
 hCx/O0VRt1II2PR13pwLibEo8UXxn5Pb8r5JihHX3BOWMvJzg30b5hSi4OygArueEw
 go6vBMt9jSx/9h8IP65bWP+WwM9XWkBUooNr9oOL1aEznFIw8W9RyTM6rj/H7Uzf8C
 JRvTyTsFR4NLhVLq154FbC49yGvqP3IP2WWDfvoZsjrJ7e97Lr7H6am9JoR27lmfjP
 VsJYMy46jG0ByVmWgeojgKMRVsLpBjXTqRJv1Vzm0t2iwzILtgG/VzohWIfmocgJGp
 8DQSDWI68//Vg==
Message-ID: <d8f0f611-8281-6a55-cf17-6cfedb606802@kernel.org>
Date: Sat, 28 Jan 2023 17:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230120134029.69200-1-frank.li@vivo.com>
 <20230120134029.69200-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230120134029.69200-2-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/20 21:40, Yangtao Li wrote: > Disallow the value
 set beyond the range, and disallow to change > the value in lfs mode. IMO,
 it's better to merge this patch into 1/4. > > BTW, convert open code to use
 BIT(). Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLhUy-001XyV-Ct
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: add sanity check for ipu_policy
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

On 2023/1/20 21:40, Yangtao Li wrote:
> Disallow the value set beyond the range, and disallow to change
> the value in lfs mode.

IMO, it's better to merge this patch into 1/4.

> 
> BTW, convert open code to use BIT().

How about using one patch to change 1 << xx to BIT(xx) for all cases
of f2fs rather than one by one?

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.h |  1 +
>   fs/f2fs/sysfs.c   | 11 ++++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0b0eb8f03cba..d73e988566a5 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -681,6 +681,7 @@ enum {
>   	F2FS_IPU_ASYNC,
>   	F2FS_IPU_NOCACHE,
>   	F2FS_IPU_HONOR_OPU_WRITE,
> +	F2FS_IPU_MAX,
>   };
>   
>   #define F2FS_IPU_POLICY(name)					\
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index bdc761f36310..576e6416ffb9 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -452,7 +452,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	if (ret < 0)
>   		return ret;
>   #ifdef CONFIG_F2FS_FAULT_INJECTION
> -	if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
> +	if (a->struct_type == FAULT_INFO_TYPE && t >= BIT(FAULT_MAX))
>   		return -EINVAL;
>   	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
>   		return -EINVAL;
> @@ -706,6 +706,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "ipu_policy")) {
> +		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
> +			return -EINVAL;
> +		if (t >= BIT(F2FS_IPU_MAX))
> +			return -EINVAL;
> +		SM_I(sbi)->ipu_policy = (unsigned int)t;
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
