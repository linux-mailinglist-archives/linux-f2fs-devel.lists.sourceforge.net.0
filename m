Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9EAC250F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 16:32:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEccEsiQdcbOq6XkxAPjhD3841f4nkil9PWqEb5rEzY=; b=F+z5j4Pw5fsZQwISns0dOmlU12
	CPONwzcjAf4gXOAvdpiKEjZjk+ZKvXSXTL7tDfRICzP0vroCW+bnijNjj/6NRlwxDAWfJRZfavmGG
	R2Olj5Uf+aWnNVUpQ/vpDZfXtOV+2ZBw6MS9GEdwHr0sAkrDAQ5tFBcRdl+6yU19bdiU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uITRj-0000oR-Mk;
	Fri, 23 May 2025 14:32:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uITRh-0000oJ-Kp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 14:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CsOrD6RccmXcmvSNUP2aWZDRJP25W6EDJHGI6Pg7wu8=; b=G4YKP+7Etf8HUXWafMuzIcYHp9
 BSnAMk6azyMep/s5OxERYZqjBcdswCiPnkdxOa4VrWbp1si8yX3Xb/b3HwmwzxdH2pSLyycH3MM/N
 7QBRJfllhMLTmKV18RkqXVW0rA7km9RpCnZc4n/pb1VtKlrg61Qcru00KxRDaYG4QxMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CsOrD6RccmXcmvSNUP2aWZDRJP25W6EDJHGI6Pg7wu8=; b=MsazEk7RdM4pkczi9N2DA12C8G
 ztODf0DvuerW2UHSnmYxzpOcvG8wtfWHr5SIT4TvZJ9Fy7jJf7EIZ5UjP52VYF3PeWZFleCAK6AEA
 w2ENJv1Po97E2dJN3n6goArv9N3Hb3GKwLIGKYwopTRRNp7caY7lSAotQdSWimqpexN4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uITRf-0002jZ-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 14:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748010737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CsOrD6RccmXcmvSNUP2aWZDRJP25W6EDJHGI6Pg7wu8=;
 b=OoxpfPeIrioM2IMPnlUlR+s0BzqzrqjnRKOenbR671+HmgMIgi9RZtoYfVH9lMypdpza6v
 EnVh4n7uFiWTyJjvD213rfBwGqvj/CV2lfaA9batpFYSYnPJnzBINjbXYE+OYidk+SinY7
 oNR9fpfmpW77rdycWtpKWHdXUsv16Co=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-YRm2LBC0PdaoU0_wMqXfRQ-1; Fri, 23 May 2025 10:32:16 -0400
X-MC-Unique: YRm2LBC0PdaoU0_wMqXfRQ-1
X-Mimecast-MFC-AGG-ID: YRm2LBC0PdaoU0_wMqXfRQ_1748010735
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b26cdc70befso6077316a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 May 2025 07:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748010735; x=1748615535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CsOrD6RccmXcmvSNUP2aWZDRJP25W6EDJHGI6Pg7wu8=;
 b=UEzjeMrB3wTDqtj+OCmuorUnpFZA68f4p2SfAign7xqiYekqr6RzgGdUgMJuPjMiUV
 cmmkWZAwUf5DpkQ9G2v+tnnkyuV6NWQxMxnE2gibXCJH62Ny2972jVd4d7BrsX4KuMGK
 l6u4mwvTyNsapXHxLHRfC/AkI7nYm7ixt5Z9LIq17t1dVjCr/N7zeJDZog/LYKdqVjuG
 g7O+qtO5vfMr4QytUJCw+saMr0rFN0LAPcK+dOexLl8C+/dVJja1cC7ONmpjptXN/Rml
 sGZhN5BBps3RjCFlUs9M9NcpWtKQEpaQ5UM76aXdbI/++QXTjPOXg5o8bLtU6YEQ9OrP
 1Zxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU0d2WSPi08mvIDBNMqn02HVm9QyK3FEFfrFREDM77brvcJGJseSA4kZM4pAHq3UQpNlegu/a+5mplENq2EYmM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxGzen9sfJKm8A3tFiNYojqR0LYGMHlr1IcIs/86PGfw4IYPWti
 MjFuPr7KzSVhcRlPQ1Yv7+ynhM4X0oxyE4ecPSeo0Cg9gLqsjw6eHiSdVEsn5Ayj/tF8xQ557EE
 X0MGC5OAS7onr9M11DCPv8AXkG1ebUSg/rWD/noPQfEpXEniR+tIQzl6duzu0lo399rI1+KXUMo
 YW0Cg=
X-Gm-Gg: ASbGncuCXe6SlrVKJ57Z55YqCvlne+yWBRuPiHmhPReGcvbSi0VX4804kDmK3nQRyhA
 FtqScWdP8wiDIVW/SsNHGgy2yq7WYxmOWV4QaSa3lqhniH7SFH1SeTIrBOh9freX7LZb94M0R1a
 O9qbLbo5bzRoNX1i9cdq0XTn33beVLY78RclW+6uTNFSrKYM5ZDMl+mprIdsyDjpQ+tfC/k3crx
 SsbGpyeZ4xdODrAEv2nFJsPqDiQkXjtVXOScNFWmPV/+USDMVxfnR0m91j+0PxmQBN9CfAOxZwL
 YojCAShU2riYWMH4uUjtXu5L5qpb5ouJR0I5DcPGC0AQ0GWloz5C
X-Received: by 2002:a05:6a21:3a88:b0:1fe:5921:44f2 with SMTP id
 adf61e73a8af0-2187a1e9a59mr4126331637.20.1748010735247; 
 Fri, 23 May 2025 07:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERLFBCTWvy4eb9i8rksVbHGn7Ov3OtaO4PtznXFR9FSNiLkX8sQ5gs6+g8xhWnVirotFdSFw==
X-Received: by 2002:a05:6a21:3a88:b0:1fe:5921:44f2 with SMTP id
 adf61e73a8af0-2187a1e9a59mr4126293637.20.1748010734863; 
 Fri, 23 May 2025 07:32:14 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970b7b0sm13271884b3a.51.2025.05.23.07.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 07:32:14 -0700 (PDT)
Date: Fri, 23 May 2025 22:32:10 +0800
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <20250523143210.zxrj3prdqbtizwou@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250522075706.1604641-1-guochunhai@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20250522075706.1604641-1-guochunhai@vivo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o1FdXL1DL_o-ZAakqG3mKAALcDdUktZDcgwwHmjcs9o_1748010735
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 22, 2025 at 01:57:06AM -0600, Chunhai Guo wrote:
 > This is a regression test case to verify whether the CP_TRIMMED_FLAG is
 > properly set after performing the following steps: > 1. mount t [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uITRf-0002jZ-W5
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/014: test for missing 'trimmed' flag
 issue
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
Cc: jaegeuk@kernel.org, zlang@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 22, 2025 at 01:57:06AM -0600, Chunhai Guo wrote:
> This is a regression test case to verify whether the CP_TRIMMED_FLAG is
> properly set after performing the following steps:
> 1. mount the f2fs filesystem
> 2. create a file, write data to it, then delete the file
> 3. unmount the filesystem
> 4. verify that the 'trimmed' flag is set in the checkpoint state
> 
> We should apply the commit ("f2fs: fix missing discard for active
> segments") to resolve the issue where the 'trimmed' flag is missing.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---

This test case looks good to me, just a few picky review points as below:

> v2:
>   - Skip this test case if discard is not supported.
>   - Renumber this test case from 012 to 014.
> v1:
>   https://lore.kernel.org/linux-f2fs-devel/20250521064952.1373690-1-guochunhai@vivo.com/
> ---
>  tests/f2fs/014     | 41 +++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/014.out |  2 ++
>  2 files changed, 43 insertions(+)
>  create mode 100755 tests/f2fs/014
>  create mode 100644 tests/f2fs/014.out
> 
> diff --git a/tests/f2fs/014 b/tests/f2fs/014
> new file mode 100755
> index 000000000000..f72d53e65292
> --- /dev/null
> +++ b/tests/f2fs/014
> @@ -0,0 +1,41 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Guo Chunhai.  All Rights Reserved.

You're using a enterprise mail address -- @vivo.com, so I'm just wondering
your the Copyright should be yourself or your company?

> +#
> +# FS QA Test No. f2fs/014
> +#
> +# This is a regression test case to verify whether the CP_TRIMMED_FLAG is
> +# properly set after performing the following steps:
> +# 1. mount the f2fs filesystem
> +# 2. create a file, write data to it, then delete the file
> +# 3. unmount the filesystem
> +# 4. verify that the 'trimmed' flag is set in the checkpoint state
> +# We should apply the commit ("f2fs: fix missing discard for active
> +# segments") to resolve the issue where the 'trimmed' flag is missing.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick

Do we need to add this case to "trim" test group, as you always metion
"trimmed" in comment :)

> +
> +_fixed_by_kernel_commit 21263d035ff2 \
> +	"f2fs: fix missing discard for active segments"
> +
> +_require_scratch
> +_require_xfs_io_command "pwrite"

This line isn't wrong, but I think you can save this line, due to the "pwrite"
is always there.

Others look good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +_require_command "$DUMP_F2FS_PROG" dump.f2fs
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount >> $seqres.full
> +
> +_require_batched_discard $SCRATCH_MNT
> +
> +foo=$SCRATCH_MNT/foo
> +$XFS_IO_PROG -c "pwrite 0 1m" -c "fsync" -f $foo >> $seqres.full
> +sync
> +
> +rm $foo
> +_scratch_unmount >> $seqres.full 2>&1
> +
> +$DUMP_F2FS_PROG $SCRATCH_DEV | grep "checkpoint state" | grep -o trimmed
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/014.out b/tests/f2fs/014.out
> new file mode 100644
> index 000000000000..cb0c9447d675
> --- /dev/null
> +++ b/tests/f2fs/014.out
> @@ -0,0 +1,2 @@
> +QA output created by 014
> +trimmed
> -- 
> 2.34.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
