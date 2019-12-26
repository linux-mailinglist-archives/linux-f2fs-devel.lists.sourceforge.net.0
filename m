Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A112A980
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 02:32:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikI0o-0002Xp-PO; Thu, 26 Dec 2019 01:32:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ikI0m-0002Xe-Rx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 01:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sy2kuW3S7FUjSDMBZ8B3RoQVzHq0jdZFDkbc3sAnS1k=; b=nFQwO1tFmLgQBCLQcsn+P5GwSV
 jf+lMajypPwSUBfqnGF+bFygeJu9NkRKwXjGf+F6U5FLHmi9S2ZjfJbFNezs/d3b3it1fTPXsuAKw
 VhKx9gB/nAaXVILJ2+tBF4QSix4K84FhdQ65UdI+sFBitcrsBHu9aQ/CaVK8zruZB82g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sy2kuW3S7FUjSDMBZ8B3RoQVzHq0jdZFDkbc3sAnS1k=; b=fLgVASNl+nKQuiwi92JvFMEsuv
 TYGePiAdx6FnS/NAcXS7Icu52c4uVxgfEtvTf9TbyB6zg4bNR6pIScDgtNrBUmpNHJhLB42VvWtop
 HJ4FMer756+g+7Jg/vS5YvkQ9gX9lzz1/Q20eqPqxvkGSAxUT4pvicGbZI1zy54CRqWQ=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ikI0k-00FMhW-H1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 01:32:24 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C44EFEE8CA7C40A2CB7B;
 Thu, 26 Dec 2019 09:32:14 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 26 Dec
 2019 09:32:10 +0800
To: Pavel Machek <pavel@ucw.cz>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, kernel list
 <linux-kernel@vger.kernel.org>, <sfr@canb.auug.org.au>, <david@ixit.cz>
References: <20191222154917.GA22964@amd> <20191225130456.GA18929@duo.ucw.cz>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0d067e7a-e301-0c1a-c651-33845ad2c333@huawei.com>
Date: Thu, 26 Dec 2019 09:32:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191225130456.GA18929@duo.ucw.cz>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ikI0k-00FMhW-H1
Subject: Re: [f2fs-dev] f2fs compile problem in next-20191220 on x86-32
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

On 2019/12/25 21:04, Pavel Machek wrote:
> On Sun 2019-12-22 16:49:17, Pavel Machek wrote:
>> Hi!
>>
>> I'm getting this:
>>
>>   LD      .tmp_vmlinux1
>>   ld: fs/f2fs/file.o: in function `f2fs_truncate_blocks':
>>   file.c:(.text+0x2968): undefined reference to `__udivdi3'
>>   make: *** [Makefile:1079: vmlinux] Error 1
>>
>> when attempting to compile kernel for x86-32.
> 
> David bisected it:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=205967
> 
> And the bug is actually easy to see:
> 
> +int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> +{
> +       u64 free_from = from;
> +
> +       /*
> +        * for compressed file, only support cluster size
> +        * aligned truncation.
> +        */
> +       if (f2fs_compressed_file(inode)) {
> +               size_t cluster_size = PAGE_SIZE <<
> +                                       F2FS_I(inode)->i_log_cluster_size;
> +
> +               free_from = roundup(from, cluster_size);
> 
> #define roundup(x, y) (                                 \
> {                                                       \
>         typeof(y) __y = y;                              \
>         (((x) + (__y - 1)) / __y) * __y;                \
> }                                                       \
> 
> div64 is needed instead of div in the roundup macro. Or actually... It
> is quite stupid to use roundup like this on value that is power of
> two, right?

This has been fixed in dev branch, could you check that? People still saw this
issue because linux-next did not update after we fix this bug.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev

Thanks,

> 
> Best regards,
> 									Pavel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
