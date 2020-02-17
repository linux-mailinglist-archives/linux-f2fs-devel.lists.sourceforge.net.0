Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A43021607D3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 02:41:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3VPH-000577-83; Mon, 17 Feb 2020 01:41:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j3VPG-000570-2J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 01:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CuIIF0NRN7sickqt7X3jZJxmE/mhGbAzvl4k/cnqxqA=; b=Ec/TnbR3e2I6HMfN2icQPGBFeo
 Jvz7Ju5PSbCsrs+3gLtw8VnadAuMN5EBqcKmLjNzDZjkF1Du4VqJ42Uvq+QngU6uTm6lM6UluMv3A
 7z/f1fv9DADodg9sfvG7OfOpb6VExtD4yLd1zetSMYCChe55C8j7Uftsg3IbQ6/AnmNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CuIIF0NRN7sickqt7X3jZJxmE/mhGbAzvl4k/cnqxqA=; b=mhIcypCwH9KKQ2YzAR674L4UgN
 9ChdI3BmOA59C40LhhoAp7EJtonYILi0L5VEVNqeA9WIHnJqxI5LjBeEVHp8ctJ4pTB5DXAMYxCx3
 30+qwco92Du6CD3gCnABjys0poisUxzjVd1/QotHPLfV9b4PskBWUdytWkqxe5NQRJ1k=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3VPC-005zwE-CG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 01:41:06 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7CD18B4D637C8E4DA0A6;
 Mon, 17 Feb 2020 09:40:53 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Feb
 2020 09:40:49 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200214185855.217360-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2ea7ce0e-b40e-e80b-55b6-8256b3e9c2c1@huawei.com>
Date: Mon, 17 Feb 2020 09:40:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200214185855.217360-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j3VPC-005zwE-CG
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: skip GC when section is full
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

On 2020/2/15 2:58, Jaegeuk Kim wrote:
> This fixes skipping GC when segment is full in large section.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/gc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 53312d7bc78b..65c0687ee2bb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1018,8 +1018,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  		 * race condition along with SSR block allocation.
>  		 */
>  		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
> -				get_valid_blocks(sbi, segno, false) ==
> -							sbi->blocks_per_seg)
> +				get_valid_blocks(sbi, segno, true) ==
> +							BLKS_PER_SEC(sbi))

Then in large section, if current segment is all valid, we won't skip scanning
it, so do we need to change like this:

if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
	get_valid_blocks(sbi, segno, false) == sbi->blocks_per_seg ||
	get_valid_blocks(sbi, segno, true) == BLKS_PER_SEC(sbi))
	return submitted;

>  			return submitted;
>  
>  		if (check_valid_map(sbi, segno, off) == 0)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
