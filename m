Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6822D3B3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jul 2020 04:07:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz9ah-00067O-T3; Sat, 25 Jul 2020 02:07:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jz9ag-00067H-L6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 02:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9Fc9uv5ghnPXmbW9uGffC+iq+d57rgO1+yxjoXMsL0=; b=fBjNKI+1mVY5YMQnFyRuF4CW44
 SgoHE0jSjGjWMVov5QtGDZn+E8iQ5qj8VzVdOOZ2kIEdE3lW9WI+W1oO83Zrsr99gzQMJC1Q6WyxA
 oOkW3jG/obTMyeuEim6cQ/ZylDld0R6DRmva08gl0VGd4Oigi54WKo+cK5g4L2cGMw/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F9Fc9uv5ghnPXmbW9uGffC+iq+d57rgO1+yxjoXMsL0=; b=VtsE+DW9bnjgQo7Lt2KjygvmYV
 v5l/tt5V7NThtAsWFg2L6/ds1dz2TbovHLdLmgreYb92/akeCA+Z+5TfdVifb43OSa+hP9dY0xbSw
 F9XKFPjAsyojBpNrhR/F61cOkl9Mh/M43AgxE0dggzJIlZQgPzCldZQyVRd9Hhw1i88I=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jz9ae-001vIj-QP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 02:07:10 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 59A479F81D57FE7DE9DC;
 Sat, 25 Jul 2020 10:06:50 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 25 Jul
 2020 10:06:48 +0800
To: Norbert Lange <nolange79@gmail.com>
References: <f3094e40-13ff-ea31-faf1-9e78867f4a8d@huawei.com>
 <20200724081125.3376-1-nolange79@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c05c0e81-ea55-99e0-0060-df803b3586b6@huawei.com>
Date: Sat, 25 Jul 2020 10:06:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200724081125.3376-1-nolange79@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz9ae-001vIj-QP
Subject: Re: [f2fs-dev] Possible issues with fsck of f2fs root
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/24 16:11, Norbert Lange wrote:
> Hello,
> 
> I ran into this problem with fsck.f2fs 1.13.0, it seems that problem is not
> fixed in master either.
> 
> My setup is an embedded device with systemd and I did nothing but swap the
> filesystem from ext4 to f2fs. The result was that the init system would
> try to fsck the ro mounted root partition, fsck.f2fs would fail (as noted),
> and the init system would reboot (rinse, repeat) with no real chance to
> interact remotely (headless system).
> 
> Thats pretty much as bad as it gets for an unwanted sideffect ;)
> 
> I first reported it to systemd, quite reasonably they expect fsck tools
> to behave the same [1].
> 
> The systemd-fsck tool will end up calling fsck.f2fs with the parameter below,
> and will fail as this device is mounted (tries to open it in exclusive mode).
> 
> $ fsck.f2fs -a /dev/mmcblk0p5; echo $?
> Info: Fix the reported corruption.
> Info: Mounted device!
> Info: Check FS only on RO mounted device
> Error: Failed to open the device!
> 255

I tried ext4, it acts the same as f2fs... except different return value.

fsck -t ext4 -a /dev/zram1; echo $?
fsck 1.45.0 (6-Mar-2019)
/dev/zram1 is mounted.
e2fsck: Cannot continue, aborting.


8

fsck -t ext4 -a -f /dev/zram1; echo $?
fsck 1.45.0 (6-Mar-2019)
Warning!  /dev/zram1 is mounted.
/dev/zram1: 11/1179648 files (0.0% non-contiguous), 118065/4718592 blocks
0

I'd like to know what behavior of fsck does systemd expect?
fsck -a should work (check & report or check & report & repaire)
on readonly mounted device?

Thanks,

> 
> A workaround would be to force or skip the check
> 
> fsck.f2fs -a -f /dev/mmcblk0p5; echo $?
> Info: Fix the reported corruption.
> .....
> Done: 0.232165 secs
> 0
> 
> So, Id consider this a critical issue, and I dont see whats the conclusion
> of this discussion is.
> 
> Norbert
> 
> 
> [1] - https://github.com/systemd/systemd/issues/15106
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
