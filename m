Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C161FB9D2E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Sep 2019 11:42:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iBbuV-0005QP-61; Sat, 21 Sep 2019 09:42:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iBbuT-0005QH-A7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Sep 2019 09:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nduTgPGf1f7MBFdIiENY2YkW12t7dNv5Rc4+lJuSsNo=; b=JQYmDsO0fKZtKRl1VowY11UFXa
 FcqBDg8/xx3nJACFGWds9ayPI6JnWo3E8UK1PHVEVPhf74iKQW62uqdAJhjOfenGvqyJaqRV32hKc
 vEBC1yczLkRPfIB5d7amm0e6uLuKZOpelXOxnkP3eSdWe6CpiiLb3s+0izuaDYao4ynE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nduTgPGf1f7MBFdIiENY2YkW12t7dNv5Rc4+lJuSsNo=; b=PXbJ9QhHYkR5cK1ZACz/WkaSyQ
 6eA8+oGT0Zwwi+eFFByBlCk8tJfqQxoj/gq4JQsyaB4qSedtRUG3Ini2i3nPhuNKxqBa0xX96dgnq
 SwCSZl0asjZpZ99cAOex87nbk//09H+GsL8AdqiavkhYGOOX62weeLvB5seNJwZ4gj+o=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iBbuP-001xcn-81
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Sep 2019 09:42:33 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3F6728D02B93E50072EC;
 Sat, 21 Sep 2019 17:42:22 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 21 Sep
 2019 17:42:19 +0800
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20190830101936.32265-3-shinichiro.kawasaki@wdc.com>
 <486550b2-bb47-d725-79a9-4fb3a4ba28e3@huawei.com>
 <20190903083704.kmc5bwfdpeinzfle@shindev>
 <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
 <20190906083114.jmjzczqzp4m3kxex@shindev>
 <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
 <20190910081010.uwubhhwenuex7vhx@shindev.dhcp.fujisawa.hgst.com>
 <45f1d3e8-ae50-879f-3cfc-2e6786afb28f@huawei.com>
 <20190912081648.wq2wi447hpold4t6@shindev.dhcp.fujisawa.hgst.com>
 <dd935f8f-276e-fa7b-e202-2a8722be60e0@huawei.com>
 <20190918030712.hko3pjm65glncqap@shindev.dhcp.fujisawa.hgst.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6b6552a0-333b-872b-37b8-67e6bf0c1311@huawei.com>
Date: Sat, 21 Sep 2019 17:42:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190918030712.hko3pjm65glncqap@shindev.dhcp.fujisawa.hgst.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iBbuP-001xcn-81
Subject: Re: [f2fs-dev] [PATCH v4 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/18 11:07, Shinichiro Kawasaki wrote:
> Thanks for the comments. I read f2fs code further, and think still the
> SIT vs write pointer check can be implemented and meaningful.
> 
> F2fs ensures consistency of SIT using two CP areas, two SIT areas and
> sit_bitmap in CP. These metadata are in the conventional zone that not
> affected by write pointer control logic. My current scope is to ensure
> write pointer control logic correctness for zoned block device. From this
> scope and the f2fs SIT consistency feature, I would like to assume that
> SIT entries built in kernel after f2fs mount is correct for the write
> pointer position check.

SIT may be broken due to software bug or hardware flaw, we'd better not consider
it as a consistent metadata.

> 
> Fsck does additional SIT consistency check in fsck_chk_meta(). It would be
> good to do the write pointer position check at the end of fsck_chk_meta().

SIT can be changed later? e.g. SIT bitmap says one block address is valid,
however fsck found there is no entry can link to it, then it needs to be
deleted? it may affect write_pointer repair, right?

So we'd better look into all SIT update cases in fsck.

> 
>> - need to consider fsynced block in SIT
> 
> As far as I read fsync logic, fsync results in do_write_page() call which
> does both of SIT entry update and write bio submit. In other words, SIT
> update and write pointer move are expected for fsync also. Then I think
> the write pointer consistency check with last valid block obtained from
> SIT is meaningful, when I take fsynced blocks into account.

Yup, :)

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
