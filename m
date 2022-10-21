Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F226071AB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 10:06:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oln2r-0006DJ-S3;
	Fri, 21 Oct 2022 08:06:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1oln2c-0006D1-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TbkWa8UpOuwWbaKsXoVj1MqIDQZJ376yxEpng9yYR/s=; b=YwmfGAameDdQlMqBhOljrHkusm
 ZxabxbZ8iza4FWr/7afDact9EbUWyI2C82RGdJx7ZitQuGZK8bntCZD0UrtsTI2HfyiJReJ7And3A
 +/rxJqhzUWgP4GQRTYaHf6zTzANgfYpaqIVMoR4qDVrrPVCHBv31xSxHHD39xNxL52Js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TbkWa8UpOuwWbaKsXoVj1MqIDQZJ376yxEpng9yYR/s=; b=cgrnv1oEDGDzGkewE4i5l15VBx
 XVrPHPh7obcSHzrOI7gxYYTPylxPRmy7LtLoVoMLmTzisbzoTtGek/OfAiIXtqmWvwT4OloJ9bEDn
 sl8pr81Pkn/RzbB3w/GN6G4U9U2ymK9XxvXcFq6PdxkSfAnpxg5hR7CkMX0Sy+oVmTj8=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oln2T-00BzWq-R5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:06:04 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mtxjn0wbFzmVCy;
 Fri, 21 Oct 2022 16:01:01 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:05:20 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:05:19 +0800
To: Luben Tuikov <luben.tuikov@amd.com>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-erofs@lists.ozlabs.org>, <ocfs2-devel@oss.oracle.com>,
 <linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
 <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <20221021022102.2231464-2-yangyingliang@huawei.com>
 <eb0f1459-7980-4a7b-58f9-652eeccc357e@amd.com>
Message-ID: <10d887c4-7db0-8958-f661-bd52e6c8b4af@huawei.com>
Date: Fri, 21 Oct 2022 16:05:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <eb0f1459-7980-4a7b-58f9-652eeccc357e@amd.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 13:34,
 Luben Tuikov wrote: > On 2022-10-20 22:20, 
 Yang Yingliang wrote: >> kset_register() is currently used in some places
 without calling >> kset_put() in error path, because the calle [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oln2T-00BzWq-R5
Subject: Re: [f2fs-dev] [PATCH 01/11] kset: fix documentation for
 kset_register()
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
From: Yang Yingliang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yang Yingliang <yangyingliang@huawei.com>
Cc: alexander.deucher@amd.com, mst@redhat.com, richard@nod.at, somlo@cmu.edu,
 liushixin2@huawei.com, joseph.qi@linux.alibaba.com, jlbec@evilplan.org,
 jaegeuk@kernel.org, rafael@kernel.org, hsiangkao@linux.alibaba.com,
 akpm@linux-foundation.org, mark@fasheh.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2022/10/21 13:34, Luben Tuikov wrote:
> On 2022-10-20 22:20, Yang Yingliang wrote:
>> kset_register() is currently used in some places without calling
>> kset_put() in error path, because the callers think it should be
>> kset internal thing to do, but the driver core can not know what
>> caller doing with that memory at times. The memory could be freed
>> both in kset_put() and error path of caller, if it is called in
>> kset_register().
>>
>> So make the function documentation more explicit about calling
>> kset_put() in the error path of caller.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   lib/kobject.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/lib/kobject.c b/lib/kobject.c
>> index a0b2dbfcfa23..6da04353d974 100644
>> --- a/lib/kobject.c
>> +++ b/lib/kobject.c
>> @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
>>   /**
>>    * kset_register() - Initialize and add a kset.
>>    * @k: kset.
>> + *
>> + * If this function returns an error, kset_put() must be called to
>> + * properly clean up the memory associated with the object.
>>    */
> And I'd continue the sentence, with " ... with the object,
> for instance the memory for the kset.kobj.name when kobj_set_name(&kset.kobj, format, ...)
> was called before calling kset_register()."
kobject_cleanup() not only frees name, but aslo calls ->release() to 
free another resources.
>
> This makes it clear what we want to make sure is freed, in case of an early error
> from kset_register().

How about like this:

If this function returns an error, kset_put() must be called to clean up the name of
kset object and other memory associated with the object.

>
> Regards,
> Luben
>
>>   int kset_register(struct kset *k)
>>   {
> .


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
