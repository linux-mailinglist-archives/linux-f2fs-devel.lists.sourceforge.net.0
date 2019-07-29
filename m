Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F978753
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 10:26:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs0yz-0002sY-DE; Mon, 29 Jul 2019 08:26:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hs0yx-0002sP-RD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 08:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OXV01NbstlgdNYpbSjEFPJq8kIN9uolsZNCNl0iVqEg=; b=PT2JhbxVJpPz2FU0Ay6j+peiJd
 ol6vWHTv/tksSSF4fIlRVA96dymTJJbhytvBraUCJLSvvLFcjt7lo0k0QW/EMTjGAS+6rty+rudMH
 xmIEru5jTvVCGXgYPSTvVzsrvc9h5wIvRj76akxeLRAaYyImwNipCrToPNuq0ZM302Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OXV01NbstlgdNYpbSjEFPJq8kIN9uolsZNCNl0iVqEg=; b=Bi5rrA/HcG0dvE7iGi6BZ9MdkQ
 1JMQchrbJ5vAP96nGdwKnHICroDp3kBI3y4INI6Yxpu3ZPFRzrZ671A0hRs9MRQ+rQSsaDxuk5B69
 C5Xj/I4N2mssRNCiKRr27Rp8nDY5QOkielLr0jJVMaE5nsMCIa8M51DteteAo8vnoOto=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs0yv-002lXc-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 08:26:11 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 035211F0092AABDBC2EF;
 Mon, 29 Jul 2019 16:25:59 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 29 Jul
 2019 16:25:54 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190711150617.124660-1-qkrwngud825@gmail.com>
 <CAD14+f3pxEqC-Kqt0-9+Xb_+Jwr_=NjQmsVoLXz9YTAZJo12zg@mail.gmail.com>
 <20190711170647.GA65508@jaegeuk-macbookpro.roam.corp.google.com>
 <24f7940d-325c-c2b3-608e-ce311db2dc7d@huawei.com>
 <CAD14+f3ZGaY5jM+A5Bv=cSZNUeYaY=hywaG44SsotMNVz=D09g@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f21afb68-ee93-61e7-ab72-09085156fef6@huawei.com>
Date: Mon, 29 Jul 2019 16:25:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f3ZGaY5jM+A5Bv=cSZNUeYaY=hywaG44SsotMNVz=D09g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hs0yv-002lXc-OJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kmem_cache pool during xattr
 lookups
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

Hi Ju Hyung,

On 2019/7/29 15:48, Ju Hyung Park wrote:
> Hi Chao and Jaegeuk,
> 
> I have no idea how that patch got merged.
> 
> We(me and Yaro) were supposed to work on doing some finishing touches
> to the patch before sending it to upstream.
> 
> I'll personally check with Yaro.
> 
> Jaegeuk, please remove the patch.
> That patch has numerous issues, biggest one being hardcoded size(SZ_256).
> 
> Also, I need to figure out how to allocate kmem cache per mounts.

That would need a per sbi kmem cache, I guess it's reasonable and worth when we
mount multiple f2fs partitions with different inline xattr size.

However, IIRC, inline_xattr_size can be changed after remount, so how can we
handle different inline xattr size in one mount... that's also a problem.

BTW, in old patch I found kvfree() should not be replaced as f2fs_kzalloc() can
use vmalloc to allocate memroy.

-	kvfree(txattr_addr);
+	if (!inline_size)
+		kfree(txattr_addr);

Thanks,

> 
> Thanks.
> 
> On Mon, Jul 29, 2019 at 4:28 PM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> Hi Jaegeuk, Ju Hyung, Yaroslav,
>>
>> I can see "f2fs: xattr: reserve cache for xattr allocations" has been merged in
>> dev-test branch, however, it doesn't exist in f2fs mailing list, so I can not
>> comment on it.... Can anyone send it to the list?
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
