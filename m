Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C106EE6EF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2019 19:09:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRgn4-0003AX-4X; Mon, 04 Nov 2019 18:09:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iRgn3-0003AM-GG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Nov 2019 18:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jeiJw8mxJF75zPFysnvqgQ/qFEbHUjyLjXsX0z8e/TI=; b=HC1UQUcMpD72Azif5RhWD5waS9
 yk+MNYdWrdZAw2i5vamkwOxO9SRU48ZTSEYs3NIKK4ALgaV9sbmclHSG/apMccKRs5YTwHHDqZvdJ
 EPgQwQkLADAVlYL16Vw248RlkHJgPX4jyTThEg7CdHqw6EHRNBsKMpbJgfU2JgGgd5jw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jeiJw8mxJF75zPFysnvqgQ/qFEbHUjyLjXsX0z8e/TI=; b=K
 MeLQt+d/lLWMDC43LFG9cTBC2DfDr57+EJwDxRBnTtbN6HlIdHILNOopXmjCiiaboO9w2CV4Xa1op
 MjLK7s3ELsntZDdNtOnSoEYDfRNZp/NeYEhRTJUOhN+YwHsPdIua6/6VFG58JAoQykihtuukt7V+8
 DbULjlJuXTTf8SYI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRgmz-00HTC0-BO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Nov 2019 18:09:21 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB3212080F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Nov 2019 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572890947;
 bh=huLwv8pZwgcTxi24LeHW3cRheAcG6zs0QI7ImAwPpAA=;
 h=Date:From:To:Subject:From;
 b=pX0AcFMRnSdF3UCdF3kt5v+ahEQVHND+0UiAWyTnMRS9PQv2gRtQHiVVEsYvN+IDe
 RkYnQ8C5uL6XYmPMUY0N+8CmvFHVlMW3RVUX06DZsAzfI2Be27RZmn3XD1dpNvpr6I
 fobjf7aIaCkk//Kd6PVnbibIwzj9+fsriMFSimtc=
Date: Mon, 4 Nov 2019 10:09:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20191104180904.GA215795@gmail.com>
Mail-Followup-To: linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 4.4 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -2.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRgmz-00HTC0-BO
Subject: [f2fs-dev] fsstress with RENAME_EXCHANGE causing filesystem
 corruption
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

RENAME_EXCHANGE support was just added to fsstress in xfstests:

	commit 65dfd40a97b6bbbd2a22538977bab355c5bc0f06
	Author: kaixuxia <xiakaixu1987@gmail.com>
	Date:   Thu Oct 31 14:41:48 2019 +0800

	    fsstress: add EXCHANGE renameat2 support

This is causing xfstest generic/579 to fail due to fsck.f2fs reporting errors.
I'm not sure what the problem is, but it still happens even with all the
fs-verity stuff in the test commented out, so that the test just runs fsstress.

generic/579 23s ... 	[10:02:25]
[    7.745370] run fstests generic/579 at 2019-11-04 10:02:25
_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
(see /results/f2fs/results-default/generic/579.full for details)
 [10:02:47]
Ran: generic/579
Failures: generic/579
Failed 1 of 1 tests
Xunit report: /results/f2fs/results-default/result.xml


Here's the contents of 579.full:

	F2FS-tools: mkfs.f2fs Ver: 1.13.0 (2019-11-01)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is enabled
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 10485760 (5120 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 5.4.0-rc6 (gcc version 8.3.0 (Debian 8.3.0-6)) #4 SMP Mon Nov 4 09:53:26 PST 2019"
Info: [/dev/vdc] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: This device doesn't support BLKDISCARD
Info: Overprovision ratio = 2.810%
Info: Overprovision segments = 148 (GC reserved = 79)
Info: format successful

	F2FS-tools: mkfs.f2fs Ver: 1.13.0 (2019-11-01)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is enabled
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 10485760 (5120 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 5.4.0-rc6 (gcc version 8.3.0 (Debian 8.3.0-6)) #4 SMP Mon Nov 4 09:53:26 PST 2019"
Info: [/dev/vdc] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: This device doesn't support BLKDISCARD
Info: Overprovision ratio = 2.810%
Info: Overprovision segments = 148 (GC reserved = 79)
Info: format successful
seed = 1573262300
_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
*** fsck.f2fs output ***
fsck from util-linux 2.33.1
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 10485760 (5120 MB)
Info: MKFS version
  "Linux version 5.4.0-rc6 (gcc version 8.3.0 (Debian 8.3.0-6)) #4 SMP Mon Nov 4 09:53:26 PST 2019"
Info: FSCK version
  from "Linux version 5.4.0-rc6 (gcc version 8.3.0 (Debian 8.3.0-6)) #4 SMP Mon Nov 4 09:53:26 PST 2019"
    to "Linux version 5.4.0-rc6 (gcc version 8.3.0 (Debian 8.3.0-6)) #4 SMP Mon Nov 4 09:53:26 PST 2019"
Info: superblock features = 400 :  verity
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 10485760 (5120 MB)
Info: CKPT version = 56bc55fa
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = c5 :  nat_bits crc compacted_summary unmount
[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0xd10]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x239] for '..', parent parent ino is [0x4f5]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x64] for '..', parent parent ino is [0x107]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3c5] for '..', parent parent ino is [0x22f]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x236] for '..', parent parent ino is [0x249]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x728] for '..', parent parent ino is [0xad3]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3c5] for '..', parent parent ino is [0x5b2]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7f4] for '..', parent parent ino is [0x348]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x248] for '..', parent parent ino is [0x34e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa3f] for '..', parent parent ino is [0x2a1]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2a1] for '..', parent parent ino is [0xa3f]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x707] for '..', parent parent ino is [0x781]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x8f1] for '..', parent parent ino is [0x841]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3c5] for '..', parent parent ino is [0x41b]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0x6c2]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4c5] for '..', parent parent ino is [0x7ca]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x500] for '..', parent parent ino is [0xa30]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x15c] for '..', parent parent ino is [0xad3]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb9] for '..', parent parent ino is [0x346]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x10c] for '..', parent parent ino is [0x919]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x30a] for '..', parent parent ino is [0x1af]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4bf] for '..', parent parent ino is [0x86f]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x807] for '..', parent parent ino is [0x519]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x89a] for '..', parent parent ino is [0x1542]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xd10] for '..', parent parent ino is [0x1af]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x42a] for '..', parent parent ino is [0x64]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x107] for '..', parent parent ino is [0x24]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x266] for '..', parent parent ino is [0x195]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x107] for '..', parent parent ino is [0x64]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x6b] for '..', parent parent ino is [0x64]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4f5] for '..', parent parent ino is [0x239]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x195] for '..', parent parent ino is [0x353]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa3] for '..', parent parent ino is [0x8a7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x195] for '..', parent parent ino is [0x222]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa30] for '..', parent parent ino is [0x427]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1c1] for '..', parent parent ino is [0x9a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa30] for '..', parent parent ino is [0x500]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x152e] for '..', parent parent ino is [0xbee]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xd72] for '..', parent parent ino is [0x42a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xad3] for '..', parent parent ino is [0x15c]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x781] for '..', parent parent ino is [0x707]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xad3] for '..', parent parent ino is [0x728]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x9a] for '..', parent parent ino is [0xa34]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x9a] for '..', parent parent ino is [0x926]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x9a] for '..', parent parent ino is [0x266]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x222] for '..', parent parent ino is [0x195]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x823] for '..', parent parent ino is [0x195]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x841] for '..', parent parent ino is [0x8f1]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x240] for '..', parent parent ino is [0xb43]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa2] for '..', parent parent ino is [0x43d]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x427] for '..', parent parent ino is [0xd3d]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x42a] for '..', parent parent ino is [0xd72]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x346] for '..', parent parent ino is [0x240]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xbee] for '..', parent parent ino is [0x152e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0x1b2]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xd3d] for '..', parent parent ino is [0xdc2]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x353] for '..', parent parent ino is [0x9a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x9a6] for '..', parent parent ino is [0x7ca]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x621] for '..', parent parent ino is [0x7ca]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xe7b] for '..', parent parent ino is [0x401]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x519] for '..', parent parent ino is [0x807]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7ca] for '..', parent parent ino is [0x621]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7ca] for '..', parent parent ino is [0x195]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x6a8] for '..', parent parent ino is [0xfc6]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7ca] for '..', parent parent ino is [0x4c5]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb43] for '..', parent parent ino is [0x240]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x86f] for '..', parent parent ino is [0x4bf]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1542] for '..', parent parent ino is [0x89a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xdc2] for '..', parent parent ino is [0x34e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7ca] for '..', parent parent ino is [0x9a6]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x41b] for '..', parent parent ino is [0x365]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xfc6] for '..', parent parent ino is [0x34e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x919] for '..', parent parent ino is [0x10c]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1af] for '..', parent parent ino is [0x30a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x355] for '..', parent parent ino is [0x195]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x401] for '..', parent parent ino is [0xe7b]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1af] for '..', parent parent ino is [0x248]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x5b2] for '..', parent parent ino is [0x3c5]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x34e] for '..', parent parent ino is [0xa30]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x34e] for '..', parent parent ino is [0x6a8]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x8a7] for '..', parent parent ino is [0xa3]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb] for '..', parent parent ino is [0xcde]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb] for '..', parent parent ino is [0x13]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x20] for '..', parent parent ino is [0xdd7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x20] for '..', parent parent ino is [0x391]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x28c] for '..', parent parent ino is [0x7d6]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xd2e] for '..', parent parent ino is [0x47d]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb1a] for '..', parent parent ino is [0x36e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb1a] for '..', parent parent ino is [0xbc4]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3ed] for '..', parent parent ino is [0x1b7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x202] for '..', parent parent ino is [0x19a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3bf] for '..', parent parent ino is [0x2df]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x36e] for '..', parent parent ino is [0xb1a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xbc4] for '..', parent parent ino is [0xb1a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xc47] for '..', parent parent ino is [0x2e1]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xbe] for '..', parent parent ino is [0x145]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x13] for '..', parent parent ino is [0x94]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2e4] for '..', parent parent ino is [0x68d]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x97a] for '..', parent parent ino is [0x7cd]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x13] for '..', parent parent ino is [0x31e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x72a] for '..', parent parent ino is [0xf2]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x94] for '..', parent parent ino is [0x337]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x133c] for '..', parent parent ino is [0x120e]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xdd7] for '..', parent parent ino is [0x20]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x108] for '..', parent parent ino is [0xb]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x5ac] for '..', parent parent ino is [0x5da]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x108] for '..', parent parent ino is [0x34d]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2b] for '..', parent parent ino is [0x133c]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x32f] for '..', parent parent ino is [0x2ee]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x478] for '..', parent parent ino is [0xa9]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7cd] for '..', parent parent ino is [0x97a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x82f] for '..', parent parent ino is [0x584]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2df] for '..', parent parent ino is [0x1b7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xaa3] for '..', parent parent ino is [0x78b]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x183] for '..', parent parent ino is [0x468]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x207] for '..', parent parent ino is [0x4c9]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x5c9] for '..', parent parent ino is [0x9be]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xc3] for '..', parent parent ino is [0x35]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xcde] for '..', parent parent ino is [0x53]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x8a] for '..', parent parent ino is [0x21b]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2e6] for '..', parent parent ino is [0xa55]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2e6] for '..', parent parent ino is [0x911]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3c1] for '..', parent parent ino is [0xc3]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x468] for '..', parent parent ino is [0x207]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x21c] for '..', parent parent ino is [0xf2]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x5da] for '..', parent parent ino is [0x5ac]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x937] for '..', parent parent ino is [0x4a7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x120e] for '..', parent parent ino is [0x2b]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x391] for '..', parent parent ino is [0x20]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x86a] for '..', parent parent ino is [0x911]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x37a] for '..', parent parent ino is [0x337]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x32] for '..', parent parent ino is [0x2e4]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x584] for '..', parent parent ino is [0x82f]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x584] for '..', parent parent ino is [0x626]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x38e] for '..', parent parent ino is [0x47d]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xc7] for '..', parent parent ino is [0x4eb]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xc7] for '..', parent parent ino is [0xa57]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x34d] for '..', parent parent ino is [0x108]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa9] for '..', parent parent ino is [0x478]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x68d] for '..', parent parent ino is [0x2e4]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xc7] for '..', parent parent ino is [0x6ca]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x78b] for '..', parent parent ino is [0xaa3]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x337] for '..', parent parent ino is [0x37a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x454] for '..', parent parent ino is [0xa8]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa57] for '..', parent parent ino is [0x3d7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1b7] for '..', parent parent ino is [0x3ed]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1b7] for '..', parent parent ino is [0x3bf]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x1b7] for '..', parent parent ino is [0x554]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3d7] for '..', parent parent ino is [0xc7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4b3] for '..', parent parent ino is [0x876]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x21c] for '..', parent parent ino is [0x20b]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x468] for '..', parent parent ino is [0x183]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x5a4] for '..', parent parent ino is [0x2e4]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x535] for '..', parent parent ino is [0x5ac]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x147] for '..', parent parent ino is [0x454]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x147] for '..', parent parent ino is [0xcb]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x35] for '..', parent parent ino is [0x3c1]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4eb] for '..', parent parent ino is [0x147]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xcf] for '..', parent parent ino is [0x2e1]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x481] for '..', parent parent ino is [0x32]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3c] for '..', parent parent ino is [0x183]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x3c] for '..', parent parent ino is [0x1a7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x626] for '..', parent parent ino is [0x584]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x9be] for '..', parent parent ino is [0x5c9]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa8d] for '..', parent parent ino is [0x8fd]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa8d] for '..', parent parent ino is [0xa5]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xf2] for '..', parent parent ino is [0x72a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa55] for '..', parent parent ino is [0x2e6]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x7d6] for '..', parent parent ino is [0x94]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x225] for '..', parent parent ino is [0x2df]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x6ca] for '..', parent parent ino is [0xc7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x911] for '..', parent parent ino is [0x2e6]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x911] for '..', parent parent ino is [0x86a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x40a] for '..', parent parent ino is [0x8a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xa8] for '..', parent parent ino is [0x147]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4a7] for '..', parent parent ino is [0x937]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x4c9] for '..', parent parent ino is [0x207]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x8e] for '..', parent parent ino is [0x2af]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x2e1] for '..', parent parent ino is [0xc47]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x8e] for '..', parent parent ino is [0x20]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x554] for '..', parent parent ino is [0x1b7]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x876] for '..', parent parent ino is [0x4b3]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x145] for '..', parent parent ino is [0x21c]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x8e4] for '..', parent parent ino is [0x481]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x35] for '..', parent parent ino is [0x207]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x21b] for '..', parent parent ino is [0x40a]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0xb] for '..', parent parent ino is [0x108]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x31e] for '..', parent parent ino is [0xac]

[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x20b] for '..', parent parent ino is [0x21c]


[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0xc1]
[FSCK] valid_block_count matching with CP             [Ok..] [0x348e2]
[FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x1999]
[FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x1999]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x17b0]
[FSCK] free segment_count matched with CP             [Ok..] [0x862]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]
Do you want to fix this partition? [Y/N] [ASSERT] (main: 860) ret >= 0
*** end fsck.f2fs output
*** mount output ***
/dev/vda on / type ext4 (rw,noatime)
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,relatime)
devtmpfs on /dev type devtmpfs (rw,nosuid,size=1015756k,nr_inodes=253939,mode=755)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
cgroup2 on /sys/fs/cgroup/unified type cgroup2 (rw,nosuid,nodev,noexec,relatime,nsdelegate)
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,name=systemd)
mqueue on /dev/mqueue type mqueue (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
/dev/vdg on /results type ext4 (rw,relatime)
*** end mount output


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
