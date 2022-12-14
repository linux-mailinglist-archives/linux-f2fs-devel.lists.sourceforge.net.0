Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33C64D28D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 23:46:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5aVt-00083J-8h;
	Wed, 14 Dec 2022 22:46:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p5aVX-00082m-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRdDYjjZY9OqS4YNrR21GFaeiW/9mPNrHz721v216T0=; b=i7GBN5SmAweWr9m7eJq2skYmvI
 rTBUH2A7jPmi+tZiTZNVxBmo13Yl+XTZEP6BGNyCfth7n4EgszU0DIVkFc/3ooGMFFtSowpSB/Cve
 P6ZLE68o+1nntubgNkCwr2MCiERC28zGe799R2pojN1l4bRX3tk0TkvQ8PXXThBrrLqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pRdDYjjZY9OqS4YNrR21GFaeiW/9mPNrHz721v216T0=; b=C
 g8eFxKzcgfjDyscdHw3Fl2f/NnMQO7HBIqD7YJ5JFDCL/aajVwnzZNERHRWtKz0TjnrJPduk7AuJN
 Xs9xEl2KaKB1f68qO+ph8B3dnN2VevuRZChvPpgLI5fzsV+dXCe5kg8NVEUT9l5gSzd38GTh0BirO
 CZ1XdAncpznPbrb4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5aVX-00HGhB-4r for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B313E61C19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Dec 2022 22:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9F9C433D2;
 Wed, 14 Dec 2022 22:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671057941;
 bh=7p0zl/jG1hqhXufm5ECGwbi68i+bng+vFDX0eMjfN3M=;
 h=From:To:Cc:Subject:Date:From;
 b=HxY4DkrK0t2KL6AL8sKo0g2/D5iAe7VQX6OgGC3naPJVeEJEV6nNQkqY4gA+y4cG4
 gJGQq9GoJ/u4/1J/gXYwiqWYgnehjQRd9NKijW3cnM2uSb/F6RDuwR1Skv1zS0A6HW
 gkuPB4XmVHPXs8BE/CVtQoj8yF1j+c/cv7x+NFxNuki/F9En1mCKFgcQDZ3CZrT1Nx
 /b7rMYC79Jr3KYvp6jJ/CCn/BgY3vjp7qtKuph7wffB+XuS7en6bA8g+qxgVRdENLQ
 S23YmDznCogG6eONQt+xTuPW6tFpluup/Da3+Ih2MFxxbPsAtWf9AHNlGeWUcpaI35
 FHHlEcITf4ptQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 14 Dec 2022 14:43:00 -0800
Message-Id: <20221214224304.145712-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series implements a few cleanups that have been
 suggested
 in the thread "[RFC PATCH 00/11] fs-verity support for XFS"
 (https://lore.kernel.org/linux-fsdevel/20221213172935.680971-1-aalbersh@redha
 [...] Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5aVX-00HGhB-4r
Subject: [f2fs-dev] [PATCH 0/4] fsverity cleanups
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series implements a few cleanups that have been suggested 
in the thread "[RFC PATCH 00/11] fs-verity support for XFS"
(https://lore.kernel.org/linux-fsdevel/20221213172935.680971-1-aalbersh@redhat.com/T/#u).

This applies to mainline (commit 93761c93e9da).

Eric Biggers (4):
  fsverity: optimize fsverity_file_open() on non-verity files
  fsverity: optimize fsverity_prepare_setattr() on non-verity files
  fsverity: optimize fsverity_cleanup_inode() on non-verity files
  fsverity: pass pos and size to ->write_merkle_tree_block

 fs/btrfs/verity.c        | 19 ++++-------
 fs/ext4/verity.c         |  6 ++--
 fs/f2fs/verity.c         |  6 ++--
 fs/verity/enable.c       |  4 +--
 fs/verity/open.c         | 46 ++++---------------------
 include/linux/fsverity.h | 74 +++++++++++++++++++++++++++++++++-------
 6 files changed, 84 insertions(+), 71 deletions(-)


base-commit: 93761c93e9da28d8a020777cee2a84133082b477
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
