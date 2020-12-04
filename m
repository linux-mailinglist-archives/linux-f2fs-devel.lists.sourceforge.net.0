Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD81B2CEA28
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 09:50:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl6nb-0000T5-VW; Fri, 04 Dec 2020 08:50:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kl6na-0000St-GF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 08:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gw/GYRudOjL0Jb2C1XDlTzlpDiOuoYvthlqI6bgUKQ0=; b=Pjy4yvMulLAwhexP1gCuL3JnoB
 FWGsD0kr8SYpxtVTPBp6ky0ZhqKIO2WoeCSNSoS8r9FrCATm1fKbaSb3lu2O7RQWajyFMVHCmXzwg
 +TN9XbYenhtwkuyeesGBVHJS3bblhd8uhMaTgYWcdWKMMPomc+Wu6Ap5e/eyzepPuDdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gw/GYRudOjL0Jb2C1XDlTzlpDiOuoYvthlqI6bgUKQ0=; b=A4LYkDU7bbtiTPS0B3kcV/zDDf
 3mJYJIe0l7V10mpqlwLfBq47F2U+3S802IosTwtgsvtNgDlyVDGoXUCmjE+5HNkM2fbncxR5k/Ear
 sltA7vEHmOtS6OYdEk+BC61liVjuvnEEJM4aSGZz0uAvL9lVWMeWIgbGA/h6r+PjYzPE=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kl6nO-001Lg9-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 08:50:42 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnRGb5mhzzLyfH;
 Fri,  4 Dec 2020 16:49:43 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 4 Dec 2020
 16:50:14 +0800
To: Gao Xiang <hsiangkao@redhat.com>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com> <20201204003119.GA1957051@xiangao.remote.csb>
 <d713f69b-af1b-4e4a-41ad-267a3b9026ac@huawei.com>
 <20201204074323.GA2025226@xiangao.remote.csb>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ffca7f07-653f-1270-72d4-e66ffc8a7473@huawei.com>
Date: Fri, 4 Dec 2020 16:50:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201204074323.GA2025226@xiangao.remote.csb>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kl6nO-001Lg9-Aw
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: support compress level
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
Cc: Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Xiang,

On 2020/12/4 15:43, Gao Xiang wrote:
> Hi Chao,
> 
> On Fri, Dec 04, 2020 at 03:09:20PM +0800, Chao Yu wrote:
>> On 2020/12/4 8:31, Gao Xiang wrote:
>>> could make more sense), could you leave some CR numbers about these
>>> algorithms on typical datasets (enwik9, silisia.tar or else.) with 16k
>>> cluster size?
>>
>> Just from a quick test with enwik9 on vm:
>>
>> Original blocks:	244382
>>
>> 			lz4			lz4hc-9
>> compressed blocks	170647			163270
>> compress ratio		69.8%			66.8%
>> speed			16.4207 s, 60.9 MB/s	26.7299 s, 37.4 MB/s
>>
>> compress ratio = after / before
> 
> Thanks for the confirmation. it'd be better to add this to commit message
> if needed when adding a new algorithm to show the benefits.

Sure, will add this.

> 
> About the speed, I think which is also limited to storage device and other
> conditions (I mean the CPU loading during the writeback might be different
> between lz4 and lz4hc-9 due to many other bounds, e.g. UFS 3.0 seq
> write is somewhat higher vs VM. lz4 may have higher bandwidth on high

Yeah, I guess my VM have been limited on its storage bandwidth, and its back-end
could be low-end rotating disk...

> level devices since it seems some IO bound here... I guess but not sure,
> since pure in-memory lz4 is fast according to lzbench / lz4 homepage.)
> 
> Anyway, it's up to f2fs folks if it's useful :) (the CR number is what
> I expect though... I'm a bit of afraid the CPU runtime loading.)

I just have a glance at CPU usage numbers (my VM has 16 cores):
lz4hc takes 11% in first half and downgrade to 6% at second half.
lz4 takes 6% in whole process.

But that's not accruate...

Thanks,

> Thanks for your time!
> 
> Thanks,
> Gao Xiang
> 
>>
>> Thanks,
>>
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
