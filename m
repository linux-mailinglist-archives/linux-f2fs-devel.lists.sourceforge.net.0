Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8342677E5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Sep 2020 06:45:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kGxQ4-0005nG-16; Sat, 12 Sep 2020 04:45:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris.ruehl@gtsys.com.hk>) id 1kGxPx-0005ma-9E
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Sep 2020 04:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0haw4clbZKQGjgGoYFwCph2wDIPx/nj2UshC6o1CNaA=; b=SeT81f/gdYtaPQlhLWU5m8seRU
 V9dJedFnRDyv4lejqqolqYRqrqFb+Y9fx81AEKXlAqZ+CETRW1jg/ldsXfjo5kTskeM8R/aJmAnKN
 MDryAHWg6u+sAmhPp8X54agJGL0EAv13y/yUfltuq3Ql4S647W8f04LMJ0RPiz8X8XBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0haw4clbZKQGjgGoYFwCph2wDIPx/nj2UshC6o1CNaA=; b=Y
 xc1e0ahEcv0U+SzvRXjGBVhgZIAWF11Z8uHMZrinu1+oQOaYYLbjUdSmXt4EN7p+duZgdS7BnCiXH
 t0AFlQVQLRjT2qC6aAQjK4ADMuqpT3dXTmCvdY9a7YBnBNnQ7JS2wqEucvIT7bjbVueSb9Tk43a4u
 fK5o7lahRa5zIMzQ=;
Received: from [27.111.83.178] (helo=mail.gtsys.com.hk)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kGxPr-005GOt-UM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Sep 2020 04:45:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 7FBEA2008B23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 12:20:18 +0800 (HKT)
X-Virus-Scanned: Debian amavisd-new at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRhiv9UJr0hb
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 12:20:18 +0800 (HKT)
Received: from s01.gtsys.com.hk (unknown [10.128.4.2])
 by mail.gtsys.com.hk (Postfix) with ESMTP id 5F4EA2009096
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 12:20:18 +0800 (HKT)
Received: from [10.128.2.32] (unknown [124.217.188.80])
 by s01.gtsys.com.hk (Postfix) with ESMTPSA id 3A4F7C019F4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Sep 2020 12:20:18 +0800 (HKT)
To: linux-f2fs-devel@lists.sourceforge.net
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
Message-ID: <b278baec-65df-312e-5d26-89dc1ea25c86@gtsys.com.hk>
Date: Sat, 12 Sep 2020 12:20:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1kGxPr-005GOt-UM
Subject: [f2fs-dev] F2fs failed on fresh installation 1st boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

we encounter random crash on new installed partition at
first boot.
Kernel: 4.9.235
Kernel: 5.4.64 (blow)
f2fs-tools: 1.4.0

[    1.520829] mmc1: new DDR MMC card at address 0001 
 

[    1.526223] mmcblk1: mmc1:0001 DG4008 7.28 GiB 
 

[    1.531037] mmcblk1boot0: mmc1:0001 DG4008 partition 1 4.00 MiB 
 

[    1.537244] mmcblk1boot1: mmc1:0001 DG4008 partition 2 4.00 MiB 
 

[    1.543416] mmcblk1rpmb: mmc1:0001 DG4008 partition 3 4.00 MiB, chardev 
(247:0) 

[    1.554445]  mmcblk1: p1 p2 
 

[    1.572323] F2FS-fs (mmcblk1p2): Mismatch valid blocks 512 vs. 508 
 

[    1.578552] F2FS-fs (mmcblk1p2): Failed to initialize F2FS segment manager 
(-117) 

[    1.586374] VFS: Cannot open root device "mmcblk1p2" or unknown-block(179,2): 
error -117 

[    1.594496] Please append a correct "root=" boot option; here are the 
available partitions:

I reboot into the installation SDCard and run the fsck.f2fs with no errors

root@ba81ba8b6125:~# fsck.f2fs /dev/mmcblk1p2
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 7520000 (3671 MB)
Info: MKFS version
   "Linux version 5.4.64 (xxx) (gcc version 8.3.0 (Debian 8.3.0-2)) #74 SMP Sat 
Sep 12 10:56:24 HKT 2020"
Info: FSCK version
   from "Linux version 5.4.64 (xxx) (gcc version 8.3.0 (Debian 8.3.0-2)) #74 SMP 
Sat Sep 12 10:56:24 HKT 2020"
     to "Linux version 5.4.64 (xxx) (gcc version 8.3.0 (Debian 8.3.0-2)) #74 SMP 
Sat Sep 12 10:56:24 HKT 2020"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 7520000 (3671 MB)
Info: CKPT version = 14f987b7
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 1c5 :  trimmed nat_bits crc compacted_summary unmount

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x7]
[FSCK] valid_block_count matching with CP             [Ok..] [0x1c29f]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x596b]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x596b]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x5953]
[FSCK] free segment_count matched with CP             [Ok..] [0x625]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 5.592724 secs

Regards
Chris


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
