Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5BBEB63B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Oct 2025 21:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DQn+rio7zp7cHn29qYKZ11Di0HeC0GxaZjbIPKFctY=; b=korrbEZ1IUibZXhbe8RN9PypMx
	UG52imHKYwwNcy/BwpvMK/o5B5zkfYA9rcN4wNgmBJsVJ1MjqbX30WA1R1oTOILih5/fcQWz3xita
	o4zEwxvblXi32bjlD0EeYgTWvJg34ELfn6AmnNXJN8ruJYF/A/ll7YD3VjMjPFhSujwY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9q9r-0006JR-AD;
	Fri, 17 Oct 2025 19:30:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v9q9q-0006JL-6O
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 19:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VL9F1Q6eRmzq2H+mSS9Xs3FgFDlVtC38/QZmDEt33w=; b=TupdNxzaqJwjO4aXxV4Wi/tUt/
 qhSM5RQd0l85r61zMaMZ9GnG3MtG5wv5Ozpo3s7W1ekHHEepIIl3lLH3L5P5l/NYfTSXOa325wPD0
 pPStrgiz4TKHXfd16m/kS6Y6r86z6fJyyD9UpzrHNuoP20QlfXn6WMdY/vP0msklog3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VL9F1Q6eRmzq2H+mSS9Xs3FgFDlVtC38/QZmDEt33w=; b=GYcEnE3wC06WsWZ4Pb/dZnP4Cd
 /20ReDFYHxvNCTHAE9otzroXuPygvm+Pzl2fEpYrKSfHm03ffkF/WKQRDBt7/1eYcnPyRbE8wfZMD
 6AmyDRnR0naIdmbllKUtLHieHtlwQq7FSd2MQFH0K1UcHHOK+gJX5bJ2P3cxNMaHjcqA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9q9p-0002ad-NP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 19:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760729422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7VL9F1Q6eRmzq2H+mSS9Xs3FgFDlVtC38/QZmDEt33w=;
 b=cPJlJ0WCf5092Aid6UPacff6vyG8su8knhRNcUOpj1erjphVfqnYfSFPci5OVaiL/H22GN
 5XoNtv7aIibP0LerxHlkcJxKJjfjGMT1PXlFWZ90fmtL9r5kslO1VRZ9VDWWCy5R+2xoK/
 iUJtWNV4ZylTSfkjAFl7JCbTTtQpSF4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-s5vjVogHOyuquhsw-piEDw-1; Fri, 17 Oct 2025 15:30:21 -0400
X-MC-Unique: s5vjVogHOyuquhsw-piEDw-1
X-Mimecast-MFC-AGG-ID: s5vjVogHOyuquhsw-piEDw_1760729420
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32ee4998c50so1859060a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Oct 2025 12:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760729420; x=1761334220;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7VL9F1Q6eRmzq2H+mSS9Xs3FgFDlVtC38/QZmDEt33w=;
 b=pRDoyj7p0tOjprGLdhTWoRS4N0JiiIr3f9EAAZ0EDc4qywcuZ5eQ/+lSlq62VOzz0Y
 q3fVD2siDYLdijCNic/RXdCOBVA/70OGbjUvgxF+H2p9NcNIIcDySV35EjmxuT9bB3Sj
 KXvGzkflLsxFETdTHze+CQh/X6evAMemvVOsWfdV9zn8NZzuwaXbGTV+ZcYDxhOx3Hsv
 ps24yoaOAYEwFHfX/4UGN3kBIDGxqhWVNMyVvAWkvoCmaWmIZ55+WarCeN/bBtOcBgh1
 y2NhVNA6XJovHc6ODf6fdx4muW7rZ9KMmnrcYrJWHVaC4GWRMdp6OeocCL+QWKNg0bd+
 lbcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCdHXTIjAfvZ84pkU8tgQHHa5K29TwZFbHcfDF19eemJd0wPmittzX5ZTzxh3xgOY0nB6HjRxVbQkZJBkvyDe9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxD/yshFaB2j94gL4ZWqX4mAF2i+D7+exYCLlJyuSZaRV/intDp
 nC1lpfyxsaDGiT8aPoub8wj8x7jh13OZ01RJ7BrCDuz+i5H3e5ZUq6l60OdhCKTyiR6gQ/+ioJE
 gVAwTpxEPPMRzha64AxZ1NbvtWdEMb14li+ydCB/O0mv5xCQ8EcNXV49X784DJecdv+Riga2Hmb
 1f0eY=
X-Gm-Gg: ASbGncv+cJaRAUARB8CHHriuRMFpx69g6oeHMTWM+H/m0FiT/i0DfE1euCIDhF1REFC
 H5hB9Tp1D6uSVZ3E7kojXmc4Uot3usw4Zfg1bSa/SVMOMFBv5xplnmqvFf8wQivEmbYTCIKJzui
 BdwcM0p/5uIsaFvO1YS/ftwQHRlbJuNrpCTjSwez2h6en2PstcRpqZ+s7AV+IXPsOmcUFzMd7LD
 mfk7wZ8eDI37A8KOUOqpLgcq+VozDD96Q5q2sS4KpHy6k6xDtgbrZhuGrILHg888X3pxzHJc+7l
 Gj1d1tDKsBJjoI9RDEj+o7m3ZfZ+Lz3AOHP2zQhNKJfzTCpjmxeLKlyQcghp+7O5DN5DbuFsWee
 N9PgKlyD0++vWtcrLxHrD+PIA6pKHGVVfTiD15dg=
X-Received: by 2002:a17:902:e80c:b0:265:57dc:977b with SMTP id
 d9443c01a7336-290cccc781amr59659365ad.61.1760729419839; 
 Fri, 17 Oct 2025 12:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG86OYrKZBz0jqOvlvMY1DrD8J9pWCiiZpCc3+lBMHwZDjWzThPUv6LILa7L0/tIPfw/2/thw==
X-Received: by 2002:a17:902:e80c:b0:265:57dc:977b with SMTP id
 d9443c01a7336-290cccc781amr59659045ad.61.1760729419400; 
 Fri, 17 Oct 2025 12:30:19 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5959sm2910105ad.68.2025.10.17.12.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 12:30:18 -0700 (PDT)
Date: Sat, 18 Oct 2025 03:30:13 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251017193013.ykrwjftkvhaug76z@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251011084715.608562-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251011084715.608562-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xlE5fgw5lwTjMNJkJceJmWHi8WkViK_Gy3qIComYVpI_1760729420
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Oct 11, 2025 at 04:47:14PM +0800, Chao Yu wrote: >
 This testcase tries to check whether f2fs can handle "usrjquota=" > during
 remount correctly, it expects kernel will encounter NULL > pointer [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9q9p-0002ad-NP
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs/021: test quota mount option
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

On Sat, Oct 11, 2025 at 04:47:14PM +0800, Chao Yu wrote:
> This testcase tries to check whether f2fs can handle "usrjquota="
> during remount correctly, it expects kernel will encounter NULL
> pointer dereference bug w/o the fix ("f2fs: fix to avoid NULL pointer
> dereference in f2fs_check_quota_consistency()").
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Reviewed-by: Zorro Lang <zlang@redhat.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Hi Chao,

This patchset has been merged, you can send a seperated patch to update the
commit id of _fixed_by_kernel_commit :)

Thanks,
Zorro

> v3:
> - update commit id in _fixed_by_kernel_commit line
>  tests/f2fs/021     | 30 ++++++++++++++++++++++++++++++
>  tests/f2fs/021.out |  2 ++
>  2 files changed, 32 insertions(+)
>  create mode 100755 tests/f2fs/021
>  create mode 100644 tests/f2fs/021.out
> 
> diff --git a/tests/f2fs/021 b/tests/f2fs/021
> new file mode 100755
> index 00000000..0cacb138
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
> +_begin_fstest auto quick mount quota remount
> +
> +_fixed_by_kernel_commit 930a9a6ee8e7 \
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
