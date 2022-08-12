Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 567EB590AF3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 06:13:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMM2l-0002zU-D2;
	Fri, 12 Aug 2022 04:13:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.kehayias@protonmail.com>) id 1oMM2k-0002zO-Rl
 for Linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 04:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:Reply-To:From:To:Date:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tgoAzT89Os5Fm7PUeK6RSRnYuRL/XMEIDNplAPvUgM=; b=X6hraf0J32hbdSGa2jXeB6OwBN
 tE731WnZ3YmaS1efYzYBod6JOZdKNgbib0UTbfYp+Qx/5Yj6Vcl99npx09BpO9/2mFCw2F/sDxNAR
 htjxfL+fBtpAbb823/9o335ect/l+YdqIT3sBtW4EyLsh3k+BDO1KSLZcDFVqNSo6ifU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:
 Reply-To:From:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5tgoAzT89Os5Fm7PUeK6RSRnYuRL/XMEIDNplAPvUgM=; b=L
 saEHsQzywjG3jMYYWj5YiaS5OqmtBpnZ5ygJVBkD6OSPgHbez5dsu9B1sJvUHcbHq5HpznDiAmoCL
 ezwnN7AeXYNQSqBinEsvqlzZTBvhRxmjM3o9GQoAnHDuVjqVV1SQ3tJoZ4g5FNrlIU6z4ebVZRgJV
 I3Q1dp8mYnPl9dwM=;
Received: from mail-40134.protonmail.ch ([185.70.40.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMM2i-00CgiK-B5
 for Linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 04:13:06 +0000
Date: Fri, 12 Aug 2022 04:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1660277576; x=1660536776;
 bh=5tgoAzT89Os5Fm7PUeK6RSRnYuRL/XMEIDNplAPvUgM=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=b7kMFvY4xjAcNnlJo0MLTh8P7b2uNm1rpmD8g7/k+nbf9rh1BZ8k3eY2PP7W0voHr
 ue4sBmlyFDiSf0SZpds6lwpJGHP9DDaedFPRMVAk11Ck3D/N8v0tgO0hVpOajWZhHs
 ioalitC2SK7HJ6nYN86SJxKKEFhfTXTczpgdn/AogQEdpEcRHzFLHXqHHH0lvJzuns
 wnkpwNfqnztQ5T4+KVIRMCWUSpF+cu0dV3KB4x9MzW22TfX4Xumh1EaBx7p5KyB6AL
 gBrqRvZGarqLdVvHYrqglihXHGVWv5ivfO0EeP6cpxOySx8zZIi4475XB+4gAb46m+
 /Nf89fJVWfbJA==
To: "Linux-f2fs-devel@lists.sourceforge.net"
 <Linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
Feedback-ID: 7805494:user:proton
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, Apologies if this is not the correct mailing list,
 but it was the only one I could find. I just resized an f2fs partition to
 the remaining free space on the disk. This seemed fine and resize.f2fs also
 seemed fine. However, the partition will no longer mount, due to this message:
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [john.kehayias[at]protonmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oMM2i-00CgiK-B5
Subject: [f2fs-dev] How to recover from "Wrong valid_user_blocks"?
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
From: John Kehayias via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Kehayias <john.kehayias@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

Apologies if this is not the correct mailing list, but it was the only one I could find.

I just resized an f2fs partition to the remaining free space on the disk. This seemed fine and resize.f2fs also seemed fine. However, the partition will no longer mount, due to this message:

Aug 12 00:10:09 localhost vmunix: [22056.879920] F2FS-fs (sdb2): invalid crc_offset: 0
Aug 12 00:10:09 localhost vmunix: [22056.881202] F2FS-fs (sdb2): Wrong valid_user_blocks: 7163307, user_block_count: 5227520
Aug 12 00:10:09 localhost vmunix: [22056.881206] F2FS-fs (sdb2): Failed to get valid F2FS checkpoint

Is there any way to fix this error?

I see this error reported before and supposedly fixed in current versions, though I had use f2fs-tools v1.14. I tried using 1.15 and from git, but resize reports nothing to do and fsck is successful. Here is that output:

Info: [/dev/sdb2] Disk Model: SD  Transcend   
Info: MKFS version
  "Linux version 5.5.2-arch1-1 (linux@archlinux) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Tue, 04 Feb 2020 18:56:18 +0000"
Info: FSCK version
  from "Linux version 5.18.14 (guix@guix) (gcc (GCC) 10.3.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT_DYNAMIC 1"
    to "Linux version 5.18.14 (guix@guix) (gcc (GCC) 10.3.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT_DYNAMIC 1"
Info: superblock features = 0 : 
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 124528600 (60804 MB)
	Invalid CP CRC offset: 0
Info: CKPT version = 6ea966da
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 81 :  nat_bits unmount
[FSCK] Check node 1 / 402988 (0.00%)
[FSCK] Check node 40299 / 402988 (10.00%)
[FSCK] Check node 80597 / 402988 (20.00%)
[FSCK] Check node 120895 / 402988 (30.00%)
[FSCK] Check node 161193 / 402988 (40.00%)
[FSCK] Check node 201491 / 402988 (50.00%)
[FSCK] Check node 241789 / 402988 (60.00%)
[FSCK] Check node 282087 / 402988 (70.00%)
[FSCK] Check node 322385 / 402988 (80.00%)
[FSCK] Check node 362683 / 402988 (90.00%)
[FSCK] Check node 402981 / 402988 (100.00%)

[FSCK] Max image size: 30099 MB, Free space: 16769654 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x474]
[FSCK] valid_block_count matching with CP             [Ok..] [0x6d4dab]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x6262c]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x6262c]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x61367]
[FSCK] free segment_count matched with CP             [Ok..] [0x3cc0]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 0.000000 secs
sudo fsck.f2fs /dev/sdb2  6.20s user 5.41s system 4% cpu 4:24.44 total

I hope someone can help. It seems to just be a metadata issue? Is there a way to manually fix the misreported block count to resolve this?

Thanks,
John


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
