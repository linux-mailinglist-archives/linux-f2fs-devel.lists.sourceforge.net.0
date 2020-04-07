Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EA1A0AFA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 12:22:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLlNX-0002xf-4G; Tue, 07 Apr 2020 10:22:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jLlNU-0002x3-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBtst/fgbuqADR2GWl4E0mTCM3KoJKgMJukmwrmHFB8=; b=A/dPXFqFjLFF5tZxIAzzWC8eDQ
 k58T/4eeV88CztI4nFxsze8Vy67T7HHodIbqGACawYG+6s/2510ejAxnTWOWTIPYonbltu5XvGBUF
 wj+2OC5IEFvvNzAWGrZkTMZ1D/Sb+C2upk/lFYtkrQZcg1rjgX2igArEqTiGUrB/3uhY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBtst/fgbuqADR2GWl4E0mTCM3KoJKgMJukmwrmHFB8=; b=iYaVVx8axJgipBIIAEKAmT2OCw
 EHnsUjkNHUPD1F9eD369D7OsEJOFbaRTW82sQXaCmZhRGRAkULRp+TY5U0QUzVwW57K/7x9ERzStK
 PePrszP2mm2W710gPIdyhxvnI2xtBHBNUbt1roFUYttzuHrdHNkxcY6eAn/GVy6/KCtc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLlNQ-006LHw-I2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:22:44 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 07712603C8F26CAD14DB;
 Tue,  7 Apr 2020 18:22:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 7 Apr 2020
 18:22:20 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Adam Borowski <kilobyte@angband.pl>, "Theodore Y. Ts'o" <tytso@mit.edu>
References: <158582888648.9053.2167684001695943018.reportbug@umbar.angband.pl>
 <20200402191658.GR768293@mit.edu> <20200403024535.GA23417@angband.pl>
 <58dd64a1-4f2b-3201-6cb7-215b420f804b@huawei.com>
Message-ID: <45149351-4c07-ba55-dec3-9a0872bb159f@huawei.com>
Date: Tue, 7 Apr 2020 18:22:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <58dd64a1-4f2b-3201-6cb7-215b420f804b@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: angband.pl]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jLlNQ-006LHw-I2
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

Hi Adam,

I figured out two patches to fix segfault issues, could you please have
a try:

	fsck.f2fs: fix to check validation of i_xattr_nid
	fsck.f2fs: fix to check validation of block address

In addition, I found that fsck main flow failed because it can not load root
inode based on wrong block address in nat, so I wrote another patch to enable
fsck to lookup root inode by traversing all nodes in f2fs main area, and relink
nat to root inode correctly.

	fsck.f2fs: lookup and relink root inode

With this patch, image can be fixed and mounted later, although, most of files
were deleted due to seriously damaged f2fs metadata....

The patches were made on top of dev-test branch of Jaegeuk's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/log/?h=dev-test

Let me know if you have problem with above patches.

Thanks,

On 2020/4/3 14:37, Chao Yu wrote:
> Thanks for forwarding, Ted.
> 
> On 2020/4/3 10:45, Adam Borowski wrote:
>> On Thu, Apr 02, 2020 at 03:16:58PM -0400, Theodore Y. Ts'o wrote:
>>> On Thu, Apr 02, 2020 at 02:01:26PM +0200, Adam Borowski wrote:
>>>>
>>>> After a lot of output on a damaged filesystem (SD card copied to an image)
>>>> fsck.f2fs dies with:
>>>>
>>>>  - File name         : mkfs.ext3.dpkg-new
>>>>  - File size         : 6 (bytes)
>>>>
>>>> Program received signal SIGSEGV, Segmentation fault.
>>>> 0x00005555555593ec in memcpy (__len=18446744073323892736, __src=0x55555560760c, __dest=0x7fffffffe000) at /usr/include/x86_64-linux-gnu/bits/string_fortified.h:34
>>>> 34	  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
>>
>>>> #0  0x00005555555593ec in memcpy (__len=18446744073323892736, __src=0x55555560760c, __dest=0x7fffffffe000) at /usr/include/x86_64-linux-gnu/bits/string_fortified.h:34
> 
> At a glance, immediate reason of this issue is we didn't check inode.i_namelen's
> validation.
> 
>>>> #1  convert_encrypted_name (name=name@entry=0x55555560760c " ", len=-385658880, new=new@entry=0x7fffffffe000 " ", enc_name=<optimized out>) at fsck.c:1132
>>>> #2  0x0000555555562286 in print_inode_info (sbi=0x55555557db20 <gfsck>, node=0x5555556075b0, name=1) at mount.c:183
>>>> #3  0x0000555555562a46 in print_node_info (sbi=<optimized out>, node_block=<optimized out>, verbose=<optimized out>) at mount.c:277
>>>> #4  0x0000555555560d3f in dump_node (sbi=sbi@entry=0x55555557db20 <gfsck>, nid=nid@entry=24274, force=force@entry=1) at dump.c:520
>>>> #5  0x000055555555e94c in fsck_verify (sbi=0x55555557db20 <gfsck>) at fsck.c:2568
>>>> #6  0x000055555555699b in do_fsck (sbi=0x55555557db20 <gfsck>) at main.c:569
>>
>>>> I have a copy of the filesystem in question from before any repair attempts. 
>>>> It has no sensitive data on it, thus I can share if needed -- 14GB.
>>>
>>> Thanks for the bug report.  Can you make the file system image
>>> available somehow?  Maybe for download at some URL?  How well does it
>>> compress?
>>
>> 916MB -- https://angband.pl/rigel.f2fs.xz.gpg
>> The machine serves as a serial console logger/management for a bunch of
>> boxes; a root session is unlikely to have anything I'd not share with
>> developers but is not something to release to the wide world.  Thus, I
>> symetrically encrypted the image, I'll send you the password privately --
>> feel free to share it with anyone semi-trusted.
> 
> Would you mind sharing the password with me (chao@kernel.org)? I guess
> I can take a look at this issue.
> 
> Thanks,
> 
>>
>> The filesystem was on a SD card, with very light use (append), no issues,
>> ran kernel 4.13 until 9 days ago -- then I've upgraded to 5.5.11 with no
>> other changes.  The corruption is probably caused by that, but there's
>> always a chance of SD being SD.
>>
>>
>> Meow!
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
