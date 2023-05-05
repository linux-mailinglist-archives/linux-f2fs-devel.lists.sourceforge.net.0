Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF56F807C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 12:02:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pusGr-0004MR-RR;
	Fri, 05 May 2023 10:02:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pusGp-0004ML-KV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/nz6/Uadb7H7G3YFFP4OlF6i65bhIwfg4rk474BUYMk=; b=hXm9EcFlV1+877HEMTq7xUFGRz
 91+dF+l9cEp6xinqCaKm/CDISNTahHOYZ8iS+fFlqmxRYBfn0zV+oGypvxZqBF1UlpQtjqRyNlpWU
 VzRmxeMuH1SAIpLnMnfbsTOr6GqIJK5c98kNeEZS/3YY4X5KWLRJEj/GGsdwpoNeFe18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/nz6/Uadb7H7G3YFFP4OlF6i65bhIwfg4rk474BUYMk=; b=C
 fN3lTUjeYFr32UhIrZpsBBu16DCqNURwwQ4umFcYa1ufrfcg1Zw0T1xx5MD4oSocthMipqyL5vQA7
 w6ECIfli8ZPvIbeJQ29/PVCTkqwtTOdmtnDo0SifJ9HfyLOjDgOPBVrTgC6H5gYiZX5D2Lbt51nDP
 +V726oaAFvVmvS+4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pusGk-00F8L9-Cv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0763461281
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 10:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70064C433D2;
 Fri,  5 May 2023 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683280944;
 bh=lNBNV6B5y1MgXLhf8ZukLUZNk+SzXLYsXaOi78SS6OE=;
 h=From:To:Cc:Subject:Date:From;
 b=uVQeMVAMtU5PoPC+QRIEsLy+tdor6V3FjRFTn08t9ZGt6W4CWsxVVMlwDt2Eua1QP
 MeiXgti3Z4djnVOXmqinptycT7s1zrbnFO4w/2JkW8mUBjoySxbLrwv012ndxWOWxn
 qnGgRd7RkgRW64nHnZFkrLRilMKJIcKyh6BvWWt2TEmLJF4eOtV1AbdH2ExM2/sdQb
 /cGpqL/5fupseuY/tIYNV4AFc6XzxPKDYRsXtDzRjiZbdD71LUSj2h9QXsVesL5o4E
 GYzJu4JSFkP0XI+d4viWUmP3D2pb0wgdoX0EAkylJINW/VPVwzAbfJKs47mNCi2gJ4
 owTjmzur0G8LQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  5 May 2023 18:02:00 +0800
Message-Id: <20230505100205.1921708-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 it may trigger static assert below when the structure
 updates. static_assert(sizeof(struct f2fs_super_block) == 3072,
 "") Signed-off-by:
 Chao Yu <chao@kernel.org> --- include/f2fs_fs.h | 2 +- 1 file changed, 1
 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pusGk-00F8L9-Cv
Subject: [f2fs-dev] [PATCH 1/6] f2fs-tools: add packed attribute for struct
 f2fs_super_block
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

Otherwise, it may trigger static assert below when the structure
updates.

static_assert(sizeof(struct f2fs_super_block) == 3072, "")

Signed-off-by: Chao Yu <chao@kernel.org>
---
 include/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 6948814..c71b59d 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -849,7 +849,7 @@ struct f2fs_super_block {
 	__u8 s_errors[MAX_F2FS_ERRORS];		/* reason of image corrupts */
 	__u8 reserved[258];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
-};
+} __attribute__((packed));
 
 static_assert(sizeof(struct f2fs_super_block) == 3072, "");
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
