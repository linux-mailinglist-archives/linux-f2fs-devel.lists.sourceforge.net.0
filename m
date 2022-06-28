Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAB55F20B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jun 2022 01:47:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6Kvw-00084u-Lp; Tue, 28 Jun 2022 23:47:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o6Kvu-00084j-EN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 23:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbZeWglBrt5ol2WYPpltR7b090ojlF4jwbRpiER8s4w=; b=MVGqIfARpEZVMgUNWV6eTMyDIP
 NxioA4vQqtuTqzRSXkwzJF+tft5KTUvhFd+ks7kb1sDnpkuixWNdas5SFvpvn2jdexGJS0zQpkm9d
 cloOQYkEZ85HD1/o51BVgy1NXSldX5S9DBY2/c0rkIoRZcHJwjsWu6fGZhdiTHOeg0F4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GbZeWglBrt5ol2WYPpltR7b090ojlF4jwbRpiER8s4w=; b=cxDg1xsIb2XA2gaXoUGQnszYFC
 737xp6TZTtwtN2ee9dn4g1Ka+5BaFwKHanpYv0J93+eu26fUyFu/x7wigXSiLt9OKrCk5kmdcwMqr
 NebxAF+zUliAnMp6G2JvsVi55hquRo5DDyqtQrFRh26FEUdujC6HIwtQ6ylEcLw7O29g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6Kvs-0002dT-DO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 23:47:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A0F761B8A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jun 2022 23:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE5C341CD;
 Tue, 28 Jun 2022 23:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656460057;
 bh=+ZRax8MPEredU/1+Bs9dXUbhcOVmW3HrTA16lC6ZIFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oMprKlEtoRQtiOEkQZLQPYX/++Jdxk1iXoWh19FbjWoBjWja654lAIhS/a8jIzVps
 x10KsNGyFNxobidocUKrI4JWEw1KRASfgHWCKV8n1+JATdeGp1gBBSn24tsb8m6BC4
 LOyqf1oGb8bQki512pUYU0BW7O/jlvjrfDjIQlvKEn8u3grIkT4VDU1qj8Zywo4jr2
 eN4OFy4XvsLb6wNEC1Hx3BoeCMelqMuLcY1mErbkz1HPRNuKQcgMSXbfza5kFbuPGB
 yxLkdvm/MTpJ6YxyOYp05cwSwqJcIZL3ooQNVseEdm+2RvQgLcOQK2J9+TinIHjCh8
 G8haSdzS9pCaA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 28 Jun 2022 16:47:33 -0700
Message-Id: <20220628234733.3330502-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220628234733.3330502-1-jaegeuk@kernel.org>
References: <20220628234733.3330502-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a sysfs entry showing the unusable space in
 a section made by zone capacity. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++ fs/f2fs/sysfs.c |
 10 ++++++++++ 2 files changed, 16 insertions(+) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o6Kvs-0002dT-DO
Subject: [f2fs-dev] [PATCH 3/3] f2fs: add a sysfs entry to show zone capacity
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a sysfs entry showing the unusable space in a section
made by zone capacity.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/sysfs.c                         | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9b583dd0298b..22c1efd49773 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -580,3 +580,9 @@ Date:		January 2022
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Controls max # of node block writes to be used for roll forward
 		recovery. This can limit the roll forward recovery time.
+
+What:		/sys/fs/f2fs/<disk>/unusable_blocks_per_sec
+Date:		June 2022
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Shows the number of unusable blocks in a section which was defined by
+		the zone capacity reported by underlying zoned device.
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 4c50aedd5144..6eeefe60a7af 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -713,6 +713,11 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 	.offset = _offset					\
 }
 
+#define F2FS_RO_ATTR(struct_type, struct_name, name, elname)	\
+	F2FS_ATTR_OFFSET(struct_type, name, 0444,		\
+		f2fs_sbi_show, NULL,				\
+		offsetof(struct struct_name, elname))
+
 #define F2FS_RW_ATTR(struct_type, struct_name, name, elname)	\
 	F2FS_ATTR_OFFSET(struct_type, name, 0644,		\
 		f2fs_sbi_show, f2fs_sbi_store,			\
@@ -811,6 +816,8 @@ F2FS_FEATURE_RO_ATTR(encrypted_casefold);
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_FEATURE_RO_ATTR(block_zoned);
+F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, unusable_blocks_per_sec,
+					unusable_blocks_per_sec);
 #endif
 F2FS_FEATURE_RO_ATTR(atomic_write);
 F2FS_FEATURE_RO_ATTR(extra_attr);
@@ -919,6 +926,9 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(moved_blocks_background),
 	ATTR_LIST(avg_vblocks),
 #endif
+#ifdef CONFIG_BLK_DEV_ZONED
+	ATTR_LIST(unusable_blocks_per_sec),
+#endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compr_written_block),
 	ATTR_LIST(compr_saved_block),
-- 
2.37.0.rc0.161.g10f37bed90-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
