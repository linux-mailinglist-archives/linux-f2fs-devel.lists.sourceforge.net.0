Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jRlhDXpXMWr8hAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 16:02:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62096690314
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 16:02:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=FAySzw6V;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=EAu4E8q9;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=eUM47msd;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=a0UeREWb;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyeNm2PmKqF43lpt+solgwIxUK5O06QyS0mXLYigeBA=; b=FAySzw6V+tf/S/ko8xDwX89ip2
	wQTXLYMDp4oFi6l3vFQLh+4Qo8OXcL1Drp6NaX/j7HuaFRSVeIJT0LWdnX/lcMyboSf4DfR5H9s1Q
	dFxIPWINQlBCld5Omv5OY/PS7RWWArZmk08rYf9ATIdaYIk4OglXY4G5nH00kjW5Znp8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZUN4-0003gl-2J;
	Tue, 16 Jun 2026 14:02:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1wZUMa-0003g7-AG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 14:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3oxfE3q9MoqMDp6eTZNp1mvXS1FGownvmpW6tScf/Q=; b=EAu4E8q9iIsGNO/Y/5KNtwGWB4
 xsCN3ktPC/TuMmswg1InbzY4PRC54fhtDJf6HBc4CMxWmqRH8rKIAIO5qUNTB7Y3NGfC+TMY9Xbvn
 vgypnx++T+M+LB/5w7of0nCNEaA7kJgIf9LC+3eLv74Vzmyoxzq4Cft0+7D4fs4dCUhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j3oxfE3q9MoqMDp6eTZNp1mvXS1FGownvmpW6tScf/Q=; b=eUM47msdlTxQCn4D0wbnQq3pqg
 0AVLfMLMqvooONW+pNeq5MTLHN+GKKuJAcdUBCckpMToh6ZYtolF098h/95GEMNZnY3iX/vPfp/w2
 yy8vsq4edViOTNy2mx2dNbuZ7G2yrtEBytXEnLcRsT3HMb1OgD/DTSYF0PqsnFQzcPdg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZUMT-0002yM-5s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 14:01:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C8F12600B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 14:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9ED1F000E9;
 Tue, 16 Jun 2026 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781618492;
 bh=j3oxfE3q9MoqMDp6eTZNp1mvXS1FGownvmpW6tScf/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=a0UeREWbzesChtoxiPmxgrq/0X1EVpXDZKIosy/kE1FOW1vWi7K0BNuFh+o2yPTgN
 hYh5xQQ1Omn3utKg2py3kpR7mMhsp0zQQn3H46xqCQmkXiRbgNW84qmU4Q0ryxtTmy
 xdl+FEff70x8x+JTp+LEsI+yukcqTbn29WkjvvJxnwTjEBMbat9X8193x4Y5lubezf
 eTZdL2YP2+xVJ1ibf/U/FGEWwAFfv3cWf2QxVTzSg/TGkNFkEy+g2ahRNcYyIEwF/N
 kk5wm9KTUcv3+EVULD/XRmhu4Zm9kinuqkFRgyl7cUKqaeN72oVVWiK49hq3jDnsOe
 4EGSawzMpXYmA==
Date: Tue, 16 Jun 2026 22:01:26 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <ajFW6e_zutXtSKwL@zlang-mailbox>
Mail-Followup-To: Chao Yu <chao@kernel.org>, fstests@vger.kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20260616073526.2967012-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616073526.2967012-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 16, 2026 at 07:35:26AM +0000, Chao Yu wrote: >
 Without commit 520760b9f915 ("f2fs: optimize representative type determination
 > in GC"), f2fs GC will report inconsistent segment type in la [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZUMT-0002yM-5s
Subject: Re: [f2fs-dev] [PATCH v4] f2fs/025: test to do sanity check section
 type correctly in f2fs GC
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
Reply-To: Zorro Lang <zlang@kernel.org>
Cc: jaegeuk@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[zlang@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,zlang-mailbox:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62096690314

On Tue, Jun 16, 2026 at 07:35:26AM +0000, Chao Yu wrote:
> Without commit 520760b9f915 ("f2fs: optimize representative type determination
> in GC"), f2fs GC will report inconsistent segment type in large section issue,
> and then it will force to shutdown filesystem.
> 
> [  768.190903] F2FS-fs (loop51): Inconsistent segment (3) type [1, 0] in SIT and SSA
> 
> The reason is f2fs kernel will assume all segment type inside large section is
> the same, during GC it loads type from one segment and compare it to other
> segments' type, however due to recovery flow, the chosen segment may has zero
> valid blocks w/ different segment type, since the segment is invalid(free) one,
> it will never be migrated, so that we should not treat such state as abnormal
> condition.
> 
> This testcase is created to simulate above condition to see whether f2fs kernel
> module can handle it correctly
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v4:
> - add missing "_require_fs_sysfs_attr $TEST_DEV gc_urgent"

Thanks for updating, this version is good to me :)

Reviewed-by: Zorro Lang <zlang@kernel.org>

>  tests/f2fs/025     | 82 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/025.out |  2 ++
>  2 files changed, 84 insertions(+)
>  create mode 100755 tests/f2fs/025
>  create mode 100644 tests/f2fs/025.out
> 
> diff --git a/tests/f2fs/025 b/tests/f2fs/025
> new file mode 100755
> index 000000000..807f18f23
> --- /dev/null
> +++ b/tests/f2fs/025
> @@ -0,0 +1,82 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2026 Chao Yu <chao@kernel.org>
> +#
> +# FS QA Test No. f2fs/025
> +#
> +# Check whether f2fs will encounter cp_error (Inconsistent segment type)
> +# when doing sanity check on type of segments inside large section during
> +# garbage collection.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +_fixed_by_kernel_commit 520760b9f915 \
> +	"f2fs: optimize representative type determination in GC"
> +
> +. ./common/filter
> +
> +_require_scratch
> +_require_scratch_shutdown
> +_require_xfs_io_command "pwrite"
> +_require_xfs_io_command "truncate"
> +_require_command "$F2FS_IO_PROG" f2fs_io
> +_require_fs_sysfs_attr $TEST_DEV gc_urgent
> +_require_check_dmesg
> +
> +# Clear options to avoid interference from external configurations
> +export MKFS_OPTIONS=""
> +export MOUNT_OPTIONS=""
> +
> +# Format with 96MB size and 2 segments per section
> +_scratch_mkfs_sized $((96 * 1024 * 1024)) "" "-s 2" >> $seqres.full 2>&1
> +
> +# Mount with mode=lfs
> +_scratch_mount -o mode=lfs
> +
> +# Create files to fill whole filesystem, then segment type will be changed to node type
> +for ((i=0;i<5120;i++)) do
> +	touch $SCRATCH_MNT/$i >> $seqres.full 2>&1
> +done
> +sync
> +
> +# Remove all files to create free(empty) node segments
> +rm -f $SCRATCH_MNT/*
> +sync
> +
> +# Allocate free space so that we have chance to reuse free(empty) node segments
> +$XFS_IO_PROG -f -c "pwrite -b 4k 0 1928k" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +sync
> +
> +$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -d -c "pwrite -b 4k 0 16M" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -d -c "pwrite -b 4k 0 16M" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +sync
> +
> +$XFS_IO_PROG -d -c "pwrite -b 4k 0 8M" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -d -c "pwrite -b 4k 0 32K" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +$XFS_IO_PROG -d -c "pwrite -b 4k 0 2M" -c "fsync" $SCRATCH_MNT/file >> $seqres.full 2>&1
> +
> +# Shutdown the filesystem without checkpoint
> +_scratch_shutdown
> +
> +_scratch_unmount
> +
> +_scratch_mount -o mode=lfs
> +
> +# Run urgent_gc mode to trigger garbage collection
> +dev_name=$(_short_dev $SCRATCH_DEV)
> +$F2FS_IO_PROG gc_urgent $dev_name run 5 >> $seqres.full
> +
> +_scratch_unmount
> +
> +# Check whether the dmesg has the warning indicating the bug
> +_check_dmesg_for "F2FS-fs \($dev_name\): Inconsistent segment" && \
> +	_fail "F2FS-fs ($dev_name): Inconsistent segment type detected in dmesg!"
> +
> +echo "Silence is golden"
> +_exit 0
> diff --git a/tests/f2fs/025.out b/tests/f2fs/025.out
> new file mode 100644
> index 000000000..3d70951ef
> --- /dev/null
> +++ b/tests/f2fs/025.out
> @@ -0,0 +1,2 @@
> +QA output created by 025
> +Silence is golden
> -- 
> 2.49.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
