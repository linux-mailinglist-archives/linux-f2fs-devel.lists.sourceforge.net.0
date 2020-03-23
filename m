Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C618ED8B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 02:07:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGBYp-0006HA-3R; Mon, 23 Mar 2020 01:07:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGBYm-0006Gs-U4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 01:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pkB3IIb5hlNjfeHDNs4NbsCYK4HjJcAyVYthqBbspvo=; b=Ivb+vv99pNCoakGGQ2bZCLcd7z
 ZJA6fQ5pUy3uXlI9GOYz6dVc73W4r08iHoXs9YWLFUKZa3t2vMz4xNNHTppYm9VqmW60HLlUXm84F
 JcCBBuDZ9C7zN6Ndx1VnsjK2bKiwSsOBuN8PLeVAJfonl5IVtBo8Ef6p8rTwuTEthdPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pkB3IIb5hlNjfeHDNs4NbsCYK4HjJcAyVYthqBbspvo=; b=RH9qLpv5QbrCOl2zRVIt/5eUBd
 vVdYlRAxrufoJDS0RDcuXwsZbh3sUOCMKCS1GOcU1iVPKslhxNv0UhgoJnK8xME2QTKzvaMeHvCsf
 Vh3GILI8NKx6ILEOrWsvz2fyoeVDh7qf0v2LEraIZbWYYP4K09kC9UqOE/RTLdEnOrN0=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGBYi-000MLv-HE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 01:07:20 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1F765C28ED1691C6004D;
 Mon, 23 Mar 2020 09:07:07 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 09:07:04 +0800
To: Joe Perches <joe@perches.com>, Chao Yu <chao@kernel.org>,
 <jaegeuk@kernel.org>
References: <20200322135614.10413-1-chao@kernel.org>
 <d88cce8ff37f336087899226668abcbcacd96baa.camel@perches.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c5b8115e-509d-9ace-ed4d-87bc2484d834@huawei.com>
Date: Mon, 23 Mar 2020 09:07:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d88cce8ff37f336087899226668abcbcacd96baa.camel@perches.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGBYi-000MLv-HE
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix potential .flags overflow on
 32bit architecture
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/22 22:56, Joe Perches wrote:
> On Sun, 2020-03-22 at 21:56 +0800, Chao Yu wrote:
>> From: Chao Yu <yuchao0@huawei.com>
>>
>> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
>> in 32bit architecture, since we introduced FI_MMAP_FILE flag
>> when we support data compression, we may access memory cross
>> the border of .flags field, corrupting .i_sem field, result in
>> below deadlock.
>>
>> To fix this issue, let's expand .flags as an array to grab enough
>> space to store new flags.
> []
>> +static inline void __set_inode_flag(struct inode *inode, int flag)
>> +{
>> +	if (!test_bit(flag % BITS_PER_LONG,
>> +			&F2FS_I(inode)->flags[BIT_WORD(flag)]))
>> +		set_bit(flag % BITS_PER_LONG,
>> +			&F2FS_I(inode)->flags[BIT_WORD(flag)]);
>> +}
> 
> I believe you don't need to do anything like this
> but just let test_bit and set_bit do the indexing.
> 
> 	if (!test_bit(flg, F2FS_I(inode->flags)))
> 		set_bit(flag, F2FS_I(inode->flags));
> 
> And there already is a function called test_and_set_bit()

Yup, I've cleaned up with test_and_{set,clear}_bit(), thanks for your
reminder.

Thanks,

> 
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
