Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF93C2BF2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jul 2021 02:17:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m20gQ-0001Qf-IC; Sat, 10 Jul 2021 00:17:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m20gP-0001QY-BM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RU6sSrR9edRLXfkZIz/xUHYB6EE4nI16M1q9QSYYnm4=; b=Da9U1nQIfCBSDqg1B/cnQOp6IF
 khlSqLeX4qE2QwiAP8dyZWFeZgFygEHkGMDRLFGxuTztTUTRwdi1yb58O+1TFPVlxbJjpkAdHWzz+
 EEfHx1s/oLuJFYfEHgBZb1+cUYoFnISVHdeqLqjs0y6pYuMHOZxJJS0lvBZGi86SFacg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RU6sSrR9edRLXfkZIz/xUHYB6EE4nI16M1q9QSYYnm4=; b=eGaQoza7xhzxEJ9OTYr2ipwfRB
 OxOhRJ2Z1Of88kVQvkNOk7rNRx2Er2wLyssMmB5Gq0bUp4NvkP9+9UytzFdasMAIOKjxIAO6JX8wO
 WoixquGT5qC33+ip1WdEgpb/yYgWsNPvIr/C5zBdSpvusa3mZz/fQqQOGj1cT/xoIjyY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m20gF-002f2l-EP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:17:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B1D3613C5;
 Sat, 10 Jul 2021 00:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625876225;
 bh=umyVC+0Nj+PZL1A4xnrSLxFt2AKxxnuQx070lhPlUfg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=offRgoJmSYZARoBqYvSj5qHLOYDJyEPOCCTT+aiYrayNPgvr9p8n9PrnFPNshcf5d
 LlOk8V1ZGJqFQWVt93y6UKtStQ14DR+cW0xFrXnXK/69iTM0vh9hvxl/QvW/voFBlT
 HcAfmmSxGxAhbFfBBi21SWOVkRccdA+RwVyC5I6CTbSJbfIcW5FFnkm/Ir+wJA0Uv9
 AlVUUetYiAOKaEzcJdd1Mv1ofhTvXjX3oM1fqeSlIJHZMRHEXEl5knw9/utoavCWUf
 U8F887/Eft4bwc3q1SdoWcsPCPKtifxd38jL1jVhJWDh/pAjAMTiU56vK9P8gMK7rO
 QIdHsEq0tOssw==
To: Daeho Jeong <daeho43@gmail.com>, Daeho Jeong <daehojeong@google.com>
References: <20210709204430.1293298-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <4f88fac8-2838-45ac-8f87-789b8b7c2d09@kernel.org>
Date: Sat, 10 Jul 2021 08:17:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709204430.1293298-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m20gF-002f2l-EP
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add sysfs nodes to get GC info for
 each GC mode
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/10 4:44, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added gc_dirty_segs and gc_dirty_segs_mode sysfs nodes.
> 1) "gc_dirty_segs" shows how many dirty segments have been
> reclaimed by GC during a specific GC mode.
> 2) "gc_dirty_segs_mode" is used to control for which gc mode
> the "gc_dirty_segs" node shows.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 14 +++++++++++++
>   fs/f2fs/debug.c                         |  9 ++++++++
>   fs/f2fs/f2fs.h                          |  5 +++++
>   fs/f2fs/gc.c                            |  1 +
>   fs/f2fs/sysfs.c                         | 28 +++++++++++++++++++++++++
>   5 files changed, 57 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 95155e4ec7fe..0d863eb185f6 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -493,3 +493,17 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
>   Description:	When ATGC is on, it controls age threshold to bypass GCing young
>   		candidates whose age is not beyond the threshold, by default it was
>   		initialized as 604800 seconds (equals to 7 days).
> +
> +What:		/sys/fs/f2fs/<disk>/gc_dirty_segs

How about renaming gc_dirty_segs to gc_reclaimed_segments?

> +Date:		July 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show how many dirty segments have been reclaimed by GC during
> +		a specific GC mode (0: GC normal, 1: GC idle CB, 2: GC idle greedy,
> +		3: gc idle AT, 4: GC urgent high, 5: GC urgent low)

3. GC idle AT

> +		You can re-initialize this value to "0".
> +
> +What:		/sys/fs/f2fs/<disk>/gc_dirty_segs_mode

You know, F2FS_IOC_FLUSH_DEVICE/F2FS_IOC_RESIZE_FS needs to migrate all
blocks of target segment to other place, no matter the segment has partially
or fully valid blocks, so it looks 'gc_segment_mode' will be more appropriate?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
