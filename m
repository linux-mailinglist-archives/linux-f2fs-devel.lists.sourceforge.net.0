Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1E3B28377
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFdDQVuhv6aKM1FIb3PsI5W/9P9miww35KTbJWAWwvg=; b=BQP8R0Rsrwm+m8OjFE40FhXv1j
	9u7VXBgrObyShsGsUrCs+WB5D03MWRTmN12CA0mQgC8osJJ6Wi5Qv3WN/j1Ao0DXo+vxX7/DgwRzo
	SMho5fQYBZZ/NJEmgkztk+rYIYg3kcXusdZHbnmYRX0RaKYGF/WJbR9Tn1h7/qKMyyt0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umwst-0005SK-HX;
	Fri, 15 Aug 2025 16:02:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umwsr-0005SD-LI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x7trs0stmb5KqYgODGI7WyrTJCu0r4CTNIU7M/XCXio=; b=Kv3+PS0SVH+z1AUhOayhPudOlF
 nUPdZqAv4iPG5YP6+NMbELNZl2Jn9peEjCwzq0+HIoKKStnlQBtF4ikht34lynsBUM2hfeMr8emmY
 +OREIPHkgg9q7fOe1XpGqjPWrvDea9JEIHv6Q+Pj0e+QhGBTBWru+fueKKYJ2r6HAHQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x7trs0stmb5KqYgODGI7WyrTJCu0r4CTNIU7M/XCXio=; b=UjmbZdy/E6XC7cJxlbHOTVlNfT
 feMoPjPnyJNkL05jnjP++YXCrrdncrX0wixcOA0QMHskphjL0w4ZvzXoT/Y8Z9jL3O+XvGAKxc0eJ
 mMnaKAAw39ROyRL0A5coHtSM+R5oSrTAd7efaCRoG+lBYTTRUilB7kMXHRtHXPRbCJyY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umwsr-0007W8-6e for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755273734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7trs0stmb5KqYgODGI7WyrTJCu0r4CTNIU7M/XCXio=;
 b=GUTcIeXkA0YmRLkzMwl8QqmL3fvpV5QNGR+z4IhSDHD/081LCxNvrAsp9YP8F9q2bD+iAn
 xO2PHeNxPuzNrUaj65YYTpySbT4gHjo5sgOIm+TJZn5TPASxdvzEw9vKYcbdgUc1QvWdc+
 rlB4UchC3aXmQJnQ822CNE7+L8+LpVM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-wN25vnxBMRKQo6Qe7UP0nQ-1; Fri, 15 Aug 2025 12:02:12 -0400
X-MC-Unique: wN25vnxBMRKQo6Qe7UP0nQ-1
X-Mimecast-MFC-AGG-ID: wN25vnxBMRKQo6Qe7UP0nQ_1755273732
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458297be0so43763415ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 09:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755273731; x=1755878531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7trs0stmb5KqYgODGI7WyrTJCu0r4CTNIU7M/XCXio=;
 b=apQIpL9C8QlUhsGnDFe3ml/0nURKb0Zdird75l9KAjlRRm2623neFg2UP/S6YaDllx
 BLyWFjqr1litjQunhBMB4jIMNwACJCHov1TJIVXFh4vY4bCO+SDVWfOBVHXd6QTfFVX9
 DI0puMscJt/ZIb/L903hiBL3CPrHVty/N55qDaW6TEnOlDJHcvHFAiYlpyr0sJeI93vN
 LT2eN/SDKcsKWCNgWWoia3QWr4gEaJlRqz9AujrkKZ96WRXJ3UkN+JduOPf2nyo2xfnL
 fl2stk0Gn2ZaV13EsolMM9kOXfz82KmLin2MHuy3zieRW7w8zE4Uu1joijRXbV3H1lbo
 vNaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViXFhr17kz5/u/CSK+R/G3xq1RHST9SMZ3/O25Tflp8q1ZBBSASh1+LpHvipqT8r9uFhmMWvk8st2A8FeLwyem@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzsQYq2TXJzs4phTNUWK61XqYYChY1ohgi9naRn6txmO78cZW6P
 nklQcM5XaWT1uA7zVEX16IIbDcS/ki4zoapXv0vVeYyqjQTFq7OVjWbL5zpx4k5slZrP5R9Jo8T
 GGGXPrNW+9AQOlSgGL4Tx2UPHKhAYi80HiC0mEh0glI/RPPwQfHTAp6oT3GaVvglaHU3VzMnolm
 fneU0=
X-Gm-Gg: ASbGnctgaAtVtQvJX7kVaCfF8FobS4e+XeH9pweNw623GaMp1e0v2SrR/3Uuttdx5J3
 26q/ix0kiHhpOis2nVMdO8QH2LphscZ63B9FG0A0pXyzgdDlUf5cL6mZuTG1sb+9A59JNb1vIRq
 jhcDwjmPdfzOKNi39i959xymbrnOZLyVNmoGASTrvp+ePDxpamwgqBUZHAwmNGgFqxGG4pbt8tO
 FVc4WEUFSiCTumA8gJ/URd1WEaZ1yCyn9KqYv+Ty0F2PW5tHKeDoU7eF4aCUUwVQNpaxdix8LC6
 7U5Zy3g2jAo+a0zU4PedQfq91gtV9m3uRHWEJweiC57IfTfV1xdFpnktmq2sp6kHRq7EqRXdrBj
 LKxe2
X-Received: by 2002:a17:903:3546:b0:244:6b46:287b with SMTP id
 d9443c01a7336-2446d7a5b6fmr33199395ad.20.1755273731479; 
 Fri, 15 Aug 2025 09:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWeB8r38bxKL+3gG+wc/E7BAZULHmVH4TEvNnC6Tj8Mxi0vNbgzc0GGqMf6qiNZnTgEnLfDQ==
X-Received: by 2002:a17:903:3546:b0:244:6b46:287b with SMTP id
 d9443c01a7336-2446d7a5b6fmr33198945ad.20.1755273730935; 
 Fri, 15 Aug 2025 09:02:10 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446cae02e7sm17248085ad.39.2025.08.15.09.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 09:02:10 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:02:06 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815160206.ncfua6yvrwopk4hg@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250804114016.2734919-1-chao@kernel.org>
 <20250804114016.2734919-3-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250804114016.2734919-3-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QL5QDfQm0kWTbdwCYeBPekURSReyrqgSOtNqu2yAj2k_1755273732
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 04, 2025 at 07:40:16PM +0800, Chao Yu wrote: >
 As f2fs changes to use new mount APIs, let's add a new testcase > to check
 mount result for special mount options for zoned device > and thei [...] 
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
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umwsr-0007W8-6e
Subject: Re: [f2fs-dev] [PATCH v3 3/3] f2fs/017: test mount options for
 zoned device
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

On Mon, Aug 04, 2025 at 07:40:16PM +0800, Chao Yu wrote:
> As f2fs changes to use new mount APIs, let's add a new testcase
> to check mount result for special mount options for zoned device
> and their combinations, in order to detect any inconsistency during
> mount.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

This version is good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/017     | 40 ++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/017.out | 21 +++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100755 tests/f2fs/017
>  create mode 100644 tests/f2fs/017.out
> 
> diff --git a/tests/f2fs/017 b/tests/f2fs/017
> new file mode 100755
> index 00000000..cdf42fc8
> --- /dev/null
> +++ b/tests/f2fs/017
> @@ -0,0 +1,40 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/017
> +#
> +# This testcase tries to check stability of mount result
> +# w/ mount options for zoned device and their combination.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick mount
> +
> +_require_zoned_device "$TEST_DEV"
> +_test_unmount >> $seqres.full 2>&1
> +
> +options=(
> +#	mount_option			mkfs_option
> +	"background_gc=on"		"blkzone"		\
> +	"background_gc=off"		"blkzone"		\
> +	"background_gc=sync"		"blkzone"		\
> +	"mode=adaptive"			"blkzone"		\
> +	"mode=lfs"			"blkzone"		\
> +	"mode=fragment:segment"		"blkzone"		\
> +	"mode=fragment:block"		"blkzone"		\
> +	"discard_unit=block"		"blkzone"		\
> +	"discard_unit=segment"		"blkzone"		\
> +	"discard_unit=section"		"blkzone"		\
> +)
> +
> +for ((i=0;i<${#options[@]};i=i+2))
> +do
> +	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
> +	_test_mkfs "-m" >> $seqres.full || _fail "mkfs failed"
> +	_test_mount "-o ${options[$i]}" >> $seqres.full 2>&1
> +	echo $?
> +	_test_unmount >> $seqres.full 2>&1
> +done
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/017.out b/tests/f2fs/017.out
> new file mode 100644
> index 00000000..c260e0b1
> --- /dev/null
> +++ b/tests/f2fs/017.out
> @@ -0,0 +1,21 @@
> +QA output created by 017
> +Option#0: background_gc=on : blkzone
> +0
> +Option#2: background_gc=off : blkzone
> +32
> +Option#4: background_gc=sync : blkzone
> +0
> +Option#6: mode=adaptive : blkzone
> +32
> +Option#8: mode=lfs : blkzone
> +0
> +Option#10: mode=fragment:segment : blkzone
> +32
> +Option#12: mode=fragment:block : blkzone
> +32
> +Option#14: discard_unit=block : blkzone
> +0
> +Option#16: discard_unit=segment : blkzone
> +0
> +Option#18: discard_unit=section : blkzone
> +0
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
