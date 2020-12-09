Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B43722D4645
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 17:04:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kn1x4-0005Gz-UV; Wed, 09 Dec 2020 16:04:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kn1x3-0005Gf-6N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 16:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FJaTTgvaJWkqOjWwMcScsnUqMoHQxY2/gCBuCuBJ0kE=; b=kkKtaYQQTkr9C1EUd0LF6FBh00
 VWByLBROBSnn86P4ZtQ+AsJl/xwy6Jj3YCx0yOA2Ouy+U3q3HdQxxXTzNE/D0AUmnZDxJwfgozvNE
 N2VF7ULflW+672E0ynGfPSsxbcrkn18CjVAMDX3G1lIzMWL9eY2KftKUTdFX63LT5+Fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FJaTTgvaJWkqOjWwMcScsnUqMoHQxY2/gCBuCuBJ0kE=; b=hYQvyvbmk0529PJPSNXWkDWNZe
 /jXQlPQoHY8nMNwEI3SwyVL5qBi098hx2Xw0jqW3EExt1a1gSHgkXMaUtB5hPR3fo8DW3ZW8Z6E/Z
 AFn035aKxipaRJK682uCty1Y+2u+cLEEkc1EVbcnd7gLlBq6CMmjTIdbuIabhH92o+KU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kn1wq-005Bog-0u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 16:04:25 +0000
Date: Wed, 9 Dec 2020 08:04:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607529846;
 bh=NtDeZWyjkDu4jWhhZPvnO8Q28JxAL5KgBjE0Xw0loxM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=fa79wWW6HqVFAWyF0PPeCMB3jzRdDsH3bc6mtfiCGvW62HvPMHdoz8v9swq3maXQT
 R2i5D78ex/QFcTssEFv631HS0YRIw9JQdsGKdbOZcfCCxc+ht9Sr4RDheCOo34jVuj
 040QklunRogmVq+Q/9Xhj90k/y3JcS6FHeduPGIJKWcxYwtkCo2Nc+XqMHVIkIgD8X
 +rHSvC/uhAnoFX0ZYPXG2SOxZNAnPigqJ+l4OvR+GECSmtVJmyWGpzc4sa2xOVNzQE
 B8b4O6UWD7KCxPLcw3wqBoUGdz12OA1G21/gz/Nr3YAfkM4W7AzSL5ilLswOscfxL4
 F7SM2GHNISjxw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9D1dXVwKFvfHpP9@google.com>
References: <20201209084328.30416-1-yuchao0@huawei.com>
 <20201209084328.30416-5-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209084328.30416-5-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kn1wq-005Bog-0u
Subject: Re: [f2fs-dev] [PATCH RESEND v2 5/5] f2fs: introduce sb_status
 sysfs node
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

On 12/09, Chao Yu wrote:
> Introduce /sys/fs/f2fs/<devname>/stat/sb_status to show superblock
> status in real time as below:
> 
> IS_DIRTY:		no
> IS_CLOSE:		no
> IS_SHUTDOWN:		no
> IS_RECOVERED:		no
> IS_RESIZEFS:		no
> NEED_FSCK:		no
> POR_DOING:		no
> NEED_SB_WRITE:		no
> NEED_CP:		no
> CP_DISABLED:		no
> CP_DISABLED_QUICK:	no
> QUOTA_NEED_FLUSH:	no
> QUOTA_SKIP_FLUSH:	no
> QUOTA_NEED_REPAIR:	no

Wait, this is breaking a sysfs rule where one entry should show one value.

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  5 ++++
>  fs/f2fs/sysfs.c                         | 36 +++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 3dfee94e0618..57ab839dc3a2 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -377,3 +377,8 @@ Description:	This gives a control to limit the bio size in f2fs.
>  		Default is zero, which will follow underlying block layer limit,
>  		whereas, if it has a certain bytes value, f2fs won't submit a
>  		bio larger than that size.
> +
> +What:		/sys/fs/f2fs/<disk>/stat/sb_status
> +Date:		December 2020
> +Contact:	"Chao Yu" <yuchao0@huawei.com>
> +Description:	Show status of f2fs superblock in real time.
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index ebca0b4961e8..1b85e6d16a94 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -101,6 +101,40 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
>  				sbi->sectors_written_start) >> 1)));
>  }
>  
> +#define	SB_STATUS(s)	(s ? "yes" : "no")
> +static ssize_t sb_status_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sprintf(buf, "IS_DIRTY:		%s\n"
> +				"IS_CLOSE:		%s\n"
> +				"IS_SHUTDOWN:		%s\n"
> +				"IS_RECOVERED:		%s\n"
> +				"IS_RESIZEFS:		%s\n"
> +				"NEED_FSCK:		%s\n"
> +				"POR_DOING:		%s\n"
> +				"NEED_SB_WRITE:		%s\n"
> +				"NEED_CP:		%s\n"
> +				"CP_DISABLED:		%s\n"
> +				"CP_DISABLED_QUICK:	%s\n"
> +				"QUOTA_NEED_FLUSH:	%s\n"
> +				"QUOTA_SKIP_FLUSH:	%s\n"
> +				"QUOTA_NEED_REPAIR:	%s\n",
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_DIRTY)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_CLOSE)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_RECOVERED)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_RESIZEFS)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_FSCK)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_POR_DOING)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_CP)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_CP_DISABLED)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)),
> +			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)));
> +}
> +
>  static ssize_t features_show(struct f2fs_attr *a,
>  		struct f2fs_sb_info *sbi, char *buf)
>  {
> @@ -711,7 +745,9 @@ static struct attribute *f2fs_feat_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(f2fs_feat);
>  
> +F2FS_GENERAL_RO_ATTR(sb_status);
>  static struct attribute *f2fs_stat_attrs[] = {
> +	ATTR_LIST(sb_status),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs_stat);
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
