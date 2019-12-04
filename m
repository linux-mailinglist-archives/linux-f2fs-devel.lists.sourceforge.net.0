Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 540EB112105
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 02:28:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icJSU-0007bZ-U1; Wed, 04 Dec 2019 01:28:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1icJST-0007bR-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 01:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIC6adU4O8MMU/MusJT5J2S09xXqRL9C9yOLIKjn1CY=; b=UY3Ala5tuR4EENPnbnF2MvNjW1
 PxJJBjfeLnTEiBqVKTmZIACfcU6u7R+ZQ+SSrqYXQodNjt0TliH3Q4Garg37FuC707SoYrtzYMD8h
 4jV3i4E5FoMaeRW6gGG932dj+af4liPg0WcdrYG3694SA6eh+7m9UCHBwzHQdik9pZN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dIC6adU4O8MMU/MusJT5J2S09xXqRL9C9yOLIKjn1CY=; b=AqLSoCh5iY2rLbejLFpIPQY3n3
 LPHfoQR9IDVBzGxDfxxeIF/kVkY0UFG5bFkdIZABNC6+rFCFch+QHLQhd8sEhNLhMwWokOvGlQxfL
 p8qfkeEYgVkl/ES3KeamKccJM5YBc1g1/UqBUkppBaakpP7Y8asr2Sw9IIrqwrBYkrik=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icJSR-006R0F-SK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 01:28:01 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 056399E0601D957A6116;
 Wed,  4 Dec 2019 09:27:47 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 4 Dec 2019
 09:27:44 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
 <20191203173308.GA41093@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4eb6db72-8667-7306-e989-36b5d79289d0@huawei.com>
Date: Wed, 4 Dec 2019 09:27:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191203173308.GA41093@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1icJSR-006R0F-SK
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Fix direct IO handling
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
Cc: linux-fsdevel@vger.kernel.org, Javier Gonzalez <javier@javigon.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/12/4 1:33, Jaegeuk Kim wrote:
> Thank you for checking the patch.
> I found some regressions in xfstests, so want to follow the Damien's one
> like below.
> 
> Thanks,
> 
> ===
>>From 9df6f09e3a09ed804aba4b56ff7cd9524c002e69 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Tue, 26 Nov 2019 15:01:42 -0800
> Subject: [PATCH] f2fs: preallocate DIO blocks when forcing buffered_io
> 
> The previous preallocation and DIO decision like below.
> 
>                          allow_outplace_dio              !allow_outplace_dio
> f2fs_force_buffered_io   (*) No_Prealloc / Buffered_IO   Prealloc / Buffered_IO
> !f2fs_force_buffered_io  No_Prealloc / DIO               Prealloc / DIO
> 
> But, Javier reported Case (*) where zoned device bypassed preallocation but
> fell back to buffered writes in f2fs_direct_IO(), resulting in stale data
> being read.
> 
> In order to fix the issue, actually we need to preallocate blocks whenever
> we fall back to buffered IO like this. No change is made in the other cases.
> 
>                          allow_outplace_dio              !allow_outplace_dio
> f2fs_force_buffered_io   (*) Prealloc / Buffered_IO      Prealloc / Buffered_IO
> !f2fs_force_buffered_io  No_Prealloc / DIO               Prealloc / DIO
> 
> Reported-and-tested-by: Javier Gonzalez <javier@javigon.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
