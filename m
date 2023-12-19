Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA9818057
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 05:00:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFRHJ-0000T2-TQ;
	Tue, 19 Dec 2023 04:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFRHI-0000Sr-MR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 04:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2etIvVwZRaBuiln0Qjgctz44QFw9grCX9mim7HsMKxY=; b=OGzOHjiIDI1OzI5eo8ScS9KWuJ
 H7dQXe4bU1fkvVbSVQP+k4LbSwtL6ipEHGk/Wt2OKzGb3VP9x1HKBWTYd/Es0FMqW8ro/mF+RwY/9
 jx+bR+ezPAbBCq6i2F1CgmEzjBtsVUmE8AW405x2744VbApcuMXFWY52DkkJDtBPsf/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2etIvVwZRaBuiln0Qjgctz44QFw9grCX9mim7HsMKxY=; b=QOL7FL+cWcecUzKMo3FMvtbzL1
 HEMIB/mKKz7kuEaK/hJ6lKQNVv1Sz0gFTMJ0adMv8QWZUg7TV+q3xp8SLinaL5bhhWKsQT4UNnRXX
 S+QT4tRL+8O7VSAY9vX3/HAW7QFjvgZz7gwQzQqUPH3VBW6MH2eCWzFgd8qEQC9l6w1o=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFRHE-0001wM-ET for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 04:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96A49CE1370;
 Tue, 19 Dec 2023 04:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BEAC433C8;
 Tue, 19 Dec 2023 03:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702958400;
 bh=X9vOHMO2c6gHb12PdnxbGCbecCiIn2ZXcfJQ210ch5Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UN0y24/C2FMO9YNlISh0hSmm2JZPCbcGiwDPmDBrQxW73rSXny5dz34aacmjZyk5r
 7nhbYFZrMckqQtl+VJBNzVk4dcG5jNk3sp3q3Tfz0zblrJfJgmFRTTWG5kKVl3JNRE
 0I8tcT9hlpgELWA/Zg6KZ0Vkrqr5yT9bEwq2xxFKC7kkqh4Dd3SDKBnJdybNJEJ92U
 W/eU9fUwQ2Skfixq9TTinVc2Q7pUQkwgvSdk/4SbqKJb39YsJdIUw44/z79mTPzot7
 nTv2CuzgG+mYnJJNpGruFiflt1ySgx8EbDaY/wVXvv+rHrv9px/TZE35o6CAE5uWaU
 hamzAg//lIyzA==
Message-ID: <6c553a75-4842-4b28-9725-ba5e297ff793@kernel.org>
Date: Tue, 19 Dec 2023 11:59:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1702952464-22050-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1702952464-22050-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/19 10:21,
 Zhiguo Niu wrote: > The current pending_discard
 attr just only shows the discard_cmd_cnt > information. More discard status
 can be shown so that we can check > them through sysfs [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFRHE-0001wM-ET
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: show more discard status by sysfs
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/19 10:21, Zhiguo Niu wrote:
> The current pending_discard attr just only shows the discard_cmd_cnt
> information. More discard status can be shown so that we can check
> them through sysfs when needed.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> changes of v2: Improve the patch according to Chao's suggestions.
> changes of v3: Add a blank line for easy reading.
> changes of v4: Split to three entries
> ---
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 15 +++++++++++++++
>   fs/f2fs/sysfs.c                         | 33 +++++++++++++++++++++++++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 4f1d4e6..606a298 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -159,6 +159,21 @@ Date:		November 2021
>   Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
>   Description:	Shows the number of pending discard commands in the queue.
>   
> +What:           /sys/fs/f2fs/<disk>/issued_discard

Add them to /sys/fs/f2fs/<disk>/stat/?

Thanks,

> +Date:           December 2023
> +Contact:        "Zhiguo Niu" <zhiguo.niu@unisoc.com>
> +Description:    Shows the number of issued discard.
> +
> +What:           /sys/fs/f2fs/<disk>/queued_discard
> +Date:           December 2023
> +Contact:        "Zhiguo Niu" <zhiguo.niu@unisoc.com>
> +Description:    Shows the number of queued discard.
> +
> +What:           /sys/fs/f2fs/<disk>/undiscard_blks
> +Date:           December 2023
> +Contact:        "Zhiguo Niu" <zhiguo.niu@unisoc.com>
> +Description:    Shows the total number of undiscard blocks.
> +
>   What:		/sys/fs/f2fs/<disk>/max_victim_search
>   Date:		January 2014
>   Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 7099ffa..666efdd 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -143,6 +143,33 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
>   				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
>   }
>   
> +static ssize_t issued_discard_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	if (!SM_I(sbi)->dcc_info)
> +		return -EINVAL;
> +	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
> +				&SM_I(sbi)->dcc_info->issued_discard));
> +}
> +
> +static ssize_t queued_discard_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	if (!SM_I(sbi)->dcc_info)
> +		return -EINVAL;
> +	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
> +				&SM_I(sbi)->dcc_info->queued_discard));
> +}
> +
> +static ssize_t undiscard_blks_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	if (!SM_I(sbi)->dcc_info)
> +		return -EINVAL;
> +	return sysfs_emit(buf, "%u\n",
> +				SM_I(sbi)->dcc_info->undiscard_blks);
> +}
> +
>   static ssize_t gc_mode_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -1025,6 +1052,9 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
>   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
>   F2FS_GENERAL_RO_ATTR(pending_discard);
> +F2FS_GENERAL_RO_ATTR(issued_discard);
> +F2FS_GENERAL_RO_ATTR(queued_discard);
> +F2FS_GENERAL_RO_ATTR(undiscard_blks);
>   F2FS_GENERAL_RO_ATTR(gc_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_GENERAL_RO_ATTR(moved_blocks_background);
> @@ -1084,6 +1114,9 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
>   	ATTR_LIST(max_ordered_discard),
>   	ATTR_LIST(discard_io_aware),
>   	ATTR_LIST(pending_discard),
> +	ATTR_LIST(issued_discard),
> +	ATTR_LIST(queued_discard),
> +	ATTR_LIST(undiscard_blks),
>   	ATTR_LIST(gc_mode),
>   	ATTR_LIST(ipu_policy),
>   	ATTR_LIST(min_ipu_util),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
