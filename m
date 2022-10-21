Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DF7607104
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 09:26:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olmQG-0005V4-Pj;
	Fri, 21 Oct 2022 07:26:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olmQ6-0005Us-C0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 07:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JQluvds8xOLIlfimsEnEw6zA5CGTTtIL1qDb7SHY87g=; b=evwoLLe+vqNmc8l7fSRsh2TWVn
 6YMcMTJZCc/0snoykKYKgXmr90q4CTnU+fL+TZ5cdrr9BYncWCl6h4CQszw/plKAgjBmtUfUW8QdM
 3Zt2lG+rNaiTZdwsfKrdHXUvldHHyeruxQ0FPwsTkQbqMCIwTv/7wagmXMhATjmrO8xM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JQluvds8xOLIlfimsEnEw6zA5CGTTtIL1qDb7SHY87g=; b=e6mks9PnqxTA0KqecAVxquNCzL
 ITsRl+tv+utbMEiHxDnOPUJaxwXkM+zCchN2w0IwUMrjMbvog/jJo3VC3d+CDoC+wTMGOSrrLMfpG
 iRCROrVIIricgJcHCmwqEK1XrAh/K7T/8EIxK2DhzliqPUofRwmXJNj7WEwltFJ+F7Sc=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olmQ1-00Bsy5-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 07:26:18 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mtwr34fC2zVj5k;
 Fri, 21 Oct 2022 15:21:23 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 15:25:54 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 15:25:53 +0800
To: Luben Tuikov <luben.tuikov@amd.com>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-erofs@lists.ozlabs.org>, <ocfs2-devel@oss.oracle.com>,
 <linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com>
Message-ID: <2a99c52c-d29c-5f5c-57a8-9851018e7420@huawei.com>
Date: Fri, 21 Oct 2022 15:25:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com>
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
 Content preview:  Hi, On 2022/10/21 13:29, Luben Tuikov wrote: > On 2022-10-20
 22:20, Yang Yingliang wrote: >> The previous discussion link: >>
 https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T
 [...] Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olmQ1-00Bsy5-P1
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
Cc: alexander.deucher@amd.com, richard@nod.at, mst@redhat.com,
 gregkh@linuxfoundation.org, somlo@cmu.edu, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org, hsiangkao@linux.alibaba.com,
 rafael@kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 mark@fasheh.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 2022/10/21 13:29, Luben Tuikov wrote:
> On 2022-10-20 22:20, Yang Yingliang wrote:
>> The previous discussion link:
>> https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T/
> The very first discussion on this was here:
>
> https://www.spinics.net/lists/dri-devel/msg368077.html
>
> Please use this link, and not the that one up there you which quoted above,
> and whose commit description is taken verbatim from the this link.
I found this leaks in 
bus_register()/class_register()/kset_create_and_add() at first, and describe
the reason in these patches which is using kobject_set_name() 
description, here is the patches:

https://lore.kernel.org/lkml/20221017014957.156645-1-yangyingliang@huawei.com/T/
https://lore.kernel.org/lkml/20221017031335.1845383-1-yangyingliang@huawei.com/
https://lore.kernel.org/lkml/Y0zfPKAgQSrYZg5o@kroah.com/T/

And then I found other subsystem also have this problem, so posted the 
fix patches for them
(including qemu_fw_cfg/f2fs/erofs/ocfs2/amdgpu_discovery):

https://www.mail-archive.com/qemu-devel@nongnu.org/msg915553.html
https://lore.kernel.org/linux-f2fs-devel/7908686b-9a7c-b754-d312-d689fc28366e@kernel.org/T/#t
https://lore.kernel.org/linux-erofs/20221018073947.693206-1-yangyingliang@huawei.com/
https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T/

https://www.spinics.net/lists/dri-devel/msg368092.html
In the amdgpu_discovery patch, I sent a old one which using wrong 
description and you pointer out,
and then I send a v2.

And then the maintainer of ocfs2 has different thought about this, so we 
had a discussion in the link
that I gave out, and Greg suggested me to update kset_register() 
documentation and then put the fix
patches together in one series, so I sent this patchset and use the link.

Thanks,
Yang

>
>> kset_register() is currently used in some places without calling
>> kset_put() in error path, because the callers think it should be
>> kset internal thing to do, but the driver core can not know what
>> caller doing with that memory at times. The memory could be freed
>> both in kset_put() and error path of caller, if it is called in
>> kset_register().
> As I explained in the link above, the reason there's
> a memory leak is that one cannot call kset_register() without
> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
> in this case, i.e. kset_register() fails with -EINVAL.
>
> Thus, the most common usage is something like this:
>
> 	kobj_set_name(&kset->kobj, format, ...);
> 	kset->kobj.kset = parent_kset;
> 	kset->kobj.ktype = ktype;
> 	res = kset_register(kset);
>
> So, what is being leaked, is the memory allocated in kobj_set_name(),
> by the common idiom shown above. This needs to be mentioned in
> the documentation, at least, in case, in the future this is absolved
> in kset_register() redesign, etc.
>
> Regards,
> Luben
>
>> So make the function documentation more explicit about calling
>> kset_put() in the error path of caller first, so that people
>> have a chance to know what to do here, then fixes this leaks
>> by calling kset_put() from callers.
>>
>> Liu Shixin (1):
>>    ubifs: Fix memory leak in ubifs_sysfs_init()
>>
>> Yang Yingliang (10):
>>    kset: fix documentation for kset_register()
>>    kset: add null pointer check in kset_put()
>>    bus: fix possible memory leak in bus_register()
>>    kobject: fix possible memory leak in kset_create_and_add()
>>    class: fix possible memory leak in __class_register()
>>    firmware: qemu_fw_cfg: fix possible memory leak in
>>      fw_cfg_build_symlink()
>>    f2fs: fix possible memory leak in f2fs_init_sysfs()
>>    erofs: fix possible memory leak in erofs_init_sysfs()
>>    ocfs2: possible memory leak in mlog_sys_init()
>>    drm/amdgpu/discovery: fix possible memory leak
>>
>>   drivers/base/bus.c                            | 4 +++-
>>   drivers/base/class.c                          | 6 ++++++
>>   drivers/firmware/qemu_fw_cfg.c                | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
>>   fs/erofs/sysfs.c                              | 4 +++-
>>   fs/f2fs/sysfs.c                               | 4 +++-
>>   fs/ocfs2/cluster/masklog.c                    | 7 ++++++-
>>   fs/ubifs/sysfs.c                              | 2 ++
>>   include/linux/kobject.h                       | 3 ++-
>>   lib/kobject.c                                 | 5 ++++-
>>   10 files changed, 33 insertions(+), 9 deletions(-)
>>
> .


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
