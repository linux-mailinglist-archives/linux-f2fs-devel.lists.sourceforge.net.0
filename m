Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ABA2B7AE9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 11:07:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfKNB-0005ls-Iw; Wed, 18 Nov 2020 10:07:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kfKN8-0005l8-ML
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 10:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+b0dKqKOAsXQU6ShgXgu3CeZnZCL0GtPWvGVqCLAJrU=; b=N826jWQyn2yCckXQtLc1RLA+M6
 /e85xRMhsU1o69BmuywCy8IlHBdjY2iCcP9Cai2RMKSMZKQ5OSEUfmX5IweR7fWBKWYqTA4XHqJHo
 3XRgRsWqkoRHavLM1soeREOfgl8BoMZ7bbHAWWH007G57dJBE3c4wFF7r9C04GwepRp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+b0dKqKOAsXQU6ShgXgu3CeZnZCL0GtPWvGVqCLAJrU=; b=O1j4NoJVlwGa2Z5CjS2OaxSZMc
 O/idMvO53RaKqjXOEs+fhc2so6k5Ccch06CBpZX4fE3r7KFMqaMrd7vntksGaNdVcMnHF8gYL7tQb
 uErxx2fxqxM04p/52uJYC+ZPqtgECOpkOmhL0PrtIfz2u+r77GBtVBByznt+9CrJwWOI=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfKMy-00D5tK-WD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 10:07:30 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cbdl04gT9zLlr1;
 Wed, 18 Nov 2020 18:06:52 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 18 Nov
 2020 18:07:08 +0800
To: <stummala@codeaurora.org>
References: <0891f749dc8537fc56a35634388827be@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <46222a22-f42c-ef04-3707-8e0bc3fe76da@huawei.com>
Date: Wed, 18 Nov 2020 18:07:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0891f749dc8537fc56a35634388827be@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kfKMy-00D5tK-WD
Subject: Re: [f2fs-dev] f2fs: cp_mutex starvation issue
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

On 2020/11/18 17:47, stummala@codeaurora.org wrote:
> Hi Chao,
> 
> Can we consider to move the sbi->cp_mutex as well to use rw_sem similar
> to this patch of yours -
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/fs/f2fs?id=fb24fea75ca5ceef59f753494b2efd453606e08a
> 
> We are observing issues where fsync() of a high priority task getting
> starved when there is heavy IO from several low priority tasks.
> I would like to know if this was considered before and if any issues in
> doing so? Please share your inputs.

I missed to check cp_mutex lock, because I haven't been reported with
starving issue on this lock, anyway, I agree to do the same change on
cp_mutex lock, and I don't think there is any problem after change.

Could you please make one patch to fix this?

Thanks,

> 
> Thanks,
> Sahitya.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
