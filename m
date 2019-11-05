Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C20EF3B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 03:50:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRouw-0004oX-3Y; Tue, 05 Nov 2019 02:50:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRouu-0004oB-2v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFBzB7rTI2ING7QmE78Odri+hoP/H84KClSZRicK2Nw=; b=ZxfKoWgGexpiikiZ28GUhKmetn
 YiHzftq5FKeaeX9CFRmtroE5FSiA1VGZRlUNevTb5W65DQCUcAJMZ7Cjp4/lDs2JJTA4/As76iGKZ
 fh6cIAfMo/OgxN4EbhreYaZ1+tFY3KBqC7MuBSrYVv8p7oXJXXpdlg4Dia/pxKfOlTV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFBzB7rTI2ING7QmE78Odri+hoP/H84KClSZRicK2Nw=; b=DfDEDozOQpVVOV68gweq8nuAe6
 mgQJoSoef5PN/CxKVpwuROFFUV/7C7PzAYDuwD6vo7NnwIjZ2gacqH+JVd5LxI8Yu0aDwyzhtCxeS
 A5+SiXCCe1kxrTuO452veoXGAMFK1eB6e7UpGDmSCe2wD8iA/De2mpNT39icaar+CKNo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRour-000WuQ-TN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:50:00 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 02C891ED94C3D443FDDB;
 Tue,  5 Nov 2019 10:49:48 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 10:49:44 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191101095324.9902-1-yuchao0@huawei.com>
 <20191101095324.9902-3-yuchao0@huawei.com>
 <20191105000249.GA46956@jaegeuk-macbookpro.roam.corp.google.com>
 <40d0df3f-cc55-d31a-474b-76f57d96bd89@huawei.com>
 <20191105023835.GD692@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <00ade77c-5451-4953-0232-89342a029f33@huawei.com>
Date: Tue, 5 Nov 2019 10:49:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191105023835.GD692@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iRour-000WuQ-TN
Subject: Re: [f2fs-dev] [PATCH 3/3] Revert "f2fs: use kvmalloc,
 if kmalloc is failed"
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

On 2019/11/5 10:38, Eric Biggers wrote:
> On Tue, Nov 05, 2019 at 10:17:41AM +0800, Chao Yu wrote:
>> On 2019/11/5 8:02, Jaegeuk Kim wrote:
>>> On 11/01, Chao Yu wrote:
>>>> This reverts commit 5222595d093ebe80329d38d255d14316257afb3e.
>>>>
>>>> As discussed with Eric, as kvmalloc() will try kmalloc() first, so
>>>> when we need allocate large size memory, it'd better to use
>>>> f2fs_kvmalloc() directly rather than adding additional fallback
>>>> logic to call kvmalloc() after we failed in f2fs_kmalloc().
>>>>
>>>> In order to avoid allocation failure described in original commit,
>>>> I change to use f2fs_kvmalloc() for .free_nid_bitmap bitmap memory.
>>>
>>> Is there any problem in the previous flow?
>>
>> No existing problem, however, it's redundant to introduce fallback flow in
>> f2fs_kmalloc() like vmalloc() did, since we can call f2fs_vmalloc() directly in
>> places where we need large memory.
>>
>> Thanks,
>>
> 
> f2fs_kmalloc() also violated the naming convention used everywhere else in the
> kernel since it could return both kmalloc and vmalloc memory, not just kmalloc
> memory.  That's really error-prone since people would naturally assume it's safe
> to free the *_kmalloc()-ed memory with kfree().

Agreed.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
