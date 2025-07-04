Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FFBAF9AB6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 20:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMlKJ5jJopaY1QQ/WotGCjU3Ljox0QmI3ofQpeK9i7w=; b=cGkD5VZDBzYjBB5yTODY01j5yw
	plSzCBXXg8QJv5YRP7S/FWB4mIXfdKktc+1IlOmmZGhPMhWSeEWJu+em6DhYVTAFZvvczR/2q8UF4
	Q07zz3dGiJhnuLxeZ2HLz7Tn/W+crCdlAGIY5l+A95OHyeHCTEj94b1FpLs456SSjIEQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXl8M-0003HY-SB;
	Fri, 04 Jul 2025 18:27:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uXl8M-0003HS-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 18:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MdUieAd1lJmb1QYM4PuzRy4XXeLxoRFZCYmwy8/kupk=; b=i9Iti9zWLqo2+DRNBOAWJQFeZG
 8AhEhYAPWsi2KOTG+GORZ9U4284eTMUNmIE058mMHqCRNRMU8jmVdkp+kBnfYLhNy8jgHzycELce8
 UDP8vur0YBi4F+UV/xRVGqkj3qLDGJPRMdWKJON2rojonp1/L+ARE/zMIwzKXKNhhFZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MdUieAd1lJmb1QYM4PuzRy4XXeLxoRFZCYmwy8/kupk=; b=UGRfHCZduFQWxbqldIkki4vGBs
 RsL+5PRVKucrvWQE6mw0NsrxjJUXs4lnvdO21VSjrL7/urFaMb96q0myY4+zxXhBZ5uR5AS80dLMo
 UoMyNPzevOCjYRsAdj1eA9KHR+TAJRa81Nq953wXBNJOpcf+AlADoQqXAwrG1XR9eFnA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uXl8L-0001xQ-H6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 18:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751653641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MdUieAd1lJmb1QYM4PuzRy4XXeLxoRFZCYmwy8/kupk=;
 b=cJU+F2YIvghEgOn2MdAJAFWAqyz/U4FdP32Ip1dTKMwisiJyAw0yvORR4rz/iSDbSwsaEK
 AdfBwviY4henJLwYC3xaclgrMou/GpnpUrrGr62LnkbYqpg35UMm35k9hkql9yJPmZ1t5S
 DAclDTYgn0OTf5VyYhFqSClTVnMYCWs=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-mQ2ei5abPEmN-T0L2g4oCg-1; Fri, 04 Jul 2025 14:10:51 -0400
X-MC-Unique: mQ2ei5abPEmN-T0L2g4oCg-1
X-Mimecast-MFC-AGG-ID: mQ2ei5abPEmN-T0L2g4oCg_1751652650
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so1171693a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jul 2025 11:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751652650; x=1752257450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdUieAd1lJmb1QYM4PuzRy4XXeLxoRFZCYmwy8/kupk=;
 b=EWx/Pk7qUDWIyzd+pdZXLghP+J1ZlXvjDs7Sqt2e3vI0CkC9nUgxy7kQz1YdyyTNDT
 4wezYHkzxXy1s8CUeIbfwqI1WIqKkUTeHVIvatdTLswVJUeYO5VT/Q5zzuSzTLFH8VXC
 zyHmbEr+40BlcS5kfW2hJ9ITF4QuKg1Vm57WEjfw/FUbdfxkAhavrKtBjVeocRApx9mL
 SiNnKhdlbkobMM8uT7Ej8RoudjEdAgl50UiNyzkvN3jkIqmRpl84877jibBwL/5fplxJ
 k93QvOkieGL/r6lAae29wd5OIW6Y+G8s4gfzdv62bIN0OTie09uxXnlgDoiYSsoyKxqJ
 Eo8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC0mz7s62XmW4W8OrQlunBx7pXCVZE/wqfp3vqfI6LPC09ejg6hSggRZv/I23OZERgZrwop2ZMYtG3EXHDgqS2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywo+P5nt+gxoIgMeYGaCgllUkzq6X5um0unqkc38nPVqUlrB/6R
 dJ1TCOhge+5FwIAZDAz9Yrg1R9j9vRIX37oUXsaRoHLFdCD92cke0CN8V7/gTESLBDz+C8cghD+
 eYIt9OtxBqEFWqIxngnVGH8KErk8FTGXl70hIaRrOYBCajUcZOc8SYBap9zLONOeMuFRsif+l7h
 wgHxo=
X-Gm-Gg: ASbGncse0ek7ymWey3l9xJSn9ezlYcCpxcBZTFcXXXSaHXvhRgGNDhxrHPizIM9glFq
 Yq/nymKkXNQ4RhzaCVBdwqU0WWgDY7fCkthLQG3lzxr23Nvp62+V4YO5c9WtdqobxNr050RpE9c
 +Or4L8HQnDPjueRKK8NZiPAcWcsS4175xpY5RpFj7xmbgTTQIxzngDp3c9Uze+l527xInEW+/aM
 36PB3SoGzk/Qw3SviJVSVophh6yC0hruX7geu2g9SZEIJCLn2YjuJuwm68GLHMQRzPntIkKYjKO
 7jO6Gf1kZL+crWnyx6jD+fPp30jFo4t7ksvtlT+O6qSJ6K91Yf1kYA0WIyK9kBE=
X-Received: by 2002:a17:902:c40f:b0:234:c7e6:8459 with SMTP id
 d9443c01a7336-23c8748444emr44878485ad.20.1751652650084; 
 Fri, 04 Jul 2025 11:10:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBzi8I6IYD4Jam1MnA8U5c6bVwDAqiWg9FKXKEQo6MIng475KXF0yvVZw9sgImahp1Q+1K8Q==
X-Received: by 2002:a17:902:c40f:b0:234:c7e6:8459 with SMTP id
 d9443c01a7336-23c8748444emr44878265ad.20.1751652649644; 
 Fri, 04 Jul 2025 11:10:49 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845998b4sm26242445ad.215.2025.07.04.11.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 11:10:49 -0700 (PDT)
Date: Sat, 5 Jul 2025 02:10:44 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250704181044.5v5a3xxv5dixd43a@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250702110204.1063796-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250702110204.1063796-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5v269l-9sH1z5h9gS1PO9W-fAUwnn5pzIfb0KnmwiI_1751652650
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 02, 2025 at 07:02:04PM +0800, Chao Yu wrote: >
 As f2fs changes to use new mount APIs, let's add a new testcase > to check
 mount result for all f2fs supported mount options and > their comb [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXl8L-0001xQ-H6
Subject: Re: [f2fs-dev] [PATCH] f2fs/015: test mount options
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

On Wed, Jul 02, 2025 at 07:02:04PM +0800, Chao Yu wrote:
> As f2fs changes to use new mount APIs, let's add a new testcase
> to check mount result for all f2fs supported mount options and
> their combinations, in order to detect any inconsistency during
> mount.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/015     | 141 ++++++++++++++++++++++++++++++
>  tests/f2fs/015.out | 207 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 348 insertions(+)
>  create mode 100755 tests/f2fs/015
>  create mode 100644 tests/f2fs/015.out
> 
> diff --git a/tests/f2fs/015 b/tests/f2fs/015
> new file mode 100755
> index 00000000..86f0ef9e
> --- /dev/null
> +++ b/tests/f2fs/015
> @@ -0,0 +1,141 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/015
> +#
> +# This testcase tries to check stability of mount result
> +# w/ all f2fs supported mount option and their combination.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
                            ^^^^^
			    mount

> +_require_kernel_config CONFIG_F2FS_FS_XATTR
> +_require_kernel_config CONFIG_F2FS_FS_POSIX_ACL
> +_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
> +_require_kernel_config CONFIG_F2FS_FS_COMPRESSION
> +_require_kernel_config CONFIG_F2FS_FS_LZO
> +_require_kernel_config CONFIG_F2FS_FS_LZORLE
> +_require_kernel_config CONFIG_F2FS_FS_LZ4
> +_require_kernel_config CONFIG_F2FS_FS_LZ4HC
> +_require_kernel_config CONFIG_F2FS_FS_ZSTD

Hmm... I think these requirements might cause this test case be _notrun
from lots of Linux distributions, except the kernel is built for testing
manually :)

> +_require_scratch
> +
> +options=(
> +#	mount_option			mkfs_option
> +	"background_gc=on"		""			\
> +	"background_gc=off"		""			\
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
> +	"inline_xattr_size=400"		"extra,flexible_inline_xattr"\
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
> +	"compress_algorithm=lzo"	"extra,compression"	\
> +	"compress_algorithm=lz4"	"extra,compression"	\
> +	"compress_algorithm=zstd"	"extra,compression"	\
> +	"compress_algorithm=lzo-rle"	"extra,compression"	\
> +	"compress_algorithm=lz4:3"	"extra,compression"	\
> +	"compress_algorithm=ztsd:1"	"extra,compression"	\
> +	"compress_log_size=8"		"extra,compression"	\
> +	"compress_extension=so"		"extra,compression"	\
> +	"nocompress_extension=so"	"extra,compression"	\
> +	"nocompress_extension=*"	"extra,compression"	\
> +	"compress_extension=so,nocompress_extension=so"		\
> +					"extra,compression"	\
> +	"compress_chksum"		"extra,compression"	\
> +	"compress_mode=fs"		"extra,compression"	\
> +	"compress_mode=user"		"extra,compression"	\
> +	"compress_cache"		"extra,compression"	\
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
> +	_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full

_scratch_mkfs just return non-zero if it fails, so...

> +	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1

...do you still hope to try mount if mkfs fails?

Thanks,
Zorro

> +	echo $?
> +	_scratch_unmount
> +done
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
> new file mode 100644
> index 00000000..83e6ad51
> --- /dev/null
> +++ b/tests/f2fs/015.out
> @@ -0,0 +1,207 @@
> +QA output created by 015
> +Option#0: background_gc=on : 
> +0
> +Option#2: background_gc=off : 
> +0
> +Option#4: background_gc=off : 
> +0
> +Option#6: background_gc=sync : 
> +0
> +Option#8: disable_roll_forward : 
> +0
> +Option#10: norecovery : 
> +32
> +Option#12: discard : 
> +0
> +Option#14: nodiscard : 
> +0
> +Option#16: no_heap : 
> +0
> +Option#18: heap : 
> +0
> +Option#20: user_xattr : 
> +0
> +Option#22: nouser_xattr : 
> +0
> +Option#24: acl : 
> +0
> +Option#26: noacl : 
> +0
> +Option#28: active_logs=2 : 
> +0
> +Option#30: active_logs=4 : 
> +0
> +Option#32: active_logs=6 : 
> +0
> +Option#34: disable_ext_identify : 
> +0
> +Option#36: inline_xattr : 
> +0
> +Option#38: noinline_xattr : 
> +0
> +Option#40: inline_xattr_size=400 : extra,flexible_inline_xattr
> +0
> +Option#42: inline_xattr_size=400 : 
> +0
> +Option#44: inline_data : 
> +0
> +Option#46: noinline_dentry : 
> +0
> +Option#48: inline_dentry : 
> +0
> +Option#50: noinline_dentry : 
> +0
> +Option#52: flush_merge : 
> +0
> +Option#54: noflush_merge : 
> +0
> +Option#56: barrier : 
> +0
> +Option#58: nobarrier : 
> +0
> +Option#60: fastboot : 
> +0
> +Option#62: extent_cache : 
> +0
> +Option#64: noextent_cache : 
> +0
> +Option#66: data_flush : 
> +0
> +Option#68: reserve_root=32768 : 
> +0
> +Option#70: resuid=1000 : 
> +0
> +Option#72: resgid=1000 : 
> +0
> +Option#74: fault_injection=100 : 
> +0
> +Option#76: fault_type=4095 : 
> +0
> +Option#78: mode=adaptive : 
> +0
> +Option#80: mode=lfs : 
> +0
> +Option#82: mode=fragment:segment : 
> +0
> +Option#84: mode=fragment:block : 
> +0
> +Option#86: usrquota : 
> +0
> +Option#88: grpquota : 
> +0
> +Option#90: prjquota : 
> +32
> +Option#92: usrjquota=ausrquota : 
> +32
> +Option#94: grpjquota=agrpquota : 
> +32
> +Option#96: prjjquota=aprjquota : 
> +32
> +Option#98: jqfmt=vfsold : 
> +0
> +Option#100: jqfmt=vfsv0 : 
> +0
> +Option#102: jqfmt=vfsv1 : 
> +0
> +Option#104: usrjquota= : 
> +0
> +Option#106: grpjquota= : 
> +0
> +Option#108: prjjquota= : 
> +0
> +Option#110: quota : 
> +0
> +Option#112: noquota : 
> +0
> +Option#114: alloc_mode=reuse : 
> +0
> +Option#116: alloc_mode=default : 
> +0
> +Option#118: fsync_mode=posix : 
> +0
> +Option#120: fsync_mode=strict : 
> +0
> +Option#122: fsync_mode=nobarrier : 
> +0
> +Option#124: test_dummy_encryption : 
> +0
> +Option#126: test_dummy_encryption=v1 : 
> +0
> +Option#128: test_dummy_encryption=v2 : 
> +0
> +Option#130: checkpoint=enable : 
> +0
> +Option#132: checkpoint=disable : 
> +0
> +Option#134: checkpoint=disable:32768 : 
> +0
> +Option#136: checkpoint=disable:50% : 
> +0
> +Option#138: checkpoint_merge : 
> +0
> +Option#140: nocheckpoint_merge : 
> +0
> +Option#142: compress_algorithm=lzo : 
> +0
> +Option#144: compress_algorithm=lzo : extra,compression
> +0
> +Option#146: compress_algorithm=lz4 : extra,compression
> +0
> +Option#148: compress_algorithm=zstd : extra,compression
> +0
> +Option#150: compress_algorithm=lzo-rle : extra,compression
> +0
> +Option#152: compress_algorithm=lz4:3 : extra,compression
> +0
> +Option#154: compress_algorithm=ztsd:1 : extra,compression
> +32
> +Option#156: compress_log_size=8 : extra,compression
> +0
> +Option#158: compress_extension=so : extra,compression
> +0
> +Option#160: nocompress_extension=so : extra,compression
> +0
> +Option#162: nocompress_extension=* : extra,compression
> +32
> +Option#164: compress_extension=so,nocompress_extension=so : extra,compression
> +32
> +Option#166: compress_chksum : extra,compression
> +0
> +Option#168: compress_mode=fs : extra,compression
> +0
> +Option#170: compress_mode=user : extra,compression
> +0
> +Option#172: compress_cache : extra,compression
> +0
> +Option#174: inlinecrypt : 
> +0
> +Option#176: atgc : 
> +0
> +Option#178: discard_unit=block : 
> +0
> +Option#180: discard_unit=segment : 
> +0
> +Option#182: discard_unit=section : 
> +0
> +Option#184: memory=normal : 
> +0
> +Option#186: memory=low : 
> +0
> +Option#188: age_extent_cache : 
> +0
> +Option#190: errors=panic : 
> +0
> +Option#192: errors=continue : 
> +0
> +Option#194: errors=remount-ro : 
> +0
> +Option#196: nat_bits : 
> +0
> +Option#198: atgc,mode=lfs : 
> +32
> +Option#200: ro,flush_merge : 
> +32
> +Option#202: rw : ro
> +0
> +Option#204: norecovery,ro : 
> +0
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
