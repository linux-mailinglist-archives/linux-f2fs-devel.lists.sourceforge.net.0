Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8AC7ED5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 03:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Cc:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:
	Message-Id:Date:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dwuLD3mdaV0sP3yoG7077jfG+pxmKe7Pe6MYQeE5v34=; b=kMYGZkeTQUo08GhbCmx0oOCxZT
	c6wtwq9dSF2RQN0K0nJxbdLgvxWSP0qirVs2oLNStgfJmmQHY+Wyb577bvAYv3oFDXgHSgn+Y8XcU
	apx/6HfBGqJoGJF2Iybv7Vnm16p6FZd3txBcJPI5UXZpbx/XA3PSTMF0GHidAdtxUAjw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNMm8-0005bJ-Jc;
	Mon, 24 Nov 2025 02:58:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNMm6-0005bB-6Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gc8ET2CsBrB222hVIlGdclpHYGMyHKw7vGMV4Slb+LA=; b=Mq5EzNehxC1yMm2jby3pBlngYf
 gt6Txmw3jXTs0raIRRcbz4/h2kFs+rebu6s7w1BIR9BKl1hej9/gpjhEckDq7qLS2s6zoQ3s8Kxyv
 lw4BJvYgP6ro8yAn+osl6LhGLD3CtQijOnOvHihOhjOIw50d1jbwmqrrzFEldARXWiwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gc8ET2CsBrB222hVIlGdclpHYGMyHKw7vGMV4Slb+LA=; b=g
 DVY+ytpKhyu+QSuQe4GKjQ5u+jFcvzOqrNpiMwVu8DhJA8yoFTRTddnQ2JVXYgibvNoyqUaGvVpYi
 gMLxW2hLW/BXqE3qLUzcRDsa1v5J12vBx7SQ+KK1jIaZEIR+lMYlEHy/Hl8DJ46/UT/zPTyLdNiCN
 kQiIKzx3Lji4cdpc=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNMm2-0002fB-RN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:58 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2980d9b7df5so47516895ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Nov 2025 18:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763953064; x=1764557864; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gc8ET2CsBrB222hVIlGdclpHYGMyHKw7vGMV4Slb+LA=;
 b=ZJR7kRrZsPn/zKtUuXepIXYlVXv8K/lr6b5tl+Mot01GFpMeXrPR5u098FW6MbZEwj
 XtQPWLZJ9A7lCkfMbP1xnL9dK9AToAcQhzxvJiaJRThckHjaGnHMQdX7s2obaYESsgHa
 uQ99tdzfda0sbIrdG8l/BOpjk24sfqcYTb9OtnL9AcGUNJXOKo86qDtQISUylhQPIZzM
 frC3CIyBk+OsAwLMTK814HSc2xRpYYZN1GEq5ZZA1r5/MRyh3kkhI5/CTWjOGbzHRvXa
 PPsq0zh1gA0+RZjPv33e9dhutBzIc6wMx77K/taVof5mK5eeg0BME8Bzk+Gmga90krub
 /BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763953064; x=1764557864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gc8ET2CsBrB222hVIlGdclpHYGMyHKw7vGMV4Slb+LA=;
 b=arb9pskdKKdnzUE4VwJFpCyDFq2oJpU/+x7sCz3Te02GSPIBwrgGyYOmgpFbb5HLMz
 PifetF6mqK6NHV9eIKO2VmdSv/hIq3haqQC6sL3YBpNG00vMJQL5+EBsbx9vYnYZrmEt
 SkqLGjUU5pUuP4LyNgWa9Qu57y2pgdl+Z3pGLTqqnjkWM/uqA8NQhhabZ6lptkvHQDV6
 rEt8nucW6WzWm8PtenD+GowM0MiQ0KvGD2v8jp2n4BWs4DVjPww+s2Q1tFYzKCTVVBtI
 lMJHB2d+lopamwDXCvAYcwINOXPXT6nPplF4LqH8LiEWk3sPPUUaH6bUnF+RrwMLlKqs
 lMQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpuXbFV2hWbZzwcX1/gaSpFRY/SVeqcNjxnLcvh2fDr5h4HNN9DTl84a/B/0iZm8jvfGAikPvs6DqomNYK8zy3@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy8nixZ4jn7WbjkCqK2mlVCbmYfne39pEwaPp3U05GKFkxG1dWj
 Z/r30oghVnDIJ7f2BwlZhxXUrZdlmM9XSNxMfkLOfD2d1XXuBRbntOeT
X-Gm-Gg: ASbGncsA+v58JOs9p+FLdYJySaHeuILIN6oVna3ybWXFvzfTxO+almiMvG1eoznLiJQ
 BhGg/cw+Pko4vKtsrNreGs2J+KerfHBILrcg6LNsW6xZusoxdKTfsMnSnI6396v5H5ok2oPsfmE
 J7OXH0ej9UIwz2mMPccJuYsN7DOFqJhYhkJnS7I1FxegKl+ZjGyy3jt24p1rW1dpEEyR/JHQMq1
 MrT3j2hAloPuoL/Jy8Gy1r5+hSjmYv9Cs3FY64GrWRtGgkYXi3+A5Qi2uxZDekx1npbPJ4sP2KB
 n4zwV/a6gfgysdsqcgbc46abpO4xdRV5kCSxI1s3Mnrb4dvtQHqVHXNMI5F6Sbetr+jgxG4Cyir
 3bQZa3fvBVwl5M22k4Q/ScgBOELHEPscSI9biJTHDCJJoTxTvhKBqpiI2yuOF2qY0TCq+wsYVrA
 S88aIP4XH16YRPf+S9LlAjlUwuZBqbTLhSCLblGy1skb81aYY=
X-Google-Smtp-Source: AGHT+IE8e0Q57y6aLcgeFe9e5crZtiiWAieYPzRL5uEOjxB/3yorjVq7hBNa186TgdVsivHlPLAriQ==
X-Received: by 2002:a05:7022:6729:b0:11b:9386:8263 with SMTP id
 a92af1059eb24-11c9d872430mr6570533c88.48.1763953063119; 
 Sun, 23 Nov 2025 18:57:43 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93e55af3sm68067847c88.7.2025.11.23.18.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 18:57:42 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Sun, 23 Nov 2025 18:57:32 -0800
Message-Id: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, __blkdev_issue_discard() only returns value 0, that makes
 post call error checking code dead. This patch series revmoes this dead code
 at all the call sites and adjust the callers. Please note that it doesn't
 change the return type of the function from int to void in this series, it
 will be done once this series gets merged smoothly. 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNMm2-0002fB-RN
Subject: [f2fs-dev] [PATCH V2 0/5] block: ignore __blkdev_issue_discard()
 ret value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, bpf@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============6550902404429778673=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============6550902404429778673==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi,

__blkdev_issue_discard() only returns value 0, that makes post call
error checking code dead. This patch series revmoes this dead code at
all the call sites and adjust the callers.

Please note that it doesn't change the return type of the function from
int to void in this series, it will be done once this series gets merged
smoothly.

For f2fs and xfs I've ran following test which includes discard
they produce same PASS and FAIL output with and without this patch
series [1].

  for-next (lblk-fnext)    discard-ret (lblk-discard)
  ---------------------    --------------------------
  FAIL f2fs/008            FAIL f2fs/008
  FAIL f2fs/014            FAIL f2fs/014
  FAIL f2fs/015            FAIL f2fs/015
  PASS f2fs/017            PASS f2fs/017
  PASS xfs/016             PASS xfs/016
  PASS xfs/288             PASS xfs/288
  PASS xfs/432             PASS xfs/432
  PASS xfs/449             PASS xfs/449
  PASS xfs/513             PASS xfs/513
  PASS generic/033         PASS generic/033
  PASS generic/038         PASS generic/038
  PASS generic/098         PASS generic/098
  PASS generic/224         PASS generic/224
  PASS generic/251         PASS generic/251
  PASS generic/260         PASS generic/260
  PASS generic/288         PASS generic/288
  PASS generic/351         PASS generic/351
  PASS generic/455         PASS generic/455
  PASS generic/457         PASS generic/457
  PASS generic/470         PASS generic/470
  PASS generic/482         PASS generic/482
  PASS generic/500         PASS generic/500
  PASS generic/537         PASS generic/537
  PASS generic/608         PASS generic/608
  PASS generic/619         PASS generic/619
  PASS generic/746         PASS generic/746
  PASS generic/757         PASS generic/757
 
For NVMeOF taret I've testing blktest with nvme_trtype=nvme_loop
and all the testcases are passing [2].

 -ck

Chaitanya Kulkarni (5):
  block: ignore discard return value
  dm: ignore discard return value
  nvmet: ignore discard return value
  f2fs: ignore discard return value
  xfs: ignore discard return value

 block/blk-lib.c                   |  6 +++---
 drivers/md/dm-thin.c              | 12 +++++-------
 drivers/md/md.c                   |  4 ++--
 drivers/nvme/target/io-cmd-bdev.c | 29 ++++++++---------------------
 fs/f2fs/segment.c                 | 12 +++++-------
 fs/xfs/xfs_discard.c              | 27 +++++----------------------
 fs/xfs/xfs_discard.h              |  2 +-
 7 files changed, 29 insertions(+), 63 deletions(-)


######################XFS TEST dircard return value ignore ##################

linux-block (discard-ret-value) # gitlog -6
a6b2c13bf2b4 (HEAD -> discard-ret-value) xfs: ignore discard return value
ccb8da1a96b1 f2fs: ignore discard return value
e53455d2d61f nvmet: ignore discard return value
1e16fecedfd6 dm: ignore discard return value
e0f69471a2ad block: ignore discard return value

linux (discard-ret-value) # ./kernel_compile.sh
+ make -j 48
  SYNC    include/config/auto.conf.cmd
  HOSTCC  scripts/kconfig/conf.o
  HOSTLD  scripts/kconfig/conf
  GEN     arch/x86/include/generated/asm/orc_hash.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  [...]
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
++ nproc
+ make -j 48 modules
  DESCEND objtool
  CALL    scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
+ make -j 48 modules_install
  SYMLINK /lib/modules/6.18.0-rc6lblk-discard-ret-val+/build
  INSTALL /lib/modules/6.18.0-rc6lblk-discard-ret-val+/modules.order
  INSTALL /lib/modules/6.18.0-rc6lblk-discard-ret-val+/modules.builtin.modinfo
  INSTALL /lib/modules/6.18.0-rc6lblk-discard-ret-val+/modules.builtin
  INSTALL /lib/modules/6.18.0-rc6lblk-discard-ret-val+/kernel/arch/x86/events/intel/intel-uncore.ko

  [...]

  DEPMOD  /lib/modules/6.18.0-rc6lblk-discard-ret-val+
  INSTALL /boot
Generating grub configuration file ...
Adding boot menu entry for UEFI Firmware Settings ...
done

real	5m30.328s
user	109m9.089s
sys	43m14.254s

linux-block (discard-ret-value) # 
linux-block (discard-ret-value) # 
linux-block (discard-ret-value) # 
linux-block (discard-ret-value) # 
linux-block (discard-ret-value) # reboot
Connection to 192.168.122.185 closed by remote host.
Connection to 192.168.122.185 closed.
ssh: connect to host 192.168.122.185 port 22: Connection refused
ssh: connect to host 192.168.122.185 port 22: Connection refused
ssh: connect to host 192.168.122.185 port 22: Connection refused
~ # 
~ # 
~ # 
~ # 
~ # 
~ # 
~ # cdxfstest 
xfstests-dev (master) # ./setup-xfstest-loop.sh ; ./run-my-discard-tests.sh 
xfstests-dev (master) # ./run-my-discard-tests.sh
=== XFSTest null_blk Setup (Memory-backed) ===

[1/6] Setting up null_blk devices (20GB each, memory-backed)...
  Created: /dev/nullb0 (20GB, memory-backed)
  Created: /dev/nullb1 (20GB, memory-backed)
nullb0 251:0    0   20G  0 disk
nullb1 251:1    0   20G  0 disk
[2/6] Creating mount directories...
  Created: /mnt/test
  Created: /mnt/scratch
[3/6] Creating test users and groups for xfstests...
  Group fsgqa already exists
  User fsgqa already exists
  User 123456-fsgqa already exists
  User fsgqa2 already exists
[4/6] Formatting TEST_DEV (/dev/nullb0) with XFS...
  Formatted /dev/nullb0 with XFS filesystem
  Note: SCRATCH_DEV will be formatted by xfstests as needed
[5/6] Creating local.config for xfstests...
  Created: /mnt/data100G/xfs-linux/xfstests-dev/local.config
[6/6] Verifying test users...
  ✓ fsgqa user configured
  ✓ 123456-fsgqa user configured
  ✓ fsgqa2 user configured

=== Setup Complete ===

Configuration (null_blk - memory-backed):
  TEST_DEV:    /dev/nullb0 (20GB, RAM)
  TEST_DIR:    /mnt/test
  SCRATCH_DEV: /dev/nullb1 (20GB, RAM)
  SCRATCH_MNT: /mnt/scratch
  Config file: /mnt/data100G/xfs-linux/xfstests-dev/local.config

null_blk devices:
nullb0 251:0    0   20G  0 disk
nullb1 251:1    0   20G  0 disk

Device info:
  /dev/nullb0: 20.00 GB
  /dev/nullb1: 20.00 GB

Advantages of null_blk (memory-backed):
  ✓ Much faster than loop devices (pure RAM)
  ✓ No disk I/O overhead
  ✓ Perfect for kernel testing

You can now run xfstests:
  cd /mnt/data100G/xfs-linux/xfstests-dev
  ./check -g auto           # Run all auto tests
  ./check generic/001       # Run single test
  ./check -g quick          # Run quick test group

To cleanup later, run:
  umount /mnt/test /mnt/scratch 2>/dev/null || true
  rmmod null_blk
===============================================================================
Discard-Related Tests
===============================================================================

Total tests: 27
Dry run: NO
Interactive: NO

Press ENTER to run all tests, Ctrl+C to cancel


===============================================================================
Test [1/27]: f2fs/008
===============================================================================
Running: ./check f2fs/008
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/008           [failed, exit status 1]- output mismatch (see /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/008.out.bad)
    --- tests/f2fs/008.out	2025-11-17 22:53:15.022496507 -0800
    +++ /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/008.out.bad	2025-11-23 16:05:11.860492472 -0800
    @@ -1,2 +1 @@
     QA output created by 008
    -Silence is golden
    ...
    (Run 'diff -u /mnt/data100G/xfs-linux/xfstests-dev/tests/f2fs/008.out /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/008.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      bc8aeb04fd80 f2fs: fix to drop all discards after creating snapshot on lvm device

Ran: f2fs/008
Failures: f2fs/008
Failed 1 of 1 tests

✗ Test f2fs/008 FAILED (exit code: 1)

===============================================================================
Test [2/27]: f2fs/014
===============================================================================
Running: ./check f2fs/014
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/014           - output mismatch (see /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/014.out.bad)
    --- tests/f2fs/014.out	2025-11-17 22:53:15.023496535 -0800
    +++ /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/014.out.bad	2025-11-23 16:05:17.174275720 -0800
    @@ -1,2 +1 @@
     QA output created by 014
    -trimmed
    ...
    (Run 'diff -u /mnt/data100G/xfs-linux/xfstests-dev/tests/f2fs/014.out /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/014.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      21263d035ff2 f2fs: fix missing discard for active segments

Ran: f2fs/014
Failures: f2fs/014
Failed 1 of 1 tests

✗ Test f2fs/014 FAILED (exit code: 1)

===============================================================================
Test [3/27]: f2fs/015
===============================================================================
Running: ./check f2fs/015
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/015




[failed, exit status 1]- output mismatch (see /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/015.out.bad)
    --- tests/f2fs/015.out	2025-11-17 22:53:15.023496535 -0800
    +++ /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/015.out.bad	2025-11-23 16:06:11.016487059 -0800
    @@ -1,12 +1,12 @@
     QA output created by 015
     Option#0: background_gc=on :
    -0
    +32
     Option#2: background_gc=off :
    -0
    +32
    ...
    (Run 'diff -u /mnt/data100G/xfs-linux/xfstests-dev/tests/f2fs/015.out /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/015.out.bad'  to see the entire diff)
Ran: f2fs/015
Failures: f2fs/015
Failed 1 of 1 tests

✗ Test f2fs/015 FAILED (exit code: 1)

===============================================================================
Test [4/27]: f2fs/017
===============================================================================
Running: ./check f2fs/017
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/017           [not run] this test requires a zoned block device
Ran: f2fs/017
Not run: f2fs/017
Passed all 1 tests

✓ Test f2fs/017 PASSED

===============================================================================
Test [5/27]: xfs/016
===============================================================================
Running: ./check xfs/016
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/016      62s ...  62s
Ran: xfs/016
Passed all 1 tests

✓ Test xfs/016 PASSED

===============================================================================
Test [6/27]: xfs/288
===============================================================================
Running: ./check xfs/288
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/288      2s ...  1s
Ran: xfs/288
Passed all 1 tests

✓ Test xfs/288 PASSED

===============================================================================
Test [7/27]: xfs/432
===============================================================================
Running: ./check xfs/432
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/432      28s ...  27s
Ran: xfs/432
Passed all 1 tests

✓ Test xfs/432 PASSED

===============================================================================
Test [8/27]: xfs/449
===============================================================================
Running: ./check xfs/449
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/449      1s ...  2s
Ran: xfs/449
Passed all 1 tests

✓ Test xfs/449 PASSED

===============================================================================
Test [9/27]: xfs/513
===============================================================================
Running: ./check xfs/513
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/513      12s ...  11s
Ran: xfs/513
Passed all 1 tests

✓ Test xfs/513 PASSED

===============================================================================
Test [10/27]: generic/033
===============================================================================
Running: ./check generic/033
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/033  3s ...  3s
Ran: generic/033
Passed all 1 tests

✓ Test generic/033 PASSED

===============================================================================
Test [11/27]: generic/038
===============================================================================
Running: ./check generic/038
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/038  37s ...  37s
Ran: generic/038
Passed all 1 tests

✓ Test generic/038 PASSED

===============================================================================
Test [12/27]: generic/098
===============================================================================
Running: ./check generic/098
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/098  3s ...  3s
Ran: generic/098
Passed all 1 tests

✓ Test generic/098 PASSED

===============================================================================
Test [13/27]: generic/224
===============================================================================
Running: ./check generic/224
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/224  9s ...  8s
Ran: generic/224
Passed all 1 tests

✓ Test generic/224 PASSED

===============================================================================
Test [14/27]: generic/251
===============================================================================
Running: ./check generic/251
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/251  63s ...  43s
Ran: generic/251
Passed all 1 tests

✓ Test generic/251 PASSED

===============================================================================
Test [15/27]: generic/260
===============================================================================
Running: ./check generic/260
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/260  9s ...  8s
Ran: generic/260
Passed all 1 tests

✓ Test generic/260 PASSED

===============================================================================
Test [16/27]: generic/288
===============================================================================
Running: ./check generic/288
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/288  4s ...  4s
Ran: generic/288
Passed all 1 tests

✓ Test generic/288 PASSED

===============================================================================
Test [17/27]: generic/351
===============================================================================
Running: ./check generic/351
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/351  2s ...  3s
Ran: generic/351
Passed all 1 tests

✓ Test generic/351 PASSED

===============================================================================
Test [18/27]: generic/455
===============================================================================
Running: ./check generic/455
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/455        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/455
Not run: generic/455
Passed all 1 tests

✓ Test generic/455 PASSED

===============================================================================
Test [19/27]: generic/457
===============================================================================
Running: ./check generic/457
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/457        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/457
Not run: generic/457
Passed all 1 tests

✓ Test generic/457 PASSED

===============================================================================
Test [20/27]: generic/470
===============================================================================
Running: ./check generic/470
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/470        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/470
Not run: generic/470
Passed all 1 tests

✓ Test generic/470 PASSED

===============================================================================
Test [21/27]: generic/482
===============================================================================
Running: ./check generic/482
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/482        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/482
Not run: generic/482
Passed all 1 tests

✓ Test generic/482 PASSED

===============================================================================
Test [22/27]: generic/500
===============================================================================
Running: ./check generic/500
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/500  5s ...  5s
Ran: generic/500
Passed all 1 tests

✓ Test generic/500 PASSED

===============================================================================
Test [23/27]: generic/537
===============================================================================
Running: ./check generic/537
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/537  3s ...  3s
Ran: generic/537
Passed all 1 tests

✓ Test generic/537 PASSED

===============================================================================
Test [24/27]: generic/608
===============================================================================
Running: ./check generic/608
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/608        [not run] /dev/nullb1 xfs does not support -o dax=always
Ran: generic/608
Not run: generic/608
Passed all 1 tests

✓ Test generic/608 PASSED

===============================================================================
Test [25/27]: generic/619
===============================================================================
Running: ./check generic/619
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/619  16s ...  17s
Ran: generic/619
Passed all 1 tests

✓ Test generic/619 PASSED

===============================================================================
Test [26/27]: generic/746
===============================================================================
Running: ./check generic/746
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/746  9s ...  9s
Ran: generic/746
Passed all 1 tests

✓ Test generic/746 PASSED

===============================================================================
Test [27/27]: generic/757
===============================================================================
Running: ./check generic/757
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-discard-ret-val+ #1 SMP PREEMPT_DYNAMIC Sun Nov 23 15:58:42 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/757        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/757
Not run: generic/757
Passed all 1 tests

✓ Test generic/757 PASSED

===============================================================================
                           TEST SUMMARY
===============================================================================

  ✗ FAIL  f2fs/008
  ✗ FAIL  f2fs/014
  ✗ FAIL  f2fs/015
  ✓ PASS  f2fs/017
  ✓ PASS  xfs/016
  ✓ PASS  xfs/288
  ✓ PASS  xfs/432
  ✓ PASS  xfs/449
  ✓ PASS  xfs/513
  ✓ PASS  generic/033
  ✓ PASS  generic/038
  ✓ PASS  generic/098
  ✓ PASS  generic/224
  ✓ PASS  generic/251
  ✓ PASS  generic/260
  ✓ PASS  generic/288
  ✓ PASS  generic/351
  ✓ PASS  generic/455
  ✓ PASS  generic/457
  ✓ PASS  generic/470
  ✓ PASS  generic/482
  ✓ PASS  generic/500
  ✓ PASS  generic/537
  ✓ PASS  generic/608
  ✓ PASS  generic/619
  ✓ PASS  generic/746
  ✓ PASS  generic/757


===============================================================================
xfstests-dev (master) # 
blktests (master) # ./test-nvme.sh
++ for t in loop tcp
++ echo '################nvme_trtype=loop############'
################nvme_trtype=loop############
++ nvme_img_size=900M
++ nvme_num_iter=1
++ nvme_trtype=loop
++ ./check nvme
nvme/002 (tr=loop) (create many subsystems and test discovery) [passed]
    runtime  42.094s  ...  42.504s
nvme/003 (tr=loop) (test if we're sending keep-alives to a discovery controller) [passed]
    runtime  10.255s  ...  10.271s
nvme/004 (tr=loop) (test nvme and nvmet UUID NS descriptors) [passed]
    runtime  0.900s  ...  0.899s
nvme/005 (tr=loop) (reset local loopback target)             [passed]
    runtime  1.476s  ...  1.456s
nvme/006 (tr=loop bd=device) (create an NVMeOF target)       [passed]
    runtime  0.107s  ...  0.114s
nvme/006 (tr=loop bd=file) (create an NVMeOF target)         [passed]
    runtime  0.083s  ...  0.078s
nvme/008 (tr=loop bd=device) (create an NVMeOF host)         [passed]
    runtime  0.886s  ...  0.913s
nvme/008 (tr=loop bd=file) (create an NVMeOF host)           [passed]
    runtime  0.901s  ...  0.887s
nvme/010 (tr=loop bd=device) (run data verification fio job) [passed]
    runtime  77.012s  ...  98.682s
nvme/010 (tr=loop bd=file) (run data verification fio job)   [passed]
    runtime  174.211s  ...  280.958s
nvme/012 (tr=loop bd=device) (run mkfs and data verification fio) [passed]
    runtime  91.545s  ...  84.399s
nvme/012 (tr=loop bd=file) (run mkfs and data verification fio)
    runtime  156.857s  ...
nvme/012 (tr=loop bd=file) (run mkfs and data verification fio) [passed]
    runtime  156.857s  ...  239.848s
nvme/014 (tr=loop bd=device) (flush a command from host)     [passed]
    runtime  13.794s  ...  13.422s
nvme/014 (tr=loop bd=file) (flush a command from host)       [passed]
    runtime  10.749s  ...  11.194s
nvme/016 (tr=loop) (create/delete many NVMeOF block device-backed ns and test discovery) [passed]
    runtime  0.151s  ...  0.170s
nvme/017 (tr=loop) (create/delete many file-ns and test discovery) [passed]
    runtime  0.163s  ...  0.167s
nvme/018 (tr=loop) (unit test NVMe-oF out of range access on a file backend) [passed]
    runtime  0.871s  ...  0.873s
nvme/019 (tr=loop bd=device) (test NVMe DSM Discard command) [passed]
    runtime  0.885s  ...  0.902s
nvme/019 (tr=loop bd=file) (test NVMe DSM Discard command)   [passed]
    runtime  0.876s  ...  0.872s
nvme/021 (tr=loop bd=device) (test NVMe list command)        [passed]
    runtime  0.887s  ...  0.919s
nvme/021 (tr=loop bd=file) (test NVMe list command)          [passed]
    runtime  0.875s  ...  0.878s
nvme/022 (tr=loop bd=device) (test NVMe reset command)       [passed]
    runtime  1.489s  ...  1.494s
nvme/022 (tr=loop bd=file) (test NVMe reset command)         [passed]
    runtime  1.453s  ...  1.646s
nvme/023 (tr=loop bd=device) (test NVMe smart-log command)   [passed]
    runtime  0.899s  ...  0.904s
nvme/023 (tr=loop bd=file) (test NVMe smart-log command)     [passed]
    runtime  0.858s  ...  0.881s
nvme/025 (tr=loop bd=device) (test NVMe effects-log)         [passed]
    runtime  0.907s  ...  0.910s
nvme/025 (tr=loop bd=file) (test NVMe effects-log)           [passed]
    runtime  0.862s  ...  0.908s
nvme/026 (tr=loop bd=device) (test NVMe ns-descs)            [passed]
    runtime  0.892s  ...  0.909s
nvme/026 (tr=loop bd=file) (test NVMe ns-descs)              [passed]
    runtime  0.863s  ...  0.893s
nvme/027 (tr=loop bd=device) (test NVMe ns-rescan command)   [passed]
    runtime  0.916s  ...  0.931s
nvme/027 (tr=loop bd=file) (test NVMe ns-rescan command)     [passed]
    runtime  0.890s  ...  0.884s
nvme/028 (tr=loop bd=device) (test NVMe list-subsys)         [passed]
    runtime  0.902s  ...  0.882s
nvme/028 (tr=loop bd=file) (test NVMe list-subsys)           [passed]
    runtime  0.854s  ...  0.842s
nvme/029 (tr=loop) (test userspace IO via nvme-cli read/write interface) [passed]
    runtime  1.114s  ...  1.126s
nvme/030 (tr=loop) (ensure the discovery generation counter is updated appropriately) [passed]
    runtime  0.535s  ...  0.527s
nvme/031 (tr=loop) (test deletion of NVMeOF controllers immediately after setup) [passed]
    runtime  8.354s  ...  8.276s
nvme/038 (tr=loop) (test deletion of NVMeOF subsystem without enabling) [passed]
    runtime  0.028s  ...  0.029s
nvme/040 (tr=loop) (test nvme fabrics controller reset/disconnect operation during I/O) [passed]
    runtime  7.411s  ...  7.527s
nvme/041 (tr=loop) (Create authenticated connections)        [passed]
    runtime    ...  0.923s
nvme/042 (tr=loop) (Test dhchap key types for authenticated connections)
WARNING: Test did not clean up port: 0
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
rmdir: failed to remove '/sys/kernel/config/nvmet//hosts/nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7nvme/042 (tr=loop) (Test dhchap key types for authenticated connections) [failed]
    runtime    ...  0.838s
    --- tests/nvme/042.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_loop/nvme/042.out.bad	2025-11-23 16:27:17.525974599 -0800
    @@ -2,15 +2,4 @@
     Testing hmac 0
     disconnected 1 controller(s)
     Testing hmac 1
    -disconnected 1 controller(s)
    -Testing hmac 2
    -disconnected 1 controller(s)
    -Testing hmac 3
    ...
    (Run 'diff -u tests/nvme/042.out /root/blktests/results/nodev_tr_loop/nvme/042.out.bad' to see the entire diff)
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
rmdir: failed to remove '/sys/kernel/config/nvmet//hosts/nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349': Device or resource busy
nvme/043 (tr=loop) (Test hash and DH group variations for authenticated connections) [failed]
    runtime    ...  18.497s
    --- tests/nvme/043.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_loop/nvme/043.out.bad	2025-11-23 16:27:36.634537962 -0800
    @@ -1,18 +1,19 @@
     Running nvme/043
    +FAIL target setup failed. stale host configuration found
     Testing hash hmac(sha256)
    -disconnected 1 controller(s)
    +disconnected 0 controller(s)
     Testing hash hmac(sha384)
    -disconnected 1 controller(s)
    ...
    (Run 'diff -u tests/nvme/043.out /root/blktests/results/nodev_tr_loop/nvme/043.out.bad' to see the entire diff)
nvme/044 (tr=loop) (Test bi-directional authentication)      [passed]
    runtime    ...  1.752s
nvme/045 (tr=loop) (Test re-authentication)                  [passed]
    runtime    ...  1.424s
nvme/047 (tr=loop) (test different queue types for fabric transports) [not run]
    nvme_trtype=loop is not supported in this test
nvme/048 (tr=loop) (Test queue count changes on reconnect)   [not run]
    nvme_trtype=loop is not supported in this test
nvme/051 (tr=loop) (test nvmet concurrent ns enable/disable) [passed]
    runtime  2.271s  ...  2.361s
nvme/052 (tr=loop) (Test file-ns creation/deletion under one subsystem) [passed]
    runtime  6.460s  ...  6.499s
nvme/054 (tr=loop) (Test the NVMe reservation feature)       [passed]
    runtime  0.955s  ...  0.982s
nvme/055 (tr=loop) (Test nvme write to a loop target ns just after ns is disabled) [not run]
    runtime  0.934s  ...
    kernel option DEBUG_ATOMIC_SLEEP has not been enabled
nvme/056 (tr=loop) (enable zero copy offload and run rw traffic) [not run]
    Remote target required but NVME_TARGET_CONTROL is not set
    nvme_trtype=loop is not supported in this test
    kernel option ULP_DDP has not been enabled
    module nvme_tcp does not have parameter ddp_offload
    KERNELSRC not set
    Kernel sources do not have tools/net/ynl/cli.py
    NVME_IFACE not set
nvme/057 (tr=loop) (test nvme fabrics controller ANA failover during I/O) [passed]
    runtime  30.036s  ...  30.790s
nvme/058 (tr=loop) (test rapid namespace remapping)          [passed]
    runtime  8.082s  ...  7.485s
nvme/060 (tr=loop) (test nvme fabrics target reset)          [not run]
    nvme_trtype=loop is not supported in this test
nvme/061 (tr=loop) (test fabric target teardown and setup during I/O) [not run]
    nvme_trtype=loop is not supported in this test
nvme/062 (tr=loop) (Create TLS-encrypted connections)        [not run]
    nvme_trtype=loop is not supported in this test
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/063 (tr=loop) (Create authenticated TCP connections with secure concatenation) [not run]
    nvme_trtype=loop is not supported in this test
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/065 (test unmap write zeroes sysfs interface with nvmet devices) [passed]
    runtime    ...  3.118s
++ for t in loop tcp
++ echo '################nvme_trtype=tcp############'
################nvme_trtype=tcp############
++ nvme_img_size=900M
++ nvme_num_iter=1
++ nvme_trtype=tcp
++ ./check nvme
nvme/002 (tr=tcp) (create many subsystems and test discovery) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/003 (tr=tcp) (test if we're sending keep-alives to a discovery controller) [passed]
    runtime  10.262s  ...  10.273s
nvme/004 (tr=tcp) (test nvme and nvmet UUID NS descriptors)  [failed]
    runtime  0.399s  ...  0.679s
    something found in dmesg:
    [ 1654.146509] run blktests nvme/004 at 2025-11-23 16:29:09
    [ 1654.192606] loop0: detected capacity change from 0 to 1843200
    [ 1654.218724] nvmet: adding nsid 1 to subsystem blktests-subsystem-1
    [ 1654.232749] nvmet_tcp: enabling port 0 (127.0.0.1:4420)
    [ 1654.272551] nvmet: Created nvm controller 1 for subsystem blktests-subsystem-1 for NQN nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349.
    [ 1654.276909] nvme nvme0: creating 48 I/O queues.
    [ 1654.291645] nvme nvme0: mapped 48/0/0 default/read/poll queues.
    [ 1654.308249] nvme nvme0: new ctrl: NQN "blktests-subsystem-1", addr 127.0.0.1:4420, hostnqn: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
    [ 1654.406082] nvme nvme0: Removing ctrl: NQN "blktests-subsystem-1"

    ...
    (See '/root/blktests/results/nodev_tr_tcp/nvme/004.dmesg' for the entire message)
nvme/005 (tr=tcp) (reset local loopback target)              [passed]
    runtime  0.463s  ...  0.350s
nvme/006 (tr=tcp bd=device) (create an NVMeOF target)        [passed]
    runtime  0.120s  ...  0.096s
nvme/006 (tr=tcp bd=file) (create an NVMeOF target)          [passed]
    runtime  0.100s  ...  0.069s
nvme/008 (tr=tcp bd=device) (create an NVMeOF host)          [passed]
    runtime  0.646s  ...  0.274s
nvme/008 (tr=tcp bd=file) (create an NVMeOF host)            [passed]
    runtime  0.372s  ...  0.262s
nvme/010 (tr=tcp bd=device) (run data verification fio job)
    runtime  94.971s  ...

nvme/010 (tr=tcp bd=device) (run data verification fio job)  [passed]
    runtime  94.971s  ...  97.353s
nvme/010 (tr=tcp bd=file) (run data verification fio job)    [passed]
    runtime  147.469s  ...  220.569s
nvme/012 (tr=tcp bd=device) (run mkfs and data verification fio) [passed]
    runtime  106.682s  ...  86.675s
nvme/012 (tr=tcp bd=file) (run mkfs and data verification fio) [passed]
    runtime  154.752s  ...  202.256s
nvme/014 (tr=tcp bd=device) (flush a command from host)      [passed]
    runtime  10.702s  ...  7.539s
nvme/014 (tr=tcp bd=file) (flush a command from host)        [passed]
    runtime  10.910s  ...  7.046s
nvme/016 (tr=tcp) (create/delete many NVMeOF block device-backed ns and test discovery) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/017 (tr=tcp) (create/delete many file-ns and test discovery) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/018 (tr=tcp) (unit test NVMe-oF out of range access on a file backend) [passed]
    runtime  0.351s  ...  0.273s
nvme/019 (tr=tcp bd=device) (test NVMe DSM Discard command)  [passed]
    runtime  0.419s  ...  0.284s
nvme/019 (tr=tcp bd=file) (test NVMe DSM Discard command)    [passed]
    runtime  0.372s  ...  0.251s
nvme/021 (tr=tcp bd=device) (test NVMe list command)         [passed]
    runtime  0.415s  ...  0.275s
nvme/021 (tr=tcp bd=file) (test NVMe list command)           [passed]
    runtime  0.380s  ...  0.249s
nvme/022 (tr=tcp bd=device) (test NVMe reset command)        [passed]
    runtime  0.529s  ...  0.370s
nvme/022 (tr=tcp bd=file) (test NVMe reset command)          [passed]
    runtime  0.476s  ...  0.334s
nvme/023 (tr=tcp bd=device) (test NVMe smart-log command)    [passed]
    runtime  0.422s  ...  0.273s
nvme/023 (tr=tcp bd=file) (test NVMe smart-log command)      [passed]
    runtime  0.377s  ...  0.241s
nvme/025 (tr=tcp bd=device) (test NVMe effects-log)          [passed]
    runtime  0.424s  ...  0.287s
nvme/025 (tr=tcp bd=file) (test NVMe effects-log)            [passed]
    runtime  0.392s  ...  0.256s
nvme/026 (tr=tcp bd=device) (test NVMe ns-descs)             [passed]
    runtime  0.401s  ...  0.285s
nvme/026 (tr=tcp bd=file) (test NVMe ns-descs)               [passed]
    runtime  0.368s  ...  0.264s
nvme/027 (tr=tcp bd=device) (test NVMe ns-rescan command)    [passed]
    runtime  0.425s  ...  0.309s
nvme/027 (tr=tcp bd=file) (test NVMe ns-rescan command)      [passed]
    runtime  0.390s  ...  0.282s
nvme/028 (tr=tcp bd=device) (test NVMe list-subsys)          [passed]
    runtime  0.402s  ...  0.273s
nvme/028 (tr=tcp bd=file) (test NVMe list-subsys)            [passed]
    runtime  0.382s  ...  0.250s
nvme/029 (tr=tcp) (test userspace IO via nvme-cli read/write interface) [passed]
    runtime  0.629s  ...  0.417s
nvme/030 (tr=tcp) (ensure the discovery generation counter is updated appropriately) [passed]
    runtime  0.376s  ...  0.332s
nvme/031 (tr=tcp) (test deletion of NVMeOF controllers immediately after setup) [passed]
    runtime  3.156s  ...  2.285s
nvme/038 (tr=tcp) (test deletion of NVMeOF subsystem without enabling) [passed]
    runtime  0.037s  ...  0.022s
nvme/040 (tr=tcp) (test nvme fabrics controller reset/disconnect operation during I/O) [passed]
    runtime  6.479s  ...  6.380s
nvme/041 (tr=tcp) (Create authenticated connections)         [passed]
    runtime    ...  0.297s
nvme/042 (tr=tcp) (Test dhchap key types for authenticated connections)
WARNING: Test did not clean up port: 0
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
rmdir: failed to remove '/sys/kernel/config/nvmet//hosts/nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7nvme/042 (tr=tcp) (Test dhchap key types for authenticated connections) [failed]
    runtime    ...  0.221s
    --- tests/nvme/042.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_tcp/nvme/042.out.bad	2025-11-23 16:40:38.169393917 -0800
    @@ -2,15 +2,4 @@
     Testing hmac 0
     disconnected 1 controller(s)
     Testing hmac 1
    -disconnected 1 controller(s)
    -Testing hmac 2
    -disconnected 1 controller(s)
    -Testing hmac 3
    ...
    (Run 'diff -u tests/nvme/042.out /root/blktests/results/nodev_tr_tcp/nvme/042.out.bad' to see the entire diff)
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
rmdir: failed to remove '/sys/kernel/config/nvmet//hosts/nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349': Device or resource busy
nvme/043 (tr=tcp) (Test hash and DH group variations for authenticated connections) [failed]
    runtime    ...  17.749s
    --- tests/nvme/043.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_tcp/nvme/043.out.bad	2025-11-23 16:40:56.500929486 -0800
    @@ -1,18 +1,19 @@
     Running nvme/043
    +FAIL target setup failed. stale host configuration found
     Testing hash hmac(sha256)
    -disconnected 1 controller(s)
    +disconnected 0 controller(s)
     Testing hash hmac(sha384)
    -disconnected 1 controller(s)
    ...
    (Run 'diff -u tests/nvme/043.out /root/blktests/results/nodev_tr_tcp/nvme/043.out.bad' to see the entire diff)
nvme/044 (tr=tcp) (Test bi-directional authentication)       [passed]
    runtime    ...  0.551s
nvme/045 (tr=tcp) (Test re-authentication)                   [passed]
    runtime    ...  0.970s
nvme/047 (tr=tcp) (test different queue types for fabric transports) [passed]
    runtime  1.933s  ...  1.152s
nvme/048 (tr=tcp) (Test queue count changes on reconnect)    [passed]
    runtime  6.509s  ...  6.320s
nvme/051 (tr=tcp) (test nvmet concurrent ns enable/disable)  [passed]
    runtime  2.216s  ...  2.457s
nvme/052 (tr=tcp) (Test file-ns creation/deletion under one subsystem) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/054 (tr=tcp) (Test the NVMe reservation feature)        [passed]
    runtime  0.458s  ...  0.290s
nvme/055 (tr=tcp) (Test nvme write to a loop target ns just after ns is disabled) [not run]
    nvme_trtype=tcp is not supported in this test
    kernel option DEBUG_ATOMIC_SLEEP has not been enabled
nvme/056 (tr=tcp) (enable zero copy offload and run rw traffic) [not run]
    Remote target required but NVME_TARGET_CONTROL is not set
    kernel option ULP_DDP has not been enabled
    module nvme_tcp does not have parameter ddp_offload
    KERNELSRC not set
    Kernel sources do not have tools/net/ynl/cli.py
    NVME_IFACE not set
nvme/057 (tr=tcp) (test nvme fabrics controller ANA failover during I/O) [passed]
    runtime  28.525s  ...  29.714s
nvme/058 (tr=tcp) (test rapid namespace remapping)           [passed]
    runtime  4.946s  ...  2.587s
nvme/060 (tr=tcp) (test nvme fabrics target reset)           [passed]
    runtime  19.536s  ...  19.121s
nvme/061 (tr=tcp) (test fabric target teardown and setup during I/O) [passed]
    runtime  8.547s  ...  8.316s
nvme/062 (tr=tcp) (Create TLS-encrypted connections)         [not run]
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/063 (tr=tcp) (Create authenticated TCP connections with secure concatenation) [not run]
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/065 (test unmap write zeroes sysfs interface with nvmet devices) [passed]
    runtime  3.118s  ...  2.747s
blktests (master) #
blktests (master) #


######################XFS TEST linux-block for-next without this series##################
linux (for-next) # ./kernel_compile.sh 
+ run
+ file=/tmp/kernel_compile
+ rm -fr /tmp/kernel_compile
++ nproc
+ make -j 48
  SYNC    include/config/auto.conf.cmd
  UPD     include/config/kernel.release
  DESCEND objtool
  UPD     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
  CC      init/version.o
  CC      drivers/base/firmware_loader/main.o
  CC      security/integrity/ima/ima_init.o
  CC [M]  drivers/nvme/target/core.o
  CC [M]  drivers/nvme/target/admin-cmd.o
  CC [M]  drivers/xen/xen-scsiback.o
  CC [M]  drivers/nvme/target/discovery.o
  CC      kernel/sys.o
  AR      init/built-in.a
  CC [M]  drivers/target/target_core_configfs.o
  CC [M]  net/rxrpc/local_event.o
  CC [M]  drivers/vhost/scsi.o
  CC      kernel/module/main.o

[...]

  NM      System.map
  SORTTAB vmlinux.unstripped
  OBJCOPY vmlinux
  GEN     modules.builtin.modinfo
  GEN     modules.builtin
  TEST    posttest


  arch/x86/tools/insn_decoder_test: success: Decoded and checked 7084922 instructions
  TEST    posttest
  arch/x86/tools/insn_sanity: success: Decoded and checked 1000000 random instructions with 0 errors (seed:0xbc1e25ee)
  CC      arch/x86/boot/version.o
  VOFFSET arch/x86/boot/compressed/../voffset.h
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  CC      arch/x86/boot/compressed/kaslr.o
  CC      arch/x86/boot/compressed/misc.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#3)

 make -j 48 modules_install
  SYMLINK /lib/modules/6.18.0-rc6lblk-fnext+/build
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/modules.order
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/modules.builtin
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/modules.builtin.modinfo
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/kernel/arch/x86/events/amd/o
  [...]
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/kernel/net/nsh/nsh.ko
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/kernel/net/vmw_vsock/vsock_loopback.ko
  INSTALL /lib/modules/6.18.0-rc6lblk-fnext+/kernel/virt/lib/irqbypass.ko
  DEPMOD  /lib/modules/6.18.0-rc6lblk-fnext+
++ nproc
+ make -j 48 install
  INSTALL /boot
++ readlink -e /etc/grub2.cfg
+ grub2-mkconfig -o /boot/grub2/grub.cfg
Generating grub configuration file ...
Adding boot menu entry for UEFI Firmware Settings ...
done
+ grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
Generating grub configuration file ...
Adding boot menu entry for UEFI Firmware Settings ...
done

real	1m58.246s
user	2m47.883s
sys	1m42.269s

linux (for-next) #
linux (for-next) # reboot
Connection to 192.168.122.185 closed by remote host.
Connection to 192.168.122.185 closed.
ssh: connect to host 192.168.122.185 port 22: Connection refused
ssh: connect to host 192.168.122.185 port 22: Connection refused
ssh: connect to host 192.168.122.185 port 22: Connection refused
xfstests-dev (master) # uname -r
6.18.0-rc6lblk-fnext+
xfstests-dev (master) # ./setup-xfstest-loop.sh ; ./run-my-discard-tests.sh ; cdblktests ; ./test-nvme.sh
=== XFSTest null_blk Setup (Memory-backed) ===

[1/6] Setting up null_blk devices (20GB each, memory-backed)...
  Created: /dev/nullb0 (20GB, memory-backed)
  Created: /dev/nullb1 (20GB, memory-backed)
nullb0 251:0    0   20G  0 disk
nullb1 251:1    0   20G  0 disk
[2/6] Creating mount directories...
  Created: /mnt/test
  Created: /mnt/scratch
[3/6] Creating test users and groups for xfstests...
  Group fsgqa already exists
  User fsgqa already exists
  User 123456-fsgqa already exists
  User fsgqa2 already exists
[4/6] Formatting TEST_DEV (/dev/nullb0) with XFS...
  Formatted /dev/nullb0 with XFS filesystem
  Note: SCRATCH_DEV will be formatted by xfstests as needed
[5/6] Creating local.config for xfstests...
  Created: /mnt/data100G/xfs-linux/xfstests-dev/local.config
[6/6] Verifying test users...
  ✓ fsgqa user configured
  ✓ 123456-fsgqa user configured
  ✓ fsgqa2 user configured

=== Setup Complete ===

Configuration (null_blk - memory-backed):
  TEST_DEV:    /dev/nullb0 (20GB, RAM)
  TEST_DIR:    /mnt/test
  SCRATCH_DEV: /dev/nullb1 (20GB, RAM)
  SCRATCH_MNT: /mnt/scratch
  Config file: /mnt/data100G/xfs-linux/xfstests-dev/local.config

null_blk devices:
nullb0 251:0    0   20G  0 disk
nullb1 251:1    0   20G  0 disk

Device info:
  /dev/nullb0: 20.00 GB
  /dev/nullb1: 20.00 GB

Advantages of null_blk (memory-backed):
  ✓ Much faster than loop devices (pure RAM)
  ✓ No disk I/O overhead
  ✓ Perfect for kernel testing

You can now run xfstests:
  cd /mnt/data100G/xfs-linux/xfstests-dev
  ./check -g auto           # Run all auto tests
  ./check generic/001       # Run single test
  ./check -g quick          # Run quick test group

To cleanup later, run:
  umount /mnt/test /mnt/scratch 2>/dev/null || true
  rmmod null_blk

===============================================================================
Discard-Related Tests
===============================================================================

Total tests: 27
Dry run: NO
Interactive: NO

Press ENTER to run all tests, Ctrl+C to cancel


===============================================================================
Test [1/27]: f2fs/008
===============================================================================
Running: ./check f2fs/008
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/008           [failed, exit status 1]- output mismatch (see /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/008.out.bad)
    --- tests/f2fs/008.out	2025-11-17 22:53:15.022496507 -0800
    +++ /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/008.out.bad	2025-11-23 17:00:23.404874675 -0800
    @@ -1,2 +1 @@
     QA output created by 008
    -Silence is golden
    ...
    (Run 'diff -u /mnt/data100G/xfs-linux/xfstests-dev/tests/f2fs/008.out /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/008.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      bc8aeb04fd80 f2fs: fix to drop all discards after creating snapshot on lvm device

Ran: f2fs/008
Failures: f2fs/008
Failed 1 of 1 tests

✗ Test f2fs/008 FAILED (exit code: 1)

===============================================================================
Test [2/27]: f2fs/014
===============================================================================
Running: ./check f2fs/014
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/014           - output mismatch (see /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/014.out.bad)
    --- tests/f2fs/014.out	2025-11-17 22:53:15.023496535 -0800
    +++ /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/014.out.bad	2025-11-23 17:00:28.927374867 -0800
    @@ -1,2 +1 @@
     QA output created by 014
    -trimmed
    ...
    (Run 'diff -u /mnt/data100G/xfs-linux/xfstests-dev/tests/f2fs/014.out /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/014.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      21263d035ff2 f2fs: fix missing discard for active segments

Ran: f2fs/014
Failures: f2fs/014
Failed 1 of 1 tests

✗ Test f2fs/014 FAILED (exit code: 1)

===============================================================================
Test [3/27]: f2fs/015
===============================================================================
Running: ./check f2fs/015
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/015           [failed, exit status 1]- output mismatch (see /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/015.out.bad)
    --- tests/f2fs/015.out	2025-11-17 22:53:15.023496535 -0800
    +++ /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/015.out.bad	2025-11-23 17:01:22.539421788 -0800
    @@ -1,12 +1,12 @@
     QA output created by 015
     Option#0: background_gc=on :
    -0
    +32
     Option#2: background_gc=off :
    -0
    +32
    ...
    (Run 'diff -u /mnt/data100G/xfs-linux/xfstests-dev/tests/f2fs/015.out /mnt/data100G/xfs-linux/xfstests-dev/results//f2fs/015.out.bad'  to see the entire diff)
Ran: f2fs/015
Failures: f2fs/015
Failed 1 of 1 tests

✗ Test f2fs/015 FAILED (exit code: 1)

===============================================================================
Test [4/27]: f2fs/017
===============================================================================
Running: ./check f2fs/017
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

f2fs/017           [not run] this test requires a zoned block device
Ran: f2fs/017
Not run: f2fs/017
Passed all 1 tests

✓ Test f2fs/017 PASSED

===============================================================================
Test [5/27]: xfs/016
===============================================================================
Running: ./check xfs/016
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/016      62s ...  61s
Ran: xfs/016
Passed all 1 tests

✓ Test xfs/016 PASSED

===============================================================================
Test [6/27]: xfs/288
===============================================================================
Running: ./check xfs/288
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/288      1s ...  2s
Ran: xfs/288
Passed all 1 tests

✓ Test xfs/288 PASSED

===============================================================================
Test [7/27]: xfs/432
===============================================================================
Running: ./check xfs/432
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/432      27s ...  28s
Ran: xfs/432
Passed all 1 tests

✓ Test xfs/432 PASSED

===============================================================================
Test [8/27]: xfs/449
===============================================================================
Running: ./check xfs/449
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/449      2s ...  1s
Ran: xfs/449
Passed all 1 tests

✓ Test xfs/449 PASSED

===============================================================================
Test [9/27]: xfs/513
===============================================================================
Running: ./check xfs/513
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

xfs/513      11s ...  11s
Ran: xfs/513
Passed all 1 tests

✓ Test xfs/513 PASSED

===============================================================================
Test [10/27]: generic/033
===============================================================================
Running: ./check generic/033
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/033  3s ...  4s
Ran: generic/033
Passed all 1 tests

✓ Test generic/033 PASSED

===============================================================================
Test [11/27]: generic/038
===============================================================================
Running: ./check generic/038
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/038  37s ...  37s
Ran: generic/038
Passed all 1 tests

✓ Test generic/038 PASSED

===============================================================================
Test [12/27]: generic/098
===============================================================================
Running: ./check generic/098
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/098  3s ...  3s
Ran: generic/098
Passed all 1 tests

✓ Test generic/098 PASSED

===============================================================================
Test [13/27]: generic/224
===============================================================================
Running: ./check generic/224
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/224  8s ...  9s
Ran: generic/224
Passed all 1 tests

✓ Test generic/224 PASSED

===============================================================================
Test [14/27]: generic/251
===============================================================================
Running: ./check generic/251
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/251  43s ...  65s
Ran: generic/251
Passed all 1 tests

✓ Test generic/251 PASSED

===============================================================================
Test [15/27]: generic/260
===============================================================================
Running: ./check generic/260
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/260  8s ...  9s
Ran: generic/260
Passed all 1 tests

✓ Test generic/260 PASSED

===============================================================================
Test [16/27]: generic/288
===============================================================================
Running: ./check generic/288
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/288  4s ...  3s
Ran: generic/288
Passed all 1 tests

✓ Test generic/288 PASSED

===============================================================================
Test [17/27]: generic/351
===============================================================================
Running: ./check generic/351
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/351  3s ...  3s
Ran: generic/351
Passed all 1 tests

✓ Test generic/351 PASSED

===============================================================================
Test [18/27]: generic/455
===============================================================================
Running: ./check generic/455
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/455        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/455
Not run: generic/455
Passed all 1 tests

✓ Test generic/455 PASSED

===============================================================================
Test [19/27]: generic/457
===============================================================================
Running: ./check generic/457
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/457        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/457
Not run: generic/457
Passed all 1 tests

✓ Test generic/457 PASSED

===============================================================================
Test [20/27]: generic/470
===============================================================================
Running: ./check generic/470
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/470        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/470
Not run: generic/470
Passed all 1 tests

✓ Test generic/470 PASSED

===============================================================================
Test [21/27]: generic/482
===============================================================================
Running: ./check generic/482
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/482        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/482
Not run: generic/482
Passed all 1 tests

✓ Test generic/482 PASSED

===============================================================================
Test [22/27]: generic/500
===============================================================================
Running: ./check generic/500
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/500  5s ...  5s
Ran: generic/500
Passed all 1 tests

✓ Test generic/500 PASSED

===============================================================================
Test [23/27]: generic/537
===============================================================================
Running: ./check generic/537
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/537  3s ...  2s
Ran: generic/537
Passed all 1 tests

✓ Test generic/537 PASSED

===============================================================================
Test [24/27]: generic/608
===============================================================================
Running: ./check generic/608
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/608        [not run] /dev/nullb1 xfs does not support -o dax=always
Ran: generic/608
Not run: generic/608
Passed all 1 tests

✓ Test generic/608 PASSED

===============================================================================
Test [25/27]: generic/619
===============================================================================
Running: ./check generic/619
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/619  17s ...  16s
Ran: generic/619
Passed all 1 tests

✓ Test generic/619 PASSED

===============================================================================
Test [26/27]: generic/746
===============================================================================
Running: ./check generic/746
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/746  9s ...  9s
Ran: generic/746
Passed all 1 tests

✓ Test generic/746 PASSED

===============================================================================
Test [27/27]: generic/757
===============================================================================
Running: ./check generic/757
FSTYP         -- xfs (debug)
PLATFORM      -- Linux/x86_64 dev 6.18.0-rc6lblk-fnext+ #3 SMP PREEMPT_DYNAMIC Sun Nov 23 16:55:15 PST 2025
MKFS_OPTIONS  -- -f /dev/nullb1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/nullb1 /mnt/scratch

generic/757        [not run] This test requires a valid $LOGWRITES_DEV
Ran: generic/757
Not run: generic/757
Passed all 1 tests

✓ Test generic/757 PASSED

===============================================================================
                           TEST SUMMARY
===============================================================================

  ✗ FAIL  f2fs/008
  ✗ FAIL  f2fs/014
  ✗ FAIL  f2fs/015
  ✓ PASS  f2fs/017
  ✓ PASS  xfs/016
  ✓ PASS  xfs/288
  ✓ PASS  xfs/432
  ✓ PASS  xfs/449
  ✓ PASS  xfs/513
  ✓ PASS  generic/033
  ✓ PASS  generic/038
  ✓ PASS  generic/098
  ✓ PASS  generic/224
  ✓ PASS  generic/251
  ✓ PASS  generic/260
  ✓ PASS  generic/288
  ✓ PASS  generic/351
  ✓ PASS  generic/455
  ✓ PASS  generic/457
  ✓ PASS  generic/470
  ✓ PASS  generic/482
  ✓ PASS  generic/500
  ✓ PASS  generic/537
  ✓ PASS  generic/608
  ✓ PASS  generic/619
  ✓ PASS  generic/746
  ✓ PASS  generic/757

++ for t in loop tcp
++ echo '################nvme_trtype=loop############'
################nvme_trtype=loop############
++ nvme_img_size=900M
++ nvme_num_iter=1
++ nvme_trtype=loop
++ ./check nvme
nvme/002 (tr=loop) (create many subsystems and test discovery) [passed]
    runtime  42.504s  ...  42.537s
nvme/003 (tr=loop) (test if we're sending keep-alives to a discovery controller) [passed]
    runtime  10.271s  ...  10.271s
nvme/004 (tr=loop) (test nvme and nvmet UUID NS descriptors) [passed]
    runtime  0.899s  ...  0.929s
nvme/005 (tr=loop) (reset local loopback target)             [passed]
    runtime  1.456s  ...  1.455s
nvme/006 (tr=loop bd=device) (create an NVMeOF target)       [passed]
    runtime  0.114s  ...  0.109s
nvme/006 (tr=loop bd=file) (create an NVMeOF target)         [passed]
    runtime  0.078s  ...  0.086s
nvme/008 (tr=loop bd=device) (create an NVMeOF host)         [passed]
    runtime  0.913s  ...  0.938s
nvme/008 (tr=loop bd=file) (create an NVMeOF host)           [passed]
    runtime  0.887s  ...  0.859s
nvme/010 (tr=loop bd=device) (run data verification fio job) [passed]
    runtime  98.682s  ...  98.040s
nvme/010 (tr=loop bd=file) (run data verification fio job)   [passed]
    runtime  280.958s  ...  264.788s
nvme/012 (tr=loop bd=device) (run mkfs and data verification fio) [passed]
    runtime  84.399s  ...  90.445s
nvme/012 (tr=loop bd=file) (run mkfs and data verification fio) [passed]
    runtime  239.848s  ...  241.471s
nvme/014 (tr=loop bd=device) (flush a command from host)     [passed]
    runtime  13.422s  ...  12.556s
nvme/014 (tr=loop bd=file) (flush a command from host)       [passed]
    runtime  11.194s  ...  12.774s
nvme/016 (tr=loop) (create/delete many NVMeOF block device-backed ns and test discovery) [passed]
    runtime  0.170s  ...  0.158s
nvme/017 (tr=loop) (create/delete many file-ns and test discovery) [passed]
    runtime  0.167s  ...  0.167s
nvme/018 (tr=loop) (unit test NVMe-oF out of range access on a file backend) [passed]
    runtime  0.873s  ...  0.877s
nvme/019 (tr=loop bd=device) (test NVMe DSM Discard command) [passed]
    runtime  0.902s  ...  0.913s
nvme/019 (tr=loop bd=file) (test NVMe DSM Discard command)   [passed]
    runtime  0.872s  ...  0.855s
nvme/021 (tr=loop bd=device) (test NVMe list command)        [passed]
    runtime  0.919s  ...  0.912s
nvme/021 (tr=loop bd=file) (test NVMe list command)          [passed]
    runtime  0.878s  ...  0.861s
nvme/022 (tr=loop bd=device) (test NVMe reset command)       [passed]
    runtime  1.494s  ...  1.474s
nvme/022 (tr=loop bd=file) (test NVMe reset command)         [passed]
    runtime  1.646s  ...  1.432s
nvme/023 (tr=loop bd=device) (test NVMe smart-log command)   [passed]
    runtime  0.904s  ...  0.925s
nvme/023 (tr=loop bd=file) (test NVMe smart-log command)     [passed]
    runtime  0.881s  ...  0.871s
nvme/025 (tr=loop bd=device) (test NVMe effects-log)         [passed]
    runtime  0.910s  ...  0.904s
nvme/025 (tr=loop bd=file) (test NVMe effects-log)           [passed]
    runtime  0.908s  ...  0.876s
nvme/026 (tr=loop bd=device) (test NVMe ns-descs)            [passed]
    runtime  0.909s  ...  0.892s
nvme/026 (tr=loop bd=file) (test NVMe ns-descs)              [passed]
    runtime  0.893s  ...  0.883s
nvme/027 (tr=loop bd=device) (test NVMe ns-rescan command)   [passed]
    runtime  0.931s  ...  0.906s
nvme/027 (tr=loop bd=file) (test NVMe ns-rescan command)     [passed]
    runtime  0.884s  ...  0.874s
nvme/028 (tr=loop bd=device) (test NVMe list-subsys)         [passed]
    runtime  0.882s  ...  0.873s
nvme/028 (tr=loop bd=file) (test NVMe list-subsys)           [passed]
    runtime  0.842s  ...  0.870s
nvme/029 (tr=loop) (test userspace IO via nvme-cli read/write interface) [passed]
    runtime  1.126s  ...  1.121s
nvme/030 (tr=loop) (ensure the discovery generation counter is updated appropriately) [passed]
    runtime  0.527s  ...  0.506s
nvme/031 (tr=loop) (test deletion of NVMeOF controllers immediately after setup) [passed]
    runtime  8.276s  ...  8.150s
nvme/038 (tr=loop) (test deletion of NVMeOF subsystem without enabling) [passed]
    runtime  0.029s  ...  0.029s
nvme/040 (tr=loop) (test nvme fabrics controller reset/disconnect operation during I/O) [passed]
    runtime  7.527s  ...  7.630s
nvme/041 (tr=loop) (Create authenticated connections)        [passed]
    runtime  0.923s  ...  0.916s
nvme/042 (tr=loop) (Test dhchap key types for authenticated connections)
    runtime  0.838s  ...
WARNING: Test did not clean up port: 0
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
nvme/042 (tr=loop) (Test dhchap key types for authenticated connections) [failed]ss:uuid:0f01fb42-9f7    runtime  0.838s  ...  0.839se or resource busy
    --- tests/nvme/042.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_loop/nvme/042.out.bad	2025-11-23 17:21:54.670639692 -0800
    @@ -2,15 +2,4 @@
     Testing hmac 0
     disconnected 1 controller(s)
     Testing hmac 1
    -disconnected 1 controller(s)
    -Testing hmac 2
    -disconnected 1 controller(s)
    -Testing hmac 3
    ...
    (Run 'diff -u tests/nvme/042.out /root/blktests/results/nodev_tr_loop/nvme/042.out.bad' to see the entire diff)
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
rmdir: failed to remove '/sys/kernel/config/nvmet//hosts/nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349': Device or resource busy
nvme/043 (tr=loop) (Test hash and DH group variations for authenticated connections) [failed]
    runtime  18.497s  ...  18.520s
    --- tests/nvme/043.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_loop/nvme/043.out.bad	2025-11-23 17:22:13.798175995 -0800
    @@ -1,18 +1,19 @@
     Running nvme/043
    +FAIL target setup failed. stale host configuration found
     Testing hash hmac(sha256)
    -disconnected 1 controller(s)
    +disconnected 0 controller(s)
     Testing hash hmac(sha384)
    -disconnected 1 controller(s)
    ...
    (Run 'diff -u tests/nvme/043.out /root/blktests/results/nodev_tr_loop/nvme/043.out.bad' to see the entire diff)
nvme/044 (tr=loop) (Test bi-directional authentication)      [passed]
    runtime  1.752s  ...  1.776s
nvme/045 (tr=loop) (Test re-authentication)                  [passed]
    runtime  1.424s  ...  1.588s
nvme/047 (tr=loop) (test different queue types for fabric transports) [not run]
    nvme_trtype=loop is not supported in this test
nvme/048 (tr=loop) (Test queue count changes on reconnect)   [not run]
    nvme_trtype=loop is not supported in this test
nvme/051 (tr=loop) (test nvmet concurrent ns enable/disable) [passed]
    runtime  2.361s  ...  2.274s
nvme/052 (tr=loop) (Test file-ns creation/deletion under one subsystem) [passed]
    runtime  6.499s  ...  6.446s
nvme/054 (tr=loop) (Test the NVMe reservation feature)       [passed]
    runtime  0.982s  ...  0.957s
nvme/055 (tr=loop) (Test nvme write to a loop target ns just after ns is disabled) [not run]
    kernel option DEBUG_ATOMIC_SLEEP has not been enabled
nvme/056 (tr=loop) (enable zero copy offload and run rw traffic) [not run]
    Remote target required but NVME_TARGET_CONTROL is not set
    nvme_trtype=loop is not supported in this test
    kernel option ULP_DDP has not been enabled
    module nvme_tcp does not have parameter ddp_offload
    KERNELSRC not set
    Kernel sources do not have tools/net/ynl/cli.py
    NVME_IFACE not set
nvme/057 (tr=loop) (test nvme fabrics controller ANA failover during I/O) [passed]
    runtime  30.790s  ...  31.614s
nvme/058 (tr=loop) (test rapid namespace remapping)          [passed]
    runtime  7.485s  ...  7.199s
nvme/060 (tr=loop) (test nvme fabrics target reset)          [not run]
    nvme_trtype=loop is not supported in this test
nvme/061 (tr=loop) (test fabric target teardown and setup during I/O) [not run]
    nvme_trtype=loop is not supported in this test
nvme/062 (tr=loop) (Create TLS-encrypted connections)        [not run]
    nvme_trtype=loop is not supported in this test
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/063 (tr=loop) (Create authenticated TCP connections with secure concatenation) [not run]
    nvme_trtype=loop is not supported in this test
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/065 (test unmap write zeroes sysfs interface with nvmet devices) [passed]
    runtime  2.747s  ...  3.123s
++ for t in loop tcp
++ echo '################nvme_trtype=tcp############'
################nvme_trtype=tcp############
++ nvme_img_size=900M
++ nvme_num_iter=1
++ nvme_trtype=tcp
++ ./check nvme
nvme/002 (tr=tcp) (create many subsystems and test discovery) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/003 (tr=tcp) (test if we're sending keep-alives to a discovery controller) [passed]
    runtime  10.273s  ...  10.272s
nvme/004 (tr=tcp) (test nvme and nvmet UUID NS descriptors)  [failed]
    runtime  0.679s  ...  0.663s
    something found in dmesg:
    [ 1504.963496] run blktests nvme/004 at 2025-11-23 17:23:47
    [ 1505.009127] loop0: detected capacity change from 0 to 1843200
    [ 1505.037981] nvmet: adding nsid 1 to subsystem blktests-subsystem-1
    [ 1505.051739] nvmet_tcp: enabling port 0 (127.0.0.1:4420)
    [ 1505.090842] nvmet: Created nvm controller 1 for subsystem blktests-subsystem-1 for NQN nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349.
    [ 1505.096033] nvme nvme0: creating 48 I/O queues.
    [ 1505.109099] nvme nvme0: mapped 48/0/0 default/read/poll queues.
    [ 1505.124501] nvme nvme0: new ctrl: NQN "blktests-subsystem-1", addr 127.0.0.1:4420, hostnqn: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
    [ 1505.223402] nvme nvme0: Removing ctrl: NQN "blktests-subsystem-1"
    
    ...
    (See '/root/blktests/results/nodev_tr_tcp/nvme/004.dmesg' for the entire message)
nvme/005 (tr=tcp) (reset local loopback target)              [passed]
    runtime  0.350s  ...  0.379s
nvme/006 (tr=tcp bd=device) (create an NVMeOF target)        [passed]
    runtime  0.096s  ...  0.091s
nvme/006 (tr=tcp bd=file) (create an NVMeOF target)          [passed]
    runtime  0.069s  ...  0.068s
nvme/008 (tr=tcp bd=device) (create an NVMeOF host)          [passed]
    runtime  0.274s  ...  0.282s
nvme/008 (tr=tcp bd=file) (create an NVMeOF host)            [passed]
    runtime  0.262s  ...  0.253s
nvme/010 (tr=tcp bd=device) (run data verification fio job)  [passed]
    runtime  97.353s  ...  100.601s
nvme/010 (tr=tcp bd=file) (run data verification fio job)    [passed]
    runtime  220.569s  ...  222.072s
nvme/012 (tr=tcp bd=device) (run mkfs and data verification fio) [passed]
    runtime  86.675s  ...  88.127s
nvme/012 (tr=tcp bd=file) (run mkfs and data verification fio) [passed]
    runtime  202.256s  ...  199.604s
nvme/014 (tr=tcp bd=device) (flush a command from host)      [passed]
    runtime  7.539s  ...  8.545s
nvme/014 (tr=tcp bd=file) (flush a command from host)        [passed]
    runtime  7.046s  ...  7.181s
nvme/016 (tr=tcp) (create/delete many NVMeOF block device-backed ns and test discovery) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/017 (tr=tcp) (create/delete many file-ns and test discovery) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/018 (tr=tcp) (unit test NVMe-oF out of range access on a file backend) [passed]
    runtime  0.273s  ...  0.252s
nvme/019 (tr=tcp bd=device) (test NVMe DSM Discard command)  [passed]
    runtime  0.284s  ...  0.276s
nvme/019 (tr=tcp bd=file) (test NVMe DSM Discard command)    [passed]
    runtime  0.251s  ...  0.255s
nvme/021 (tr=tcp bd=device) (test NVMe list command)         [passed]
    runtime  0.275s  ...  0.282s
nvme/021 (tr=tcp bd=file) (test NVMe list command)           [passed]
    runtime  0.249s  ...  0.255s
nvme/022 (tr=tcp bd=device) (test NVMe reset command)        [passed]
    runtime  0.370s  ...  0.427s
nvme/022 (tr=tcp bd=file) (test NVMe reset command)          [passed]
    runtime  0.334s  ...  0.335s
nvme/023 (tr=tcp bd=device) (test NVMe smart-log command)    [passed]
    runtime  0.273s  ...  0.288s
nvme/023 (tr=tcp bd=file) (test NVMe smart-log command)      [passed]
    runtime  0.241s  ...  0.260s
nvme/025 (tr=tcp bd=device) (test NVMe effects-log)          [passed]
    runtime  0.287s  ...  0.276s
nvme/025 (tr=tcp bd=file) (test NVMe effects-log)            [passed]
    runtime  0.256s  ...  0.255s
nvme/026 (tr=tcp bd=device) (test NVMe ns-descs)             [passed]
    runtime  0.285s  ...  0.279s
nvme/026 (tr=tcp bd=file) (test NVMe ns-descs)               [passed]
    runtime  0.264s  ...  0.258s
nvme/027 (tr=tcp bd=device) (test NVMe ns-rescan command)    [passed]
    runtime  0.309s  ...  0.301s
nvme/027 (tr=tcp bd=file) (test NVMe ns-rescan command)      [passed]
    runtime  0.282s  ...  0.297s
nvme/028 (tr=tcp bd=device) (test NVMe list-subsys)          [passed]
    runtime  0.273s  ...  0.283s
nvme/028 (tr=tcp bd=file) (test NVMe list-subsys)            [passed]
    runtime  0.250s  ...  0.243s
nvme/029 (tr=tcp) (test userspace IO via nvme-cli read/write interface) [passed]
    runtime  0.417s  ...  0.425s
nvme/030 (tr=tcp) (ensure the discovery generation counter is updated appropriately) [passed]
    runtime  0.332s  ...  0.333s
nvme/031 (tr=tcp) (test deletion of NVMeOF controllers immediately after setup) [passed]
    runtime  2.285s  ...  2.351s
nvme/038 (tr=tcp) (test deletion of NVMeOF subsystem without enabling) [passed]
    runtime  0.022s  ...  0.021s
nvme/040 (tr=tcp) (test nvme fabrics controller reset/disconnect operation during I/O) [passed]
    runtime  6.380s  ...  6.370s
nvme/041 (tr=tcp) (Create authenticated connections)         [passed]
    runtime  0.297s  ...  0.298s
nvme/042 (tr=tcp) (Test dhchap key types for authenticated connections)
    runtime  0.221s  ...
WARNING: Test did not clean up port: 0
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
nvme/042 (tr=tcp) (Test dhchap key types for authenticated connections) [failed]ess:uuid:0f01fb42-9f7    runtime  0.221s  ...  0.223se or resource busy
    --- tests/nvme/042.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_tcp/nvme/042.out.bad	2025-11-23 17:35:20.594937060 -0800
    @@ -2,15 +2,4 @@
     Testing hmac 0
     disconnected 1 controller(s)
     Testing hmac 1
    -disconnected 1 controller(s)
    -Testing hmac 2
    -disconnected 1 controller(s)
    -Testing hmac 3
    ...
    (Run 'diff -u tests/nvme/042.out /root/blktests/results/nodev_tr_tcp/nvme/042.out.bad' to see the entire diff)
WARNING: Test did not clean up subsystem: blktests-subsystem-1
rmdir: failed to remove '/sys/kernel/config/nvmet//subsystems/blktests-subsystem-1': Directory not empty
WARNING: Test did not clean up host: nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
rmdir: failed to remove '/sys/kernel/config/nvmet//hosts/nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349': Device or resource busy
nvme/043 (tr=tcp) (Test hash and DH group variations for authenticated connections) [failed]
    runtime  17.749s  ...  17.776s
    --- tests/nvme/043.out	2023-12-04 22:12:59.852774407 -0800
    +++ /root/blktests/results/nodev_tr_tcp/nvme/043.out.bad	2025-11-23 17:35:38.955474971 -0800
    @@ -1,18 +1,19 @@
     Running nvme/043
    +FAIL target setup failed. stale host configuration found
     Testing hash hmac(sha256)
    -disconnected 1 controller(s)
    +disconnected 0 controller(s)
     Testing hash hmac(sha384)
    -disconnected 1 controller(s)
    ...
    (Run 'diff -u tests/nvme/043.out /root/blktests/results/nodev_tr_tcp/nvme/043.out.bad' to see the entire diff)
nvme/044 (tr=tcp) (Test bi-directional authentication)       [passed]
    runtime  0.551s  ...  0.558s
nvme/045 (tr=tcp) (Test re-authentication)                   [passed]
    runtime  0.970s  ...  0.940s
nvme/047 (tr=tcp) (test different queue types for fabric transports) [passed]
    runtime  1.152s  ...  1.162s
nvme/048 (tr=tcp) (Test queue count changes on reconnect)    [passed]
    runtime  6.320s  ...  6.331s
nvme/051 (tr=tcp) (test nvmet concurrent ns enable/disable)  [passed]
    runtime  2.457s  ...  2.137s
nvme/052 (tr=tcp) (Test file-ns creation/deletion under one subsystem) [not run]
    nvme_trtype=tcp is not supported in this test
nvme/054 (tr=tcp) (Test the NVMe reservation feature)        [passed]
    runtime  0.290s  ...  0.308s
nvme/055 (tr=tcp) (Test nvme write to a loop target ns just after ns is disabled) [not run]
    nvme_trtype=tcp is not supported in this test
    kernel option DEBUG_ATOMIC_SLEEP has not been enabled
nvme/056 (tr=tcp) (enable zero copy offload and run rw traffic) [not run]
    Remote target required but NVME_TARGET_CONTROL is not set
    kernel option ULP_DDP has not been enabled
    module nvme_tcp does not have parameter ddp_offload
    KERNELSRC not set
    Kernel sources do not have tools/net/ynl/cli.py
    NVME_IFACE not set
nvme/057 (tr=tcp) (test nvme fabrics controller ANA failover during I/O) [passed]
    runtime  29.714s  ...  28.841s
nvme/058 (tr=tcp) (test rapid namespace remapping)           [passed]
    runtime  2.587s  ...  2.788s
nvme/060 (tr=tcp) (test nvme fabrics target reset)           [passed]
    runtime  19.121s  ...  19.092s
nvme/061 (tr=tcp) (test fabric target teardown and setup during I/O) [passed]
    runtime  8.316s  ...  9.237s
nvme/062 (tr=tcp) (Create TLS-encrypted connections)         [not run]
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/063 (tr=tcp) (Create authenticated TCP connections with secure concatenation) [not run]
    command tlshd is not available
    systemctl unit 'tlshd' is missing
    Install ktls-utils for tlshd
nvme/065 (test unmap write zeroes sysfs interface with nvmet devices) [passed]
    runtime  3.123s  ...  2.724s
blktests (master) # 



-- 
2.40.0



--===============6550902404429778673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6550902404429778673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============6550902404429778673==--
