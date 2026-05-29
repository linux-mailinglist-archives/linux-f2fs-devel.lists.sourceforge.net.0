Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHBnF88YGWoMqQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 06:40:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDB5FD0E5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 06:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G/19brvXPkmANHAuWqveBZCYIVRdOnWePTwFixrBps=; b=UFCxokTRDtaHuNXl3EXtmefHhU
	B84SvNr8kCIr/or0ZqkVVdGWeZ7YBI4GUtymk/PISwPqzW/+v4qBZfhCfxOZ1iIqxLlFQdhISY+WJ
	8Zh9W2AAvO4MAQ4eSkmXqOZ69tOK7+GR/1Jaj66uVUllBey8RAPpYVhIY2GeBEP5vsHM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSp1S-0002tn-2A;
	Fri, 29 May 2026 04:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wSp0u-0002tI-9y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 04:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8W0wLWUEVCd1iMnz4p4LRMZLuTVASNeXNrW/n7LnqKA=; b=B5+N91mOSKolUV9HxIcCoKuhfv
 tX/JfhvwPgYp2Y2pmMlgQsV57SLY0prQyhRPp1FxY1m+LE943lHX9DWomTHifZZrCJXJd0rxFUMtb
 aPBqPMi18/f/QuN+ROO4Nkue8b+fGwHMXp3f2Pua0sOAK/Uvyr5RNe717CAcH571eUXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8W0wLWUEVCd1iMnz4p4LRMZLuTVASNeXNrW/n7LnqKA=; b=IRM/JXGdEQjrydnNiYKtwluuhf
 08UMiWT9SWZBVJ6n/DstlgngBD+Fy8YAhx2Ouy1XopD85RNO1l6TIDC77qlTpgmX67CihNkKdP0w0
 8gv4qZnCdGUl2uZ7WfjkLa418EVbuzrSr/R4fOsOqDcY1e26SGFHGLxomv8lfjSnmegY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSp0r-00005z-DG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 04:40:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id 2F1D660213;
 Fri, 29 May 2026 04:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C44AD1F00893;
 Fri, 29 May 2026 04:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780029595;
 bh=8W0wLWUEVCd1iMnz4p4LRMZLuTVASNeXNrW/n7LnqKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OZ+hKT45oS1XCcQ318yI/N+b3pMC41KzsYRP8If9zg+AMzclXSDd1tVLyxgsUjzso
 XlAd11dr6PzJsYf76l6W92SjuLhFlVoP22/IzyBG30Gveo76GuAOhRQQsWelcWngP+
 PvLhjJ4JvHB1iOIjsSvMBxm+ufsBHWYiGJJ3Zq46oTUOV+DeyAZCWEtqGUwoiL+Cxn
 poHbidH2TBQS2xbKHW5IITtdWxRwDW/zdPT2zVlvFr8vNWxwuNRcNN8tbA+Lnb4Sh+
 D/adQOiWgU9NpphKHRfU6xfvix8X1JbJ4EeUx1A9QstnEbUSHcRXtEK6UiuhpeHkDn
 AG4dkB7qPJJOw==
Date: Thu, 28 May 2026 21:39:55 -0700
To: Anand Jain <asj@kernel.org>
Message-ID: <20260529043955.GG6070@frogsfrogsfrogs>
References: <cover.1779939330.git.asj@kernel.org>
 <e029755044a32de6ec2a0d3391f3ff0089fc3c30.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e029755044a32de6ec2a0d3391f3ff0089fc3c30.1779939330.git.asj@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 28, 2026 at 12:05:37PM +0800, Anand Jain wrote:
 > Verify that the cloned filesystem provides an f_fsid that is persistent
 > across mount cycles, yet unique from the original filesystem's f [...] 
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
X-Headers-End: 1wSp0r-00005z-DG
Subject: Re: [f2fs-dev] [PATCH v6 06/11] fstests: verify f_fsid for cloned
 filesystems
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:asj@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 9DCDB5FD0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 12:05:37PM +0800, Anand Jain wrote:
> Verify that the cloned filesystem provides an f_fsid that is persistent
> across mount cycles, yet unique from the original filesystem's f_fsid.

Might want to add that last part to the test description itself, because
otherwise I don't know what 'verify' means.

> Signed-off-by: Anand Jain <asj@kernel.org>
> ---
>  tests/generic/802     | 67 +++++++++++++++++++++++++++++++++++++++++++
>  tests/generic/802.out |  7 +++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 tests/generic/802
>  create mode 100644 tests/generic/802.out
> 
> diff --git a/tests/generic/802 b/tests/generic/802
> new file mode 100644
> index 000000000000..653e74e11b53
> --- /dev/null
> +++ b/tests/generic/802
> @@ -0,0 +1,67 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2026 Anand Jain <asj@kernel.org>.  All Rights Reserved.
> +#
> +# FS QA Test 802
> +# Verify f_fsid and s_uuid of cloned filesystems across mount cycle.
> +
> +. ./common/preamble
> +
> +_begin_fstest auto quick mount clone
> +
> +_require_test
> +_require_block_device $TEST_DEV
> +_require_loop
> +
> +[ "$FSTYP" = "btrfs" ] && _fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"btrfs: use on-disk uuid for s_uuid in temp_fsid mounts"
> +[ "$FSTYP" = "btrfs" ] && _fixed_by_kernel_commit xxxxxxxxxxxx \
> +	"btrfs: derive f_fsid from on-disk fsuuid and dev_t"

_fixed_by_fs_commit?

> +
> +_cleanup()
> +{
> +	cd /
> +	rm -r -f $tmp.*
> +	umount $mnt1 $mnt2 2>/dev/null
> +	_loop_image_destroy "${devs[@]}" 2> /dev/null
> +}
> +
> +# Setup base loop device and its clone
> +devs=()
> +_loop_image_create_clone devs
> +mkdir -p $TEST_DIR/$seq
> +mnt1=$TEST_DIR/$seq/mnt1
> +mnt2=$TEST_DIR/$seq/mnt2
> +mkdir -p $mnt1
> +mkdir -p $mnt2
> +
> +# Mount both filesystems simultaneously using mandatory clone mount options
> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
> +						_fail "Failed to mount dev1"
> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
> +						_fail "Failed to mount dev2"
> +
> +# Capture baseline filesystem IDs for comparison
> +fsid_scratch=$(stat -f -c "%i" $mnt1)
> +fsid_clone=$(stat -f -c "%i" $mnt2)
> +
> +echo "**** fsid initially ****"
> +echo $fsid_scratch | sed -e "s/$fsid_scratch/FSID_SCRATCH/g"
> +echo $fsid_clone | sed -e "s/$fsid_clone/FSID_CLONE/g"

Why echo only to sed?

--D

> +
> +# Verify that the fsids remain stable after a mount cycle, even when the
> +# mount order is reversed.
> +echo "**** fsid after mount cycle ****"
> +_unmount $mnt1
> +_unmount $mnt2
> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
> +						_fail "Failed to mount dev2"
> +_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
> +						_fail "Failed to mount dev1"
> +
> +# Compare post mount-cycle values against the baseline
> +stat -f -c "%i" $mnt1 | sed -e "s/$fsid_scratch/FSID_SCRATCH/g"
> +stat -f -c "%i" $mnt2 | sed -e "s/$fsid_clone/FSID_CLONE/g"
> +
> +status=0
> +exit
> diff --git a/tests/generic/802.out b/tests/generic/802.out
> new file mode 100644
> index 000000000000..d1e008f122bb
> --- /dev/null
> +++ b/tests/generic/802.out
> @@ -0,0 +1,7 @@
> +QA output created by 802
> +**** fsid initially ****
> +FSID_SCRATCH
> +FSID_CLONE
> +**** fsid after mount cycle ****
> +FSID_SCRATCH
> +FSID_CLONE
> -- 
> 2.43.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
