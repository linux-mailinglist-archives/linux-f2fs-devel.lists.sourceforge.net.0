Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F7665D21
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 14:56:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFbaA-0006WV-Ei;
	Wed, 11 Jan 2023 13:55:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFba7-0006WA-Sn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qd010XIRbsarHOLftg7PVicVxwbYknXgZxsl+Oc4fS4=; b=cJbtNH/luzt+8VsqjentYthWYc
 WqFHKbP9mRH6uoDjfpN6hgW/kQi9U/4wx8YdoAVkaukNqw2wv+Du7KSM9lYiK4xE4113v7lXMPSwz
 GzEu1uxlcLN07P9x5cy9kjb2jHEFqUhRqFGn3HfJZHWrfA7dGkiftQZUOxPxzeZNC8KQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qd010XIRbsarHOLftg7PVicVxwbYknXgZxsl+Oc4fS4=; b=jVwcrgWIpP5igwNzi9D5urXlR3
 cvt0vAgGu3KrSQfV6j2LCpXlPxmSqcUyEVLPAKxlLOrnPX1+Bo3+D3XcSCymoqs9qQtJKGFlw+yRr
 aVdyyAlRVCaUCl5m9ktllyCJqEV6s3yimiCm8fkdcOHz8Pd/JrIJeMaokFSX7ePVIMN0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFba0-00052a-QY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:55:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E71EB81BFA;
 Wed, 11 Jan 2023 13:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52567C433EF;
 Wed, 11 Jan 2023 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673445341;
 bh=a2ovFh3r2lNNdTC/NOVqzd3cJRBGKn8Cp6O4v6mIBVE=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=nyXFaNp6YQWRR2UMBvo0Wj8LbMPVLV3Kn5SHKmvYP3KkZFXRRUI/eJEATOQw76A92
 wNzuc5m4HQoerCNAeKmt72+is7yhM8SbqyAT3msfToHRijnQeNRBOnMAa1aVm+Jk6P
 wUM/O/i93rvEnGsw15mktvAteHtOk0oBtOQ+SgubH2YiiKVGtCi0hyWdT986BfMMIz
 GbzVylChh+tCDga+qqbo+iNKvNgNTOKyziOSvv6nZmOqxpUijxIwIi9ZqOgspWYdyw
 yBwAZDWPM1Gp/O1eIT2L9oS+9jLNUjPbSXS19y0LhQVjnZt1avpyzEzU/nNc/wnzkC
 zfLbshTe3Sg7w==
Message-ID: <b5868aa5-7b48-97db-bdbf-0a0d0adaec14@kernel.org>
Date: Wed, 11 Jan 2023 21:55:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230104114029.25689-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230104114029.25689-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/4 19:40,
 Yangtao Li wrote: > The current discard_io_aware_gran
 is a fixed value, change it to be > configurable through the sys node. >
 > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFba0-00052a-QY
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce discard_io_aware_gran
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/4 19:40, Yangtao Li wrote:
> The current discard_io_aware_gran is a fixed value, change it to be
> configurable through the sys node.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3: remove DEFAULT_IO_AWARE_DISCARD_GRANULARITY
>   Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
>   fs/f2fs/f2fs.h                          |  1 +
>   fs/f2fs/segment.c                       |  3 ++-
>   fs/f2fs/sysfs.c                         | 13 +++++++++++++
>   4 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index aaa379bb8a8f..75420c242cc4 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -708,3 +708,12 @@ Description:	Support configuring fault injection type, should be
>   		FAULT_LOCK_OP            0x000020000
>   		FAULT_BLKADDR            0x000040000
>   		===================      ===========
> +
> +What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
> +Date:		January 2023
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Controls background discard granularity of inner discard thread
> +		when is not in idle. Inner thread will not issue discards with size that
> +		is smaller than granularity. The unit size is one block(4KB), now only
> +		support configuring in range of [0, 512].
> +		Default: 512

How about appending below comments to descirbe the semantics for two
special value.

By default, the value is 512, all discard IOs will be interrupted
by other inflight IO; it can be set to 0, then IO aware functionality
will be disabled.

Thanks,

> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0a24447472db..cf60221d084e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -409,6 +409,7 @@ struct discard_cmd_control {
>   	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
>   	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
>   	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
> +	unsigned int discard_io_aware_gran; /* minimum discard granularity not be aware of I/O */
>   	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
>   	unsigned int discard_granularity;	/* discard granularity */
>   	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 34e9dc4df5bb..d988d83108b2 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1059,7 +1059,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>   	dpolicy->granularity = granularity;
>   
>   	dpolicy->max_requests = dcc->max_discard_request;
> -	dpolicy->io_aware_gran = MAX_PLIST_NUM;
> +	dpolicy->io_aware_gran = dcc->discard_io_aware_gran;
>   	dpolicy->timeout = false;
>   
>   	if (discard_type == DPOLICY_BG) {
> @@ -2063,6 +2063,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   	if (!dcc)
>   		return -ENOMEM;
>   
> +	dcc->discard_io_aware_gran = MAX_PLIST_NUM;
>   	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
>   	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
>   	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 805b632a3af0..e396851a6dd1 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -473,6 +473,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "discard_io_aware_gran")) {
> +		if (t > MAX_PLIST_NUM)
> +			return -EINVAL;
> +		if (!f2fs_block_unit_discard(sbi))
> +			return -EINVAL;
> +		if (t == *ui)
> +			return count;
> +		*ui = t;
> +		return count;
> +	}
> +
>   	if (!strcmp(a->attr.name, "discard_granularity")) {
>   		if (t == 0 || t > MAX_PLIST_NUM)
>   			return -EINVAL;
> @@ -825,6 +836,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
> +F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
> @@ -960,6 +972,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(min_discard_issue_time),
>   	ATTR_LIST(mid_discard_issue_time),
>   	ATTR_LIST(max_discard_issue_time),
> +	ATTR_LIST(discard_io_aware_gran),
>   	ATTR_LIST(discard_urgent_util),
>   	ATTR_LIST(discard_granularity),
>   	ATTR_LIST(max_ordered_discard),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
