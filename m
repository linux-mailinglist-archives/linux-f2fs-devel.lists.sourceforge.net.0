Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D32D655457
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8omy-0003PW-06;
	Fri, 23 Dec 2022 20:37:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omx-0003PD-1W
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SP1rikeG5TcWjacmj9fdNsQMeLcBTBzHWiVqPUztrrM=; b=HBg8YJbw6A2vk9nNrQzqdnnLBD
 qQVOKUGNjBWII7DRepO716ZaVTdjWaWMkyVdKqTIh0MGIfcg05lvBfm82SpyqacnI4yfY7RANNQnS
 EmUDijICj5IloLw8Zxcf1xB1H+4HfGRHja4m3P4po9wa96xGWeYm82Xqk/nnrFNUpCaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SP1rikeG5TcWjacmj9fdNsQMeLcBTBzHWiVqPUztrrM=; b=juN4o0NJt9qAJuLMUl04f6wCqp
 rmN3yBpDJkARr8cjT1YvNo9cTOZGKlet7iZFMkuF0RkyzZ9571a9/ERoX3sbxo0Ts/Irr7/cHZzqX
 YyzzX84Ya79XaRklFD4SmMQGPN2Ni3hPh4ajGZqANVYm3vjaseYgir4L0QP72OAV3N7c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8omv-009S2W-2D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7735B82142;
 Fri, 23 Dec 2022 20:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529BEC433F0;
 Fri, 23 Dec 2022 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827817;
 bh=hUMxvtChJHIBiEf3QPm8r6dGOW77G56OuiC6WrUXTPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oyXzMNc4twgXBPEgKTMYdpGLLF0S+W/JjUp0sjBRFNQ3R4P31+mrvxJ1ZdzEO/JJc
 2yKvKtQA9ldermdyYk7cM+zj2pjKPm0I75L/OXvjsuQE/OAGY837S/3OT0He6mjGqY
 3j3T4wKkte1o51XsKB+PHC1Izsf/oUC1bfVwiOg4gw7gjU0B9svWzFhfkBbDrPocAD
 1XMwZ/QDk5X9Rg0lKgwPpLFxyvZngASNHLl8b9jIRzfvRwbLUsillkGJn73NxFi93d
 fVFDCv4mQrgG9lGb015HN3LMPQmH2Ovw7RAizFoP6ZmdtiGTgHwaPIU7gmKvmC/rH7
 WO6RF5z584vmA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:31 -0800
Message-Id: <20221223203638.41293-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Currently, there
 is an implementation limit where files can't have more than 8 Merkle tree
 levels. With SHA-256 and 4K blocks, this limit is never reached, since a file
 would need to be larger than 2* [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8omv-009S2W-2D
Subject: [f2fs-dev] [PATCH v2 04/11] fsverity: use EFBIG for file too large
 to enable verity
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Currently, there is an implementation limit where files can't have more
than 8 Merkle tree levels.  With SHA-256 and 4K blocks, this limit is
never reached, since a file would need to be larger than 2**64 bytes to
need 9 levels.  However, with SHA-512, 9 levels are needed for files
larger than about 1.15 EB, which is possible on btrfs.  Therefore, this
limit technically became reachable when btrfs added fsverity support.

Meanwhile, support for merkle_tree_block_size < PAGE_SIZE will introduce
another implementation limit on file size, resulting from the use of an
in-memory bitmap to track which Merkle tree blocks have been verified.

In any case, currently FS_IOC_ENABLE_VERITY fails with EINVAL when the
file is too large.  This is undocumented, and also ambiguous since
EINVAL can mean other things too.  Let's change the error code to EFBIG,
which is much clearer, and document it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst | 1 +
 fs/verity/open.c                       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index cb8e7573882a1..66cdca30ff58b 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -161,6 +161,7 @@ FS_IOC_ENABLE_VERITY can fail with the following errors:
 - ``EBUSY``: this ioctl is already running on the file
 - ``EEXIST``: the file already has verity enabled
 - ``EFAULT``: the caller provided inaccessible memory
+- ``EFBIG``: the file is too large to enable verity on
 - ``EINTR``: the operation was interrupted by a fatal signal
 - ``EINVAL``: unsupported version, hash algorithm, or block size; or
   reserved bits are set; or the file descriptor refers to neither a
diff --git a/fs/verity/open.c b/fs/verity/open.c
index ca8de73e5a0b8..09512daa22db5 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -92,7 +92,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 	while (blocks > 1) {
 		if (params->num_levels >= FS_VERITY_MAX_LEVELS) {
 			fsverity_err(inode, "Too many levels in Merkle tree");
-			err = -EINVAL;
+			err = -EFBIG;
 			goto out_err;
 		}
 		blocks = (blocks + params->hashes_per_block - 1) >>
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
