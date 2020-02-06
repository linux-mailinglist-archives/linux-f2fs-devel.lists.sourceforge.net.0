Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A870154211
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2020 11:44:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1izeeF-0003nR-0d; Thu, 06 Feb 2020 10:44:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1izeeD-0003n1-2k
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Feb 2020 10:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3TmHsw9sQEqlRvQtVmDYQKIbJSMayuXpyURC4BIzr8=; b=JsEQrrtBrKGF1O8MtMgsaxJP15
 FcHgE81rbKcyMFkVDL0mRSmOjr9dZnzJnHlsgwhz3Ob9Ys1rTlwCbNWgSzfzLKHSDg+KsY7UuVpWz
 +n0ZEqOc4gnoxo2pdgQWAe38QXLj28uembXAVGfuMJ9MO/vgLswwRUb/ha5PJ5SnMNoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T3TmHsw9sQEqlRvQtVmDYQKIbJSMayuXpyURC4BIzr8=; b=DD5VV24mG2qpowUuzoN/21uOQI
 x2VconAzvofWy0TqRnhfSfJlJgRXtDVY/pSeixR0D70X1uqpn/HObZH31/U4Z8SUeV146KhxkGb4L
 0g3l9l4WYKA6zVGiYQXCJEHk1FzA0gSJXqsiOWUu4dpBauWoHsmXMVnNXr+U89+ktcHg=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1izee8-00Bprr-Rw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Feb 2020 10:44:37 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AB7CA32F6C2CAFABF1A5;
 Thu,  6 Feb 2020 14:29:34 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 6 Feb 2020
 14:29:31 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20200201150807.17820-1-willy@infradead.org>
 <20200203033903.GB8731@bombadil.infradead.org>
 <bd08bf56-f901-33b1-5151-f77fd823e343@huawei.com>
 <20200205030845.GP8731@bombadil.infradead.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c5bfd52b-e336-709b-5bed-aa29fc110631@huawei.com>
Date: Thu, 6 Feb 2020 14:29:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200205030845.GP8731@bombadil.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1izee8-00Bprr-Rw
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Make f2fs_readpages readable again
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/2/5 11:08, Matthew Wilcox wrote:
> On Wed, Feb 05, 2020 at 09:58:29AM +0800, Chao Yu wrote:
>> On 2020/2/3 11:39, Matthew Wilcox wrote:
>>>
>>> Remove the horrendous ifdeffery by slipping an IS_ENABLED into
>>> f2fs_compressed_file().
>>
>> I'd like to suggest to use
>>
>> if (IS_ENABLED(CONFIG_F2FS_FS_COMPRESSION) && f2fs_compressed_file(inode))
>>
>> here to clean up f2fs_readpages' codes.
>>
>> Otherwise, f2fs module w/o compression support will not recognize compressed
>> file in most other cases if we add IS_ENABLED() condition into
>> f2fs_compressed_file().
> 
> If we need to recognise them in order to deny access to them, then I
> suppose we need two predicates.  Perhaps:

Yup, for compression feature, now we use f2fs_is_compress_backend_ready() to
check whether current kernel can support to handle compressed file.

For the purpose of cleanup, I guess below change should be enough...

>> if (IS_ENABLED(CONFIG_F2FS_FS_COMPRESSION) && f2fs_compressed_file(inode))

Thanks,

> 
> 	f2fs_unsupported_attributes(inode)
> and
> 	f2fs_compressed_file(inode)
> 
> where f2fs_unsupported_attributes can NACK any set flag (including those
> which don't exist yet), eg encrypted.  That seems like a larger change
> than I should be making, since I'm not really familiar with f2fs code.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
