Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6291976C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 10:41:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIpz0-0001rb-1a; Mon, 30 Mar 2020 08:41:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jIpyz-0001rE-BL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 08:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GGGEL/LuAMxI6PsctPscsFZoLhU3QNYhVoPX6IYX7nQ=; b=bHtPwN5sNuZqSK6rPatan/IyWR
 m0+TfBz0KxIti6VU8uCdaj6iTjahwqemMz8LQVZ43UaaBDHK6ZwD8Wi9c9UaDjxeDzvFEemdEgMrl
 kW3M2vSYvjttyMSsV3JE7vO66HAymasevK1CDK+756SQXh8GeUp0jimyI9cilGdCq3M0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GGGEL/LuAMxI6PsctPscsFZoLhU3QNYhVoPX6IYX7nQ=; b=d3YD1U2+S0c7YzdZ+tt93SYUFh
 ZHHbz0RZoFr+QOv/GecbNhv3OVHjjWPPMulnXjizUqDOVSTHPsEtYSZlr2ZK4YDOoHubuSpKAq/60
 N5uEBsbsL6ZGLUjoDEJ5uMz02eBI6Ob0Sv3+ylLyf28iIYj+u/R+T4FlA5A1PWig6890=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jIpyo-00F7mh-LA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 08:41:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585557672; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=GGGEL/LuAMxI6PsctPscsFZoLhU3QNYhVoPX6IYX7nQ=;
 b=bPCMV1KOZg6QZm4NxIj2+wQjh+rCAqR4zx7zx7qJ0bDgB70iIQORO6A83duOLIdFlXW6lGsn
 nK9jZTWuBjxCXlJDVQmRGVltoR6JDVjtkN7EDrXx/11SCgzGDtN+VAbziZ3Xvo8eL75Sj8lM
 13f8gcvYg4gSTJfxHdPfFMxa4Uw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e81b088.7f0cb2988f48-smtp-out-n01;
 Mon, 30 Mar 2020 08:40:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B96F0C433F2; Mon, 30 Mar 2020 08:40:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BD12C433D2;
 Mon, 30 Mar 2020 08:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BD12C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 30 Mar 2020 14:10:33 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200330084033.GU20234@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200327192412.GA186975@google.com>
 <397da8a6-fdb4-9637-c6ea-803492c408a2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <397da8a6-fdb4-9637-c6ea-803492c408a2@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
X-Headers-End: 1jIpyo-00F7mh-LA
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Mar 28, 2020 at 04:38:00PM +0800, Chao Yu wrote:
> Hi all,
> 
> On 2020/3/28 3:24, Jaegeuk Kim wrote:
> > Hi Sahitya,
> > 
> > On 03/26, Sahitya Tummala wrote:
> >> allocate_segment_for_resize() can cause metapage updates if
> >> it requires to change the current node/data segments for resizing.
> >> Stop these meta updates when there is a checkpoint already
> >> in progress to prevent inconsistent CP data.
> > 
> > Doesn't freeze|thaw_bdev(sbi->sb->s_bdev); work for you?
> 
> That can avoid foreground ops racing? rather than background ops like
> balance_fs() from kworker?
> 

Yes, that can only prevent foreground ops but not the background ops
invoked in the context of kworker thread.

> BTW, I found that {freeze,thaw}_bdev is not enough to freeze all
> foreground fs ops, it needs to use {freeze,thaw}_super instead.
> 

Yes, I agree.

Thanks,

> ---
>  fs/f2fs/gc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 26248c8936db..acdc8b99b543 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1538,7 +1538,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		return -EINVAL;
>  	}
> 
> -	freeze_bdev(sbi->sb->s_bdev);
> +	freeze_super(sbi->sb);
> 
>  	shrunk_blocks = old_block_count - block_count;
>  	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> @@ -1551,7 +1551,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		sbi->user_block_count -= shrunk_blocks;
>  	spin_unlock(&sbi->stat_lock);
>  	if (err) {
> -		thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> +		thaw_super(sbi->sb);
>  		return err;
>  	}
> 
> @@ -1613,6 +1613,6 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  	}
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  	mutex_unlock(&sbi->resize_mutex);
> -	thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> +	thaw_super(sbi->sb);
>  	return err;
>  }
> -- 
> 2.18.0.rc1
> 
> > 
> >>
> >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >> ---
> >>  fs/f2fs/gc.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >> index 5bca560..6122bad 100644
> >> --- a/fs/f2fs/gc.c
> >> +++ b/fs/f2fs/gc.c
> >> @@ -1399,8 +1399,10 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
> >>  	int err = 0;
> >>  
> >>  	/* Move out cursegs from the target range */
> >> +	f2fs_lock_op(sbi);
> >>  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
> >>  		allocate_segment_for_resize(sbi, type, start, end);
> >> +	f2fs_unlock_op(sbi);
> >>  
> >>  	/* do GC to move out valid blocks in the range */
> >>  	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
> >> -- 
> >> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> >> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> > .
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
