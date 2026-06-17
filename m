Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvFvGTGDMmoL1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F5698FE8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=NQFqHP5X;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=JKOup1AW;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=DgRouyaT;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ijL21kDe;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhqcGAEItNa2JMvfHeTaIk1Ihp+lhlWBZ+2pKvYx0C4=; b=NQFqHP5XupviRtO2qlkKCUVdlv
	Eh/dhyoUsbzm89W8eZpdRTlmevCboWemsrCDwUAlhReXPD+4k9nUVQPUGh3zc3XOhid5IBIdZ57G/
	RRbaw7YofUlCjbD/chzpPlqX9uWRotNJQ/1ArDwnC442njP3mU018voaiF76USw2Lt9U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZoKc-0008WB-Fd;
	Wed, 17 Jun 2026 11:21:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wZoKb-0008W4-80
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFzRoel95Mk0OMd9ieiVtGk8xEu55dadodVvWCnTMiA=; b=JKOup1AW0hQC3u3/8Dh9IvNKp9
 wUt5C6dS72pOq+Jz0L3rP549KZj6/9jpmmziLrkEILpqNB98MChVKEgy6HDNApI8Xi4imdV5NOQ3u
 BFFtlwjxS8+891quIOcOXgFy/GW7mTmns128g4FaiJ2J5w21yscE4je8KpJqKv0Ep7p0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VFzRoel95Mk0OMd9ieiVtGk8xEu55dadodVvWCnTMiA=; b=DgRouyaT1LSpT8jp2YSKtL19BJ
 +iqfpZArvWBPDsmrkG4J9CCYBGyQlGGpRwtAs98Jt9PHgnoaMfarijaholqYjajx7BihrPRzDGsSr
 K+Z1dk/6pIrWRtq/zUyGTcNwwMWUNsBFdRYjo/qkAoSoau0MB8WH24/2TneOUMjXu3FI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZoKY-0002Nz-1L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:21:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 42C584049F;
 Wed, 17 Jun 2026 11:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F081F00A3D;
 Wed, 17 Jun 2026 11:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781695264;
 bh=VFzRoel95Mk0OMd9ieiVtGk8xEu55dadodVvWCnTMiA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ijL21kDexzzyC6kTgJJNIMk9UZljl26RIlsr5eggHWnjRaOFAdklGIqSwuI27JNht
 ckwVbxBjO5EG1xDJf14h5z/0bvyy5qP34FvlE+ktbW0Pq8weTJr0MA4r7+xR3gN037
 7j/ppBJvPIPAbJFldLA88yvyKqlsmlv38mQifanrtjmE+/AgJQS5TwY75xH7bVJQDj
 FeGS0/cgQc5SqJuI+XU0jpamMSOj8W4Nv5dmJ9dwWxSDcvoYqg+9BLzZlsY0EvzqCp
 dtyqySQe+UC+r2cDgudo7ICdgHZLoXcIz6j6oLeMk+BJedl83EM233h7dh5DHr+pA6
 /T8PgUJpO0KdQ==
To: fstests@vger.kernel.org
Date: Wed, 17 Jun 2026 19:20:33 +0800
Message-ID: <2ac5fb22fd6b51973d11082a1ee8fe354926c63c.1781694879.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781694879.git.asj@kernel.org>
References: <cover.1781694879.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Verify that the cloned filesystem provides an f_fsid that
 is persistent across mount cycles, yet unique from the original filesystem's
 f_fsid. Signed-off-by: Anand Jain <asj@kernel.org> --- tests/generic/802
 | 64 +++++++++++++++++++++++++++++++++++++++++++ tests/generic/802.out | 4
 +++ 2 files changed, 68 insertions(+) create mode 100644 tes [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZoKY-0002Nz-1L
Subject: [f2fs-dev] [PATCH v7 06/11] fstests: verify f_fsid for cloned
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
From: Anand Jain via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Jain <asj@kernel.org>
Cc: hch@infradead.org, djwong@kernel.org, zlang@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:hch@infradead.org,m:djwong@kernel.org,m:zlang@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[asj@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D17F5698FE8

Verify that the cloned filesystem provides an f_fsid that is persistent
across mount cycles, yet unique from the original filesystem's f_fsid.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 tests/generic/802     | 64 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/802.out |  4 +++
 2 files changed, 68 insertions(+)
 create mode 100644 tests/generic/802
 create mode 100644 tests/generic/802.out

diff --git a/tests/generic/802 b/tests/generic/802
new file mode 100644
index 000000000000..910807c11584
--- /dev/null
+++ b/tests/generic/802
@@ -0,0 +1,64 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2026 Anand Jain <asj@kernel.org>.  All Rights Reserved.
+#
+# FS QA Test 802
+# Check that the cloned filesystem provides an f_fsid that is persistent
+# across mount cycles if the block device maj:min remains unchanged.
+
+. ./common/preamble
+
+_begin_fstest auto quick mount clone
+
+_require_test
+_require_block_device $TEST_DEV
+_require_loop
+
+_fixed_by_fs_commit btrfs xxxxxxxxxxxx \
+	"btrfs: use on-disk uuid for s_uuid in temp_fsid mounts"
+_fixed_by_fs_commit btrfs xxxxxxxxxxxx \
+	"btrfs: derive f_fsid from on-disk fsuuid and dev_t"
+
+_cleanup()
+{
+	cd /
+	rm -r -f $tmp.*
+	umount $mnt1 $mnt2 2>/dev/null
+	_loop_image_destroy "${devs[@]}" 2> /dev/null
+}
+
+# Setup base loop device and its clone
+devs=()
+_loop_image_create_clone devs
+mkdir -p $TEST_DIR/$seq
+mnt1=$TEST_DIR/$seq/mnt1
+mnt2=$TEST_DIR/$seq/mnt2
+mkdir -p $mnt1
+mkdir -p $mnt2
+
+# Mount both filesystems simultaneously using mandatory clone mount options
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
+						_fail "Failed to mount dev1"
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
+						_fail "Failed to mount dev2"
+
+# Capture baseline filesystem IDs for comparison
+fsid_scratch=$(stat -f -c "%i" $mnt1)
+fsid_clone=$(stat -f -c "%i" $mnt2)
+
+# Verify that the fsids remain stable after a mount cycle, even when the
+# mount order is reversed.
+echo "**** fsid after mount cycle ****"
+_unmount $mnt1
+_unmount $mnt2
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
+						_fail "Failed to mount dev2"
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
+						_fail "Failed to mount dev1"
+
+# Compare post mount-cycle values against the baseline
+stat -f -c "%i" $mnt1 | sed -e "s/$fsid_scratch/FSID_SCRATCH/g"
+stat -f -c "%i" $mnt2 | sed -e "s/$fsid_clone/FSID_CLONE/g"
+
+status=0
+exit
diff --git a/tests/generic/802.out b/tests/generic/802.out
new file mode 100644
index 000000000000..0202a9a2c108
--- /dev/null
+++ b/tests/generic/802.out
@@ -0,0 +1,4 @@
+QA output created by 802
+**** fsid after mount cycle ****
+FSID_SCRATCH
+FSID_CLONE
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
