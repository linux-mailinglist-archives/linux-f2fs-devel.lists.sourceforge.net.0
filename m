Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0CA2E8EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 11:18:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thQs3-0003VR-T6;
	Mon, 10 Feb 2025 10:18:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1thQs2-0003VK-JS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 10:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bVsBvDiCc9njfA1OXYC3dR1E4IlAyaCYirzdSCdjIBA=; b=ScYnDGDiKqNPVUOcujrLMJmUjL
 YgdkVaPV2qk2ayTXyDr6l8r08wsjb7DckWcL9PjCbK5r/u3Z8DxaXAIQw7nzDU6RVDcRIpiJ18rp5
 y0gBacrtz6bYXSaH6Iv6wqml1mGAc/1bHnm/SHYIo+Rou5bn9SU8/pVYP890zJaFwfpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bVsBvDiCc9njfA1OXYC3dR1E4IlAyaCYirzdSCdjIBA=; b=EimM9Vt3XbwBuL5muXNnO95co+
 yr7hOWw0fLfCirDYDqJ5AB2eV5myJrmxwYtSPyhmGNr/5rr4E7BJJOqWRIzFM+9Kwsh1nTYVnyRMu
 LflX8hg0SxYk8/aeGU7CCp8QqveuMQhwERrkcY58BnZBjH6a9xEQrWe0tEQmVN5/W4xU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thQs1-00041Q-Uy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 10:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ECF8A5C4A82;
 Mon, 10 Feb 2025 10:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD75C4CEEB;
 Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739182704;
 bh=LI59JQtyPV/HF12ShAdqHJX2HFF3NXc8/5bk+IONPNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nO62iX7S28S3shm7FksdxtyPreI2cGS6vi10HoQx+ObzswtwhDDeWQtpScBku+cfh
 gFhql5aAGvyOhNISZ5EmnbovIYanDSAbdfvNYT+CKFtBe6ShOJXPBPH62dZPUtSFsH
 /9DXMZ5Za8qeXXjLFCBjJMQBdOUmiKF9a8r90j1LbiNP7OuZPI3Fz/XJt3ZLjQ3cy7
 OMmb8sI73yuK0P0M54zqtxXza6o7rx4Jrr4iEiW7RQFwdUnO4k3Fsk2ZOmgg/S37TM
 /1gYxlDf5k72He6hNuyZAtv/irgoR/KpiU0WidVNS2SX97c5eB1TEpJO0gNkTo0o2C
 8nocUmRXPqJ7A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1thQru-00000006Cia-0CEy; Mon, 10 Feb 2025 11:18:22 +0100
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 10 Feb 2025 11:17:56 +0100
Message-ID: <336ab631c0636e419282a38e7dd5b5cfb52fcd2d.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some date tags are missing colons. Add them to comply with
 ABI description and produce right results when converted to html/pdf.
 Signed-off-by:
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thQs1-00041Q-Uy
Subject: [f2fs-dev] [PATCH 07/27] ABI: sysfs-fs-f2fs: fix date tags
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
From: Mauro Carvalho Chehab via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jaegeuk Kim <mchehab+huawei@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some date tags are missing colons. Add them to comply with
ABI description and produce right results when converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..e44bb614964b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -347,7 +347,7 @@ Description:	Used to control configure extension list:
 		- [c] means add/del cold file extension
 
 What:		/sys/fs/f2fs/<disk>/unusable
-Date		April 2019
+Date:		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that
 		are unusable.
@@ -355,7 +355,7 @@ Description:	If checkpoint=disable, it displays the number of blocks that
 		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
-Date		July 2019
+Date:		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
