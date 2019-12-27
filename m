Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0312B113
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Dec 2019 05:52:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikhbt-0007dI-7R; Fri, 27 Dec 2019 04:52:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <youling257@gmail.com>) id 1ikhbs-0007d5-06
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Dec 2019 04:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xI/nKzUeklHWkW1U+9p/2/qAwXocRD991eeVvME9NI=; b=XMKpZ2MGSFHiUs36s4XwUAB+g
 dCVl66zkOBZUha8NyAuoeL7FKkMVrOWC82DPv4TNgA1GF4V38VstrG0Gyz7iUnNlrhmRiiRzKtzMB
 Ek185hJaUu19YRv3Mu0tS/JqN6BoPktgmwthRaqJuqkWaKbsoWscWtmL+sbBqwwYB5H7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+xI/nKzUeklHWkW1U+9p/2/qAwXocRD991eeVvME9NI=; b=T72JgqfIUFjZn88ycrnmmOOpQv
 b3WxWFiOGN+3YnR9XuAPzf7k2Z0C03GU3mbKdnK6WnqzahniQGVyczW9Bkx2JzTQubLe6xFCwkdd7
 18c23rSh5JDuPkBjORdcjEoQFRWr1jfkEbsKzpQVJpPWxkKZWyYpvw8hZj6ZJmhUsJZs=;
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ikhbn-00F0qn-6b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Dec 2019 04:52:23 +0000
Received: by mail-io1-f53.google.com with SMTP id c16so21273714ioo.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2019 20:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=+xI/nKzUeklHWkW1U+9p/2/qAwXocRD991eeVvME9NI=;
 b=hQTGSlwxES/sTVRpRdrEz4i/XSAt8E6EWUkfB3+AKg7q5B4hULX8W9mMbE6fvwKEQN
 5fgmhVdYGlQvUri/iZo4AzfGYYdnNetFnPmUz0q5ozxsNZ4E7eEpL9Z7RquZfVwj0L7+
 QLOAMizRx8Hq/0IXyGC1iR9vHrRJ++QU1Kf7kxi/W95GSzSGOXqgJLcnyYeZVu3Edien
 LmQDgyOsc/8FLfVjhh/iDcBWnoKmpvKxlEbnLovyHvBtX+79J/lRvq4MwVqUbRocJv8E
 x4HvgN6G3bIpIdTZuKSTXmF+HL64MAzIbfNBPYdR1AMukmrYR3HHIECzXvEPOpE7xDU+
 RRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=+xI/nKzUeklHWkW1U+9p/2/qAwXocRD991eeVvME9NI=;
 b=NivCBuyNIRoD1NjGZdQbhyDanYJfNqx4eaigB+4AjVaW//2DEd12t9uRKGGh2+P999
 RAWwlWpEjAtT8Y1+CrP+a/DUOu+htBQAHGt8qBUUBPoRcnnR8wweRbnPu7DFnE/sLXBy
 tBqcfJWbVXO+1OVtYbxS9pig/ABGP0ULX8BA4quQMp4Oijn5KgCzZ80Q0C/GJrjDiWQY
 /glH26n85NDt/Vsg2QcQZ7rXfq0pjelnte5npsqDC5aZ5n+IH9WXDx9+Ugn8l3CdVmmb
 yoJzmNajrCIrvF7egyqBPTj29wIzGe88WylgztFmg/G9c9ZueZXamjNnERb48g58030+
 V6MQ==
X-Gm-Message-State: APjAAAXqHBaUT3t8IUwg5hu7S3lvOjKTolXaXyk1nhoj0d7XWh2tAzpE
 rSi+DZMqiqmNnIP3BQiw1/fipaa+XOK3SwfujM6eenevZvg=
X-Google-Smtp-Source: APXvYqyemEvQ0AzYFcu/bRV7IMfXlX/sRS38yaUNZmHFzKka8or6vjjJa1BVXCPfZ/28FqknuCkBe68Xz3X8CdGYCKo=
X-Received: by 2002:a05:6602:2559:: with SMTP id
 j25mr32344992ioe.263.1577422333058; 
 Thu, 26 Dec 2019 20:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:9191:0:0:0:0:0 with HTTP; Thu, 26 Dec 2019 20:52:12
 -0800 (PST)
In-Reply-To: <CAOzgRdYG7CBORRPuwW3_0def3ygRL_XvQG8qL_QEDXU4v1YMCQ@mail.gmail.com>
References: <CAOzgRdaNmLQLGmfoZZa42DhDVNLWRMkUtuMo2zy4UyOsThwQ7g@mail.gmail.com>
 <CAOzgRdYG7CBORRPuwW3_0def3ygRL_XvQG8qL_QEDXU4v1YMCQ@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Fri, 27 Dec 2019 12:52:12 +0800
Message-ID: <CAOzgRdbTLgM1wxA3OqoP2An5UzKQVsjSF5Cn5QcAGk9MPvQf=Q@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (youling257[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (youling257[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ikhbn-00F0qn-6b
Subject: Re: [f2fs-dev] The file system F2FS is broken
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

my f2fs partition broken when i used swap, now failed to read root inode.
i had dd it to f2fs.img, i can recovery some data by use photorec.
is possible fsck the broken f2fs.img?
is have a better way to recovery f2fs data?

2019-12-27 12:43 GMT+08:00, youling 257 <youling257@gmail.com>:
> android_x86:/ $ su
> android_x86:/ # fsck.f2fs -d 3 /data/1/f2fs.img
> Info: Debug level = 3
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 61077504 (29823 MB)
> Info: MKFS version
>   "Linux version 4.8.5 (root@youling257-ONDA-Tablet) (gcc version
> 6.2.1 20161215 (Ubuntu 6.2.1-7ubuntu1) ) #1 SMP PREEMPT Tue Jan 10
> 22:31:27 CST 2017"
> Info: FSCK version
>   from "Linux version 5.5.0-rc3-android-x86_64+ (root@localhost) (gcc
> version 9.2.1 20191130 (Ubuntu 9.2.1-22ubuntu1)) #1 SMP PREEMPT Thu
> Dec 26 02:31:56 CST 2019"
>     to "Linux version 5.5.0-rc3-android-x86_64+ (root@localhost) (gcc
> version 9.2.1 20191130 (Ubuntu 9.2.1-22ubuntu1)) #1 SMP PREEMPT Thu
> Dec 26 02:31:56 CST 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
>
> +--------------------------------------------------------+
> | Super block                                            |
> +--------------------------------------------------------+
> magic                                   [0xf2f52010 : 4076150800]
> major_ver                               [0x       1 : 1]
> volum_name                              [Android-x86]
> minor_ver                               [0x       7 : 7]
> log_sectorsize                          [0x       9 : 9]
> log_sectors_per_block                   [0x       3 : 3]
> log_blocksize                           [0x       c : 12]
> log_blocks_per_seg                      [0x       9 : 9]
> segs_per_sec                            [0x       1 : 1]
> secs_per_zone                           [0x       1 : 1]
> checksum_offset                         [0x       0 : 0]
> block_count                             [0x  747f00 : 7634688]
> section_count                           [0x    39db : 14811]
> segment_count                           [0x    3a3e : 14910]
> segment_count_ckpt                      [0x       2 : 2]
> segment_count_sit                       [0x       2 : 2]
> segment_count_nat                       [0x      42 : 66]
> segment_count_ssa                       [0x      1d : 29]
> segment_count_main                      [0x    39db : 14811]
> segment0_blkaddr                        [0x     200 : 512]
> cp_blkaddr                              [0x     200 : 512]
> sit_blkaddr                             [0x     600 : 1536]
> nat_blkaddr                             [0x     a00 : 2560]
> ssa_blkaddr                             [0x    8e00 : 36352]
> main_blkaddr                            [0x    c800 : 51200]
> root_ino                                [0x       3 : 3]
> node_ino                                [0x       1 : 1]
> meta_ino                                [0x       2 : 2]
> cp_payload                              [0x       0 : 0]
> crc                                     [0x       0 : 0]
> version                       Linux version 5.5.0-rc3-android-x86_64+
> (root@localhost) (gcc version 9.2.1 20191130 (Ubuntu 9.2.1-22ubuntu1))
> #1 SMP PREEMPT Thu Dec 26 02:31:56 CST 2019
> Info: total FS sectors = 61077504 (29823 MB)
> Info: CKPT version = 2626d37
>
> +--------------------------------------------------------+
> | Checkpoint                                             |
> +--------------------------------------------------------+
> checkpoint_ver                          [0x 2626d37 : 40004919]
> user_block_count                        [0x  70fc00 : 7404544]
> valid_block_count                       [0x      33 : 51]
> rsvd_segment_count                      [0x      b4 : 180]
> overprov_segment_count                  [0x     15d : 349]
> free_segment_count                      [0x    39cb : 14795]
> alloc_type[CURSEG_HOT_NODE]             [0x       0 : 0]
> alloc_type[CURSEG_WARM_NODE]            [0x       0 : 0]
> alloc_type[CURSEG_COLD_NODE]            [0x       1 : 1]
> cur_node_segno[0]                       [0x     5c1 : 1473]
> cur_node_segno[1]                       [0x     21d : 541]
> cur_node_segno[2]                       [0x    1994 : 6548]
> cur_node_blkoff[0]                      [0x      2b : 43]
> cur_node_blkoff[1]                      [0x     109 : 265]
> cur_node_blkoff[2]                      [0x      ea : 234]
> alloc_type[CURSEG_HOT_DATA]             [0x       0 : 0]
> alloc_type[CURSEG_WARM_DATA]            [0x       0 : 0]
> alloc_type[CURSEG_COLD_DATA]            [0x       1 : 1]
> cur_data_segno[0]                       [0x      e1 : 225]
> cur_data_segno[1]                       [0x    2b8e : 11150]
> cur_data_segno[2]                       [0x    2bd8 : 11224]
> cur_data_blkoff[0]                      [0x      42 : 66]
> cur_data_blkoff[1]                      [0x     1ea : 490]
> cur_data_blkoff[2]                      [0x      dd : 221]
> ckpt_flags                              [0x     283 : 643]
> cp_pack_total_block_count               [0x       9 : 9]
> cp_pack_start_sum                       [0x       2 : 2]
> valid_node_count                        [0x       d : 13]
> valid_inode_count                       [0x       d : 13]
> next_free_nid                           [0x  4fee96 : 5238422]
> sit_ver_bitmap_bytesize                 [0x      40 : 64]
> nat_ver_bitmap_bytesize                 [0x     840 : 2112]
> checksum_offset                         [0x     ffc : 4092]
> elapsed_time                            [0x30c98d5c5 : 13096244677]
> sit_nat_version_bitmap[0]               [0x      67 : 103]
>
>
> Info: Checked valid nat_bits in checkpoint
> [build_nat_area_bitmap:2881] ino[0x  4d4480] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4d4480] addr[0x          233999]
> ino[0x  4d4480]
> [build_nat_area_bitmap:2881] ino[0x  4d4481] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4d4481] addr[0x          3db57f]
> ino[0x  4d4481]
> [build_nat_area_bitmap:2881] ino[0x  4fdd45] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fdd45] addr[0x          2bf6c7]
> ino[0x  4fdd45]
> [build_nat_area_bitmap:2881] ino[0x  4fdd5b] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fdd5b] addr[0x          2bf6c8]
> ino[0x  4fdd5b]
> [build_nat_area_bitmap:2881] ino[0x  4fe1f6] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe1f6] addr[0x          2bf7f7]
> ino[0x  4fe1f6]
> [build_nat_area_bitmap:2881] ino[0x  4fe1f7] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe1f7] addr[0x          2af3f7]
> ino[0x  4fe1f7]
> [build_nat_area_bitmap:2881] ino[0x  4fe273] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe273] addr[0x          147c4b]
> ino[0x  4fe273]
> [build_nat_area_bitmap:2881] ino[0x  4fe296] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe296] addr[0x          147c9d]
> ino[0x  4fe296]
> [build_nat_area_bitmap:2881] ino[0x  4fe2a9] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe2a9] addr[0x          1f921e]
> ino[0x  4fe2a9]
> [build_nat_area_bitmap:2881] ino[0x  504b09] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504b09] addr[0x           983d2]
> ino[0x  504b09]
> [build_nat_area_bitmap:2881] ino[0x  504b9d] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504b9d] addr[0x           983d3]
> ino[0x  504b9d]
> [build_nat_area_bitmap:2881] ino[0x  504dc1] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504dc1] addr[0x          24bf11]
> ino[0x  504dc1]
> [build_nat_area_bitmap:2881] ino[0x  504ff9] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504ff9] addr[0x          2af3fc]
> ino[0x  504ff9]
> [build_nat_area_bitmap:2940] valid nat entries (block_addr != 0x0) [0x
>       d : 13]
> [build_sit_area_bitmap:2262] Blocks [0x33 : 51] Free Segs [0x39cb : 14795]
>
> Info: checkpoint state = 283 :  allow_nocrc nat_bits orphan_inodes unmount
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fdd45]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fdd45 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fdd5b]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fdd5b [protect_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe1f6]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe1f6 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe273]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe273 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe296]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe296 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe2a9]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe2a9 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504dc1]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504dc1 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504ff9]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504ff9 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe1f7]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe1f7 [protect_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504b09]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504b09 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504b9d]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504b9d [protect_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4d4481]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4d4481 [flog.mmap3] i_blocks: 39
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4d4480]
> [fsck_chk_inode_blk: 832] ino[0x4d4480] has inline dentry!
> [fsck_chk_inline_dentries:1601] [  1] Inline Dentry Block Done :
> dentries:0 in 182 slots (len:255)
>
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4d4480 [flog] i_blocks: 1
>
> [ASSERT] (sanity_check_nid: 392)  --> nid[0x3] ino is 0
>
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x33]
> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0xd]
> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0xd]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0xd]
> [FSCK] free segment_count matched with CP             [Ok..] [0x39cb]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> Do you want to fix this partition? [Y/N] y
> Info: MKFS version
>   "Linux version 4.8.5 (root@youling257-ONDA-Tablet) (gcc version
> 6.2.1 20161215 (Ubuntu 6.2.1-7ubuntu1) ) #1 SMP PREEMPT Tue Jan 10
> 22:31:27 CST 2017"
> Info: FSCK version
>   from "Linux version 5.5.0-rc3-android-x86_64+ (root@localhost) (gcc
> version 9.2.1 20191130 (Ubuntu 9.2.1-22ubuntu1)) #1 SMP PREEMPT Thu
> Dec 26 02:31:56 CST 2019"
>     to "Linux version 5.5.0-rc3-android-x86_64+ (root@localhost) (gcc
> version 9.2.1 20191130 (Ubuntu 9.2.1-22ubuntu1)) #1 SMP PREEMPT Thu
> Dec 26 02:31:56 CST 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
>
> +--------------------------------------------------------+
> | Super block                                            |
> +--------------------------------------------------------+
> magic                                   [0xf2f52010 : 4076150800]
> major_ver                               [0x       1 : 1]
> volum_name                              [Android-x86]
> minor_ver                               [0x       7 : 7]
> log_sectorsize                          [0x       9 : 9]
> log_sectors_per_block                   [0x       3 : 3]
> log_blocksize                           [0x       c : 12]
> log_blocks_per_seg                      [0x       9 : 9]
> segs_per_sec                            [0x       1 : 1]
> secs_per_zone                           [0x       1 : 1]
> checksum_offset                         [0x       0 : 0]
> block_count                             [0x  747f00 : 7634688]
> section_count                           [0x    39db : 14811]
> segment_count                           [0x    3a3e : 14910]
> segment_count_ckpt                      [0x       2 : 2]
> segment_count_sit                       [0x       2 : 2]
> segment_count_nat                       [0x      42 : 66]
> segment_count_ssa                       [0x      1d : 29]
> segment_count_main                      [0x    39db : 14811]
> segment0_blkaddr                        [0x     200 : 512]
> cp_blkaddr                              [0x     200 : 512]
> sit_blkaddr                             [0x     600 : 1536]
> nat_blkaddr                             [0x     a00 : 2560]
> ssa_blkaddr                             [0x    8e00 : 36352]
> main_blkaddr                            [0x    c800 : 51200]
> root_ino                                [0x       3 : 3]
> node_ino                                [0x       1 : 1]
> meta_ino                                [0x       2 : 2]
> cp_payload                              [0x       0 : 0]
> crc                                     [0x       0 : 0]
> version                       Linux version 5.5.0-rc3-android-x86_64+
> (root@localhost) (gcc version 9.2.1 20191130 (Ubuntu 9.2.1-22ubuntu1))
> #1 SMP PREEMPT Thu Dec 26 02:31:56 CST 2019
> Info: total FS sectors = 61077504 (29823 MB)
> Info: CKPT version = 2626d37
>
> +--------------------------------------------------------+
> | Checkpoint                                             |
> +--------------------------------------------------------+
> checkpoint_ver                          [0x 2626d37 : 40004919]
> user_block_count                        [0x  70fc00 : 7404544]
> valid_block_count                       [0x      33 : 51]
> rsvd_segment_count                      [0x      b4 : 180]
> overprov_segment_count                  [0x     15d : 349]
> free_segment_count                      [0x    39cb : 14795]
> alloc_type[CURSEG_HOT_NODE]             [0x       0 : 0]
> alloc_type[CURSEG_WARM_NODE]            [0x       0 : 0]
> alloc_type[CURSEG_COLD_NODE]            [0x       1 : 1]
> cur_node_segno[0]                       [0x     5c1 : 1473]
> cur_node_segno[1]                       [0x     21d : 541]
> cur_node_segno[2]                       [0x    1994 : 6548]
> cur_node_blkoff[0]                      [0x      2b : 43]
> cur_node_blkoff[1]                      [0x     109 : 265]
> cur_node_blkoff[2]                      [0x      ea : 234]
> alloc_type[CURSEG_HOT_DATA]             [0x       0 : 0]
> alloc_type[CURSEG_WARM_DATA]            [0x       0 : 0]
> alloc_type[CURSEG_COLD_DATA]            [0x       1 : 1]
> cur_data_segno[0]                       [0x      e1 : 225]
> cur_data_segno[1]                       [0x    2b8e : 11150]
> cur_data_segno[2]                       [0x    2bd8 : 11224]
> cur_data_blkoff[0]                      [0x      42 : 66]
> cur_data_blkoff[1]                      [0x     1ea : 490]
> cur_data_blkoff[2]                      [0x      dd : 221]
> ckpt_flags                              [0x     283 : 643]
> cp_pack_total_block_count               [0x       9 : 9]
> cp_pack_start_sum                       [0x       2 : 2]
> valid_node_count                        [0x       d : 13]
> valid_inode_count                       [0x       d : 13]
> next_free_nid                           [0x  4fee96 : 5238422]
> sit_ver_bitmap_bytesize                 [0x      40 : 64]
> nat_ver_bitmap_bytesize                 [0x     840 : 2112]
> checksum_offset                         [0x     ffc : 4092]
> elapsed_time                            [0x30c98d5c5 : 13096244677]
> sit_nat_version_bitmap[0]               [0x      67 : 103]
>
>
> Info: Checked valid nat_bits in checkpoint
> [build_nat_area_bitmap:2881] ino[0x  4d4480] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4d4480] addr[0x          233999]
> ino[0x  4d4480]
> [build_nat_area_bitmap:2881] ino[0x  4d4481] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4d4481] addr[0x          3db57f]
> ino[0x  4d4481]
> [build_nat_area_bitmap:2881] ino[0x  4fdd45] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fdd45] addr[0x          2bf6c7]
> ino[0x  4fdd45]
> [build_nat_area_bitmap:2881] ino[0x  4fdd5b] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fdd5b] addr[0x          2bf6c8]
> ino[0x  4fdd5b]
> [build_nat_area_bitmap:2881] ino[0x  4fe1f6] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe1f6] addr[0x          2bf7f7]
> ino[0x  4fe1f6]
> [build_nat_area_bitmap:2881] ino[0x  4fe1f7] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe1f7] addr[0x          2af3f7]
> ino[0x  4fe1f7]
> [build_nat_area_bitmap:2881] ino[0x  4fe273] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe273] addr[0x          147c4b]
> ino[0x  4fe273]
> [build_nat_area_bitmap:2881] ino[0x  4fe296] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe296] addr[0x          147c9d]
> ino[0x  4fe296]
> [build_nat_area_bitmap:2881] ino[0x  4fe2a9] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  4fe2a9] addr[0x          1f921e]
> ino[0x  4fe2a9]
> [build_nat_area_bitmap:2881] ino[0x  504b09] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504b09] addr[0x           983d2]
> ino[0x  504b09]
> [build_nat_area_bitmap:2881] ino[0x  504b9d] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504b9d] addr[0x           983d3]
> ino[0x  504b9d]
> [build_nat_area_bitmap:2881] ino[0x  504dc1] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504dc1] addr[0x          24bf11]
> ino[0x  504dc1]
> [build_nat_area_bitmap:2881] ino[0x  504ff9] maybe is inode
> [build_nat_area_bitmap:2895] nid[0x  504ff9] addr[0x          2af3fc]
> ino[0x  504ff9]
> [build_nat_area_bitmap:2940] valid nat entries (block_addr != 0x0) [0x
>       d : 13]
> [build_sit_area_bitmap:2262] Blocks [0x33 : 51] Free Segs [0x39cb : 14795]
>
> Info: checkpoint state = 283 :  allow_nocrc nat_bits orphan_inodes unmount
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fdd45]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fdd45 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fdd5b]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fdd5b [protect_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe1f6]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe1f6 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe273]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe273 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe296]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe296 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe2a9]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe2a9 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504dc1]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504dc1 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504ff9]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504ff9 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4fe1f7]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4fe1f7 [protect_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504b09]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504b09 [stat_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x504b9d]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x504b9d [protect_path] i_blocks: 1
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4d4481]
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4d4481 [flog.mmap3] i_blocks: 39
>
> [fsck_chk_orphan_node:1720] [  0] ino [0x4d4480]
> [fsck_chk_inode_blk: 832] ino[0x4d4480] has inline dentry!
> [fsck_chk_inline_dentries:1601] [  1] Inline Dentry Block Done :
> dentries:0 in 182 slots (len:255)
>
> [fsck_chk_inode_blk: 969] Orphan Inode: 0x4d4480 [flog] i_blocks: 1
>
> [ASSERT] (sanity_check_nid: 392)  --> nid[0x3] ino is 0
>
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x33]
> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0xd]
> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0xd]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0xd]
> [FSCK] free segment_count matched with CP             [Ok..] [0x39cb]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> Info: Duplicate valid checkpoint to mirror position 512 -> 1024
> [write_nat_bits:1364]   Writing NAT bits pages, at offset 0x000003fe
> Info: Write valid nat_bits in checkpoint
>
> Done: 1.373784 secs
> android_x86:/ #
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
