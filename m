Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147235D5CE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Apr 2021 05:23:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lW9eV-00006v-A5; Tue, 13 Apr 2021 03:23:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lW9eT-00006h-S3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 03:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FM9wHrhmfKpBcOkwnOYiwl4pugezaakisd+LcjUxLsc=; b=hUv6SnSZ55yg9U9Emx01YclEhz
 p26si7TTXOvMVWaAOXTWHf+mAeUA3TniccUJtLgdIrZPkqRVA0EyqRI90AQxexMd6gJvqmmiRQf8Y
 sGiAsxlk0duOSb2760Tujnxt3X45d42EoP/rLgnXOsIl4HRLx2ck+TMSqjQNFrGCBoUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FM9wHrhmfKpBcOkwnOYiwl4pugezaakisd+LcjUxLsc=; b=POiXttniWyuTdHuVmUxKu5fP/I
 4HPjk2MzpnrL9MvLXXKnQESnNPZ8dKN6ZzbKcmKR5ikNlzRCmj0VZuMvIf1fltQqtv7np1NXSzYOt
 NPX9uukXDSum16Uj6ZfbFuXyJ3/OySSoOstp/9gsBBgnw1djKbeQyW7s/4n3LbD3LnVo=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lW9eO-00DVmL-Op
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 03:23:45 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FK9qZ37N7ztVdX;
 Tue, 13 Apr 2021 11:21:14 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 13 Apr
 2021 11:23:25 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20210324031828.67133-1-yuchao0@huawei.com>
 <YFvQGxLbpmDjxEzR@google.com>
 <2dfb085b-80ce-050b-5650-986675a07488@huawei.com>
 <66e0a225-7f52-a33e-ccd6-e7bfa1067ed1@kernel.org>
 <YHUJFElliMOWMbWN@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1954fdd1-8e2a-123c-6a92-ab2ba0dad958@huawei.com>
Date: Tue, 13 Apr 2021 11:23:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YHUJFElliMOWMbWN@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lW9eO-00DVmL-Op
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid touching checkpointed
 data in get_victim()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/13 10:59, Jaegeuk Kim wrote:
> @@ -2701,7 +2689,7 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)
> 
>   	reset_curseg(sbi, type, 1);
>   	curseg->alloc_type = SSR;
> -	__next_free_blkoff(sbi, curseg, 0);
> +	__next_free_blkoff(sbi, curseg->segno, 0);

Forgot to assign curseg->next_blkoff here, I checked generic/083, it passed,
let me run all testcases.

Thanks,

> 
>   	sum_page = f2fs_get_sum_page(sbi, new_segno);
>   	if (IS_ERR(sum_page)) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
