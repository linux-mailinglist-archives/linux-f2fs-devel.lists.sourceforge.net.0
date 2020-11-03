Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 037E12A4490
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 12:51:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZuqc-0006VM-Ek; Tue, 03 Nov 2020 11:51:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZuqa-0006VD-Th
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 11:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vaUfiUGSmVMGqlMmp7pWT7aMBBWJcqzCQIXK+gU6wF4=; b=MmdMVXK3wS1Bw0mh9ECvllq6/+
 LRrsQg19tSy3rHcuV7RuH91Y4l6VUlxzwmOytkosVocVYP3PcuaKeNP0Ik/2d9WOJ2ThKBjZuKI46
 sWeXIu6NWrTZ1hxY8zWk67e+U0ZmKQtiLenUOix9CP59pQedm8pMuAwD/xwqJew/97AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vaUfiUGSmVMGqlMmp7pWT7aMBBWJcqzCQIXK+gU6wF4=; b=D/wWuHOEZUA4lr4JJlhFymkAuo
 mKJzUFkRW7xkuC1pWy7gA0oWi+PfsJ3cic4X5GOIu8F/JZ1QV1N0sPVxdW/2/8w6fkWtUc8bJ2qWp
 5xO2fQ8R10lBSf1Xkodht4/Kp2rCnB5qn6SFw2ocQLrXir4Yi7K5tLt062jjHGIciO6k=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZuqW-007gz7-0J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 11:51:32 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CQSmF0G0nz15QTk;
 Tue,  3 Nov 2020 19:51:09 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 3 Nov 2020
 19:51:05 +0800
To: David Laight <David.Laight@ACULAB.COM>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201102122333.76667-1-yuchao0@huawei.com>
 <20201102163123.GD529594@google.com>
 <756e482c-b638-1c09-3868-ae45d33ed2c2@huawei.com>
 <6b5bce0e-c967-b9cf-3544-a8e65595059c@huawei.com>
 <aa11afd31edb42979c03d2a27ed9e850@AcuMS.aculab.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4d58b7c7-70b5-514d-fab2-27a0f16886e5@huawei.com>
Date: Tue, 3 Nov 2020 19:51:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <aa11afd31edb42979c03d2a27ed9e850@AcuMS.aculab.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kZuqW-007gz7-0J
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: support chksum
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/3 18:35, David Laight wrote:
> From: Chao Yu
>> Sent: 03 November 2020 02:37
> ...
>>>> Do we need to change fsck.f2fs to recover this?
>>
>> However, we don't know which one is correct, compressed data or chksum value?
>> if compressed data was corrupted, repairing chksum value doesn't help.
>>
>> Or how about adding chksum values for both raw data and compressed data.
> 
> What errors are you trying to detect?

Hi,

The original intention of adding this checksum feature is for code debug
purpose when I develop compress framework in f2fs and add more compress
algorithms into the framework, it helps to find obvious implementation
bug, however this checksum feature was not fully designed, so that I didn't
upstream it at that time.

One other concern is to find any mismatch between original raw data and
persisted data, no matter how it becomes to mismatched and then return
error code to user if it detects the mismatch.

And then fsck can repair mismatched chksum in the condition one persisted
chksum matchs to calculated one, and one other doesn't.

Thanks,

> 
> If there are errors in the data then 'fixing' the checksum is pointless.
> (You've got garbage data - might as well not have the checksum).
> 
> If you are worried about the implementation of the compression
> algorithm then a checksum of the raw data is needed.
> 
> If you want to try error correcting burst errors in the compressed
> data then a crc of the compressed data can be used for error correction.
> 
> OTOH the most likely error is that the file meta-data and data sector
> weren't both committed to disk when the system crashed.
> In which case the checksum has done its job and the file is corrupt.
> fsck should probably move the file to 'lost+found' for manual checking.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
