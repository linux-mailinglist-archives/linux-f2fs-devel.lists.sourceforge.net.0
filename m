Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0795EFD5C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 13:38:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRy6k-00051G-EI; Tue, 05 Nov 2019 12:38:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRy6i-000518-5f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SL2nXvuOdWwR91x7wNSCPdDugtYS1KzZnYr90AgfTEw=; b=JUtoMNbZU7uCoDoOzs4h0h/DCZ
 jlCVbpnDR0sSgK9GvMviMsHl4QNkLXwhDDDOdyiYvtnL7Zv0OZYWE95WWoCUpEEZJBHMvA5aK0Rkx
 e163uTMNPgiQoJhIzGw63FDWSIX5gv4HsQMxCColN1ET++wZPIq1d2gPsxPkeVKwNIJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SL2nXvuOdWwR91x7wNSCPdDugtYS1KzZnYr90AgfTEw=; b=AM6MlgEQx8hRI6/Dujp6u8OPFh
 y8mtmN0IaGhX1Gf6c+enq9CjjIWISBfL5v4T5L10wO9qEgABaA1X5i+k3AaoBnl6B47zIWuDmZGlO
 VsCNT5uFhlML5Nxjlfu8YPBe63T1oPRqvbKVuv5jGQOqFZ0RffcYOmazJfK3G2zKLM8U=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRy6g-000pbs-Cz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 12:38:48 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 647CA64E02946AEBC6F4;
 Tue,  5 Nov 2019 20:38:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 20:38:35 +0800
To: Robin Hsu <robinhsu@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20191029074659.165884-1-robinhsu@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4241b45c-1af4-5196-649d-c0132e64cb20@huawei.com>
Date: Tue, 5 Nov 2019 20:38:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191029074659.165884-1-robinhsu@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRy6g-000pbs-Cz
Subject: Re: [f2fs-dev] [PATCH 0/2] f2fs-tools: Introduce cache to speed up
 fsck
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Robin,

Could you explain what is the basic idea for this user-space cache?

Thanks,

On 2019/10/29 15:46, Robin Hsu wrote:
> Implemented cache and related command line options.
> 
> Robin Hsu (2):
>   libf2fs_io: Add user-space cache
>   fsck.f2fs: Enable user-space cache
> 
>  fsck/main.c       |  27 +++-
>  include/f2fs_fs.h |  20 +++
>  lib/libf2fs_io.c  | 317 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 362 insertions(+), 2 deletions(-)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
