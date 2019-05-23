Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A368327F50
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 16:15:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hToVQ-00007X-5i; Thu, 23 May 2019 14:15:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hToVO-00007O-L9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHq1aUEbcNTAKxpZctyqvUIjLkc9d2zhYs+hftD2Lrk=; b=m5YiU5yJV3MNJhO2G/3w6XXbfw
 w1fNn5QjzXLUgtEZUG5GZC3yJscJXzitT9KRkLuWbaGx3Qbh4T7pb9nFQ7C0XHuiEvcSb4ZmZk6dd
 M3b8HXaQ17J5MUcs5keupZoR41JiYlrNV5Zfbkoxom2WV1LQpc84gp4UoIySRu9U9R34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fHq1aUEbcNTAKxpZctyqvUIjLkc9d2zhYs+hftD2Lrk=; b=ThifbOwrEGBB1yhyARH6lFXZ+4
 cavDAEvAt1lEDeuDt4F0FhANC9VSl9pdYnTxY3J5JI2RJKxp/X2GjJ7mj/Y8GG/XcGdd3SIijf8v4
 sPshefwZ5QuO/W4LtyyxQVLD6z9Ce+AuG12U0Gb7THuHszb30xNgJyB059Duagi/2sHQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hToV0-009J7q-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:15:38 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87BD1217D4;
 Thu, 23 May 2019 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558620908;
 bh=qwqlp4bdgNAL+XXJWyRakX+x/x/fQQBKtG0R3j4UKuE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XTxxRgdeWMni1dVmxaHBtbu+ZdPMPvWGQZTzIflHd6RDFyPy8RAFJg32tFRfnv+ET
 IWvNveyS49xlC/6ZEX1+KLtZ9xIqSjLnfqlZSAY3W3ZnvGTgFOrJTsdBZlYRZZIqUJ
 bc64AGFAz6qMS/SHOdfaeMjgKFf9DKvy65YCah8I=
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190521180606.10461-1-jaegeuk@kernel.org>
 <20190522175035.GB81051@jaegeuk-macbookpro.roam.corp.google.com>
 <14672901-54a2-120f-a2ce-52f7d6fb3008@kernel.org>
 <20190523140649.GA10954@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <fc1eda2c-1d31-749f-03ef-eed152fb42c0@kernel.org>
Date: Thu, 23 May 2019 22:14:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190523140649.GA10954@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hToV0-009J7q-Gg
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add missing sysfs entries in
 documentation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-23 22:06, Jaegeuk Kim wrote:
> On 05/23, Chao Yu wrote:
>> On 2019-5-23 1:50, Jaegeuk Kim wrote:
>>> This patch cleans up documentation to cover missing sysfs entries.
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
>>> + reserved_blocks	      This parameter indicates the number of blocks that
>>> +			      f2fs reserves internally for root.
>>> +
>>
>> I mean we can move below entry here.
> 
> Ah, I'd like to keep the order defined in sysfs.c.

No problem. :)

Thanks,

> 
>>
>> current_reserved_blocks	      This shows # of blocks currently reserved.
>>
>>> + reserved_blocks	      This shows # of blocks currently reserved.
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
