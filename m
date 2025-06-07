Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEFAD0D14
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Jun 2025 13:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+F5BtOtJfz58lA4sY/rNZ8IRsi41wWWeJKehbgcsEQ=; b=kJlda0PkjoGbbzsVaNnDtDpIy7
	n18RH3la6jSaDY1g2EU23MqTHIz0QHYuNWEvMSrJ/aaIZ8UVPLptQ2rZ+UFbfLj4yJs5cBxd+4fYT
	8FMPiW+uRKYB9Lt/iEV+GaX6XVGfC7LKLbpGlwm9gHwQjwTxzuFHGvy9BDfnXLSVaXMM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNret-0002wb-B8;
	Sat, 07 Jun 2025 11:24:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uNrer-0002wV-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Jun 2025 11:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FADUFPn9ERW7Q2Oxh2SXBkou2PQ/1xod2OyxaZQXMAg=; b=nJpPmWpj/PodVi28m6xaKi2yGW
 PlVJD8uRsISJGw29Pk7LI+Vha699rPDZq+8GS9+Lbs3mn0qrE2jsiL9ldeqqqliYcpIEVopkZyxa0
 iAoO7nPXm8Gdlxdf7LlQHCLvo0Y7n2iUZGissdtS6HTVjiAdULKB8G3X+8+wGt1qBZO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FADUFPn9ERW7Q2Oxh2SXBkou2PQ/1xod2OyxaZQXMAg=; b=lNywL6JFHAHz+pX73OE13elNUt
 dkXRQUXmsOpwkiNb7xCIsxD9kb72OvvRdtu3VIJHYGDwgJ5gvWITY4W6XImul04bI/lVy9PJEyRaS
 /2cqyaH6/5JiMVaTcrq+bAgJc5aKYSRX1fRp79NIZyh1BfZUIlI2ruwNhk3FY/fmKpzM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uNrer-0001nJ-Aq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Jun 2025 11:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A97CC629E2;
 Sat,  7 Jun 2025 11:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C47AC4CEE4;
 Sat,  7 Jun 2025 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749295451;
 bh=TMkU4Y5022JaJW8x8OEDEeW2ERrB9D2x6QSYL6BAWvc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fqYCd7GOr61MX1MMSqi58Xyd4dSSBctm68h9p0sYIJ7umnIeVD96ed84mGymwPb6N
 yBe2ii1sNF+vUnpcMlTmjmKmjQJ6sB+ArwwLB7jYbx6cTDwxOG7X8nN2yLGTiCes4+
 Up2oDdOW9utkPoG0pW4poGsAZ92uPXTj3eng5cXGRwhIg6TFzTiJBC8kmm19r3T6T5
 HdTmF0NOit+BN6BzjxjPIoiXtlQt2ds2MgddnJSEJuc4KgsXabId4F38pyqQR7vu/X
 Po1rCkLydHkV+SjZABAPFEtUYxiEdUHYu7CDqeOa9ZJ48fTiywrh8hWoDjXNto5R79
 SqEaW1NErl56A==
Message-ID: <369054af-94f3-4d96-aa9f-5d8a3a1af5c3@kernel.org>
Date: Sat, 7 Jun 2025 19:24:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250606215932.1226604-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250606215932.1226604-1-daeho43@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/7 5:59,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add this to control GC algorithm for boost GC. > > Signed-off-by: Daeho
 Jeong <daehojeong@google.com> > --- > Docum [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uNrer-0001nJ-Aq
Subject: Re: [f2fs-dev] [PATCH] f2fs: add gc_boost_gc_greedy sysfs node
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/7 5:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add this to control GC algorithm for boost GC.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
>   fs/f2fs/gc.c                            | 3 ++-
>   fs/f2fs/gc.h                            | 1 +
>   fs/f2fs/sysfs.c                         | 7 +++++++
>   4 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 931c1f63aa2e..b978d183f5b1 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -869,3 +869,9 @@ Description:	Set a multiplier for the background GC migration window when F2FS G
>   		boosted.
>   		Default: 5
>   
> +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
> +Date:		June 2025
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
> +		Default: 1
> +
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index de7e59bc0906..31afee3af1a0 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
>   					FOREGROUND : BACKGROUND);
>   
>   		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
> -				gc_control.one_time;
> +			(gc_control.one_time && gc_th->boost_gc_greedy);
>   
>   		/* foreground GC was been triggered via f2fs_balance_fs() */
>   		if (foreground)
> @@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>   	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
>   	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
> +	gc_th->boost_gc_greedy = 1;

How about using GC_GREEDY macro instead?

>   
>   	if (f2fs_sb_has_blkzoned(sbi)) {
>   		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index efa1968810a0..1a2e7a84b59f 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
>   	unsigned int boost_zoned_gc_percent;
>   	unsigned int valid_thresh_ratio;
>   	unsigned int boost_gc_multiple;
> +	unsigned int boost_gc_greedy;
>   };
>   
>   struct gc_inode_list {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index b0270b1c939c..5de7cd5c4fd8 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -824,6 +824,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
> +		if (t > 1)

Ditto,

Thanks,

> +			return -EINVAL;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -1051,6 +1056,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
>   GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
> +GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
>   
>   /* SM_INFO ATTR */
>   SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1222,6 +1228,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_boost_zoned_gc_percent),
>   	ATTR_LIST(gc_valid_thresh_ratio),
>   	ATTR_LIST(gc_boost_gc_multiple),
> +	ATTR_LIST(gc_boost_gc_greedy),
>   	ATTR_LIST(gc_idle),
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
