Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0225B838
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 03:20:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDdvg-00066J-9A; Thu, 03 Sep 2020 01:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kDdvf-00066C-2L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/ySEDw7/bf3vT9yKCkDx6yiNEXf8syn+lPJiOUvjmA=; b=BI/gmz+eGmdl+DVwF/6b1a3fYW
 /UTPhW7lA0Gd7dLA0KdVDYpqrdLZpoX/VQvpCTpJSiosNRhvkk2OecFWDxc4id5nMpx9VIA4YWGDz
 hhGBdXgPgIF3KYR2L3kOLdzqUa4zBizLyE4gmP/0/EiGK/DDMnG9hLTIKiC1oi1WoheM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/ySEDw7/bf3vT9yKCkDx6yiNEXf8syn+lPJiOUvjmA=; b=kmxGRcD1GrOCcCfyI0cYMbTnk8
 PcQJbFnibJ6nv49wJip3sqpuseU8FQyJUyUQJaCwASLpebPTZ55/J+0tRstjCSyKl07OIat66uxD4
 pgWJ/AseJE8MiXCHy9XOkbaj4RXcSHA+vZEeMXNdzJSf3cXVlHrkvvfYp0HLMGpVMKeY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDdvX-009ruq-3L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:20:42 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 66E11A359413BFEEDB9E;
 Thu,  3 Sep 2020 09:20:20 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Sep 2020
 09:20:16 +0800
To: Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>, "Jonathan
 Corbet" <corbet@lwn.net>
References: <96f99afb-c54e-8f46-ebac-80a62f65b876@infradead.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <dac8c5b0-cf6d-384c-4511-680e2dd7bb4b@huawei.com>
Date: Thu, 3 Sep 2020 09:20:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <96f99afb-c54e-8f46-ebac-80a62f65b876@infradead.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kDdvX-009ruq-3L
Subject: Re: [f2fs-dev] [PATCH] f2fs: Documentation edits/fixes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/9/3 8:08, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Correct grammar and spelling.
> 
> Drop duplicate section for resize.f2fs.
> 
> Change one occurrence of F2fs to F2FS for consistency.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <yuchao0@huawei.com>
> Cc: linux-f2fs-devel@lists.sourceforge.net

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
