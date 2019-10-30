Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F0EA5C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 22:53:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPvth-0000js-Go; Wed, 30 Oct 2019 21:52:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPvtf-0000je-TE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 21:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8syxxjzb+0hu3KX3RvK6BTHT6sKYPeRr5pCXQsLGjU=; b=IzVBKPWSa12/Tix25i2QEZ1QCn
 EnHF6Xafm82KB0GJT99jSbGh754Sc9MqOHdiALkyFOcOb/GNZ4TwWXEP6TPkKXUSKkPXJ5ZXiivIa
 1v1i88p033WIBMevQzOGmz+aqi+ZJjX5SiV5nushpEox67FExi6N4Yd+o9GUwx3U9iVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x8syxxjzb+0hu3KX3RvK6BTHT6sKYPeRr5pCXQsLGjU=; b=S
 Z9/K3x1HJrikBJoIjepvy4D4Q+U+ITDaz0q7zBDgLdrBw9Ft+xt6pJYiR4GtvIolwf+Th/n03546S
 IgdWJp/do8DQb5OQgGWDOeMeMl2WVC/FDHL8SMywV/JU7TG8D/LGjiKW/gndcHom/RmNOgTn14+Bc
 2sN26WoNUj3S/w8o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPvta-00BTUt-Ct
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 21:52:55 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BFEE20862;
 Wed, 30 Oct 2019 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572472364;
 bh=y4oLlU0PwG6Gb11lermyYlXjl1OFMyfPqp29PV/aEhQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rypiZv9Shr5dm6CahK4eU9hStA++o2IHHcslyIVVVvy1/WDHdvYn1DgI6wu+cJrqV
 wD3uZ2c/gJIjelb1wiklxvdWOdQX/5m3D418roK6xl/lmcafm+iRKq9BGFYcMkhqJu
 VudIQnmfhQ4RUQclDvLOwz/T8e4vmZLI/2AE0JDA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 30 Oct 2019 14:51:38 -0700
Message-Id: <20191030215138.224671-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iPvta-00BTUt-Ct
Subject: [f2fs-dev] [PATCH v2] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
Cc: Gwendal Grignou <gwendal@chromium.org>, apronin@chromium.org,
 Ryo Hashimoto <hashimoto@chromium.org>, sukhomlinov@google.com,
 Douglas Anderson <dianders@chromium.org>,
 linux-f2fs-devel@lists.sourceforge.net, groeck@chromium.org,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Douglas Anderson <dianders@chromium.org>

This reverts commit 0642ea2409f3 ("ext4 crypto: fix to check feature
status before get policy").

The commit made a clear and documented ABI change that is not backward
compatible.  There exists userspace code [1][2] that relied on the old
behavior and is now broken.

While we could entertain the idea of updating the userspace code to
handle the ABI change, it's my understanding that in general ABI
changes that break userspace are frowned upon (to put it nicely).

[1] https://chromium.googlesource.com/chromiumos/platform2/+/5993e5c2c2439d7a144863e9c7622736d72771d5/chromeos-common-script/share/chromeos-common.sh#375
[2] https://crbug.com/1018265

[EB: Note, this revert restores an inconsistency between ext4 and f2fs
 and restores the partially incorrect documentation.  Later we should
 try fixing the inconsistency the other way, by changing f2fs instead
 -- or if that won't work either, at least fixing the documentation.

 Also fixed link 1 above to point to the code which actually broke.]

Fixes: 0642ea2409f3 ("ext4 crypto: fix to check feature status before get policy")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v2: improved commit message.

 Documentation/filesystems/fscrypt.rst | 3 +--
 fs/ext4/ioctl.c                       | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 8a0700af9596..4289c29d7c5a 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -562,8 +562,7 @@ FS_IOC_GET_ENCRYPTION_POLICY_EX can fail with the following errors:
   or this kernel is too old to support FS_IOC_GET_ENCRYPTION_POLICY_EX
   (try FS_IOC_GET_ENCRYPTION_POLICY instead)
 - ``EOPNOTSUPP``: the kernel was not configured with encryption
-  support for this filesystem, or the filesystem superblock has not
-  had encryption enabled on it
+  support for this filesystem
 - ``EOVERFLOW``: the file is encrypted and uses a recognized
   encryption policy version, but the policy struct does not fit into
   the provided buffer
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 0b7f316fd30f..13d97fb797b4 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1181,8 +1181,6 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 #endif
 	}
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
-		if (!ext4_has_feature_encrypt(sb))
-			return -EOPNOTSUPP;
 		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 
 	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
