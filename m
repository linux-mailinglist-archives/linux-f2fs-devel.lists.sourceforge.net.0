Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B2ACF46D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 18:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXff/bjHYSf0ezOpxp7w8n9kFoqSmYa8EvjfWM2kW6E=; b=h41AFQE5saPtSp98BeIw2SVQR3
	83m+KV9RLOwyJXvLTeNXQAg61H/X3bAVOk6tsxRFw2T5EO9ZvOVFV6AwQ/hxInkhPIcQLg+cbnQGs
	tY3i7s+IvYS7m7U3YpjM7yg89wckxKc9pPPW326wfV3fTGfcbFNUS3mBIfQvC5H1ugZg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNDYD-0002lr-29;
	Thu, 05 Jun 2025 16:34:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1uNDYC-0002lh-0r
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 16:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L9EFsPlovD9AmV+m06lmGE+qCZah4l0zduNGNlSZ4S8=; b=DI2ygEBcVZ3YwtoK05Lj81i1pg
 //P9bWT5/qMMoN8zSDIy/Eps/K9/Fjm0AUIi7ej07H2Zqj7jc3h1gjRDjBZxmhdgNUsTLCBMZ9kiC
 121QOgTJ4lD29Bg2OjXJwP0ePymkUDZwPyNVVI5uqEVrC2zMFuerjuW9rdPD5zOgG6UA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L9EFsPlovD9AmV+m06lmGE+qCZah4l0zduNGNlSZ4S8=; b=Mrv4XCAAy/d+ycl0kpTHo/qCJW
 wQ4PEzmZ/gmQBmeLlARjwhPFbbTjzrcvfJj8ueTcNDAzNnPxz+n097Amg4+BpGIxyD3xL8xvyZI7k
 qHLKvWDNb9Rfb6gvJdPOdxG5pr34J6/Gm7YhPJf+hhJWyC0BbzTUv1NXv0+WvzF6v7Yk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uNDYB-0004KQ-DW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 16:34:43 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-N_cfHFJhPoCpqm2bs-1xdg-1; Thu, 05 Jun 2025 12:34:30 -0400
X-MC-Unique: N_cfHFJhPoCpqm2bs-1xdg-1
X-Mimecast-MFC-AGG-ID: N_cfHFJhPoCpqm2bs-1xdg_1749141270
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b270145b864so773903a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Jun 2025 09:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749141270; x=1749746070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9EFsPlovD9AmV+m06lmGE+qCZah4l0zduNGNlSZ4S8=;
 b=C3pok9nZcZ1abPvl+7CgLCvaXBCBRqeCdvGJXgLTRwos8MKwKOSus+lwWPkF0Sxrzg
 5DzKyutcarjhz5OBmg9XoKlp71Gqom+K1IJIhorMx+nKl9XylSD+kUkkmprwMLmMGYpZ
 jF+WBQXHDRmKsODjVzVEo+P48c8IdzGYwIv7lEb1DL9CtvNTokJOBHtQwv8pZlLz8+Ka
 /mOlo9dAV69FY42J0hj9E7iVoP5G6V8nagm36yImYb0AAFZGvXrrfUjyVB5ZqiWT3IMW
 MlLDQ7ffz8gJuE9WjcT/RfcW6d3P5a4ZUqK2UX2ZkcTsE3JjE+34GvzrHkXayEf0xbmF
 mwJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbz9EZx2YD5kjb/jLPt97AL2cAT+15QcW04IkS7r0wTcwPufpmHJU5Y0dDBQkqGZ1fajMKK2XqSPXxlzTfk7Xu@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy6cJthvjAYhktKc9Dh0wVMEgx0dHDTpwKyqSUB39XSxRWaFWdo
 7QvOl+yfGgNhW0uSFwbWQQF8yxxQhQxSkFqSOCV8D3X6qqem//oFj1zEra7gi5T7Y/iRatDved8
 mQ2HD6l8nxWuqcAEQ9JfiZg5Bx64kX4/vFARWtHS/0rtDJC1btsZejc07Wd/TvDrQ9OeE5sRXEO
 RfZ4c=
X-Gm-Gg: ASbGncskt1tnDzljU50OY5tS3KTlvgctyTc9P5kM1dvYP4GS+v5gv9Z6oTrUkYbLqTD
 IYZTRUIeKQcwRQ2SlXaUWgbplqIyrsrur2Q97wXFXVejYo04wksgorSqvsMU/Dlvu/oC0MXLuLP
 nb+KvhQyhgfxmAzXcCah53sTfgO1I7VFPNtrQKLy1pDc+rsUnbX5tQT2bFHhwYsKPUALP8/7wqE
 phnTu4+FWI8A9Syp8QEi0I+56T1ketqzhmWRyd81g8vwxfoHcl+D31aNQMajOaaj+VcJerJFuU5
 MU4r6VaOIbUwqVWJ++EHfQ2lWFaS0Woq9gBN1DGuBib5cBC3ZVJL
X-Received: by 2002:a05:6a20:3d84:b0:1f3:418d:91b5 with SMTP id
 adf61e73a8af0-21d22b4522dmr11234648637.24.1749141269852; 
 Thu, 05 Jun 2025 09:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2oatv8Ge1bIXlSbD3ToytK8AFuY1r6ZR44zKX2LufIG7eqcpy57Qs02NR5tsfkB7qXGKA2Q==
X-Received: by 2002:a05:6a20:3d84:b0:1f3:418d:91b5 with SMTP id
 adf61e73a8af0-21d22b4522dmr11234616637.24.1749141269458; 
 Thu, 05 Jun 2025 09:34:29 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afff72bcsm13060485b3a.166.2025.06.05.09.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 09:34:29 -0700 (PDT)
Date: Fri, 6 Jun 2025 00:34:24 +0800
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <20250605163424.j3uh5knzsblo4cud@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250526080323.1851300-1-guochunhai@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20250526080323.1851300-1-guochunhai@vivo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TQ3NTd7UeDzAGqKI8qPaTivH5bG5UStfvUmM0vEAbTY_1749141270
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 26, 2025 at 02:03:23AM -0600, Chunhai Guo wrote:
 > This is a regression test case to verify whether the CP_TRIMMED_FLAG is
 > properly set after performing the following steps: > 1. mount t [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uNDYB-0004KQ-DW
Subject: Re: [f2fs-dev] [PATCH v3] f2fs/014: test for missing 'trimmed' flag
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

On Mon, May 26, 2025 at 02:03:23AM -0600, Chunhai Guo wrote:
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
> v3:
>   - change the Copyright to VIVO
>   - add this case to the "trim" test group
>   - no need to check pwrite, as it is always present

Thanks, this version is good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

> v2:
>   - Skip this test case if discard is not supported.
>   - Renumber this test case from 012 to 014.
> v1:
>   https://lore.kernel.org/linux-f2fs-devel/20250521064952.1373690-1-guochunhai@vivo.com/
> ---
>  tests/f2fs/014     | 40 ++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/014.out |  2 ++
>  2 files changed, 42 insertions(+)
>  create mode 100755 tests/f2fs/014
>  create mode 100644 tests/f2fs/014.out
> 
> diff --git a/tests/f2fs/014 b/tests/f2fs/014
> new file mode 100755
> index 000000000000..2f2e4dc360d9
> --- /dev/null
> +++ b/tests/f2fs/014
> @@ -0,0 +1,40 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 VIVO.  All Rights Reserved.
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
> +_begin_fstest auto quick trim
> +
> +_fixed_by_kernel_commit 21263d035ff2 \
> +	"f2fs: fix missing discard for active segments"
> +
> +_require_scratch
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
