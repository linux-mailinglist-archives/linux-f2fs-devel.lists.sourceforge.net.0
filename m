Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7902CB281
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 02:52:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkHJx-0006i4-QC; Wed, 02 Dec 2020 01:52:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkHJv-0006hw-H4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 01:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KHXDCUnRk40HJLWikL1Muz5ZzcrC90gYrgji3P9VUM=; b=IfrFyj1cR3u2Q86nVDcVDb14Lo
 UhAfzyXnt5LJdAq+L5fK52mKUEYa5avOcU/7YDAWBVrMagxWpBAH0AcyQ+wxXraXAHbUPfH/nRPkW
 sZ/UChUgG0CMj4lDWeykTCv/cKdIaYRTw2QEjlFJxbNoqGGhz6T59Jlkh6qKJ1RvoskY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KHXDCUnRk40HJLWikL1Muz5ZzcrC90gYrgji3P9VUM=; b=OQm1RTgIpw/Q62DKltXG1L6G7P
 KnR6pBTxTjxPR2YqWd/27BHgERH8jKJHJRHrDU1lfVKDg23yU8RM3RTjfUddykhvz/76oWXVMISDd
 fnDEAgoJs+aF3E9dr/T8v2DWJIsn32eA/5MmK0kEJeXcjSiZpS9oA1Nk6rWYy8dhTuG0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkHJp-00Ezr9-5V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 01:52:39 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cm25F4pjhz15VC3;
 Wed,  2 Dec 2020 09:51:45 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Dec 2020
 09:52:04 +0800
To: Jack Qiu <jack.qiu@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20201201074547.1872-1-jack.qiu@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e2f5f972-7333-9758-22f5-e9413a37e703@huawei.com>
Date: Wed, 2 Dec 2020 09:52:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201201074547.1872-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkHJp-00Ezr9-5V
Subject: Re: [f2fs-dev] [PATCH] f2fs: init dirty_secmap incorrectly
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/1 15:45, Jack Qiu wrote:
> section is dirty, but dirty_secmap may not set
> 
> Reported-by: Jia Yang <jiayang5@huawei.com>
> Fixes: da52f8ade40b ("f2fs: get the right gc victim section when section
> has several segments")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
