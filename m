Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E1891D13
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 08:30:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzbBW-00024c-5L; Mon, 19 Aug 2019 06:30:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hzbBT-00024U-Im
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 06:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p21ypM+5BNSWS4TrNryo7BPOzVcumu8IQdA+Go1fRPM=; b=ZskeIbAr6lXt5M89v6Zk4Pn8sc
 eCHOXxqAKYmEBt9edTJ+NVFk9gKzPxSmX5H+POwcrptR9HlcxLkC6onhRT8oGsHpK3AD0md10dkzJ
 qKHWVkfhQ8CWEEoBuVh+Bpm+iLJdKGiW23eA3JeLuK6ms8lZtXB1258sV+zhXOQkIahA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p21ypM+5BNSWS4TrNryo7BPOzVcumu8IQdA+Go1fRPM=; b=F+DXK065wmWSpK8sqFo9ewdF5i
 BoZPLuymnZ/pP4njOFNjdT9o9jOrGvZNEn1GGjp/r1KUlKn+aU4g7n8VgaKU5l3KvQ3nZkr8ZDwZ5
 lLXh2hZ6vt2+4/NWIqHkO/psKTrY3CXRrlP/buT3WFiHENHafqirJYasD5oBKICs0+Ac=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzbBR-007x3K-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 06:30:27 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 434CF35303F54581EDF2;
 Mon, 19 Aug 2019 14:30:17 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 19 Aug
 2019 14:30:13 +0800
To: <jaegeuk@kernel.org>
References: <20190816030334.81035-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3349ceea-85ac-173a-81a4-1188ce3804ca@huawei.com>
Date: Mon, 19 Aug 2019 14:30:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190816030334.81035-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hzbBR-007x3K-Fi
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by
 forbidding SSR overwrite
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/16 11:03, Chao Yu wrote:
> There is one case can cause data corruption.
> 
> - write 4k to fileA
> - fsync fileA, 4k data is writebacked to lbaA
> - write 4k to fileA
> - kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
> - write 4k to fileB
> - kworker flush 4k to lbaA due to SSR
> - SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
> data
> 
> One solution is tracking all fsynced file's block history, and disallow
> SSR overwrite on newly invalidated block on that file.
> 
> However, during recovery, no matter the dnode is flushed or fsynced, all
> previous dnodes until last fsynced one in node chain can be recovered,
> that means we need to record all block change in flushed dnode, which
> will cause heavy cost, so let's just use simple fix by forbidding SSR
> overwrite directly.
> 

Jaegeuk,

Please help to add below missed tag to keep this patch being merged in stable
kernel.

Fixes: 5b6c6be2d878 ("f2fs: use SSR for warm node as well")

Thanks,

> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/segment.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 9d9d9a050d59..69b3b553ee6b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2205,9 +2205,11 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  		if (!f2fs_test_and_set_bit(offset, se->discard_map))
>  			sbi->discard_blks--;
>  
> -		/* don't overwrite by SSR to keep node chain */
> -		if (IS_NODESEG(se->type) &&
> -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> +		/*
> +		 * SSR should never reuse block which is checkpointed
> +		 * or newly invalidated.
> +		 */
> +		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
>  			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
>  				se->ckpt_valid_blocks++;
>  		}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
