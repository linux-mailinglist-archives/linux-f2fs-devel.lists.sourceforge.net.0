Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB9288011
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 03:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQhQP-0002AQ-8c; Fri, 09 Oct 2020 01:42:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kQhQN-0002AJ-OQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 01:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KhjRnPtxOYTQTFlhE/kkNuyXd9lWh0WoNq5+IFjb/ZM=; b=kMvIc2rN1lCm7om4tLyUOQbJtV
 A5V5Rf4BoAHr35Uno30iwOf1+dQBH9gxrJljqORLsf2wFJJfRnLVwI1WDKfNdlxt5DGd6+n4wia0M
 UyWG9IB60ZxtykpiY4nli62JFHEryIozb2QZ1LBokmOZV6l17fXOFoH4WIDEW1S4MVo8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KhjRnPtxOYTQTFlhE/kkNuyXd9lWh0WoNq5+IFjb/ZM=; b=RpAsz0bkbzGjOk5DUCh8WwdfqT
 f1TKGi1u/C7TRWCiEzJ83o4MH9eyDMYid50WokerK+ySdzK1jXj2OqTDqiDUe2WxOOaMLZi2WUtzs
 XOZ+E1/vfUaodM988lc7o+Vjp57nA6zRqvbshzYPFKS61Er5u4D4g4K9PX6ijM1RZe1w=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQhQC-003ejP-6n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 01:42:23 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2F9D01D630E861D9C3E1;
 Fri,  9 Oct 2020 09:42:04 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 9 Oct 2020
 09:42:03 +0800
To: <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <000000000000432c5405b1113296@google.com>
 <20201007213253.GD1530638@gmail.com> <20201007215305.GA714500@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c7baef0d-d459-114f-7146-627f0c4159ad@huawei.com>
Date: Fri, 9 Oct 2020 09:42:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201007215305.GA714500@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kQhQC-003ejP-6n
Subject: Re: [f2fs-dev] [f2fs bug] infinite loop in
 f2fs_get_meta_page_nofail()
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
Cc: syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/8 5:53, jaegeuk@kernel.org wrote:
> On 10/07, Eric Biggers wrote:
>> [moved linux-fsdevel to Bcc]
>>
>> On Wed, Oct 07, 2020 at 02:18:19AM -0700, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    a804ab08 Add linux-next specific files for 20201006
>>> git tree:       linux-next
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=17fe30bf900000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=26c1b4cc4a62ccb
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=ee250ac8137be41d7b13
>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1336413b900000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f7392b900000
>>>
>>> The issue was bisected to:
>>>
>>> commit eede846af512572b1f30b34f9889d7df64c017d4
>>> Author: Jaegeuk Kim <jaegeuk@kernel.org>
>>> Date:   Fri Oct 2 21:17:35 2020 +0000
>>>
>>>      f2fs: f2fs_get_meta_page_nofail should not be failed
>>>
>>
>> Jaegeuk, it looks like the loop you added in the above commit doesn't terminate
>> if the requested page is beyond the end of the device.
> 
> Yes, that will go infinite loop. Otherwise, it will trigger a panic during
> the device reboot. Let me think how to avoid that before trying to get the
> wrong lba access.

Delivering f2fs_get_sum_page()'s return value needs a lot of codes change, I think
we can just zeroing sum_page in error case, as we have already shutdown f2fs via
calling f2fs_stop_checkpoint(), then f2fs_cp_error() will stop all updates to
filesystem data including summary pages.

Thoughts?

Thanks,

> 
>>
>> - Eric
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
