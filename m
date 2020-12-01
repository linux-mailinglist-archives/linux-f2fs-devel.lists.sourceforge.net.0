Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4282C99FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 09:56:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kk1Rz-0006i4-E3; Tue, 01 Dec 2020 08:55:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kk1Ru-0006hm-UJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 08:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLzTkatD7/o74isLMuRjBvPXdhS0+SUyildg8qtiewM=; b=TfrNPOxu+2MBn7ilSQlqgupkmr
 ULN1VFEp1N7AaLYlrSAlGxC2hjyf3PTANc6liqtmKuGH2Vb1weyljSUFvYIFqFTEsqATUxezUXEAE
 CWaYJZd+QvEzyEWD5NxqiN3Nv6EpeQs/CMAYWENRYI1D1GrHXuRQVqwwhELT7Roljfrk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sLzTkatD7/o74isLMuRjBvPXdhS0+SUyildg8qtiewM=; b=j/+JeB1Kqj0dFN1qCF3eE3WX7h
 M5QBnvcfEAArqRfjBNDzQG0XRZLCMDV/ulMV31esYnyMGM/09C7PVu4DqayRSWbfIuvrTG69o83j+
 Zd5j1UWaykLBGh7Dzw0eHbH8jGsQ+QDu9zp8TSgXaXrc8uBy9hCeC/yQjGkurwMCSSb4=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kk1Rp-00Dgf1-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 08:55:50 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ClbXG4vwQzhlLr;
 Tue,  1 Dec 2020 16:55:10 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 1 Dec 2020
 16:55:31 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@android.com>
References: <20201126022416.3068426-1-jaegeuk@kernel.org>
 <20201201040904.GA3858797@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <107bda4f-4fd7-2d9d-313a-f1d4bcbe13bd@huawei.com>
Date: Tue, 1 Dec 2020 16:55:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201201040904.GA3858797@google.com>
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
X-Headers-End: 1kk1Rp-00Dgf1-Gg
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: rename logical_to_blk and
 blk_to_logical
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/1 12:09, Jaegeuk Kim wrote:
> Forgot to add f2fs mailing list.
> 
> On 11/25, Jaegeuk Kim wrote:
>> This patch renames two functions like below having u64.
>>   - logical_to_blk to bytes_to_blks
>>   - blk_to_logical to blks_to_bytes
>>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
