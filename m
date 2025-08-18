Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E2FB296C1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Aug 2025 04:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Bv03oQ7kkei/hwwWf4we0+x1mT5b606ICLShL2oyFA=; b=NsEbM/JhnQtMHDXkufoRgbH5hh
	U0y5Uwdwf8+wz4+PvdGAynV3KHDnto1e/y5ktt/a81xnaPxTW9fwvUPTZdjMYPQjV3wxYiqWywZ0B
	A9LqLWl1u5aObGIiZwBlmBMT9C9SQG30JP/Q33aR/qU66W8g/Zxbt0oAL1WydWVmcIsw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unpJv-0006V1-0l;
	Mon, 18 Aug 2025 02:09:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unpJt-0006Uu-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 02:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=utIeDaDRuQ9sXk7ockLQUyDG7wqAZcWERUYfOcy6rHg=; b=UNBY2zTwgZi971fv9LpdatrMZc
 479v8ZvlGGc2GFmSoI8BagoIPZarvKr2JFH+4HhPalV2MyHGu7L5hWzmTmNRKX9yvP8Tsqbu+BSyZ
 Mmav6IcpZE0BqJWDDFY3WBdUI/fnt5n+S718wFkSyQt6/Yj35aoigI/JHdqU/oOOfD7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=utIeDaDRuQ9sXk7ockLQUyDG7wqAZcWERUYfOcy6rHg=; b=AUVlYZbC895gUQXSjcbOlGpuJV
 tTn6uMiuLwWHDTJ+rmJcUNU3k1JbH0PV6KpPvaM+4aGrePZiKz50AZDSZYwttX3kAxwRcPpLSijys
 zkhc5OYCf7MATr9SJ6Pghz0G6d0SVNeLyVgN2XNTJ18q4XQTfKRZKeRwXGc1UYIAEFsM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unpJt-0006F1-5D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 02:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C48A600B0;
 Mon, 18 Aug 2025 02:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F4EC116D0;
 Mon, 18 Aug 2025 02:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755482986;
 bh=PQtomDfNLffO/JV0pTF/9gpLXmzy60eG5zevRwteCCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T4U2XFJN93qi2ClpA4Czgw7kvLkCju99lUl9Rii5qI1TrUloUKaO6iDrDgLbXEwxT
 XdbxwlTkx2AgMX7pJMGZQHHm/hs1Pa/jDCzAhPJnGw+e7IsgUENY569xthoDIAczUj
 F0RIHQg9uLxc2UBJrWC8JUcBe9NpaFAYpGV3r7L1kZeUfTX0xpUEfjIPKsUNysrU3P
 c0h8rno7SLRoDAaogcO84+AuUE3oqMOD8z6QfZk91QEwiyOhq7QfWzGJwXR0J/61Nc
 s+sq49yVlG30eIicJhsKgwiKaX5xNmLT0THJ0CMsVCOy6R2AbG5ZCNv5VOhHrVyswV
 6/QOjvvjCwWRQ==
To: jaegeuk@kernel.org
Date: Mon, 18 Aug 2025 10:09:39 +0800
Message-ID: <20250818020939.3529802-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250818020939.3529802-1-chao@kernel.org>
References: <20250818020939.3529802-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The mount behavior changed after commit d18535132523 ("f2fs:
 separate the options parsing and options checking"), let's fix it. [Scripts]
 mkfs.f2fs -f /dev/vdb mount -t f2fs -o usrquota /dev/vdb /mnt/f2fs quotacheck
 -uc /mnt/f2fs umount /mnt/f2fs mount -t f2fs -o usrjquota=aquota.user,
 jqfmt=vfsold /dev/vdb /mnt/f2fs mount|grep [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1unpJt-0006F1-5D
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to allow removing qf_name
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Hongbo Li <lihongbo22@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The mount behavior changed after commit d18535132523 ("f2fs: separate the
options parsing and options checking"), let's fix it.

[Scripts]
mkfs.f2fs -f /dev/vdb
mount -t f2fs -o usrquota /dev/vdb /mnt/f2fs
quotacheck -uc /mnt/f2fs
umount /mnt/f2fs
mount -t f2fs -o usrjquota=aquota.user,jqfmt=vfsold /dev/vdb /mnt/f2fs
mount|grep f2fs
mount -t f2fs -o remount,usrjquota=,jqfmt=vfsold /dev/vdb /mnt/f2fs
mount|grep f2fs
dmesg

[Before commit]
mount#1: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
mount#2: ...,quota,jqfmt=vfsold,...
kmsg: no output

[After commit]
mount#1: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
mount#2: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
kmsg: "user quota file already specified"

[After patch]
mount#1: ...,quota,jqfmt=vfsold,usrjquota=aquota.user,...
mount#2: ...,quota,jqfmt=vfsold,...
kmsg: "remove qf_name aquota.user"

Fixes: d18535132523 ("f2fs: separate the options parsing and options checking")
Cc: Hongbo Li <lihongbo22@huawei.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 465604fdc5dd..07f6c8cac07a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1219,8 +1219,11 @@ static int f2fs_check_quota_consistency(struct fs_context *fc,
 				goto err_jquota_change;
 
 			if (old_qname) {
-				if (new_qname &&
-					strcmp(old_qname, new_qname) == 0) {
+				if (!new_qname) {
+					f2fs_info(sbi, "remove qf_name %s",
+								old_qname);
+					continue;
+				} else if (strcmp(old_qname, new_qname) == 0) {
 					ctx->qname_mask &= ~(1 << i);
 					continue;
 				}
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
