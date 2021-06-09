Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6363A159A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jun 2021 15:28:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqyGE-0007NB-VA; Wed, 09 Jun 2021 13:28:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqyGE-0007Mz-BI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 13:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nqVroR6HUDweC62Gp/xY4HG5pcPRKzXGmHiyipduxd4=; b=W8QiMIIZ0YkHf6Yfke4cpkC3RC
 ne/rHZwJS6+rhXG/w9MbuC+apfHHkIryhcR0/O7A6j4eWxSt74Rb0xKKlKGQyyb02SpTtER0ipFt9
 QLS4tQXcPQYQazZQcvKY7GUkUNjR5Gv4C5kmjJJthBTG1uyKqKk7LQr1ObK1hXybO6so=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nqVroR6HUDweC62Gp/xY4HG5pcPRKzXGmHiyipduxd4=; b=UwgaYbydUyKQoy2ClqJ0zH2lNR
 L1EjW0BHtxwKxhOwLhN29Ef8PsLMWqlwuVXoYo3uV4PcaPbGymWA0gxzsgjaiLyoAdjHiHoP2WcLA
 bS/5ThIVUaDXBFP4TrXuKgiy6OEeh2bRWs30rNGGjRqCQeegm3ns8u4/pRBhBENQeXys=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqyG8-0005Ky-Lg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 13:28:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56070610A5;
 Wed,  9 Jun 2021 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623245316;
 bh=rtY5haFzcBEuStgYOgvTkytdqC3VQG32lfePv1AliDc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Faoo7ckCNehWVc5QfIMHxhTSaVrCED6HzyfRAhthm+I23F7S14kniLrGV3DVwrbTc
 OX1Pu4kHha0uJtSdhBiT1MUV/J76Ha/IX+JRbgJtKrVP0s+k7UQXCEVykpMj6qzor6
 WH1Ot3ON9YqoZpAjLUItmebrnOKHOpST2p8NVQNjwv1/+vC5inqxIlhyltkVOcBsFX
 4AGpjE+wDevYpaKpdkyrmLq6Gb8xTJCx9aBHa+xfH20wz2pbhZLsHpA3iS5Ssek7Qy
 6GLy+q8VDSr7oEJxkEeccYZ75kP+U6weh2Pduf01qyEZx3Y3Ip2XvvUy0GV1wvB+Ox
 fNj/UAOw8NUyA==
To: Ju Hyung Park <qkrwngud825@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAD14+f3k7LB7w_XyfQGFRYDKbM9GoD8n7gos2URPjGrzeEEwUw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <ad9f3ec7-3b27-5722-ad25-ebb696bb1502@kernel.org>
Date: Wed, 9 Jun 2021 21:28:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAD14+f3k7LB7w_XyfQGFRYDKbM9GoD8n7gos2URPjGrzeEEwUw@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqyG8-0005Ky-Lg
Subject: Re: [f2fs-dev] Multiple fsck runs required to fix quota
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

Hi Ju Hyung,

Sorry for the delay.

On 2021/5/25 16:03, Ju Hyung Park wrote:
> Hi.
> 
> I'm reporting a possible issue with fsck requiring multiple runs to fix quota.
> 
> The fsck version is the latest master branch, statically compiled
> under arm64 flavor of Ubuntu and was executed under recovery mode.
> 
> First run:
> OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
> Info: Fix the reported corruption.
> Info: Force to fix corruption
> Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 4096
> Info: total sectors = 59463283 (232278 MB)
> Info: MKFS version
>    "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
> 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
> Info: FSCK version
>    from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> 2019"
>      to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> 2019"
> Info: superblock features = 80 :  quota_ino
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 59463283 (232278 MB)
> Info: CKPT version = 5a6b3a3
> Info: checkpoint state = 45 :  crc compacted_summary unmount
> [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
> size 88064 does not match page offset 28
> [fsck_chk_quota_files:1880] Fixing Quota file ([  0] ino [0x4])
> [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
> size 160768 does not match page offset 53
> [fsck_chk_quota_files:1880] Fixing Quota file ([  1] ino [0x5])
> 
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x153c]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
> [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
> [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
> [FSCK] free segment_count matched with CP             [Ok..] [0xd395]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> Info: Duplicate valid checkpoint to mirror position 1024 -> 512
> Info: Write valid nat_bits in checkpoint
> Info: Write valid nat_bits in checkpoint
> 
> Done: 75.117901 secs
> 1|OnePlus7Pro:/ #
> 
> As you can see, the first run returns 1.
> 
> Second run:
> 1|OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
> Info: Fix the reported corruption.
> Info: Force to fix corruption
> Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 4096
> Info: total sectors = 59463283 (232278 MB)
> Info: MKFS version
>    "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
> 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
> Info: FSCK version
>    from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> 2019"
>      to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> 2019"
> Info: superblock features = 80 :  quota_ino
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 59463283 (232278 MB)
> Info: CKPT version = 5a6b3a3
> Info: Checked valid nat_bits in checkpoint
> Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
> [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
> size 88064 does not match page offset 28
> [ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
> size 159744 does not match page offset 53
> 
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x153c]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
> [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
> [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
> [FSCK] free segment_count matched with CP             [Ok..] [0xd395]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Ok..]
> 
> Done: 73.506501 secs
> OnePlus7Pro:/ #
> 
> We can see that it returns 0, but still prints "Quota inode # corrupted".

I doubt we didn't fix filesize of quota file at first fsck repair, not
sure this can fix this issue..., could you please have a try with it?

---
  fsck/quotaio_v2.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsck/quotaio_v2.c b/fsck/quotaio_v2.c
index 9353f85..c49ae3a 100644
--- a/fsck/quotaio_v2.c
+++ b/fsck/quotaio_v2.c
@@ -203,7 +203,8 @@ static int v2_init_io(struct quota_handle *h, enum quota_type qtype)
  			h->qh_qf.ino,
  			filesize,
  			last_blkofs);
-		filesize = (last_blkofs + 1) << F2FS_BLKSIZE_BITS;
+		filesize = qf->filesize =
+				(last_blkofs + 1) << F2FS_BLKSIZE_BITS;
  		f2fs_filesize_update(qf->sbi, qf->ino, filesize);
  	}

-- 
2.22.1

Thanks,

> 
> Third run:
> OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
> Info: Fix the reported corruption.
> Info: Force to fix corruption
> Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 4096
> Info: total sectors = 59463283 (232278 MB)
> Info: MKFS version
>    "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
> 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
> Info: FSCK version
>    from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> 2019"
>      to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
> version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
> 2019"
> Info: superblock features = 80 :  quota_ino
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 59463283 (232278 MB)
> Info: CKPT version = 5a6b3a3
> Info: Checked valid nat_bits in checkpoint
> Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
> 
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x153c]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
> [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
> [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
> [FSCK] free segment_count matched with CP             [Ok..] [0xd395]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Ok..]
> 
> Done: 68.652988 secs
> 
> Thanks.
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
