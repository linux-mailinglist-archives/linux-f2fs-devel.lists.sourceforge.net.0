Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4924928A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 03:51:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8DGV-0003pN-Oz; Wed, 19 Aug 2020 01:51:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k8DGU-0003pG-6j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 01:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oXX7nPLRqJ8m8RudUoL95RiumVlZAzWCXgbsJioj+dQ=; b=V2FrsmAJVsqYEVeYbvCiEkW5Mb
 a3ZYYB0nxYexErgPIwfkNyHySBhLrvPaAlHNJU7ADVdGJo1cQsOKGHbIPHRVSH3Mal4AUkQLWhamq
 iKe0tyfkNL8Ju3S+taATWYhCLANC9kUCRJfOR5U60CWFJ7zqnTC0x7We5WaGXJuWqNi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oXX7nPLRqJ8m8RudUoL95RiumVlZAzWCXgbsJioj+dQ=; b=ibexbX8CrQRWC9IbQLqgpBQkrX
 Ldu/lXrSKytJa3vxitAGpi9gJf54gCd+dXiS7b9Y1bwkS0d0gnVnlGyPgcvFUuZ202DgQSgoZLeZV
 DlHutnquoSV00Bg2zUwqOJ/OxVfcXsX77VFBq9VeBD3Gpj50ZQaCVyCDTefnK5smSIE0=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8DGS-00Fij0-EN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 01:51:46 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AA4D643211406608B9DD;
 Wed, 19 Aug 2020 09:51:33 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 19 Aug
 2020 09:51:29 +0800
To: Theotime Combes <tcombes@google.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200818111850.3288644-1-tcombes@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fdf38720-242a-fd09-b838-186575a0a0d7@huawei.com>
Date: Wed, 19 Aug 2020 09:51:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200818111850.3288644-1-tcombes@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k8DGS-00Fij0-EN
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add -T flag
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

On 2020/8/18 19:18, Theotime Combes via Linux-f2fs-devel wrote:
> T flag sets timestamps to a given value

I'm curious about why do we need to configure timestamp of root/qf/lpf
inode.

> 
> Signed-off-by: Theotime Combes <tcombes@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
