Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9745A4F40
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2019 08:38:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4fyo-0000V1-5k; Mon, 02 Sep 2019 06:38:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i4fym-0000Ut-IO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 06:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3kRBcGSnBlAXe+MA4u3nTTEdK0VP8ksLGFptbiBsi5w=; b=YpAtgPEhPZMlwYKObYZQ0cmOP2
 cNEfXS8+iq7ZSusBkRZi7lmzxzrRD6pEyUfoz7BosPojBvCbIutw2/kJ+l0h6aIjkHLrI+LEQ/rWS
 aLAvgkebOnHfWyT7+LE3UOLSgvao5gS/fTRfzGoKhTnmcUJ4QB4XmZ91FyxhNg0bg614=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3kRBcGSnBlAXe+MA4u3nTTEdK0VP8ksLGFptbiBsi5w=; b=SamblW91w4zKTCwi2bVavwjyui
 CiMMXzOj56/bBC0piWzfZUoMVF0G/0vdTsmjTFtFj9VCIRT3EtmWGaOP553d1HygLDfJDgHdCMlUt
 q4ORgbySXLoKE+rhQbh5gKNWppG8RWCc6FfMf/Skl+K77Jpg+H+71Vc+SYYaAci6G62g=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4fyk-00D2LZ-FV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 06:38:20 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 825849661B41122E1A10;
 Mon,  2 Sep 2019 14:38:11 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019
 14:38:08 +0800
To: Didier Spaier <didier@slint.fr>, <linux-f2fs-devel@lists.sourceforge.net>
References: <dcaa1e31-f47f-1570-f870-6d4d975e6067@slint.fr>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9f3e2172-8c8f-9f83-cb8f-ecaf6a8c6682@huawei.com>
Date: Mon, 2 Sep 2019 14:38:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <dcaa1e31-f47f-1570-f870-6d4d975e6067@slint.fr>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i4fyk-00D2LZ-FV
Subject: Re: [f2fs-dev] Which kind of devices would benefit of f2fs?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On 2019/9/2 7:20, Didier Spaier wrote:
> Hello,
> 
> I plan to provide a more "newbie friendly" installer for the Slint Linux
> distribution that I maintain.
> 
> It will include an "auto" feature intended for newbies, that will
> partition a whole drive and install filesystems with a minimum of user
> input. It would install ext4 file systems in case of hard drives (but
> the ESP and the Bios Boot partition, that is), or f2fs when
> appropriate, without asking.
> 
> I am trying to determine for which kinds of devices f2fs should be
> preferred over ext4 (or maybe xfs, I have yet to choose)
> 
> I understand that I should target devices equipped of a NAND flash
> memory and interfaced with a FTL.
> 
> I think that nowadays most devices of types eMMC, SSD (both SATA and
> PCIe connected, aka NVMe), SD card and flash drives (aka USB sticks)
> have these characteristics thus are good candidates for f2fs.
> 
> Simply put, that loks like "everything but hard drives".
> 
> Is this correct?

I do believe that in those devices, in addition SMR (Shingled Magnetic
Recording) drvier, f2fs can behaves better on performance, but for conventional
hard driver, I got no evidence to show f2fs will perform better (since I didn't
do such test on hard driver and never got related report like that).

> 
> If yes, I could just check the value of
> /sys/block/<device name>/queue/rotational or the ROTA field of lsblk.
> 
> However, I understand that not all flash drives and SSD are based on
> NAND and not all these devices interfaced through a NTL.
> 
> Thus my questions are:
> 1. Is the assumption "all devices but hards disks" are potential
> candidate for using f2fs valid?

I'm okay with that assumption by default. :)

> 2. If this assumption is not valid, what are the drawbacks using f2fs
> for all, in terms of performances and security?
> 3. Is there a way to tell for a given device if it would benefit of
> using f2fs, that could be implemented in a distribution installer,
> without human intervention?

IMO, flash based device can be benefit from aspects of:
- better random write performance (inherit gene's advantage from LFS architecture)
- well SQLite performance (SQLite has started to support to use f2fs atomic
write interface officially in its persist mode)
- recoverable performance (background GC)
- longevity (less writes)
- less performance regression during handling discard command (tuned async
discard policy)

> 
> Thanks for any clue. and if this is the wrong list for such questions,
> please tell me where I should ask them.
> 
> Best regards,
> 
> Didier
> 
> PS I ship currently a kernel 4.19.x. Is this OK?

I'm okay with that.

Also I recommend to use our private stable tree below in where we backport most
upstreamed codes, and the codes in that stable tree are used on Android now.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/

BTW please note that:
- DON'T try corrupted feature via mkfs.f2fs -i with the version <= 1.12.0.
- tune overprivsion rate with a proper value to avoid performance regression
when there is no more space in the device.

> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
