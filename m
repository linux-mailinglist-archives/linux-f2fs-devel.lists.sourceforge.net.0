Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6E2A22C1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 02:31:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZOhJ-0002ai-0n; Mon, 02 Nov 2020 01:31:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZOhB-0002Zr-TU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 01:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hOychu8Z1A7pZQaXs4d1doI35C6mYoQ83IQXaEmSnjo=; b=gzNrkmBJ4NgQRuOb2GxpcOLtVW
 bT4VC8SK/Xb+I59wSydAa8LsHTlMFzIueXuin6mL2TJcFDkTWmgse7MF/+ExLWJnUx+2K7ubW9M3j
 xXdt1Lu8L82+28VvTzgM2UW71nLQ/Tl9JepY1WoN2uSrGVUi2zRAWrH/uFW6Q8s85HnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hOychu8Z1A7pZQaXs4d1doI35C6mYoQ83IQXaEmSnjo=; b=ktKZ64yVIYhSVa8YO4CkIMLyuz
 Y7qMJpFOUjMdMAJxvUIhRAbIWLuxKGTZu72l6659zKLviueBmnK7oDBRwbxK30c2qOCimW6gkhGL5
 hmICNYovk1lL/NauUOhZgbbH1iItim/I6gWHbdH1fATwz79buRntMfxUt1KyEq5JsAy8=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZOh0-005l13-9g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 01:31:41 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPb3P35zJzhfNN;
 Mon,  2 Nov 2020 09:31:13 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 2 Nov 2020
 09:31:10 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200407100107.4356-1-yuchao0@huawei.com>
 <20200407100107.4356-2-yuchao0@huawei.com>
 <20201031234848.GC936@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <95ba132f-0dc0-d391-26b4-68eef132f931@huawei.com>
Date: Mon, 2 Nov 2020 09:31:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201031234848.GC936@sol.localdomain>
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
X-Headers-End: 1kZOh0-005l13-9g
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix to check validation of
 i_xattr_nid
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
Cc: kilobyte@angband.pl, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/1 7:48, Eric Biggers wrote:
> Hi Chao,
> 
> On Tue, Apr 07, 2020 at 06:01:07PM +0800, Chao Yu wrote:
>> Otherwise, fsck.f2fs will access invalid memory address as below:
>>
>> - fsck_verify
>>   - dump_node
>>    - dump_file
>>     - dump_inode_blk
>>      - dump_xattr
>>       - read_all_xattrs
>>         - get_node_info
>>          access &(F2FS_FSCK(sbi)->entries[nid])
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fsck/dump.c  |  2 ++
>>   fsck/fsck.c  |  8 ++++++++
>>   fsck/fsck.h  |  3 +++
>>   fsck/mount.c |  8 +++++---
>>   fsck/xattr.c | 20 ++++++++++++++++++--
>>   5 files changed, 36 insertions(+), 5 deletions(-)
>>
> 
> This commit caused a regression where 'dump.f2fs -i <inode> <device>'
> now segfaults if the inode has any extended attributes.
> 
> It's because read_all_xattrs() now calls fsck_sanity_check_nid(), which
> eventually dereferences f2fs_fsck::main_area_bitmap, which is NULL.
> 
> I'm not sure what was intended here.

Eric, could you please have a try with below commit:

https://git.kernel.org/pub/scm/linux/kernel/git/chao/f2fs-tools.git/commit/?h=dev-test&id=aad80ed0099fb9530ae3af9789362353ff580252

Thanks,

> 
> Here's the output from gdb:
> 
> (gdb) r -i 4 ~/fstests//kvm-xfstests/disks/vdc
> Starting program: /usr/bin/dump.f2fs -i 4 ~/fstests//kvm-xfstests/disks/vdc
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 10485760 (5120 MB)
> Info: MKFS version
>    "Linux version 4.9.241-00003-g631a4cd718af2 (e@sol) (gcc version 10.2.0 (GCC) ) #70 SMP Sat Oct 31 16:22:38 PDT 2020"
> Info: FSCK version
>    from "Linux version 4.9.241-00003-g631a4cd718af2 (e@sol) (gcc version 10.2.0 (GCC) ) #70 SMP Sat Oct 31 16:22:38 PDT 2020"
>      to "Linux version 5.10.0-rc1-00346-gebe40414a48c (e@sol) (gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35.1) #1 SMP PREEMPT Fri Oct 30 20:03:27 PDT 2020"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 10485760 (5120 MB)
> Info: CKPT version = 6e5d0386
> [print_node_info: 353] Node ID [0x4:4] is inode
> i_mode                        		[0x    81a4 : 33188]
> i_advise                      		[0x       0 : 0]
> i_uid                         		[0x       0 : 0]
> i_gid                         		[0x       0 : 0]
> i_links                       		[0x       1 : 1]
> i_size                        		[0x       0 : 0]
> i_blocks                      		[0x       2 : 2]
> i_atime                       		[0x5f9df65f : 1604187743]
> i_atime_nsec                  		[0x2e869e08 : 780574216]
> i_ctime                       		[0x5f9df65f : 1604187743]
> i_ctime_nsec                  		[0x2e869e08 : 780574216]
> i_mtime                       		[0x5f9df65f : 1604187743]
> i_mtime_nsec                  		[0x2e869e08 : 780574216]
> i_generation                  		[0xf41ca108 : 4095516936]
> i_current_depth               		[0x       1 : 1]
> i_xattr_nid                   		[0x       5 : 5]
> i_flags                       		[0x       0 : 0]
> i_inline                      		[0x       2 : 2]
> i_pino                        		[0x       3 : 3]
> i_dir_level                   		[0x       0 : 0]
> i_namelen                     		[0x       4 : 4]
> i_name                        		[file]
> i_ext: fofs:0 blkaddr:0 len:0
> i_nid[0]                      		[0x       0 : 0]
> i_nid[1]                      		[0x       0 : 0]
> i_nid[2]                      		[0x       0 : 0]
> i_nid[3]                      		[0x       0 : 0]
> i_nid[4]                      		[0x       0 : 0]
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x00007ffff7f750fa in f2fs_test_bit (nr=1024, p=0x0) at libf2fs.c:304
> 304		return (mask & *addr) != 0;
> (gdb) bt
> #0  0x00007ffff7f750fa in f2fs_test_bit (nr=1024, p=0x0) at libf2fs.c:304
> #1  0x000055555555a953 in f2fs_test_main_bitmap (sbi=0x555555593d80 <gfsck>, blk=12288) at fsck.c:44
> #2  0x000055555555bd9f in sanity_check_nid (sbi=0x555555593d80 <gfsck>, nid=5, node_blk=0x5555555bb3a0, ftype=F2FS_FT_XATTR,
>      ntype=TYPE_XATTR, ni=0x7fffffffdd20) at fsck.c:449
> #3  0x000055555555c013 in fsck_sanity_check_nid (sbi=0x555555593d80 <gfsck>, nid=5, node_blk=0x5555555bb3a0, ftype=F2FS_FT_XATTR,
>      ntype=TYPE_XATTR, ni=0x7fffffffdd20) at fsck.c:495
> #4  0x000055555557d4d6 in read_all_xattrs (sbi=0x555555593d80 <gfsck>, inode=0x5555555ba390) at xattr.c:35
> #5  0x00005555555698ea in print_inode_info (sbi=0x555555593d80 <gfsck>, node=0x5555555ba390, name=0) at mount.c:335
> #6  0x0000555555569a09 in print_node_info (sbi=0x555555593d80 <gfsck>, node_block=0x5555555ba390, verbose=0) at mount.c:354
> #7  0x0000555555566b55 in dump_node (sbi=0x555555593d80 <gfsck>, nid=4, force=0) at dump.c:507
> #8  0x0000555555559850 in do_dump (sbi=0x555555593d80 <gfsck>) at main.c:729
> #9  0x0000555555559ee1 in main (argc=4, argv=0x7fffffffe238) at main.c:892
> (gdb)
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
