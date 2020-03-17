Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B381877AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2020 03:05:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jE1bN-0000Od-5o; Tue, 17 Mar 2020 02:05:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jE1bL-0000OM-OD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Mar 2020 02:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4B+CNn4qnASwuej0+aOauVTedImwltWOkDBhkWiPQY=; b=DNTWI3NexCyYtmGFrY56Lv7AB7
 sL/y27Ewg2b93p6qJgVoFFJXPxeyDwkxXkeKWD74GdSnXo6k7CdgUCFAG2qLrWq9q/Y1ibAB1tQmF
 CkCDX0+25yy33txJQ7EG4BEGGipFOMmb9P5L3A1Eiju9C4+eTSsf+GjEVE4E9Djk6y+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m4B+CNn4qnASwuej0+aOauVTedImwltWOkDBhkWiPQY=; b=lp9VyXd5NLtsgtToE9GlvVnTSU
 A/RYBPbihYVP2xZgGjPBYJ+gD/IWngzsdNok0WdZr4pViDvsH9PJ+d3vTUynt3P6wmSqhTWAORmhK
 xcRlU1kkV0d0yWqvl2YuIM4s14sf75knKQtz2SWyOL7EuWKMhUalyBJZRvSEEFapv8Ug=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jE1bH-009DqM-JW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Mar 2020 02:05:03 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9FC262CDC09407622853
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Mar 2020 09:44:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 17 Mar
 2020 09:44:06 +0800
To: John <graysky@archlinux.us>, <linux-f2fs-devel@lists.sourceforge.net>
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
Date: Tue, 17 Mar 2020 09:44:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jE1bH-009DqM-JW
Subject: Re: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS
 partitions
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

On 2020/3/16 17:52, John wrote:
> On Sun, Mar 15, 2020 at 9:24 PM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> What's your mount option and mkfs option on those two partitions, and what's
>> your kernel version?
> 
> I am mounting the partitions with systemd like so (/etc/fstab entry):
>   LABEL=incoming         /incoming     f2fs  noauto,x-systemd.automount  0 0
> 
> But I can reproduce this if I totally remove the entries within
> /etc/fstab, reboot, and mount manually like this:
>   mount LABEL=incoming /incoming

However, the directory where you trigger trim is "/mnt/media"?

Quoted:
"Invoking it manually on the newer one gives this:
# fstrim -v /mnt/media
fstrim: /mnt/media: the discard operation is not supported"

Could you give more details about that? What device is behind /mnt/media?

> 
> Inspecting my shell history, I created them both with this command:
>   mkfs.f2fs -l incoming /dev/sdb2
> 
> I am running 5.5.9 on Arch Linux, but I believe I experienced this
> under previous 5.5.x series as well.
> 
> If you create a F2FS partition using the latest stable release of
> f2fs-tools (1.13.0) are you able to reproduce the inability to trim?

I can't, and also there is such option in mkfs to disable trim functionality
during format.

Thanks,

> 
> Thank you for the consideration!
> 
>> I checked the code, only place where we give 'not supported' is as below
>> by checking whether underlying device supports discard.
>>
>> f2fs_ioc_fitrim()
>>
>>         if (!f2fs_hw_support_discard(F2FS_SB(sb)))
>>                 return -EOPNOTSUPP;
>>
>> So this should not happen that two partitions locates in one device have
>> inconsistent discard support status.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
