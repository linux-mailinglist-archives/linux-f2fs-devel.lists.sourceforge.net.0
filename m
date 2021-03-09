Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A76013321D8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Mar 2021 10:22:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJYZd-0007Bd-3g; Tue, 09 Mar 2021 09:22:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lJYZb-0007BO-7l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 09:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Sdqj1CKiQxyk4whKqxWOPeGOC8weKmKa7JHlYP4P/U=; b=ljlNq0X8+Qssh/WL23Ff/BE1/F
 Tjusqi8xz39E3E5fmcYes5lKJvbvYcVHrg8+j3j/7cZDCn9pqp0H/vvaOUML+QbdiQ67V+LDwwMsp
 3P7Tw6pjy5etE72jsALZY+WmyfKZpRGHfMwg6aS7BNI61Y6ndlsAv5HcVUo6on59KN3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Sdqj1CKiQxyk4whKqxWOPeGOC8weKmKa7JHlYP4P/U=; b=X1iGe2Nl5QYz/vJVE7Go4zRXZz
 O7Mx3fWjc+KXSI6c98FC9Bwi/5WcQWXtjDLvtsoDvg9P54ZrRz40nb7MJwxrEnuLFFlrCBFIVmcDi
 LrWVxStlebm/nL2OXetfOyfxUHaFEvMjQ29UJ9a6cpqftd73Q4al3KHH8+Lo347xoeDg=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lJYZX-0007xv-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 09:22:38 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DvqSp2rtgzkWPM;
 Tue,  9 Mar 2021 17:20:58 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 9 Mar 2021
 17:22:19 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210305022402.2721974-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2f2abc41-24d5-6795-44fe-b770ed8514df@huawei.com>
Date: Tue, 9 Mar 2021 17:22:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210305022402.2721974-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lJYZX-0007xv-Ty
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add sysfs nodes to get accumulated
 compression info
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/5 10:24, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added acc_compr_inodes to show accumulated compressed inode count and
> acc_compr_blocks to show accumulated secured block count with

I noticed that these stat numbers are recorded in extra reserved area in
hot node curseg journal, the journal will be persisted only for umount
or fastboot checkpoint, so the numbers are not so accurate... does this
satisfy your requirement?

> compression in sysfs. These can be re-initialized to "0" by writing "0"
> value in one of both.

Why do we allow reset the stat numbers?

Why not covering all code with macro CONFIG_F2FS_FS_COMPRESSION, since these
numbers are only be updated when we enable compression.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
