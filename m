Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC1160C4B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:06:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onE15-0000U9-Ek;
	Tue, 25 Oct 2022 07:06:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onE13-0000U3-1x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WAyY/b1ZtXOx9AJrLO8uvYcSYL/S6Q2z1exvWQboKQ8=; b=aIIbT+rn2C2eOWzyGmLXa7wtQa
 LKT1i9WorcIEVklcCKE1962I9sXcscLvovyRES9wvGF88qBbkCxbBBtIVFHsRqYjhwGW0C1mkgNCs
 8mo9cs6TQB5XUkrlg3y4njNgIU3CoOyn/d+GBwgwFbHITuv+bSlFyqbR4TJLJf3eUseI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WAyY/b1ZtXOx9AJrLO8uvYcSYL/S6Q2z1exvWQboKQ8=; b=k8lbRPruWgCHnk8r/vvdYo3GEK
 if2g7UHcaCWoZv2x5P8O5FBhUIPNzhArvrcpu3uYlJqJpOLM0BiDyfanCWV6JgPC/kyw4bAD2k8Rc
 c64hZDs4KLjS6i5M+wjIG8uzm7BKNIqvorM3RYxYIZLvstC06K3Yp5pHpU7BpBDVxXtQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onE12-0001sC-AA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:06:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F54261787;
 Tue, 25 Oct 2022 07:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449DAC433D7;
 Tue, 25 Oct 2022 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666681573;
 bh=FK2hLWqW8o/+ohg5F3oci1iOm+qnjC9Ne0BOHtIr+dQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ezhCLrJW1TXHHe7innJlISBXAUSWMF8Q076pZF7PjLvEg7DQWWJZXIXxyZ6NMwxXa
 WLqbMIcmqgH3AAT8BHU1J0fI0s4HJPBGh9G0/ELTdaeTTGJ86Iyt/edmWFEPZMWWFW
 DWEC7QHe2/KDJvkPYCo88lbG0ZbyR5U87PVWCiapSoTGGKJvR2E47Z9Nw2IkD8xqsp
 6JAjpZPajs/ZSDu4oJRl6G7ylfyvIIwKmBhHuJuFRSlIapX642cvBObqZZFk9+wlq+
 VSakJm1hdq32hyaUYYzWFwuvz1j72k99bO+UMvd70CCYj/WBpKMPORCcYSMkTmNV0J
 EdvlblEuaC8CQ==
Message-ID: <63ebd06c-9b1c-a390-4a7a-b24b1ed647c5@kernel.org>
Date: Tue, 25 Oct 2022 15:06:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221021102806.25459-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221021102806.25459-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 18:28,
 Yangtao Li wrote: > The current max_order_discard
 is a fixed value, max_ordered_discard? > change it to be configurable through
 the sys node. > > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- >
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 6 ++++++ > fs/f2fs/f2fs.h | 3 +++ > fs/f2fs/seg [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onE12-0001sC-AA
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce max_order_discard sysfs node
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

On 2022/10/21 18:28, Yangtao Li wrote:
> The current max_order_discard is a fixed value,

max_ordered_discard?

> change it to be configurable through the sys node.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
>   fs/f2fs/f2fs.h                          |  3 +++
>   fs/f2fs/segment.c                       |  3 ++-
>   fs/f2fs/sysfs.c                         | 11 +++++++++++
>   4 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 11ce4a8bdacd..8faef2078a7a 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -99,6 +99,12 @@ Description:	Controls the issue rate of discard commands that consist of small
>   		checkpoint is triggered, and issued during the checkpoint.
>   		By default, it is disabled with 0.
>   
> +What:		/sys/fs/f2fs/<disk>/max_order_discard
> +Date:		October 2022
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Controls the maximum ordered discard, the unit size is one block(4KB).
> +		By default, it is disabled with 16.

By default, it is disabled with 16

Set it to 16 by default?

Thanks,

> +
>   What:		/sys/fs/f2fs/<disk>/max_discard_request
>   Date:		December 2021
>   Contact:	"Konstantin Vyshetsky" <vkon@google.com>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c444f3f86608..070dee37b915 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -330,6 +330,8 @@ struct discard_entry {
>   
>   /* default discard granularity of inner discard thread, unit: block count */
>   #define DEFAULT_DISCARD_GRANULARITY		16
> +/* default maximum discard granularity of ordered discard, unit: block count */
> +#define DEFAULT_MAX_ORDER_DISCARD_GRANULARITY	16
>   
>   /* max discard pend list number */
>   #define MAX_PLIST_NUM		512
> @@ -409,6 +411,7 @@ struct discard_cmd_control {
>   	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
>   	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
>   	unsigned int discard_granularity;	/* discard granularity */
> +	unsigned int max_order_discard; /* maximum discard granularity issued by lba order */
>   	unsigned int undiscard_blks;		/* # of undiscard blocks */
>   	unsigned int next_pos;			/* next discard position */
>   	atomic_t issued_discard;		/* # of issued discard */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index acf3d3fa4363..921ec17a40ce 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1448,7 +1448,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   		if (i + 1 < dpolicy->granularity)
>   			break;
>   
> -		if (i < DEFAULT_DISCARD_GRANULARITY && dpolicy->ordered)
> +		if (i < dcc->max_order_discard && dpolicy->ordered)
>   			return __issue_discard_cmd_orderly(sbi, dpolicy);
>   
>   		pend_list = &dcc->pend_list[i];
> @@ -2046,6 +2046,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   		return -ENOMEM;
>   
>   	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
> +	dcc->max_order_discard = DEFAULT_MAX_ORDER_DISCARD_GRANULARITY;
>   	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
>   		dcc->discard_granularity = sbi->blocks_per_seg;
>   	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 555849d4c744..81f628aed2e5 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -487,6 +487,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "max_order_discard")) {
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
> @@ -801,6 +810,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
> +F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_order_discard, max_order_discard);
>   F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
> @@ -931,6 +941,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(mid_discard_issue_time),
>   	ATTR_LIST(max_discard_issue_time),
>   	ATTR_LIST(discard_granularity),
> +	ATTR_LIST(max_order_discard),
>   	ATTR_LIST(pending_discard),
>   	ATTR_LIST(batched_trim_sections),
>   	ATTR_LIST(ipu_policy),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
