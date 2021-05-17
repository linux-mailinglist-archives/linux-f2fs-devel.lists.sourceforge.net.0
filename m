Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1C382280
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 May 2021 03:19:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1liRuj-0006Kn-GJ; Mon, 17 May 2021 01:19:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1liRuh-0006Ke-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 May 2021 01:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vMPeC3KL04qWd6Nz9FMSbvRfD4CLELvkQt5weDRnnqY=; b=AsNkpoAS0GlJ6dcKbkny2bA7Hh
 dPG67/poweQY2BQ3FtHOXWBmtZpFvYovKWIm+u/XhL3Ir72tnroua+d4Q1HyPpsJ+YT/n7XIItUaC
 5ZuU5WCr1WrGNVEzH8pn76xP9fWKCDO/2WMgKSI+IbHCslWHrYpg0MTpxM3Fb4YiLNs0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vMPeC3KL04qWd6Nz9FMSbvRfD4CLELvkQt5weDRnnqY=; b=h+kPPucT1C0NldMYKczN388KDn
 pL9kaCaubclAOF2qxddiwoCQ3PCtXybHhoZSo9lyRAn8SHisP7R7MU1bKAMYcUw5rLkzgMusckn2C
 JQBtrUMGFAn31UrdjIVGgBz5erY25zF3cRkbJhi0NjWdwLiVhweV+zAZVI9xArjfmPEY=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1liRuf-0001k2-A9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 May 2021 01:19:19 +0000
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fk1Qz3C1RzQpQh;
 Mon, 17 May 2021 09:15:39 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 09:19:06 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 17 May 2021 09:19:06 +0800
To: <trix@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20210515180941.1751362-1-trix@redhat.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <567d4fcd-6e02-d80e-33cb-3a6810bf833a@huawei.com>
Date: Mon, 17 May 2021 09:19:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210515180941.1751362-1-trix@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1liRuf-0001k2-A9
Subject: Re: [f2fs-dev] [PATCH] f2fs: return success if there is no work to
 do
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

On 2021/5/16 2:09, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Static analysis reports this problem
> file.c:3206:2: warning: Undefined or garbage value returned to caller
>          return err;
>          ^~~~~~~~~~
> 
> err is only set if there is some work to do.  Because the loop returns
> immediately on an error, if all the work was done, a 0 would be returned.
> Instead of checking the unlikely case that there was no work to do,
> change the return of err to 0.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
