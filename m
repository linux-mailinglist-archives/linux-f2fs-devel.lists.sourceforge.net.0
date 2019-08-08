Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF0857A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Aug 2019 03:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvXJN-0000ja-DD; Thu, 08 Aug 2019 01:33:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hvXJL-0000jS-L3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 01:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4OHDyy6VuBHdhxnZlw3srKtZA8JsoqhmWDekznb5DJs=; b=OOJ9FuGc+eUGI92+UzDZdQD4C6
 4QRa9mAYGTd3DtW7cB4lC9lJTfBpxeYOJr0DifYRKdg5nbhPYdR+7UTnjj0+ixyUIcFL84EsblMOg
 wwyIWli0aR2d/hunvEBXJ18GHvXULgBJTohDl8PwpibNMC9apIIE899txRoddDgIq1Ko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4OHDyy6VuBHdhxnZlw3srKtZA8JsoqhmWDekznb5DJs=; b=HruSGEEsx+pNaB+95BJoeax3Pn
 2/J13S6++wmszlyJtqZA0vaCNfFHpk9Q4nW1YiMgLy5R4dSWrXLCEwfCHF2miTwsXIWNGBWijTI6d
 Jvvp4fO33EipBA+pdJT5Ce03mXyO5ED+szSouyxzb+gaMud5Li6/SklHSseAySa+37KI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvXJJ-00EZk1-Kf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 01:33:47 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 77D0B23F1D59FC61A499;
 Thu,  8 Aug 2019 09:33:38 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019
 09:33:33 +0800
To: Surbhi Palande <f2fsnewbie@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190807205428.3454-1-csurbhi@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <37151a93-66e6-b8ee-2727-b5dc4a57aab7@huawei.com>
Date: Thu, 8 Aug 2019 09:33:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190807205428.3454-1-csurbhi@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hvXJJ-00EZk1-Kf
Subject: Re: [f2fs-dev] [PATCH] Return valid segment type in 4 head logging
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/8 4:54, Surbhi Palande wrote:
> The valid type of current segments in a 4 head logging scheme are:
> 
> CURSEG_HOT_DATA, CURSEG_COLD_DATA
> CURSEG_HOT_NODE, CURSEG_HOT_NODE.

I didn't see a very strong reason to force to use HOT/COLD keyword in datas
type, WARM and COLD can also separate different temperature of datas, right?

> 
> When a direct node page is not explicitly marked cold,
> return CURSEG_HOT_NODE as it's segment type. 
> CURSEG_WARM_NODE is not a valid segment type in a
> 4 head logging scheme.

AFAIK, by default, recovery will traverse and replay all regular's dnode in
linklist of warm node segment, in order to keep recovery mechanism valid, we
keep the rule of allocating warm segment for cold node (regular's dnode).

Certainly, you can change to use HOT_NODE to store cold node, however we should
adjust need_do_checkpoint() as below to trigger checkpoint for every fsync,
sadly it will cause obvious performance regression, we can't afford it.

else if (F2FS_OPTION(sbi).active_logs != 6)
	cp_reason = CP_SPEC_LOG_NUM;

Thanks,

> 
> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
> ---
>  fs/f2fs/segment.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a661ac32e829..b904b5d7b4df 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3006,8 +3006,8 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
>  		else
>  			return CURSEG_COLD_DATA;
>  	} else {
> -		if (IS_DNODE(fio->page) && is_cold_node(fio->page))
> -			return CURSEG_WARM_NODE;
> +		if (IS_DNODE(fio->page) && !is_cold_node(fio->page))
> +			return CURSEG_HOT_NODE;
>  		else
>  			return CURSEG_COLD_NODE;
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
