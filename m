Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCE933F75
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2024 17:20:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sU6SF-0005TN-Rg;
	Wed, 17 Jul 2024 15:20:32 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1sU6SE-0005TF-3b
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 15:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lSrxkKH5oX3hAbxIHU7zSBxDFHpf2cFpqd3Al4ItjBs=; b=XTBpoq9OShWbuXESxIP8mASq7k
 okoTqFO3TlvdxnVFmt2vrQxgOrVmFFSQQ+0KbXG/A0pxDG9IwMJQAYaFSojcHJBQBFpZpIFZ2xwhQ
 LNoIUnj/niuQPEChVAWqZCEQeFU1EqTM4I/rQZro2L0/OGuw30OVEaHlN+hLgxn/kxo8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lSrxkKH5oX3hAbxIHU7zSBxDFHpf2cFpqd3Al4ItjBs=; b=X2AeuQ4SVCE5IPfR3LJnQpWm5d
 HXjrdwCZE3rSzgW8s+p4TsvczKPCBrn4v46zBE8zHlNJR/u+ba5HyslaAg+vt55Z3OJ+TpuzeqH5A
 scmHsXaHgYNZOF5/XgYdycq2DsqsJOfTTKyQOtQJHa/TPW5cuCc+hEjAvXX/wQT7ZNLk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sU6SE-0002oE-O7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 15:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721229623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lSrxkKH5oX3hAbxIHU7zSBxDFHpf2cFpqd3Al4ItjBs=;
 b=akDaEPQ79eklm9MiNqVbS6XoboKvx26YpFL8R402U37/TjngZg0iAtZpF4yF1PkifLs1SP
 OCgKc/bceWpdjR1PpIjRtlp7OYKon8QVDu0ksD99g7ZWwhqPfNoTNsXvvdX6CJXE2/vdaw
 Lmu3hyyxU0JniUzTxNj16uUnS6PmASY=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-aorosZjCO_-Am_1j6gM6ZA-1; Wed, 17 Jul 2024 11:20:22 -0400
X-MC-Unique: aorosZjCO_-Am_1j6gM6ZA-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-75fa4278316so4673856a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jul 2024 08:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721229621; x=1721834421;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSrxkKH5oX3hAbxIHU7zSBxDFHpf2cFpqd3Al4ItjBs=;
 b=Wftadth4QPT/OSnCmoGFU5/ngxs4v/w0FX1ewhIfaWcZCPRr5F6Hx1NqoOeMweEawE
 VkrD8kXNfOU88MFRRBRKGLkrhY57jB1Pfa9nJr+q4/I/XKNoM3yBBkMH97kwQK2FoPrm
 JyfMXHx643GOtNcILxYeGbCTw6opKcordn79T2KAJaycBWNga8mSE9bzhf/w5f/X2y8M
 7A0AZTtFM1lOYNG9SQLg9klAs5McF8eJ3kw3prm7wTTs7FQbcpOv4JpCjiF4h5waJ60E
 +SAutJpCaSkPjb71u0ORCCK7T9jS7Ta/fOygcOBvhB3s4wO5L7kEWzFm0iMH8taG48tg
 j0Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHiJDLm3ZKAXzWdCm2+ucFKJCeifvvmzTC0KWDe136Msfsde5B96w2mRPVfR0hceR/4qA92eXJakJzHVVVxbD0j87adRlWf3RPck5TmSlYCTIXVtg8ew==
X-Gm-Message-State: AOJu0YxzIXyXAf3XsS9ntSebOWZPzA7cWE/ywvm2kaVrqBw2Bld+NtO+
 YFEi9jF/hNc03ereHX8TFjouxjyGMMxqxwbqUMNV7DyajxWwUn3tTT8m2nojHp1ZXbtWuCramiX
 efrrnGPAGdWHahXLO8NY+09H800+jAkwaP2dVFJ1lm9T5C5NoxUAPpxQHrA/ntXQuYF5yOFVdCT
 0giK5JrM8Rag==
X-Received: by 2002:a05:6a20:c997:b0:1c0:e652:1b2f with SMTP id
 adf61e73a8af0-1c3fdd18396mr1988293637.33.1721229621172; 
 Wed, 17 Jul 2024 08:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4/ki/F3RVX1SgOVKSHoLyh6+jjbGSAxasEiuoavCPRCvKSas4A+ciKv15wZTqxvuPZFITTQ==
X-Received: by 2002:a05:6a20:c997:b0:1c0:e652:1b2f with SMTP id
 adf61e73a8af0-1c3fdd18396mr1988269637.33.1721229620770; 
 Wed, 17 Jul 2024 08:20:20 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7dfddsm8221024b3a.101.2024.07.17.08.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:20:20 -0700 (PDT)
Date: Wed, 17 Jul 2024 23:20:17 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240717152017.5i6z4nmjst26ak7f@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240625030416.3553498-1-chao@kernel.org>
 <20240716105710.v76icnjhqmvjmgsd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <fba75c06-b0d9-4e92-b673-9c11314744c1@kernel.org>
MIME-Version: 1.0
In-Reply-To: <fba75c06-b0d9-4e92-b673-9c11314744c1@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 17, 2024 at 10:12:16AM +0800, Chao Yu wrote: >
 On 2024/7/16 18:57, Zorro Lang wrote: > > On Tue, Jun 25, 2024 at 11:04:16AM
 +0800, Chao Yu wrote: > > > Test that we will simulate sqlite at [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sU6SE-0002oE-O7
Subject: Re: [f2fs-dev] [PATCH] f2fs: test for race condition in between
 atomic_write and gc
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
 fstests@vger.kernel.org, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 17, 2024 at 10:12:16AM +0800, Chao Yu wrote:
> On 2024/7/16 18:57, Zorro Lang wrote:
> > On Tue, Jun 25, 2024 at 11:04:16AM +0800, Chao Yu wrote:
> > > Test that we will simulate sqlite atomic write logic w/ below steps:
> > > 1. create a regular file, and initialize it w/ 0xff data
> > > 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> > > 3. write transaction data
> > > 4. trigger foreground GC to migrate data block of the file
> > > 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> > > 6. check consistency of transaction w/ in-memory and on-disk data
> > > This is a regression test to check handling of race condition in
> > > between atomic_write and GC.
> > 
> > Hi Chao,
> > 
> > Sorry for the late reviewing. As this's a regression test, so which onne
> > kernel commit fix this known issue, please specify it by:
> > 
> > _fixed_by_kernel_commit $commit_id $commit_subject
> 
> Hi Zorro,
> 
> Since the fixed patch has not been merged yet, so what about adding this line
> after merging the fix?

Oh, sure, but generally they'd like to use "xxxxxxxxxxxx" to be the $commit_id
(as a reminder) if there's not an assured id number. Then replace the "xxxxxx...."
with the right id number after the patch merged. But it depends on you, just
don't forget that :)

Thanks,
Zorro

> 
> > 
> > > 
> > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > > Cc: Daeho Jeong <daehojeong@google.com>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   tests/f2fs/003     | 61 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   tests/f2fs/003.out | 11 +++++++++
> > >   2 files changed, 72 insertions(+)
> > >   create mode 100755 tests/f2fs/003
> > >   create mode 100644 tests/f2fs/003.out
> > > 
> > > diff --git a/tests/f2fs/003 b/tests/f2fs/003
> > > new file mode 100755
> > > index 00000000..d8311c4c
> > > --- /dev/null
> > > +++ b/tests/f2fs/003
> > > @@ -0,0 +1,61 @@
> > > +#! /bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> > > +#
> > > +# FS QA Test No. f2fs/003
> > > +#
> > > +# Test that we will simulate sqlite atomic write logic w/ below steps:
> > > +# 1. create a regular file, and initialize it w/ 0xff data
> > > +# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
> > > +# 3. write transaction data
> > > +# 4. trigger foreground GC to migrate data block of the file
> > > +# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
> > > +# 6. check consistency of transaction w/ in-memory and on-disk data
> > > +# This is a regression test to check handling of race condition in
> > > +# between atomic_write and GC.
> > > +#
> > > +. ./common/preamble
> > > +_begin_fstest auto quick
> > > +
> > > +. ./common/filter
> > > +
> > > +_supported_fs f2fs
> >      ^^^^^
> > This line is not necessary now.
> > 
> > > +_require_scratch
> > > +_require_xfs_io_command "pwrite"
> > 
> > pwrite is a basic command of xfs_io, so I think this line is not necessary.
> > 
> > > +_require_xfs_io_command "fpunch"
> > > +
> > > +_scratch_mkfs >> $seqres.full
> > > +_scratch_mount >> $seqres.full
> > > +
> > > +dbfile=$SCRATCH_MNT/dbfile
> > > +foo=$SCRATCH_MNT/foo
> > > +bar=$SCRATCH_MNT/bar
> > > +
> > > +$XFS_IO_PROG -c "pwrite 0 512k -S 0xff" -c "fsync" -f $dbfile >> $seqres.full
> > > +$XFS_IO_PROG -c "pwrite 0 2m" -c "fsync" -f $foo >> $seqres.full
> > > +sync
> > > +
> > > +# start atomic_write on dbfile & write data to dbfile
> > > +$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
> > 
> > As there's a background process, shouldn't we do kill and wait in _cleanup
> > to make sure unmount won't hit EBUSY?
> > 
> > > +$XFS_IO_PROG -c "fpunch 0 2m" $foo >> $seqres.full
> > > +$XFS_IO_PROG -c "pwrite 0 2m" -c "fsync" -f $bar >> $seqres.full
> > > +
> > > +# persist all dirty data
> > > +sync
> > > +echo 3 > /proc/sys/vm/drop_caches
> > > +
> > > +# trigger foreground GC to migrate data block of atomic_file
> > > +$F2FS_IO_PROG gc 1 $SCRATCH_MNT > /dev/null 2>&1
> > > +
> > > +# wait for atomic_write commit completion
> > > +sleep 5
> > > +# print in-memory data
> > > +od -x $dbfile
> > > +echo 3 > /proc/sys/vm/drop_caches
> > > +# print on-disk data
> > > +od -x $dbfile
> > 
> > There's a common helper named "_hexdump" in common/rc, can that be used?
> > 
> > > +
> > > +_scratch_unmount
> > 
> > The SCRATCH_DEV will be unmounted at the end of the test, don't need to
> > do this manually if it's not a necessary test step.
> 
> Let me update this patch according to your comments, thanks.
> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
> > > +
> > > +status=0
> > > +exit
> > > diff --git a/tests/f2fs/003.out b/tests/f2fs/003.out
> > > new file mode 100644
> > > index 00000000..d6c8a637
> > > --- /dev/null
> > > +++ b/tests/f2fs/003.out
> > > @@ -0,0 +1,11 @@
> > > +QA output created by 003
> > > +0000000 0000 0000 0000 0000 0000 0000 0000 0000
> > > +*
> > > +0400000 ffff ffff ffff ffff ffff ffff ffff ffff
> > > +*
> > > +2000000
> > > +0000000 0000 0000 0000 0000 0000 0000 0000 0000
> > > +*
> > > +0400000 ffff ffff ffff ffff ffff ffff ffff ffff
> > > +*
> > > +2000000
> > > -- 
> > > 2.40.1
> > > 
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
