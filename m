Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFCB98B6F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 09:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kvtFY91fCInqS8UrZy3TsYXpdTZEPeLoZWQi+avPt0=; b=mWKxZMWF8J9jW0AFgkp8BLkR+1
	bpNH50ztngILS9MjbMWI7yGrliyxptPO7Fv/fKN+cBuTl00jbuVUSUNsXNZSFP1fC09DIFfmt7GSn
	iRcdCz4akXx368h8bLsslNrUQ0xKJ920lS3MQIBIBh3hBfaNPxA0lrp9MRkeTqPoWJ7E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1KP9-0004UP-Td;
	Wed, 24 Sep 2025 07:59:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v1KP8-0004UE-QW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 07:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XjuicUFl7lrkfnVt1/5y5F6NT8VeWu/JliGKotBg63U=; b=Lte2zuMq8P8PXl52yQa/oxZz+x
 ymFFepSLoLX/YCbiZYI0cL362LUGF4VFG3W886lXCr7rVJZ2c1tMNmAzKh/L9TR4oplIEqz5udM2z
 07fkNQXTwhDAopi2AqZUym59k+A4ziSL/ZKV3GgZh5xLSyhQq+CaRTM2AgwjvcpxXk7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XjuicUFl7lrkfnVt1/5y5F6NT8VeWu/JliGKotBg63U=; b=EypENefk/QWdBL6ldw2/fE9bo+
 FevOI7bo2INNdGoJ2k+UscYf6eXk+9xFSWKqQenHR+s6GOTVSNVfMn1+/EFLjxX/YSpIrQkxN0fJw
 JjvGWayV9JFfqs3ehV7DcG6MbBwuCdjZW/OkFaBDjxznEShc5KT80yyoGf7yiL6B6MWQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1KP6-00050z-MW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 07:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 22D5E601B6;
 Wed, 24 Sep 2025 07:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB21C4CEE7;
 Wed, 24 Sep 2025 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758700742;
 bh=ebGmTogsoiIyNshxuoFonK4bfNHzVNAVFWeWw4P6UXs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LPQ8XGB7T0yQzn+lDE3chKsbahiJJmvuFHgieF8/se7iVnfHY32swQwMLjw6jDL8X
 njuN9dNeSNJoqDHMS11aZ0VFj+J2NO8wMdkjFepFgc7FthNiP+HkpNQv13ANedFr4f
 NlkMU1Zb3TlocBBQk+l7Gs6ptIr4I45hBHRY3N/wWrEojhM/mm7V4abUGain9Vnf7H
 4mckGpU2v5XwHat794wQH3jhNB1vQv8SxjoSONKaJMM8hf0/cZ5QNZKG6QGev/ytQc
 LvTpK8xkpns7fEdTIUt+hUn0nw4yFwFfmgE1yueM7lJSpunxfOncjpecexy9BA9JW1
 OSTbjZ3xT6uzQ==
Message-ID: <6529ffee-d2ee-41ff-97d0-bf483fd0530a@kernel.org>
Date: Wed, 24 Sep 2025 15:58:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yunji Kang <yunji0.kang@samsung.com>, jaegeuk@kernel.org
References: <CGME20250924074405epcas1p3a116daa0efa4a22d1741437b0cf59f8d@epcas1p3.samsung.com>
 <20250924074358.253759-1-yunji0.kang@samsung.com>
Content-Language: en-US
In-Reply-To: <20250924074358.253759-1-yunji0.kang@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/24/25 15:43,
 Yunji Kang wrote: > In f2fs_precache_extents(), 
 For large files, It requires reading many > node blocks. Instead of reading
 each node block with synchronous I/O, > this patch applies [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1KP6-00050z-MW
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: linux-kernel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/24/25 15:43, Yunji Kang wrote:
> In f2fs_precache_extents(), For large files, It requires reading many
> node blocks. Instead of reading each node block with synchronous I/O,
> this patch applies readahead so that node blocks can be fetched in
> advance.
> 
> It reduces the overhead of repeated sync reads and improves efficiency
> when precaching extents of large files.
> 
> I created a file with the same largest extent and executed the test.
> For this experiment, I set the file's largest extent with an offset of 0
> and a size of 1GB. I configured the remaining area with 100MB extents.
> 
> 5GB test file:
> dd if=/dev/urandom of=test1 bs=1m count=5120
> cp test1 test2
> fsync test1
> dd if=test1 of=test2 bs=1m skip=1024 seek=1024 count=100 conv=notrunc
> dd if=test1 of=test2 bs=1m skip=1224 seek=1224 count=100 conv=notrunc
> ...
> dd if=test1 of=test2 bs=1m skip=5024 seek=5024 count=100 conv=notrunc
> reboot
> 
> I also created 10GB and 20GB files with large extents using the same
> method.
> 
> ioctl(F2FS_IOC_PRECACHE_EXTENTS) test results are as follows:
>   +-----------+---------+---------+-----------+
>   | File size | Before  | After   | Reduction |
>   +-----------+---------+---------+-----------+
>   | 5GB       | 101.8ms | 37.0ms  | 72.1%     |
>   | 10GB      | 222.9ms | 56.0ms  | 74.9%     |
>   | 20GB      | 446.2ms | 116.4ms | 73.9%     |
>   +-----------+---------+---------+-----------+
> Tested on a 256GB mobile device with an SM8750 chipset.
> 
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Signed-off-by: Yunji Kang <yunji0.kang@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
