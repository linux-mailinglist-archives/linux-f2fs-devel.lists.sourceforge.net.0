Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8A4AFE8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 04:14:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdQ7e-0006l2-7n; Wed, 19 Jun 2019 02:14:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hdQ7b-0006kd-9O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 02:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=inGqzNUj7z4gnSji1egXPFwfCk3GBY4Zt4rNh7xEl0E=; b=Lg+4BC48kemu1daDLsQroeMy79
 waCH1/8xlJkxMi99/deMQjlL3BNkouUvpc7Q822loDrcbAMRrgf3Lz7I3Lbj4n9jW0cgUa6NX059Y
 Gzz0wem0h9lymC5GboQLVNING3JBeRWDVA845hGftQ5lXEB/cqLP22ZqB1rX/OL3fpiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=inGqzNUj7z4gnSji1egXPFwfCk3GBY4Zt4rNh7xEl0E=; b=lgn6mYLeiYJLpX8dvGz08w+c4D
 tmUtUbk7XY6VscXPCMCR/IO8xnbRclCymTTFTh1Y06DHSqgQgysFnXYpfw2EywZ1q9S39rVrOf7S7
 yE/aDF6aJK1fn03FymAZY/WlD9Go1eN/V5v9ySLBAiP6AAMFE7R/6WIcGAAoEDeHYPSQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdQ7Y-00GVal-UX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 02:14:47 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9B227596EAB22FFE6DF2;
 Wed, 19 Jun 2019 10:14:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Jun
 2019 10:14:32 +0800
To: Kassey <kassey1216@gmail.com>, <linux-f2fs-devel@lists.sourceforge.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>, <kassey@126.com>
References: <CAKwPUoyvn6mjEw=DfPTpLBZy-NQvtd8fpjfpwRRGMvqshB5gxw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <02de6dc0-ca4c-459f-08e4-0e4986bf25ac@huawei.com>
Date: Wed, 19 Jun 2019 10:14:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAKwPUoyvn6mjEw=DfPTpLBZy-NQvtd8fpjfpwRRGMvqshB5gxw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdQ7Y-00GVal-UX
Subject: Re: [f2fs-dev] f2fs: wait_on_all_pages_writeback 4.4 kernel
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

Hi Kassey,

Could below commit fix your problem?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=31867b23d7d1ee3535136c6a410a6cf56f666bfc

Thanks,

On 2019/6/19 9:28, Kassey wrote:
> hi, Chao and team:
>    we got dump on arm64 that showing a task is sleep on
> wait_on_all_pages_writeback
>   by checking the sbi->nr_pages, we can see that the value is negative
> for F2FS_WB_CP_DATA
>   caused the problem to wait .
> 
>   can you help to suggest if any reasaon that we are seeing negative
> value here  ?
> 
> nr_pages = (
>         (counter = 0),
>         (counter = 30005),
>         (counter = 0),
>         (counter = 79),
>         (counter = 0),
>         (counter = 0),
>         (counter = 9),
>         (counter = -6),
>         (counter = 6)),
> 
> 
> -000|__switch_to(prev = 0xFFFFFFF74A1F8EC0, next = 0xFFFFFFF8B2C21D80)
> -001|__schedule(preempt = FALSE)
> -002|need_resched(inline)
> -002|schedule()
> -003|schedule_timeout(?)
> -004|get_current(inline)
> -004|io_schedule_timeout(timeout = 0x01F4)
> -005|get_pages(inline)
> -005|wait_on_all_pages_writeback(sbi = 0xFFFFFFF7A7323000)
> -006|do_checkpoint(sbi = 0xFFFFFFF7A7323000, cpc = 0xFFFFFFF760C43C28)
> -007|f2fs_write_checkpoint(sbi = 0xFFFFFFF7A7323000, cpc = 0xFFFFFFF760C43C28)
> -008|f2fs_sync_fs(sb = 0xFFFFFFF887139800, ?)
> -009|f2fs_do_sync_file(?, ?, ?, datasync = 0x0, atomic = TRUE)
> -010|is_inode_flag_set(inline)
> -010|f2fs_is_atomic_file(inline)
> -010|f2fs_ioc_commit_atomic_write(inline)
> -010|f2fs_ioctl(filp = 0xFFFFFFF811E4E3C0, ?, ?)
> -011|f2fs_compat_ioctl(file = 0xFFFFFFF811E4E3C0, ?, ?)
> -012|compat_sys_ioctl(fd = 0xA7, cmd = 0xF502, ?)
> -013|oppo_root_check(asm)
> -014|__sys_trace(asm)
> -015|NSX:0xFFFFFFBFFE7FC7C0(asm)
>  -->|exception
> -016|NUR:0xEDD8236C(asm)
>  ---|end of frame
> 
> 
> 
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
