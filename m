Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE504C12C5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2019 04:09:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iEOeR-000510-0P; Sun, 29 Sep 2019 02:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iEOeO-00050g-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 02:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5hWFWT14QGRDLOuefMyIKuzkGHZ5SuBtYA+lJq3pfk=; b=OFUsEEzSK5dWwQ4KYaNUimkmMJ
 DB3vLaM2ZxOlfHxjagBFdM3KXrw9OM4p+v/R7ZwiB7tjqXs5kv3AU6TQPmBV7tYmLvDCuO8sCnf8A
 49h0yE8opewA7CMMjrlieaqBLmg3OyuQJre8y4M8m69982KVoyreBuwBIZON4HEcyqys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C5hWFWT14QGRDLOuefMyIKuzkGHZ5SuBtYA+lJq3pfk=; b=h05vM6VFzwApwewqduVYvVUYPS
 D5bJo/28giGKjz76zdDaSxI1qwAkvsR4APM8XeFBBbISxakSSPxejFO7aPnL0HeI7Tz4VOa58nom2
 bs1Qj+ODbl0qnfFEFfoiJ+pn2mtv3odOQnfX9+wVX9QTvVQZ1Oj4HGpaRHSp8KonOqZk=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iEOeK-00Dbtd-7V
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 02:09:28 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B4ECAB56D56D4EFEF14B;
 Sun, 29 Sep 2019 10:09:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sun, 29 Sep
 2019 10:09:12 +0800
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20190903083704.kmc5bwfdpeinzfle@shindev>
 <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
 <20190906083114.jmjzczqzp4m3kxex@shindev>
 <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
 <20190910081010.uwubhhwenuex7vhx@shindev.dhcp.fujisawa.hgst.com>
 <45f1d3e8-ae50-879f-3cfc-2e6786afb28f@huawei.com>
 <20190912081648.wq2wi447hpold4t6@shindev.dhcp.fujisawa.hgst.com>
 <dd935f8f-276e-fa7b-e202-2a8722be60e0@huawei.com>
 <20190918030712.hko3pjm65glncqap@shindev.dhcp.fujisawa.hgst.com>
 <6b6552a0-333b-872b-37b8-67e6bf0c1311@huawei.com>
 <20190925080544.ldxsmx7zf4dtbqmz@shindev.dhcp.fujisawa.hgst.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d0bb79bd-54bd-a7b6-68e7-28de364f2162@huawei.com>
Date: Sun, 29 Sep 2019 10:09:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190925080544.ldxsmx7zf4dtbqmz@shindev.dhcp.fujisawa.hgst.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iEOeK-00Dbtd-7V
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

On 2019/9/25 16:05, Shinichiro Kawasaki wrote:
> On Sep 21, 2019 / 17:42, Chao Yu wrote:
>> On 2019/9/18 11:07, Shinichiro Kawasaki wrote:
>>> Thanks for the comments. I read f2fs code further, and think still the
>>> SIT vs write pointer check can be implemented and meaningful.
>>>
>>> F2fs ensures consistency of SIT using two CP areas, two SIT areas and
>>> sit_bitmap in CP. These metadata are in the conventional zone that not
>>> affected by write pointer control logic. My current scope is to ensure
>>> write pointer control logic correctness for zoned block device. From this
>>> scope and the f2fs SIT consistency feature, I would like to assume that
>>> SIT entries built in kernel after f2fs mount is correct for the write
>>> pointer position check.
>>
>> SIT may be broken due to software bug or hardware flaw, we'd better not consider
>> it as a consistent metadata.
> 
> I see. I found that kernel checks SIT valid blocks with check_block_count()
> function, and if mismatch happens it requests fsck. I guess SIT consistency is
> not ensured during kernel run, but after fsck run. Is this correct? If so, I
> think the write pointer consistency check with SIT valid block bitmaps should
> not be done by kernel, but by fsck after SIT rewrite.

IMO, consistency check can be done in both kernel and fsck.

If SIT is corrupted, but kernel doesn't aware of it (check_block_count() doesn't
report any inconsistency), write_pointer consistency check may give some clues
for filesystem corruption.

> 
> As for non-open zones (curseg do not point to), the other check is needed: if
> the zone does not have valid blocks and fsync data, need to reset its write
> pointer. My understanding is that the valid blocks count comes from SIT. Then
> this fix also should be done not by kernel but by fsck after SIT rewrite. I
> think kernel just should do this check at mount time to avoid unaligned write
> error, and if inconsistency found it should request fsck to recheck and fix.

Yeah, I agree with this.

> 
> I assume kernel can check and fix write pointer inconsistency with cursegs in
> CP. CP (and SB) have checksum guard and their consistency looks ensured during
> kernel run.
> 
>>
>>>
>>> Fsck does additional SIT consistency check in fsck_chk_meta(). It would be
>>> good to do the write pointer position check at the end of fsck_chk_meta().
>>
>> SIT can be changed later? e.g. SIT bitmap says one block address is valid,
>> however fsck found there is no entry can link to it, then it needs to be
>> deleted? it may affect write_pointer repair, right?
>>
>> So we'd better look into all SIT update cases in fsck.
> 
> Ah, yes, when fsck updates SIT, write pointer consistency check should be done
> after that. I found SIT is rewritten at the end of fsck_verify() by
> rewrite_sit_area_bitmap() and fix_curseg_info() calls. I guess write pointer
> consistency check with SIT (and write pointer reset if required) should be
> done after those function calls to reflect all SIT changes by fsck. I'll try
> to create a patch with this approach.

Quota file repair may grab and write the block which can change SIT status,
please notice that case as well.

Thanks,

> 
> Thanks again for your comments!
> 
> --
> Best Regards,
> Shin'ichiro Kawasaki.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
