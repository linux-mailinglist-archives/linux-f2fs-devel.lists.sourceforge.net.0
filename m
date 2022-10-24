Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D460AE9D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 17:10:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1omz5m-0003RM-FH;
	Mon, 24 Oct 2022 15:10:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1omz5j-0003RF-8u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 15:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udyUzm35RI/f0W3jtWSfwrk7u0Q87rqFbmMiG41Kfcc=; b=h5cnVq8G05yI/NDz7aNpov0r3F
 5SmXRLqqeR61BOyJUFTSLRcO9RigQQIaFGS3OGF50XZfhOab1iqffXocon9/M2c/BTXpQQm+rLBet
 8aHflX00GWoUzhDADB9hlif9xBBtQhw3Eq7zI5lRDwbXCOACa/4JondCuD57F7tOUmIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=udyUzm35RI/f0W3jtWSfwrk7u0Q87rqFbmMiG41Kfcc=; b=RbOlBaChj1SWKIioZvkCFPcs1y
 tEm/MzTnQH+TKHjqe9LunRphRGuDAEhT4MSWj3zSkSVpEcnUx704n5n48wXVNoSMr8fc/HOiBNYJU
 1s6LziDgJ5UchIJ0JOjg7eGoygYv7N2MQuDRAUsWpu/ZUuv1rnrSOGlfsNDa/dQD+J50=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1omz5h-00FqtN-0N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 15:10:15 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mwyzq5YM5z15M0P;
 Mon, 24 Oct 2022 23:05:11 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 23:10:02 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 23:10:01 +0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
 <Y1aYuLmlXBRvMP1Z@kroah.com>
 <8281fc72-948a-162d-6e5f-a9fe29d8ee46@huawei.com>
 <Y1am4mjS+obAbUTJ@kroah.com>
Message-ID: <87e4e75b-a26e-6b4b-4799-c56c0b8891c0@huawei.com>
Date: Mon, 24 Oct 2022 23:10:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1am4mjS+obAbUTJ@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/24 22:53, Greg KH wrote: > On Mon, Oct 24, 2022
 at 10:39:44PM +0800, Yang Yingliang wrote: >> On 2022/10/24 21:52, Greg KH
 wrote: >>> On Mon, Oct 24, 2022 at 08:19:10PM +0800, Yang Yinglian [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1omz5h-00FqtN-0N
Subject: Re: [f2fs-dev] [PATCH v2] kset: fix memory leak when
 kset_register() returns error
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
Cc: rafael@kernel.org, qemu-devel@nongnu.org, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, richard@nod.at,
 mark@fasheh.com, mst@redhat.com, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, yangyingliang@huawei.com, hsiangkao@linux.alibaba.com,
 somlo@cmu.edu, jlbec@evilplan.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2022/10/24 22:53, Greg KH wrote:
> On Mon, Oct 24, 2022 at 10:39:44PM +0800, Yang Yingliang wrote:
>> On 2022/10/24 21:52, Greg KH wrote:
>>> On Mon, Oct 24, 2022 at 08:19:10PM +0800, Yang Yingliang wrote:
>>>> Inject fault while loading module, kset_register() may fail.
>>>> If it fails, the name allocated by kobject_set_name() which
>>>> is called before kset_register() is leaked, because refcount
>>>> of kobject is hold in kset_init().
>>>>
>>>> As a kset may be embedded in a larger structure which needs
>>>> be freed in release() function or error path in callers, we
>>>> can not call kset_put() in kset_register(), or it will cause
>>>> double free, so just call kfree_const() to free the name and
>>>> set it to NULL.
>>>>
>>>> With this fix, the callers don't need to care about the name
>>>> freeing and call an extra kset_put() if kset_register() fails.
>>>>
>>>> Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
>>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>>> ---
>>>> v1 -> v2:
>>>>     Free name inside of kset_register() instead of calling kset_put()
>>>>     in drivers.
>>>> ---
>>>>    lib/kobject.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/lib/kobject.c b/lib/kobject.c
>>>> index a0b2dbfcfa23..3409a89c81e5 100644
>>>> --- a/lib/kobject.c
>>>> +++ b/lib/kobject.c
>>>> @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
>>>>    /**
>>>>     * kset_register() - Initialize and add a kset.
>>>>     * @k: kset.
>>>> + *
>>>> + * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
>>>> + * which is called before kset_register() in caller need be freed.
>>> This comment doesn't make any sense anymore.  No caller needs to worry
>>> about this, right?
>> With this fix, the name is freed inside of kset_register(), it can not be
>> accessed,
> Agreed.
>
>> if it allocated dynamically, but callers don't know this if no comment here,
>> they may use it in error path (something like to print error message with
>> it),
>> so how about comment like this to tell callers not to use the name:
>>
>> NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
>> is freed, it can not be used any more.
> Sure, that's a better way to word it.
>
>>>>     */
>>>>    int kset_register(struct kset *k)
>>>>    {
>>>> @@ -844,8 +847,11 @@ int kset_register(struct kset *k)
>>>>    	kset_init(k);
>>>>    	err = kobject_add_internal(&k->kobj);
>>>> -	if (err)
>>>> +	if (err) {
>>>> +		kfree_const(k->kobj.name);
>>>> +		k->kobj.name = NULL;
>>> Why are you setting the name here to NULL?
>> I set it to NULL to avoid accessing bad pointer in callers,
>> if callers use it in error path, current callers won't use this
>> name pointer in error path, so we can remove this assignment?
> Ah, I didn't think about using it on error paths.  Ideally that would
> never happen, but that's good to set just to make it obvious.  How about
> adding a small comment here saying why you are setting it so we all
> remember it in 5 years when we look at the code again.
OK, I can add it in v3.

Thanks,
Yang
>
> thanks,
>
> greg k-h
> .


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
