Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8FB28370
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jgspkdvldq1FOKGr/Yp9mVpaUY65kIYWVWsgo0GbzIo=; b=OJjV/GMRxEuzs7wPRm1o52WuBu
	RP2+k33dIBU1e8pZSH0oReNuTTusxGVqsSb/WhOIMx34/0Mlve42VSN2V6kEvYf6Pwn5Y3GsdhUWO
	Ka5XCtAOMjKmS07igv1HyBoILcjHRh4X7fQ7/tLABIrKOSCpXXXT04ia17a3jFCuA4Ig=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umwre-0005Pq-3f;
	Fri, 15 Aug 2025 16:01:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umwrZ-0005Ph-Ph
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jp1PX+AOUQIhnbS4CXc7w8KsHa1VC6udXIXvYmjjWjc=; b=HGGcDnZCYvEYjsMfEGetukSNH3
 pXmwJ08+rvqh1clKfMjpqf6z5hj9I/+ovYyhGoGd1eYvWb7KZNsBMpTXAdVeRjl7OWd8Fmudlnpw3
 30aLLyRTw58WFgxvH+yiHDyYyckPN7ZEL0+PbM+LwcFniZJqpRKSwRbIoILjoj4+JpiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jp1PX+AOUQIhnbS4CXc7w8KsHa1VC6udXIXvYmjjWjc=; b=C7hOdd74tRUS8cDBfuhL8Oubr9
 sJ/1iYBo6RaT86Sr5MYWH1CoXSPNd7Y1UvzfAJHUJb1hFoHRg1R4iQG45hgQ2U8ZxWB9blT8TS4nT
 7DQ4vyYwSizfiJ4KbFOHZ1Et6htAGm4WSiPXAkTxBT5SKVHREDlwDXECRBuXPRSb8fQk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umwrZ-0007S0-3N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755273653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jp1PX+AOUQIhnbS4CXc7w8KsHa1VC6udXIXvYmjjWjc=;
 b=hnqZZtl64/EmiNegqaH9Fj2yS0vUjaAlYxFqwQWJmyPrQwrwRJ4DQNF0kbc/1knUz1Jhg2
 pBreM7wk21ssZmCEMIcpW6PR7Bb+SrznlH12NZ3nrgNLplVANHBFjhfVoo4OLgN/tEfgea
 bTQ/K3YPBG/5a/PM0pSAIlo5hTLFOHc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-zyRYWAIXMayRa7xUpLuWKQ-1; Fri, 15 Aug 2025 12:00:50 -0400
X-MC-Unique: zyRYWAIXMayRa7xUpLuWKQ-1
X-Mimecast-MFC-AGG-ID: zyRYWAIXMayRa7xUpLuWKQ_1755273649
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2eb9bb19so3178874b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755273649; x=1755878449;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jp1PX+AOUQIhnbS4CXc7w8KsHa1VC6udXIXvYmjjWjc=;
 b=pxA09VOnK7WYGPFTSXJ8u7H3YyX7KpEZYLdZTwv6slEedw2r3O4IZ6cw9AM72rPdh9
 70mOueXYAs6/AwApwOhlNkL0Dd04NZyA08PqOoiiksLBxMWVBU4T1SjJ9m6Jng727YIa
 37XdJ52OJVHVPwhQma+0UAqPAkAb4xcF06w1HSA0NdpV+t6HpNYiGVOPEydaKaxIf9bD
 CYHD90krzDn3VdwvidvsW6LznhUITdAHfIBmbim/N0q66nxQP1Z9vLVhJZSORv501J0A
 JjshB1BdE/VRh3KPGXSD122jCrGYG3H9enNlzo74VCwjQDzvIAoA1dQxMIXjih394ONK
 6WeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7TlNL84vZCj3pbhn9kbWuLM4Wef01+s19qWD1gD4+ocBwRSt6LbIcB87ZoA0/RLuVxrm4S9yuWG0a7Z8n+bYT@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyxT89KnJaorCG8Sedh+sg0RS5vssE5p8apoeYoiXPNiBXAlPbi
 N/H6Xi6Lvg3wH/HwJRgII2xYZikalQCsGxnWQL8GTUnJRE140LKsBcnr0qGr0H30+ytyeA0RKGB
 /7TbffneG2Z4ogqqHV6Y0417Wg0IQi5nxltV8qH0PeRHYjW0iHPWS7XuKmAeyDqJa0ir0DbMARp
 IfxN4=
X-Gm-Gg: ASbGncvu+oIZ6XwvQzImJzxo52GdtRjuAsF2cgf2tuy9mVp3DvrcBcZZDICKNZ9gN/S
 DrcYWCDoiGmqJUVRDd6QVzNWJE81h5Ohi/p3y1owEyrZ87Z5aggowXQ45HhSX0omWnoHZtqAd5V
 kJvlghAkjyyQv0/zJI9SPUUhUd6GMtfyk0YcpNU8Kj+OiZX8RsHvap72DOdxVeFoDYxgpkVVaLv
 BzVUg3vtjFQc1Nd8Tooptzs2Zc0RB73nLY5ikRG6ByvSDEkN4xSSgkYzHgEHqdplF4ob4i/SLXD
 LCfQOHxXS22NE9+P+ewV9MGQtiotLEHafxzdlFjDcF4Ya9aIkGrFBd1TWXFQmPE6s2Y9gfNJTPr
 Smvaz
X-Received: by 2002:a05:6a20:734f:b0:240:1de:8bdb with SMTP id
 adf61e73a8af0-240d2fed245mr4293925637.30.1755273649174; 
 Fri, 15 Aug 2025 09:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHjcIiOd/VMu8eOTrV6+IjbR0JkdHjIT+JVLUji8iUqnv4iWhGh9afTHWDhQfU7AFS71FEQQ==
X-Received: by 2002:a05:6a20:734f:b0:240:1de:8bdb with SMTP id
 adf61e73a8af0-240d2fed245mr4293686637.30.1755273647200; 
 Fri, 15 Aug 2025 09:00:47 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e45593da9sm1399452b3a.105.2025.08.15.09.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 09:00:46 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:00:42 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815160042.pavsszqk5n3izmdm@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250804114016.2734919-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250804114016.2734919-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9PQbuRSuIXVnZp0AynJ3nmPQ9EBbBxJo8IF2lLkZHp0_1755273649
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 04, 2025 at 07:40:14PM +0800, Chao Yu wrote: >
 As f2fs changes to use new mount APIs, let's add a new testcase > to check
 mount result for all f2fs supported common mount options > and the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umwrZ-0007S0-3N
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs/015: test common mount options
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

On Mon, Aug 04, 2025 at 07:40:14PM +0800, Chao Yu wrote:
> As f2fs changes to use new mount APIs, let's add a new testcase
> to check mount result for all f2fs supported common mount options
> and their combinations, in order to detect any inconsistency during
> mount.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

I forgot this patchset. This version is good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  common/rc          |   3 +
>  tests/f2fs/015     | 121 +++++++++++++++++++++++++++++++
>  tests/f2fs/015.out | 173 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100755 tests/f2fs/015
>  create mode 100644 tests/f2fs/015.out
> 
> diff --git a/common/rc b/common/rc
> index ff5df203..81587dad 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -876,6 +876,9 @@ _test_mkfs()
>      ext2|ext3|ext4)
>  	$MKFS_PROG -t $FSTYP -- -F $MKFS_OPTIONS $* $TEST_DEV
>  	;;
> +    f2fs)
> +	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $* $TEST_DEV
> +	;;
>      xfs)
>  	_test_options mkfs
>  	$MKFS_PROG -t $FSTYP -- -f $TEST_OPTIONS $MKFS_OPTIONS $* $TEST_DEV
> diff --git a/tests/f2fs/015 b/tests/f2fs/015
> new file mode 100755
> index 00000000..73ac3d82
> --- /dev/null
> +++ b/tests/f2fs/015
> @@ -0,0 +1,121 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/015
> +#
> +# This testcase tries to check stability of mount result
> +# w/ common mount option and their combination.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick mount
> +_require_kernel_config CONFIG_F2FS_FS_XATTR
> +_require_kernel_config CONFIG_F2FS_FS_POSIX_ACL
> +_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
> +
> +options=(
> +#	mount_option			mkfs_option
> +	"background_gc=on"		""			\
> +	"background_gc=off"		""			\
> +	"background_gc=sync"		""			\
> +	"disable_roll_forward"		""			\
> +	"norecovery"			""			\
> +	"discard"			""			\
> +	"nodiscard"			""			\
> +	"no_heap"			""			\
> +	"heap"				""			\
> +	"user_xattr"			""			\
> +	"nouser_xattr"			""			\
> +	"acl"				""			\
> +	"noacl"				""			\
> +	"active_logs=2"			""			\
> +	"active_logs=4"			""			\
> +	"active_logs=6"			""			\
> +	"disable_ext_identify"		""			\
> +	"inline_xattr"			""			\
> +	"noinline_xattr"		""			\
> +	"inline_xattr_size=400"		""			\
> +	"inline_data"			""			\
> +	"noinline_dentry"		""			\
> +	"inline_dentry"			""			\
> +	"noinline_dentry"		""			\
> +	"flush_merge"			""			\
> +	"noflush_merge"			""			\
> +	"barrier"			""			\
> +	"nobarrier"			""			\
> +	"fastboot"			""			\
> +	"extent_cache"			""			\
> +	"noextent_cache"		""			\
> +	"data_flush"			""			\
> +	"reserve_root=32768"		""			\
> +	"resuid=1000"			""			\
> +	"resgid=1000"			""			\
> +	"fault_injection=100"		""			\
> +	"fault_type=4095"		""			\
> +	"mode=adaptive"			""			\
> +	"mode=lfs"			""			\
> +	"mode=fragment:segment"		""			\
> +	"mode=fragment:block"		""			\
> +	"usrquota"			""			\
> +	"grpquota"			""			\
> +	"prjquota"			""			\
> +	"usrjquota=ausrquota"		""			\
> +	"grpjquota=agrpquota"		""			\
> +	"prjjquota=aprjquota"		""			\
> +	"jqfmt=vfsold"			""			\
> +	"jqfmt=vfsv0"			""			\
> +	"jqfmt=vfsv1"			""			\
> +	"usrjquota="			""			\
> +	"grpjquota="			""			\
> +	"prjjquota="			""			\
> +	"quota"				""			\
> +	"noquota"			""			\
> +	"alloc_mode=reuse"		""			\
> +	"alloc_mode=default"		""			\
> +	"fsync_mode=posix"		""			\
> +	"fsync_mode=strict"		""			\
> +	"fsync_mode=nobarrier"		""			\
> +	"test_dummy_encryption"		""			\
> +	"test_dummy_encryption=v1"	""			\
> +	"test_dummy_encryption=v2"	""			\
> +	"checkpoint=enable"		""			\
> +	"checkpoint=disable"		""			\
> +	"checkpoint=disable:32768"	""			\
> +	"checkpoint=disable:50%"	""			\
> +	"checkpoint_merge"		""			\
> +	"nocheckpoint_merge"		""			\
> +	"compress_algorithm=lzo"	""			\
> +	"inlinecrypt"			""			\
> +	"atgc"				""			\
> +	"discard_unit=block"		""			\
> +	"discard_unit=segment"		""			\
> +	"discard_unit=section"		""			\
> +	"memory=normal"			""			\
> +	"memory=low"			""			\
> +	"age_extent_cache"		""			\
> +	"errors=panic"			""			\
> +	"errors=continue"		""			\
> +	"errors=remount-ro"		""			\
> +	"nat_bits"			""			\
> +	"atgc,mode=lfs"			""			\
> +	"ro,flush_merge"		""			\
> +	"rw"				"ro"			\
> +	"norecovery,ro"			""			\
> +)
> +
> +for ((i=0;i<${#options[@]};i=i+2))
> +do
> +	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
> +
> +	if [ "${options[$((i+1))]}" ]; then
> +		_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full || _fail "mkfs failed"
> +	else
> +		_scratch_mkfs >> $seqres.full || _fail "mkfs failed"
> +	fi
> +	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
> +	echo $?
> +	_scratch_unmount >> $seqres.full 2>&1
> +done
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
> new file mode 100644
> index 00000000..8d6712f0
> --- /dev/null
> +++ b/tests/f2fs/015.out
> @@ -0,0 +1,173 @@
> +QA output created by 015
> +Option#0: background_gc=on : 
> +0
> +Option#2: background_gc=off : 
> +0
> +Option#4: background_gc=sync : 
> +0
> +Option#6: disable_roll_forward : 
> +0
> +Option#8: norecovery : 
> +32
> +Option#10: discard : 
> +0
> +Option#12: nodiscard : 
> +0
> +Option#14: no_heap : 
> +0
> +Option#16: heap : 
> +0
> +Option#18: user_xattr : 
> +0
> +Option#20: nouser_xattr : 
> +0
> +Option#22: acl : 
> +0
> +Option#24: noacl : 
> +0
> +Option#26: active_logs=2 : 
> +0
> +Option#28: active_logs=4 : 
> +0
> +Option#30: active_logs=6 : 
> +0
> +Option#32: disable_ext_identify : 
> +0
> +Option#34: inline_xattr : 
> +0
> +Option#36: noinline_xattr : 
> +0
> +Option#38: inline_xattr_size=400 : 
> +0
> +Option#40: inline_data : 
> +0
> +Option#42: noinline_dentry : 
> +0
> +Option#44: inline_dentry : 
> +0
> +Option#46: noinline_dentry : 
> +0
> +Option#48: flush_merge : 
> +0
> +Option#50: noflush_merge : 
> +0
> +Option#52: barrier : 
> +0
> +Option#54: nobarrier : 
> +0
> +Option#56: fastboot : 
> +0
> +Option#58: extent_cache : 
> +0
> +Option#60: noextent_cache : 
> +0
> +Option#62: data_flush : 
> +0
> +Option#64: reserve_root=32768 : 
> +0
> +Option#66: resuid=1000 : 
> +0
> +Option#68: resgid=1000 : 
> +0
> +Option#70: fault_injection=100 : 
> +0
> +Option#72: fault_type=4095 : 
> +0
> +Option#74: mode=adaptive : 
> +0
> +Option#76: mode=lfs : 
> +0
> +Option#78: mode=fragment:segment : 
> +0
> +Option#80: mode=fragment:block : 
> +0
> +Option#82: usrquota : 
> +0
> +Option#84: grpquota : 
> +0
> +Option#86: prjquota : 
> +32
> +Option#88: usrjquota=ausrquota : 
> +32
> +Option#90: grpjquota=agrpquota : 
> +32
> +Option#92: prjjquota=aprjquota : 
> +32
> +Option#94: jqfmt=vfsold : 
> +0
> +Option#96: jqfmt=vfsv0 : 
> +0
> +Option#98: jqfmt=vfsv1 : 
> +0
> +Option#100: usrjquota= : 
> +0
> +Option#102: grpjquota= : 
> +0
> +Option#104: prjjquota= : 
> +0
> +Option#106: quota : 
> +0
> +Option#108: noquota : 
> +0
> +Option#110: alloc_mode=reuse : 
> +0
> +Option#112: alloc_mode=default : 
> +0
> +Option#114: fsync_mode=posix : 
> +0
> +Option#116: fsync_mode=strict : 
> +0
> +Option#118: fsync_mode=nobarrier : 
> +0
> +Option#120: test_dummy_encryption : 
> +0
> +Option#122: test_dummy_encryption=v1 : 
> +0
> +Option#124: test_dummy_encryption=v2 : 
> +0
> +Option#126: checkpoint=enable : 
> +0
> +Option#128: checkpoint=disable : 
> +0
> +Option#130: checkpoint=disable:32768 : 
> +0
> +Option#132: checkpoint=disable:50% : 
> +0
> +Option#134: checkpoint_merge : 
> +0
> +Option#136: nocheckpoint_merge : 
> +0
> +Option#138: compress_algorithm=lzo : 
> +0
> +Option#140: inlinecrypt : 
> +0
> +Option#142: atgc : 
> +0
> +Option#144: discard_unit=block : 
> +0
> +Option#146: discard_unit=segment : 
> +0
> +Option#148: discard_unit=section : 
> +0
> +Option#150: memory=normal : 
> +0
> +Option#152: memory=low : 
> +0
> +Option#154: age_extent_cache : 
> +0
> +Option#156: errors=panic : 
> +0
> +Option#158: errors=continue : 
> +0
> +Option#160: errors=remount-ro : 
> +0
> +Option#162: nat_bits : 
> +0
> +Option#164: atgc,mode=lfs : 
> +32
> +Option#166: ro,flush_merge : 
> +32
> +Option#168: rw : ro
> +0
> +Option#170: norecovery,ro : 
> +0
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
