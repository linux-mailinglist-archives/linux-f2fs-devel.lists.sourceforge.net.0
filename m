Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CF2A1B48
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 00:49:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZ0cN-0007qk-S3; Sat, 31 Oct 2020 23:49:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZ0cM-0007qU-2k
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9xXn5B7TVxwVXxpx8GJSQCLHJwscZXBOCAXq74GU2uA=; b=Z7thAX2I01J1bkzHdJKsdjDLKc
 9stKnyawxqUqFl1+AUU8imcBrZH+VafhZNQcNUeGZHepf2Xbm0JlRyensqK2jq7rQDZWiKGAKJ/Cx
 3uDLoBZ8O3bJX4Uz+HdvT9ejAdKvFEGbx8zxQ54Ikw0R507Yb7w9uZI5LhFHiMWyDdSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9xXn5B7TVxwVXxpx8GJSQCLHJwscZXBOCAXq74GU2uA=; b=NrjZ2cDM7f4mDhIJztWYi7MKeL
 BRw3ZiPLVF5vLV6u9BeYQARk2MQlEdlz77GfO43Zfb8PEKNze4v3FXdBNh9SRIVRmCz8QU0HFp7Oy
 X3Si+quoRScGauiJan9DL2mglHobHTa85YmffYNwMhSHW3BEo4aa8ADz6QnFnUiGMcYc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZ0cC-00Egt2-P6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:49:06 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D3E5206DD;
 Sat, 31 Oct 2020 23:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604188130;
 bh=3jpsp6SAxopK/ZTsz+d9cCHWdQ/+aW7N+Bv4mvne6Y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/b4VyyoRyMuaSwC57AdIewLtaR++PPrg2Xnbi/MyiO+lQ6/lPJ0GnwMPUfMIkoZD
 8qPOlobexXtLilo9/DEAg4jKJD562sLgm7RlsJ/uw66ZF9uIsjq3o8rSxNIeRVUh9y
 fJX9XCxTBX9PQsvtGL74JhRgoCgp2aQuJr5JE+nw=
Date: Sat, 31 Oct 2020 16:48:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201031234848.GC936@sol.localdomain>
References: <20200407100107.4356-1-yuchao0@huawei.com>
 <20200407100107.4356-2-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407100107.4356-2-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZ0cC-00Egt2-P6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Tue, Apr 07, 2020 at 06:01:07PM +0800, Chao Yu wrote:
> Otherwise, fsck.f2fs will access invalid memory address as below:
> 
> - fsck_verify
>  - dump_node
>   - dump_file
>    - dump_inode_blk
>     - dump_xattr
>      - read_all_xattrs
>        - get_node_info
>         access &(F2FS_FSCK(sbi)->entries[nid])
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fsck/dump.c  |  2 ++
>  fsck/fsck.c  |  8 ++++++++
>  fsck/fsck.h  |  3 +++
>  fsck/mount.c |  8 +++++---
>  fsck/xattr.c | 20 ++++++++++++++++++--
>  5 files changed, 36 insertions(+), 5 deletions(-)
> 

This commit caused a regression where 'dump.f2fs -i <inode> <device>'
now segfaults if the inode has any extended attributes.

It's because read_all_xattrs() now calls fsck_sanity_check_nid(), which
eventually dereferences f2fs_fsck::main_area_bitmap, which is NULL.

I'm not sure what was intended here.

Here's the output from gdb:

(gdb) r -i 4 ~/fstests//kvm-xfstests/disks/vdc
Starting program: /usr/bin/dump.f2fs -i 4 ~/fstests//kvm-xfstests/disks/vdc
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 10485760 (5120 MB)
Info: MKFS version
  "Linux version 4.9.241-00003-g631a4cd718af2 (e@sol) (gcc version 10.2.0 (GCC) ) #70 SMP Sat Oct 31 16:22:38 PDT 2020"
Info: FSCK version
  from "Linux version 4.9.241-00003-g631a4cd718af2 (e@sol) (gcc version 10.2.0 (GCC) ) #70 SMP Sat Oct 31 16:22:38 PDT 2020"
    to "Linux version 5.10.0-rc1-00346-gebe40414a48c (e@sol) (gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35.1) #1 SMP PREEMPT Fri Oct 30 20:03:27 PDT 2020"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 10485760 (5120 MB)
Info: CKPT version = 6e5d0386
[print_node_info: 353] Node ID [0x4:4] is inode
i_mode                        		[0x    81a4 : 33188]
i_advise                      		[0x       0 : 0]
i_uid                         		[0x       0 : 0]
i_gid                         		[0x       0 : 0]
i_links                       		[0x       1 : 1]
i_size                        		[0x       0 : 0]
i_blocks                      		[0x       2 : 2]
i_atime                       		[0x5f9df65f : 1604187743]
i_atime_nsec                  		[0x2e869e08 : 780574216]
i_ctime                       		[0x5f9df65f : 1604187743]
i_ctime_nsec                  		[0x2e869e08 : 780574216]
i_mtime                       		[0x5f9df65f : 1604187743]
i_mtime_nsec                  		[0x2e869e08 : 780574216]
i_generation                  		[0xf41ca108 : 4095516936]
i_current_depth               		[0x       1 : 1]
i_xattr_nid                   		[0x       5 : 5]
i_flags                       		[0x       0 : 0]
i_inline                      		[0x       2 : 2]
i_pino                        		[0x       3 : 3]
i_dir_level                   		[0x       0 : 0]
i_namelen                     		[0x       4 : 4]
i_name                        		[file]
i_ext: fofs:0 blkaddr:0 len:0
i_nid[0]                      		[0x       0 : 0]
i_nid[1]                      		[0x       0 : 0]
i_nid[2]                      		[0x       0 : 0]
i_nid[3]                      		[0x       0 : 0]
i_nid[4]                      		[0x       0 : 0]

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7f750fa in f2fs_test_bit (nr=1024, p=0x0) at libf2fs.c:304
304		return (mask & *addr) != 0;
(gdb) bt
#0  0x00007ffff7f750fa in f2fs_test_bit (nr=1024, p=0x0) at libf2fs.c:304
#1  0x000055555555a953 in f2fs_test_main_bitmap (sbi=0x555555593d80 <gfsck>, blk=12288) at fsck.c:44
#2  0x000055555555bd9f in sanity_check_nid (sbi=0x555555593d80 <gfsck>, nid=5, node_blk=0x5555555bb3a0, ftype=F2FS_FT_XATTR,
    ntype=TYPE_XATTR, ni=0x7fffffffdd20) at fsck.c:449
#3  0x000055555555c013 in fsck_sanity_check_nid (sbi=0x555555593d80 <gfsck>, nid=5, node_blk=0x5555555bb3a0, ftype=F2FS_FT_XATTR,
    ntype=TYPE_XATTR, ni=0x7fffffffdd20) at fsck.c:495
#4  0x000055555557d4d6 in read_all_xattrs (sbi=0x555555593d80 <gfsck>, inode=0x5555555ba390) at xattr.c:35
#5  0x00005555555698ea in print_inode_info (sbi=0x555555593d80 <gfsck>, node=0x5555555ba390, name=0) at mount.c:335
#6  0x0000555555569a09 in print_node_info (sbi=0x555555593d80 <gfsck>, node_block=0x5555555ba390, verbose=0) at mount.c:354
#7  0x0000555555566b55 in dump_node (sbi=0x555555593d80 <gfsck>, nid=4, force=0) at dump.c:507
#8  0x0000555555559850 in do_dump (sbi=0x555555593d80 <gfsck>) at main.c:729
#9  0x0000555555559ee1 in main (argc=4, argv=0x7fffffffe238) at main.c:892
(gdb)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
