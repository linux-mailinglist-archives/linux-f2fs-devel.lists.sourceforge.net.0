Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DBE306B3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 03:50:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4xO8-0004io-7W; Thu, 28 Jan 2021 02:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l4xO6-0004ie-Pk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 02:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QT/2Ro20jZBkjgZNJFb9iHxV+HdXYUPk41iN89mwV6Q=; b=DMAUV9QPUAa8arZhpLLHJpUHcC
 HTHQFBAhiNwDwvAgK0H2rsQmyl51NwfGGeWhcDOlgVnZc3sXsWMmxaCmPyYPB6wAHgwJ4xXWR4aDk
 I9G3j5OwRXf4OAr9VVGGmCXW2sh92FKHEXwoeCOGoWwnIWVZa3wAHDQ1j2XOV70F9iks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QT/2Ro20jZBkjgZNJFb9iHxV+HdXYUPk41iN89mwV6Q=; b=A62zM6tHKDgXGs+v8Fgr5qr614
 4D6zpQzbKbndv95vKYCHNpbAlXQrqUNyeqqcBvstBohaD8afuAwEh1dtpjiz6P4/QO48Sb4+Ll/9+
 VJH4M9Zn5HH00LN7Q6FXG+4B+3cU+lXxb9UFTNWYqSs5n/Tg/X15eNivPCXwQwMMTPIY=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l4xNy-0002gh-JN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 02:50:26 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DR4fV0jsKzMR49;
 Thu, 28 Jan 2021 10:48:34 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 28 Jan
 2021 10:50:05 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <X/0DxG+AcX54730W@google.com>
 <160f2cf9-73ca-18cd-6ad0-2498821b8db6@huawei.com>
 <X/4kYf11oyoMY8P+@google.com>
 <abc09f9f-561d-df8a-b835-6b5d7a15232c@huawei.com>
 <X/8UtJU9Dy30kC7I@google.com>
 <37ba41db-2589-e155-c416-d0c8832026cb@huawei.com>
 <X//DPI10+ZXvHkYH@google.com>
 <8e88b1e2-0176-9487-b925-9c7a31a7e5cd@huawei.com>
 <YAGt0i244dWXym4H@google.com>
 <20a1dbd3-808e-e62a-53f3-7f1e2a316b3c@kernel.org>
 <YAdSTzYF8Hvxdcqy@google.com>
 <068da0d3-18c9-53f7-0f24-63b07e1af272@huawei.com>
Message-ID: <9b982458-57e1-a04d-c5d4-f5ca775af1e7@huawei.com>
Date: Thu, 28 Jan 2021 10:50:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <068da0d3-18c9-53f7-0f24-63b07e1af272@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l4xNy-0002gh-JN
Subject: Re: [f2fs-dev] [PATCH v3 1/5] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/22 10:17, Chao Yu wrote:
>> No, it seems this is not the case.
> Oops, could you please help to remove all below codes and do the test again
> to check whether they are the buggy codes? as I doubt there is use-after-free
> bug.

Any test result? :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
