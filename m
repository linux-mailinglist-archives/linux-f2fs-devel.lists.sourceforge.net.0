Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7E42C50F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Oct 2021 17:44:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1magQg-0003Ns-M5; Wed, 13 Oct 2021 15:44:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1magQe-0003NW-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YoRQqVSOxItjvtCi2UJhLQo3IBd+TB2rp3UFVwHcJts=; b=DoMcx5B3sU2bAYgpTNPGMXXA+K
 BBo+dRkOX8zNLjnhKU3PW4vtP6fBKQVxCiOwFy4qCyNf8yt/ZfmmLNQZEuge6QKX+BrkWRr7v5nYN
 Q+OHpsV75IaRH8q2fGAPEuxCkD5CPaZXYaXEi0T6/pv9g6zqSisbLA653c86EJ4iOfHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YoRQqVSOxItjvtCi2UJhLQo3IBd+TB2rp3UFVwHcJts=; b=QEjd/RMDfW2Zl42SZJdfv0KPoR
 XaDXzIaoeJzfy6mWbjg8OGj+KQRI97wWh5cfF0k04N34Ojw0mNn8rS0cDXZBz6EB+Og7d7JJDTVsQ
 Yzje9OkdPRR0uDUJqhAt79BvBB0eCDH5uEm9uJ9DhQNE6uJtftxbk+bizCf1/wMbUwwM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1magQb-0006pl-CV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 15:44:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CEBD610CE;
 Wed, 13 Oct 2021 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634139855;
 bh=2vHVDpjOkard38c9GxbAdvimfXtZ5e+LFQZ9Y8HQT2E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MkUIVe6JjLPliBtlSMFTPTuRWCAKuS9cCUfKeBrbvQve12TcnOsu6twTs7l127uEk
 mEuE2XXT3bzPVSg5jqmQnK17ZpcBNfUOptbbgfuO5Dc7pmlWt90KAjMsLTcPRetk+W
 FpZUfZirqgPLN0ER/5FmOulthYVyUURy+mfod+KWP5AdmNKU8Eh+T7jEETX7XGtLGQ
 /fyBI616uZOhODfw80E+n7gI9cqxGPfI/5HV+R0oxp9ge27nFRy5j16/wxaCbPPIwp
 K2WnHJCEFuQRVbPcxAwzmoFikN3nXALg47+hZ6JGkmlyoZdxUJrpFdkNAJa5fKyHWQ
 Uxy0EHEtPlNXg==
Message-ID: <f0586c39-baeb-2335-9fe4-8f2169824ec8@kernel.org>
Date: Wed, 13 Oct 2021 23:44:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211011120356.300261-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211011120356.300261-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/11 20:03, Fengnan Chang wrote: > when overwrite
 only first block of cluster, since cluster is not full,
 it > will call f2fs_write_raw_pages
 when f2fs_write_multi_pages, and cause the > whol [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1magQb-0006pl-CV
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/11 20:03, Fengnan Chang wrote:
> when overwrite only first block of cluster, since cluster is not full, it
> will call f2fs_write_raw_pages when f2fs_write_multi_pages, and cause the
> whole cluster become uncompressed eventhough data can be compressed.
> this may will make random write bench score reduce a lot.
> 
> root# dd if=/dev/zero of=./fio-test bs=1M count=1
> 
> root# sync
> 
> root# echo 3 > /proc/sys/vm/drop_caches
> 
> root# f2fs_io get_cblocks ./fio-test
> 
> root# dd if=/dev/zero of=./fio-test bs=4K count=1 oflag=direct conv=notrunc
> 
> w/o patch:
> root# f2fs_io get_cblocks ./fio-test
> 189
> 
> w/ patch:
> root# f2fs_io get_cblocks ./fio-test
> 192
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f4fd6c246c9a..267db5d3993e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3025,6 +3025,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   								1)) {
>   						retry = 1;
>   						break;
> +					} else if (ret2 && nr_pages - i < cc.cluster_size) {

What about:
i = 0, nr_pages = 4,
pvec.pages[0].index = 0
pvec.pages[1].index = 4
pvec.pages[2].index = 5
pvec.pages[3].index = 6

Thanks,

> +						retry = 1;
> +						break;
>   					}
>   				} else {
>   					goto lock_page;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
