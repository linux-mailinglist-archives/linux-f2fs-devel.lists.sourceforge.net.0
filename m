Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A463BAD0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 08:38:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozvCa-00018R-4b;
	Tue, 29 Nov 2022 07:38:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ozvCY-00018G-Cs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 07:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gReftIkPcv86s/6G2e7a+dr7BBjrFGrWJg57mt8yOo=; b=Jb31u8RMWSqNdGyrkCBenmi4Ao
 2hr+2s0zl49xi665JQWIoKvB2IeF7ce1BaEP/G5x+3S0e5Er3+gEgOGULYd5jXh5aK2392777J+J2
 zIrx3mouOIcrpnjsIgIQqGUN39UDlO+Ufu+ujrXps6+uj08fa6A8g99SOKc9DGoiEER4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1gReftIkPcv86s/6G2e7a+dr7BBjrFGrWJg57mt8yOo=; b=g
 JfdPVr7jq3LEVURVhZ268k6oiXE9lr94NWmn5uZZ0nSWLwKz3ZRmWVnlG+CqzPOWcnLnos+M3xa3G
 ziiCgIf7yJVf+gEfywBJWnSQZvpsvKVAb81Q74qDoAUDp11m3nCMpEcht8g4xALJ23tWPXYfZ9vRU
 sX8jecM3ZRkXnEzk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozvCX-0007C1-R7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 07:38:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C8B461559;
 Tue, 29 Nov 2022 07:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE947C433D6;
 Tue, 29 Nov 2022 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669707519;
 bh=rA4a1g3s0lz7F25H3p9Tr6kKlhmzOPOkO+EN/vK9hL4=;
 h=From:To:Cc:Subject:Date:From;
 b=ZTSneln1FccU9GM9w5SbSONuhYOw2L+DjvyD1Amicws2eD0P5OskNom+GmS73yExh
 fSPe5L54ydbJvoHq27ilMzVMXnCUja6YU5JtWFhBAlTOmZy3VXfSYJ5VwAKPYCD9l2
 ImoMRfkZyeWcdApzC0kx9JuIRW0UU1MfCPvypvjGUgXwR3dL3XS3zx0p0Si2xAqdfg
 VSXv26zUZkipkHwy1dLi8w6jbBr1CwdHIcmg4xBNLGsGLjLYA74ZkbWkSaNXTL9bq9
 GMUShXQeltZ+Q92tdSgsELjQzieu1Y8qzKLqZ1EX9+dUAazcYp6/xaUKAA+ljnc0z9
 JsfdKNOsxnxPg==
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Date: Mon, 28 Nov 2022 23:35:59 -0800
Message-Id: <20221129073559.203528-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add a f2fs/compress
 configuration which causes all files to be automatically compressed, similar
 to how f2fs/encrypt causes all files to be automatically encrypted. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ozvCX-0007C1-R7
Subject: [f2fs-dev] [xfstests-bld PATCH] test_appliance: add f2fs/compress
 config
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a f2fs/compress configuration which causes all files to be
automatically compressed, similar to how f2fs/encrypt causes all files
to be automatically encrypted.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 test-appliance/files/root/fs/f2fs/cfg/all.list | 1 +
 test-appliance/files/root/fs/f2fs/cfg/compress | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 test-appliance/files/root/fs/f2fs/cfg/compress

diff --git a/test-appliance/files/root/fs/f2fs/cfg/all.list b/test-appliance/files/root/fs/f2fs/cfg/all.list
index bc796ff..90a7a36 100644
--- a/test-appliance/files/root/fs/f2fs/cfg/all.list
+++ b/test-appliance/files/root/fs/f2fs/cfg/all.list
@@ -1,2 +1,3 @@
 default
 encrypt
+compress
diff --git a/test-appliance/files/root/fs/f2fs/cfg/compress b/test-appliance/files/root/fs/f2fs/cfg/compress
new file mode 100644
index 0000000..6f2b954
--- /dev/null
+++ b/test-appliance/files/root/fs/f2fs/cfg/compress
@@ -0,0 +1,5 @@
+SIZE=small
+export MKFS_OPTIONS="-O compression,extra_attr"
+export F2FS_MOUNT_OPTIONS="compress_extension=*"
+REQUIRE_FEATURE=compression
+TESTNAME="F2FS compression"
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
