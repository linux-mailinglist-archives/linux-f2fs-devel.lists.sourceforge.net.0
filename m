Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C45A695AC1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 11:16:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i00Fb-0000fh-BN; Tue, 20 Aug 2019 09:16:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i00FZ-0000fW-EJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 09:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RqguCi7Qc/EkGMbtSDQ2a6qyQ+ADMpW4Sg0d8uSTlb4=; b=KjIaJZU+xK5bh4oRE/S9yPqZt1
 qg7k26k5+EuQvWt6ljahuqqS23hoBFtLBZf46d3DSr5M4+ipGtTIEL8ervVcDDpCfPTsmfLhw4LM8
 YzgwZ9EEERtcwHWfMEV8/ba6RyhODtxANLrB6pHmD/S2j7JOH/r5oOm6Kb1ap+4/uniY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RqguCi7Qc/EkGMbtSDQ2a6qyQ+ADMpW4Sg0d8uSTlb4=; b=O9yDY9X9hFLke+i+skBsUsxeRj
 8R1cF0MCXQM3xw/M134qDJOevoMTRQ7Ko+ezrJpZ4ENtbv4zO7wrYy3YfsQFXNVgY0reVpGpD4n47
 jRsUoozqAIK8qQwpZBAOCGBGwgAbEP3EtBqFC69JxXCtOI8bqFKECUc8OJ5pKVry5fqk=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i00FV-009Dq7-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 09:16:21 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4DB4249761FF6FC4C19B;
 Tue, 20 Aug 2019 17:16:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 20 Aug
 2019 17:16:00 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20190817010325.36501-1-jaegeuk@kernel.org>
 <723dac7b-2223-cf03-78ac-c417af5a404d@kernel.org>
 <20190820011602.GB45681@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d945b380-d1da-6f43-ef6a-2404e8c93293@huawei.com>
Date: Tue, 20 Aug 2019 17:16:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190820011602.GB45681@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1i00FV-009Dq7-Tn
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: check only max extra_isize
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/20 9:16, Jaegeuk Kim wrote:
> On 08/18, Chao Yu wrote:
>> On 2019-8-17 9:03, Jaegeuk Kim wrote:
>>> If we use later kernel having larger extra_isize, old fsck will delete
>>> entire old files.
>>
>> Would it be better to construct the length based on existed features?
> 
> We can't judge the size for future fields.

Alright, it's okay to just check it with the maximum value, though I think it
needs to consider inline xattr space as well.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
