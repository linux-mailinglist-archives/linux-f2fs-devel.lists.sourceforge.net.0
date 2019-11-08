Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDAAF3E2F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 03:47:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSuIn-0008J8-TC; Fri, 08 Nov 2019 02:47:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iSuIm-0008Iv-IG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 02:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:CC:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cDAdIte7ThtD05GaApqU80mj6y6UCPSyzDBEeBR/e38=; b=iGf3JJI8dRRF8SV1yYVOhwUdFB
 0bPCRHh73622DCVMpLzFsdY0g4oF5LJ8OB2Q/kCJFPVlvfat5HjJKeOUTlViL2BavhROSvBQBDNt6
 AgF06EaEHOwxaFswhsEQg2vhWkf/tqK8Ap5ofNwfsgUs7brx/IXmAIcZDVlGYggyX+VI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:CC:From:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cDAdIte7ThtD05GaApqU80mj6y6UCPSyzDBEeBR/e38=; b=aSW31ZeQX0BPWovo+drY1BMrWZ
 ksjV8opv0nz6SsJmu3SpAHDN3ua9VNhTly5GF40/ZYSr+TpBc+QDFuX6qOQNCY5h/k+j6QwbIFP91
 hN7DCKkRSboeR4k4a66Ij0O2h+Phkd5ogNqSNYZQUJLhpQofewNpHI5u1M66Rdw7ecyM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSuIk-004SnT-Ak
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 02:47:08 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4CC2D19B8089BAC1E34C;
 Fri,  8 Nov 2019 10:46:57 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 10:46:53 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20191107061205.120972-1-yuchao0@huawei.com>
 <20191107170519.GA766@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <77ee5340-c9f5-d26e-16c5-5d471f0e78c1@huawei.com>
Date: Fri, 8 Nov 2019 10:46:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191107170519.GA766@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSuIk-004SnT-Ak
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to update dir's i_pino during
 cross_rename
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/8 1:05, Eric Biggers wrote:
> On Thu, Nov 07, 2019 at 02:12:05PM +0800, Chao Yu wrote:
>> As Eric reported:
>>
>> RENAME_EXCHANGE support was just added to fsstress in xfstests:
>>
>> 	commit 65dfd40a97b6bbbd2a22538977bab355c5bc0f06
>> 	Author: kaixuxia <xiakaixu1987@gmail.com>
>> 	Date:   Thu Oct 31 14:41:48 2019 +0800
>>
>> 	    fsstress: add EXCHANGE renameat2 support
>>
>> This is causing xfstest generic/579 to fail due to fsck.f2fs reporting errors.
>> I'm not sure what the problem is, but it still happens even with all the
>> fs-verity stuff in the test commented out, so that the test just runs fsstress.
>>
>> generic/579 23s ... 	[10:02:25]
>> [    7.745370] run fstests generic/579 at 2019-11-04 10:02:25
>> _check_generic_filesystem: filesystem on /dev/vdc is inconsistent
>> (see /results/f2fs/results-default/generic/579.full for details)
>>  [10:02:47]
>> Ran: generic/579
>> Failures: generic/579
>> Failed 1 of 1 tests
>> Xunit report: /results/f2fs/results-default/result.xml
>>
>> Here's the contents of 579.full:
>>
>> _check_generic_filesystem: filesystem on /dev/vdc is inconsistent
>> *** fsck.f2fs output ***
>> [ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0xd10]
>>
>> The root cause is that we forgot to update directory's i_pino during
>> cross_rename, fix it.
>>
>> Fixes: 32f9bc25cbda0 ("f2fs: support ->rename2()")
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> 
> Tested-by: Eric Biggers <ebiggers@kernel.org>

Thanks for the test.

> 
> The i_pino field is only valid on directories, right?

i_pino is also valid on regular inode, because after sudden power-cut case, we
will recover fsynced file and link it into parent directory which i_pino field
points.

For rename/cross_rename cases, we just tag src/dst regular inode with
parent_lost flag instead of updating its i_pino field, once there is fsync()
comes after rename(), we will trigger checkpoint for such parent lost inode to
keep rename/cross_rename operation as an atomic operation.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
