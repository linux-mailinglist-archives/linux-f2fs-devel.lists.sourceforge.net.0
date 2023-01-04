Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CCC65CBDC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 03:25:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCtTN-0002T8-Cf;
	Wed, 04 Jan 2023 02:25:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pCtTL-0002T1-VL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 02:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WhSQLQ9dypMheOZRekpu2UAZu53dZZ4woN14slyjKas=; b=RQ1UyVBPD5oeqv55iorjMmzfSw
 y1QL6Jl4TBU2K0biICCI6Ye7hxmtncCeWgJ56ar9e/tGnP0iYVgzb62AXWjEJiGZbPjRgyYDCbw8E
 rIwg9M/q8cFuQZF5XeIIK49dRYFqHdCI/6ISTpFbTECZuPnH51EyTV738mROdDmaHzHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WhSQLQ9dypMheOZRekpu2UAZu53dZZ4woN14slyjKas=; b=MikKswZvW7koZ/oUZMCMhShSpp
 qqLsxaCsgqzO+mBy6gloDnprJYQHkhgVXBqW7dLRU+TA6+zgepBNRYqMgkE82XhYEFHQ05E4OH5VL
 NfFKewCmZIPSoUKlGMakdrZsfqNxZbFg46IQE9kSVDigTaGQH3imI3Ajm8uKcM5JwHGI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCtTH-003yhe-EF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 02:25:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E3CDB811AC;
 Wed,  4 Jan 2023 02:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB1DC433EF;
 Wed,  4 Jan 2023 02:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672799129;
 bh=oK2mDCxzprTJCQ6Rr1YJkLumKen+sr1SehohaD2wNYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MinH0ScOgSHfP1f9X11R3VKxQOT+0oCHAfQJjH6XS0wbHlObm4gu2IqDWW4hGH2WG
 TQ9Ox6If7ucCXFSqpvAvLVfA3CcudhAO/qCztYytMeA4chtLjIVhG9kUQqgmd44c/w
 olShQlxY6ttbVht3c0KFWp7Tm8Egyisq5RIJmS4cwtXnCN5izwJmYqT7qJxgW/tSeu
 cMSy3davXhJm3GLmZy3NJnkDeILWuGpqlZEk3wQNzbXJjWwcXhcmCLLigAtWq+EET9
 6uIX/ZChxKZQUHe2I0oUrKdNWpzjpE7rwQUSt7fcRdC4tl9zJrTZ6fCMbWTmaUeaFx
 7H60HgxUtphMw==
Date: Tue, 3 Jan 2023 18:25:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y7TjmBqDo9IgUaZw@google.com>
References: <20221212140540.5187-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212140540.5187-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12,
 Yangtao Li wrote: > The current discard_io_aware_gran
 is a fixed value, change it to be > configurable through the sys node. >
 > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- > v2: > - [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCtTH-003yhe-EF
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce discard_io_aware_gran
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

On 12/12, Yangtao Li wrote:
> The current discard_io_aware_gran is a fixed value, change it to be
> configurable through the sys node.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> - allow 0
>  Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
>  fs/f2fs/f2fs.h                          |  3 +++
>  fs/f2fs/segment.c                       |  3 ++-
>  fs/f2fs/sysfs.c                         | 13 +++++++++++++
>  4 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 9e3756625a81..7b6cd4cf40ce 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -669,3 +669,12 @@ Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>  Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
>  		the data blocks as warm. By default it was initialized as 2621440 blocks
>  		(equals to 10GB).
> +
> +What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
> +Date:		December 2022
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Controls background discard granularity of inner discard thread
> +		when is not in idle. Inner thread will not issue discards with size that
> +		is smaller than granularity. The unit size is one block(4KB), now only
> +		support configuring in range of [0, 512].
> +		Default: 512
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e8953c3dc81a..bd1430d09c6d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -332,6 +332,8 @@ struct discard_entry {
>  #define DEFAULT_DISCARD_GRANULARITY		16
>  /* default maximum discard granularity of ordered discard, unit: block count */
>  #define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
> +/* default minimum granularity discard not be aware of I/O, unit: block count */
> +#define DEFAULT_IO_AWARE_DISCARD_GRANULARITY	512

It seems we don't need to add another dependency between this and MAX_PLIST_NUM.
Can we use one?

>  
>  /* max discard pend list number */
>  #define MAX_PLIST_NUM		512
> @@ -410,6 +412,7 @@ struct discard_cmd_control {
>  	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
>  	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
>  	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
> +	unsigned int discard_io_aware_gran; /* minimum discard granularity not be aware of I/O */
>  	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
>  	unsigned int discard_granularity;	/* discard granularity */
>  	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a9099a754dd2..f4bf39ee31c6 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1060,7 +1060,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>  	dpolicy->granularity = granularity;
>  
>  	dpolicy->max_requests = dcc->max_discard_request;
> -	dpolicy->io_aware_gran = MAX_PLIST_NUM;
> +	dpolicy->io_aware_gran = dcc->discard_io_aware_gran;
>  	dpolicy->timeout = false;
>  
>  	if (discard_type == DPOLICY_BG) {
> @@ -2066,6 +2066,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>  	if (!dcc)
>  		return -ENOMEM;
>  
> +	dcc->discard_io_aware_gran = DEFAULT_IO_AWARE_DISCARD_GRANULARITY;
>  	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
>  	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
>  	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 83a366f3ee80..5ab42da5f2a3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -473,6 +473,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
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
>  	if (!strcmp(a->attr.name, "discard_granularity")) {
>  		if (t == 0 || t > MAX_PLIST_NUM)
>  			return -EINVAL;
> @@ -825,6 +836,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
>  F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
>  F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
>  F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
> +F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
>  F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
>  F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
>  F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
> @@ -960,6 +972,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(min_discard_issue_time),
>  	ATTR_LIST(mid_discard_issue_time),
>  	ATTR_LIST(max_discard_issue_time),
> +	ATTR_LIST(discard_io_aware_gran),
>  	ATTR_LIST(discard_urgent_util),
>  	ATTR_LIST(discard_granularity),
>  	ATTR_LIST(max_ordered_discard),
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
