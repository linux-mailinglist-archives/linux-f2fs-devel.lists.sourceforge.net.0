Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A792ACABB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 02:54:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcIrW-0002z2-Uo; Tue, 10 Nov 2020 01:54:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kcIrV-0002yt-GZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 01:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3dfUIVMqSxEwqx/2r70v/pd6g98fa/lB4pO50c/jvK8=; b=TOeYnKfqjc/SOE5DEydH0LWi92
 dKlQWkApbsLKZbUOm62tvQs3/dZJt/Kq2Mm/0rcX31uv+Amp8tbwIMbQLHt8sVDsn5Vd5gcdkQKaV
 cOjozlhh9oBFHYkfh7VrWtZRzDQgH0X4qsGRUh7FB1q9CMBA8N9TtizW55ITpRAmFfK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3dfUIVMqSxEwqx/2r70v/pd6g98fa/lB4pO50c/jvK8=; b=Tyz8l1QNRB6Cb+AI1E51HvY+6u
 6sSM0gnu2oe2uFjLslFKSqgLFaggvAdB9FGODj4lAZTMfxvospUWpv469I76M4hbo2IoTs3PYsiLs
 /+NH+bbbiez5/ki0d572JCej+O0Lh6VkD+2nYeKC8e74Y0WmwFlO+2AiEDAfl/accy54=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcIrQ-00ExXR-O7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 01:54:21 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVWB14tvvzhjvx;
 Tue, 10 Nov 2020 09:54:01 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 10 Nov
 2020 09:54:08 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201106065331.76236-1-yuchao0@huawei.com>
 <20201106180324.GA78548@sol.localdomain>
 <a7e78b61-021a-444d-eb36-68ce7aae133e@kernel.org>
 <20201107171635.GA841@sol.localdomain>
 <63efaa5c-bc19-4b16-653d-840bc6a6d9d1@huawei.com>
 <20201109181204.GA1232946@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f5ce8331-3297-7e38-42a0-0a6c73c30ff2@huawei.com>
Date: Tue, 10 Nov 2020 09:54:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201109181204.GA1232946@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kcIrQ-00ExXR-O7
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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

On 2020/11/10 2:12, Eric Biggers wrote:
> On Mon, Nov 09, 2020 at 10:29:25AM +0800, Chao Yu wrote:
>>> Oh I see, the cp-related checks are at the beginning of f2fs_ioctl() too.
>>>
>>> In that case a much better approach would be to add __f2fs_ioctl() which is
>>> called by f2fs_ioctl() and f2fs_compat_ioctl(), and have f2fs_ioctl() and
>>> f2fs_compat_ioctl() do the cp-related checks but not __f2fs_ioctl().
>>
>> Will this cleanup make sense to you?
> 
> I think it would be better to do it the way I suggested.

Updated in v5.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
