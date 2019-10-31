Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89EEA911
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 03:03:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPzoQ-00014N-Pq; Thu, 31 Oct 2019 02:03:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iPzoP-00014D-SZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 02:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0anzFgkj3RFTdaj4qaHbkTCuoUxzauKwFvbdiuz4ASo=; b=eswdIaDzIU6DYMEGntjmcxSIos
 VnzcsiBUMH4rPtUoT5ANh7Ii/AOV9wUDP5SYJBZUKhqMzc88/moWqWGRO0uQmqXyrkbefZOq6NljT
 W7Mj9XpICEPfVEKzezp/eQNFWvTD8IXFWNYwQaPsfFTMjoMu1vuN1C+DIAz0f/RaAjzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0anzFgkj3RFTdaj4qaHbkTCuoUxzauKwFvbdiuz4ASo=; b=XYL8qy9gK2b5x5upEisqMrxogR
 Vcq+TNZQXfOzO7zraVeR90nVMOCjeovG71b5xPFJD70dsK8o1k//SEhtiNLT3AfWupiGhJxirrGwi
 ldIEU01dhpTIWRO4GeqjofDjQyLqV9qog0X8dSKVnmqiVS4ie2bdejW6FyqUMnfn8ukU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPzoN-00BiuQ-Te
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 02:03:45 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 63DA9B70C12BC89C0E01;
 Thu, 31 Oct 2019 10:03:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 31 Oct
 2019 10:03:22 +0800
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Gao Xiang <gaoxiang25@huawei.com>
References: <20191030035518.65477-1-gaoxiang25@huawei.com>
 <20aa40bd-280d-d223-9f73-d9ed7dbe4f29@huawei.com>
 <20191030091542.GA24976@architecture4>
 <19a417e6-8f0e-564e-bc36-59bfc883ec16@huawei.com>
 <20191030104345.GB170703@architecture4> <20191030151444.GC16197@mit.edu>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <61fc6d47-1cb3-4646-d155-444cff0b5b3e@huawei.com>
Date: Thu, 31 Oct 2019 10:03:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191030151444.GC16197@mit.edu>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iPzoN-00BiuQ-Te
Subject: Re: [f2fs-dev] [PATCH] f2fs: bio_alloc should never fail
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/30 23:14, Theodore Y. Ts'o wrote:
> On Wed, Oct 30, 2019 at 06:43:45PM +0800, Gao Xiang wrote:
>>> You're right, in low memory scenario, allocation with bioset will be faster, as
>>> you mentioned offline, maybe we can add/use a priviate bioset like btrfs did
>>> rather than using global one, however, we'd better check how deadlock happen
>>> with a bioset mempool first ...
>>
>> Okay, hope to get hints from Jaegeuk and redo this patch then...
> 
> It's not at all clear to me that using a private bioset is a good idea
> for f2fs.  That just means you're allocating a separate chunk of
> memory just for f2fs, as opposed to using the global pool.  That's an
> additional chunk of non-swapable kernel memory that's not going to be
> available, in *addition* to the global mempool.  
> 
> Also, who else would you be contending for space with the global
> mempool?  It's not like an mobile handset is going to have other users
> of the global bio mempool.
> 
> On a low-end mobile handset, memory is at a premium, so wasting memory
> to no good effect isn't going to be a great idea.

You're right, it looks that the purpose that btrfs added private bioset is to
avoid abusing bio internal fields (via commit 9be3395bcd4a), f2fs has no such
reason to do that now.

Thanks,

> 
> Regards,
> 
> 						- Ted
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
