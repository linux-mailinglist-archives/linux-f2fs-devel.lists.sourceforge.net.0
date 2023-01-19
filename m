Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05094672EFF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 03:30:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIKgs-0005Qk-7l;
	Thu, 19 Jan 2023 02:30:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pIKgr-0005Qe-4H
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 02:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTOtSZCl0BUfyG8e6txO7qeNhfSV00fgo3eAjAMylsI=; b=KRriPTuIpOcEgyIfV/LV1qDHvS
 i4c7+nrILmpXl/OKXmtIUEOyT7riBNpP+5rBP6/BEzlLC9Z39DaLAK1wd3p7pJDgL0cRTx6cQlYM5
 MOoNAJYOSYXHpaSo4ySDcYIi22xBGm/TthTjtErkOx8nIe5RXx42wz24LtuJhRuiwfHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mTOtSZCl0BUfyG8e6txO7qeNhfSV00fgo3eAjAMylsI=; b=YqgMZZ9/CVQEKNPzj/mQ3QzrLz
 briovqXl2l3y2lQXeP9sXjap3jOQIE4stFR3+C0GIRgdsVzSe2UmSElgHRJoKSrofj506ayY3F28k
 vYtmRRliTgyPxIWkNNxRxFD9tMwTt11MJl8cHxf9Z0u21+/wC9cskbeU6aMOyU0nRUSA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIKgo-0001m2-Oe for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 02:30:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DE21B81FB6;
 Thu, 19 Jan 2023 02:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3E4C433EF;
 Thu, 19 Jan 2023 02:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674095399;
 bh=pN9R2E0B/Qjp/Xb3oCFgvcSd081HoaaZOUInpZCqutQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NGO84BP5hZkNvaFRTC4KLfYy6k7olcxM5LGOP+7a/PD7r5OUtPrM6gd9YOZvg3nau
 8zR5h5QsUESYw26U0m2qPJZvwgnTmj8zt4PyGaD+B0rm2dO3Rz2JJqkKWrzASaTSHG
 O0zIsvbN3xqDeeClY4prpV9P06rhhu4Sc4Mb4RZFUN9+wK2ympV/hAlrQU7EXEO9pI
 7hwYYr1Iy1KzrkB+L+Wb8/OfKNjoFTDBixREBllfJs3HDgsA+RaHJ1gys/99SWytPB
 f/N51kNlIp8e+cqDogwsWlRWBOe7aHTBfF7gc0rmpYKPPzptDq61T+ARkFWFi308Mo
 FALFQt7dqTqWA==
Date: Wed, 18 Jan 2023 18:29:57 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y8irJdc4vTCC9gKj@google.com>
References: <20230117131740.76597-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117131740.76597-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/17, Yangtao Li wrote: > This patch export below sysfs
 entries for better control cached > compress page count. > >
 /sys/fs/f2fs/<disk>/compress_watermark
 > /sys/fs/f2fs/<disk>/compress_percent > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pIKgo-0001m2-Oe
Subject: Re: [f2fs-dev] [PATCH] f2fs: export compress_percent and
 compress_watermark entries
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

On 01/17, Yangtao Li wrote:
> This patch export below sysfs entries for better control cached
> compress page count.
> 
> /sys/fs/f2fs/<disk>/compress_watermark
> /sys/fs/f2fs/<disk>/compress_percent
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 17 +++++++++++++++++
>  fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 75420c242cc4..920562742655 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -717,3 +717,20 @@ Description:	Controls background discard granularity of inner discard thread
>  		is smaller than granularity. The unit size is one block(4KB), now only
>  		support configuring in range of [0, 512].
>  		Default: 512
> +
> +what:		/sys/fs/f2fs/<disk>/compress_watermark
> +date:		january 2023
> +contact:	"yangtao li" <frank.li@vivo.com>
> +description:	when compress_cache is on, it controls free memory watermark
> +		in order to limit caching compress page. If free memory is lower
> +		than watermark, then deny caching compress page. The value should be in
> +		range of [0, 100], by default it was initialized as 20(%).
> +
> +what:		/sys/fs/f2fs/<disk>/compress_percent
> +date:		january 2023
> +contact:	"yangtao li" <frank.li@vivo.com>
> +description:	when compress_cache is on, it controls cached page
> +		percent(compress pages / free_ram) in order to limit caching compress page.
> +		If cached page percent exceed threshold, then deny caching compress page.
> +		The value should be in range of [0, 100], by default it was initialized
> +		as 20(%).
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index e396851a6dd1..37c6ef080f7e 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -598,6 +598,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		sbi->compr_new_inode = 0;
>  		return count;
>  	}
> +
> +	if (!strcmp(a->attr.name, "compress_percent")) {
> +		if (t > 100)

t=0 also doesn't make sense.

> +			return -EINVAL;
> +		*ui = t;
> +		return count;
> +	}
> +
> +	if (!strcmp(a->attr.name, "compress_watermark")) {
> +		if (t > 100)
> +			return -EINVAL;
> +		*ui = t;
> +		return count;
> +	}
>  #endif
>  
>  	if (!strcmp(a->attr.name, "atgc_candidate_ratio")) {
> @@ -932,6 +946,8 @@ F2FS_FEATURE_RO_ATTR(compression);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
>  #endif
>  F2FS_FEATURE_RO_ATTR(pin_file);
>  
> @@ -1038,6 +1054,8 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(compr_written_block),
>  	ATTR_LIST(compr_saved_block),
>  	ATTR_LIST(compr_new_inode),
> +	ATTR_LIST(compress_percent),
> +	ATTR_LIST(compress_watermark),
>  #endif
>  	/* For ATGC */
>  	ATTR_LIST(atgc_candidate_ratio),
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
