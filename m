Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAB2A11F7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Oct 2020 01:33:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYepc-0007p9-TW; Sat, 31 Oct 2020 00:33:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kYepb-0007p1-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 00:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fi5FVRHeT+VXAlqEgXwxu2QpdnDKqldNKValgk6hZAc=; b=C9mP65ZRHK2Q5ihS2jHXDq/2fK
 Y6cd/cbtUFw/kpMqjgKpnudz02xu+k+ykRGiOgWpJSQXKKpMaqpRR4Wnyd0S/V6hvIlrsUSPxcvY+
 g73h89cqXv/b70Zq6/PkwDccTsuBnaDxYHC/LPICUMjEQZJAEesM3s5NEkoiaXgqa8aY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fi5FVRHeT+VXAlqEgXwxu2QpdnDKqldNKValgk6hZAc=; b=QDCJpiYnjOyoXaufV437RNqR+v
 Ue0dxuPDoUh0BV6mbwtLE5fQfj4FII2F6ONqVs8mXMi5B7a5QtGiPczIoFoy+CcfRgbY5FOcdZLY3
 pOHW8+XIbNm6y5tB1x9L38Ws7EDl9ycAaeo6N+QyAtzftrAcXPsZh+c+2h4ep9PFfas4=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYepU-003Hcp-Hq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 00:33:19 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CNKs36KJrz15P53;
 Sat, 31 Oct 2020 08:32:55 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 31 Oct
 2020 08:32:52 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201030072610.57155-1-yuchao0@huawei.com>
 <20201030165556.GA1097@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9dce9d49-fb13-40cd-eb1f-24212a600beb@huawei.com>
Date: Sat, 31 Oct 2020 08:32:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201030165556.GA1097@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kYepU-003Hcp-Hq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: move ioctl interface definitions to
 separated file
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/31 0:55, Eric Biggers wrote:
> On Fri, Oct 30, 2020 at 03:26:10PM +0800, Chao Yu wrote:
>> +
>> +struct f2fs_gc_range {
>> +	u32 sync;
>> +	u64 start;
>> +	u64 len;
>> +};
> 
> Userspace headers need to use __u32, __u64, etc. instead of u32, u64, etc.

Correct.

> 
> Did you try installing this header, and including it in a userspace program?

Let me do more test before next version.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
