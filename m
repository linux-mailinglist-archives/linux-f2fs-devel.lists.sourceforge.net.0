Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1A37B463
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 05:11:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgfHF-0000WL-GC; Wed, 12 May 2021 03:11:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lgfHE-0000WD-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 03:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Whn5Hop/gldmNd/YQt27DPv2Z/3r6NdvinCHi+gpX0o=; b=DDmSFyBBhIeqdChiI8/vb12qDV
 6YKtume1tL9sb86K+D0o8RN/3rTHYK2Uch3PIPFu3ZGIaE9drsCoE3LevG2soSGqtFDY5MZRh9xvU
 qJMEWs+R5qz1v16xw4IbhgLkWMyc3fi7l7ly2q5a4zP4yuwODxoEC9Vozir/K2lzKW9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Whn5Hop/gldmNd/YQt27DPv2Z/3r6NdvinCHi+gpX0o=; b=X4DX+YOmhWXSbFYicz6a+YXyeg
 A4pNp5B7qCJj2QzuSnolu4Kn6n+w5qflnsBJPuqqqqeNkbz3Y9LtU21AcxxOT4+mnVT200O5aUgd4
 72/1/gA4OngSZHOEOy417BjuOWT4B9AEQQh/wyZYhZ54XEniJz6WCmc4VVJhmW6nH5FA=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgfHB-004cis-94
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 03:11:14 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fg07S59LVzWf2b;
 Wed, 12 May 2021 11:06:44 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 11:10:59 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210511214337.2857522-1-jaegeuk@kernel.org>
 <925bff47-de32-76b8-041d-0aad4fec0d54@huawei.com>
Message-ID: <d02116f5-8c3f-ff06-9f97-857ec5f07e4d@huawei.com>
Date: Wed, 12 May 2021 11:10:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <925bff47-de32-76b8-041d-0aad4fec0d54@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgfHB-004cis-94
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid swapon failure by giving a
 warning first
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
Cc: kernel test robot <oliver.sang@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/12 9:28, Chao Yu wrote:
> On 2021/5/12 5:43, Jaegeuk Kim wrote:
>> The final solution can be migrating blocks to form a section-aligned file
>> internally. Meanwhile, let's ask users to do that when preparing the swap
>> file initially like:
>> 1) create()
>> 2) ioctl(F2FS_IOC_SET_PIN_FILE)
>> 3) fallocate()
> 
> Let me take a look how to migrate unaligned swapfile during swapon(). :)
> 
>>
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> Fixes: 36e4d95891ed ("f2fs: check if swapfile is section-alligned")
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Wait, shouldn't this cover check_swap_activate_fast() as well?

Thanks,

> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
