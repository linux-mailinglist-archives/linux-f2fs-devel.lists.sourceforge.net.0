Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C625737F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 08:07:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCcy5-0006DE-Ct; Mon, 31 Aug 2020 06:07:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kCcy3-0006D5-R5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 06:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8gICr5+ZNSDDhJMH/VG4+pq3wQaTEDFkrbK4hvvkzY=; b=JnR736Ejy3LpEd6qYs4eVEyg4s
 r5u7fdBdHRPAT+IKGqWo+BEKSfQH4F+D1NXY1jIJ4BLoU7Ch+twlbK0WU03+wcxJayqx9BOzoak8R
 tJNYRbqk4eKLQf9XXtnCJCmyM5w2lMwOkt9q92k6XtIKhijuuatNtNBWpNXoFVkZANHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8gICr5+ZNSDDhJMH/VG4+pq3wQaTEDFkrbK4hvvkzY=; b=KLRu8Ob7naAJG/5pmJbJdhaJtq
 mXxHYVVcFWszw7fj6xG5GL/cvxBvM8AYTM5MM6sA3UC9yrj/ZKD2wUeSN19wIm3h4uybcWlBveixL
 rK5oGUQQ9j8aTQkmadjUhbkhobmoxJJIsQqVo8HrXZNe8osSImMYhH3Vzr3hpHtZxg8Q=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCcy1-006BEU-3y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 06:06:59 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3C9F8B21441495282C45;
 Mon, 31 Aug 2020 14:06:48 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 31 Aug
 2020 14:06:46 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200828054629.583577-1-daeho43@gmail.com>
 <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
 <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
 <bd1a8ffa-83ff-b774-9bed-ed68025d0c7a@huawei.com>
 <CACOAw_y=O35_SFxdfsVER4+a+n-eE6f48NXF6CsAnj=Ms-dgkA@mail.gmail.com>
 <c4f58675-9df5-e3af-45fc-6fa924e3ee68@huawei.com>
 <CACOAw_wZFAyyt8qPCFd-LQKpMGa1moyOqSBpUnaeM0z2Y5Z+cA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <78ffaf17-56a0-32bd-0bcf-212333b52f06@huawei.com>
Date: Mon, 31 Aug 2020 14:06:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_wZFAyyt8qPCFd-LQKpMGa1moyOqSBpUnaeM0z2Y5Z+cA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCcy1-006BEU-3y
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent compressed file from being
 disabled after releasing cblocks
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/31 11:55, Daeho Jeong wrote:
>> - open(O_RDWR)
>> - ioctl(FS_IOC_SETFLAGS, F2FS_COMPR_FL)
>> - write()
>> - ioctl(RELEASE_COMPRESS_BLOCKS) -- inode is immutable now
>> - ioctl(FS_IOC_SETFLAGS, ~F2FS_COMPR_FL) -- Should we allow to update immutable inode?
>> as we know, normally, immutable inode should deny open(O_WRONLY or O_RDWR) and later update.
>>
> 
> For this case, with this patch we'll return -EINVAL for
> ioctl(FS_IOC_SETFLAGS, ~F2FS_COMPR_FL).
> I thought RESERVE_COMPRESS_BLOCKS ioctl is always required to get the
> file to normal mode after RELEASE_COMPRESS_BLOCKS is called.

That's an example, after compressed block release, shouldn't we disallow other ioctl
interface which updates immutable inode?

> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
