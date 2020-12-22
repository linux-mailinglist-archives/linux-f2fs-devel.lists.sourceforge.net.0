Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EF2E0761
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 09:46:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krdJ9-0007OK-Q8; Tue, 22 Dec 2020 08:46:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1krdJ8-0007OC-43
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 08:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BRf5jDASBN13tvhc51V1v7k4oUTesb/0yUvRWtkk5pQ=; b=QORGHXokfnGf+TSpQ58t4D/s/C
 JKW+J2irtNYTSTR2rrD1Z+xyoQuJxLmEdazTOrB31dlbZXPoIVMAmoJh0gILN2gLNskRLO33TUGs7
 I7I6/Xo4e/213PDiT4Fek4l+ekNXkSMZNcuhDL9NaA+ciZDeh5w+jxnW19IWNHxKClp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BRf5jDASBN13tvhc51V1v7k4oUTesb/0yUvRWtkk5pQ=; b=jvK6iqqUDNaxd0vJYscG+65JHn
 rJ8wGAfa+t26P8rj6AuyNkUoT+De6OOAhruSdXSyFSaDZnLVD6J/oJHVTUkYlp+ORTF0NnKdNMjQi
 DpYuGQh6X0vUiD5Dzj3d9l+f/899vOsWqeeOdofrEjJD2EgG1xrd/Da/C+r9SDhWrrpE=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krdJ0-005pwK-3a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 08:46:13 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0VK64K68zhvVD;
 Tue, 22 Dec 2020 16:45:14 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 22 Dec
 2020 16:45:53 +0800
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201222011634.124180-1-yuchao0@huawei.com>
 <X+GwEz8NTepCKEFX@kroah.com> <X+GwQ9G4RufeTpxy@kroah.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <99920a3b-421b-e1dc-e6d8-96813da5bd10@huawei.com>
Date: Tue, 22 Dec 2020 16:45:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X+GwQ9G4RufeTpxy@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krdJ0-005pwK-3a
Subject: Re: [f2fs-dev] [PATCH 5.10.y] f2fs: fix to seek incorrect data
 offset in inline data file
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
Cc: jaegeuk@kernel.org, kitestramuort <kitestramuort@autistici.org>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/22 16:37, Greg KH wrote:
> On Tue, Dec 22, 2020 at 09:36:35AM +0100, Greg KH wrote:
>> On Tue, Dec 22, 2020 at 09:16:34AM +0800, Chao Yu wrote:
>>> As kitestramuort reported:
>>>
>>> F2FS-fs (nvme0n1p4): access invalid blkaddr:1598541474
>>> [   25.725898] ------------[ cut here ]------------
>>> [   25.725903] WARNING: CPU: 6 PID: 2018 at f2fs_is_valid_blkaddr+0x23a/0x250
>>> [   25.725923] Call Trace:
>>> [   25.725927]  ? f2fs_llseek+0x204/0x620
>>> [   25.725929]  ? ovl_copy_up_data+0x14f/0x200
>>> [   25.725931]  ? ovl_copy_up_inode+0x174/0x1e0
>>> [   25.725933]  ? ovl_copy_up_one+0xa22/0xdf0
>>> [   25.725936]  ? ovl_copy_up_flags+0xa6/0xf0
>>> [   25.725938]  ? ovl_aio_cleanup_handler+0xd0/0xd0
>>> [   25.725939]  ? ovl_maybe_copy_up+0x86/0xa0
>>> [   25.725941]  ? ovl_open+0x22/0x80
>>> [   25.725943]  ? do_dentry_open+0x136/0x350
>>> [   25.725945]  ? path_openat+0xb7e/0xf40
>>> [   25.725947]  ? __check_sticky+0x40/0x40
>>> [   25.725948]  ? do_filp_open+0x70/0x100
>>> [   25.725950]  ? __check_sticky+0x40/0x40
>>> [   25.725951]  ? __check_sticky+0x40/0x40
>>> [   25.725953]  ? __x64_sys_openat+0x1db/0x2c0
>>> [   25.725955]  ? do_syscall_64+0x2d/0x40
>>> [   25.725957]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>
>>> llseek() reports invalid block address access, the root cause is if
>>> file has inline data, f2fs_seek_block() will access inline data regard
>>> as block address index in inode block, which should be wrong, fix it.
>>>
>>> Fixes: 788e96d1d3994 ("f2fs: code cleanup by removing unnecessary check")
>>> Fixes: 267378d4de69 ("f2fs: introduce f2fs_seek_block to support SEEK_{DATA, HOLE} in llseek")
>>> Cc: stable <stable@vger.kernel.org> # 3.16+
>>> Reported-by: kitestramuort <kitestramuort@autistici.org>
>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>
>>> This will cause boot failure in f2fs image, which was reported in gentoo
>>> community, I'd like to fix them in stable kernel 5.10 first as request in
>>> bugzilla:
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=210825
>>
>> <formletter>
>>
>> This is not the correct way to submit patches for inclusion in the
>> stable kernel tree.  Please read:
>>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>> for how to do this properly.

I forgot to add "Cc: stable ..." tag in original patch before this patch been
merged in Linus' tree, so I think "Option 2" should be right way to backport this
patch, however, I forgot to tag commit id of this patch.

>>
>> </formletter>
> 
> Specifically, what is the git commit id of this patch in Linus's tree?

Will add git commit id, and resend the patch.

Thanks,

> 
> thanks,
> 
> greg k-h
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
