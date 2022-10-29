Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58675612013
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 06:31:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oodVQ-0001vB-Od;
	Sat, 29 Oct 2022 04:31:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oodVP-0001v5-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wZ4ulnDGpb3mc3oz6tr8inqtBLFmyodCOw/UXvGtOY=; b=aFxJV15iUS4QK4pQ09X6gMO25C
 0BtXCr1n1ARN99piJBFNhYd1tCHA+fnBxeP5U1oqkspihzxRe5rIwFKlP3aLQgHhA9stk/ZI7UMx5
 ZVeiQwgUcQzOqRbsAuz8w9OWJOfQZWzBA97xxc3XcnbftT1ew9ukR8rQ9PmSXuRSd0dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3wZ4ulnDGpb3mc3oz6tr8inqtBLFmyodCOw/UXvGtOY=; b=NXOUDZwkmAi0WRfCAP4/FGRK5d
 Q60rZXOQg6yaqp6js+a/hlLelQ7QJ1PPcicSRWdbM1bpKcYbngOeymEm0aoRu2lepVKmF4kdTCX1i
 qnQQ/Mg4GY2NnsGwChRRvuA+eSis8SE5Z1SxqTrg5PArgqoXdizRYAWy3go1dFwEeWHc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oodVO-004A3c-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:31:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 498CD60A0B;
 Sat, 29 Oct 2022 04:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F098C433D6;
 Sat, 29 Oct 2022 04:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667017888;
 bh=nNh0/3K59uwZRZdDbebdJv0jIr90dVOrNs4fblMpaXg=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=U1gW/fTSoNfO8Mnd39FMhWKgBkP05152TE5rFWnlcWdYrTnnOxE1IMO8OlNgK0WV4
 515BdS3UCDQA9pdH1heV25VmyTorIEDpDjkpXLWRT/TMJfEnKv0nyIekdlIGOHaTB4
 sZrFvey637RII1SvbWnzHYROUTRTbnSdmHHWkPwBF8qAx9lcs3kJv1xohYbuOrNp39
 GQlvuBbqSNSeIxxRoEkau02TQw/X58/muhsMqoUzqMjvoY1xtEFd076kypVhMDfbKv
 iaUL7PeaaKgO6QZSCTj4NQDCpZ9ScA3HWKe1T8bsxEsgPa+YjYdnLw320z0CP+/g8p
 dQvM46kU3d4uQ==
Message-ID: <38fcacaf-fd22-6216-adf7-8f72fb0ca580@kernel.org>
Date: Sat, 29 Oct 2022 12:31:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025033217.14840-1-frank.li@vivo.com>
 <20221025033217.14840-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025033217.14840-2-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Minor comments below. On 2022/10/25 11:32, Yangtao Li wrote:
 > gc_mode sysfs node can show the current gc_mode as a string. > Introducing
 it increases readability. Introducing it to increase readability. 
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
X-Headers-End: 1oodVO-004A3c-Ln
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce gc_mode sysfs node
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

Minor comments below.

On 2022/10/25 11:32, Yangtao Li wrote:
> gc_mode sysfs node can show the current gc_mode as a string.
> Introducing it increases readability.
Introducing it to increase readability.

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
>   fs/f2fs/f2fs.h                          |  1 +
>   fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
>   3 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 483639fb727b..6466f3b1f0a9 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -634,3 +634,9 @@ Date:		July 2022
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	Show the accumulated total revoked atomic write block count after boot.
>   		If you write "0" here, you can initialize to "0".
> +
> +What:		/sys/fs/f2fs/<disk>/gc_mode
> +Date:		October 2022
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Show the current gc_mode as a string.
> +		This is a read-only entry.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6355a5683b7..80f23e44a442 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1318,6 +1318,7 @@ enum {
>   	MAX_TIME,
>   };
>   
> +/* Note that you need to keep synchronization with this gc_mode_names array */

Good point.

/* Modification on enum should be synchronized with gc_mode_names array */

>   enum {
>   	GC_NORMAL,
>   	GC_IDLE_CB,
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 49898a7243ba..058857d8b3b9 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -41,6 +41,16 @@ enum {
>   	ATGC_INFO,	/* struct atgc_management */
>   };
>   
> +static const char *gc_mode_names[MAX_GC_MODE] = {
> +		"GC_NORMAL",
> +		"GC_IDLE_CB",
> +		"GC_IDLE_GREEDY",
> +		"GC_IDLE_AT",
> +		"GC_URGENT_HIGH",
> +		"GC_URGENT_LOW",
> +		"GC_URGENT_MID"
> +};
> +
>   struct f2fs_attr {
>   	struct attribute attr;
>   	ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);
> @@ -133,6 +143,12 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
>   				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
>   }
>   
> +static ssize_t gc_mode_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sprintf(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
> +}
> +
>   static ssize_t features_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -823,6 +839,7 @@ F2FS_GENERAL_RO_ATTR(encoding);
>   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
>   F2FS_GENERAL_RO_ATTR(pending_discard);
> +F2FS_GENERAL_RO_ATTR(gc_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> @@ -904,6 +921,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(max_discard_issue_time),
>   	ATTR_LIST(discard_granularity),
>   	ATTR_LIST(pending_discard),
> +	ATTR_LIST(gc_mode),
>   	ATTR_LIST(batched_trim_sections),
>   	ATTR_LIST(ipu_policy),
>   	ATTR_LIST(min_ipu_util),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
