Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23B1CA7EE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 12:09:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWzwZ-000433-4c; Fri, 08 May 2020 10:09:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWzwX-00042e-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 10:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8C2csNarGX2B983oO09cDhupw8Qzhq6ZoG7l7088ns=; b=HyyZG4WNJxUjJ/hHokSgXPo5WR
 PWQZOBqKweFoPmotrc9U0yhzJgO+cF/MvPeoKpFha+9FrPP/+TzgzUH0wa2+/cYlv1RYZ+uR7bm4b
 TgUkAWPJPPpemIjzn/ZdZ53gtj2Ame8jb0GYv0naaKu4wRbjUIDaWuJTtlGvLAMtboiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+8C2csNarGX2B983oO09cDhupw8Qzhq6ZoG7l7088ns=; b=Z06Ew0dLryuaPMugk7hdOmkzet
 k0zqaFM+AVPZ2ziXAhi+40a6QiJ7i5CPr5UsbxLQXxTADrshDmK4JDEwwz9F0WDux+Vp3UMujBW9s
 L6K0/GpVPXYNgaY0qbPJmYxI4b+8brWuE6KeX5H9XJdjUbCTL9NJtE34wV9CfEwGgDRY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWzwT-001bfC-Pb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 10:09:21 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D885121B782EE6AB13B5;
 Fri,  8 May 2020 18:09:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 8 May 2020
 18:09:08 +0800
To: Daeho Jeong <daeho43@gmail.com>, <kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>,
 <jaegeuk@kernel.org>
References: <20200508092921.208447-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9f33e647-c5b1-aa7e-aaf0-102e7b35c64c@huawei.com>
Date: Fri, 8 May 2020 18:09:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200508092921.208447-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWzwT-001bfC-Pb
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing
 cblocks
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/8 17:29, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Now, if writing pages and releasing compress blocks occur
> simultaneously, and releasing cblocks is executed more than one time
> to a file, then total block count of filesystem and block count of the
> file could be incorrect and damaged.
> 
> We have to execute releasing compress blocks only one time for a file
> without being interfered by writepages path.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
