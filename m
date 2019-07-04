Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9EF5F35E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2019 09:22:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiw4R-00007s-Pd; Thu, 04 Jul 2019 07:22:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hiw4Q-00007i-W3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 07:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/iMCdphMYDMw8UKJleCzGSlJIZJloqC1UptHrIEhWQ=; b=lV2AFe/i96TgDndKFrfCrYIzwA
 3YHrw+6GL1+BM4ynQ+ZrzL5R7FLi8/euz9Q7IfORl1YZqaWsz2DHGrijHkcOfwnMuuwQvilIg0MJ2
 kuvGeVcrkUojaF3WnmdXu3dW4zYiYg9TbWqvtjwiTngg4r8H1KYpx3uIvGVzy2HaIbWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C/iMCdphMYDMw8UKJleCzGSlJIZJloqC1UptHrIEhWQ=; b=kgAUsEFWgPQ/zXeoqevBX9wPuN
 VwgYMFSuc6MjSUfADJhiD3UuTe1KMh4yR0cIaSCP6WFrd3Imp+a3XBta7qAbKgwv5drEOI8raywOU
 6Tf9pibFGLCy0mhGYfmz+9cHQilUrree7qob1t2Eh/e9aaYJtTi/Itulcn29k/2CgyN0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hiw4Y-007fPx-43
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 07:22:28 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 47A2D71C5B86DF84055;
 Thu,  4 Jul 2019 15:22:18 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 4 Jul 2019
 15:22:14 +0800
To: Ocean Chen <oceanchen@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20190703153320.203523-1-oceanchen@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d3a24db9-72a2-a162-025a-505909cf6ef2@huawei.com>
Date: Thu, 4 Jul 2019 15:22:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190703153320.203523-1-oceanchen@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hiw4Y-007fPx-43
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid out-of-range memory access
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/3 23:33, Ocean Chen wrote:
> blk_off might over 512 due to fs corrupt and should
> be checked before being used.
> Use ENTRIES_IN_SUM to protect invalid memory access.
> 
> --
> v2:
> - fix typo
> v3:
> - check blk_off before being used
> --
> Signed-off-by: Ocean Chen <oceanchen@google.com>
> ---
>  fs/f2fs/segment.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8dee063c833f..c3eae3239345 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3401,6 +3401,9 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
>  		if (seg_i->alloc_type == SSR)
>  			blk_off = sbi->blocks_per_seg;
>  
> +                if (blk_off >= ENTRIES_IN_SUM)
> +                  return -EFAULT;

- scripts/checkpatch.pl will complain such format.
- miss to call f2fs_put_page(page, 1) before return.

Thanks,

> +
>  		for (j = 0; j < blk_off; j++) {
>  			struct f2fs_summary *s;
>  			s = (struct f2fs_summary *)(kaddr + offset);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
