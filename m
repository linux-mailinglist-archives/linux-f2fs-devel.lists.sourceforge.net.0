Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58166AD3D2E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NK8pvmoZQwfXFa0zUu82cDR15ARkVAN1sZuCv3mREZs=; b=dInrencCCMIDrQbSObEZ4zijVD
	gQQRQjGHGI2HYEyMrgYDWdZpwuJE73I3DpZrLx1MbFVXjeLM3FLz9uf3ZLss4n5amrZqxjaoFNsOu
	I2KTuF0wjwl45VOv8pw7vE5Gg2LZIbkcFIVQGj5hCBFg07WqtEafVvJL2ElCqXjwFIGU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0wv-0006YW-5O;
	Tue, 10 Jun 2025 15:31:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0wt-0006YL-Uh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pmfMm7Nb1yNlzF6R6rI5VL4E5dOk2r0mgiTxkKHGcwI=; b=Jsr65LZ4FR2hXT9TPnBCl2L39I
 fBHUHeRramGQ2r8i0c/jenRGF+iT1DNsC7Y8DeECZD8tFha/3tYDV25wi11DVgzFDc+K/KijNDmLn
 7FLhkslvBSPBIWB290gE1dzpV4w9+s3lbytpnwdD4bi9r5cY8/qpKwxoqOdxlXux9YVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pmfMm7Nb1yNlzF6R6rI5VL4E5dOk2r0mgiTxkKHGcwI=; b=R
 Fg9wnWimAu5MlgDjPrvoB1ABYxNoH4PwuxYOQJ+cwrHdWbs/vffH5Qwy5VubaLtwveK/cohEheQzs
 ctcxY+W3myrnE+oxSNBPqXaiI/OsD8qg7be+4BfSnLrvSNdAHeOR9aoP09GuWHY9Y7TLBg4mCUSx4
 cTQ1P4VI14otj7/Q=;
Received: from mail-qv1-f42.google.com ([209.85.219.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0ws-0005HX-J1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:31:39 +0000
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6face367320so51149146d6.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569488; x=1750174288; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pmfMm7Nb1yNlzF6R6rI5VL4E5dOk2r0mgiTxkKHGcwI=;
 b=DWhWhC6piAL13Zyh6wtjnIuEy6NxiCcu8bZgGyWfHSCY9cydKl4MyOqoMsYdt8Fktf
 ilnuJ8H5H59nbKA0nsGRfUHWl+pUEHZT9p5o0DfrRWXs/ITayTnIXJ1WSDNm6xSi7eWU
 O47Pkdjs8U0HHrHH9/mCL4mS92ITAbJGXrQJ9cymcUT5NOvGD4smlkrWML9Rrg8G5C0h
 iCD+EbKOWWsTTeK97614fZYpWyfc2iOW8SGxYS3uGEcOunl0+SCgTwjN/PLKgLov2F66
 Q6V/S7z3ZwpJcTV8qS+qo0i64hS77ZW/A6Ry7wm1Nbbj2Y9qRcngbH6jMJtS6nt99etd
 wxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569488; x=1750174288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmfMm7Nb1yNlzF6R6rI5VL4E5dOk2r0mgiTxkKHGcwI=;
 b=rmi2F75YeL+Hg5+kelE4qH6BVPv7BzMANXXhn4dpQKKZChzfD+puR6BJCpB1IQ/WF4
 6WyCH5xXLgmfasq/EuTokS9BXChQHsQ39I6/3bO5YX67+DMuqsmfqOh/ahZyIREZ9Rw+
 05fdBj6vKvFRSMlsVrY9J7LGf0rOEiZkjmeuFXHX8BW/or1G4wk5X40/TZHvsXmLpCpJ
 LZWCnJoU5NrOrkUL6P/vpc02xpXEiOJDkGq0tmBaZOaAKJOEJeYzs7pAM7mjjRDty/6h
 rpNKx/gJiL1YQof/hbpbZR7DXk92fDO1en8vF8AMI9APIzk9NMNzoX+IprSHDiD2/wQs
 XS4g==
X-Gm-Message-State: AOJu0YxLz+emUXF6JTMLQ/6iz83uduQyrKs8pHOU4eny7tpGKwwmagUv
 WMRMSzLvwb2+xCWMCYNHmIZCpmz72MeEQRtlOeOBB01dU/jE6kbGUp5TGPjSvQ==
X-Gm-Gg: ASbGncuV4/F3h07hF8Cib3JXSkvXS9SeioH44NTERXA9pYUdXMAYWvm9v7rxn4WUDJz
 9hH83zUZYyFzoPq0gr4Qf2loPOHJBsIRV5VSTpOGgbEe7/iOK/sNNFWTrvgwJ+YQLahJL1JEeqZ
 diLMvYC5dKHZ7NN+CTQoMxngPt/isexridLuaaUyJAXxnTb6gZx0QCjRqH2NQ3dfcz9ERolzCDg
 Gl3T0PLabc9uf8RdsTNCpc3vP9Z5hH/rzc9eAERzs0QvpLf9v+bulW8F4XZ/FwREi4bhQUoJi1G
 DLjutq0Ib7rw0895LBwruHDI7b647Tdul+VfOAup12s4qdzAhfMlu3u6E/4OmaxXV/0RLl5puHO
 aaGE=
X-Google-Smtp-Source: AGHT+IHWHS/zaVodYaZBtZ0SDo4LUpPqudtQgvCNAXqncoFA+SdWL0cXO5qDPbXIWYnqt+UfQIOptw==
X-Received: by 2002:a05:6a21:2d4b:b0:1f5:6c7b:8920 with SMTP id
 adf61e73a8af0-21ee24fd600mr24948393637.9.1749559081968; 
 Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:10 +0800
Message-ID: <20250610123743.667183-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, folks, This patchset tries to add an auto testsuit for
 f2fs-tools, including fsck.f2fs, inject.f2fs for now. The patchset can splited
 into 3 parts: PATCH 1~9: is a preparation for testcases. It fixes some errors
 in fsck and inject, and do some cleanup and improvement for f2fs-tools. PATCH
 10~13: add new inje [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uP0ws-0005HX-J1
Subject: [f2fs-dev] [RFC PATCH v2 00/32] f2fs-tools: add testcases
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, folks,

This patchset tries to add an auto testsuit for f2fs-tools, including
fsck.f2fs, inject.f2fs for now.

The patchset can splited into 3 parts:
  PATCH 1~9:   is a preparation for testcases. It fixes some errors in
               fsck and inject, and do some cleanup and improvement for
               f2fs-tools.
  PATCH 10~13: add new injection members
  PATCH 14~32: add testcases

thanks,
shengyong

-8<-

The following is almost quoted from v1:

The basic idea of these testcases are:
 1. create f2fs image
 2. corrupt the image by inject specific fields
 3. fsck fixes the image
 4. verify fsck output with expected message

Some helper scripts are provided:
 * test_config.in: is used to derive basic configurations of all
                   testcases.
 * runtests.in: is used to derive `runtests' which is used to run
                testcases.
 * filter.sed: removes unnecessary messages and cleanup arbitrary
               values.
 * helpers: provides helper functions

The usage of `runtests':
 * run all testcases:
     runtests
 * run one testcase:
     runtests <testcase directory path>
 * cleanup previous results:
     runtests clean

To run the testcases on Android, only have to change settings in
test_config:
 * set path of $META and $DATA
 * set path of tools
 * push tests directory to an Android phone
NOTE TAHT: the testcases will format $META!!!

Some testcase requires root permission to mount the image and create
files.

Each testcase should have a sub-directory, where three files are needed:
 * README: describe information of the testcase
 * script: testcase itself
 * expect.in: is used to derive expected output message

New files are generated in the testcase directory after test:
 * log: output in detail
 * expect: derived from expect.in
 * out: output that will be compared with expect
 * PASS: testcase is passed
 * FAIL: testcase is failed, in which differ of out and expect is saved

The name of testcase directory has some optional prefix:
 * f_: fsck testcase
 * i_: inject testcase
 * m_: mkfs testcase
But there are only fsck and inject testcases for now.

To run testcases, it's better to compile fsck.f2fs as statically linked
executable, or `make install' installs tools and libraries. Otherwise,
libtool compiles f2fs-tools in debug mode and create a wrapper script
to locate elf executable and libraries. However, dump.f2fs and
inject.f2fs cannot be used in the wrapper way.

v2: * add some fix and cleanup
    * remove img.tar.gz from testcases
    * add testcases for injection
    * cleanup helpers script and simplify filter.sed and expected.in
v1: https://lore.kernel.org/linux-f2fs-devel/20241029120956.4186731-1-shengyong@oppo.com/

Sheng Yong (32):
  fsck.f2fs: do not finish/reset zone if dry-run is true
  f2fs-tools: add option N to answer no for all questions
  f2fs-tools: cleanup {nid|segno}_in_journal
  fsck.f2fs: fix invalidate checkpoint
  dump.f2fs: print more info
  f2fs-tools: add and export lookup_sit_in_journal
  inject.f2fs: fix injecting sit/nat in journal
  inject.f2fs: fix injection on zoned device
  inject.f2fs: fix and cleanup parsing numeric options
  inject.f2fs: add members in inject_cp
  inject.f2fs: add member `feature' in inject_sb
  inject.f2fs: add members in inject_node
  inject.f2fs: add member `filename' in inject_dentry
  tests: prepare helper scripts for testcases
  tests: add fsck testcase of fixing bad super magic
  tests: add fsck testcase of fixing errors recorded in sb
  tests: add fsck testcase of fixing cp crc
  tests: add fsck testcase of fixing nat entry with invalid ino
  tests: add fsck testcase of fixing nat entry with invalid blkaddr
  tests: add fsck testcase of fixing sit entry type
  tests: add fsck testcase of fixing sit entry vblocks
  tests: add fsck testcase of fixing sit entry valid_map
  tests: add fsck testcase of fixing sum entry nid
  tests: add fsck testcase of fixing sum footer type
  tests: add fsck testcase of fixing sum entry ofs_in_node
  tests: add fsck testcase of fixing inode invalid i_addr
  tests: add fsck testcase of fixing dentry hash code
  tests: add fsck testcase of fixing lost dots
  tests: add fsck testcase of fixing duplicated dots
  tests: add fsck testcase of fixing loop fsync dnodes
  tests: add inject testcase of injecting META area
  tests: add inject testcase of injecting node block

 .gitignore                            |  14 +
 Makefile.am                           |   2 +-
 configure.ac                          |   1 +
 fsck/dump.c                           |  15 +-
 fsck/f2fs.h                           |  12 +-
 fsck/fsck.c                           |   2 +-
 fsck/fsck.h                           |   4 +-
 fsck/inject.c                         | 438 +++++++++++++++++++++-----
 fsck/inject.h                         |   1 +
 fsck/main.c                           |  14 +-
 fsck/mount.c                          |  61 ++--
 include/f2fs_fs.h                     |   1 +
 lib/libf2fs_zoned.c                   |   6 +-
 man/inject.f2fs.8                     |  43 ++-
 tests/Makefile.am                     |  26 ++
 tests/f_cp_bad_crc/README             |   5 +
 tests/f_cp_bad_crc/expect.in          |   4 +
 tests/f_cp_bad_crc/script             |  38 +++
 tests/f_dentry_bad_hash/README        |   8 +
 tests/f_dentry_bad_hash/expect.in     |   8 +
 tests/f_dentry_bad_hash/script        |  56 ++++
 tests/f_dentry_dup_dots/README        |  11 +
 tests/f_dentry_dup_dots/expect.in     |  26 ++
 tests/f_dentry_dup_dots/script        |  49 +++
 tests/f_dentry_lost_dots/README       |   7 +
 tests/f_dentry_lost_dots/expect.in    |  16 +
 tests/f_dentry_lost_dots/script       |  37 +++
 tests/f_inode_bad_iaddr/README        |   6 +
 tests/f_inode_bad_iaddr/expect.in     |  13 +
 tests/f_inode_bad_iaddr/script        |  50 +++
 tests/f_loop_fsync_dnodes/README      |   5 +
 tests/f_loop_fsync_dnodes/expect.in   |   6 +
 tests/f_loop_fsync_dnodes/script      |  46 +++
 tests/f_nat_bad_blkaddr/README        |   4 +
 tests/f_nat_bad_blkaddr/expect.in     |  12 +
 tests/f_nat_bad_blkaddr/script        |  25 ++
 tests/f_nat_bad_ino/README            |   4 +
 tests/f_nat_bad_ino/expect.in         |  12 +
 tests/f_nat_bad_ino/script            |  31 ++
 tests/f_sb_bad_magic/README           |   3 +
 tests/f_sb_bad_magic/expect.in        |   5 +
 tests/f_sb_bad_magic/script           |  15 +
 tests/f_sb_errors/README              |   5 +
 tests/f_sb_errors/expect.in           |   7 +
 tests/f_sb_errors/script              |  22 ++
 tests/f_sit_bad_type/README           |   5 +
 tests/f_sit_bad_type/expect.in        |   3 +
 tests/f_sit_bad_type/script           |  38 +++
 tests/f_sit_bad_valid_map/README      |   5 +
 tests/f_sit_bad_valid_map/expect.in   |   4 +
 tests/f_sit_bad_valid_map/script      |  43 +++
 tests/f_sit_bad_vblocks/README        |   5 +
 tests/f_sit_bad_vblocks/expect.in     |   3 +
 tests/f_sit_bad_vblocks/script        |  38 +++
 tests/f_ssa_bad_nid/README            |   5 +
 tests/f_ssa_bad_nid/expect.in         |   3 +
 tests/f_ssa_bad_nid/script            |  36 +++
 tests/f_ssa_bad_ofs_in_node/README    |   5 +
 tests/f_ssa_bad_ofs_in_node/expect.in |   3 +
 tests/f_ssa_bad_ofs_in_node/script    |  36 +++
 tests/f_ssa_bad_type/README           |   5 +
 tests/f_ssa_bad_type/expect.in        |   3 +
 tests/f_ssa_bad_type/script           |  31 ++
 tests/filter.sed                      |  69 ++++
 tests/helpers                         | 269 ++++++++++++++++
 tests/i_meta/README                   |   5 +
 tests/i_meta/expect.in                |  60 ++++
 tests/i_meta/script                   | 212 +++++++++++++
 tests/i_node/README                   |   5 +
 tests/i_node/expect.in                |  66 ++++
 tests/i_node/script                   | 166 ++++++++++
 tests/runtests.in                     |  48 +++
 tests/test_config.in                  |  53 ++++
 73 files changed, 2284 insertions(+), 116 deletions(-)
 create mode 100644 tests/Makefile.am
 create mode 100644 tests/f_cp_bad_crc/README
 create mode 100644 tests/f_cp_bad_crc/expect.in
 create mode 100644 tests/f_cp_bad_crc/script
 create mode 100644 tests/f_dentry_bad_hash/README
 create mode 100644 tests/f_dentry_bad_hash/expect.in
 create mode 100644 tests/f_dentry_bad_hash/script
 create mode 100644 tests/f_dentry_dup_dots/README
 create mode 100644 tests/f_dentry_dup_dots/expect.in
 create mode 100644 tests/f_dentry_dup_dots/script
 create mode 100644 tests/f_dentry_lost_dots/README
 create mode 100644 tests/f_dentry_lost_dots/expect.in
 create mode 100644 tests/f_dentry_lost_dots/script
 create mode 100644 tests/f_inode_bad_iaddr/README
 create mode 100644 tests/f_inode_bad_iaddr/expect.in
 create mode 100644 tests/f_inode_bad_iaddr/script
 create mode 100644 tests/f_loop_fsync_dnodes/README
 create mode 100644 tests/f_loop_fsync_dnodes/expect.in
 create mode 100644 tests/f_loop_fsync_dnodes/script
 create mode 100644 tests/f_nat_bad_blkaddr/README
 create mode 100644 tests/f_nat_bad_blkaddr/expect.in
 create mode 100644 tests/f_nat_bad_blkaddr/script
 create mode 100644 tests/f_nat_bad_ino/README
 create mode 100644 tests/f_nat_bad_ino/expect.in
 create mode 100644 tests/f_nat_bad_ino/script
 create mode 100644 tests/f_sb_bad_magic/README
 create mode 100644 tests/f_sb_bad_magic/expect.in
 create mode 100644 tests/f_sb_bad_magic/script
 create mode 100644 tests/f_sb_errors/README
 create mode 100644 tests/f_sb_errors/expect.in
 create mode 100644 tests/f_sb_errors/script
 create mode 100644 tests/f_sit_bad_type/README
 create mode 100644 tests/f_sit_bad_type/expect.in
 create mode 100644 tests/f_sit_bad_type/script
 create mode 100644 tests/f_sit_bad_valid_map/README
 create mode 100644 tests/f_sit_bad_valid_map/expect.in
 create mode 100644 tests/f_sit_bad_valid_map/script
 create mode 100644 tests/f_sit_bad_vblocks/README
 create mode 100644 tests/f_sit_bad_vblocks/expect.in
 create mode 100644 tests/f_sit_bad_vblocks/script
 create mode 100644 tests/f_ssa_bad_nid/README
 create mode 100644 tests/f_ssa_bad_nid/expect.in
 create mode 100644 tests/f_ssa_bad_nid/script
 create mode 100644 tests/f_ssa_bad_ofs_in_node/README
 create mode 100644 tests/f_ssa_bad_ofs_in_node/expect.in
 create mode 100644 tests/f_ssa_bad_ofs_in_node/script
 create mode 100644 tests/f_ssa_bad_type/README
 create mode 100644 tests/f_ssa_bad_type/expect.in
 create mode 100644 tests/f_ssa_bad_type/script
 create mode 100644 tests/filter.sed
 create mode 100644 tests/helpers
 create mode 100644 tests/i_meta/README
 create mode 100644 tests/i_meta/expect.in
 create mode 100644 tests/i_meta/script
 create mode 100644 tests/i_node/README
 create mode 100644 tests/i_node/expect.in
 create mode 100644 tests/i_node/script
 create mode 100644 tests/runtests.in
 create mode 100644 tests/test_config.in

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
