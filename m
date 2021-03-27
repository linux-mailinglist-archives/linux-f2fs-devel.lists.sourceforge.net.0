Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9E34B6FF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Mar 2021 13:03:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQ7f1-0003Ig-P7; Sat, 27 Mar 2021 12:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <nroycea@gmail.com>) id 1lQ7ez-0003IX-JO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Mar 2021 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IzQM5Hh30DD2AwhtpeKJY2l+9DTQDgsr42axhXUjOvk=; b=UAgjLlNW8pwTJ7jPRJ6I1//Nr1
 jmY3Po/r9Ai8++R6uQTsiTJBVbAw0PQCRO0LbteEaMnXqn4hEh2kdYnoVWuzBBYG376Zxvvg60W9f
 IeN94mY3DU20lX/pMbAldAi8D6/VVF8rMNM1dt7CkBYnFCxjhLtFRS2a3yTe8NZifAnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IzQM5Hh30DD2AwhtpeKJY2l+9DTQDgsr42axhXUjOvk=; b=HzJH4Avq1ClLUkZSi+NDP0pJvm
 Ye27y3uwccMYdp62OC8CK9TrPRriqSxD8/14VZXcIC8X7wsj16vo4T6jaYtoxyYcYvxMxmsILVTk1
 LGDDsWuYrZUCp63IBga0VNdykqQyGN1NBJrvVQvViEX9YuA6kHPj4P807YHETIyQU5O0=;
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lQ7el-000FD1-Lx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Mar 2021 12:03:20 +0000
Received: by mail-vk1-f176.google.com with SMTP id o4so1773494vka.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Mar 2021 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzQM5Hh30DD2AwhtpeKJY2l+9DTQDgsr42axhXUjOvk=;
 b=UGRcIW76gI0ab1Y1dfx/8eHmII2Cr7u4Vw1VWAjsUhJ5TwvCMFw/h/H//it7uVcdIz
 PilAMK7MBkBhOGV8tb1tzK2e7IxB293Zvr2r/T2hYYYOMAiQbHYr6tgbHPMsD4NYlaFC
 y0TILpaVmuI7ZGa9h4tdusQcXOLNzVq2ItLs6YiQOY3rF0VWoqRyGBYB0RFUxgZ8sgcm
 VfWeM+v5xF09F40LBEbPVQdHZ649tbip4C5gZrVctZbxELYVzSLH4XwpK2i+itVI7I3u
 cHAUUvUBSrqwGO2cxjiIMt3jPf/aPIxG4BU3DJyCfHhSkHTk7n3nVETaAb0iMU89kme6
 9BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzQM5Hh30DD2AwhtpeKJY2l+9DTQDgsr42axhXUjOvk=;
 b=LWWrKkPV1cfMs03m6FC+17bSAC6JIe6ZoMTWXJOzQ2BRp2bWOeGtE4LHqTD0oLuxQ1
 npCVNzaA4smwCGiaTtLYnNTI5rZhA6juI7zs2n5FW+Et9FjKAVIZn0EtuBs6pt4SSY3W
 chl5pNFKgEddf2XnmS9eTyj6dgf2Vzj6faWbEQKHcMYKzltVXPbq4HqrrMa+Rdls5kq4
 lGQ9g/g6SiC4QXiBrUl4l45XmP/dXSzAsBPnHUUKTW3lAIJtOAANzecwuaeQ7vmy94Xt
 rfYunBAs8fMp8zqFjr8u4oKLqSwFWhpUP0ABB4j2010kgCE7Af44om0E/zxaf/o1W0nZ
 tMdg==
X-Gm-Message-State: AOAM532xtygmcO2s1fWdT1eid6C1pIyWFAOSsm75Cx0fepp9eFkmX/zd
 FW7jKnDhXkHpShY34vZFxzEdXwXs1d/yQyZ9yBk=
X-Google-Smtp-Source: ABdhPJxm0/zGdPygb9H69QlGe8zYsQrdDBx6LVZ9DfGnLK6yBxuPmx95IHSW69fvw+vms77RUkwL1OlaRd/lDLtbnqY=
X-Received: by 2002:a1f:978e:: with SMTP id z136mr10676437vkd.17.1616846581593; 
 Sat, 27 Mar 2021 05:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <CALaQ_hosk7627nTx97+xSSsGiN-qt=pTGNW4DZn4TOcAeRSC8g@mail.gmail.com>
 <20200714000347.GA19314@google.com>
 <CALaQ_hriyvF8yaSihvGEN1U2jufCQ5sj=aknN+1xB=4EbkBWaQ@mail.gmail.com>
 <20200714055407.GA94278@google.com>
In-Reply-To: <20200714055407.GA94278@google.com>
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Sat, 27 Mar 2021 07:02:49 -0500
Message-ID: <CALaQ_hoviFQeBXODari+gzbBNkHCJk0u9Hqa3EzHksscrhKj1A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nroycea[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.176 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lQ7el-000FD1-Lx
Subject: Re: [f2fs-dev] F2FS Segmentation Fault
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
Cc: LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

An update, not quite 1 year later. I encountered another segfault issue.

It began with my email report to the linux-btrfs mailing list titled
"BTRFS Balance Hard System Crash (Blinking LEDs)" just the other day.

Essentially, I had run "btrfs balance" on my btrfs filesystem
drive/partition (not sd-card).
It looks like it had completed or was just about to complete when I
came back to my computer to find my keyboard numlock and scrolllock
leds were blinking.
The short of it was that I thought something about the "balance"
process caused the problem.

Then I encountered boot issues, and then when I was in, I later
encountered issues which dealt with my f2fs (sd-card), where programs
weren't being run because of libutils (glibc).

So I was forced to do another reboot and everything seemed fine until
I went to sleep and woke up again to blinking leds.
No btrfs process/action was being taken.

I spun up my KDE Neon sd-card, which I'm in right now and running a
btrfs scrub on my btrfs drive as I write this.
I also ran an fsck.f2fs on my sd-card (not kde-neon), and it got bad
right away...
*****
$ sudo fsck.f2fs -a /dev/mapper/lukssdi2
Info: Fix the reported corruption.
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 124168159 (60628 MB)
Info: MKFS version
  "Linux version 5.1.15.a-1-hardened (builduser@slave-1) (gcc version
9.1.0 (GCC)) #1 SMP PREEMPT Thu Jun 27 11:33:04 CEST 2019"
Info: FSCK version
  from "Linux version 5.7.4-dirty (nater@devx64) (gcc version 10.1.0
(GCC), GNU ld (GNU Binutils) 2.34.0) #2 SMP PREEMPT Sat Jun 20
14:10:44 CDT 2020"
    to "Linux version 5.4.0-66-generic (buildd@lgw01-amd64-039) (gcc
version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #74-Ubuntu SMP Wed Jan
27 22:54:38 UTC 2021"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 124168152 (60628 MB)
Info: CKPT version = 64ad7cd
Info: checkpoint state = 45 :  crc compacted_summary unmount
[ASSERT] (sanity_check_nid: 410)  --> nid[0x9e359]
footer.nid[0xf9c78d27] footer.ino[0xeb53d27e]
[FIX] (__chk_dentries:1458)  --> Unlink [0x9e359] - cmp.js len[0x6], type[0x1]
[ASSERT] (fsck_chk_inode_blk: 849)  --> ino: 0x9e337 has i_blocks:
4b6da06f35755b22, but has 1 blocks
[FIX] (fsck_chk_inode_blk: 855)  --> [0x9e337]
i_blocks=0x4b6da06f35755b22 -> 0x1
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xab5e5e15]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[438] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xf77f2dbc]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[439] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x54f59437]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[440] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb7e1860a]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[441] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2f705bf0]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[566] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x8d4d35fd]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[567] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x39b52875]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[568] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2199a4cb]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[569] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xe96a44d6]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[574] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x71027b6c]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[575] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x8b9ad104]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[576] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x7490f998]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[577] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xfa89d7d7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[610] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd4628485]]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[611] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x6824154e]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[612] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x6b50a940]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[613] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xc27ef23]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[782] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x6a5bbf49]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[783] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x7854aab6]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[784] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x64f4372e]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e30d] i_addr[785] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb14ed504]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3a6] i_addr[302] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x86a7fda5]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3a6] i_addr[303] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x989215c5]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3a6] i_addr[304] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x745044d2]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3a6] i_addr[305] = 0
[ASSERT] (__check_inode_mode: 371)  --> inode [0x9c798] mismatch
i_mode [0x1 vs. 0x15a3]
[FIX] (__chk_dentries:1458)  --> Unlink [0x9c798] - axios.js len[0x8], type[0x1]
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x68e77e8]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3d7] i_addr[22] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x33facbb]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3d7] i_addr[23] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd7859924]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3d7] i_addr[24] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x7b9854f8]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e3d7] i_addr[25] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x6226d630]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[266] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb1f9f056]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[267] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa69e1ca7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[268] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2d4c1a87]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[269] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2cc93801]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[318] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2caca0cd]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[319] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb04e26d7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[320] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x610ce9cf]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[321] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2db812e1]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[558] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x24241497]]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[559] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x598c6421]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[560] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x795adae8]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[561] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb838a973]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[606] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xde310dda]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[607] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xdc31adb2]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[608] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x475034e9]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[609] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x3f9d40a7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[766] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5a14583c]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[767] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5d008b8b]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[768] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa88d34f9]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[769] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x94e78459]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[838] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x6ff9a8fc]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[839] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xc177be50]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[840] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x4972dad4]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5e8] i_addr[841] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xca14c78c]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[338] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5955dbb3]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[339] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2ebcaeff]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[340] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x9c34d9c9]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[341] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x6e939c46]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[434] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xe85c355e]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[435] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa2f7d908]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[436] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2f2dd1e2]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[437] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x92c67341]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[574] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xe301b1c4]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[575] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xbe42214a]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[576] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xf1302262]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[577] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x9f0379c]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[734] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x9894bdcc]]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[735] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd22fb2d1]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[736] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xacf8ccf0]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5fd] i_addr[737] = 0
[ASSERT] (__chk_dots_dentries:1275)  --> Bad inode number[0x9e35c] for
'..', parent parent ino is [0xbc194d49]

[ASSERT] (fsck_chk_inode_blk: 866)  --> ino: 0x9e38d has i_namelen:
0xa4211fc, but has 4 characters for name
[FIX] (fsck_chk_inode_blk: 870)  --> [0x9e38d] i_namelen=0xa4211fc -> 0x4
[ASSERT] (__chk_dots_dentries:1275)  --> Bad inode number[0x9e35c] for
'..', parent parent ino is [0x18025d66]

[ASSERT] (fsck_chk_inode_blk: 866)  --> ino: 0x9e403 has i_namelen:
0x6b1a3cdf, but has 7 characters for name
[FIX] (fsck_chk_inode_blk: 870)  --> [0x9e403] i_namelen=0x6b1a3cdf -> 0x7
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xca8ac6d6]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[26] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x70481c27]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[27] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x96343e0f]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[28] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2c5f73c1]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[29] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x4843a092]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[286] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x22c91166]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[287] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xdb5063f7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[288] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xce43128]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[289] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x95b73f10]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[818] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xc96716c2]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[819] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x4f3e23a3]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[820] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xc8ac8076]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e53c] i_addr[821] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x3ff28034]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5dc] i_addr[498] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb86e79dc]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5dc] i_addr[499] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x71361046]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5dc] i_addr[500] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd47bcde3]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5dc] i_addr[501] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xbfd42c6d]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[166] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x1ce93cd5]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[167] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xeefa3f4a]]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[168] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x200f3d49]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[169] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x82570d2e]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[214] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x72d93f37]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[215] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x13bdb757]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[216] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x960cf5aa]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e640] i_addr[217] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xfab0eaed]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[94] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xfd229386]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[95] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x8c4e2c01]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[96] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x1451a3e9]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[97] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb7fec026]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[174] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5627f3a5]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[175] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xf680d8a1]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[176] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb141bcbc]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[177] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xbc525001]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[274] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb478c927]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[275] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xf8b92645]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[276] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x9ef2f47d]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[277] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xc326ba37]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[430] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x9d3f608d]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[431] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5fdd2bac]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[432] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5aa44e41]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[433] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xad6bc741]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[626] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xaead228]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[627] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa0cf522e]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[628] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xae5023d7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[629] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x96624f4a]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[634] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x182d3b99]]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[635] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xcd7ccf8]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[636] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xf95991d8]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e64f] i_addr[637] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x41237f1a]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[46] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd87ee4f3]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[47] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x3567468c]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[48] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xcc26a1d7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[49] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x20f4ac9e]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[386] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x3b8d3236]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[387] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2fe93339]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[388] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x28789efc]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[389] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xcc821607]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[522] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x30893a61]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[523] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xbe2722a]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[524] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x159e9e48]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[525] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x78e4920f]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[686] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x73389ea2]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[687] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x3323b2c3]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[688] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd442f672]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e654] i_addr[689] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x2ca0f966]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e4da] i_addr[602] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xccbd063d]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e4da] i_addr[603] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x4e9ed377]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e4da] i_addr[604] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xfcfcf807]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e4da] i_addr[605] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x21aaccdb]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e522] i_addr[94] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x835bca2d]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e522] i_addr[95] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa642be37]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e522] i_addr[96] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x500ebc2]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e522] i_addr[97] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xdb56d869]]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[686] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xc699ef86]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[687] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x8658571c]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[688] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x412c63d4]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[689] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd863961f]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[818] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x5da14266]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[819] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa3eb54c0]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[820] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xbe83ea55]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e54e] i_addr[821] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x38f048cf]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5d9] i_addr[42] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x1bb20aba]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5d9] i_addr[43] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x164914cd]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5d9] i_addr[44] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x18432b76]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5d9] i_addr[45] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xcfefd9c5]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e484] i_addr[366] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xd672fbb7]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e484] i_addr[367] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xa113bab3]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e484] i_addr[368] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x1af84de0]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e484] i_addr[369] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x147f77a5]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5b0] i_addr[30] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0xb8fb4384]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5b0] i_addr[31] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x7dc7364]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5b0] i_addr[32] = 0
[ASSERT] (fsck_chk_data_blk:1555)  --> blkaddress is not valid. [0x20350042]
[FIX] (fsck_chk_inode_blk: 788)  --> [0x9e5b0] i_addr[33] = 0
Segmentation fault
$ sudo fsck.f2fs -af /dev/mapper/lukssdi2
Info: Fix the reported corruption.
Info: Force to fix corruption
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 124168159 (60628 MB)
        Can't find a valid F2FS superblock at 0x0
        Mismatch segment0(3096048428) cp_blkaddr(24874649)
        Can't find a valid F2FS superblock at 0x1
*****
journal:
*****
Mar 27 06:22:07 neon kernel: Code: 41 f6 c1 04 75 53 4d 85 c9 74 0b 0f
b6 0f 88 0a 41 f6 c1 02 75 53 42 c6 04 0a 00 c3 0f 1f 44 00 00 48 8b
0f 4c 89 c6 48 89 0a <4a> 8b 4c 0f f8 48 8d 7a 08 48 83 e7 f8 4a 89 4c
0a f8 48 89 d1 48
Mar 27 06:22:07 neon kernel: fsck.f2fs[6302]: segfault at 5564d32978f5
ip 000055651c124919 sp 00007ffd202ff9f8 error 4 in
fsck.f2fs[55651c121000+1c000]
*****
This kde-neon kernel version is 5.4.0, and the associated tools
version is f2fs-tools-1.11.0.

There hasn't been any power-outage that I'm aware of.

With that segfault, I'm thinking that fs is now toast, and I need to
rebuild that arch-linux partition. At least /home was on btrfs which
is still accessible.

While I'm at it (scrubbing btrfs), I think I'll memtest my RAM and
badblocks my sd-card.

On Tue, Jul 14, 2020 at 12:54 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> On 07/13, Nathan Royce wrote:
> > On Mon, Jul 13, 2020 at 7:03 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > >
> > > Hi Nathan,
> > >
> > > Could you try to say "N" here to move forward to fix the corrupted metadata?
> > >
> > > Thanks,
> > *****
> > Do you want to restore lost files into ./lost_found/? [Y/N] N
...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
