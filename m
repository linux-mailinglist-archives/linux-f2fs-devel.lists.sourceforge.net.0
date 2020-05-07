Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F61C8063
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 05:13:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWWyc-0000pl-QP; Thu, 07 May 2020 03:13:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWWyb-0000pe-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 03:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JdHqTB+CQkOs/g2tLg+GJKcCcjHlzr0uIKAZxUhWcVY=; b=QVNOoy9DWl502itJMphEm5g8SJ
 x7PNRiKR29i7/Pt0+uTpooMLOyb51/dmDDPM61ZZySWv+jrv3+x03NZaFC0A83+JNTmN/AEd4QWF1
 axSjbRRSUchzdluTX03gOFqFY/uJeuBjvshDaTM4tJxDHOwYvGJePBdT9VUeTlS5Dnw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JdHqTB+CQkOs/g2tLg+GJKcCcjHlzr0uIKAZxUhWcVY=; b=Hmhk2uCkpi2sf70wf1wtbMObN4
 iL0YmBw0B2ATsJbC67nRjcnboflz2mKFQf8KE1x6s/gkv4JwkqfWlWkukzDtBWYKH5UvVNuz26zvX
 ylQRGqRLOaPgtKfJIl2NIdUg1S0A4G9D1XIfOAovO0bxxQR/R15r/vJKoRlSL7KSq6w4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWWya-00DfYW-0E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 03:13:33 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0A376B64C5105C710702;
 Thu,  7 May 2020 11:13:23 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May 2020
 11:13:18 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200505204823.211214-1-ebiggers@kernel.org>
 <4143486a-41bf-e92f-cc99-c6a2d0a8270c@huawei.com>
 <20200506184301.GA842@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4e2b1c0f-292b-3a39-bcd2-06cc0680d3cd@huawei.com>
Date: Thu, 7 May 2020 11:13:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200506184301.GA842@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWWya-00DfYW-0E
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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

On 2020/5/7 2:43, Eric Biggers wrote:
> On Wed, May 06, 2020 at 03:43:36PM +0800, Chao Yu wrote:
>> On 2020/5/6 4:48, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
>>> kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
>>> and f2fs_kvmalloc(), both return both kinds of memory.
>>>
>>> It's redundant to have two functions that do the same thing, and also
>>> breaking the standard naming convention is causing bugs since people
>>> assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
>>> e.g. the various allocations in fs/f2fs/compress.c.
>>>
>>> Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
>>> re-introducing the allocation failures that the vmalloc fallback was
>>> intended to fix, convert the largest allocations to use f2fs_kvmalloc().
>>
>> I've submitted one patch since you suggested when commented in compression
>> support patch.
>>
>> I remember Jaegeuk prefer to use f2fs_kvmalloc() to instead f2fs_kmalloc(),
>> and keep the order of kmalloc - failed - kvmalloc.
>>
> 
> I think you're talking about
> https://lkml.kernel.org/r/20191105030451.GA55090@jaegeuk-macbookpro.roam.corp.google.com?
> 
> I think that making the large allocations use kvmalloc(), as this patch does, is
> good enough to address any memory allocation failures that may have been
> encountered in the past.  We don't need to switch all allocations to use
> kvmalloc(), as there's no benefit for small allocations.

Yeah, I agreed, and in ENOMEM case, small-sized kvmalloc increases allocating path
length unnecessarily.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
