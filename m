Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55A9F7C26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2024 14:17:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOGOZ-0002qq-T3;
	Thu, 19 Dec 2024 13:16:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1tOGOV-0002qh-5G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 13:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DgTSPlQ4pTnYXaSlJ1+e0g++IEsaPHjITweA2so9mKo=; b=P1IhU7u/qR8IQLwaZklqrOa3I8
 Q5EyA/WPXODlgJ6rqMHhMQMYMOGAVJuajdnvXM2Jc6iBMW+PfKEmgPu2dexWExEWWSjW4POPOlhPX
 aEswAbd71wiLBsT/lmUjKEtr1GpZuiWCXsXvGVtwdJCuEjCISvIfQq6Dmx9ChbdMOHyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DgTSPlQ4pTnYXaSlJ1+e0g++IEsaPHjITweA2so9mKo=; b=JF5sNTwk8SPy+QnEg69Bw0cViw
 kGjFAzS2kQKxa+7RhDhxwCv+Ud6QW5QlEJKTBsjK3mYfaRC2jfBmez72Cj4SKnox1FtEMAEa3fIXS
 2jdFwH9dSWiPW29sxE1o91isIys3VKXk3RqMaIxQ6srXhsJETzkrRU6daIfOpUmVbST8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOGOT-0005St-Lz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 13:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734614198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DgTSPlQ4pTnYXaSlJ1+e0g++IEsaPHjITweA2so9mKo=;
 b=Y9Y1/QvTXZvpsx4dzgq81ldES2wCYJwZ+j9gaezcj7t3Yg1rZ6mMsL4lloFijeBfR/T6Nx
 iUxrIeJEofnzdUFLXMRtHwA15+PSCg8NpFWSvbPWaYEyNv2/Q0yaipuz9SScZ87QPiAJlH
 xv6Fq0smO2lzw8n5++rin+Dw6Ylk4PI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-ggn-w7bgNaqkm-LUmjANuQ-1; Thu, 19 Dec 2024 08:16:38 -0500
X-MC-Unique: ggn-w7bgNaqkm-LUmjANuQ-1
X-Mimecast-MFC-AGG-ID: ggn-w7bgNaqkm-LUmjANuQ
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ef9dbeb848so754861a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Dec 2024 05:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734614197; x=1735218997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgTSPlQ4pTnYXaSlJ1+e0g++IEsaPHjITweA2so9mKo=;
 b=wfzS7WuFEogAFa8JjquixEWtCm9Fey27jDS59MLDy1oj+0hAGUgoNA7W/9UnfBO2bb
 iqvjOaujlnkufGzpoLoaxXW7pdXfXssY0bWUgjlaie3fU5qBlLkix02Bxa8j4EEl3qZP
 xATpE/+96cmlobOoYHGsDfeCHeOeUHI4NcpgX4rNFnCyQwBkJ0jo0SiXTIfoo8duGEl5
 U4PnV3Ps/7OEeiteLCEbZIFqPd7yUqQ5rlSDsF82qLyqZ3uReSgK4VszyY97n9PEElVC
 HUkIwY42T4+haQR1C+lXwFFPFRULiaOmPN/ceJ/WHP8St6d0hkA3vZFIa/xKLGTaSi8E
 JV7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAl7SFdSwH1oNeSzF8b/O9X+OxTTC8+p0cay5r/A++HBWvd8lFC8bJzRcSt0c9/1UAhuqI8vbFTUJ0bHw9zypN@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxWiSBELETOhMj0RdP1XYJ9F1egEcvtJz4hKLl+ol/jHLL9FP2B
 YGCRsfqac4BMULJUsHYgyRuVsd/3bkjTJHtTR1OuShVnKyYQGebpuU29wEwQjYDTJhpGZbnb40i
 tjonTmwUBgKmFfJFADD5gP2yBjXqzRTiibcR/rVHGfRqdCKetcX1U+/4HAUHfcyeRc+0NmQVFn9
 0ohHJENCpBLQ==
X-Gm-Gg: ASbGncsCrronBDU4I5ZQoKnpM5yzZJXP+B1zKeiJKutkRPA8YLGnLdvSghMXf9Tx0zD
 4Pc7gqw7ycqtoIyLGvIKDRWeP3yksfp8EiA6Xv/s+WhY7zn1UM/f/uKWRbFXRKukT5nSw8Kadnu
 +p3AaGCqZs2t325JY3UFrK+hQYoFvZtrLB+6kguuGeLcxm60brxCTVVogl7Ogbg394h/FoVPp2G
 lLnME29T82OJ6NKW3LEJQ65bSskKat1ttbk1wOEbxuWxuYVJobO4RBsFJUNCCuuTrdT/EX4seeu
 f3DZlXt9qK+WtKQTKy6Jiw==
X-Received: by 2002:a17:90b:4d10:b0:2ee:a04b:92ce with SMTP id
 98e67ed59e1d1-2f2e937d3bemr8683662a91.32.1734614196677; 
 Thu, 19 Dec 2024 05:16:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiJyhimSfQYKLnJFO4KuaDEoaeSum0Lil+WV0fbIZTQqlqIAboyy2JdTyDdyUnmJMPwr19Qg==
X-Received: by 2002:a17:90b:4d10:b0:2ee:a04b:92ce with SMTP id
 98e67ed59e1d1-2f2e937d3bemr8683637a91.32.1734614196340; 
 Thu, 19 Dec 2024 05:16:36 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f4478accb3sm1316744a91.51.2024.12.19.05.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 05:16:35 -0800 (PST)
Date: Thu, 19 Dec 2024 21:16:31 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241219131631.6imqcwg7zxcm6hj5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241202114307.2747-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241202114307.2747-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pkk6z6onJJBiUBwyUXiHuZLArkySakCu14rxEa900zs_1734614197
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 02, 2024 at 07:43:07PM +0800, Chao Yu wrote: >
 This patch introduce a regression testcase to check whether > f2fs can handle
 discard correctly once underlying lvm device > changes to not s [...] 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOGOT-0005St-Lz
Subject: Re: [f2fs-dev] [PATCH] f2fs/008: test snapshot creation/deletion on
 lvm device
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 02, 2024 at 07:43:07PM +0800, Chao Yu wrote:
> This patch introduce a regression testcase to check whether
> f2fs can handle discard correctly once underlying lvm device
> changes to not support discard after user creates snapshot
> on it.
> 
> Related bug was fixed by commit bc8aeb04fd80 ("f2fs: fix to
> drop all discards after creating snapshot on lvm device")
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/008     | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/008.out |  2 ++
>  2 files changed, 55 insertions(+)
>  create mode 100755 tests/f2fs/008
>  create mode 100644 tests/f2fs/008.out
> 
> diff --git a/tests/f2fs/008 b/tests/f2fs/008
> new file mode 100755
> index 00000000..a9a3f263
> --- /dev/null
> +++ b/tests/f2fs/008
> @@ -0,0 +1,53 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/008
> +#
> +# This is a regression test to check whether f2fs can handle
> +# discard correctly once underlying lvm device changes to not
> +# support discard after user creates snapshot on it.
> +#
> +
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +_fixed_by_kernel_commit bc8aeb04fd80 \
> +        "f2fs: fix to drop all discards after creating snapshot on lvm device"
> +
> +_require_scratch_nolvm
> +_require_block_device $SCRATCH_DEV
> +_require_command "$LVM_PROG" lvm
> +
> +lvname=lv_$sed
> +vgname=vg_$Sseg

What's "$sed" and "$Sseg", I didn't find the definition of them.

> +testfile=$SCRATCH_MNT/testfile
> +
> +_cleanup()
> +{

  _unmount $SCRATCH_MNT >>$seqres.full 2>&1

for this test might be interrupted.

> +	$LVM_PROG lvremove -f /dev/mapper/$lvname-snapshot $vgname >>$seqres.full 2>&1
> +	$LVM_PROG lvremove -f /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> +	$LVM_PROG vgremove -f $vgname >>$seqres.full 2>&1
> +	$LVM_PROG pvremove -f $SCRATCH_DEV >>$seqres.full 2>&1

"-ff" might be better for cleanup.

According to 5f7a66b6dc4c ("fstests: use udevadm wait in preference to settle"), Dave
recommend doing below command after above lines:

  _udev_wait --removed /dev/mapper/$vgname-$lvname

Then, don't forget the default cleanup steps:

  cd /
  rm -f $tmp.*

> +}
> +
> +$LVM_PROG pvcreate -f $SCRATCH_DEV >>$seqres.full 2>&1
> +$LVM_PROG vgcreate -f $vgname $SCRATCH_DEV >>$seqres.full 2>&1
> +$LVM_PROG lvcreate -L 1024m -n $lvname $vgname >>$seqres.full 2>&1

Also according to 5f7a66b6dc4c ("fstests: use udevadm wait in preference to settle"),
Dave recommend using a:
  _udev_wait /dev/mapper/$vgname-$lvname

> +
> +$MKFS_F2FS_PROG /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1

"-f" to force overwrite ? Or use _mkfs_dev? But _mkfs_dev doesn't has a f2f2
specific line, maybe you'd like to write one.

> +mount -o discard /dev/mapper/$vgname-$lvname $SCRATCH_MNT >>$seqres.full 2>&1

_mount

> +
> +dd if=/dev/zero of=$testfile bs=1M count=20 >>$seqres.full 2>&1
> +sync
> +rm $testfile

"-f" ?

> +sync
> +
> +# create a snapshot on lvm device
> +$LVM_PROG lvcreate -L 1024m -s -n $lvname-snapshot /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> +umount $SCRATCH_MNT

Move this line to _cleanup, to always try to do it before removing lvm.

> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/008.out b/tests/f2fs/008.out
> new file mode 100644
> index 00000000..dd68d5a4
> --- /dev/null
> +++ b/tests/f2fs/008.out
> @@ -0,0 +1,2 @@
> +QA output created by 008
> +Silence is golden
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
