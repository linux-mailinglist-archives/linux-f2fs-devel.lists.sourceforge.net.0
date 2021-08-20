Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC33F3739
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Aug 2021 01:16:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mHDkV-0007U9-RO; Fri, 20 Aug 2021 23:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mHDkU-0007U3-Px
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 23:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GHe2pna7lkFC/IQ5eJDFWER4/vxrSMyatDzcBN9u2RY=; b=cKUXIAOH/5pLWeqyN0pzy5TWIT
 xvFRilayhmxQb8TFsncG1EHlyuXj0ofmFyptUwAaFWYFm0DC7stPjQNvxz7zSBU3Cgsmrusx4/WjS
 at0QLU1uchJgCXTzDCLQdCxU6+X8NqinEgIFeGJCmFjMMc+Zikqz4kEe6L0FWYCbYFX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GHe2pna7lkFC/IQ5eJDFWER4/vxrSMyatDzcBN9u2RY=; b=K4KkYR6Ja9kgUC0DJz8o4SNMFM
 qshoBfST3RP+2JUR6YuUHcHzZ0xRO8uCk8S5W/VOokyucQ0q8U7MLxwhWePs1wz10hn6SmHkUdHFT
 VOlGp0FnpSp35oZUuCFfXjKFkPTqfuPOEszIMqiB54B1t8D7ZWuxvE6MVmf0j5Z75zIw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mHDkT-0005Va-JV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 23:16:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D71561165;
 Fri, 20 Aug 2021 23:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629501378;
 bh=gND2D7ZmLJGqxBQEiaqUQVfu0fJGInr/zCwmlW7GWkQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YKezb+LrZllD3p0QDSwLHv8XtHhksmhz1hYnqCZcuCRRI7vHZE1K+v0KpI2NDoifu
 MrMYvI6k1dUeSF6ZlArPzmZdHGyMGiQteiTUVhZjwc1L7ZH54WVfW7xM2csKj7xev4
 /h7Oath5HxOCb7l5o3Nu9hrDDgjURiNdHT1hmm2TV5cGLvoCbyZ8COYECIJZPWTOkW
 bp/Trc9zHZvHen1JzVdSN2/a4v7lxVs5qI7FF2kkwNT+PX4z0XcCtZwDMEx12lwvd1
 SiCsytxOMO0CuZgPye2en5D0lJC0KOlHkUV09JUxf4jWFo4D1A/l+E4ic8yHM56URC
 5BnghgNnraWOQ==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210820222909.342198-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <501b84ea-b06e-7bcd-9aac-1422cfb6bae6@kernel.org>
Date: Sat, 21 Aug 2021 07:16:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820222909.342198-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mHDkT-0005Va-JV
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce periodic iostat io
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

On 2021/8/21 6:29, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Whenever we notice some sluggish issues on our machines, we are always
> curious about how well all types of I/O in the f2fs filesystem are
> handled. But, it's hard to get this kind of real data. First of all,
> we need to reproduce the issue while turning on the profiling tool like
> blktrace, but the issue doesn't happen again easily. Second, with the
> intervention of any tools, the overall timing of the issue will be
> slightly changed and it sometimes makes us hard to figure it out.
> 
> So, I added the feature printing out IO latency statistics tracepoint
> events, which are minimal things to understand filesystem's I/O related
> behaviors, into F2FS_IOSTAT kernel config. With "iostat_enable" sysfs
> node on, we can get this statistics info in a periodic way and it
> would cause the least overhead.
> 
> [samples]
>   f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
> wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
> wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
> wr_async_node [0/0/0], wr_async_meta [0/0/0]
> 
>   f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
> wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
> wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
> wr_async_node [0/0/0], wr_async_meta [0/0/0]
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
