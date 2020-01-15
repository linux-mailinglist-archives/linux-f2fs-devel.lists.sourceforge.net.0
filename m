Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 401CD13BCDC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 10:54:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irfNv-0000v5-NF; Wed, 15 Jan 2020 09:54:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1irfNs-0000uM-OC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 09:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iUFNXolgudU1gu/h+pwY0lt0MT1f5oHmI644MRTPzpc=; b=A5OhOIpKedIZb2oLD2qa2iaoN+
 BxQvZonXUYPbu8ESyxOh88ANSzUv52swJDYJh76hnIf0MNIuGmXIfmqy1k/gIimSuXwNQnmLmwPMd
 zr/PdaKqvtHkW4+E69jFqo8NXlw+3gQ8FMEqW71If5PJRChlGcT3Bw/QmHa05Lply6k4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iUFNXolgudU1gu/h+pwY0lt0MT1f5oHmI644MRTPzpc=; b=lTtR0JsSOXiYg/dJM8mnFCdW5g
 V4fbcE/sfbER/8Iu/HOcig2LsdsRHA1Ye4rkiW+jusyJ/ZTGlah2FIhkIvHNXXHEi2cILE4cQrZMU
 rHHG9zkHIA4mBeS2rdfr1oc0ec4dJAKPpkDckmaCv4rVQozkji3cGwlQcU6tMiqsMHj0=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irfNp-006yQz-4U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 09:54:44 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 79DE1587D749E023B9B4;
 Wed, 15 Jan 2020 17:54:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 Jan
 2020 17:54:23 +0800
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Yuehaibing
 <yuehaibing@huawei.com>
References: <20191224124359.15040-1-yuehaibing@huawei.com>
 <673efe18-d528-2e9b-6d44-a6a7a22086f3@huawei.com>
 <62ce1981-9061-f798-a65d-9599ceceb4b8@huawei.com>
 <20191226082419.ljbhystwkhp2d4gh@shindev.dhcp.fujisawa.hgst.com>
 <20200115023328.bummaaa7pdnao5qk@shindev.dhcp.fujisawa.hgst.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0aea7754-2114-cc78-3453-bc608bacd45a@huawei.com>
Date: Wed, 15 Jan 2020 17:54:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200115023328.bummaaa7pdnao5qk@shindev.dhcp.fujisawa.hgst.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1irfNp-006yQz-4U
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/1/15 10:33, Shinichiro Kawasaki wrote:
> On Dec 26, 2019 / 17:24, Shin'ichiro Kawasaki wrote:
>> On Dec 26, 2019 / 14:05, Yuehaibing wrote:
>>> On 2019/12/26 11:44, Chao Yu wrote:
>>>> On 2019/12/24 20:43, YueHaibing wrote:
>>>>> fs/f2fs/segment.c: In function fix_curseg_write_pointer:
>>>>> fs/f2fs/segment.c:4485:35: warning: variable cs_block set but not used [-Wunused-but-set-variable]
>>>>>
>>>>> It is never used since commit 362d8a920384 ("f2fs: Check
>>>>> write pointer consistency of open zones") , so remove it.
>>>>
>>>> Thanks for the fix!
>>>>
>>>> Do you mind merging this patch to original patch? as it's still
>>>> pending in dev branch.
>>>
>>> It's ok for me.
>>>
>>
>> Thank you for this catch and the fix. Appreciated.
> 
> I have merged YueHaibing's change to the write pointer consistency fix patch
> and sent out as the v6 series. Thanks again for finding out the unused variable.
> 
> I was not sure if I should add Chao Yu's reviewed by tag to the patch from which
> the unused variable was removed. To be strict, I didn't add the tag. Just
> another quick review by Chao will be appreciated.

Thanks for the revision. :)

I guess Jaegeuk can merge that kind of fix into original patch, and
meanwhile keeping old Reviewed-by tag in that patch.

Thanks,

> 
> --
> Best Regards,
> Shin'ichiro Kawasaki.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
