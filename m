Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8573331D25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Mar 2021 03:50:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJSRy-0006xG-81; Tue, 09 Mar 2021 02:50:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lJSRw-0006wt-FI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 02:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oMggAkaSuxcwupLsRBIgkzCK8E5O+N+nxPnRG6d9Oac=; b=CHZ73qk7lxrobmVoj6AQ/C5G5B
 X+dMKJW4wQzaRSPmqrL8nrKmTJL/ivrN8ltf7ffj2XL8Xaf2N8iJdmka93/WIQl0k8d0glMrxMbaY
 8yW0vuBfKyHiErnAo+KKUgFpHWlpFbsv9BtZGSr1lYscSG7PK3ZLJDfEd3xi3DMu0jQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oMggAkaSuxcwupLsRBIgkzCK8E5O+N+nxPnRG6d9Oac=; b=ExBrWKR7mZLVm7wgJo3bIhTzE8
 qsi8xKrMQZ1b5ZVqYXEvpxv+JpjZCFjHc7K2mpsjq6OgrIlq0gYLYkVDBsYxYhLATzj/XMqQj8IxX
 J7lrOpMGj1bVGlNCfIADJd5l/ex6mf0W66eb2D8/A94dWKL3wxMBDHO/DGTowbPY6r1g=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lJSRg-002aW8-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 02:50:20 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DvflV5rbMz17Hf5;
 Tue,  9 Mar 2021 10:48:06 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 9 Mar 2021
 10:49:49 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
 <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
 <YEa66ekikyuPWSyd@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a40929d4-a8de-98ea-8dd8-6c807d8a6adc@huawei.com>
Date: Tue, 9 Mar 2021 10:49:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YEa66ekikyuPWSyd@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lJSRg-002aW8-HQ
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 2021/3/9 8:01, Jaegeuk Kim wrote:
> On 03/05, Chao Yu wrote:
>> On 2021/3/5 4:20, Jaegeuk Kim wrote:
>>> On 02/27, Jaegeuk Kim wrote:
>>>> On 02/04, Chao Yu wrote:
>>>>> Jaegeuk,
>>>>>
>>>>> On 2021/2/2 16:00, Chao Yu wrote:
>>>>>> -	for (i = 0; i < dic->nr_cpages; i++) {
>>>>>> +	for (i = 0; i < cc->nr_cpages; i++) {
>>>>>>     		struct page *page = dic->cpages[i];
>>>>>
>>>>> por_fsstress still hang in this line?
>>>>
>>>> I'm stuck on testing the patches, since the latest kernel is panicking somehow.
>>>> Let me update later, once I can test a bit. :(
>>>
>>> It seems this works without error.
>>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9
>>
>> Ah, good news.
>>
>> Thanks for helping to test the patch. :)
> 
> Hmm, I hit this again. Let me check w/o compress_cache back. :(

Oops :(


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
