Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7126D34E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 07:57:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kImv1-0007DG-GV; Thu, 17 Sep 2020 05:57:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris.ruehl@gtsys.com.hk>) id 1kImv0-0007D9-48
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 05:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=moNK/xvwZVpMH9EILkFj9bxJhfFVPEtJe1dRRvahEWs=; b=BGbUfqVXsQracvmmo3Mme4fvjT
 s2nsIqDtjL+vPztneETfBK54uUR9Iuo7UsiBhU+JisSgxCGqQe3kvYXNHgoRr8aDVq1CrDsKz6m3y
 P4CMdsAcfVFRv4Z/lwofEbSGGy2kKoWVVO2IZaL8XmoiJBH1O4ukxP72cnPhgyZ5nUyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=moNK/xvwZVpMH9EILkFj9bxJhfFVPEtJe1dRRvahEWs=; b=ealpkTpWVlY2OztMjiHWgcSo8U
 UwcHBE/InCn2/WLcx1IGkytSqny7MDHEjcWjIz6+RNyjI0OjJlGjA5lQTNNKgTNgxTjbliYRk/T3F
 Yph/dfXPo8mN5Xe8fJlpw1FAnnCUsPg2kUNffBfHEDuj1R/6w/3tIzItYGvpPdTisWsA=;
Received: from [27.111.83.178] (helo=mail.gtsys.com.hk)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kImuu-00Dhp9-PF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 05:57:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.gtsys.com.hk (Postfix) with ESMTP id D4C54200261F;
 Thu, 17 Sep 2020 13:56:59 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wY03vG_ytwUG; Thu, 17 Sep 2020 13:56:59 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
 by mail.gtsys.com.hk (Postfix) with ESMTP id B45CA22BA55F;
 Thu, 17 Sep 2020 13:56:59 +0800 (HKT)
Received: from [10.128.2.32] (unknown [124.217.188.80])
 by s01.gtsys.com.hk (Postfix) with ESMTPSA id 8E791C01B6B;
 Thu, 17 Sep 2020 13:56:59 +0800 (HKT)
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <b278baec-65df-312e-5d26-89dc1ea25c86@gtsys.com.hk>
 <fbd0fa14-f7a8-f6ff-abd4-37310228f694@gtsys.com.hk>
 <284f77a4-9e6f-ebd7-1f35-4e907cc590ca@huawei.com>
 <7ba740b2-76c5-b92a-37a5-c7641d9c7474@gtsys.com.hk>
 <bc04f65d-dc90-dd3b-ed5c-dba60ebbbdc3@huawei.com>
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <a70cb278-ef22-977b-87b0-f650ab9c8339@gtsys.com.hk>
Date: Thu, 17 Sep 2020 13:56:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bc04f65d-dc90-dd3b-ed5c-dba60ebbbdc3@huawei.com>
Content-Language: en-US
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kImuu-00Dhp9-PF
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



On 14/9/2020 3:55 pm, Chao Yu wrote:
> Hi Chris,
>
> On 2020/9/14 15:38, Chris Ruehl wrote:
>> I must say sorry for the noise, I checked the Ram and CPU, we have a bad
>> RAM which can't follow the 992Mhz and causes the problem, once limit the
>> CPU speed to 800Mhz the problem is gone. Both 4.9 & 5.4
>
> Okay, out of curiosity, the frequency 992Mhz has exceed the frequency limitation
> of RAM?
Its a problem with the PCB, not the RAM and the frequency.
We take out the CPU for investigation and found some aging on the
balls and pads. Likely to much humidity.

>
>>
>> Please consider this bug as false-positive.
>
> Alright, let us know if you have any issue on f2fs use.
>
> Thanks,

we have new rollout on rk3399 with ddr4 and 8G eMMC 5.4 - 8 bit bus
tests run with 4.9 4.19 and 5.4 plus rt patch, no problems here.


>
>>
>>
>> Regards
>> Chris
>> .
>>

-- 
GTSYS Limited RFID Technology
9/F, Unit E, R07, Kwai Shing Industrial Building Phase 2,
42-46 Tai Lin Pai Road, Kwai Chung, N.T., Hong Kong
Tel (852) 9079 9521

Disclaimer: https://www.gtsys.com.hk/email/classified.html



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
