Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9635B7C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Apr 2021 02:31:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lVkUX-0003CA-Qi; Mon, 12 Apr 2021 00:31:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1lVkUV-0003Bs-VS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Apr 2021 00:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kbDOJ3AufrFDobAJ5UKR1ZSiXJr+O3U0ibIVDVE+tQI=; b=hYUeiF3CifJX6gH53oFnF96MpJ
 ynGdIRCMEXGGsICz4xFqJvMdRTO3E/gnYDUf10OEQg2BLF9RFAhBzCkaAIO1aEZGX8i6Us2k18M2c
 AVfyhR0hBBFUYCoEE8eS0FXysio5IqZU/n+PTn9BugFM47urKdCBKj+FUzhP26TUbpWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kbDOJ3AufrFDobAJ5UKR1ZSiXJr+O3U0ibIVDVE+tQI=; b=lt7RU2PyfjOHDtBNBv+NhUAZv5
 RCqio3tVjgPEuMp/SaHRZvSccj5EeBSWnruDKjbcKmHmho/6Rbe+LWN0mRbrbU0x3MpMnygA+V1pI
 JbFumdzoDDkR3Ez1vSBvfsSfRHoaHmdpaKcV+d//2bASLz5VKYVNrpMgLxLF9KgCYs2A=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lVkUL-0000i0-Ld
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Apr 2021 00:31:47 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FJV3X218Kz9yYF;
 Mon, 12 Apr 2021 08:29:12 +0800 (CST)
Received: from [10.174.177.53] (10.174.177.53) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 08:31:16 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20210409034033.40937-1-jack.qiu@huawei.com>
 <5f6cd575-00e5-a830-470a-67654f0d2149@huawei.com>
 <YHBJ85/am9r6MjXm@google.com> <YHHjuiN+ASfV5RSN@google.com>
From: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <2ed5f485-23ce-9b7b-f3b7-d7464b80b36b@huawei.com>
Date: Mon, 12 Apr 2021 08:31:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <YHHjuiN+ASfV5RSN@google.com>
X-Originating-IP: [10.174.177.53]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lVkUL-0000i0-Ld
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix missing a blank line after
 declarations
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
Cc: zhuangyi1@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/11 1:43, Jaegeuk Kim wrote:
> 
> Like this?
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=5f029c045c948b6cb8ccfda614e73240c4a8363b
> 
Looks good to me, please go ahead. Thanks!



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
