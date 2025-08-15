Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C80CB27E71
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 12:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfOiyRm5ZSWUVjKCck4rsHgxQfdzmbDyBlwFRHetvwY=; b=I7FFeWYDX6gel1Jbd2X6PMH5Zb
	crbNY8hwVZvYNx7UssMPhukAUUR5pv6ZHuJZGu8zlIt+LrcfdYpTcvapNiriGR+wI5+swEosrQvRK
	2xVsd2+YhyhC3IJO3tSyljr40DrfFe5fl0iluOv17JYDKrtDXNSJWnE56qNm7AOeUqf0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umrpf-0001sK-Ef;
	Fri, 15 Aug 2025 10:38:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umrpe-0001sD-1R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 10:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uMTxzclq7VLFi6As9MP2FQFB0+0+Y5SetsDQ9iIV2c4=; b=BPt9kZ+tP0sW1smok/neY6+v9x
 kS5HPp7QvyGeBViuhTHEx1+lGH72ieUx4dUdBxRPMGHsFKxCCXZX3VNKyWyqhocgjpRXAjOHLzEhh
 SrRauBQUWewQ+Xfqb3LFBWlkW1+Q+5qG/GNx2QtX1+yZAV+l1PG5QIskgnB9bhStDak8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uMTxzclq7VLFi6As9MP2FQFB0+0+Y5SetsDQ9iIV2c4=; b=U8u+JfZUk8PEStJziEKLP8nTKW
 KL0JLqplZBxoLIiTqCBa5Q6pPrarUP5my6UQ9eCs4/KG8YbhT1UkicB525k6fvcpab6GgNipF2FI3
 exVch2m+yp+gwetbXEp21eGVxjREmzT8TEmLb0srqvabvHkKHs4ylHCaZDoB/U/Efqx0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umrpd-0006tt-5E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 10:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D1ADB44A10;
 Fri, 15 Aug 2025 10:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DE4C4CEEB;
 Fri, 15 Aug 2025 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755254314;
 bh=mKYDbbJ3xVFVHZoiVD+mzpsoNqWI0ScdalWH8aW4MdQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ryXP3W3i1h+r3ZBa/WgHxFiq2YOmhKHbSRdQb2l/4dfjuifDylBsaNC2nLwGlpJrg
 6p26y8TZfW11CybLGk+TKZqURkOV++dF/MiA51u/EN5wrqpKeQkJ5FWFlMy1LA3Se7
 4GUU6ul/zNUM5AIRs8argRHd7XIMZUTwS5pgyyRZpSoU0R8US1QPjrC8kOQZgOzoL/
 ABQGL+GzoEhfO27tmSZLdcYIk/zSExDvk5xOcqKt0Vg9OPDVA0pEN4chsDFnC7zZ17
 MAJv6vXKY/9cK0xzjwngUHicGLHGFzK4wk1G07aGbMTmwtSdD+B4T7xDopnUxElL1F
 9EbcPvrLyTY0w==
Message-ID: <7a49cf29-a721-450c-9bd1-c0a5de268ce1@kernel.org>
Date: Fri, 15 Aug 2025 18:38:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yong, Could you please split this patchset to two, 1~13 and
 14~32? and update 1~13 first? I guess 1~13 are almost clear to be merged.
 On 6/10/25 20:37, Sheng Yong wrote: > Hi, folks, > > This patchset tries
 to add an auto testsuit for f2fs-tools, including > fsck.f2fs, inject.f2fs
 for now. > > The patchset can splited into 3 parts: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umrpd-0006tt-5E
Subject: Re: [f2fs-dev] [RFC PATCH v2 00/32] f2fs-tools: add testcases
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Yong,

Could you please split this patchset to two, 1~13 and 14~32? and update
1~13 first? I guess 1~13 are almost clear to be merged.

On 6/10/25 20:37, Sheng Yong wrote:
> Hi, folks,
> 
> This patchset tries to add an auto testsuit for f2fs-tools, including
> fsck.f2fs, inject.f2fs for now.
> 
> The patchset can splited into 3 parts:
>   PATCH 1~9:   is a preparation for testcases. It fixes some errors in
>                fsck and inject, and do some cleanup and improvement for
>                f2fs-tools.
>   PATCH 10~13: add new injection members
>   PATCH 14~32: add testcases
> 
> thanks,
> shengyong
> 
> -8<-
> 
> The following is almost quoted from v1:
> 
> The basic idea of these testcases are:
>  1. create f2fs image
>  2. corrupt the image by inject specific fields
>  3. fsck fixes the image
>  4. verify fsck output with expected message
> 
> Some helper scripts are provided:
>  * test_config.in: is used to derive basic configurations of all
>                    testcases.
>  * runtests.in: is used to derive `runtests' which is used to run
>                 testcases.
>  * filter.sed: removes unnecessary messages and cleanup arbitrary
>                values.
>  * helpers: provides helper functions
> 
> The usage of `runtests':
>  * run all testcases:
>      runtests
>  * run one testcase:
>      runtests <testcase directory path>
>  * cleanup previous results:
>      runtests clean
> 
> To run the testcases on Android, only have to change settings in
> test_config:
>  * set path of $META and $DATA
>  * set path of tools
>  * push tests directory to an Android phone
> NOTE TAHT: the testcases will format $META!!!
> 
> Some testcase requires root permission to mount the image and create
> files.
> 
> Each testcase should have a sub-directory, where three files are needed:
>  * README: describe information of the testcase
>  * script: testcase itself
>  * expect.in: is used to derive expected output message
> 
> New files are generated in the testcase directory after test:
>  * log: output in detail
>  * expect: derived from expect.in
>  * out: output that will be compared with expect
>  * PASS: testcase is passed
>  * FAIL: testcase is failed, in which differ of out and expect is saved
> 
> The name of testcase directory has some optional prefix:
>  * f_: fsck testcase
>  * i_: inject testcase
>  * m_: mkfs testcase
> But there are only fsck and inject testcases for now.
> 
> To run testcases, it's better to compile fsck.f2fs as statically linked
> executable, or `make install' installs tools and libraries. Otherwise,
> libtool compiles f2fs-tools in debug mode and create a wrapper script
> to locate elf executable and libraries. However, dump.f2fs and
> inject.f2fs cannot be used in the wrapper way.
> 
> v2: * add some fix and cleanup
>     * remove img.tar.gz from testcases
>     * add testcases for injection
>     * cleanup helpers script and simplify filter.sed and expected.in
> v1: https://lore.kernel.org/linux-f2fs-devel/20241029120956.4186731-1-shengyong@oppo.com/
> 
> Sheng Yong (32):
>   fsck.f2fs: do not finish/reset zone if dry-run is true
>   f2fs-tools: add option N to answer no for all questions
>   f2fs-tools: cleanup {nid|segno}_in_journal
>   fsck.f2fs: fix invalidate checkpoint
>   dump.f2fs: print more info
>   f2fs-tools: add and export lookup_sit_in_journal
>   inject.f2fs: fix injecting sit/nat in journal
>   inject.f2fs: fix injection on zoned device
>   inject.f2fs: fix and cleanup parsing numeric options
>   inject.f2fs: add members in inject_cp
>   inject.f2fs: add member `feature' in inject_sb
>   inject.f2fs: add members in inject_node
>   inject.f2fs: add member `filename' in inject_dentry
>   tests: prepare helper scripts for testcases
>   tests: add fsck testcase of fixing bad super magic
>   tests: add fsck testcase of fixing errors recorded in sb
>   tests: add fsck testcase of fixing cp crc
>   tests: add fsck testcase of fixing nat entry with invalid ino
>   tests: add fsck testcase of fixing nat entry with invalid blkaddr
>   tests: add fsck testcase of fixing sit entry type
>   tests: add fsck testcase of fixing sit entry vblocks
>   tests: add fsck testcase of fixing sit entry valid_map
>   tests: add fsck testcase of fixing sum entry nid
>   tests: add fsck testcase of fixing sum footer type
>   tests: add fsck testcase of fixing sum entry ofs_in_node
>   tests: add fsck testcase of fixing inode invalid i_addr
>   tests: add fsck testcase of fixing dentry hash code
>   tests: add fsck testcase of fixing lost dots
>   tests: add fsck testcase of fixing duplicated dots
>   tests: add fsck testcase of fixing loop fsync dnodes
>   tests: add inject testcase of injecting META area
>   tests: add inject testcase of injecting node block
> 
>  .gitignore                            |  14 +
>  Makefile.am                           |   2 +-
>  configure.ac                          |   1 +
>  fsck/dump.c                           |  15 +-
>  fsck/f2fs.h                           |  12 +-
>  fsck/fsck.c                           |   2 +-
>  fsck/fsck.h                           |   4 +-
>  fsck/inject.c                         | 438 +++++++++++++++++++++-----
>  fsck/inject.h                         |   1 +
>  fsck/main.c                           |  14 +-
>  fsck/mount.c                          |  61 ++--
>  include/f2fs_fs.h                     |   1 +
>  lib/libf2fs_zoned.c                   |   6 +-
>  man/inject.f2fs.8                     |  43 ++-
>  tests/Makefile.am                     |  26 ++
>  tests/f_cp_bad_crc/README             |   5 +
>  tests/f_cp_bad_crc/expect.in          |   4 +
>  tests/f_cp_bad_crc/script             |  38 +++
>  tests/f_dentry_bad_hash/README        |   8 +
>  tests/f_dentry_bad_hash/expect.in     |   8 +
>  tests/f_dentry_bad_hash/script        |  56 ++++
>  tests/f_dentry_dup_dots/README        |  11 +
>  tests/f_dentry_dup_dots/expect.in     |  26 ++
>  tests/f_dentry_dup_dots/script        |  49 +++
>  tests/f_dentry_lost_dots/README       |   7 +
>  tests/f_dentry_lost_dots/expect.in    |  16 +
>  tests/f_dentry_lost_dots/script       |  37 +++
>  tests/f_inode_bad_iaddr/README        |   6 +
>  tests/f_inode_bad_iaddr/expect.in     |  13 +
>  tests/f_inode_bad_iaddr/script        |  50 +++
>  tests/f_loop_fsync_dnodes/README      |   5 +
>  tests/f_loop_fsync_dnodes/expect.in   |   6 +
>  tests/f_loop_fsync_dnodes/script      |  46 +++
>  tests/f_nat_bad_blkaddr/README        |   4 +
>  tests/f_nat_bad_blkaddr/expect.in     |  12 +
>  tests/f_nat_bad_blkaddr/script        |  25 ++
>  tests/f_nat_bad_ino/README            |   4 +
>  tests/f_nat_bad_ino/expect.in         |  12 +
>  tests/f_nat_bad_ino/script            |  31 ++
>  tests/f_sb_bad_magic/README           |   3 +
>  tests/f_sb_bad_magic/expect.in        |   5 +
>  tests/f_sb_bad_magic/script           |  15 +
>  tests/f_sb_errors/README              |   5 +
>  tests/f_sb_errors/expect.in           |   7 +
>  tests/f_sb_errors/script              |  22 ++
>  tests/f_sit_bad_type/README           |   5 +
>  tests/f_sit_bad_type/expect.in        |   3 +
>  tests/f_sit_bad_type/script           |  38 +++
>  tests/f_sit_bad_valid_map/README      |   5 +
>  tests/f_sit_bad_valid_map/expect.in   |   4 +
>  tests/f_sit_bad_valid_map/script      |  43 +++
>  tests/f_sit_bad_vblocks/README        |   5 +
>  tests/f_sit_bad_vblocks/expect.in     |   3 +
>  tests/f_sit_bad_vblocks/script        |  38 +++
>  tests/f_ssa_bad_nid/README            |   5 +
>  tests/f_ssa_bad_nid/expect.in         |   3 +
>  tests/f_ssa_bad_nid/script            |  36 +++
>  tests/f_ssa_bad_ofs_in_node/README    |   5 +
>  tests/f_ssa_bad_ofs_in_node/expect.in |   3 +
>  tests/f_ssa_bad_ofs_in_node/script    |  36 +++
>  tests/f_ssa_bad_type/README           |   5 +
>  tests/f_ssa_bad_type/expect.in        |   3 +
>  tests/f_ssa_bad_type/script           |  31 ++
>  tests/filter.sed                      |  69 ++++
>  tests/helpers                         | 269 ++++++++++++++++
>  tests/i_meta/README                   |   5 +
>  tests/i_meta/expect.in                |  60 ++++
>  tests/i_meta/script                   | 212 +++++++++++++
>  tests/i_node/README                   |   5 +
>  tests/i_node/expect.in                |  66 ++++
>  tests/i_node/script                   | 166 ++++++++++
>  tests/runtests.in                     |  48 +++
>  tests/test_config.in                  |  53 ++++
>  73 files changed, 2284 insertions(+), 116 deletions(-)
>  create mode 100644 tests/Makefile.am
>  create mode 100644 tests/f_cp_bad_crc/README
>  create mode 100644 tests/f_cp_bad_crc/expect.in
>  create mode 100644 tests/f_cp_bad_crc/script
>  create mode 100644 tests/f_dentry_bad_hash/README
>  create mode 100644 tests/f_dentry_bad_hash/expect.in
>  create mode 100644 tests/f_dentry_bad_hash/script
>  create mode 100644 tests/f_dentry_dup_dots/README
>  create mode 100644 tests/f_dentry_dup_dots/expect.in
>  create mode 100644 tests/f_dentry_dup_dots/script
>  create mode 100644 tests/f_dentry_lost_dots/README
>  create mode 100644 tests/f_dentry_lost_dots/expect.in
>  create mode 100644 tests/f_dentry_lost_dots/script
>  create mode 100644 tests/f_inode_bad_iaddr/README
>  create mode 100644 tests/f_inode_bad_iaddr/expect.in
>  create mode 100644 tests/f_inode_bad_iaddr/script
>  create mode 100644 tests/f_loop_fsync_dnodes/README
>  create mode 100644 tests/f_loop_fsync_dnodes/expect.in
>  create mode 100644 tests/f_loop_fsync_dnodes/script
>  create mode 100644 tests/f_nat_bad_blkaddr/README
>  create mode 100644 tests/f_nat_bad_blkaddr/expect.in
>  create mode 100644 tests/f_nat_bad_blkaddr/script
>  create mode 100644 tests/f_nat_bad_ino/README
>  create mode 100644 tests/f_nat_bad_ino/expect.in
>  create mode 100644 tests/f_nat_bad_ino/script
>  create mode 100644 tests/f_sb_bad_magic/README
>  create mode 100644 tests/f_sb_bad_magic/expect.in
>  create mode 100644 tests/f_sb_bad_magic/script
>  create mode 100644 tests/f_sb_errors/README
>  create mode 100644 tests/f_sb_errors/expect.in
>  create mode 100644 tests/f_sb_errors/script
>  create mode 100644 tests/f_sit_bad_type/README
>  create mode 100644 tests/f_sit_bad_type/expect.in
>  create mode 100644 tests/f_sit_bad_type/script
>  create mode 100644 tests/f_sit_bad_valid_map/README
>  create mode 100644 tests/f_sit_bad_valid_map/expect.in
>  create mode 100644 tests/f_sit_bad_valid_map/script
>  create mode 100644 tests/f_sit_bad_vblocks/README
>  create mode 100644 tests/f_sit_bad_vblocks/expect.in
>  create mode 100644 tests/f_sit_bad_vblocks/script
>  create mode 100644 tests/f_ssa_bad_nid/README
>  create mode 100644 tests/f_ssa_bad_nid/expect.in
>  create mode 100644 tests/f_ssa_bad_nid/script
>  create mode 100644 tests/f_ssa_bad_ofs_in_node/README
>  create mode 100644 tests/f_ssa_bad_ofs_in_node/expect.in
>  create mode 100644 tests/f_ssa_bad_ofs_in_node/script
>  create mode 100644 tests/f_ssa_bad_type/README
>  create mode 100644 tests/f_ssa_bad_type/expect.in
>  create mode 100644 tests/f_ssa_bad_type/script
>  create mode 100644 tests/filter.sed
>  create mode 100644 tests/helpers
>  create mode 100644 tests/i_meta/README
>  create mode 100644 tests/i_meta/expect.in
>  create mode 100644 tests/i_meta/script
>  create mode 100644 tests/i_node/README
>  create mode 100644 tests/i_node/expect.in
>  create mode 100644 tests/i_node/script
>  create mode 100644 tests/runtests.in
>  create mode 100644 tests/test_config.in
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
