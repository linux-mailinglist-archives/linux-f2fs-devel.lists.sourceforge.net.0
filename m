Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 763046073ED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 11:23:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oloFQ-00087Z-5i;
	Fri, 21 Oct 2022 09:23:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1oloFN-00087I-0y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C7/ITu/tSwA/pkRtZxTZtmHaJd1wHxoQN5FN0rMwaiw=; b=W5UBCKHxKYd7q1kchUE9G6IcHN
 Sr8HIsaqFzggFa400vDLiG1gqqZxu3yVVoGKDBBDoEjUlviUzySL4QOaqZsitGzn+YK6iYaU0Ge0s
 2bh9G06bIlwIAsz52lxwAdke/NSKucmFjCCrpcjrIP8EV7BirZO7p60X2sfS+Q5WIy0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C7/ITu/tSwA/pkRtZxTZtmHaJd1wHxoQN5FN0rMwaiw=; b=PlZVRZ4pwQiXMJtkwEasAsHBWY
 L761GUQ8cB9cuqRHkzfYcFzXEmqJ2xHBkaBgXCnQZY3hMebTL0oOdayjKoiVBC5VewUsy2tmWx2rZ
 Rn65796HiELo6/xwEspnAJPHj6Iv+Hc6EfENiwxuJz11PzfXMZbsFuk9OBJXiUlYbYP4=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oloFI-0007za-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:23:20 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MtzR01jchz15Lws;
 Fri, 21 Oct 2022 17:18:20 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:23:06 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:23:05 +0800
To: Luben Tuikov <luben.tuikov@amd.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <5efd73b0-d634-d34f-3d7a-13d674e40d04@amd.com> <Y1JV1wxf/7ERAMhl@kroah.com>
 <35e66c7c-ff25-efd3-cfbc-d06130687aa7@amd.com>
 <19689b9e-16d1-c6c5-4ee8-58885fbf8fb0@amd.com>
Message-ID: <e8e21756-c5b8-9098-8fb6-8e381bbf3dd1@huawei.com>
Date: Fri, 21 Oct 2022 17:23:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <19689b9e-16d1-c6c5-4ee8-58885fbf8fb0@amd.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 16:41,
 Luben Tuikov wrote: > On 2022-10-21 04:24, 
 Luben Tuikov wrote: >> On 2022-10-21 04:18, Greg KH wrote: >>> On Fri, Oct
 21, 2022 at 03:55:18AM -0400, Luben Tuikov wrote: >>>> On 202 [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oloFI-0007za-Nm
Subject: Re: [f2fs-dev] [PATCH 00/11] fix memory leak while kset_register()
 fails
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
Cc: rafael@kernel.org, qemu-devel@nongnu.org, richard@nod.at, somlo@cmu.edu,
 mst@redhat.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-f2fs-devel@lists.sourceforge.net, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, jlbec@evilplan.org,
 hsiangkao@linux.alibaba.com, alexander.deucher@amd.com, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-erofs@lists.ozlabs.org, mark@fasheh.com,
 ocfs2-devel@oss.oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2022/10/21 16:41, Luben Tuikov wrote:
> On 2022-10-21 04:24, Luben Tuikov wrote:
>> On 2022-10-21 04:18, Greg KH wrote:
>>> On Fri, Oct 21, 2022 at 03:55:18AM -0400, Luben Tuikov wrote:
>>>> On 2022-10-21 01:37, Greg KH wrote:
>>>>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
>>>>>> On 2022-10-20 22:20, Yang Yingliang wrote:
>>>>>>> The previous discussion link:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F0db486eb-6927-927e-3629-958f8f211194%40huawei.com%2FT%2F&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7Cd41da3fd6449492d01f808dab33cdb75%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019371236833115%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=C%2Bj1THkHpzVGks5eqB%2Fm%2FPAkMRohR7CYvRnOCqUqdcM%3D&amp;reserved=0
>>>>>> The very first discussion on this was here:
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg368077.html&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7Cd41da3fd6449492d01f808dab33cdb75%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019371236833115%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=pSR10abmK8nAMvKSezqWC0SPUBL4qEwtCCizyIKW7Dc%3D&amp;reserved=0
>>>>>>
>>>>>> Please use this link, and not the that one up there you which quoted above,
>>>>>> and whose commit description is taken verbatim from the this link.
>>>>>>
>>>>>>> kset_register() is currently used in some places without calling
>>>>>>> kset_put() in error path, because the callers think it should be
>>>>>>> kset internal thing to do, but the driver core can not know what
>>>>>>> caller doing with that memory at times. The memory could be freed
>>>>>>> both in kset_put() and error path of caller, if it is called in
>>>>>>> kset_register().
>>>>>> As I explained in the link above, the reason there's
>>>>>> a memory leak is that one cannot call kset_register() without
>>>>>> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
>>>>>> in this case, i.e. kset_register() fails with -EINVAL.
>>>>>>
>>>>>> Thus, the most common usage is something like this:
>>>>>>
>>>>>> 	kobj_set_name(&kset->kobj, format, ...);
>>>>>> 	kset->kobj.kset = parent_kset;
>>>>>> 	kset->kobj.ktype = ktype;
>>>>>> 	res = kset_register(kset);
>>>>>>
>>>>>> So, what is being leaked, is the memory allocated in kobj_set_name(),
>>>>>> by the common idiom shown above. This needs to be mentioned in
>>>>>> the documentation, at least, in case, in the future this is absolved
>>>>>> in kset_register() redesign, etc.
>>>>> Based on this, can kset_register() just clean up from itself when an
>>>>> error happens?  Ideally that would be the case, as the odds of a kset
>>>>> being embedded in a larger structure is probably slim, but we would have
>>>>> to search the tree to make sure.
>>>> Looking at kset_register(), we can add kset_put() in the error path,
>>>> when kobject_add_internal(&kset->kobj) fails.
>>>>
>>>> See the attached patch. It needs to be tested with the same error injection
>>>> as Yang has been doing.
>>>>
>>>> Now, struct kset is being embedded in larger structs--see amdgpu_discovery.c
>>>> starting at line 575. If you're on an AMD system, it gets you the tree
>>>> structure you'll see when you run "tree /sys/class/drm/card0/device/ip_discovery/".
>>>> That shouldn't be a problem though.
>>> Yes, that shouldn't be an issue as the kobject embedded in a kset is
>>> ONLY for that kset itself, the kset structure should not be controling
>>> the lifespan of the object it is embedded in, right?
>> Yes, and it doesn't. It only does a kobject_get(parent) and kobject_put(parent).
>> So that's fine and natural.
>>
>> Yang, do you want to try the patch in my previous email in this thread, since you've
>> got the error injection set up already?
> I spoke too soon. I believe you're onto something, because looking at the idiom:
>
> 	kobj_set_name(&kset->kobj, format, ...);
> 	kset->kobj.kset = parent_kset;
> 	kset->kobj.ktype = ktype;
> 	res = kset_register(kset);
>
> The ktype defines a release method, which frees the larger struct the kset is embedded in.
> And this would result in double free, for instance in the amdgpu_discovery.c code, if
> kset_put() is called after kset_register() fails, since we kzalloc the larger object
> just before and kfree it on error just after. Ideally, we'd only "revert" the actions
> done by kobj_set_name(), as there's some error recovery on create_dir() in kobject_add_internal().
>
> So, we cannot do this business with the kset_put() on error from kset_register(), after all.
> Not sure how this wasn't caught in Yang's testing--the kernel should've complained.
I have already tried the change that in your posted patch when I was 
debugging this issue
before sent these fixes, because it may lead double free in some cases, 
and I had mentioned
it in this mail:

https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T/#m68eade1993859dfc6c3d14d35f988d35a32ef837

Thanks,
Yang
>
> Regards,
> Luben
>
> .


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
