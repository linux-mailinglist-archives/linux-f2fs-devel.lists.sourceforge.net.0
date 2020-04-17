Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 257681AD75A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2020 09:26:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jPLOQ-0004XF-J9; Fri, 17 Apr 2020 07:26:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jPLON-0004Wr-Fq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Apr 2020 07:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EheQyBEd0lM/7NgkUZ90rLiCvMJ0wzl2QRq+Jozy/Xg=; b=URxlVa3PkBkfBu3XY9migmjubd
 RE8jq04PZ6joWj+hXoEspRm5OMEbQnJpcTiT8boVkja6RNLl/VSV2lO2O9LQbRvgI7sgUrRz8Jlde
 ocu03p4Yb7mWfZ1AyrDwrBSQN28Bob67JXnso5yi/I1782sYKtSJDIbR9OD6FbS7VKRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EheQyBEd0lM/7NgkUZ90rLiCvMJ0wzl2QRq+Jozy/Xg=; b=VsEtEnqIDZQ1PjiA9eGkYgJN13
 8EC4cFpFEp4niFt28j5NZsNTyQrgAuosQoXOv+Q6ZYWqzsvj8g0oc2rnlUrOGM8bG2jMxvCyWAiPC
 6yrhXdWdn/ZP5cCuGpXqsgcW8hW+FZHn1j1WNbLfypdL4iQdQnr+sFoIISjod1NVesX8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jPLOK-002okM-M9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Apr 2020 07:26:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0AA69904CA792C4204D4;
 Fri, 17 Apr 2020 15:26:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Apr
 2020 15:26:08 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sahitya Tummala <stummala@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200331035419.GB79749@google.com> <20200331090608.GZ20234@codeaurora.org>
 <20200331184307.GA198665@google.com> <20200401050801.GA20234@codeaurora.org>
 <20200403171727.GB68460@google.com> <20200403172750.GD68460@google.com>
 <20200413174237.GC39092@google.com> <20200414134403.GA69282@google.com>
 <20200416214045.GB196168@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e1b763bf-7f72-01eb-a368-9b70e0f46f55@huawei.com>
Date: Fri, 17 Apr 2020 15:26:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200416214045.GB196168@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jPLOK-002okM-M9
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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

On 2020/4/17 5:40, Jaegeuk Kim wrote:
> On 04/14, Jaegeuk Kim wrote:
>> On 04/13, Jaegeuk Kim wrote:
>>> On 04/03, Jaegeuk Kim wrote:
>>>> On 04/03, Jaegeuk Kim wrote:
>>>>> On 04/01, Sahitya Tummala wrote:
>>>>>> Hi Jaegeuk,
>>>>>>
>>>>>> Got it.
>>>>>> The diff below looks good to me.
>>>>>> Would you like me to test it and put a patch for this?
>>>>>
>>>>> Sahitya, Chao,
>>>>>
>>>>> Could you please take a look at this patch and test intensively?
>>>>>
>>>>> Thanks,
> 
> v5:
>  - add signal handler
> 
> Sahitya raised an issue:
> - prevent meta updates while checkpoint is in progress
> 
> allocate_segment_for_resize() can cause metapage updates if
> it requires to change the current node/data segments for resizing.
> Stop these meta updates when there is a checkpoint already
> in progress to prevent inconsistent CP data.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
