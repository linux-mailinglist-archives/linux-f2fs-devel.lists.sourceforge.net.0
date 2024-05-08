Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCD8BF400
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 May 2024 03:21:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s4VzJ-0003u6-RV;
	Wed, 08 May 2024 01:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3BM46ZgYKAMMm0x1nwpxxpun.lxv@flex--drosen.bounces.google.com>)
 id 1s4VzH-0003to-T0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 May 2024 01:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glJOT4lnAd2o6XqfGK+RHDjkgodcKsd0r3W3vjDdtw0=; b=XRIIyKQBqb9ktxFafIYN35NEq3
 esTr0wlfe+tFvDhSKilg2mG97bu2nzyftxdVBG+mkmP6vPkC2Xr2UZMsyP0uCaVUbaxQ9lEHypWaz
 XnY28UnkX1ggEjjIv7fGwkGA+2lNXXFXjwVB49Me5PyuJ8i0qEFX8HKAHEodiKIdmAH0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glJOT4lnAd2o6XqfGK+RHDjkgodcKsd0r3W3vjDdtw0=; b=cFf370uugXHbgMG0SsapZic3ft
 XvP1icM9cBgozAjQG6IyY6mumSlS3LWgy1Z0ZoIWhvBWRGaaKy/2fmuPmU2AEKFmecU+abTbYkp0M
 fIayhpkU8WFDcsWIe/ox877HtkASnYkMHxtyUnhV8tge/Jo3ZjKyRF3fV2MgOVIbn908=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s4VzI-0000BB-7g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 May 2024 01:20:52 +0000
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-78ee7776740so495254485a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 May 2024 18:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715131245; x=1715736045;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=glJOT4lnAd2o6XqfGK+RHDjkgodcKsd0r3W3vjDdtw0=;
 b=Z+nv420dZyf8lEMqFYQasEAz55DrA8hEZB9QSocGPhCSmbZmg6NKPwL8eEeuvffV9e
 7zcT4aYJcQKc4kJ0GnRTu427r7VVHmIlpHQLFVq8txmCSPErscEqn3aZrHLzjPBqzi6h
 FvjLyNlkEQX6hu8OEnqCdpsyRRuYls9M8k6zY4idEAjon+HaGo95kpiUk6L7k+OmDiic
 cMm27SxlHD2AdIY6MWOsLpwDvml6lnMFB989QuGJP0v0UVwB0lWf0ILibeCo5FzUj+VD
 /gqraRaa99qFC77BEWAkrCQXhMm+DB7sZJWpUn7LCxWLz2fW3e40b3hrY2bsbAzYPiSz
 Dh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715131245; x=1715736045;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=glJOT4lnAd2o6XqfGK+RHDjkgodcKsd0r3W3vjDdtw0=;
 b=h8qMqCn3piJ9nLDQx9qnibe0dKqCmE3YcjVLiMWETLsiflLUpK6Qtffr6MHvGX9vsE
 e893jppLcDfzDwdcwEyas9WN2wu3pjBSkE4Hs4x2y7QNeyboRm8HB78UCdcSIA1QUUHE
 SYpHT+odEFs8/2tAanUdFqzEJZZfkqb+A/Cf/GuALAGtYcig8yCS/j1y3FIg6BQO4BAP
 1i5rEYfDq3j53xidUbUN9cWWTcaRayoTXaIqL32MFyp0IyJ26ct0d8S0lRgPWf263taX
 /4b0zf0j9Opg0m/gYzt81ZdEhcl67qEH1h/+ahIbVGsO8ItW/L+HM+pes2NbW3Qlxi53
 //Og==
X-Gm-Message-State: AOJu0YxUs2jX0+a2W3LzHDRoV0A+4uW0ZUwT4pIFP9SRY4n39N47ahCb
 4e8iIqOn/8BCGbzUYbQ5osb+BBhk3j2jDZM0Kmp7RoN6Y/I+UIeYA3BeXTQo3eb82tZ/HkK10LD
 +2bxieruISSM6dh2SwRPNMzhcN8K63ccGlnb10DZe4MNdmDYVt2J51pQvoJERgwlg9vdoSHAimy
 vBkafj+K9lZuPJDsUdqAukXTdesY4fqEHZC0KUKbvGCSxV1fsXmHDl8A==
X-Google-Smtp-Source: AGHT+IEjwiLumyHr6sL5Ifpx/ozE6pDR96+rh0Y2lf4phqhl6BfISPBCqesG41MgQt9dOzywd32O9LbR3+M=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:e646:fd15:5293:eb6f])
 (user=drosen job=sendgmr) by 2002:a05:690c:dd1:b0:61b:eb95:7924 with SMTP id
 00721157ae682-62085d42616mr3888797b3.3.1715129860799; Tue, 07 May 2024
 17:57:40 -0700 (PDT)
Date: Tue,  7 May 2024 17:57:04 -0700
In-Reply-To: <20240508005704.765813-1-drosen@google.com>
Mime-Version: 1.0
References: <20240508005704.765813-1-drosen@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240508005704.765813-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Xattrs for files with inline data were being skipped. This
 dumps those, as well as xattrs for folders. Signed-off-by: Daniel Rosenberg
 <drosen@google.com> --- fsck/dump.c | 25 +++++++++++++++++-------- 1 file
 changed, 17 insertions(+), 8 deletions(-) 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.202 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1s4VzI-0000BB-7g
Subject: [f2fs-dev] [PATCH 2/2] dump.f2fs: Fix xattr dumping
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Xattrs for files with inline data were being skipped. This dumps those,
as well as xattrs for folders.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/dump.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index f60f6f9..3bd17e3 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -377,7 +377,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 }
 
 #ifdef HAVE_FSETXATTR
-static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
+static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int is_dir)
 {
 	void *xattr;
 	void *last_base_addr;
@@ -431,8 +431,14 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 
 		DBG(1, "fd %d xattr_name %s\n", c.dump_fd, xattr_name);
 #if defined(__linux__)
-		ret = fsetxattr(c.dump_fd, xattr_name, value,
-				le16_to_cpu(ent->e_value_size), 0);
+		if (is_dir) {
+			ret = setxattr(".", xattr_name, value,
+							le16_to_cpu(ent->e_value_size), 0);
+		} else {
+			ret = fsetxattr(c.dump_fd, xattr_name, value,
+							le16_to_cpu(ent->e_value_size), 0);
+		}
+
 #elif defined(__APPLE__)
 		ret = fsetxattr(c.dump_fd, xattr_name, value,
 				le16_to_cpu(ent->e_value_size), 0,
@@ -462,13 +468,15 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u64 ofs = 0;
 	u32 addr_per_block;
 	bool is_dir = S_ISDIR(le16_to_cpu(node_blk->i.i_mode));
+	int ret = 0;
 
 	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		DBG(3, "ino[0x%x] has inline data!\n", nid);
 		/* recover from inline data */
 		dev_write_dump(((unsigned char *)node_blk) + INLINE_DATA_OFFSET,
 						0, MAX_INLINE_DATA(node_blk));
-		return -1;
+		ret = -1;
+		goto dump_xattr;
 	}
 
 	if ((node_blk->i.i_inline & F2FS_INLINE_DENTRY)) {
@@ -480,7 +488,8 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		DBG(3, "ino[0x%x] has inline dentries!\n", nid);
 		/* recover from inline dentry */
 		dump_folder_contents(sbi, d.bitmap, d.dentry, d.filename, d.max);
-		return -1;
+		ret = -1;
+		goto dump_xattr;
 	}
 
 	c.show_file_map_max_offset = f2fs_max_file_offset(&node_blk->i);
@@ -516,9 +525,9 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	}
 	/* last block in extent cache */
 	print_extent(true);
-
-	dump_xattr(sbi, node_blk);
-	return 0;
+dump_xattr:
+	dump_xattr(sbi, node_blk, is_dir);
+	return ret;
 }
 
 static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
