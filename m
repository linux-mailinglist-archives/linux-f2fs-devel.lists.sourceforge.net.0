Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950E527367
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 20:05:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npw9I-0002R5-Pq; Sat, 14 May 2022 18:05:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npw9E-0002Qu-9k
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 18:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQrCoqyYWpj4TdnBtSV8i9tkLNBMODHTGTcSkyqSsx0=; b=C9zYWDmAJWe3OhEGZp0vXC27+v
 neoeMtWHnE8rZCfUlgiPkMjX4jCTmD0diKS1qYRrEsjz06jc6OWknmKpjsRp1sb/I1vWBkZ0msm7M
 wN4OIbr9r+8/RRrzoBhAUR190mwhyYmlrUJI07gHm/3hlQP2DzBspsLmsnOWKzjsf7Y0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jQrCoqyYWpj4TdnBtSV8i9tkLNBMODHTGTcSkyqSsx0=; b=B
 5CauxC4w/HI6jc6RguEsMKzcAWcqozie0as6anQfjwoSYZGLVmpIPvZhjzKLIhliNLR6l8Z+vhatJ
 nx5Jlew3b5LRvKXl3ks+x+sanhlSyw7aDT3/rcRRYfAiQMb1wlfPF/kzP/84m+BfJR+fYq/glRBI/
 xvkzSms6nXvji0qU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npw97-00CZ8A-SU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 18:05:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E82F60FF6;
 Sat, 14 May 2022 18:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B24C340EE;
 Sat, 14 May 2022 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652551535;
 bh=I0s9oWoQTIjzMiZqERKj9agOoscpX/k8iVkfOBRfigQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qGJcxnVysDc0Bo3dCNBVoCTL+5YsGsp3ZiNuIocy7/QSXelMRmc0UfUsa/ILjNvvE
 X01aSBlut6TkReXgraqIL/ZnLm2rwpUOkOoGQ+ISsm/uJR5Uf7ymYQLYPRTBS39dxN
 GeWcJG3cRfx0fdsFoE1/icJK6Ufi4u9ra/FxmLUIZhCwXO0tTKkEgoH8VCUQPrKL9v
 LNZ9wAdbhpcmo34m8cWLtJP6uL8niOcaUH745Tx8jfYzqVFu1mtW6okPa7Bcgnfg3W
 Az4iANyjVCUp7sDYB6xryICwrgP1GdFVY3XK5MFJLmFjt+eNLemF1tC6AlGkx0zSdT
 uFkm/tTdW5ZOg==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Sat, 14 May 2022 11:01:46 -0700
Message-Id: <20220514180146.44775-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Test renaming a
 casefolded
 directory located in the top-level directory, while the cache is cold. When
 $MOUNT_OPTIONS contains test_dummy_encryption, this detects an f2fs bug. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npw97-00CZ8A-SU
Subject: [f2fs-dev] [xfstests PATCH] generic/556: add test case for
 top-level dir rename
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
Cc: linux-fscrypt@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Test renaming a casefolded directory located in the top-level directory,
while the cache is cold.  When $MOUNT_OPTIONS contains
test_dummy_encryption, this detects an f2fs bug.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/556 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/generic/556 b/tests/generic/556
index 7ef2f6f4..8abb65e8 100755
--- a/tests/generic/556
+++ b/tests/generic/556
@@ -348,6 +348,21 @@ test_file_rename()
 		echo "Name shouldn't change."
 }
 
+test_toplevel_dir_rename()
+{
+	local dir=${SCRATCH_MNT}/dir_rename
+
+	# With the cache cold, rename a casefolded directory located in the
+	# top-level directory.  If $MOUNT_OPTIONS contains
+	# test_dummy_encryption, this detects the bug that was fixed by
+	# 'f2fs: don't use casefolded comparison for "." and ".."'.
+	mkdir ${dir}
+	_casefold_set_attr ${dir}
+	sync
+	echo 2 > /proc/sys/vm/drop_caches
+	mv ${dir} ${dir}.new
+}
+
 # Test openfd with casefold.
 # 1. Delete a file after gettings its fd.
 # 2. Then create new dir with same name
@@ -486,6 +501,7 @@ test_dir_name_preserve
 test_name_reuse
 test_create_with_same_name
 test_file_rename
+test_toplevel_dir_rename
 test_casefold_openfd
 test_casefold_openfd2
 test_hard_link_lookups

base-commit: bb04d577435d04ce3aa160f0563d1d35d4860d54
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
