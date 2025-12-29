Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEACE5DEE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Dec 2025 04:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GA46Qop/pN5pIQsPtvEZ9ZqxNHEt/Y/s45ljyjSUf9Q=; b=H5ZGdA7J/0wJhQ/uw8buqsEx6j
	Kt9ZnwRTZIKz59R7zsglO2ThO46oVs9GcD3UfSqEa5V+V20Xtg2QNhe6fIVZL+MrYvneQZJlmemfw
	bRz76ptExi/hkcdnDtEqqZSsitykuJYNUGWKj+DLNhVCYmi/KpLqJfDxNshUUlAisMuA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1va43C-0008GD-Li;
	Mon, 29 Dec 2025 03:36:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3fehRaQsKAOYRWIVVMKPQMVOWWOTM.KWU@flex--joannechien.bounces.google.com>)
 id 1va42p-0008Dq-KF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Dec 2025 03:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JPBd5FIyXpPa0h8AuPLZNLXhx7uJVz25f1JF2yVxYng=; b=TW0LEF/ExfRqNZ5VA0E0RQMn3e
 Vm2NfL2VgHP07llsoRnS3raK83y7HXr7r1tsgmMjZG96fMn1nhYyl5XSAuFTtQBL2Akh1Guq96Fzp
 ep3YW9l9TVbnyjf1X7djqwClBNxVJ95nFMOyj8PbinfYV+spxnGh7kO0K3y9Zkvw4qvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JPBd5FIyXpPa0h8AuPLZNLXhx7uJVz25f1JF2yVxYng=; b=E
 OEETlGzyQFqhEKW3lPTILjqaeoNyDO514KlMCFTVHsuvo3FTmGf4cwM7C2c1G/UmARFcsjw0C+BBL
 8Y9rimqatY2gwWW8tG+tyUkyoCE+9hwRH6HhtQ5pRR80WQB+nrHVU48DviyZIyKkwVwJXrzCp7FuS
 /6i1ADPNQCGfXY5U=;
Received: from mail-qt1-f201.google.com ([209.85.160.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1va42p-00088c-Qj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Dec 2025 03:35:44 +0000
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-4ed82af96faso189059381cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Dec 2025 19:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766979333; x=1767584133;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JPBd5FIyXpPa0h8AuPLZNLXhx7uJVz25f1JF2yVxYng=;
 b=M/gbwpTswTJ31hgQAuffhamVZMf8tid0jeKEtKNcAjP2QUS462nPDvjLkS+v1zqNFh
 VW5NGLKRo9s0tNUZNRrghCFYkFjS9REXScWPPM8Kfo6DRHExb7+JLHtiQrkf5qbu7tns
 K67K9gnpvH7p+nDzmTczUJgCZfkEszKa/KMEsc7Q4U9zsbq5G430PVN99exJ5N3pEIfT
 SKEZynGSN0GVNhP7tdyRWyRa3I+jx3ouWgku8uwDk30KfRqFPCGFlaiIuepDsPeLQojh
 7vrPBJ5CngC+uPNFHI21RkaF9YDT/7oK/R2syQFTLsI4GrCevXjPKIgzKRnKXkAmjBTO
 YJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766979333; x=1767584133;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JPBd5FIyXpPa0h8AuPLZNLXhx7uJVz25f1JF2yVxYng=;
 b=xU2vOdzy4dV0VQk/JFyYRaFWjvdS2uTlcEogwHfNRn1J/9bcYcBJM6MlTHQVCf6YDo
 nm+pUOHk4mEDV3c9j4JKA139t+eQZtqi33FENoFcrN4R3TuXxa1u6eZXOW6QrKtE+82H
 EEtaE9llCZkW6kEgqgf50v6x6zqjjEHooC8HkFBHf8VYZ61rm7q0oCDR8Nq4cKTRR16E
 jWH9Y9j74mvsVH63rRzf5H6oG/FTDRcPez4bwhQsbPDvxR6HcqSNq4Dxb8Gv9jVIKRdp
 tbEEr1Oh/s3qkhDc0rZ5LPl/LsSQf55TaNu7b3njSwj44cxHRhat3sxGbChH9uYeGXI3
 j35g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdDJAsAZNqdQCaZEE17Wzm5nK3WFfJu+vvY+3a7UmXozGletbjJAY2MAs5mkJ3IKsYbr4iFxviah6kswrshznF@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz7FDoyBQd1Vbvuj5rHU1JbiYaucrafW7hktjFRil5Q2Fw1Qleh
 nZNTjMS44nhcJzrhwa+IkGeV4ugwOjoIjwIIccoH2+BxW2M1WiaaRrU3vVWt/efdFWkXLtLMsBc
 mGOfeozUzk/pkVauwlO3mEUaj4w==
X-Google-Smtp-Source: AGHT+IEHLFHcY3xAou6YQpvVPrUgXMVF+XCu+ch5MJcD36F/s1gy5J3v+Y46BB/Nh4vvzKYb38Fjct39ghEGTvgUMQ==
X-Received: from plbmj11.prod.google.com ([2002:a17:903:2b8b:b0:29e:ebb4:3936])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1105:b0:2a0:f83d:c321 with SMTP id
 d9443c01a7336-2a2f23289cemr276477685ad.23.1766975613081; 
 Sun, 28 Dec 2025 18:33:33 -0800 (PST)
Date: Mon, 29 Dec 2025 02:31:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251229023145.1806877-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
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
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1va42p-00088c-Qj
Subject: [f2fs-dev] [PATCH v2] common/rc: add _require_blocks_in_file helper
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

Signed-off-by: Joanne Chang <joannechien@google.com>
---
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
2.52.0.322.g1dd061c0dc-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
