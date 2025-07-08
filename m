Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFEAFCD95
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 16:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcavLOZ4sPyMF+2N8wr/BJ0DC6ZfNr2ESq2hz9Ttz2Y=; b=fKzYVYcnSGcl3Zamxkcq3qILrW
	VU2gaS8UX6KHasPqnMdP3x1oDQznq9wLNo+NEDm8NK8freo66z0zNWIUQgJCBrfHZodxv1WJ+FyIv
	hM72Nm6dGOtRFxeAe/D5cWdwVhZjo7vHVJ/T30W5UbAcJE9xa2S6V7g/LufbagxA/B4w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ9Kh-0003mm-DE;
	Tue, 08 Jul 2025 14:30:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uZ9Kf-0003mX-Rn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 14:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sl5esMCPOhRW/Y/mNmYnaPwOY/jEh6l8PMCPHS740jU=; b=MImYjAL70cPnt4ODj1/HHcmI0g
 u70VxVoJDPo5eCfijiu79amfUJ2jwSTVfG9DZVUI0ZmFEIRWT8lvKNRCDXwQmhl/Ye5ObM6wm90Vn
 TovWzo9zaJfm/mJJqmSLj/fsxBvo0a1ih8iBiH0Wto7C1fx+e0/AMG6Xttvgp1rWoWi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sl5esMCPOhRW/Y/mNmYnaPwOY/jEh6l8PMCPHS740jU=; b=TO0RBJ8+grJdEeEgiLWSRFS5Du
 fJ0cuHfF2FCwbFitkrYZtp8Km7/KYhEpoAoqIA2fnqqhyevpA01rMy10152uYthKw3v+kJ5ivI5Su
 +kkKAuEohMe4fBpvWhbkdFtdyUeC6CQPkPjITtPQFvThz1v/zkgnU8HnZGWrwBSUfiOA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uZ9Ke-00070j-Nj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 14:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751984988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sl5esMCPOhRW/Y/mNmYnaPwOY/jEh6l8PMCPHS740jU=;
 b=U6P+YHwA8j8fpIZ2Ay6D4STOhd+fBF9U1ewlk6EnGzB/AxmZNs4gnGnI7ZcoWeoJYz0ceL
 Sj6qM3+lyJ5IyrBNMA0XbGKlHp3y2Bqi9qhonhRpU9GYu6x9NJqQBZC8+sQZjIn078tzri
 O5LrRIN9ErxNyDROoc+B2fIK0v9T1XI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-xdOvJV-EPq2ysdzsEeHKiQ-1; Tue, 08 Jul 2025 10:29:47 -0400
X-MC-Unique: xdOvJV-EPq2ysdzsEeHKiQ-1
X-Mimecast-MFC-AGG-ID: xdOvJV-EPq2ysdzsEeHKiQ_1751984986
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b350d850677so2842557a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Jul 2025 07:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751984986; x=1752589786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sl5esMCPOhRW/Y/mNmYnaPwOY/jEh6l8PMCPHS740jU=;
 b=uxGUXqQBXXmXBUNVyeYZgkyAJVfJdFjHRlxowMrzK4LVKSCppMLTjBK4PaIDybehvW
 rg1RlXD/A/HamLy7Rvo21nvSO/qYxmt9OKQ+xjCotz6R/p0YhUsa+sBnyPgdj08GkTnW
 JupsmJej9VpDKB4fe+oasNnbfr1Ub3mmcaicf+c3bOWsrQOSEER8oyOvjlnKjZxsc4Eb
 P1sRc2XDJmjMjwHtyd9qJaTDNKgNR3Kw5vGjYiVcVU55glp07LaDzS/L9CUT4aGayzIw
 A1KoMnJJ7EiiEs/FV887eHPvMqMV31wAoLRQ/xJRgmqpVsK/5aBkfFiT3xV6SpBpeYAW
 w8wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOTc1nHJNSIShju1CQYmCvGDGhyWSe0xDyi+MMBj6BwWIh6AB7B/ILvGZ2KFsrY11YmibhgCDcwd77pxo17ra0@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywe+Qnh1yX0vHtCzsLlyFdv4x4muQERm0CaY+CkXM0RFQfA0b+9
 VAYMe8Q4e7BhjnnGy+pE0MdOWxsFm/EiSKxXjBmyV7nWFM0gvXtxemYQh670IEA/GSLKtghujQm
 h9xGsds8bxx3qkAYlsr7bBtkL3vsWE4GjwZsqPGCTDAC2WQcwrWe6Jfjk8HOOQ3iQSkSylZLQTv
 UE4q0=
X-Gm-Gg: ASbGncvethvRwDLiGhcNmBjYPedND2RQHXRZCKIo4mn5z4tZYKUDbKrAkuMGaYlNGDq
 8UchEM875o5HE2AUNghu2JRX/E5tyNON23knALmyh5dsPqrhCNcRuftPll190TZN1Y4xIHEHpMU
 10nbFqHiky4IC4EK4hcjRCBFtTVD0yvhOcGz9sBBRP+2TLqFWViSEhEu9aCPQ7sIVhlBYNl4K/Y
 80iUlzl+EZgxZuU+RtV+3bSv95iPUt4OA2NcvwAV5yzMDwUp6yosxm5vk+W2EjP0mPhwZjVhTSJ
 4dYpVa9YkIolG36vOO4F1TOuE2PWTbUNVOdBOY8USH8xn7iolpGOrCxOD+1gpmM=
X-Received: by 2002:a05:6a20:9f45:b0:1f5:8622:5ecb with SMTP id
 adf61e73a8af0-22b1e08737fmr7335458637.34.1751984986050; 
 Tue, 08 Jul 2025 07:29:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBF1qyGFAfKN9l8C2RsthxWvqhKrUEIz1pb3pNlbOdrtJOWf2lDXxsDcNEntMMuhSiBR0mlQ==
X-Received: by 2002:a05:6a20:9f45:b0:1f5:8622:5ecb with SMTP id
 adf61e73a8af0-22b1e08737fmr7335394637.34.1751984985478; 
 Tue, 08 Jul 2025 07:29:45 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee45154fsm11615510a12.14.2025.07.08.07.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 07:29:44 -0700 (PDT)
Date: Tue, 8 Jul 2025 22:29:40 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250708142940.gdfgwrrfszlxuc4g@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250704114818.1878294-1-chao@kernel.org>
 <20250704181446.pum4b7zp2xqvotzx@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <09aa0620-a2ab-4460-b511-3d4537237b5d@kernel.org>
MIME-Version: 1.0
In-Reply-To: <09aa0620-a2ab-4460-b511-3d4537237b5d@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U126___nmuqww3pkPF4CeIQapKSkXie5AC9qxgNkG6k_1751984986
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 07, 2025 at 05:05:31PM +0800, Chao Yu wrote: >
 On 7/5/25 02:14, Zorro Lang wrote: > > On Fri, Jul 04, 2025 at 07:48:18PM
 +0800, Chao Yu wrote: > >> As f2fs changes to use new mount APIs, l [...]
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZ9Ke-00070j-Nj
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/015: test mount options
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 07, 2025 at 05:05:31PM +0800, Chao Yu wrote:
> On 7/5/25 02:14, Zorro Lang wrote:
> > On Fri, Jul 04, 2025 at 07:48:18PM +0800, Chao Yu wrote:
> >> As f2fs changes to use new mount APIs, let's add a new testcase
> >> to check mount result for all f2fs supported mount options and
> >> their combinations, in order to detect any inconsistency during
> >> mount.
> >>
> >> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >> v2:
> >> - allow to check mount options w/ zoned device
> >>  common/rc          |   3 +
> >>  tests/f2fs/015     | 159 ++++++++++++++++++++++++++++++++
> >>  tests/f2fs/015.out | 225 +++++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 387 insertions(+)
> >>  create mode 100755 tests/f2fs/015
> >>  create mode 100644 tests/f2fs/015.out
> >>
> >> diff --git a/common/rc b/common/rc
> >> index f71cc8f0..94fdce7e 100644
> >> --- a/common/rc
> >> +++ b/common/rc
> >> @@ -844,6 +844,9 @@ _test_mkfs()
> >>      ext2|ext3|ext4)
> >>  	$MKFS_PROG -t $FSTYP -- -F $MKFS_OPTIONS $* $TEST_DEV
> >>  	;;
> >> +    f2fs)
> >> +	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $* $TEST_DEV
> >> +	;;
> >>      xfs)
> >>  	_test_options mkfs
> >>  	$MKFS_PROG -t $FSTYP -- -f $TEST_OPTIONS $MKFS_OPTIONS $* $TEST_DEV
> >> diff --git a/tests/f2fs/015 b/tests/f2fs/015
> >> new file mode 100755
> >> index 00000000..746e79de
> >> --- /dev/null
> >> +++ b/tests/f2fs/015
> >> @@ -0,0 +1,159 @@
> >> +#! /bin/bash
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> >> +#
> >> +# FS QA Test No. f2fs/015
> >> +#
> >> +# This testcase tries to check stability of mount result
> >> +# w/ all f2fs supported mount option and their combination.
> >> +#
> >> +. ./common/preamble
> >> +_begin_fstest auto quick
> >> +_require_kernel_config CONFIG_F2FS_FS_XATTR
> >> +_require_kernel_config CONFIG_F2FS_FS_POSIX_ACL
> >> +_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
> >> +_require_kernel_config CONFIG_F2FS_FS_COMPRESSION
> >> +_require_kernel_config CONFIG_F2FS_FS_LZO
> >> +_require_kernel_config CONFIG_F2FS_FS_LZORLE
> >> +_require_kernel_config CONFIG_F2FS_FS_LZ4
> >> +_require_kernel_config CONFIG_F2FS_FS_LZ4HC
> >> +_require_kernel_config CONFIG_F2FS_FS_ZSTD
> >> +
> >> +_require_zoned_device "$TEST_DEV"
> > 
> > This requirement limit this test case only on zoned device...
> > Maybe you can slip this test case to 2~3 cases, let some common
> > mount options can be tested at first, some unimportant mount
> > options can be tested in another case, then zoned device related
> > mount options be tested in a seperated case ?
> 
> Good idea, do you want to uplift common mount option testcase to
> generic/ directory? or is it fine to leave it in f2fs/ now?

If you'd like to write a test case for mount(8) "COMMAND-LINE OPTIONS"
and "FILESYSTEM-INDEPENDENT MOUNT OPTIONS", that's good too :)

For this case I think it's fine to leave it in f2fs. Since new-mount
APIs were brought in, more and more filesystems have their own xfs mount
options test cases as what you are doing for f2fs now. These cases are
$FSTYP specific test mostly.

Thanks,
Zorro

> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
> >> +_test_unmount >> $seqres.full 2>&1
> >> +
> >> +options=(
> >> +#	mount_option			mkfs_option
> >> +	"background_gc=on"		""			\
> >> +	"background_gc=off"		""			\
> >> +	"background_gc=sync"		""			\
> >> +	"background_gc=on"		"blkzone"		\
> >> +	"background_gc=off"		"blkzone"		\
> >> +	"background_gc=sync"		"blkzone"		\
> >> +	"disable_roll_forward"		""			\
> >> +	"norecovery"			""			\
> >> +	"discard"			""			\
> >> +	"nodiscard"			""			\
> >> +	"no_heap"			""			\
> >> +	"heap"				""			\
> >> +	"user_xattr"			""			\
> >> +	"nouser_xattr"			""			\
> >> +	"acl"				""			\
> >> +	"noacl"				""			\
> >> +	"active_logs=2"			""			\
> >> +	"active_logs=4"			""			\
> >> +	"active_logs=6"			""			\
> >> +	"disable_ext_identify"		""			\
> >> +	"inline_xattr"			""			\
> >> +	"noinline_xattr"		""			\
> >> +	"inline_xattr_size=400"		"extra,flexible_inline_xattr"\
> >> +	"inline_xattr_size=400"		""			\
> >> +	"inline_data"			""			\
> >> +	"noinline_dentry"		""			\
> >> +	"inline_dentry"			""			\
> >> +	"noinline_dentry"		""			\
> >> +	"flush_merge"			""			\
> >> +	"noflush_merge"			""			\
> >> +	"barrier"			""			\
> >> +	"nobarrier"			""			\
> >> +	"fastboot"			""			\
> >> +	"extent_cache"			""			\
> >> +	"noextent_cache"		""			\
> >> +	"data_flush"			""			\
> >> +	"reserve_root=32768"		""			\
> >> +	"resuid=1000"			""			\
> >> +	"resgid=1000"			""			\
> >> +	"fault_injection=100"		""			\
> >> +	"fault_type=4095"		""			\
> >> +	"mode=adaptive"			""			\
> >> +	"mode=lfs"			""			\
> >> +	"mode=fragment:segment"		""			\
> >> +	"mode=fragment:block"		""			\
> >> +	"mode=adaptive"			"blkzone"		\
> >> +	"mode=lfs"			"blkzone"		\
> >> +	"mode=fragment:segment"		"blkzone"		\
> >> +	"mode=fragment:block"		"blkzone"		\
> >> +	"usrquota"			""			\
> >> +	"grpquota"			""			\
> >> +	"prjquota"			""			\
> >> +	"usrjquota=ausrquota"		""			\
> >> +	"grpjquota=agrpquota"		""			\
> >> +	"prjjquota=aprjquota"		""			\
> >> +	"jqfmt=vfsold"			""			\
> >> +	"jqfmt=vfsv0"			""			\
> >> +	"jqfmt=vfsv1"			""			\
> >> +	"usrjquota="			""			\
> >> +	"grpjquota="			""			\
> >> +	"prjjquota="			""			\
> >> +	"quota"				""			\
> >> +	"noquota"			""			\
> >> +	"alloc_mode=reuse"		""			\
> >> +	"alloc_mode=default"		""			\
> >> +	"fsync_mode=posix"		""			\
> >> +	"fsync_mode=strict"		""			\
> >> +	"fsync_mode=nobarrier"		""			\
> >> +	"test_dummy_encryption"		""			\
> >> +	"test_dummy_encryption=v1"	""			\
> >> +	"test_dummy_encryption=v2"	""			\
> >> +	"checkpoint=enable"		""			\
> >> +	"checkpoint=disable"		""			\
> >> +	"checkpoint=disable:32768"	""			\
> >> +	"checkpoint=disable:50%"	""			\
> >> +	"checkpoint_merge"		""			\
> >> +	"nocheckpoint_merge"		""			\
> >> +	"compress_algorithm=lzo"	""			\
> >> +	"compress_algorithm=lzo"	"extra,compression"	\
> >> +	"compress_algorithm=lz4"	"extra,compression"	\
> >> +	"compress_algorithm=zstd"	"extra,compression"	\
> >> +	"compress_algorithm=lzo-rle"	"extra,compression"	\
> >> +	"compress_algorithm=lz4:3"	"extra,compression"	\
> >> +	"compress_algorithm=zstd:1"	"extra,compression"	\
> >> +	"compress_log_size=8"		"extra,compression"	\
> >> +	"compress_extension=so"		"extra,compression"	\
> >> +	"nocompress_extension=so"	"extra,compression"	\
> >> +	"nocompress_extension=*"	"extra,compression"	\
> >> +	"compress_extension=so,nocompress_extension=so"		\
> >> +					"extra,compression"	\
> >> +	"compress_chksum"		"extra,compression"	\
> >> +	"compress_mode=fs"		"extra,compression"	\
> >> +	"compress_mode=user"		"extra,compression"	\
> >> +	"compress_cache"		"extra,compression"	\
> >> +	"inlinecrypt"			""			\
> >> +	"atgc"				""			\
> >> +	"discard_unit=block"		""			\
> >> +	"discard_unit=segment"		""			\
> >> +	"discard_unit=section"		""			\
> >> +	"discard_unit=block"		"blkzone"		\
> >> +	"discard_unit=segment"		"blkzone"		\
> >> +	"discard_unit=section"		"blkzone"		\
> >> +	"memory=normal"			""			\
> >> +	"memory=low"			""			\
> >> +	"age_extent_cache"		""			\
> >> +	"errors=panic"			""			\
> >> +	"errors=continue"		""			\
> >> +	"errors=remount-ro"		""			\
> >> +	"nat_bits"			""			\
> >> +	"atgc,mode=lfs"			""			\
> >> +	"ro,flush_merge"		""			\
> >> +	"rw"				"ro"			\
> >> +	"norecovery,ro"			""			\
> >> +)
> >> +
> >> +for ((i=0;i<${#options[@]};i=i+2))
> >> +do
> >> +	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
> >> +	if [ "${options[$((i+1))]}" == "blkzone" ]; then
> >> +		_test_mkfs "-m" >> $seqres.full
> >> +		_test_mount "-o ${options[$i]}" >> $seqres.full 2>&1
> >> +		echo $?
> >> +		_test_unmount >> $seqres.full 2>&1
> >> +	else
> >> +		_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full
> >> +		_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
> >> +		echo $?
> >> +		_scratch_unmount >> $seqres.full 2>&1
> >> +	fi
> >> +done
> >> +
> >> +status=0
> >> +exit
> >> diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
> >> new file mode 100644
> >> index 00000000..d7f4e62a
> >> --- /dev/null
> >> +++ b/tests/f2fs/015.out
> >> @@ -0,0 +1,225 @@
> >> +QA output created by 015
> >> +Option#0: background_gc=on : 
> >> +0
> >> +Option#2: background_gc=off : 
> >> +0
> >> +Option#4: background_gc=sync : 
> >> +0
> >> +Option#6: background_gc=on : blkzone
> >> +0
> >> +Option#8: background_gc=off : blkzone
> >> +32
> >> +Option#10: background_gc=sync : blkzone
> >> +0
> >> +Option#12: disable_roll_forward : 
> >> +0
> >> +Option#14: norecovery : 
> >> +32
> >> +Option#16: discard : 
> >> +0
> >> +Option#18: nodiscard : 
> >> +0
> >> +Option#20: no_heap : 
> >> +0
> >> +Option#22: heap : 
> >> +0
> >> +Option#24: user_xattr : 
> >> +0
> >> +Option#26: nouser_xattr : 
> >> +0
> >> +Option#28: acl : 
> >> +0
> >> +Option#30: noacl : 
> >> +0
> >> +Option#32: active_logs=2 : 
> >> +0
> >> +Option#34: active_logs=4 : 
> >> +0
> >> +Option#36: active_logs=6 : 
> >> +0
> >> +Option#38: disable_ext_identify : 
> >> +0
> >> +Option#40: inline_xattr : 
> >> +0
> >> +Option#42: noinline_xattr : 
> >> +0
> >> +Option#44: inline_xattr_size=400 : extra,flexible_inline_xattr
> >> +32
> >> +Option#46: inline_xattr_size=400 : 
> >> +32
> >> +Option#48: inline_data : 
> >> +0
> >> +Option#50: noinline_dentry : 
> >> +0
> >> +Option#52: inline_dentry : 
> >> +0
> >> +Option#54: noinline_dentry : 
> >> +0
> >> +Option#56: flush_merge : 
> >> +0
> >> +Option#58: noflush_merge : 
> >> +0
> >> +Option#60: barrier : 
> >> +0
> >> +Option#62: nobarrier : 
> >> +0
> >> +Option#64: fastboot : 
> >> +0
> >> +Option#66: extent_cache : 
> >> +0
> >> +Option#68: noextent_cache : 
> >> +0
> >> +Option#70: data_flush : 
> >> +0
> >> +Option#72: reserve_root=32768 : 
> >> +0
> >> +Option#74: resuid=1000 : 
> >> +0
> >> +Option#76: resgid=1000 : 
> >> +0
> >> +Option#78: fault_injection=100 : 
> >> +0
> >> +Option#80: fault_type=4095 : 
> >> +0
> >> +Option#82: mode=adaptive : 
> >> +0
> >> +Option#84: mode=lfs : 
> >> +0
> >> +Option#86: mode=fragment:segment : 
> >> +0
> >> +Option#88: mode=fragment:block : 
> >> +0
> >> +Option#90: mode=adaptive : blkzone
> >> +32
> >> +Option#92: mode=lfs : blkzone
> >> +0
> >> +Option#94: mode=fragment:segment : blkzone
> >> +32
> >> +Option#96: mode=fragment:block : blkzone
> >> +32
> >> +Option#98: usrquota : 
> >> +0
> >> +Option#100: grpquota : 
> >> +0
> >> +Option#102: prjquota : 
> >> +32
> >> +Option#104: usrjquota=ausrquota : 
> >> +32
> >> +Option#106: grpjquota=agrpquota : 
> >> +32
> >> +Option#108: prjjquota=aprjquota : 
> >> +32
> >> +Option#110: jqfmt=vfsold : 
> >> +0
> >> +Option#112: jqfmt=vfsv0 : 
> >> +0
> >> +Option#114: jqfmt=vfsv1 : 
> >> +0
> >> +Option#116: usrjquota= : 
> >> +0
> >> +Option#118: grpjquota= : 
> >> +0
> >> +Option#120: prjjquota= : 
> >> +0
> >> +Option#122: quota : 
> >> +0
> >> +Option#124: noquota : 
> >> +0
> >> +Option#126: alloc_mode=reuse : 
> >> +0
> >> +Option#128: alloc_mode=default : 
> >> +0
> >> +Option#130: fsync_mode=posix : 
> >> +0
> >> +Option#132: fsync_mode=strict : 
> >> +0
> >> +Option#134: fsync_mode=nobarrier : 
> >> +0
> >> +Option#136: test_dummy_encryption : 
> >> +32
> >> +Option#138: test_dummy_encryption=v1 : 
> >> +32
> >> +Option#140: test_dummy_encryption=v2 : 
> >> +32
> >> +Option#142: checkpoint=enable : 
> >> +0
> >> +Option#144: checkpoint=disable : 
> >> +0
> >> +Option#146: checkpoint=disable:32768 : 
> >> +0
> >> +Option#148: checkpoint=disable:50% : 
> >> +0
> >> +Option#150: checkpoint_merge : 
> >> +0
> >> +Option#152: nocheckpoint_merge : 
> >> +0
> >> +Option#154: compress_algorithm=lzo : 
> >> +0
> >> +Option#156: compress_algorithm=lzo : extra,compression
> >> +0
> >> +Option#158: compress_algorithm=lz4 : extra,compression
> >> +0
> >> +Option#160: compress_algorithm=zstd : extra,compression
> >> +0
> >> +Option#162: compress_algorithm=lzo-rle : extra,compression
> >> +0
> >> +Option#164: compress_algorithm=lz4:3 : extra,compression
> >> +0
> >> +Option#166: compress_algorithm=zstd:1 : extra,compression
> >> +0
> >> +Option#168: compress_log_size=8 : extra,compression
> >> +0
> >> +Option#170: compress_extension=so : extra,compression
> >> +0
> >> +Option#172: nocompress_extension=so : extra,compression
> >> +0
> >> +Option#174: nocompress_extension=* : extra,compression
> >> +0
> >> +Option#176: compress_extension=so,nocompress_extension=so : extra,compression
> >> +0
> >> +Option#178: compress_chksum : extra,compression
> >> +0
> >> +Option#180: compress_mode=fs : extra,compression
> >> +0
> >> +Option#182: compress_mode=user : extra,compression
> >> +0
> >> +Option#184: compress_cache : extra,compression
> >> +0
> >> +Option#186: inlinecrypt : 
> >> +0
> >> +Option#188: atgc : 
> >> +0
> >> +Option#190: discard_unit=block : 
> >> +0
> >> +Option#192: discard_unit=segment : 
> >> +0
> >> +Option#194: discard_unit=section : 
> >> +0
> >> +Option#196: discard_unit=block : blkzone
> >> +0
> >> +Option#198: discard_unit=segment : blkzone
> >> +0
> >> +Option#200: discard_unit=section : blkzone
> >> +0
> >> +Option#202: memory=normal : 
> >> +0
> >> +Option#204: memory=low : 
> >> +0
> >> +Option#206: age_extent_cache : 
> >> +0
> >> +Option#208: errors=panic : 
> >> +0
> >> +Option#210: errors=continue : 
> >> +0
> >> +Option#212: errors=remount-ro : 
> >> +0
> >> +Option#214: nat_bits : 
> >> +0
> >> +Option#216: atgc,mode=lfs : 
> >> +32
> >> +Option#218: ro,flush_merge : 
> >> +32
> >> +Option#220: rw : ro
> >> +0
> >> +Option#222: norecovery,ro : 
> >> +0
> >> -- 
> >> 2.49.0
> >>
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
