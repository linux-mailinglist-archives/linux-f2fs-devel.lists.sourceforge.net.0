Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DE9FD0FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Dec 2024 08:21:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tR4fP-0002wT-CI;
	Fri, 27 Dec 2024 07:21:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1tR4fO-0002wN-6a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jTdDZUtw2Ka0vLXbecitBmQbRYS1xtRV2yfPiransTE=; b=Yu9VRLZU5dGxR7ueAuTIjU6kia
 zdnzu+/hZDdovsdCFGxzHFRO7j+W8Wg7/ZuHYCXQt4Gx7Zen9Gk43I+f3aQNJNQXZJj2V+CAK2rt4
 RswN42gWGis0Oqvje2iQJABEhFtfCBDqc5miDUrNR+kfRYCGJXNja4NYsipbFMSHc3Mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jTdDZUtw2Ka0vLXbecitBmQbRYS1xtRV2yfPiransTE=; b=Sn0vjCgk9XfEGZHRcFDP+npl1h
 p1L27dC1W9f84nDbpTx7ypfOf76U9x1G+LFFCj33CMDKW4GWXedS5Jx/8yWFEHpBiQf4oNIa323kh
 9C/8bKtCmsq+fai16XKdM/L9wgRd07fuokD+H4w/mBoQcHfl7keLkViW7SGg7NPmG5hU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tR4fM-0006kv-TM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735284097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jTdDZUtw2Ka0vLXbecitBmQbRYS1xtRV2yfPiransTE=;
 b=K27olHQxIUIUHo/CbtUJo2o531RWAP03Kk103SpKcKB06Olgo+MKYApfRmEodONtWApvXp
 4Sx3kxWg3lEd2+vat7SlJeSCA4vQOLilm1iae83L1QOSUVNQ4jbVZLK2g/K//8UIL6NQev
 2RVRW86RPNU+E7t14TJaGP6/UYPtZL0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-Ab_JEBBhN0qLyUH1cJ0uwg-1; Fri, 27 Dec 2024 02:21:36 -0500
X-MC-Unique: Ab_JEBBhN0qLyUH1cJ0uwg-1
X-Mimecast-MFC-AGG-ID: Ab_JEBBhN0qLyUH1cJ0uwg
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2166f9f52fbso144150255ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2024 23:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735284095; x=1735888895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTdDZUtw2Ka0vLXbecitBmQbRYS1xtRV2yfPiransTE=;
 b=ZQ6XECHifcM2u9VuXit0diVNV/FjM8o/Qfs1BcksJLGCbwQ9xJ9LzQ76hQrpnM5h4M
 ZjeCTAeRMw/Qh/NfFwL3PhAdNlDZ7TpZw5yZbejo8WtOqZfd1sUhxSl2bGuXxek4sNYv
 YQsZsR5v1Lkpx12qoLWg5YK4J1wvJZ7MLhE5AWYkU5k1bEDn4+djmbW0UOPedUBtk4su
 QQMJMplL0gPTN2Cw4Z1h3wYgLR1MjpBeD5erW8zT9uMTslZvqH4n7KQR/+Z5u9VKkN/o
 4HaEso9E/L9bcroNDJ3DUyzNX/Ebm5BgieRGARS15j77CiyYUZb1Y++tTQJVmmsHGpgp
 LQRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCrElDxwFo9L9/reVvqxqg35Plx9VEMOKOuxgoRv5MUMumWsPx5WcsrSVDo5KQKiH8/eydMX0sGyDf1PQb0GMm@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz4Zge0fjKSBbpN/Y52Zm/pnCZ7Qs8irazRebb4DZMlnJe6LS5f
 e0jrjCeU6uNoTKLYudVQXBucdQubK4yPvwO6ajlO3JlZGoQgg97CpK5PTCDJE3GNRrXOz1F8EY2
 80zK2TUQ8yNRuuDrm0HCs43pKfE4TfTDVAiuLrCwXZkGotzWm0eQeOspRt/mJ7Aow14S3tT8jPm
 E=
X-Gm-Gg: ASbGncsTCk1a3NTAWZSQNuOhzZVdpuu+XviyJ78cgN3oG//7hxwtIxwJgmsiXOWtQxF
 mHIOqRDE2fjPHj98lTnH5d9dLUEmSXD6Dc6htTDtkCjNZYOTkS6EE3QH7l8aXLExaAoKA+WFTVX
 IY/rV1YNeabt5XvSA+nnOj+N5gwMWvbZ/oMpSG0LvqHJ9d52iRIAGTiwcBfL+ltPp1Z3SQ9jTxA
 hdD+GQyxC8aHUCph5L73ZlhvGnkCa0jcGgfnr4xGOy8QnSouXQTRxqhzOYwfAx7oDv4HUMt/NSf
 vDiO3GsrtPvoVdDzyQ0hnA==
X-Received: by 2002:a05:6a20:258e:b0:1db:e40d:5f89 with SMTP id
 adf61e73a8af0-1e5e07eed86mr37314811637.28.1735284095203; 
 Thu, 26 Dec 2024 23:21:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGqtd9+hI2bhQ8GbhtjQjnJ+9D00ZELi7HpVEX5suJMoPY0wJRKzQlCNcs+NS7JZHQ4NGgqg==
X-Received: by 2002:a05:6a20:258e:b0:1db:e40d:5f89 with SMTP id
 adf61e73a8af0-1e5e07eed86mr37314788637.28.1735284094854; 
 Thu, 26 Dec 2024 23:21:34 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8fe5fbsm14432988b3a.142.2024.12.26.23.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 23:21:34 -0800 (PST)
Date: Fri, 27 Dec 2024 15:21:30 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241227072130.3spzr4hlkaqakt2x@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241221082345.196029-1-chao@kernel.org>
 <20241221082345.196029-2-chao@kernel.org>
 <20241224095821.ylfv622fifsk3tsv@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <38a448c9-5cd4-482e-8411-a801995199c3@kernel.org>
MIME-Version: 1.0
In-Reply-To: <38a448c9-5cd4-482e-8411-a801995199c3@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pHX9XsyFWmxShJ8dqmQeNMycNnuX9fHC82-XLTo36qk_1735284095
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 26, 2024 at 09:18:36PM +0800, Chao Yu wrote: >
 On 2024/12/24 17:58, Zorro Lang wrote: > > On Sat, Dec 21, 2024 at 04:23:45PM
 +0800, Chao Yu wrote: > > > This patch introduce a regression t [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tR4fM-0006kv-TM
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs/008: test snapshot
 creation/deletion on lvm device
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

On Thu, Dec 26, 2024 at 09:18:36PM +0800, Chao Yu wrote:
> On 2024/12/24 17:58, Zorro Lang wrote:
> > On Sat, Dec 21, 2024 at 04:23:45PM +0800, Chao Yu wrote:
> > > This patch introduce a regression testcase to check whether
> > > f2fs can handle discard correctly once underlying lvm device
> > > changes to not support discard after user creates snapshot
> > > on it.
> > > 
> > > Related bug was fixed by commit bc8aeb04fd80 ("f2fs: fix to
> > > drop all discards after creating snapshot on lvm device")
> > > 
> > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > > v3:
> > > - rebase to last for-next branch
> > > - update according to Zorro's comments.
> > >   tests/f2fs/008     | 57 ++++++++++++++++++++++++++++++++++++++++++++++
> > >   tests/f2fs/008.out |  2 ++
> > >   2 files changed, 59 insertions(+)
> > >   create mode 100755 tests/f2fs/008
> > >   create mode 100644 tests/f2fs/008.out
> > > 
> > > diff --git a/tests/f2fs/008 b/tests/f2fs/008
> > > new file mode 100755
> > > index 00000000..b85e321c
> > > --- /dev/null
> > > +++ b/tests/f2fs/008
> > > @@ -0,0 +1,57 @@
> > > +#! /bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (c) 2024 Oppo.  All Rights Reserved.
> > > +#
> > > +# FS QA Test No. f2fs/008
> > > +#
> > > +# This is a regression test to check whether f2fs can handle
> > > +# discard correctly once underlying lvm device changes to not
> > > +# support discard after user creates snapshot on it.
> > > +#
> > > +
> > > +. ./common/preamble
> > > +_begin_fstest auto quick rw
> > > +
> > > +_fixed_by_kernel_commit bc8aeb04fd80 \
> > > +        "f2fs: fix to drop all discards after creating snapshot on lvm device"
> > > +
> > > +_require_scratch_nolvm
> > > +_require_block_device $SCRATCH_DEV
> > > +_require_command "$LVM_PROG" lvm
> > > +
> > > +lvname=lv_$seq
> > > +vgname=vg_$seq
> > > +testfile=$SCRATCH_MNT/testfile
> > > +
> > > +_cleanup()
> > > +{
> > > +	_unmount $SCRATCH_MNT >>$seqres.full 2>&1
> > > +	$LVM_PROG lvremove -ff /dev/mapper/$lvname-snapshot $vgname >>$seqres.full 2>&1
> > > +	$LVM_PROG lvremove -ff /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> > > +	$LVM_PROG vgremove -ff $vgname >>$seqres.full 2>&1
> > > +	$LVM_PROG pvremove -ff $SCRATCH_DEV >>$seqres.full 2>&1
> > > +	_udev_wait --removed /dev/mapper/$vgname-$lvname
> > > +	cd /
> > > +	rm -f $tmp.*
> > > +}
> > > +
> > > +$LVM_PROG pvcreate -f $SCRATCH_DEV >>$seqres.full 2>&1
> > > +$LVM_PROG vgcreate -f $vgname $SCRATCH_DEV >>$seqres.full 2>&1
> > > +$LVM_PROG lvcreate -L 1024m -n $lvname $vgname >>$seqres.full 2>&1
> > 
> > The lvcreate might be blocked by:
> >    "WARNING: f2fs signature detected on /dev/vg_008/lv_008 at offset 1024. Wipe it? [y/n]:"
> 
> Oh, I didn't encounter this... is it due to I use low version lvm tool?

I tried to run this test twice, the second test hang there, then I found it.

> 
> lvm version
>   LVM version:     2.03.11(2) (2021-01-08)
>   Library version: 1.02.175 (2021-01-08)
>   Driver version:  4.48.0
> 
> > 
> > So better to use "lvcreate -y" or "yes | ...".

`lvcreate -y` is good, but I'm not sure which lvm version starts to support
this option. So the "yes | ..." might have better compatibility.

Thanks,
Zorro

> 
> Sure.
> 
> Thanks,
> 
> > 
> > Thanks,
> > Zorro
> > 
> > > +_udev_wait /dev/mapper/$vgname-$lvname
> > > +
> > > +_mkfs_dev /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> > > +_mount -o discard /dev/mapper/$vgname-$lvname $SCRATCH_MNT >>$seqres.full 2>&1
> > > +
> > > +dd if=/dev/zero of=$testfile bs=1M count=20 >>$seqres.full 2>&1
> > > +sync
> > > +rm -f $testfile
> > > +sync
> > > +
> > > +# create a snapshot on lvm device
> > > +$LVM_PROG lvcreate -L 1024m -s -n $lvname-snapshot /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
> > > +
> > > +echo "Silence is golden"
> > > +
> > > +status=0
> > > +exit
> > > diff --git a/tests/f2fs/008.out b/tests/f2fs/008.out
> > > new file mode 100644
> > > index 00000000..dd68d5a4
> > > --- /dev/null
> > > +++ b/tests/f2fs/008.out
> > > @@ -0,0 +1,2 @@
> > > +QA output created by 008
> > > +Silence is golden
> > > -- 
> > > 2.40.1
> > > 
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
