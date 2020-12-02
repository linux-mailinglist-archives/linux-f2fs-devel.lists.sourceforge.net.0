Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD92CB27D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 02:49:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkHH7-0006ZQ-TL; Wed, 02 Dec 2020 01:49:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkHFN-0006Uv-7M
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 01:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hoG5stGjlwmGvvC2zhs8tjsR5p0nI8qOabEUAfti5EU=; b=X/5WSFmwTf7eW49snqO7i1+xYk
 MdQIdkmCiLBsVr4KyYJ0tQAQHdLksvUcuC1Iow1jQEybiOg8jKVvSxfr0gjuRgbMFk5nQlex6Wu/s
 9JD29tshXaJ7vvjOuc5tpfFZTehrcte9nwyPLKzu5uQ8kx4RIcVCpW+2DsJFBVd2hwrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hoG5stGjlwmGvvC2zhs8tjsR5p0nI8qOabEUAfti5EU=; b=YrxdUkD18i7jRR5hSJ2jNOAoP5
 xanuCzs1Ee7M9VTFbZFfD1QDUlT3BIhnhI6VxYC7wW914S4CZClvNubmNsD99kzsXZb+6n5ggqHVq
 CkSUJt2i+rqV/ugJMIsluuroPFcfKU+yk09SQBb8Jc15kF5Q9vQYhJr5pYgbwcaHcq2I=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkHFA-00EzNV-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 01:47:56 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cm1zq6NYNzhl3K;
 Wed,  2 Dec 2020 09:47:03 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Dec 2020
 09:47:25 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@android.com>
References: <20201126022416.3068426-1-jaegeuk@kernel.org>
 <20201126022416.3068426-4-jaegeuk@kernel.org>
 <20201201040924.GB3858797@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7ce64222-cda4-6ad5-9246-c176998b79bb@huawei.com>
Date: Wed, 2 Dec 2020 09:47:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201201040924.GB3858797@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkHFA-00EzNV-Pi
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: remove buffer_head which has
 32bits limit
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
Cc: Light Hsieh <Light.Hsieh@mediatek.com>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/1 12:09, Jaegeuk Kim wrote:
> On 11/25, Jaegeuk Kim wrote:
>> This patch removes buffer_head dependency when getting block addresses.
>> Light reported there's a 32bit issue in f2fs_fiemap where map_bh.b_size is
>> 32bits while len is 64bits given by user. This will give wrong length to
>> f2fs_map_block.
>>
>> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
