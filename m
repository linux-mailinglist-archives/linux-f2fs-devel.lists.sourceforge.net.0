Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 154782D1FEF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 02:26:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRly-0006Sx-Rr; Tue, 08 Dec 2020 01:26:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmRlw-0006Si-J0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4GAmCsi7+bfR5J6dXvU63jFqYLHeWEY2W/h5dVP8um0=; b=Nx+T/79vcOUt+kQaULZFa/auuF
 d7y0OdSHEMVKRxzvrwfdUVJFFfeeo36STNpU1Nk3nEzSy1K/O7pjJLgtSru+aZdRZ3OPM1p5bIpUp
 M2FMWV6nH+ZZAZkjzcW9yRyhxItgRkOGHsu6sjRFZYvzttulzZ6UXlw1Lhci2xWMyC5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4GAmCsi7+bfR5J6dXvU63jFqYLHeWEY2W/h5dVP8um0=; b=gvZBe1yNkeJEUz84+tx8LrywB3
 2H5+sidU3HE6wFWhckhzcQHUJDkmo5KY2NemQq+eFvjzR+Rwuy2gAUcF9Xx8uu+UjE3G4ETwgtE70
 cGo4pkOaphGJZiai5m2XTBlxkxR/ttf4PO0JKzVPZfHgwv4HmZihEtPqR5ffJzwcriWk=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmRlk-002mMm-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:26:32 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqjDD43X4z15Z5C;
 Tue,  8 Dec 2020 09:25:32 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 8 Dec 2020
 09:25:54 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Jack Qiu <jack.qiu@huawei.com>
References: <20201207120114.25642-1-jack.qiu@huawei.com>
 <20201207120114.25642-3-jack.qiu@huawei.com> <X85dFjmqLmo/RsQn@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <529dd167-3951-1fb9-a1c3-9ae6cdbc8dfb@huawei.com>
Date: Tue, 8 Dec 2020 09:25:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X85dFjmqLmo/RsQn@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmRlk-002mMm-Bp
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: inline: remove redundant
 FI_DATA_EXIST set
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 0:49, Jaegeuk Kim wrote:
> On 12/07, Jack Qiu wrote:
>> FI_DATA_EXIST has been set in recover_inline_flags, no need set in
>> f2fs_recover_inline_data again. Just remove it.
>>
>> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
>> ---
>>   fs/f2fs/inline.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>> index 0399531efcd3..0a8f7eefca7d 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -286,7 +286,6 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
>>   		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
>>
>>   		set_inode_flag(inode, FI_INLINE_DATA);
>> -		set_inode_flag(inode, FI_DATA_EXIST);
> 
> Wait, recover_inline_flags() sets this based on on-disk flag, but this tries to
> recover it back.

Should this flag only be recovered with the way like __recover_inline_status()?
otherwise, the data_exist status may be not be consistent with real condition.

Thanks,

> 
>>
>>   		set_page_dirty(ipage);
>>   		f2fs_put_page(ipage, 1);
>> --
>> 2.17.1
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
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
