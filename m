Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED1A70D95
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 00:21:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txDZk-0004rj-Ib;
	Tue, 25 Mar 2025 23:20:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1txDZi-0004rc-9o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 23:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xN1R4jttMHrmK3BdJr5+xjDCnhrufGspgu+PHeQu2dQ=; b=KjHBIKx/w4m2mBq8uy0h11mHA5
 YlFED/aYiM4gB7t6nnl2FZTri9guLWrXTsAlWbvss5cADqvwg7OPhi8LK/rdw1kjhKXgJqa5FPD1I
 1JxiA1HOcT5lOZJ+tS/hVqmtSV4Qxafc5uY5Qliwq9jl8sZD+wuMVWgd5Qg+n1HeGTVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xN1R4jttMHrmK3BdJr5+xjDCnhrufGspgu+PHeQu2dQ=; b=bxE4C+FjtM3Wty8z1GliYVyEOX
 m0VeVygHy6aRmQ+125Vi4nMzR59oU5naLl2kAJtFIVniu8IJNwsWCOFZpUAHZRSHucQoP5k/2xJIE
 fUt5EJOLyzGkpNHSqFO4FiRAA9TX+19eMYGA3VtBA1ULycpCoM6elFJ93dCZm89iBAho=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txDZX-0004j4-EA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 23:20:50 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-223fb0f619dso126926435ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 16:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1742944834; x=1743549634;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xN1R4jttMHrmK3BdJr5+xjDCnhrufGspgu+PHeQu2dQ=;
 b=Cn+qGLBzReveJsQN3O4ZkNwU7zvWW/jdr32raKehYgLIZWPZtWBOTkJbaxpzeVhAHY
 s1iR9fdiWP+fbOHd7/E6QVLj1IZTvUV6t49sawlTKcxQzbzxznjzeAGHXATWK9yQAATT
 bT63VSd2PSw7z0N9TIucVXtqy8jYU1LJ0MlKMwBfMiuknfHkyqMV5UI02WbFG9hPD9OG
 DHsIuQDIAbXUY6cRZTw13/wiVJgvoQTjCwa9OdOH4q9GK3pOCCPBtMUb8tSfIh/a39fg
 dSx2xc3IwqAAHuvz5tKSACz+gCTcf7jsyKLzd/TRh8Rq7phlQGXE7CqTA5KTHRvbkjpD
 XM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742944834; x=1743549634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xN1R4jttMHrmK3BdJr5+xjDCnhrufGspgu+PHeQu2dQ=;
 b=ZoOSSTAHzK3Z4chiBpqTy7JrFhlhHnTiO+AnRwIlm8HtNUrmWLCBX+MNf1H2GkLNDk
 x+gkLCeLkU1ECI9mDQetRWJoaVE5SREmXgo/GHOZGoPGY55SgqBB38KFomciDVP29Th1
 bSl8YPYkM6rDmED9vcbEX3AY94643oMCbThyjuARzUV9BNBvsKAHSx/WibO2jcc0pBhX
 lbgSQZj/ns1667np4pW/mobCFQqKeekOptpspTGCthcwa2y+1gQX0mQUsEmFTkJSwq9X
 5gmyOpIaYOJpv7bq6NggHvbEWk+C/sAsZRZQqzQ8SXfveCsy8o2wHRnnTE1qCzgCd4ig
 t/yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQcyqmRpwkyX3CAG2FzcOZAf314sdTKeZ3TIC7UEu8aBEb+QNlzhfqfDBM5X57wz90a1gc9iFyBl32Mo4L5pP/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxHLwL8/+3VlDJST3x8nqqwoBFGyxfkH2ItXClIw1dtHzEiv6Ck
 DJj2LpF70HrFgVsxgpPEag9WMzi9nNzswDxLsFPOkP5rmFQdoKfcJ8QBNF8nIcE=
X-Gm-Gg: ASbGncuRBcDcw4VO9AsH3oQ/RZ/E2PhfIJp5nvDMwfzBdBsiUoMV/m2sgjjY96/rCpT
 JkpBiZNt18FZagOSzlvGedCnsSR3BECZpS6zAMWFQxOFwjhxo88xlSGLOs+HDooE/GWLWvO4KFD
 1mu3Tb6fVAVDUBAK/rexOhxok/8Zh3pvXyLCb0ao4N4BQqzWtVOpgj1HTdbPmBAMHRRD9tJ5vGw
 UPJx/CY/VUQCsJgln1WnbLkds1unahjBf9/SXXyxPcgRo6AD+l/puDWJLwelNIW8HDvZqps8ozo
 Ciah8zwbKTKCIKMPcnSfvk5ghCVQe3BumyX+NvNDiHQ1qt5+COkUXuFTQ5tLLrXla9o6INvcdLs
 T6cGKYWjxbA==
X-Google-Smtp-Source: AGHT+IFPvwqH3aFp6ptKNymYWn0hEgv6uWOBsU8mhsLRdoc8XyQn/nxx7iSZSiHI8TChl/8J59OZdA==
X-Received: by 2002:a17:902:e541:b0:223:7006:4db2 with SMTP id
 d9443c01a7336-22780dbb924mr272665915ad.31.1742944833515; 
 Tue, 25 Mar 2025 16:20:33 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-36-239.pa.vic.optusnet.com.au.
 [49.186.36.239]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f50c80sm96377285ad.104.2025.03.25.16.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 16:20:32 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
 (envelope-from <david@fromorbit.com>) id 1txDZO-00000000ImA-0XSx;
 Wed, 26 Mar 2025 10:20:30 +1100
Date: Wed, 26 Mar 2025 10:20:30 +1100
To: Chao Yu <chao@kernel.org>
Message-ID: <Z-M6PkLZI2LIOlXY@dread.disaster.area>
References: <20250325125824.3367060-1-chao@kernel.org>
 <20250325125824.3367060-6-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325125824.3367060-6-chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 25, 2025 at 08:58:24PM +0800, Chao Yu wrote: >
 This is a regression test to check whether fsck can handle corrupted > nlinks
 correctly, it uses inject.f2fs to inject nlinks w/ wrong value, [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.178 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.178 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1txDZX-0004j4-EA
Subject: Re: [f2fs-dev] [PATCH v5 6/6] f2fs/009: detect and repair nlink
 corruption
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 25, 2025 at 08:58:24PM +0800, Chao Yu wrote:
> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v5:
> - clean up codes suggested by Dave.
>  tests/f2fs/009     | 141 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  2 files changed, 143 insertions(+)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> new file mode 100755
> index 00000000..864fdcfb
> --- /dev/null
> +++ b/tests/f2fs/009
> @@ -0,0 +1,141 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/009
> +#
> +# This is a regression test to check whether fsck can handle corrupted
> +# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> +# and expects fsck.f2fs can detect such corruption and do the repair.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +if [ ! -x "$(type -P socket)" ]; then
> +	_notrun "Couldn't find socket"
> +fi

Perhaps something like:

_require_command $(type -P socket) socket

would be more consistent with all the other code that checks for
installed utilities that a test requires?

> +_require_scratch
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +_fixed_by_git_commit f2fs-tools 958cd6e \
> +	"fsck.f2fs: support to repair corrupted i_links"
> +
> +filename=$SCRATCH_MNT/foo
> +hardlink=$SCRATCH_MNT/bar
> +
> +_cleanup()
> +{
> +	if [ -n "$pid" ]; then
> +		kill $pid &> /dev/null
> +		wait
> +	fi
> +	cd /
> +	rm -r -f $tmp.*
> +}
> +
> +_inject_and_check()

Single leading "_" is reserved for fstests functions, not for local
test functions.

Just call this one "inject_and_test", because that is what it does,
and call this one:

> +inject_and_check()
> +{
> +	local nlink=$1
> +	local create_hardlink=$2
> +	local ino=$3
> +
> +	if [ -z $ino ]; then
> +		ino=`stat -c '%i' $filename`
> +	fi
> +
> +	if [ $create_hardlink == 1 ]; then
> +		ln $filename $hardlink
> +	fi
> +
> +	_inject_and_check $nlink $ino
> +}

something like check_links()

Otherwise this is a good improvement.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
