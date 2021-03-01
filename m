Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C083275F4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Mar 2021 02:59:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGXqA-0001xe-S3; Mon, 01 Mar 2021 01:59:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lGXq8-0001xX-VH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 01:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmwThJRI4vp49Dh1AkKgZlYD9JbPwtFYcujnbW/mks0=; b=ahUJLdUn/iXGKymtxzka3XH5KK
 lMWU+4MwBdVHiEuZrxA4VWEf6prBWiKhtJzNwi/dWzjIYhIsIFaYJla8aIjl7XujnizK3R8Q8bWpe
 oh84QddxgvEYCebD0XmOtSeBn+Pbkg9BKl/xs8BCAJAM3+3HPLnWBCH5EDrssspdvZQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmwThJRI4vp49Dh1AkKgZlYD9JbPwtFYcujnbW/mks0=; b=XoBDSWWIx2NonYlPxhFIGWncmB
 8H3EXibMXZABW+bEn/rxiM5VCOrb+XaMVKKOg4enxpHjtmiUKBOWkbJ3x+hTCt+LUm6+xWedZ1Ofo
 6QfVYsT/jT3ducUBuKIxtMTZbcQwVC1tru6hmVqw7WvfxzIaY5ICpTXU6mfuQjaD95rs=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGXq1-009IEX-4w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 01:59:16 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dpk0Z6Q5Hz165PD;
 Mon,  1 Mar 2021 09:57:18 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 1 Mar 2021
 09:58:54 +0800
To: Huang Jianan <huangjianan@oppo.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210227120231.136559-1-huangjianan@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4b772e04-62fc-ed9a-a664-a908a464addd@huawei.com>
Date: Mon, 1 Mar 2021 09:58:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210227120231.136559-1-huangjianan@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lGXq1-009IEX-4w
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: remove unnecessary IS_SWAPFILE
 check
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
Cc: zhangshiming@oppo.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/27 20:02, Huang Jianan via Linux-f2fs-devel wrote:
> Now swapfile in f2fs directly submit IO to blockdev according to
> swapfile extents reported by f2fs when swapon, therefore there is
> no need to check IS_SWAPFILE when exec filesystem operation.
> 
> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> Signed-off-by: Guo Weichao <guoweichao@oppo.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
