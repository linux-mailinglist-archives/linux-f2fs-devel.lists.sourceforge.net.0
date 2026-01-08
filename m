Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EED00B94
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 03:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YY3zqKvlC2ulXC3V0rB5sP/lU4/Mab3BPsy3m9H/Lk4=; b=DlyeqwBT5GrvlpACmCOQCGTk4c
	LWkgviU/nN4znOwlaRWT9CA/rqzYYCpR7x01xqkElmN6JR++TsmLcfVgdTIT3xlM8Ic9M9mwAtBx9
	nhy43yaU1Wv3mtUmYJBSmBslFRR7e2E9FamE896jmvNQn4I3suKADbXjwLP9wjWX5QKI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdg6c-0005Ub-Jq;
	Thu, 08 Jan 2026 02:50:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3khVfaQsKAIsy3p22trwxt2v33v0t.r31@flex--joannechien.bounces.google.com>)
 id 1vdg6V-0005UQ-IQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 02:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SrYuwfhwfbmC/bf2zMBK+/g1Cce91zZmpkTDVhsGD/g=; b=O3jE0GkVwEdnC3XRDGx0ciyQpV
 RiR7ZqwMQdcQ+Seigyer/Lkl/ws4quF4r4G9GDDPi/0/9ueRGlzSskuLWqpGqj8HlEWpHY7RrB1eO
 aNXfXIH8f2zr6Qowv6Qk/Sa/GOlIjjcNKh/WlJuXwm4gogClR2z5BSScmhzYf9iHlMZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SrYuwfhwfbmC/bf2zMBK+/g1Cce91zZmpkTDVhsGD/g=; b=E
 QdGsizPgdw9LSDN24OR4LL2rvh9kZLmykEOCSiAU04nEnuo+wp/6r6+X7eNUa5fU0/7tZ8pAh0wk6
 u2Nz16Ordwdd+LPJ7emLymWh29AVrTRdjzHKzc/huonLnlsMm5T0fe2N66JM0NAhmxIqrjTIo2JAS
 xK9k7B6z0tLGQPcs=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdg6V-0004zo-5k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 02:50:27 +0000
Received: by mail-ot1-f74.google.com with SMTP id
 46e09a7af769-7c75290862cso7471474a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jan 2026 18:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767840616; x=1768445416;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SrYuwfhwfbmC/bf2zMBK+/g1Cce91zZmpkTDVhsGD/g=;
 b=qpNOt5y3NVJ30PgEiw8M4CR25gZUo+VVYTRGEz1GVHEMYJBc24+dX/05AvRlNnvpYk
 RlKBBzq7dwYzCqeFwxw9pl6inOiV48AxLIHtf1oGtT1JWZrQHowsl0K0mioz6z1htVJh
 2HJow6BLitLa0zl8DMz/tQzm5ChHwhkDaKlix3R3AmEETIn2rZiwStMH1TJbgwofstUn
 HoEiAywZtO+K0XaGvlmSLXwNyD7TB/3HgN5pTu5kGQ6Uitupmnf4bWL/g8iApgp3jI/s
 NwiiGs6qxa7rrmacGuvYcSr/KPrN/SVzEGv069W/vBbcJHvT3h2g2CHGFvXP9OLgmSCc
 iS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767840616; x=1768445416;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SrYuwfhwfbmC/bf2zMBK+/g1Cce91zZmpkTDVhsGD/g=;
 b=MRTQflRGZk5X/WjVvzEBF3536lPJ0i09LjBZ2blo3naGtlqMmqYPmZLvvVgfvt+pQe
 jK7HudsKEoG5hQ/9g8eFst1efTS3LKLi2MJp4wLcDqI+CCzBuTJyOTtiJMYWt07m4uv3
 ceKKQ/0u4tJvEbU/V83BOUN8+x357pRDw5iI48xDm0oBiyG9skkV+qlQSzvgwYWVJSdc
 YhRjtCLW/0dtw2LB8HdCWdd4AhPTthvV+L1xoYLNw6pBRuPgE11LqV3W/GBpxxDjffxq
 NmXQjoXHpY85QOHurC2D9VhMU7bm/RRxLXF+aQsK/zRTajuIa8MdXmXcJgX3TdUOe1X+
 Ce5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4UfgO2oHvomZeWQHi3/W96+Iq8Ft74Cujl0I0j7NMK512KUgeeqzygIjg5ASxGH2nAzSzkW2mtBiRvN/gCfDr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwyKwJ2dEWIrlPsdSZeXB/Dm5Ka45g9OT8Ql7oTLAd1isDA70Oy
 Zw0ukhYlKct/x/FwWK6aUFI3aH04uSGjitmnGUu7wZ7dSpvTwgStzsSsNjNYKeUxWz4tCyoAduC
 mJypUdR7yklLS876D8vdSW0grKw==
X-Google-Smtp-Source: AGHT+IHgjL+jXFv1jsSi9s5ho/HiCU622hRU7RryIEk43OP954ueCqRgazTJrQcyMRnOizOe3GIsTl7vfmnC4gjo1Q==
X-Received: from plov8.prod.google.com ([2002:a17:902:8d88:b0:293:e00:bb82])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cecb:b0:29f:2b84:652b with SMTP id
 d9443c01a7336-2a3ee484c56mr45141305ad.29.1767839122159; 
 Wed, 07 Jan 2026 18:25:22 -0800 (PST)
Date: Thu,  8 Jan 2026 02:25:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260108022501.754320-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/735 attempts to create a file with nearly 2^32
 blocks.
 However, some filesystems have a maximum file block limit below this threshold.
 For instance, F2FS is limited to approximately 2^30 block [...] 
 Content analysis details:   (-4.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.210.74 listed in psbl.surriel.com]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.74 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vdg6V-0004zo-5k
Subject: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file helper
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Joanne Chang <joannechien@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/735 attempts to create a file with nearly 2^32 blocks. However,
some filesystems have a maximum file block limit below this threshold.
For instance, F2FS is limited to approximately 2^30 blocks due to the
capacity of the inode. So add _require_blocks_in_file helper to skip the
test in such cases.

The helper uses a hardcoded constant instead of a programmatic method,
so that bugs which affect the maximum file size are not masked.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
v2 -> v3: 
- added explanation for using constants to commit message

v1 -> v2:
- changed title from "generic/735: disable for f2fs"
- used a new helper function instead of _exclude_fs as Christoph Hellwig
  suggested

 common/rc         | 16 ++++++++++++++++
 tests/generic/735 |  1 +
 2 files changed, 17 insertions(+)

diff --git a/common/rc b/common/rc
index c3cdc220..e92f4854 100644
--- a/common/rc
+++ b/common/rc
@@ -6120,6 +6120,22 @@ _require_file_attr_special()
 	fi
 }
 
+# Require filesystem to accomodate enough blocks in a file
+_require_blocks_in_file()
+{
+	local blocks=$1
+
+	case $FSTYP in
+	f2fs)
+		if [ $blocks -gt 1057053439 ]; then
+			_notrun "$blocks blocks per file not supported on $FSTYP"
+		fi
+		;;
+	*)
+		;;
+	esac
+}
+
 ################################################################################
 # make sure this script returns success
 /bin/true
diff --git a/tests/generic/735 b/tests/generic/735
index 9bbdf3a1..2fbf125c 100755
--- a/tests/generic/735
+++ b/tests/generic/735
@@ -22,6 +22,7 @@ fi
 _require_odirect
 _require_xfs_io_command "falloc"
 _require_xfs_io_command "finsert"
+_require_blocks_in_file $(( (1 << 32) - 1 ))
 
 dev_size=$((80 * 1024 * 1024))
 _scratch_mkfs_sized $dev_size >>$seqres.full 2>&1
-- 
2.52.0.351.gbe84eed79e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
