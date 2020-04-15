Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B241A9187
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 05:29:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOYjb-0006fa-AH; Wed, 15 Apr 2020 03:29:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jOYja-0006fU-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 03:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7dBSMlt48TuNAPHuFk/2XRsXFtuPuNF9w2C7tk7osx4=; b=SSUmqwloBn05sfsrwtYfx3VO1D
 kxM8KbtGr/dNWNWZN1qn6EFHXPQBE9OLGSfRAS/uPo7mW4f5PQWALQnLn7jjJk1mqmX66Jzq60fr4
 ZtfimbTpBPTuMcKiqQ/2Y46mCEkfJPoHFdeGEKXdiWFCLYs1sEv458pPktqcBVneuF8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7dBSMlt48TuNAPHuFk/2XRsXFtuPuNF9w2C7tk7osx4=; b=f7R4GbYcYO8Was3RqLximMMPGn
 GPCElzV7/dpikV1gF21MrHbFolIthC8n+bo93BQ4dPpNyZPlDOiC8IQwRc+jkGw+xK+9AFjuj4fER
 TFsJH9AOfPFWsStAHrEiPfU2lgqfUjKkTLy4obroyR8hciNQIau1r/EHgkyhxtBk8h10=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOYjZ-00GoVx-AK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 03:29:06 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C305656453E0F6A2117B;
 Wed, 15 Apr 2020 11:28:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Apr
 2020 11:28:56 +0800
To: Adam Borowski <kilobyte@angband.pl>
References: <158582888648.9053.2167684001695943018.reportbug@umbar.angband.pl>
 <20200402191658.GR768293@mit.edu> <20200403024535.GA23417@angband.pl>
 <58dd64a1-4f2b-3201-6cb7-215b420f804b@huawei.com>
 <45149351-4c07-ba55-dec3-9a0872bb159f@huawei.com>
 <20200409233255.GA14286@angband.pl>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d7bd625f-52de-172c-c292-ed9cb17f0b5e@huawei.com>
Date: Wed, 15 Apr 2020 11:28:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200409233255.GA14286@angband.pl>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jOYjZ-00GoVx-AK
Subject: Re: [f2fs-dev] Bug#955549: f2fs-tools: fsck.f2fs segfaults
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
Cc: 955549@bugs.debian.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/4/10 7:32, Adam Borowski wrote:
> On Tue, Apr 07, 2020 at 06:22:19PM +0800, Chao Yu wrote:
>> I figured out two patches to fix segfault issues, could you please have
>> a try:
>>
>> 	fsck.f2fs: fix to check validation of i_xattr_nid
>> 	fsck.f2fs: fix to check validation of block address
>>
>> In addition, I found that fsck main flow failed because it can not load root
>> inode based on wrong block address in nat, so I wrote another patch to enable
>> fsck to lookup root inode by traversing all nodes in f2fs main area, and relink
>> nat to root inode correctly.
>>
>> 	fsck.f2fs: lookup and relink root inode
> 
> I still get a segfault:

Oops..

> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000555555564444 in print_inode_info (sbi=0x555555584ca0 <gfsck>, node=0x55555558f170, name=<optimized out>) at mount.c:240
> 240			block_t blkaddr = le32_to_cpu(inode->i_addr[i + ofs]);
> (gdb) bt
> #0  0x0000555555564444 in print_inode_info (sbi=0x555555584ca0 <gfsck>, node=0x55555558f170, name=<optimized out>) at mount.c:240
> #1  0x0000555555564c4e in print_node_info (sbi=<optimized out>, node_block=<optimized out>, verbose=<optimized out>) at mount.c:278
> #2  0x000055555556317f in dump_node (sbi=sbi@entry=0x555555584ca0 <gfsck>, nid=nid@entry=2861, force=force@entry=1) at dump.c:511
> #3  0x0000555555561060 in fsck_verify (sbi=0x555555584ca0 <gfsck>) at fsck.c:3259
> #4  0x000055555555799a in do_fsck (sbi=0x555555584ca0 <gfsck>) at main.c:698
> #5  main (argc=<optimized out>, argv=<optimized out>) at main.c:864

Fixed with

[PATCH] fsck.f2fs: fix to avoid overflow during print_inode_info()

Thanks,

> 
>> With this patch, image can be fixed and mounted later, although, most of files
>> were deleted due to seriously damaged f2fs metadata....
> 
> Yeah, I've later tested the hardware -- writes to it are borked, so no
> complaint against the filesystem failing.  I got backups. :)
> 
>> The patches were made on top of dev-test branch of Jaegeuk's tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/log/?h=dev-test
> 
>>>>>> #0  0x00005555555593ec in memcpy (__len=18446744073323892736, __src=0x55555560760c, __dest=0x7fffffffe000) at /usr/include/x86_64-linux-gnu/bits/string_fortified.h:34
>>>
>>> At a glance, immediate reason of this issue is we didn't check inode.i_namelen's
>>> validation.
>>>
>>>>>> #1  convert_encrypted_name (name=name@entry=0x55555560760c " ", len=-385658880, new=new@entry=0x7fffffffe000 " ", enc_name=<optimized out>) at fsck.c:1132
>>>>>> #2  0x0000555555562286 in print_inode_info (sbi=0x55555557db20 <gfsck>, node=0x5555556075b0, name=1) at mount.c:183
>>>>>> #3  0x0000555555562a46 in print_node_info (sbi=<optimized out>, node_block=<optimized out>, verbose=<optimized out>) at mount.c:277
>>>>>> #4  0x0000555555560d3f in dump_node (sbi=sbi@entry=0x55555557db20 <gfsck>, nid=nid@entry=24274, force=force@entry=1) at dump.c:520
>>>>>> #5  0x000055555555e94c in fsck_verify (sbi=0x55555557db20 <gfsck>) at fsck.c:2568
>>>>>> #6  0x000055555555699b in do_fsck (sbi=0x55555557db20 <gfsck>) at main.c:569
> 
> 
> Meow!
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
