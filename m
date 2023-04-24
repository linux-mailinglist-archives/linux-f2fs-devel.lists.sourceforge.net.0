Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 150306ED1B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 17:47:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqyPX-00055F-UJ;
	Mon, 24 Apr 2023 15:47:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pqyPW-000558-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1eE0PPjJfyBbHMmKQXz4pjmgI0AvMvWSD0pbwBYtfoo=; b=dSeZNi+QvnhFL4ElrjpBwxvmUt
 G6IiiEa3dp5ASm5JeKdO8cIdayS3LwEt2FcEHveLTm9vwV+ZnoxQHGwRCdABU356H2Z+jXc+n8/+R
 aj4DVF25saqQXqbnkCKAhbC94232ohwsEnMlpLcbvR6VIEo473AiDvtcmZG2F4hbbgMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1eE0PPjJfyBbHMmKQXz4pjmgI0AvMvWSD0pbwBYtfoo=; b=YLb6RfCiNzjEbSzhsDmDVC00JT
 1TzCqLJNqU6MNPpONq6HedAWdVKJnZybsuJlWgdH2luXdrfnqfzWrHKhApgnI13yLHUXUj1Vh1lXo
 P4KOss77wFkr/23PwtPT3L5vZ6ztJlLxE7+TzV9ZnTvbe/CJAmA1mxfXmiry6BuTSZUk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqyPW-0007QY-Ht for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:47:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6FF262268;
 Mon, 24 Apr 2023 15:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32842C433D2;
 Mon, 24 Apr 2023 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682351240;
 bh=4RTntsS8Ltvi/zweHMoGG/466+f9Gl/cJ22m2S/ZjzE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MWidb279bEM5WgbBMBj6MoM4r+XA9hNa4cZhS5rsS0Jchg+5o66aoGHNDrVDImCl+
 qqIt6ssRxmKXjk2Ftx/Bcs1uMUYr8RYZwBtIgDcIW/OqWN8FWdKGmBVYNb1YPBS4Sd
 IxFx2BCUIUWmhgHq2EeVDR/fU69fTjgVp01Yn3i83Tj3P0fz/YVCnV9bnDzm9XeWoe
 qFbFG6MpK+vSn5IAhXQJItFUP4nSV2/x3Qdf1iafNkOe0VYaUMTNUrBWHQ4p0jnkgK
 kG5aX2p1bS5e5nkxOq3ZU9IZ9UHUpITuvAHsEnauSf99sCd4nBh0f9x0x+wdjFDW+z
 DNzh7ZGwnnGEQ==
Message-ID: <32d4cb93-1491-4d1b-7713-61369a93f658@kernel.org>
Date: Mon, 24 Apr 2023 23:47:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230424154440.23279-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230424154440.23279-1-daeho43@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/24 23:44, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > When a node block is missing for atomic write
 block replacement, we need > to allocate it in advance of the repla [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pqyPW-0007QY-Ht
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate node blocks for atomic write
 block replacement
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

On 2023/4/24 23:44, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When a node block is missing for atomic write block replacement, we need
> to allocate it in advance of the replacement.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
