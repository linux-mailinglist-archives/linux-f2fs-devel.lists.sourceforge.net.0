Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 240D818614A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2020 02:24:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDeUX-0007qY-Me; Mon, 16 Mar 2020 01:24:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jDeUV-0007qP-DO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 01:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MDqTB/ER9T/hpCG+dW2ixR6IAzAwFKdTIedTa+YtzwY=; b=bZJ/wi23nIzA9DPTo8rSjJh7+p
 +SdKAhOA98sZpKwrRzQzwwsbq34Lvr73yUWp2vx5fBvqps1C8h0lQI1TP4a2kP61DUTAQbszliOA5
 LeMj5wtdbUHUVrvxpItbEnpH9ClsVLLTrKUOtr5vleKDW+3xyES2xg9GTOZLSOeMnHGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MDqTB/ER9T/hpCG+dW2ixR6IAzAwFKdTIedTa+YtzwY=; b=PxtASnQGirnhhJWYdLZtfrM359
 7P+0Ml445d2UkhGCY7E8IlW3SiTBJVeZldxqXvM030DbSSa4hNfOzbm9hiEwohQ8i3dJFXlMlW7QD
 9M+zximp/wJIAQUy7t59+5hM8pkdh1k9rWFT3moNUqIbikf15pmL0NRzQ79WApeFq6D8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDeUT-002WpJ-8E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 01:24:27 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A64A05C78EABCF5520F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Mar 2020 09:24:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 16 Mar
 2020 09:24:12 +0800
To: John <graysky@archlinux.us>, <linux-f2fs-devel@lists.sourceforge.net>
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
Date: Mon, 16 Mar 2020 09:24:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDeUT-002WpJ-8E
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

Hello,

On 2020/3/15 2:09, John wrote:
> Running `fstrim -a -v` is not detecting my f2fs partition that I
> created just a few days ago but it does detect an older f2fs partition
> and trims it as expected.  Both partitions are on the same SSD.  The
> older partition is FSVER=1.12 whereas the newer one is FSVER=1.13
> (reported by `lsblk -f`).

What's your mount option and mkfs option on those two partitions, and what's
your kernel version?

I checked the code, only place where we give 'not supported' is as below
by checking whether underlying device supports discard.

f2fs_ioc_fitrim()

	if (!f2fs_hw_support_discard(F2FS_SB(sb)))
		return -EOPNOTSUPP;

So this should not happen that two partitions locates in one device have
inconsistent discard support status.

Thanks,

> 
> Invoking it manually on the newer one gives this:
> # fstrim -v /mnt/media
> fstrim: /mnt/media: the discard operation is not supported
> 
> And invoking it manually on the older one gives this:
> # fstrim -v /incoming
> /mnt/incoming:  1.7 GiB (1762152448 bytes) trimmed on /dev/sda2
> 
> Thanks.
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
