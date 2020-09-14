Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A2268699
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Sep 2020 09:55:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHjL5-0003ly-G8; Mon, 14 Sep 2020 07:55:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kHjL3-0003jZ-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 07:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3lB7TQSOqy0Xs9QDY0d+6aujIbLX9XAjX0YRLVsatI=; b=YmCw8E7KLhwOa+vrX31D8NJztR
 i2e23Sj6rh8Ro3kglwpD3N1I8JF5XvSL1G4RMIruLmbBZYe8L37Af2xaNivByk/keUuUqs4Yrx2Ea
 DJ/GlFZjVT64zE6oNv7XgfaOS+niUy6OHotRXi0FKK26+peqZYI7KC8SdIhjY0plc1fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b3lB7TQSOqy0Xs9QDY0d+6aujIbLX9XAjX0YRLVsatI=; b=XSkbcMZk4eVuCJlM8S5KBVZFog
 hLbq1OwNtKxgdhUX7anaSGasqYWxqkjmrYFLeyHaPD+sj5kGo6ocIxYGk4fv1zff3+HAYs5AFdk1a
 5SG/BzZ3nODdO4aZlvr2EOY+2ySMNdrQ56/FZwy2sht+Q9EFHUYtgHGU0QhtfCqIvVNY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHjKr-0085SZ-5w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 07:55:49 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8D3E6F709A543903ECA0;
 Mon, 14 Sep 2020 15:55:16 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 14 Sep
 2020 15:55:15 +0800
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <b278baec-65df-312e-5d26-89dc1ea25c86@gtsys.com.hk>
 <fbd0fa14-f7a8-f6ff-abd4-37310228f694@gtsys.com.hk>
 <284f77a4-9e6f-ebd7-1f35-4e907cc590ca@huawei.com>
 <7ba740b2-76c5-b92a-37a5-c7641d9c7474@gtsys.com.hk>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bc04f65d-dc90-dd3b-ed5c-dba60ebbbdc3@huawei.com>
Date: Mon, 14 Sep 2020 15:55:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7ba740b2-76c5-b92a-37a5-c7641d9c7474@gtsys.com.hk>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kHjKr-0085SZ-5w
Subject: Re: [f2fs-dev] F2fs failed on fresh installation 1st boot
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

Hi Chris,

On 2020/9/14 15:38, Chris Ruehl wrote:
> I must say sorry for the noise, I checked the Ram and CPU, we have a bad
> RAM which can't follow the 992Mhz and causes the problem, once limit the
> CPU speed to 800Mhz the problem is gone. Both 4.9 & 5.4

Okay, out of curiosity, the frequency 992Mhz has exceed the frequency limitation
of RAM?

> 
> Please consider this bug as false-positive.

Alright, let us know if you have any issue on f2fs use.

Thanks,

> 
> 
> Regards
> Chris
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
