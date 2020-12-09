Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D72D3D57
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 09:31:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmutB-0004kc-3t; Wed, 09 Dec 2020 08:31:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmut9-0004kN-MG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BpUq5LD13pFu9XGzuuYFyRSKjKuZS2Zi2kPdCwvGkBI=; b=R28SsjRV2lPhdonZHQWFRlOUVv
 55qPkAx3k0K8SGOmg5r3Cks41oDnqcavTNht39GgslIBdTUnLQwUBsdo2xQHRd6RZZNdiXXghKgKf
 brvq/zuLWq80pVy3yjOl9Dd85sq5IZFtEWnL0RFQ7TFXkoZ9YFDU4sYViVe2t/iTAm2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BpUq5LD13pFu9XGzuuYFyRSKjKuZS2Zi2kPdCwvGkBI=; b=KX2CRSWCjqiHw4OEXbSyIfDwVG
 laY5je67u37N+41CxS+JQDlqotJhQiSEC0lZfmSDF+meHLDwyx89cchgzBsAXy+rqatXIjRZG2ukt
 DeqCpDLT5Y4V5JMZosUELCZ3Q7mefw+LqlPUcKlKArhw54z7f38QmAUdodQDeuZcgyP0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmusz-007WAA-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:31:55 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CrVcb4n1Cz15ZX9;
 Wed,  9 Dec 2020 16:30:55 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 9 Dec 2020
 16:31:25 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201208031437.56627-1-yuchao0@huawei.com>
 <22ac4df6-53ec-fb7c-c4dd-26435352a701@huawei.com>
 <X9A7Jn+cHRRcAmIi@google.com>
 <37d89d34-add1-5254-380b-233ef7a460d4@huawei.com>
 <X9BKX9PUMFkts9bI@google.com>
 <5398c880-d4d3-81b9-f3c9-765ba1470e96@huawei.com>
 <0d4a20ec-f6e4-ff24-8733-94cc3762195d@huawei.com>
 <X9CJc7xas7OqTZv2@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b3e385d6-b473-c4c9-308d-0285bc71b5b0@huawei.com>
Date: Wed, 9 Dec 2020 16:31:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X9CJc7xas7OqTZv2@google.com>
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
X-Headers-End: 1kmusz-007WAA-Hg
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: support chksum
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

On 2020/12/9 16:23, Jaegeuk Kim wrote:
> On 12/09, Chao Yu wrote:
>> On 2020/12/9 12:28, Chao Yu wrote:
>>> On 2020/12/9 11:54, Jaegeuk Kim wrote:
>>>> Ah, could you please write another patch to adjust the new changes?
>>>
>>> No problem, will drop "f2fs: compress:support chksum" based on your dev branch, and
>>> apply all compress related patches on top of dev branch.
>>
>> Jaegeuk, could you please
>> - drop "f2fs: compress:support chksum",
> 
> What I mean is keeping the old version in dev branch as is, since it gives
> another conflicts when dropping it. That can add another bug at this point.
> Can I get a separate patch to fix any issues in that original patch?

Oops...

Thanks,

> 
>> - manually fix conflict when applying "f2fs: add compress_mode mount option"
>> - and then apply last my resent patches.
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
