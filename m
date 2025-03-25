Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC7A6ED87
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 11:26:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tx1U3-0005Uz-Hs;
	Tue, 25 Mar 2025 10:26:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1tx1U2-0005Us-Gs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 10:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PuWY4FxnO4+NOwwcfeuO+0rdzoMVdvrsuUW0ofjodWo=; b=IFmwo4JqJAeKe76d6laDxr+TF0
 McuTYtjWqbDS8zFWjuB+z2DwL2pijYh7zSQC7002rMZFKZk3PeT+VrRO7PMw2LvFZoDmp9ppWU7yc
 3lduwnCa/Qka5uI6gP2uFIC4Y8LI6xffy3kW5dDJUwS3E7t7N61Gma9abLJBhK14CBEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PuWY4FxnO4+NOwwcfeuO+0rdzoMVdvrsuUW0ofjodWo=; b=FGw3tef0V9R/E7poO0sEP9vJSY
 ck+/BOyCuRR+uzLE1BKTuYu42fEBXHZRdGoA8B2EnaLu6wjtliHyodM/HVQRm4q7aXyRBC3SjG/aF
 /Muj5SBIdKaxTJpCo5NUtidNh5LgKXuSx6nn96i4w4eVbaE9JcOsoqq/o7FOY9DrySgg=;
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tx1To-0006aQ-5Z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 10:26:10 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-2c7f876b320so715515fac.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1742898345; x=1743503145;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PuWY4FxnO4+NOwwcfeuO+0rdzoMVdvrsuUW0ofjodWo=;
 b=YZxp4D4xmB8gutNB1l3aSTGh2YhJJchGtdvo/0tvtx6CCKVTf0mFTuSe3OyQr15FpZ
 Mz+mlH88JnTHYkMdz2jXMToP1olKxI6cDYNmsdGbiBbXGj4iGijvwfRHiCtuBYv/8Xn9
 sJNsP2n0AllUKXQpafxIOrpqg9sYE5fYAODPUFKmnnDU+fm7peAYKs2w+mZ71ucubAiK
 aWFpLbx8eIT3DkqzXk1O5Wj+nueN4dkqSl/yjem3U0lv9DV8g8B8mP0bPt4NnFnP8ng8
 mEAJMoNTXSssB5Cr940iUwmbwSSGq5HJ/JzngXMOi3GszbGUZ/so5WksCV0gbHgHLFPe
 t1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742898345; x=1743503145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PuWY4FxnO4+NOwwcfeuO+0rdzoMVdvrsuUW0ofjodWo=;
 b=ESxqcUeGVCTHDDXiljNOQkhmrOzjqQpd3mfkIGiGCsMvKaUVovjqZmZd7BQufRw4Kp
 GcqdxnqhLocmejfOGrnmbL9rjCuUUpJH4WKBX+ZdygMRBxmC1JTvAl7rUYSjOy9BJxSo
 8bW3X9vfuJYdianCYpnO8N4NomCuD3gBy9XhCr85sdISBjwos0B155zIIPmCkVSBQqAB
 V2omwOL4P5n0cIRK8mCWGo8n5aF5EPmOrEZFX9jWh/+W/n5SPpxgdDL9z4/DWjR7xy4A
 ZUqU/019MtGwu3JjgAzbC76w3ZVb1DY6BMxt2l+/x3jUQQex96eee5t75MgzCWuee8dM
 JW+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW20l/dlutH4vgZNiuWEyxIh3+UUeT7PzEOB3t+OfJfIOVsNlZ05fY1/rzDAOcbsWa5DBYiqNunK0evwx1LJL8v@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy5DTIlwzlH+Tdq89PCmV4DkNSv/pD0HZnZeBJeHAZQSHr4dPh6
 EGzeyvWPG/HKhnecOsKeo8osCcPNVmZhoTayDvFjUXQvEsmdAk/F9tl6fji7AGmENax6B0YnZCJ
 n
X-Gm-Gg: ASbGncvK+mxQByjQYN3Ea2KnwaXZtRZI6G/+hYZDzLf7v+YiONLPE3NMovN2ZlsEY+M
 waKw8Es0bh9Z2ZbiKgFkTecw1nU0mwfWKONqHJD+F+M5wfjR9G8MWyT9sX+zyVyn87EUxiIBzkE
 B8M1VEuQryXrcZI/5R9Ow0BD0gaRUHwZSvOQgyubSYhQtNhSIrflc8Y4WcpKBrZb9zPjeKRl040
 4SOUnxEiGipkqcorP+b8CEcdCQRA5a2WAq5zMPBCfQkw/d27S4I8UzduHCsADZ2+L3+GqjafiNq
 iysqscZZsZU+Gs7+nca+gt8HtJF66YB1WdWy1GnXpTaSiJkjag3shGdD1O4andGn1GsMdwOW7aA
 Km1et+WEkBn1ujMvolzBs
X-Google-Smtp-Source: AGHT+IE7mretUNcH2qauevhGMcyv2ME+bUwpr7TkZvXTiCQuz3MoKuqVjSbqXqiXrp10chHoDpNk5Q==
X-Received: by 2002:a05:6a20:914e:b0:1f5:862b:a583 with SMTP id
 adf61e73a8af0-1fe4342cc3emr34821170637.34.1742894130098; 
 Tue, 25 Mar 2025 02:15:30 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-36-239.pa.vic.optusnet.com.au.
 [49.186.36.239]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7390600a75asm9575168b3a.84.2025.03.25.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 02:15:29 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
 (envelope-from <david@fromorbit.com>) id 1tx0Na-0000000033c-36Np;
 Tue, 25 Mar 2025 20:15:26 +1100
Date: Tue, 25 Mar 2025 20:15:26 +1100
To: Chao Yu <chao@kernel.org>
Message-ID: <Z-J0LnCEWX2bo9LF@dread.disaster.area>
References: <20250312072309.3989074-1-chao@kernel.org>
 <20250312072309.3989074-6-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250312072309.3989074-6-chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 12, 2025 at 03:23:09PM +0800, Chao Yu wrote: >
 This is a regression test to check whether fsck can handle corrupted > nlinks
 correctly, it uses inject.f2fs to inject nlinks w/ wrong value, [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.53 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.53 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.53 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tx1To-0006aQ-5Z
Subject: Re: [f2fs-dev] [PATCH v4 6/6] f2fs/009: detect and repair nlink
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

On Wed, Mar 12, 2025 at 03:23:09PM +0800, Chao Yu wrote:
> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v4:
> - remove unnecessary "_require_command fsck.f2fs"
> - clean up _fixed_by_git_commit line
> - fix to clean all tmp files in _cleanup
>  tests/f2fs/009     | 147 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  2 files changed, 149 insertions(+)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> new file mode 100755
> index 00000000..9120d8a5
> --- /dev/null
> +++ b/tests/f2fs/009
> @@ -0,0 +1,147 @@
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
> +
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
> +for ((i=0;i<14;i++)) do
> +	echo "round: " $i >> $seqres.full
> +
> +	_scratch_mkfs >> $seqres.full
> +	_scratch_mount
> +
> +	if [ $i == 0 ]; then
> +		touch $filename
> +		ino=`stat -c '%i' $filename`
> +		nlink=0
> +	elif [ $i == 1 ]; then
.....

Ok, it works, but it's a bit nasty. You want to run the same
injection and checking on all types of inodes, so factor that out
like so:

inject_and_check()
{
	local nlink=$1
	local ino=`stat -c '%i' $filename`

	echo "ino:"$ino >> $seqres.full
	echo "nlink:"$nlink >> $seqres.full

	_scratch_unmount

	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV \
		>> $seqres.full || _fail "fail to inject"

	_check_scratch_fs >> $seqres.full 2>&1 && _fail "can't find corruption"
	_repair_scratch_fs >> $seqres.full
	_check_scratch_fs >> $seqres.full 2>&1 || _fail "fsck can't fix corruption"

	_scratch_mount
	_scratch_unmount

	_scratch_mkfs >> $seqres.full
	_scratch_mount
}

And now most of the test cases become this:

_scratch_mkfs >> $seqres.full
_scratch_mount

touch $filename
inject_and_check 0

mkdir $filename
inject_and_check 1

mknod $filename c 9 0
inject_and_check 0

mknod $filename b 8 0
inject_and_check 0

.....

The whacky cases with socket and orphan inodes can be handled
by factoring inject_and_check so there's a second function that
takes both ino and nlink as parameters.

This gets rid of all the unnecessary if/elif logic and looping, 
leaving only the test code that does the work behind.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
