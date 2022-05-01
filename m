Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C80615161EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 07:13:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nl1tG-000197-Qk; Sun, 01 May 2022 05:13:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nl1tF-00018a-Df
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KIm0zYk7Q6+tArZqt14n2uWQmVX233hKJvsQd72DoPw=; b=mAok7CXEis5D9UG/eVJkQxS8we
 a3YAVyTfOaUnRFCx0qwJPnnPkWKs/1OI+vs92fgEM3HTgWf2rW3jACPU3T2PnOQ6hnKfDB9bdp/AR
 ryIgXLwuR/mqP6jkTKIpOG81bjG8Z/zNXwTH3s4yk9jETWEjUYltPkmTSEyuz3gVTrxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KIm0zYk7Q6+tArZqt14n2uWQmVX233hKJvsQd72DoPw=; b=ju7mcZ03Ntl2Zy9f5WOy/hYAF0
 2CAuLkk1EZ/bQYBKSsGyyigWzBFr9f9jF/1bUimXMBqE99HBWL9daA0rRVpCgzIQ8R85/zfQu94kP
 EGhhl16zm80CBfAD/Kn67k3J4iTGwp9St4zU/+NtSzuDMO0C1urrYKvWfb7JgKLJuOB0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nl1tE-00FPci-P6
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB931B80BE8;
 Sun,  1 May 2022 05:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BEAC385B3;
 Sun,  1 May 2022 05:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651381967;
 bh=2vUKQMXpAm2mOWKYBso+HywZABvVuLBsPwnw/l6/ShI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJuiD/wueqRCERhHCB1m6wXX0fQSB7LjRmThg8bHSTVsSrIx9CH7W+F3Zwv2uYTVa
 VPF0+BzbwQg6Fuh63LPmXls424TG77CY0wBrOycaE4j+ciD+IBdADnW56BPsn3Y6Oa
 57LSX7rxv2NqneuXuHnayHQP+yKpuJFJJ9943IYa2PF03l5t8+mPIg6ojwScSDx7Pf
 L/Skqj5+XH926lU72L56chNcJztbgpCcR53OjQhmv74fDq/BNqkU/WIPfpzVzaWrov
 zJu1nigTgMFfvlKE1a1YjjzhDCiGfNL58gcq9oi0CfxKoGuTK3WJfBbQbKR3A9dkKI
 mC5E+jSrXuTtg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 22:08:52 -0700
Message-Id: <20220501050857.538984-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501050857.538984-1-ebiggers@kernel.org>
References: <20220501050857.538984-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> There is no good
 reason to allow this mount option when the kernel isn't configured with
 encryption
 support. Since this option is only for testing, we can just fix this; we
 don't really need to worry [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nl1tE-00FPci-P6
Subject: [f2fs-dev] [PATCH v2 2/7] f2fs: reject test_dummy_encryption when
 !CONFIG_FS_ENCRYPTION
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
Cc: Jeff Layton <jlayton@kernel.org>, Lukas Czerner <lczerner@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

There is no good reason to allow this mount option when the kernel isn't
configured with encryption support.  Since this option is only for
testing, we can just fix this; we don't really need to worry about
breaking anyone who might be counting on this option being ignored.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4368f90571bd6..6f69491aa5731 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -525,10 +525,11 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 		return -EINVAL;
 	}
 	f2fs_warn(sbi, "Test dummy encryption mode enabled");
+	return 0;
 #else
-	f2fs_warn(sbi, "Test dummy encryption mount option ignored");
+	f2fs_warn(sbi, "test_dummy_encryption option not supported");
+	return -EINVAL;
 #endif
-	return 0;
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.36.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
