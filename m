Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92547BA4DDD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 20:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqpmzHoFCI57Ql9XhhHDXXFXF4Gwt88hS3S1aTUn8nM=; b=hceEQFkDxLePLrX5ehEnsOfYsI
	cdSx1T6Hkyy50yCbrMI3NCulnFvdTAI3EDt+QtUZxpG7PGs9kOZEWdZMEWbgQ6jFysTj4AH/02dhg
	hQCJsZMG0ChAhDub9Bod905vN+H+EETB8jOntYFS195G4llaPog1luBia9g3o0K1FX9A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2D2C-0002eK-Ji;
	Fri, 26 Sep 2025 18:19:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v2D2B-0002eE-IB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 18:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cX2wH+EbGFZUEI4y4724LZ3Nec5RAN0sk3YwKB4Gqi0=; b=LTVbKUStj8ohbry/8C6QYYM+ep
 6Psj5eoIuw9ty4V0Y+frc+QvC75hL3NKr/1PMGd8MydY4/2q9UtBChAltu1E9p3SxXC8mKwk2Ar+4
 MKNbMUW+Advfw28blluSDXOJw3I2nRbZJJ2VBMt/+RpbCYtZvbhpDjfc1Ff4oyqTALvc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cX2wH+EbGFZUEI4y4724LZ3Nec5RAN0sk3YwKB4Gqi0=; b=DM64SdPdnyoBOI1J4Kl26i28B5
 P+8BZzMQPMSPn0ZgTqJTE13uMCSRjKgUCHK/EZJCYRfAgDniIf9AET+edTLv5tIlKpF/FIDK++Leo
 XoqQeQorO4LDPByoHdwpAKN7tK0S51JfIF0COVqHu/b4H5sHlk8VdVZdvj/iSTYT5y0I=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2D2B-0005PE-32 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 18:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758910735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cX2wH+EbGFZUEI4y4724LZ3Nec5RAN0sk3YwKB4Gqi0=;
 b=do2eqjWiAR9nEs35mfjJIOp+gN39TMJgALFlluxs1XBSaF38uNrg3pXJmh2jTDAMS7pqAQ
 ZKvwLvaVQYhvDRDP4OT+PNvu2bTzWErHv8Amf1DD11Q1y2ISfGI78l/6KV/o9E2YM5noST
 1xpdKjgbOTwijAVOxHbBMkh2646qdcw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-mze6V_VkMsiF99MvmuKV-w-1; Fri, 26 Sep 2025 14:18:54 -0400
X-MC-Unique: mze6V_VkMsiF99MvmuKV-w-1
X-Mimecast-MFC-AGG-ID: mze6V_VkMsiF99MvmuKV-w_1758910733
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-780fdbbdd20so2773258b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Sep 2025 11:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758910733; x=1759515533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cX2wH+EbGFZUEI4y4724LZ3Nec5RAN0sk3YwKB4Gqi0=;
 b=TKa2Df3LTp2YnVVafnmAwWPcFQrNIXCPnCI4kyQljKmTYRKmagHqWk2FFJEzW6G4FQ
 2Hrj1VpEtwLYCWGisd2NsOUzfOB/h2WDaRREAyRVgds/JK7gwXnB5u+IoRpIImmrIvrh
 ZdAdf6PBZepgs320Aee7dpya9t5nZGllskbpyb1bk2Qzzvc4xAnoroBS/1cCtVoJbqdC
 L7K/3r87xnLZDIcKsYJ1GR+/peGM27tHL4xDDuhDjjIYNyoMAb6vJK/jalqTm61rv6Nu
 Z4lWtXebH2pMhdB7KZDuILTrJ7k55nP+o5aFoiN+XRlzF9MLtIHq3MHHh6px2Yyn4eKd
 0aaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvrChjgkvIxvMo0cbx+GEZUQ0uzB0Qy7xmmnO2iIbQ1CO2fxhc+b3B1a5lhBqDiW1ehjA/GtILCB7ovAHYFS03@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyhnjmWG1M8BBy6M5akyore/3B2UVPvAu1Gt/xEQ010ele6K8Am
 8Uw/WhNhRk+/Sfa3eYr9/0y595LSk/imvAaz3HXgnt6vYMYZvJNScxBgY5MV0ftx+q2SBYHMNpm
 ESIJp3EzyB6IBWGhplgsS3/gdzNjTyxNyJeF+bwdDjdp5VnuSdMjpMAPkV8l5hu6s+gkMebM4Dw
 Zhmrk=
X-Gm-Gg: ASbGncsS/vU3GWCeWgPxQByoUs5JjV0UVNE43IjrrOiAaOcJoJWkDRBRO54n98JkzJa
 PD/httPB04eqzQbwCBtT3SZ539bPj6k/hX4APDS+ta4xLy7BYvOL6M2HDSN4rJdRBIaP/1K+V+s
 QwL7YdcyI4sKJefE3u6DiLYtUeBbFV8tW/w1piQAPL/0VfAPfoiCY97M4245ArqUfd2jexRhU2t
 LMDkyKTBR4TpWNfs/DRZ/7GwPS8a3l996uKrTakDt8fAZMlRgDUbUHSZzsRLaIWICGliufvJ/Bz
 JGiTW03TtN2Ntc0UgoU9OLf34lcuLiRJVe4OIIbe6zJ4VK2xBq/D4qm7O0lUu/KTu7Yk6SfPCXK
 j109p
X-Received: by 2002:a17:90b:1c8d:b0:32e:936f:ad7 with SMTP id
 98e67ed59e1d1-3342a2d9becmr9613045a91.27.1758910733048; 
 Fri, 26 Sep 2025 11:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGAB85DNc1y13kOKPOXXUiKKWLpm5a6b8DXLkkhg8vG9CugFJu9Hub8qmZJMRL++wJuNGUfA==
X-Received: by 2002:a17:90b:1c8d:b0:32e:936f:ad7 with SMTP id
 98e67ed59e1d1-3342a2d9becmr9613023a91.27.1758910732612; 
 Fri, 26 Sep 2025 11:18:52 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33473f7beacsm5990132a91.15.2025.09.26.11.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 11:18:52 -0700 (PDT)
Date: Sat, 27 Sep 2025 02:18:47 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250926181847.rebyuxqba7hy225r@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250901020331.2171502-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250901020331.2171502-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iap_1wIv8KhWhxTHEvUxqV5EDkjSKSFdU7NfDeDCTQE_1758910733
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 01, 2025 at 10:03:30AM +0800, Chao Yu wrote: >
 This testcase tries to check whether f2fs can handle "usrjquota=" > during
 remount correctly, it expects kernel will encounter NULL > pointer [...] 
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2D2B-0005PE-32
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs/021: test quota mount option
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

On Mon, Sep 01, 2025 at 10:03:30AM +0800, Chao Yu wrote:
> This testcase tries to check whether f2fs can handle "usrjquota="
> during remount correctly, it expects kernel will encounter NULL
> pointer dereference bug w/o the fix ("f2fs: fix to avoid NULL pointer
> dereference in f2fs_check_quota_consistency()").
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/021     | 30 ++++++++++++++++++++++++++++++
>  tests/f2fs/021.out |  2 ++
>  2 files changed, 32 insertions(+)
>  create mode 100755 tests/f2fs/021
>  create mode 100644 tests/f2fs/021.out
> 
> diff --git a/tests/f2fs/021 b/tests/f2fs/021
> new file mode 100755
> index 00000000..c41760fc
> --- /dev/null
> +++ b/tests/f2fs/021
> @@ -0,0 +1,30 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/021
> +#
> +# This testcase tries to check whether f2fs can handle "usrjquota="
> +# during remount correctly
> +#
> +. ./common/preamble
> +_begin_fstest auto quick mount
                                  ^^^^^^^^^^^^^
                                  quota remount

I'll help to add these two tags when I merge it. Others look good to me,
if you've maken sure it can trigger the bug you want to uncover.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +
> +_fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()"
> +
> +_require_scratch
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount "-o usrquota"
> +quotacheck -uc $SCRATCH_MNT
> +_scratch_unmount
> +
> +_scratch_mount "-o usrjquota=aquota.user,jqfmt=vfsold"
> +_scratch_mount "-o remount,usrjquota=,jqfmt=vfsold"
> +_scratch_unmount
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/021.out b/tests/f2fs/021.out
> new file mode 100644
> index 00000000..09f4062d
> --- /dev/null
> +++ b/tests/f2fs/021.out
> @@ -0,0 +1,2 @@
> +QA output created by 021
> +Silence is golden
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
