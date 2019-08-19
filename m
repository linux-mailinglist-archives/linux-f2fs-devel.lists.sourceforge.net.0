Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036291AC2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 03:34:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzWYX-0006nH-R2; Mon, 19 Aug 2019 01:33:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hzWYU-0006n3-DS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 01:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:CC:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzTFYdmU4heZXc2vHA8Upg8VyckxdS/gGmt70FePvWY=; b=InjqoQr1rXKkvcmdSSxKdeK/a4
 RWLQliu+pbmQKitZBglBEeVnUqeNOk/xHRF7RcP3zDMpVGBFqeKhNoHipwsO/9wFn6IcxIk3PKCwr
 A3+foWJ+LcVLP7VuKWGu11TSio3ic82NX35W98XMq/j3ACYv76TWAXbp7i6+r15LxuHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:CC:From:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MzTFYdmU4heZXc2vHA8Upg8VyckxdS/gGmt70FePvWY=; b=cD5g0VEZPfXRPaoTK9vQPlisyH
 gtJbIAHkwtwFe/QJQ7I/KpNIrstlaoQIPa++9hlPi+WK/uqzsTye3qqHTvKF9tUHQFOfKgxIAmhn9
 hHtmT2PM/6rPxibcbnN0pgf2ZHF70U/qweTc5LUPwpCBes3azHEuSq5I8xAEejYPwavQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzWYQ-00BE4j-W5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 01:33:54 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1201674B1B446A0E2BD3;
 Mon, 19 Aug 2019 09:33:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 19 Aug
 2019 09:33:38 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20190816055539.30420-1-ebiggers@kernel.org>
 <20190816055539.30420-3-ebiggers@kernel.org>
 <d6022f8b-2d75-4e9d-882e-038551684c37@huawei.com>
 <20190818154138.GA1118@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3f3fa304-2ce0-7773-7335-30f8e3c5b5d5@huawei.com>
Date: Mon, 19 Aug 2019 09:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190818154138.GA1118@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hzWYQ-00BE4j-W5
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: fix copying too many bytes in
 FS_IOC_SETFSLABEL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/18 23:41, Eric Biggers wrote:
> On Fri, Aug 16, 2019 at 02:59:37PM +0800, Chao Yu wrote:
>> On 2019/8/16 13:55, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> Userspace provides a null-terminated string, so don't assume that the
>>> full FSLABEL_MAX bytes can always be copied.>
>>> Fixes: 61a3da4d5ef8 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
>>
>> It may only copy redundant zero bytes, and will not hit security issue, it
>> doesn't look like a bug fix?
>>
>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>
>> Anyway, it makes sense to me.
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
> 
> It's not clear that userspace is guaranteed to provide a full FSLABEL_MAX bytes
> in the buffer.  E.g. it could provide "foo\0" followed by an unmapped page.

You're right, thanks for your explanation.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
