Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D30EC3F2A4F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 12:51:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH27B-00061h-Uy; Fri, 20 Aug 2021 10:51:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mH277-00060W-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRHMrWt5baWFODehcO5qugxcRRewSOE85WunY4TY7tg=; b=UBvVc9k1TKDiqxNhJ81S2pGuiv
 v58GbhLW7gy2HxysKag2fMyJrVK5U/1YW/f4s2IRO06T8vfQiGfSZ5G9ds/izOa5XEQXRjkU9N6Nh
 NQRIO/wZWM+Z6rGyBwA6r5AOL7vaVu3D2PUgRbzmg+tot+aE6am0JPcwsCFBzrKToofI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pRHMrWt5baWFODehcO5qugxcRRewSOE85WunY4TY7tg=; b=MzjugY4NGCK8u62UCjcbS3T/4q
 m/e7WAsvt+0CqcJC1d8YMm9/395RRTqva1PywE12T8Fw2PqpifYnGFc5Su86DMOpjYoeBPp4nCWpd
 95wkAhTEs3nlU45cMnTr+NGZl9I+A9YUMZuS5yAq/d0gEqvm7QOcqC2DbzKILfo91340=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH273-00Ccc2-LM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:51:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C00B60FDA;
 Fri, 20 Aug 2021 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629456656;
 bh=q8gLSnrTAf3x+Wghr7BlfshsmKBhWmCOudXqUTpNQXk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L7lb99ewy3BYP6mgeycwTX79zyznsksvDG7mQHW/mjHQy1MiO9O6wLT9G6A0qJ/tv
 CHKdyHe1KBGGtno1+jq8yN0f0YUd9q9U8Wxs1mYfa6D2xbqRIuxNqh3vmrRC52GdgU
 C/TWLHkTBczm78vSlcx6ogH9OVLpZaJkYI5pkGYW3WBmq9rYmU/8QpCZN5o2hDUA3L
 HwO757h9VJlZjl8Z2on1nEBvMMVhbXlZ8PZFChf+34fSgvp+ypTx0gttNuBB22y5PE
 Hbgs6PDnft4a2ZMo90CW+QuD/zJqu+bfxZEMn2qzS06vTlmH5eIpIyfIOabkYinoGA
 5bDlJdeybYyuQ==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210820035229.216975-1-daeho43@gmail.com>
 <20210820035229.216975-2-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <48725f58-1a48-73f3-80cf-a0c5efc3b470@kernel.org>
Date: Fri, 20 Aug 2021 18:50:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820035229.216975-2-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/20 11:52,
 Daeho Jeong wrote: > +void iostat_update_and_unbind_ctx(struct
 bio *bio, int rw) > +{ > + struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 > + int sync_type = bio->bi_opf & REQ [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mH273-00Ccc2-LM
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: introduce periodic iostat io
 latency traces
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/20 11:52, Daeho Jeong wrote:
> +void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
> +{
> +	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> +	int sync_type = bio->bi_opf & REQ_SYNC ? 0 : 1;

int sync_type = bio->bi_opf & REQ_SYNC ? 1 : 0;

Right?

>   int f2fs_init_iostat(struct f2fs_sb_info *sbi)
>   {
>   	/* init iostat info */
>   	spin_lock_init(&sbi->iostat_lock);
> +	spin_lock_init(&sbi->iostat_lat_lock);
>   	sbi->iostat_enable = false;
>   	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
> +	sbi->iostat_io_lat = f2fs_kzalloc(sbi, sizeof(struct iostat_lat_info),
> +					GFP_KERNEL);
> +	if (!sbi->iostat_io_lat)
> +		return -ENOMEM;

What do you think of just embedding iostat_io_lat structure into f2fs_sb_info
structure? it's minor thing though.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
