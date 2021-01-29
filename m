Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F646308309
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Jan 2021 02:13:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l5IM7-0005TI-To; Fri, 29 Jan 2021 01:13:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l5IM7-0005TB-55
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 01:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5MlhdJkNshgbGy7o3VSaMgAPVNg8Nf6Uo6FA2CQsds=; b=IwT8amf7QlUVHdwDf4i6PArbYw
 CDpjXGJJP9uKIcUgDlOEqyQvD7TKGFRxvkjGNsxvHFmpVYJZCYieWC9+m+yEHA3s6HGUNNTAKGGdH
 vkFFoaQXwN6lp5lVKXdTVqDdRI4fLRCgVB3RcBolx0sc5AesdQgoQKT/nqlJcEfXcEug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C5MlhdJkNshgbGy7o3VSaMgAPVNg8Nf6Uo6FA2CQsds=; b=REBid5V2uy4S1Vs6ZJ71WHrhxf
 D5odoxzmIoT/vkJ/qY/tVr+39qFLPjczPNiPLNdw2deWWVHbAonWkq97KDaL4cbSjQepT+ZP0mpf1
 fFAyzGqo/7VaHM3QeSeOP9Y0lPOWGXl19JqinWXKr/e3T9cVFWp6Xyxm51KaYXVT1eRg=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l5ILu-001yfv-5V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 01:13:46 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRfT64SfszjCt2;
 Fri, 29 Jan 2021 09:12:26 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 29 Jan
 2021 09:13:25 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <abc09f9f-561d-df8a-b835-6b5d7a15232c@huawei.com>
 <X/8UtJU9Dy30kC7I@google.com>
 <37ba41db-2589-e155-c416-d0c8832026cb@huawei.com>
 <X//DPI10+ZXvHkYH@google.com>
 <8e88b1e2-0176-9487-b925-9c7a31a7e5cd@huawei.com>
 <YAGt0i244dWXym4H@google.com>
 <20a1dbd3-808e-e62a-53f3-7f1e2a316b3c@kernel.org>
 <YAdSTzYF8Hvxdcqy@google.com>
 <068da0d3-18c9-53f7-0f24-63b07e1af272@huawei.com>
 <9b982458-57e1-a04d-c5d4-f5ca775af1e7@huawei.com>
 <YBLifNK5EXedfhbs@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <eb25281b-a40e-8965-cdf5-b7c461fbe195@huawei.com>
Date: Fri, 29 Jan 2021 09:13:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YBLifNK5EXedfhbs@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l5ILu-001yfv-5V
Subject: Re: [f2fs-dev] [PATCH v3 1/5] f2fs: compress: add compress_inode to
 cache compressed blocks
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

On 2021/1/29 0:12, Jaegeuk Kim wrote:
> On 01/28, Chao Yu wrote:
>> On 2021/1/22 10:17, Chao Yu wrote:
>>>> No, it seems this is not the case.
>>> Oops, could you please help to remove all below codes and do the test again
>>> to check whether they are the buggy codes? as I doubt there is use-after-free
>>> bug.
>>
>> Any test result? :)
> 
> It seems I don't see the errors anymore. Will you post another version?

No, your test result only indicate that bug was caused by race condition
of that line with high possibility, however I've no idea how that happen
after several round code review. Still struggling in troubleshooting this
issue.

Thanks,

> 
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
