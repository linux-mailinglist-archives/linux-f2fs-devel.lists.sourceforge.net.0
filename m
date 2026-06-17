Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8elNS2DMmoI1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA03698FE5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HhBory75;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=E9CKq2VT;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=PJkP544k;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=R2a9JsX3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB9CwpKIaTdCZ1RzqXsH3WuDnbf9jrLT9Me7C02r61Q=; b=HhBory75bH5M4cpLopSfakyeAt
	T9e1fzd/VK5SjSKqJEn1TeITuhprxfukoIc4j9zm4Cv9lga8Hb327TPaj5sEnCZZMiTBXZqdHC1hS
	CdxapDEfcDwJTTlGI/v5A6rotGoZTmEbqfHvPaA0juH8d8g1SxPFzz6U0Te1brI9L8Ks=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZoKb-0004f9-I0;
	Wed, 17 Jun 2026 11:21:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wZoKa-0004ez-1m
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7gLHSQrBmdzDhCPqc1cwZxKG/ga7a4oLr1rXb9+FRY=; b=E9CKq2VTHPHQrJuYmsWvduGpgi
 bFAwi1a1Hs+N0R0+QQfcVyn5ClShMGU9PsiDJwmy9jAbh0lOBe/f45pPaBEcNXos5wIR/RfnLYwew
 BxjPVgF36Bur9LdW6sazhLeIRFVIDzhlYN4NqR8mEXlDXtvwDZbGf313IA+kj8t/1RaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H7gLHSQrBmdzDhCPqc1cwZxKG/ga7a4oLr1rXb9+FRY=; b=PJkP544kQwnx3m5gVhEExD+EkT
 NEZ3YqXQntsiaJ4a9u2x9erSLrgIuBadYl3EQMyYn5apr/3HriaRVaXGkVPL/XAL1zYKF50++0fNL
 C3i/5xGqWPBfomTZdo4OmlIrDYzKBOgg6dII3u4rd1UWLRyh4u7qbvuh4NNmqC1fuV48=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZoKV-0002Nm-EV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:21:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A746C4360E;
 Wed, 17 Jun 2026 11:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961DD1F000E9;
 Wed, 17 Jun 2026 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781695261;
 bh=H7gLHSQrBmdzDhCPqc1cwZxKG/ga7a4oLr1rXb9+FRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R2a9JsX3YohNSPK6ax0t7x/1+ReNT+oBfIiflUPbqwQ1x53oJfJswtpFoGxleup5D
 FkqnDPFOMwQq2UA1CNE8hUzAzE+g4s6l/1gcIfQG5CCsLJJCQ8cW3T21tTlFPWzHZU
 nKDSztqyoVl3aRYfM0HCMMGrHxyC8naraPfoViQfLCF+jkNBydgjRWqyK61eU0saON
 nmcM4yaUHeAGOAuy+nmcLGefWv66DLZSlPJFTSJvl0Rez7X5SalMr/myjnWtVu2kYH
 hyMXXUc6lW/Kl46Lyo7G0+vj4/BlsLX01g56NCFHu0UZO0S2yHqmPZ6zMwSXX1GExN
 TDOOi4x/zusMA==
To: fstests@vger.kernel.org
Date: Wed, 17 Jun 2026 19:20:32 +0800
Message-ID: <65f6e4b778e85bd16f16e7745eb985e2a70f44f7.1781694879.git.asj@kernel.org>
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
 Content preview: Verify that fanotify events are correctly routed to the
 appropriate
 watcher when cloned filesystems are mounted. Helps verify kernel's event
 notification distinguishes between devices sharing the same [...] 
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
X-Headers-End: 1wZoKV-0002Nm-EV
Subject: [f2fs-dev] [PATCH v7 05/11] fstests: verify fanotify isolation on
 cloned filesystems
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
X-Rspamd-Queue-Id: 6CA03698FE5

Verify that fanotify events are correctly routed to the appropriate
watcher when cloned filesystems are mounted.
Helps verify kernel's event notification distinguishes between devices
sharing the same FSID/UUID.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 tests/generic/801     | 135 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/801.out |   7 +++
 2 files changed, 142 insertions(+)
 create mode 100644 tests/generic/801
 create mode 100644 tests/generic/801.out

diff --git a/tests/generic/801 b/tests/generic/801
new file mode 100644
index 000000000000..3bfb87d41922
--- /dev/null
+++ b/tests/generic/801
@@ -0,0 +1,135 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2026 Anand Jain <asj@kernel.org>.  All Rights Reserved.
+#
+# FS QA Test 801
+# Verify fanotify FID functionality on cloned filesystems by setting up
+# watchers and making sure notifications are in the correct logs files.
+
+. ./common/preamble
+
+_begin_fstest auto quick mount clone
+
+_require_test
+_require_block_device $TEST_DEV
+_require_loop
+_require_command "$FSNOTIFYWAIT_PROG" fsnotifywait
+_require_unique_f_fsid
+
+_cleanup()
+{
+	cd /
+	[[ -n $pid1 ]] && { kill -TERM "$pid1" 2> /dev/null; wait $pid1; }
+	[[ -n $pid2 ]] && { kill -TERM "$pid2" 2> /dev/null; wait $pid2; }
+
+	if [ "$semanage_added" = "yes" ]; then
+		semanage permissive -d unconfined_t >/dev/null 2>&1 || true
+	fi
+
+	umount $mnt1 $mnt2 2>/dev/null
+	_loop_image_destroy "${devs[@]}" 2> /dev/null
+	rm -r -f $tmp.*
+}
+
+# Run fsnotifywait in unbuffered mode to watch filesystem-wide create events
+monitor_fanotify()
+{
+	local mmnt=$1
+	exec stdbuf -oL $FSNOTIFYWAIT_PROG -m -F -S -e create "$mmnt" 2>&1
+}
+
+# Transform f_fsid into the hi.lo format used in fanotify FID logs
+fsid_to_fid_parts()
+{
+	local fsid=$1
+	# Pad to 16 hex chars (64-bit), then split into two 32-bit halves
+	local padded=$(printf '%016x' "0x${fsid}")
+	local hi=$(printf '%x' "0x${padded:0:8}")   # strips leading zeros
+	local lo=$(printf '%x' "0x${padded:8:8}")   # strips leading zeros
+	echo "${hi}.${lo}"
+}
+
+# Create base loop device and its clone
+devs=()
+_loop_image_create_clone devs
+mkdir -p $TEST_DIR/$seq
+mnt1=$TEST_DIR/$seq/mnt1
+mnt2=$TEST_DIR/$seq/mnt2
+mkdir -p $mnt1
+mkdir -p $mnt2
+
+# Mount both base and clone filesystems using required clone mount options
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
+						_fail "Failed to mount dev1"
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
+						_fail "Failed to mount dev2"
+
+# Fetch filesystem IDs to verify the kernel can differentiate between them
+fsid1=$(stat -f -c "%i" $mnt1)
+fsid2=$(stat -f -c "%i" $mnt2)
+
+log1=$tmp.fanotify1
+log2=$tmp.fanotify2
+
+pid1=""
+pid2=""
+echo "Setup FID fanotify watchers on both mnt1 and mnt2"
+
+# Permit unconfined_t domains when SELinux is enforcing to prevent fanotify
+# blockages
+semanage_added="no"
+if [ "$(getenforce 2>/dev/null)" = "Enforcing" ]; then
+    if ! semanage permissive -l | grep -q "unconfined_t"; then
+        semanage permissive -a unconfined_t >/dev/null 2>&1 && semanage_added="yes"
+    fi
+fi
+
+# Start asynchronous fanotify monitors
+( monitor_fanotify "$mnt1" > "$log1" ) &
+pid1=$!
+( monitor_fanotify "$mnt2" > "$log2" ) &
+pid2=$!
+sleep 2
+
+echo "Trigger file creation on mnt1"
+touch $mnt1/file_on_mnt1
+sync
+sleep 1
+
+echo "Trigger file creation on mnt2"
+touch $mnt2/file_on_mnt2
+sync
+sleep 1
+
+echo "Verify fsid in the fanotify"
+kill $pid1 $pid2
+wait $pid1 $pid2 2>/dev/null
+pid1=""
+pid2=""
+
+e_fsid1=$(fsid_to_fid_parts "$fsid1")
+e_fsid2=$(fsid_to_fid_parts "$fsid2")
+
+# Dump debug details to the full log
+echo $fsid1 $e_fsid1 $fsid2 $e_fsid2 >> $seqres.full
+cat $log1 >> $seqres.full
+cat $log2 >> $seqres.full
+
+# Ensure monitor 1 only captured events belonging to mnt 1 and fsid 1
+if grep -qF "$e_fsid1" "$log1" && ! grep -qF "$e_fsid2" "$log1"; then
+	echo "SUCCESS: mnt1 events found"
+else
+	[ ! -s "$log1" ] && echo "  - mnt1 received no events."
+	grep -qF "$e_fsid2" "$log1" && echo "  - mnt1 received event from mnt2."
+fi
+
+# Ensure monitor 2 only captured events belonging to mnt 2 and fsid 2
+if grep -qF "$e_fsid2" "$log2" && ! grep -qF "$e_fsid1" "$log2"; then
+	echo "SUCCESS: mnt2 events found"
+else
+	[ ! -s "$log2" ] && echo "  - mnt2 received no events."
+	grep -qF "$e_fsid1" "$log2" && echo "  - mnt2 received event from mnt1."
+fi
+
+status=0
+exit
diff --git a/tests/generic/801.out b/tests/generic/801.out
new file mode 100644
index 000000000000..d7b318d9f27c
--- /dev/null
+++ b/tests/generic/801.out
@@ -0,0 +1,7 @@
+QA output created by 801
+Setup FID fanotify watchers on both mnt1 and mnt2
+Trigger file creation on mnt1
+Trigger file creation on mnt2
+Verify fsid in the fanotify
+SUCCESS: mnt1 events found
+SUCCESS: mnt2 events found
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
