Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E32ACAF2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 03:19:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcJFa-0006t3-QT; Tue, 10 Nov 2020 02:19:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kcJFZ-0006ss-Sr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 02:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zn/FMvl9nu/TuUobFJCW5ohBDsAnx4u+X6UWCagp5eg=; b=auuaxDvAnxAdUfvRdXyGrZlctW
 nRFya7PpmfUvJNonFeBQX7ZxhUPyjgI/nELO0DUAHEGy8ZoQqgbbcCzBEpsXKK4Eh0VEeYHKcvvkV
 qfA9Tr1uElMPgBC5gtPrFN1+m1drXoDp/PIhOQclPIZ2Wkw2NatXwgj86ZKTqRXqf0Y0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zn/FMvl9nu/TuUobFJCW5ohBDsAnx4u+X6UWCagp5eg=; b=iIrfEkUqsQNQLQbqvqD6DvFQnF
 5p04YcwTZs6oOWAdfcW6GFOuQX7qaQn/uu9tfwT5039cSqoPnZI6wxQmgWFGXn0ObhJfoKzVFH9jI
 Kzc3u1STW0T0aZhzWaCY88ZLxBsLFp4LhwsFd7fQWsYDxuShRUaP0uODxn2dp+i0Z+G4=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcJFL-006H4d-4N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 02:19:13 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVWkX1X96z6xWn;
 Tue, 10 Nov 2020 10:18:44 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 10 Nov
 2020 10:18:47 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20201109180351.2330062-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a0e634fa-40a9-97f4-0438-cd60a27fe95d@huawei.com>
Date: Tue, 10 Nov 2020 10:18:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201109180351.2330062-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kcJFL-006H4d-4N
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: show a message when compression
 is enabled
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/10 2:03, Jaegeuk Kim wrote:
> This patch adds a message when formatting the disk with compression.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
