Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06101433F2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 10:04:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbKiH-0004sO-IH; Thu, 13 Jun 2019 08:04:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbKiG-0004s2-3f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 08:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sMnOiURV/i68t/cOj50w25XlwKA1jGH2HUnJw+rbpHI=; b=fXET6lefs97bIpcggr3RIs3aHe
 +7qa+wxvbYXwU0uYtiHGoKBuyu8gd+9L+aOOIb0UzBjd9xlFBS4p78/6Wq673BkmeYseL5TULuOG9
 xqPmK421boO5bXXdhWIgAkBKBYE/AQ9YMJ5ICVIVPjhQrjW6iQqNu33BA6YEBlm+SdOE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sMnOiURV/i68t/cOj50w25XlwKA1jGH2HUnJw+rbpHI=; b=QYJjhVEuaM/tUtyv2RmqxQHrkI
 +z4Fn2evlByGvlTvzjb8zeykQLA2iv/L/3slhEzVI8LmlfKsWY1qqsyMj6NUUtY6ljiXPNLkdyuEK
 37Zelswhl2fnR1/YpNBj1dtTN60QG+scb+NnDVMk8w2v2Nt0K43LwTU1Y/UVcygi+4E8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbKiF-00BF9C-0u
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 08:04:00 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6065A83989627B163AFF;
 Thu, 13 Jun 2019 16:03:51 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 13 Jun
 2019 16:03:48 +0800
To: Wang Shilong <wshilong@ddn.com>, Wang Shilong <wangshilong1991@gmail.com>, 
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
 <1559795545-17290-2-git-send-email-wshilong1991@gmail.com>
 <73fb9e88-d3f5-9420-d6d8-82ff4354e4d6@huawei.com>
 <MN2PR19MB3167496236BA4D366EAF5D36D4EF0@MN2PR19MB3167.namprd19.prod.outlook.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <110862e6-fd2a-b580-fec8-18a9b351ecb1@huawei.com>
Date: Thu, 13 Jun 2019 16:03:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <MN2PR19MB3167496236BA4D366EAF5D36D4EF0@MN2PR19MB3167.namprd19.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbKiF-00BF9C-0u
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue5aSNOiBbUEFUQ0ggMi8yXSBmMmZzOiBvbmx5?=
 =?utf-8?q?_set_project_inherit_bit_for_directory?=
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
Cc: Andreas Dilger <adilger@dilger.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/6/13 15:34, Wang Shilong wrote:
> Hi Chao,
> 
>  I just sent a V2, but I think we'd better do that when reading inode, for two reasons:
> 
> 1) not only F2FS_IOC_GETFLAGS need filter flags but also F2FS_IOC_FSGETXATTR need that, so the amended parts is not enough IMO.
> 
> 2) doing that by reading inode give a benefit that we could correct on disk flags for regular file next dirtying inode happen.

Hi Shilong, agreed, I'm okay with that change. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
