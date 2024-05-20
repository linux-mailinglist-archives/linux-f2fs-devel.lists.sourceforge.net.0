Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1888CA5C3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2024 03:29:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9EJ7-0000VR-WA;
	Tue, 21 May 2024 01:28:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3hN5LZgYKAKkMaXbNWPXXPUN.LXV@flex--drosen.bounces.google.com>)
 id 1s9EJ6-0000VI-J8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 01:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ru+wQ5r6TqK1VtPczJ/wC+gyqvWJ9+iq4tYqKjQpG+Y=; b=Bw5Ix7bZcXv3EH9z2dxgY278V9
 dUuaaYHyQjR0M2rz862C3gMMArUZoPFF3IPeNY6+naKmV5s8OhpxnzemJeTgh+4HDNB93R8iYP4Im
 uzX70mH7oPJ173d31+dIqRbISAwx6Nq5mcH/rww9JDRQatilImF9IkPx8rhUGm24o/QE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ru+wQ5r6TqK1VtPczJ/wC+gyqvWJ9+iq4tYqKjQpG+Y=; b=CB5Ei61nR3Fmqi7GpNUOtflI6K
 Kfj2zMy2/vK19/N6CVcxG/0zJFJmGJU/X3gBfyLiF/Hgt2/L5Tu0/AQ4f1c19JBb2ttccbS9YywBw
 D8WcvnVFh/ninpLtfQM4LJj83ToQ3rfLo2RbSSFADaCdLWpRn/RYNK7Z/1suliYKhjL4=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s9EJ7-0000xF-QQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 01:28:49 +0000
Received: by mail-ot1-f74.google.com with SMTP id
 46e09a7af769-6f0ff1a4fddso10714938a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 May 2024 18:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716254923; x=1716859723;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ru+wQ5r6TqK1VtPczJ/wC+gyqvWJ9+iq4tYqKjQpG+Y=;
 b=1dICw81ibQhL793dfAsMe54I1QuZOv6UhftbkXzPhcrVVEdUCzOT/e6nVNRvASYd4l
 7VQdRY3By/Gc3cqB9ne27mRJueAIpxEqc+jEktXW+zf74Ief2w1F3UZPFmQT/Z1pKZFj
 lwM3YSd3BIMNXe0trZmZY1RyIWYlGwDYlZJ/NooTHLCc915NM2UicBPaoO3tiBTN9VWW
 DC+PUwAzxfiNeGNIa2bXjm9jd7Z3XhViXkjiNkzCGwgH/tOtqYdUpl2scEqZmnEzdIYy
 B9ugEd5Cw1neTHZ4tsa3CANCsYTTKTtWMfDkbh0TSGTzHELPaS55ABGC/CRrW+cGBlmO
 pvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716254923; x=1716859723;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ru+wQ5r6TqK1VtPczJ/wC+gyqvWJ9+iq4tYqKjQpG+Y=;
 b=dLjNZAJlfQ7J8xRhYdf0nRwCKUSYH+N9j8DiEY7YyItBDR2C+pJ0pwPt4vVfjjWMh6
 vMykE7zATUalIaPd/zFDMpXoVfk4pA8fJzfRL5MPK127xcfMQOPSTivlpGhnlR/DbpEo
 n0K8VBoX7CVzTX6NXRHyx4Q3HTuO2ba/bAI53FADsMAWECmlUenMXP86qCmz3v02s3Mv
 2/AN+lWKgRf7N5kas82aJgp0ZlQL/Qkva+/GM/+vggn5a79NMk4rQXIL+d2YS8caMepm
 MFfITuNShVPaH9am3SAWjdrIh6LwRAYP7JlIuOz2wcR/iAAaLV1OosqTsY6EjMwpo1Hf
 spkQ==
X-Gm-Message-State: AOJu0YxEYJY8nsok3ZqlJPerf7i4LtSj+OhTDl6/LuLTyweAffoYi1/a
 BL2m5NmZonMwX1hxA827Xi1jzyJeu7mzTHtoC89YXzltsRfGWaxKgSkHUW6RUrW5YPncvyN3zOD
 Nc9TchZkid/p9071zSVxIK1vFWC6l4GNLfeB/Dc3xDCNLQM16s+ow/L4f2e8pFbnjZaofwTOQvg
 cH0Snob+0lzz2ype4s03pzUdznhJ13N5buk9+AIpksa7TbDU4rpAOnQg==
X-Google-Smtp-Source: AGHT+IFGYrA6V0fot5dxEqdcDuuPzZ+/RK1T7khBoTkyrvQJY2WNMfMajILYoxKFqMqc+Uj0rdGIsEhSi6o=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:2a75:ea5e:7aed:661e])
 (user=drosen job=sendgmr) by 2002:a05:6902:10c2:b0:df4:9f33:314 with SMTP id
 3f1490d57ef6-df49f33163emr1693360276.13.1716248196349; Mon, 20 May 2024
 16:36:36 -0700 (PDT)
Date: Mon, 20 May 2024 16:36:29 -0700
In-Reply-To: <20240520233629.2505375-1-drosen@google.com>
Mime-Version: 1.0
References: <20240520233629.2505375-1-drosen@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240520233629.2505375-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net, Daeho Jeong <daeho43@gmail.com>
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.74 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1s9EJ7-0000xF-QQ
Subject: [f2fs-dev] [PATCH v2 2/2] dump.f2fs: Fix xattr dumping
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
index aecc293..17680d9 100644
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
