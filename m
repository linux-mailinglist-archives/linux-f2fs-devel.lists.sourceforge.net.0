Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC97349A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 03:05:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB3Ku-000537-Rm;
	Mon, 19 Jun 2023 01:05:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qB3Kq-000530-BM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 01:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aKDA5Jlyzh42DGpRPOaYHpKt60sSOZhsQVAPZfoLwLs=; b=mvpruWdiIqupgdYTBvxSrEHRGV
 rX45+51o548ty94oVbxUS5JcJv4SY+OdCliW+/Tlbjf0MPxRlM6ACjcyPU42xDe/21/yGGDxIeTfj
 p1UWzuFg1B6N//Ff2omej6VGYXS/G9rVeyQaYBIhzlwTLIjsUQTM9b0HmUrPTGnjvEi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aKDA5Jlyzh42DGpRPOaYHpKt60sSOZhsQVAPZfoLwLs=; b=RGGwcB3WCFN37mtb6MEdxBTW7c
 f/oTFY0PScL3cHK0tKVsCBM0tGJmqvqirYU1JhjtYiXWq1sFf9MFvLQRMsjxAVpm+ErKwOSKQ+ZiE
 IwoFu5mDwQKQ5ouII1YL6WbSzTaUVchtLk5YhLx5XWbyWpPuEopkQXg+f1ewooI76kPA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB3Kq-0006pW-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 01:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3670A60B40;
 Mon, 19 Jun 2023 01:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8685C433C8;
 Mon, 19 Jun 2023 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687136730;
 bh=aENsRAPrMxi7xNcA1r1l3GGPPzWOxpUMPH8pO4uywNY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KokKEq/MYrbE2WoxaShiUkoYn+myF0HmnnWBY6I9at51U7XrV6LJw721kmTSGWqAl
 7P/1cHTtaBvGXLdQ5y2fmUZYjb0z8Px+4MJXWO22NaIaSUJOBUoUUeJ37eWujbBbsB
 6180SmuhAnNXTlPdYO5ne73RiuzAWR6+4vz0I/kKeQ0w/2GwOpxlAZEmZurx6dU8Jf
 m/jGSwrpCRnPohM9NEC5LRYeTOIp8vo8XsYcK3srUyiGxIHRnsJq5faEuBq3+0YrS6
 B6YO+8PzMssi+BnaofabON6nxoJ3Mtb814ZVMkEmL1TJoFlVWajrVh3/G6+7NGGM68
 awNSclZKrQPjw==
Message-ID: <53c85f6c-c776-b364-5098-613b2e911067@kernel.org>
Date: Mon, 19 Jun 2023 09:05:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230613072912.52249-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230613072912.52249-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 15:29, Yangtao Li wrote: > This adds the async
 buffered write support to f2fs, > the following is the relevant test data.
 > > iodepth | 1 | 2 | 4 | 8 | 16 | > before(M/s) | 1012 | 1133 | [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qB3Kq-0006pW-JQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: enable nowait async buffered writes
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
Cc: linux-kernel@vger.kernel.org, Lu Hongfei <luhongfei@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/13 15:29, Yangtao Li wrote:
> This adds the async buffered write support to f2fs,
> the following is the relevant test data.
> 
> iodepth      | 1    | 2    | 4    | 8    | 16   |
> before(M/s)  | 1012 | 1133 | 894  | 981  | 866  |
> after(M/s)   | 1488 | 1896 | 2081 | 2188 | 2207 |
> 
> The following is the fio configuration:
> 
> [global]
> ioengine=io_uring
> sqthread_poll=1
> threads=1
> iodepth=32
> hipri=0
> direct=0
> fixedbufs=0
> uncached=0
> nowait=0
> force_async=0
> randrepeat=0
> time_based=0
> size=256M
> filename=/data/test/local/io_uring_test
> group_reporting
> [read256B-rand]
> bs=4096
> rw=randwrite
> numjobs=1
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Jaegeuk, it may be late, feel free to add:

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
