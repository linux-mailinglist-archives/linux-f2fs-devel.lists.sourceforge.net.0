Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F75ADD95
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 04:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVOie-00022j-TK;
	Tue, 06 Sep 2022 02:53:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oVOid-00022d-HM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 02:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C2/UbM19Sv/xuC7oOgkR4RenKgfA2PkcUBwPSm2X9w8=; b=cCMZv3k8MvzWNSJsX/05pcWOwY
 vsdjZXRkJYMtL2GkebWfCAR+IgEzuAVQPxgWJ2MtRueF2aFbBfi7NnoN2175oXV+c5LFbL/Y+1Vzu
 jwiXkL+ie3bRNmunziEUdHMsPkTza3jJ/kdtNRmlhdUOCrZoZJAAZqq+zxAYBP741qdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C2/UbM19Sv/xuC7oOgkR4RenKgfA2PkcUBwPSm2X9w8=; b=gzXfgD0aUc1guRwoz0TjNsbNyO
 iBLVtniGJVhVCseogkBAUqrr5ogLT2Q7kaw5xCobFb6IaOjvB1ARgTSAwOQH6W2dn9t7V85b7T/dj
 9eYXS5nh0ofxDDlzS0H6WGHtn53usyd9j1sk+0Nt/O/G4BogkSzxFgHSh/eyWIfvAsxg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVOiZ-0006fn-9m for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 02:53:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBB6B61226;
 Tue,  6 Sep 2022 02:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5576AC433D6;
 Tue,  6 Sep 2022 02:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662432809;
 bh=AK0Nw6F6Z3g44yWrW77vH4JjW3xr55YYMPyxCOW6ka4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cm7X0ADuATnRjp5k+Eun1RVQmzYY+pH+zEXd2Td3kWSaisIFwN3mJvx5wlyxFaXpf
 0dNJFvmbDviNoM1JmYTTtthhkgp/krbW/ufB4twMSC3op1v0HMR/RWkmgq4b2+eAbM
 q16QvNmdxJSYELXrXQmznNtcxjwiY7yWyoUkwCOg/e9s/nKqpRYkolLUIqc/ntmWmN
 OXxoFLTnjVvc6loPyTWOKp1O+vencPP9ziKcIo3hWIkjHuagDkVbHbFul5eFWbI6hq
 YSyCCFPoT7BuREwwJ2TuW7gowRinX6+4BfZjh4/aZPSbfi1uGq6is0zGXZ2mzrNVTq
 dZKcZIHyrvh2A==
Message-ID: <bf003c19-7d0b-9045-0df5-baf423bdb8e9@kernel.org>
Date: Tue, 6 Sep 2022 10:53:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220825024102.120651-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220825024102.120651-1-zhangqilong3@huawei.com>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/25 10:41, Zhang Qilong wrote: > If the written page
 was mapped more than twice, the > written data here will not be seen by others.
 We add > the flush_dcache_page to fix it. > > Fixes:0a2aa8 [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVOiZ-0006fn-9m
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: add flush_dcache_page after page
 was written
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

On 2022/8/25 10:41, Zhang Qilong wrote:
> If the written page was mapped more than twice, the
> written data here will not be seen by others. We add
> the flush_dcache_page to fix it.
> 
> Fixes:0a2aa8fbb9693 ("f2fs: refactor __exchange_data_block for speed up")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   fs/f2fs/file.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ab9844eaa62c..b593e41dbfb3 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1273,6 +1273,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
>   				return PTR_ERR(pdst);
>   			}
>   			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
> +			flush_dcache_page(pdst);

__clone_blkaddrs() was introduced for fallocate() w/ FALLOC_FL_COLLAPSE_RANGE
and FALLOC_FL_INSERT_RANGE cases, they are both covered w/ invalidate_lock, and
before __clone_blkaddrs(), it will call truncate_pagecache() to drop all mapping
of pagecache, so it's safe here?

Instead, in f2fs_move_file_range(), we need to cover __exchange_data_block()
w/ invalidate_lock and drop pagecache as well as fallocate() does?

Thanks,

>   			set_page_dirty(pdst);
>   			f2fs_put_page(pdst, 1);
>   			f2fs_put_page(psrc, 1);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
