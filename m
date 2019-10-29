Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A04EE9107
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 21:44:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPYLY-0000cd-Vd; Tue, 29 Oct 2019 20:44:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPYLX-0000c5-6K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcQcF9S5dHKsbdggN3MMR94n1wcavt5c+/DXZzC7Bt4=; b=eP2+Gc0jQPC93D3kJrcvBoxtYl
 dCqB2Yc4dqEsDzL7h9d4lGTrvrKuFMuX351Juao1n65lNVgyKHW8merId6IGfYzHftfVx++SJlduO
 R4zrU8F84ihZz1ZzX5EpUmYfKb7zslt+Tywf4G8+xv5Cg+7sjCpz8DEybe5tnfXHSbNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tcQcF9S5dHKsbdggN3MMR94n1wcavt5c+/DXZzC7Bt4=; b=QXLkUZY1Cud4i8q0jh1Ah0XBDx
 6U/wL9SUJiLRGmI6wIgmVvr3k3ELO0XAmyG7e/mcGCYzJOwcB7NVE9ToQ5MLpE1wNAFMORbAV92EF
 IVi9SzxfBR/rsx4taoYMOTlpDudzth/JgmeFZBs3kLcYthvnii4yGtjEjHlq9ajGQ1E4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPYLS-009PKN-7l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:05 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05878217D9;
 Tue, 29 Oct 2019 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572381836;
 bh=QJkibpFmPY+L1l0BTOxPJ+ZzOzC9a95hZioeK/4QcCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BLmEHvRFOhMawxj8dbjPdVj9lV+aMT03HEGnZryulKlISNzap/aO3XJvYfT3EcjCg
 7c5nbYz5/ntLx21/L1gFiBGlM9TW4Vxz9Wb37hrufKVX2YRPelOvT2mdzbi15r15h+
 7HuRJZ9V1Cwe2775DkNf1dof2WmVtaUw181Ynp64=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 29 Oct 2019 13:41:40 -0700
Message-Id: <20191029204141.145309-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191029204141.145309-1-ebiggers@kernel.org>
References: <20191029204141.145309-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iPYLS-009PKN-7l
Subject: [f2fs-dev] [PATCH 3/4] f2fs: support STATX_ATTR_VERITY
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Set the STATX_ATTR_VERITY bit when the statx() system call is used on a
verity file on f2fs.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759a2..6a2e5b7d8fc74c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -726,11 +726,14 @@ int f2fs_getattr(const struct path *path, struct kstat *stat,
 		stat->attributes |= STATX_ATTR_IMMUTABLE;
 	if (flags & F2FS_NODUMP_FL)
 		stat->attributes |= STATX_ATTR_NODUMP;
+	if (IS_VERITY(inode))
+		stat->attributes |= STATX_ATTR_VERITY;
 
 	stat->attributes_mask |= (STATX_ATTR_APPEND |
 				  STATX_ATTR_ENCRYPTED |
 				  STATX_ATTR_IMMUTABLE |
-				  STATX_ATTR_NODUMP);
+				  STATX_ATTR_NODUMP |
+				  STATX_ATTR_VERITY);
 
 	generic_fillattr(inode, stat);
 
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
