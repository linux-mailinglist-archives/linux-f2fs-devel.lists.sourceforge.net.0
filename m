Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E721534B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 09:30:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsLZt-00032Q-VU; Mon, 06 Jul 2020 07:30:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jsLZt-00032F-3h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wMtdDzjllpvOmR4DGpyJ/7Zzx0BNChMOSCoV9po8IzY=; b=N7wK9UL8l5FD/9dqHofEJIxCtB
 UNWo59p0r6Wbs3/M4LC2DvEzSq10cPwP0AVZWNP+LFdvwLa/lpb3ocUTZqdta/u29KV2cxGMSTb6a
 JZaPODmSrZWRiOHRyNNzqyCUYdcRn8KIhsKqmFQuMV8hEqOZ8tjXlMVd6J0U7YmzZHyw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wMtdDzjllpvOmR4DGpyJ/7Zzx0BNChMOSCoV9po8IzY=; b=WutyXEtvtZhHFWKIf92wkIBLqT
 7BmLYoRXnK2JlaCXy7HQSaP2xEas3zTO2r4Z7Yk/qSLM4YUwiD9O1FzOhizbXBDGH4Nh5Ch6DUy9V
 F+6xbuVZZRG7vRQ2KjVIvIA0iux8W2u2h27Jh4wUHJCNzuNBazsI0J57/bNizIisiKDQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsLZo-00EkvF-MW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:30:13 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 833A7E33D0076DB66370;
 Mon,  6 Jul 2020 15:29:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Jul 2020
 15:29:40 +0800
To: lampahome <pahome.chen@mirlab.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
Date: Mon, 6 Jul 2020 15:29:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsLZo-00EkvF-MW
Subject: Re: [f2fs-dev] Can I know if now is gc-ing or checkpointing?
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

On 2020/7/6 15:10, lampahome wrote:
> I tried to test  performance with f2fs and create many fio to test it.
> 
> I found when fio reach a number(e.g. 25 fio), the performance degrade
> not in proportional with small number
> 
> EX:
> 5 fio: bandwidth 300MB/s
> 10 fio: bandwidth 150MB/s
> 25 fio: bandwidth 30MB/s

What's your buffer size for each flush?

> 
> I wonder many trigger the gc or checkpoint, may I know if it running
> foreground or background?

cat /sys/kernel/debug/f2fs/status |grep CP

and

cat /sys/kernel/debug/f2fs/status |grep GC

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
