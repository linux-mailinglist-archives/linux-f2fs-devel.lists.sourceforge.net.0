Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE527F6AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Oct 2020 02:26:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNmQ0-0006Eo-6F; Thu, 01 Oct 2020 00:25:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kNmPv-0006EP-Hp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Oct 2020 00:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jE+5/QmUFR5DgVE51yxb4wl7VYgnc2hqeWBLqWrdECg=; b=lqPp0DPWqkv2HIo9Wyz/rf3JQM
 gmNHAC4itl31Y/nAggnrAa575ma2xh37S0INJN+Sf2zeoItS4sMJFHBI/U+3mbgi1vQVr3kdoVhqH
 M7jDbyIf4pp07AYzcJbhZs7fV5tGLFIms/Mer6cpIXQYeSrJnfoHKwlQcV2HDHj+G5vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jE+5/QmUFR5DgVE51yxb4wl7VYgnc2hqeWBLqWrdECg=; b=FeoebRYNf71d4X8u+MrdZSG+mz
 y2q1wjXc+sIVZEFrEeCT1FO8g78m6huEsMCU6JqP2/1VwmHFJu3Ma/OTuAxgkwfpUX+LYnHpljR3u
 9Lh9+gkWH8a+0ysQmN3UI5GdX1gSb2xjbmdaqMGKn04lUtYba+r8Ql8070Q8AwPL+lIQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kNmPo-00FF81-Ng
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Oct 2020 00:25:51 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F408021D41;
 Thu,  1 Oct 2020 00:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601511932;
 bh=pB9+XDQedKRY2rzT9jphCHX3wT7Ws8YKXXmwKKr3fqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yfKcrQRXtoPbngq70GQzXwip6neeb4NWmPs8QuC2hGTDqQ8YKwt4vguf8qcZPeguP
 Y7qwwXqMqq6u7RH+CxurGR6yDQQNEt2L6ej9h6y9vDW+ng6xFBeFNbg2k49d+0W6rS
 +PsEMNKbwf0p0xH6Fsv0lw2cYVYATsS+j3e2clb8=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Wed, 30 Sep 2020 17:25:06 -0700
Message-Id: <20201001002508.328866-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001002508.328866-1-ebiggers@kernel.org>
References: <20201001002508.328866-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kNmPo-00FF81-Ng
Subject: [f2fs-dev] [PATCH 4/5] common/f2fs: add
 _require_scratch_f2fs_compression()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Create the file common/f2fs, which will contain f2fs-specific utilities.

Then add a function _require_scratch_f2fs_compression(), which checks
for f2fs compression support on the scratch filesystem.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/f2fs | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 common/f2fs

diff --git a/common/f2fs b/common/f2fs
new file mode 100644
index 00000000..1b39d8ce
--- /dev/null
+++ b/common/f2fs
@@ -0,0 +1,27 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2020 Google LLC
+
+# Require f2fs compression support on the scratch filesystem.
+# Optionally, check for support for a specific compression algorithm.
+_require_scratch_f2fs_compression()
+{
+	local algorithm=$1
+
+	_require_scratch
+
+	if [ ! -e /sys/fs/f2fs/features/compression ]; then
+		_notrun "Kernel doesn't support f2fs compression"
+	fi
+	# Note: '-O compression' is only accepted when used in
+	# combination with extra_attr.
+	if ! _scratch_mkfs -O compression,extra_attr >> $seqres.full; then
+		_notrun "f2fs-tools doesn't support compression"
+	fi
+	if [ -n "$algorithm" ]; then
+		if ! _scratch_mount "-o compress_algorithm=$algorithm"; then
+			_notrun "Kernel doesn't support $algorithm compression algorithm for f2fs"
+		fi
+		_scratch_unmount
+	fi
+}
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
