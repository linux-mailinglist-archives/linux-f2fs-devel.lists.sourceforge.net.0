Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F82A281D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 11:21:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZWxH-0006HV-B6; Mon, 02 Nov 2020 10:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZWxE-0006HD-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 10:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VOht1sDGsX4FwNffX2TdDFIfmTS9hB5ADFvJu9b+XkI=; b=XMKTmFXI1KKAXU4bPXPgjm1D/2
 A0rgFMXQXsBjMUQdX3o4dnCF0VLjdBOE6+kqWpDgNEgajlExegcpUsLpy5W4CUYVqZl581PPCJT3v
 ikKpzNQv/SfNio4NYLMHOqMX1Pea0fSqDbBw3cgCs9nTXOx0NzJOl6oqvpfYDLxgU9dE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VOht1sDGsX4FwNffX2TdDFIfmTS9hB5ADFvJu9b+XkI=; b=E6BX14UxCp6s6gndgEa+QfYsQB
 ne35GiEYwJQc+xTksqyk9xRj06X0X6vFZaWJIT/8YeGz9p83K9CvEMy80n6LSIWogVlKVQ5cpKete
 JRy4w+CwQai/N9vByjCEgj3ai6BAS9TwTfIKc4YuegeS4Xl0D+sf0ug+sBusKItxb4a4=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZWx3-00GD2H-45
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 10:20:48 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CPpp12vt2zhY9x;
 Mon,  2 Nov 2020 18:20:25 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 2 Nov 2020
 18:20:21 +0800
To: kitestramuort <kitestramuort@autistici.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
 <1c0ea7b6-73b5-9027-e67f-3dfff8e50855@huawei.com>
 <2a029c2ad9ae558adb5147be767329e542b20b50.camel@autistici.org>
 <ab249f17-0c0c-6a16-c38b-e0a702cd5223@huawei.com>
 <5d700f2a32e92ccef7e5925833c3893cc9bc0d2d.camel@autistici.org>
 <1433cdebc4d5b8c21dee3fddd1cc959ea82f6ab4.camel@autistici.org>
 <659d1796-82ef-b4dd-f933-1c1c0c19c31e@huawei.com>
 <af85cef0922ec28e4bc4171816c5816eb68927aa.camel@autistici.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9c07a511-7318-3f2b-bc8a-be45feacbdf1@huawei.com>
Date: Mon, 2 Nov 2020 18:20:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <af85cef0922ec28e4bc4171816c5816eb68927aa.camel@autistici.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kZWx3-00GD2H-45
Subject: Re: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/2 17:55, kitestramuort wrote:
> On Mon, 2020-11-02 at 17:39 +0800, Chao Yu wrote:
>> On 2020/10/31 17:09, kitestramuort wrote:
>>> I believe that the error is triggered by the overlayfs. I use this
>>> tool
>>> to manage browsers' profiles in the tmpfs which uses Overlayfs
>>> https://wiki.archlinux.org/index.php/Profile-sync-daemon
>>
>> I found one case which can cause this incorrect report from llseek(),
>> could you please have a try with patch I just sent?
>>
>> [PATCH] f2fs: fix to seek incorrect data offset in inline data file
>>
>> Thanks,
> 
> 
> That fixes it. Thank you very much!

Thanks for the quick test. :)

If you don't mind, I will change tag from Reported-by to Reported-and-tested-by
in the patch.

Thanks,

> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
