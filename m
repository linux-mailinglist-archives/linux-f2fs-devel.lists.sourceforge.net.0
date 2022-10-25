Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C760C200
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 04:55:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onA6H-0000iI-6L;
	Tue, 25 Oct 2022 02:55:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onA6E-0000i7-Rs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 02:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlpO2LbgeRhrFV2aUVRz6OA7uNLkV67LOhGzbiTXix0=; b=E3v/oJiZMT8hlPLAIW7UY3pXyJ
 vBcBcGYkdr5U9L1v2aJIi3CkEILNk+7+vfl8OD3pbhH8QGROMxny5eJuv+q1DjX95tio9E9cMQReV
 NPnPqfFjjbcvYoQ/wzT+fh/7DtyleSCGzgSTkcmFcOLGu1HXeGJEuXulViSYxwWoekns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hlpO2LbgeRhrFV2aUVRz6OA7uNLkV67LOhGzbiTXix0=; b=ah3nn+3XAOYFUOXSDggDXTewxm
 eDLTH71TIDF0HVV/30ePvHNLYNfWPGsbzd6GufjPu7+mmzhdetwwc+FJad6J0vT8tnkKIj5pEf3wq
 ltWyO3bm680KIiZz67hOYSQq5UEatr5BocE3nGdKe+QaAPhMnIGv8xUoEnN5mTkwp6JA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onA6E-00GJVG-9W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 02:55:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B4A4616FE;
 Tue, 25 Oct 2022 02:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE55C433D7;
 Tue, 25 Oct 2022 02:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666666518;
 bh=Muo9o2epnSLH7SzCZQsP556aks1UdauUOFGhRbrdGo0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ppmycjqVUF3ze848ZhKyx4+YzVUHg3kN6VNFcAS1lZxhmXOeP3cLOuQuSkDEBRQv0
 Ru7Aqr80r68MK/BiNXz7+SRjwjyfjaSVJn1yRw6iM6DO9T6QV1INpbh6htCPo/QHY6
 3D/GpvZZHUQaQtlEU5AOfhD5bZJnLB2oH28ygn7kBHGtktRhSkrgj65Pl83gqGTa/k
 ew0w5THqCfiI6UE6UYTXA1yAp54hgMd9oLTDycd+qq5WOi3/wIf5UyOGY8BXkizn7n
 dkRZT2G7M21AHNuHOYIPH5RW9wSmB/Z+/N8HhAu7sB+kNEapsS55UOgV3Qn4G22TvL
 1hw9LikDwmmdQ==
Message-ID: <a3644a20-731f-70b8-a21f-de6ab6e7bb6c@kernel.org>
Date: Tue, 25 Oct 2022 10:55:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221021153825.79614-1-frank.li@vivo.com>
 <20221021153825.79614-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221021153825.79614-2-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 23:38, Yangtao Li wrote: > This testing sysfs
 node has been deprecated for a long time, > let's remove it. Can you please
 merge this patch w/ [PATCH 1/2] f2fs: fix to correct invalid
 batched_trim_sections node 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onA6E-00GJVG-9W
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: remove batched_trim_sections node
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

On 2022/10/21 23:38, Yangtao Li wrote:
> This testing sysfs node has been deprecated for a long time,
> let's remove it.

Can you please merge this patch w/

[PATCH 1/2] f2fs: fix to correct invalid batched_trim_sections node

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/f2fs.h  | 3 ---
>   fs/f2fs/sysfs.c | 5 -----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6355a5683b7..9c480835adab 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1062,9 +1062,6 @@ struct f2fs_sm_info {
>   	/* a threshold to reclaim prefree segments */
>   	unsigned int rec_prefree_segments;
>   
> -	/* for batched trimming */
> -	unsigned int trim_sections;		/* # of sections to trim */
> -
>   	struct list_head sit_entry_set;	/* sit entry set list */
>   
>   	unsigned int ipu_policy;	/* in-place-update policy */
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 3005e2783a25..926b7a844362 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -488,9 +488,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   			return -EINVAL;
>   	}
>   
> -	if (!strcmp(a->attr.name, "batched_trim_sections"))
> -		return -EINVAL;
> -
>   	if (!strcmp(a->attr.name, "gc_urgent")) {
>   		if (t == 0) {
>   			sbi->gc_mode = GC_NORMAL;
> @@ -790,7 +787,6 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
>   F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
>   F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
> -F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
>   F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
> @@ -919,7 +915,6 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(max_discard_issue_time),
>   	ATTR_LIST(discard_granularity),
>   	ATTR_LIST(pending_discard),
> -	ATTR_LIST(batched_trim_sections),
>   	ATTR_LIST(ipu_policy),
>   	ATTR_LIST(min_ipu_util),
>   	ATTR_LIST(min_fsync_blocks),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
