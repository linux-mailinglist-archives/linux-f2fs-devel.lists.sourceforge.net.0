Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF3932492
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jul 2024 13:04:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTfyU-0006qg-Lh;
	Tue, 16 Jul 2024 11:04:02 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1sTfyT-0006qQ-F3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jul 2024 11:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G3/AtxtSwR8lUsUE4FZXEG4bGpUSLh82ydkzVdaGpVA=; b=QBkE2spe84H4LT35tV3D9778YO
 XNVlfXATTSlJS7B6OwXRRw4I5oPNFiPHB0jITFz5wigbwP5j95bgYe92lhIxAjp3CdNgcKSBwL/n2
 eJ7CiRn3dfMFtu3KMbFF6VnSdaZG/Xp17epVjP++lxvXN5XDrj39W7MnZCVx/l33jEDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G3/AtxtSwR8lUsUE4FZXEG4bGpUSLh82ydkzVdaGpVA=; b=BkCZ82npKf1AVd1wzcAgQExB0M
 2iD2hV1USH3eKOQuvCMYl9xbbaU9Bv8uBtkWysKk+FwQ0rvFywMHcMoPz9awv6esqUuBjt+uycSjB
 HoWEQmQJhJgjgsXof0A7uijmv/fC2gT9VaGO+Jjw2AEG9cipimmaiEp2TH5TgL1bbL04=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTfyT-00015d-D9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jul 2024 11:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721127829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3/AtxtSwR8lUsUE4FZXEG4bGpUSLh82ydkzVdaGpVA=;
 b=Q81Aujxd0MCvluRXo41G6/P3TwKtyPNBTQd8VDQLKNhUCFzfu6p/Q8AkebGP7Ioi8hzamK
 F7E+gU5GIsMab5jrVNol2GH6wsiIYRAT24Yvfky1odmJPO+Lp3H94fijBT2i8IHphihRu7
 9mznogejvAl6v4Uohm1fkBRY2fZiK2k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-mfu_zYGfPdKZiWcR9lm8Vw-1; Tue, 16 Jul 2024 07:03:48 -0400
X-MC-Unique: mfu_zYGfPdKZiWcR9lm8Vw-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1fb019a1227so36581085ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jul 2024 04:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721127827; x=1721732627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G3/AtxtSwR8lUsUE4FZXEG4bGpUSLh82ydkzVdaGpVA=;
 b=WE4v3PUrQObjIldpomDKMGKMlzFOeEfEwXmIoXcVPeMUwKNQJYrYWfFMAp4M8uR8S9
 HeJFFJUXj+SaHUZxbpho/0aqfNMYPAHeciXWwOsk0R8qmn2vQOxm+A7PgZPyYKKuukCi
 /McjTSYCxZL96U3ykIXDeAlR62PeErtzvcX0uYCIowzOsHiJm13kZgp+L9azQdjeefzA
 +9PBgfDErQZ06usG7W9/0P2km/8yb8UrDLZ85VRWo9GxBin6YRE1cula7DcCRhpaqZgG
 f4hMmWEomeflt9shlX3V7RuNJ8GSHIVSUqkj+ejtTMNwPv+pJPmRomVl62LuuTRFnVjc
 ZYVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXaQi5PtGFaXCnR+J3uwJFmMmAJpfsjpuxDgvUG8OCFyv/dskmVXBaB9wuCvSzwSpJ5xnRJB1vVakQmTUSZrls3VE5r9WWwwjBKUKj7jmbClgtTU93ww==
X-Gm-Message-State: AOJu0YyuUdevXJbteV7xyPFI+sI3j2R5xDAeCWgrm5BSbGelTzcDQzOY
 IUzfbFfpH/7X4WW8QqfLemcWyu+8hJu5o0cPAz7Z1AFe8Yww1QJtb1ZChSnRbp7AiiteK5yfOdb
 qSlrg3P+zrw2iXSVcE4/MFJmivPEyjmue9F3VZoFE47RpJ625qQH/NTjaUPCYZf02Vyv8Kmjpmg
 uy9WUJy9Jb8w==
X-Received: by 2002:a17:903:189:b0:1fb:48c6:a2b0 with SMTP id
 d9443c01a7336-1fc3d914683mr14517505ad.5.1721127826920; 
 Tue, 16 Jul 2024 04:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpuozIIg2P4JkySM51kbaebxVPC2AGB8uZWPOqDTc7+W31Ck3hl6zCrnTREBha5R8olzIpVw==
X-Received: by 2002:a17:903:189:b0:1fb:48c6:a2b0 with SMTP id
 d9443c01a7336-1fc3d914683mr14517305ad.5.1721127826525; 
 Tue, 16 Jul 2024 04:03:46 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc3921bsm55775415ad.227.2024.07.16.04.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 04:03:46 -0700 (PDT)
Date: Tue, 16 Jul 2024 19:03:42 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240716110342.2jhwp3wn65pvhoyd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240625140233.3907012-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240625140233.3907012-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 25, 2024 at 10:02:33PM +0800, Chao Yu wrote: >
 In this patch, we simulate race case in between sqlite atomic write > and
 direct IO w/ below steps: > 1. create a regular file, and initializ [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTfyT-00015d-D9
Subject: Re: [f2fs-dev] [PATCH] f2fs: test for race condition in between
 atomic_write and dio
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 25, 2024 at 10:02:33PM +0800, Chao Yu wrote:
> In this patch, we simulate race case in between sqlite atomic write
> and direct IO w/ below steps:
> 1. create a regular file, and initialize it w/ 0xff data
> 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> 3. write transaction data
> 4. trigger direct read/write IO on it to check whether it fails or not
> 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> This is a regression test to check handling of race condition in
> between atomic_write and direct IO.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/004     | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/004.out |  3 +++
>  2 files changed, 48 insertions(+)
>  create mode 100755 tests/f2fs/004
>  create mode 100644 tests/f2fs/004.out
> 
> diff --git a/tests/f2fs/004 b/tests/f2fs/004
> new file mode 100755
> index 00000000..26862cb5
> --- /dev/null
> +++ b/tests/f2fs/004
> @@ -0,0 +1,45 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/004
> +#
> +# Test that we will simulate race case in between sqlite atomic write
> +# and direct IO w/ below steps:
> +# 1. create a regular file, and initialize it w/ 0xff data
> +# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> +# 3. write transaction data
> +# 4. trigger direct read/write IO to check whether it fails or not
> +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> +# This is a regression test to check handling of race condition in
> +# between atomic_write and direct IO.

Same as last patch, please add _fixed_by_kernel_commit.

> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +. ./common/filter
> +
> +_supported_fs f2fs
   ^^^^^
It's not needed

> +_require_scratch
> +_require_xfs_io_command "pwrite"
   ^^^^
It can be removed too I think.

> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +dbfile=$SCRATCH_MNT/dbfile
> +
> +# start atomic_write on dbfile & write data to dbfile
> +touch $dbfile
> +$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &

There's a backgroup process too. Better to make sure it's done "kill && wait"
before the end of the test.

> +
> +# simulate concurrent direct read/write IO
> +$XFS_IO_PROG -d -c "pread 0 128k" $dbfile
> +$XFS_IO_PROG -d -c "pwrite 0 128k" $dbfile

Do you need _require_odirect (not sure about that:).

> +
> +# wait for atomic_write commit completion
> +sleep 5
> +
> +_scratch_unmount
   ^^^^
It's not necessary.

Thanks,
Zorro

> +
> +status=0
> +exit
> diff --git a/tests/f2fs/004.out b/tests/f2fs/004.out
> new file mode 100644
> index 00000000..3af79541
> --- /dev/null
> +++ b/tests/f2fs/004.out
> @@ -0,0 +1,3 @@
> +QA output created by 004
> +pread: Operation not supported
> +pwrite: Operation not supported
> -- 
> 2.40.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
