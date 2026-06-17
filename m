Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nrznFSiDMmoE1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0032698FD5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 13:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=MFlqL4vt;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=UQVwOZAv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=SJ4fQk4I;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=bubuyOk4;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyW/SSCL+0OQF7KzEHtFPHh02cOZwIpdDm5XRk5nTfg=; b=MFlqL4vtU1OEqUzkD5t7v1l7pu
	i1tWFMk/ADld5Dug5FhcEzdcdd/19GoQXryUH/YvlwtrG0qQV2eS4g/XIQywM0hEGBkMk5XD8Tsjr
	0ocpnXMhw78QqcayNs+oW4yllCDi8yPxebBX3BQqp/wWd+MlHNI7az2LWrEMV8P7kPfQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZoKH-0008DA-Te;
	Wed, 17 Jun 2026 11:20:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wZoKG-0008D3-W2
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=81pf5d6d5QrOm2o8qa6SqtrOWC9C6qeuxU6yd+94e28=; b=UQVwOZAvTN1EFlarKm6rgZyKTJ
 AHZvB1C2zuJbGLNNUO7P/Ckq5iTlHfmSfp+rKJJzUK+4K//WraORgEErDCJeEZYCsLAHV5On7e1pf
 7l6ttHoSTgLtIEG5kFuYFEFiFj0g8BIAG4rIlYv2nP5jaixP2/BWdsxuhAZ+gEe/6NoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=81pf5d6d5QrOm2o8qa6SqtrOWC9C6qeuxU6yd+94e28=; b=SJ4fQk4Ihkj3hxwqGAtAXz+1g8
 lIHPc4Vvj0bLR76vSEI7d2LXvkFU8AY/cAIX9s/p0RIVyS+7iNacfFolwu488LTyEoTwhsoTA9mjQ
 uj6D+KIXzMZ9VlTbk+2D09bKo1sIwu1OvZy0+3rVheyb3O/trxQhFJcAKrM1aKKDtGVU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZoKG-0002NA-PO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 11:20:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B612F4365C;
 Wed, 17 Jun 2026 11:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42D11F00A3A;
 Wed, 17 Jun 2026 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781695251;
 bh=81pf5d6d5QrOm2o8qa6SqtrOWC9C6qeuxU6yd+94e28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bubuyOk4od7zpTKgWLnnIhJLQvr96mkbLVOsDKdNxMhtCEYVxj0hmscaledlAmkD7
 c4rlixHjO/TnAnUgoSJgS5Dy1zP1m/qb2e8icLhhV/UfAcO5MeTZEZjNuIuE4Z4PgL
 WeCTjH+FZppGgpNx/jobR9jsYodYo51JDgY1gPC54yGNegRAq4LIqY47vY2Hnf+Ydp
 /QDcNLJt9Z6C9p3JQ7+IV3wVaSbIGJQ4ujX8HkvHaVz+91TrDQskbKwVHu82q+o1Ef
 FzJpvGEJRrPTZQJYFrR7YHYMKOI31am/j/n3xjnmVHHFQpw9+/y+xpVPFwiwueK4s/
 5s2LnmFObNMtQ==
To: fstests@vger.kernel.org
Date: Wed, 17 Jun 2026 19:20:28 +0800
Message-ID: <421c7cdd5aae27b99d04dddf08c5d9df79c2f790.1781694879.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781694879.git.asj@kernel.org>
References: <cover.1781694879.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce _loop_image_create_clone() and
 _loop_image_destroy()
 to mkfs an image file and clone it to another image file, and attach a loop
 device to them. And its destroy part. Signed-off-by: Anand Jain
 <asj@kernel.org>
 --- common/rc | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZoKG-0002NA-PO
Subject: [f2fs-dev] [PATCH v7 01/11] fstests: add _loop_image_create_clone()
 helper
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
X-Rspamd-Queue-Id: E0032698FD5

Introduce _loop_image_create_clone() and _loop_image_destroy() to mkfs an
image file and clone it to another image file, and attach a loop device to
them. And its destroy part.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 common/rc | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/common/rc b/common/rc
index 79189e7e6e94..d7e3e0bdfb1e 100644
--- a/common/rc
+++ b/common/rc
@@ -1520,6 +1520,69 @@ _scratch_resvblks()
 	esac
 }
 
+# Create a small loop image, run an optional tuning function ($2) on it,
+# clone it, and attach both to loop devices, returned in ($1).
+# Args:
+#   $1: Nameref to return the array of allocated loop devices [base, clone].
+#   $2: Optional callback function to tune the base filesystem before cloning.
+_loop_image_create_clone()
+{
+	local -n _ret=$1
+	local pre_clone_tune_func="$2"
+	local img_file=$TEST_DIR/${seq}.img
+	local img_file_clone=$TEST_DIR/${seq}_clone.img
+	local size=$(_small_fs_size_mb 128) # Smallest possible
+	local loop_devs
+
+	# Since we copy the block device image, we keep its size small.
+	_require_fs_space $TEST_DIR $((size * 1024))
+
+	_create_file_sized $((size * 1024 * 1024)) $img_file ||
+				_fail "Failed: Create $img_file $size"
+
+	loop_devs=$(_create_loop_device $img_file)
+	_ret=($loop_devs)
+
+	case $FSTYP in
+	xfs)
+		_mkfs_dev "-s size=4096" ${loop_devs[0]}
+		;;
+	btrfs)
+		_mkfs_dev ${loop_devs[0]}
+		;;
+	*)
+		_mkfs_dev ${loop_devs[0]}
+		;;
+	esac
+
+	# Only execute if the function argument is not empty
+	if [ -n "$pre_clone_tune_func" ]; then
+		$pre_clone_tune_func ${loop_devs[0]}
+	fi
+
+	sync ${loop_devs[0]}
+	cp $img_file $img_file_clone
+
+	loop_devs="$loop_devs $(_create_loop_device $img_file_clone)"
+
+	_ret=($loop_devs)
+}
+
+# Teardown loop devices and delete their underlying backing image files.
+# Accepts a list of loop device paths (e.g., /dev/loop0 /dev/loop1).
+_loop_image_destroy()
+{
+	for d in "$@"; do
+		# Retrieve the path of the backing file
+		local f=$(losetup --noheadings --output BACK-FILE $d)
+
+		# Detach the loop device from the backing file
+		_destroy_loop_device "$d"
+
+		# Clean up the backing disk image file
+		[ -n "$f" ] && rm -f "$f"
+	done
+}
 
 # Repair scratch filesystem.  Returns 0 if the FS is good to go (either no
 # errors found or errors were fixed) and nonzero otherwise; also spits out
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
