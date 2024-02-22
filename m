Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772B85F83D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 13:31:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rd8EL-0002fi-Hr;
	Thu, 22 Feb 2024 12:31:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rd8EJ-0002fb-Aa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XxH9bwkxsCzDaGR4h/AIxlcobTOWPd8epHe1+JU69Gs=; b=iu6mKXbngTUQ3QyQJlY4ECfBJj
 7BFcDhZwLjLSnsciVOBnW4rYzqmdJCEv8Gsndl/oH0pYVa2ar5QDktRssHuagBtZzOa3rx0zTqcQv
 FYf9dMv37XWl1peCVmtQ7eBQ85U9vif0dgDj1N2kAWg/iuzzsVGRDuuMJY8wdjkYbVe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XxH9bwkxsCzDaGR4h/AIxlcobTOWPd8epHe1+JU69Gs=; b=ADrTRGxVbks4Dz7TzCtQJW/icM
 0SC4ckMfWNyOC6wWMulPgtgglKFvu8+Vr9th9OEJF2IvY1qpCAMgaz42qwW5Q/JyTx6IK2PL7sfpj
 qTKiBmY7ioyIvqqHPD3BoOn6ZJBGdT7SDLitHbIoqf5GBAD2O0hTARcjUHv6vfgFGZOU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rd8ED-0004M5-OY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6C441CE20BB;
 Thu, 22 Feb 2024 12:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2DFC433F1;
 Thu, 22 Feb 2024 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708605054;
 bh=fjFY5/FC5nitX0I63+wFnRJqrTw9DhGxaj21oxxRA6k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pQdmftJr/wI8M+MjCk6oa/xKtIn+Z2JnlE41xn26x+pmCWCtvEwc1hMOBXE/VQ6O3
 szwW0onZEJIZBgKbuINcRFluorOpWBYi4h/lS/JXs6P/n7wWslO8BeHNSkwSuaOmH2
 ogGGtmgmCB3ppdjk8olbzHmnLrOymmOKjuaIJz2yqD0XDgfnJKH4jxWReuwIj0yHVa
 xThxcAjU5rg5e+pFiprjGwq1L9tIrsZsTFGnKW5IEW3YlqKI4DlJZkV/5Kq+ThBIuK
 yCbo2H7hOiJy7Nh5EY8MZdLnemgIM+08l//WmQikn+0+vK5DeBszP+K6ouvufD6zuK
 T44q9E5D8/ubQ==
Message-ID: <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
Date: Thu, 22 Feb 2024 20:30:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/7 10:01, Zhiguo Niu wrote: > A panic issue happened
 in a reboot test in small capacity device > as following: > 1.The device
 size is 64MB, and main area has 24 segments, and > CONFIG_F2FS_CH [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rd8ED-0004M5-OY
Subject: Re: [f2fs-dev] [PATCH v2 0/4] f2fs: fix panic issue in small
 capacity device
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/7 10:01, Zhiguo Niu wrote:
> A panic issue happened in a reboot test in small capacity device
> as following:
> 1.The device size is 64MB, and main area has 24 segments, and
> CONFIG_F2FS_CHECK_FS is not enabled.
> 2.There is no any free segments left shown in free_segmap_info,
> then another write request cause get_new_segment get a out-of-bound
> segment with segno 24.
> 3.panic happen in update_sit_entry because access invalid bitmap
> pointer.

Zhiguo,

Can you please try below patch to see whether it can fix your problem?

https://lore.kernel.org/linux-f2fs-devel/20240222121851.883141-3-chao@kernel.org

Thanks,

> 
> More detail shown in following patch sets.
> The three patches are splited here because the modifications are
> relatively independent and more readable.
> 
> ---
> Changes of v2: stop checkpoint when get a out-of-bound segment
> ---
> 
> Zhiguo Niu (4):
>    f2fs: correct counting methods of free_segments in __set_inuse
>    f2fs: fix panic issue in update_sit_entry
>    f2fs: enhance judgment conditions of GET_SEGNO
>    f2fs: stop checkpoint when get a out-of-bounds segment
> 
>   fs/f2fs/file.c          |  7 ++++++-
>   fs/f2fs/segment.c       | 21 ++++++++++++++++-----
>   fs/f2fs/segment.h       |  7 ++++---
>   include/linux/f2fs_fs.h |  1 +
>   4 files changed, 27 insertions(+), 9 deletions(-)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
