Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E818E502
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 08:48:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hy9Yl-00078K-0G; Thu, 15 Aug 2019 06:48:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hy9Yj-000789-Vy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Aug 2019 06:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5M2Xln1m3u1pnaULk+LqBxLVnIPDGJNUaF4UWWNXJeA=; b=mZ4Fc4DYDDx/iTGU2EeQZOjpsY
 /QQUc0BM9iube7r9Vvj4M7gBuHbFxoIUDsrxEt2jfCROJBzjrvygXPWjMUmWBlaKXlLstm/x2m8pQ
 sHxY2MqMxpyUL2o2ZhGK3pyB2pf8lcT5AhncsvG6fpf/N3z+EICebM4Jdz0EWSkDhfWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5M2Xln1m3u1pnaULk+LqBxLVnIPDGJNUaF4UWWNXJeA=; b=fJ2Av4AA3seBGPHplxlMgYwQaB
 pj3fdK6EeaQ+iHcOlGFfS40FReuRB/HjyU5Ibrni7DibI+jWZTw51azeMP3XnOyDQuS23Dn32+3eM
 2SiK/oAKJ27B7gS4XM1BxYlrByZe/K2YxSd5okn3vLc7UuobunBGSRrqUHyu84KZzQcA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hy9Yg-004att-4R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Aug 2019 06:48:29 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 42A33A527FC1F3E92053
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Aug 2019 14:48:19 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 15 Aug
 2019 14:48:15 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CAD14+f1YGinNQuVKc371vgJGJaaqYWqcaP6WwSuP1mwf-D2Tzw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5696f35e-d91a-801a-d2bb-fbbc188bbf4c@huawei.com>
Date: Thu, 15 Aug 2019 14:48:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f1YGinNQuVKc371vgJGJaaqYWqcaP6WwSuP1mwf-D2Tzw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hy9Yg-004att-4R
Subject: Re: [f2fs-dev] f2fs: dirty memory increasing during gc_urgent
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

Hi Ju Hyung,

On 2019/8/14 22:15, Ju Hyung Park wrote:
> Hi.
> 
> I'm reporting some strangeness with gc_urgent.
> 
> When running gc_urgent, I can see that dirty memory written in
> /proc/meminfo continuously getting increased until GC cannot find any
> more segments to clean.
> 
> I thought FG_GC are flushed.
> 
> And after GC ends, if I do `sync` and run gc_urgent again, it easily
> runs thousands of times more.
> 
> Is this an expected behavior?

I doubt that before triggering urgent GC, system has dirty datas in memory, then
when you trigger `sync`, GCed data and dirty data were flushed to devices
together, if we write dirty data with out-place-update model, it may make fragment.

So we can try
- sync
- trigger urgent GC
- sync
- cat /sys/kernel/debug/f2fs/status to check 'Dirty' field, the value should
close to zero

Thanks,


> 
> I would much prefer gc_urgent cleaning everything up at first run,
> without having to sync at the end and running gc_urgent again.
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
