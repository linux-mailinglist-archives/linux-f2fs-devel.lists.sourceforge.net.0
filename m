Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA860C5D4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:50:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onEhU-00021b-Hh;
	Tue, 25 Oct 2022 07:50:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onEhM-00021S-Tg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rOxLcovKLzkHfc0aVAUS+yZuw8JXRRnSa6BXctPwwNs=; b=JnwuEoLBRSHKxlTFRQhb9/WHyw
 TzXTuj4IV6Pl2dRvMaq6kwhK5lw9Q2lzkSJXE5aHQSqafh8AkuxP4hzai6NQKhe9TBRrf2tQfAHiW
 r94Ja1vli43LosCJkWM7lw9q6H3VO03W/0GOjpDwbCL48hdxu751XVvnAjKlKFTV7uiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rOxLcovKLzkHfc0aVAUS+yZuw8JXRRnSa6BXctPwwNs=; b=QlDTvsmPJMCXavKyF07EcG0rem
 oEGCEDPHzWUuLgLLr+pwAiHFSpL0/DX+1n61ssDXXmjF/ozUIGrK7ksOIshrtiL0OZMVShwUetvok
 9qz6gezRszLJiogzUCVl7q2KdtXpB3iogIiwvrGLTEo+PL+phC4IWhwIRHHy7sxtRq8w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onEhL-0004FA-Vp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:50:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C13CB81A99;
 Tue, 25 Oct 2022 07:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301FEC433D6;
 Tue, 25 Oct 2022 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666684200;
 bh=/lF9L48lkqUnyEQE/8PiJ5Lu/Nje0pWZJAMkQ74xJog=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QgzibIlRQD7cmZQti9XdpK5m0PM1+mLS4tP3oktXVHCDEPEXNjksCoSa4gNEM1Fb8
 9nT47U0qbGL0cVVs9OpV0Rt0OjlQZT0h7izbu8Ry0jnuT+3/AFwxoiTwSGGVhjUoBt
 14nW9Q53OoB6BBiQNaRgHzKDqWApMPzFThstA9HwL0/SgqO1VSWaJikrea3X9ImIXk
 LTibl8KfTxOm3b3CNGRSYuCoGtRTxtqKX/lZu2EbEbEonh/tHQDutD94CzO+UFDAI2
 JnMlgY7MiIzfj/QAxH5sMdYID7zLd4bdkd3dbB8n++LXgK11Ba+ULJ6h/nerEsMSa7
 dVQP3S3DWLp/Q==
Message-ID: <86e95d5f-69fe-ed9b-c0d8-dd35d97f1a7f@kernel.org>
Date: Tue, 25 Oct 2022 15:49:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025073503.43935-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025073503.43935-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 15:35,
 Yangtao Li wrote: > The current max_ordered_discard
 is a fixed value, > change it to be configurable through the sys node. >
 > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onEhL-0004FA-Vp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce max_ordered_discard sysfs
 node
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

On 2022/10/25 15:35, Yangtao Li wrote:
> The current max_ordered_discard is a fixed value,
> change it to be configurable through the sys node.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> - s/order/ordered
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
>   fs/f2fs/f2fs.h                          |  3 +++
>   fs/f2fs/segment.c                       |  3 ++-
>   fs/f2fs/sysfs.c                         | 11 +++++++++++
>   4 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 859c4e53a846..8faf7b1274df 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -99,6 +99,12 @@ Description:	Controls the issue rate of discard commands that consist of small
>   		checkpoint is triggered, and issued during the checkpoint.
>   		By default, it is disabled with 0.
>   
> +What:		/sys/fs/f2fs/<disk>/max_ordered_discard
> +Date:		October 2022
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Controls the maximum ordered discard, the unit size is one block(4KB).
> +		Set it to 16 by default.
> +
>   What:		/sys/fs/f2fs/<disk>/max_discard_request
>   Date:		December 2021
>   Contact:	"Konstantin Vyshetsky" <vkon@google.com>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 2bad69cf9fd9..91c3fc5383f1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -330,6 +330,8 @@ struct discard_entry {
>   
>   /* default discard granularity of inner discard thread, unit: block count */
>   #define DEFAULT_DISCARD_GRANULARITY		16
> +/* default maximum discard granularity of ordered discard, unit: block count */
> +#define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
>   
>   /* max discard pend list number */
>   #define MAX_PLIST_NUM		512
> @@ -409,6 +411,7 @@ struct discard_cmd_control {
>   	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
>   	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
>   	unsigned int discard_granularity;	/* discard granularity */
> +	unsigned int max_ordered_discard; /* maximum discard granularity issued by lba order */

	unsigned int max_ordered_discard; 	/* maximum discard granularity issued by lba order */

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


>   	unsigned int undiscard_blks;		/* # of undiscard blocks */
>   	unsigned int next_pos;			/* next discard position */
>   	atomic_t issued_discard;		/* # of issued discard */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index acf3d3fa4363..dfa9dc3a1bc3 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1448,7 +1448,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   		if (i + 1 < dpolicy->granularity)
>   			break;
>   
> -		if (i < DEFAULT_DISCARD_GRANULARITY && dpolicy->ordered)
> +		if (i < dcc->max_ordered_discard && dpolicy->ordered)
>   			return __issue_discard_cmd_orderly(sbi, dpolicy);
>   
>   		pend_list = &dcc->pend_list[i];
> @@ -2046,6 +2046,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   		return -ENOMEM;
>   
>   	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
> +	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
>   	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
>   		dcc->discard_granularity = sbi->blocks_per_seg;
>   	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 2b1c653b37cf..e2325d8dcbb1 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -483,6 +483,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "max_ordered_discard")) {
> +		if (t == 0 || t > MAX_PLIST_NUM)
> +			return -EINVAL;
> +		if (!f2fs_block_unit_discard(sbi))
> +			return -EINVAL;
> +		*ui = t;
> +		return count;
> +	}
> +
>   	if (!strcmp(a->attr.name, "migration_granularity")) {
>   		if (t == 0 || t > sbi->segs_per_sec)
>   			return -EINVAL;
> @@ -793,6 +802,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
> +F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
>   F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
> @@ -923,6 +933,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(mid_discard_issue_time),
>   	ATTR_LIST(max_discard_issue_time),
>   	ATTR_LIST(discard_granularity),
> +	ATTR_LIST(max_ordered_discard),
>   	ATTR_LIST(pending_discard),
>   	ATTR_LIST(batched_trim_sections),
>   	ATTR_LIST(ipu_policy),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
