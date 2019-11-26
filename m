Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 867EE10A410
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2019 19:35:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZffv-0001vy-LU; Tue, 26 Nov 2019 18:34:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iZffv-0001vp-0G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 18:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rvcVwPSMC8hsAAI5CunmMqiWDSdt9qLhLihgYc3QHKA=; b=nBsRiZQBCInpg6GisMw3S/MBdC
 0ooDfToXFBTE7HhJuOmp+vSDJJmqixL3m0FGtcmOya04XNLmCbTGLDhoZGMZmuSMIiR4bQe2dRRh6
 HtaK0dTdfaB+iOOHjMGCCTCZUwJxAnCAF32UFwlpqaKRChTp3had4mPrBj9PRrLdydPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rvcVwPSMC8hsAAI5CunmMqiWDSdt9qLhLihgYc3QHKA=; b=YRHmO/Hvj8hJ1h8ds5/iP6iS6f
 xsWMbmo7fm/N6O85fzbk8kPa0w4qeNOKerQ2oPF5e+JX1psv5DObjYnkzpuR8AgOh77XDsLOA8sIL
 Z9H28jstVlhk3ESrFb/QwPmmrK+xG1+s9rtMMWSMnJ8fnlkEadWnn6Tyh70m7P2VBpsE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZffr-006azz-44
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Nov 2019 18:34:58 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 053472073F;
 Tue, 26 Nov 2019 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574793289;
 bh=UsimCXiuy29Tl4cL9+uVDjpMjRNiKCSSV9ExanOYEkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Joq2IQ1l6B0I4qmKoQW027tpXEszKSVutZNUItsC3/Uuld8rCXm+PrHFvkpaM7vk/
 XBdDyMwmC91hzpM06Ig1c6CR3GaX5eYWURY+ivGrPmHBpaUjioZxdsZAFQCHfcpgGL
 JzdHbXP+XWZu6CeShfxs9ZlD7C6cEv5ra7UsaAOI=
Date: Tue, 26 Nov 2019 10:34:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Stephanos Mallouris <stephanos.mallouris@gmail.com>
Message-ID: <20191126183448.GB5510@jaegeuk-macbookpro.roam.corp.google.com>
References: <CAPfgDnCxNrZ-ZfEVoDG_ET8bjRNi3KaSPsjRE_ZrMm-yLbr4Cw@mail.gmail.com>
 <20191125174048.GA71634@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnBLZUbx1pWZqTz09WmTcaS6gkE7sqLSXYSs_cJmWZ2PFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPfgDnBLZUbx1pWZqTz09WmTcaS6gkE7sqLSXYSs_cJmWZ2PFg@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iZffr-006azz-44
Subject: Re: [f2fs-dev] problem with f2fs android partition
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/26, Stephanos Mallouris wrote:
> Dear Kim,
> 
> Thanks for getting back to me.
> 
> I executed the command  fsck.f2fs -d 3 -f /dev/sdc1
> and it gave me the following information:
> 
> Info: Debug level = 3
> Info: Force to fix corruption
> Info: sector size = 512
> Info: total sectors = 22310913 (10894 MB)
> Info: MKFS version
>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> 19 17:16:04 PKT 2018"
> Info: FSCK version
>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> SMP Tue Nov 12 10:34:23 UTC 2019"
>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> SMP Tue Nov 12 10:34:23 UTC 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> 
> +--------------------------------------------------------+
> | Super block                                            |
> +--------------------------------------------------------+
> magic                         		[0xf2f52010 : 4076150800]
> major_ver                     		[0x       1 : 1]
> volum_name                    		[]
> minor_ver                     		[0x       7 : 7]
> log_sectorsize                		[0x       9 : 9]
> log_sectors_per_block         		[0x       3 : 3]
> log_blocksize                 		[0x       c : 12]
> log_blocks_per_seg            		[0x       9 : 9]
> segs_per_sec                  		[0x       1 : 1]
> secs_per_zone                 		[0x       1 : 1]
> checksum_offset               		[0x       0 : 0]
> block_count                   		[0x  2a8e00 : 2788864]
> section_count                 		[0x    151f : 5407]
> segment_count                 		[0x    1546 : 5446]
> segment_count_ckpt            		[0x       2 : 2]
> segment_count_sit             		[0x       2 : 2]
> segment_count_nat             		[0x      18 : 24]
> segment_count_ssa             		[0x       b : 11]
> segment_count_main            		[0x    151f : 5407]
> segment0_blkaddr              		[0x     200 : 512]
> cp_blkaddr                    		[0x     200 : 512]
> sit_blkaddr                   		[0x     600 : 1536]
> nat_blkaddr                   		[0x     a00 : 2560]
> ssa_blkaddr                   		[0x    3a00 : 14848]
> main_blkaddr                  		[0x    5000 : 20480]
> root_ino                      		[0x       3 : 3]
> node_ino                      		[0x       1 : 1]
> meta_ino                      		[0x       2 : 2]
> cp_payload                    		[0x       0 : 0]
> version                       Linux version 4.4.0-169-generic
> (buildd@lgw01-amd64-022) (gcc version 5.4.0 20160609 (Ubuntu
> 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu SMP Tue Nov 12 10:34:23 UTC
> 2019
> Info: total FS sectors = 22310912 (10894 MB)
> Info: CKPT version = 1307e4
> 
> +--------------------------------------------------------+
> | Checkpoint                                             |
> +--------------------------------------------------------+
> checkpoint_ver                		[0x  1307e4 : 1247204]
> user_block_count              		[0x  289400 : 2659328]
> valid_block_count             		[0x       0 : 0]

Hmm, # of valid blocks is 0, which is really impossible.
Do you have original backed up image? I think at some point the image
was overwritten when fsck.f2fs tried to fix.

> rsvd_segment_count            		[0x      70 : 112]
> overprov_segment_count        		[0x      d5 : 213]
> free_segment_count            		[0x    1519 : 5401]
> alloc_type[CURSEG_HOT_NODE]   		[0x       1 : 1]
> alloc_type[CURSEG_WARM_NODE]  		[0x       1 : 1]
> alloc_type[CURSEG_COLD_NODE]  		[0x       1 : 1]
> cur_node_segno[0]             		[0x       3 : 3]
> cur_node_segno[1]             		[0x       4 : 4]
> cur_node_segno[2]             		[0x       5 : 5]
> cur_node_blkoff[0]            		[0x       0 : 0]
> cur_node_blkoff[1]            		[0x       0 : 0]
> cur_node_blkoff[2]            		[0x       0 : 0]
> alloc_type[CURSEG_HOT_DATA]   		[0x       1 : 1]
> alloc_type[CURSEG_WARM_DATA]  		[0x       1 : 1]
> alloc_type[CURSEG_COLD_DATA]  		[0x       1 : 1]
> cur_data_segno[0]             		[0x       0 : 0]
> cur_data_segno[1]             		[0x       1 : 1]
> cur_data_segno[2]             		[0x       2 : 2]
> cur_data_blkoff[0]            		[0x       0 : 0]
> cur_data_blkoff[1]            		[0x       0 : 0]
> cur_data_blkoff[2]            		[0x       0 : 0]
> ckpt_flags                    		[0x       1 : 1]
> cp_pack_total_block_count     		[0x       8 : 8]
> cp_pack_start_sum             		[0x       1 : 1]
> valid_node_count              		[0x       0 : 0]
> valid_inode_count             		[0x       0 : 0]
> next_free_nid                 		[0x   14105 : 82181]
> sit_ver_bitmap_bytesize       		[0x      40 : 64]
> nat_ver_bitmap_bytesize       		[0x     300 : 768]
> checksum_offset               		[0x     ffc : 4092]
> elapsed_time                  		[0x 167a468 : 23569512]
> sit_nat_version_bitmap[0]     		[0x      79 : 121]
> 
> 
> [lookup_nat_in_journal:1515] ==> Found nid [0x4bb2] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x6ba0] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x783c] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xa0ec] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xab88] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xadcd] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xb19c] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xb431] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xb8f4] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xbf40] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xce28] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xd299] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xd56c] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xd8d3] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xe527] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xe67d] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xf88c] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0xfc96] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x10271] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x111d6] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x1154e] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x11b66] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x1271e] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x12abc] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x1339b] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x137d2] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x139ae] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x14363] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x146a2] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x151a3] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x151da] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x15580] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x15744] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x158eb] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x16030] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x1632b] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x16722] in nat cache
> [lookup_nat_in_journal:1515] ==> Found nid [0x16c38] in nat cache
> [build_nat_area_bitmap:1718] valid nat entries (block_addr != 0x0) [0x
>       0 : 0]
> [build_sit_area_bitmap:1214] Blocks [0x0 : 0] Free Segs [0x1519 : 5401]
> 
> Info: checkpoint state = 1 :  unmount
> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
> 
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x0]
> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x0]
> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x0]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x0]
> [FSCK] free segment_count matched with CP             [Ok..] [0x1519]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
> 
> Done.
> 
> 
> It still give the same error trying to mount the partiotion.
> [57765.609319] F2FS-fs (sdc1): Failed to read root inode
> [57765.651048] F2FS-fs (sdc1): Failed to read root inode
> [58015.507861] F2FS-fs (sdc1): Failed to read root inode
> [58015.563422] F2FS-fs (sdc1): Failed to read root inode
> 
> Please advice and assist if possible.
> 
> Kindest Regards,
> 
> Stephanos Mallouris
> 
> On 11/25/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > Hi,
> >
> > On 11/22, Stephanos Mallouris wrote:
> >> Dear all,
> >>
> >> I have backup my f2fs android partition via netcat and adb.
> >> After loosing the original partition, tried to restore it on a local
> >> drive and access it via linux but i am encountering the following
> >> issues:
> >>
> >> A. trying the command
> >>
> >>  sudo mount -t f2fs /dev/sdc1 /mnt
> >>
> >> gives the following error
> >>
> >>  F2FS-fs (sdc1): Failed to read root inode
> >>
> >> B1. Tried to fsck the file system , see bellow:
> >>
> >> sudo fsck.f2fs -a  /dev/sdc1
> >>
> >> result:
> >>
> >> Info: Fix the reported corruption.
> >> Info: sector size = 512
> >> Info: total sectors = 22310913 (10894 MB)
> >> Info: MKFS version
> >>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> >> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> >> 19 17:16:04 PKT 2018"
> >> Info: FSCK version
> >>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> >> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> >> SMP Tue Nov 12 10:34:23 UTC 2019"
> >>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> >> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> >> SMP Tue Nov 12 10:34:23 UTC 2019"
> >> Info: superblock features = 0 :
> >> Info: superblock encrypt level = 0, salt =
> >> 00000000000000000000000000000000
> >> Info: total FS sectors = 22310912 (10894 MB)
> >> Info: CKPT version = 1307e4
> >> Info: No error was reported
> >>
> >> Still unable to mount the partiotion , gives the same error.
> >>
> >> B2. Tried
> >> sudo fsck.f2fs -f  /dev/sdc1
> >
> > Could you try: fsck.f2fs -d 3 -f /dev/sdc1?
> > It seems you didn't back up the entire partition which is missing root
> > inode
> > block.
> >
> > Thanks,
> >
> >>
> >> result
> >>
> >> Info: Force to fix corruption
> >> Info: sector size = 512
> >> Info: total sectors = 22310913 (10894 MB)
> >> Info: MKFS version
> >>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> >> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> >> 19 17:16:04 PKT 2018"
> >> Info: FSCK version
> >>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> >> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> >> SMP Tue Nov 12 10:34:23 UTC 2019"
> >>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> >> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> >> SMP Tue Nov 12 10:34:23 UTC 2019"
> >> Info: superblock features = 0 :
> >> Info: superblock encrypt level = 0, salt =
> >> 00000000000000000000000000000000
> >> Info: total FS sectors = 22310912 (10894 MB)
> >> Info: CKPT version = 1307e4
> >> Info: checkpoint state = 1 :  unmount
> >> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
> >>
> >> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> >> [FSCK] SIT valid block bitmap checking                [Ok..]
> >> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
> >> [FSCK] valid_block_count matching with CP             [Ok..] [0x0]
> >> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x0]
> >> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x0]
> >> [FSCK] valid_inode_count matched with CP              [Ok..] [0x0]
> >> [FSCK] free segment_count matched with CP             [Ok..] [0x1519]
> >> [FSCK] next block offset is free                      [Ok..]
> >> [FSCK] fixing SIT types
> >> [FSCK] other corrupted bugs                           [Fail]
> >> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
> >> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
> >> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
> >> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
> >> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
> >> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
> >>
> >> Done.
> >>
> >>
> >>
> >> Trying to mount it , no success, gives
> >>
> >> F2FS-fs (sdc1): Failed to read root inode.
> >>
> >>
> >> Any help or advice will be much appreciated.
> >> Keep up the great work on f2fs.
> >>
> >> Kindest Regards
> >>
> >> Stephanos Mallouris
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
