Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF2BA7141
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 15:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F80f+sH/fUXC8lu0fv65woPDcFeQ0fBQexJAOPk5rc=; b=OT0i/lRju7P/ONKhf04eq2nVJj
	iAsMkW8aaUZVAtmsZd4TQL37kHPqwo/Jan1OyF9pGQ23eHaohBB/H3dmhnRD+DxsDA/qxlYIg44R3
	SCjAYaRcchVKpSwL4H5buZWfoBuVxxKPj+bBQEzod9rRBXk77WJrGLnUlEXHXIJnwKEM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2rob-0007Z2-GM;
	Sun, 28 Sep 2025 13:51:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v2roZ-0007Yt-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 13:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9JpqdLLT9z1M051j1qXRqMQ5SMaqtTYMmpk/UjNV5Q=; b=GH59sFtiBvDRLtyeeZY3lxi42R
 jl46wni/7hJ14dlN/lfepUi3SEFKpzyMvoRpdxVh+UPJyeuyamifQYsFWZwyuD0attQwelgFnktWo
 cU3mqNWKU7fgakZSpUppxn5h6AaMiSt1eGyIRcTi4dF4Tda+A5nu1LztS+WBXgbzRbuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j9JpqdLLT9z1M051j1qXRqMQ5SMaqtTYMmpk/UjNV5Q=; b=OWUCZb6PjKlZQ+Oys5txIeAWhE
 GWrELuPJ7j+MsuI4B7YgKOcX8SMNP94+oi9Z3iwokLMM90GT8TNslo8CIDKwcBPlsM5yPMK1NMatX
 TSQjv0BsPFcQjN9JCrlR4fiSH1JdiOCZDvuRksRqb76E07RrT6HihAtvW/OA7vA7+MC0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2roZ-0005QB-9i for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 13:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759067496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9JpqdLLT9z1M051j1qXRqMQ5SMaqtTYMmpk/UjNV5Q=;
 b=eY2eB71TfvvHleCBYqcDsNRcAkEeUJlscC4V9RJ+HgKllVuNE5YAp8nVpMX8q/n35rfgWj
 pdRZi4PxemZmZ3aOZUhMX4zXHj0wtKGyFC1Lzd0zt/aJ6pruTlij8ZfEnqVbuTIdk37f5V
 ftLSYxPhhD503saOvpkYoL6fOd2gz+w=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-rNwDF1f3PguerjAfY-XHPw-1; Sun, 28 Sep 2025 09:51:35 -0400
X-MC-Unique: rNwDF1f3PguerjAfY-XHPw-1
X-Mimecast-MFC-AGG-ID: rNwDF1f3PguerjAfY-XHPw_1759067494
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4f86568434so2722096a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 06:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759067494; x=1759672294;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j9JpqdLLT9z1M051j1qXRqMQ5SMaqtTYMmpk/UjNV5Q=;
 b=HmZKgyioEW1QwQbUfeE6PdAWEWnGpt7X/YVAUyKqpcASd5VKGLnBpEtCCG/V+F7D6E
 GVM5Lv0kLIfdy79wjM9K1qc+eKhBkCWnfKzvzYPT0NQIWen5a1Ojv1ZaKGLsI9zwNeuk
 xqTgHYZtyfVlanWAejf1u5h2+kem7yMXxKFNnqCKsc2kAgKufJxugPrF3K8h0NqvXZ9F
 o03Eb5NtnKxwxFxdw6VOlQ52a2jO9BpLwKEL57xv6kPJUreyx86/13/IvFac81UQ0CDO
 KyA8Ganv47oAiq2+0AR2iqO9uw82hFsSEXATFNdWkNa1/7LN/AbvHtpiTHJWDEAjJG9m
 VOaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCLqTs/w/o6YhCzYISRMFy+IxGYJBUv17fmsnQoFPWJifUf5Mv7olq346xJKi1VsbvqLQGPSRHxMxhAARiy5wf@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzfj40QXTNYRxUfo59fLTANBQmLa2VgSnpfjeeLfF6QJoxf461R
 FPfor3R/kU220LzRfFV8ZF1UhutwhJjunOpo2qL3Rc785NDPrPxxjegE7zUbPXSPOFo8xldEDQ8
 TkyU0UyCt/zsN36c4gQ4XuDuAN/9kWsBVm3Y84i+FITmRC8wEKermSIqY9ObOzNA9fO0zZ/D5Ze
 KqpYQ=
X-Gm-Gg: ASbGncsnDX75cVTRStmJgJkgV3u9MXR8Iq5Tv8u4gMcizxmnLSvxnzHSKgYOmOKEra4
 dSxBFReOGbTVHsSFu0b3F0BQq7tzsFiFFzCqfdqnxrP+BocbXKiQTrk2BrG7vZHrewHvEtaKiOk
 R0FaEWGF8n/tyMrhf3HWEWptypuijhkAoyEy6CRPs68ipLA9z8nmV+H+g7eZ+k0Ngy6DpjKB26M
 aVi3UbVB3/tnNYXbk5SQwplnMbH5iivPW7Oq5A59/7+kVrNWFetjIoAPFQaJpzc3U/qX4t21PQq
 MZX+WKQedd2f0fZhjy9aW+tDJ6ElXDO1WzpVkrPx1nRIicMicg90hNFGS9B9N0FsS63z04nVoLN
 4A4Th
X-Received: by 2002:a05:6a21:e098:b0:24d:38c:26bd with SMTP id
 adf61e73a8af0-2e7d1ff0a57mr18099760637.43.1759067493889; 
 Sun, 28 Sep 2025 06:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg04/G4NfqhTpCpCPdtRAQV4uvWVXc/77oQZV+4Ld5cvDuBuQgZe2sLsXaxO5UGEano05WVA==
X-Received: by 2002:a05:6a21:e098:b0:24d:38c:26bd with SMTP id
 adf61e73a8af0-2e7d1ff0a57mr18099734637.43.1759067493381; 
 Sun, 28 Sep 2025 06:51:33 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c279f8sm8916171b3a.98.2025.09.28.06.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 06:51:33 -0700 (PDT)
Date: Sun, 28 Sep 2025 21:51:28 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250928135128.s57p4hj6y223gvf7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250928083442.7955-1-chao@kernel.org>
 <20250928083442.7955-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250928083442.7955-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cipCfPythIEZRp6W7OlgIOm7R0TsQUjllPMyhn_PD9g_1759067494
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Sep 28, 2025 at 04:34:42PM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create foo & bar > 2. write 8M data to foo
 > 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar > 4. [...] 
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
X-Headers-End: 1v2roZ-0005QB-9i
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs/022: do sanity check on footer
 of non inode dnode
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

On Sun, Sep 28, 2025 at 04:34:42PM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create foo & bar
> 2. write 8M data to foo
> 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
> 4. fpunch in foo w/ specified range
> 
> If we haven't applied kernel patch ("f2fs: fix to do sanity check on
> node footer for non inode dnode"), f2fs may missed to do sanity check
> on corrupted dnode, result in panic or deadloop in step 4).
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - remove "_require_kernel_config CONFIG_F2FS_CHECK_FS"
> - update comments a bit

This version looks good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/022     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/022.out |  2 ++
>  2 files changed, 56 insertions(+)
>  create mode 100755 tests/f2fs/022
>  create mode 100644 tests/f2fs/022.out
> 
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> new file mode 100755
> index 00000000..ed3b4f2b
> --- /dev/null
> +++ b/tests/f2fs/022
> @@ -0,0 +1,54 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/022
> +#
> +# This is a regression test:
> +# 1. create foo & bar
> +# 2. write 8M data to foo
> +# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
> +# 4. fpunch in foo w/ specified range
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +. ./common/attr
> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix to do sanity check on node footer for non inode dnode"
> +
> +_require_scratch_nocheck
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +foo_path=$SCARTCH_MNT/foo
> +bar_path=$SCARTCH_MNT/bar
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount
> +
> +touch $foo_path
> +touch $bar_path
> +$XFS_IO_PROG $foo_path -c "pwrite 0 8M"
> +sync
> +foo_ino=`stat -c '%i' $foo_path`
> +bar_ino=`stat -c '%i' $bar_path`
> +_scratch_unmount
> +
> +# inject foo inode to replace i_nid[0] w/ to bar ino
> +$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
> +
> +_scratch_mount
> +
> +# if CONFIG_F2FS_CHECK_FS is enabled, it will trigger a kernel panic,
> +# otherwise, it will enter a deadloop.
> +$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
> +_scratch_unmount
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
> new file mode 100644
> index 00000000..394c6a7c
> --- /dev/null
> +++ b/tests/f2fs/022.out
> @@ -0,0 +1,2 @@
> +QA output created by 022
> +Silence is golden
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
