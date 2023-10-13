Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1BA7C903C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Oct 2023 00:25:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qrQaf-0007iR-BE;
	Fri, 13 Oct 2023 22:25:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qrQae-0007iF-0Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Oct 2023 22:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/GfpOs8gW0KsSJr+yd9IproIUP4Gx7slhdnmYQ1Acqs=; b=TbHrN3xV97loXqVCyQ5h2rb8Jj
 jFojvTyKdaZ1Wyt+MIaklR265jNrYAJzFftQGfFWhowkQxtM/7X6UjLO66jH8OlvldhThrBTOYnYV
 M2ZSPuhogPp1B0oKYkvaFXZYl5GuXeWpWstn+2ACXzLRHGd+C82sgH2H0s2oo071cVmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/GfpOs8gW0KsSJr+yd9IproIUP4Gx7slhdnmYQ1Acqs=; b=c
 5n7BTdWoc0MJlB4Y10DYSA/h50tTGEAOM+ACFlh3XLYOdCi7kVi44LRCJ2xwRmmUO8CD9eQ0mpHJN
 AlyxTgQgME4ezthbbLrGr6hdXou++ZI5ux257pFIjG+suKZEd6uvzNKzv/bGQ6whUqZa28G9LkpsG
 7AgZeweLZcX5AZwM=;
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qrQac-00EOFm-6v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Oct 2023 22:25:03 +0000
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5aa7fdd1420so841938a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Oct 2023 15:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697235896; x=1697840696; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/GfpOs8gW0KsSJr+yd9IproIUP4Gx7slhdnmYQ1Acqs=;
 b=OPf5RqMtVWAssab/Me2iIBPT8A975gyMD4Wj1JIXQe0CtynX4FJ74Q/vU0JqdkNf67
 WCYv4ut+3GkJ61KqUW4tExwKMKahK5IpanOX9TCqJlMqiRNnnEtP/Fy/VJhy/jJOtwd5
 3iD4a/eeyKGEiWfeqhG6aJNyI+npx44khWZmLTC6h3LUBzi6YcF5UQDvv9cY/lFCTjDC
 OkcEhKW+MXqdXNwlrHGeHmZ9Og9wniP8W+l9Fxd3KwU9VUyzaQpZjlZioxwIkaK/P34V
 a0jcKVt3K75gsosmMuxbDG+nMRNjaqoC0kCRp7xwmfBR6iOX+xZJudxgkncOOWxT8aQe
 x52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697235896; x=1697840696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/GfpOs8gW0KsSJr+yd9IproIUP4Gx7slhdnmYQ1Acqs=;
 b=kfIluzAITll1laGvAmkx9K+GZEV5juz05me4vznP+sZ1evULpwstdFPKkcPX1U+oT8
 r+EKDXvqyaUhaKnvMHso01tJQBbC258b2SFvRlNH0d5sXgvPARVubJqUd5amPHA9MLx9
 XOdAlx5UCuuAqnTsSDhgip+Y0trI4GG2Girbge2HT2SbDUro0Unj9Llu6vyP138BNxU5
 Ipg39qyIoR1kt66cJU2799kQO6P7PAvyXEDadwmopkvzOyhGGxnMswSX7VHx9BRr6vib
 oNPXumJWIPKFG761Y0z1hplIYm8Csm4ce/ZavdU/5TfjZudnGudnX6o/gXpd5gL45+H9
 zfmw==
X-Gm-Message-State: AOJu0YyCrkUUF5bosYTK/jfftYPaOTtCi74WYgTHvJSdJ0mbml07jfOM
 TJNlbfJDlKbj+DY+s6gqzNytExpxXkk=
X-Google-Smtp-Source: AGHT+IEKA51Ytc7B2fQRyrDt9VVbdMSfwkcL73/KPExzkdZ3lelRQN0gOds3ufJ/JwBLvjne7Fgbqw==
X-Received: by 2002:a05:6a20:6a11:b0:15a:1817:c493 with SMTP id
 p17-20020a056a206a1100b0015a1817c493mr28467802pzk.39.1697235896437; 
 Fri, 13 Oct 2023 15:24:56 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:86c0:c2f7:f3ba:33e1])
 by smtp.gmail.com with ESMTPSA id
 je6-20020a170903264600b001bbb8d5166bsm4366891plb.123.2023.10.13.15.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:24:56 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 13 Oct 2023 15:24:52 -0700
Message-ID: <20231013222453.240961-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Need to initialize allocated node areas
 after memory allocation. Signed-off-by: Daeho Jeong --- fsck/node.c | 1 +
 include/f2fs_fs.h | 2 ++ 2 files changed, 3 insertions(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qrQac-00EOFm-6v
Subject: [f2fs-dev] [PATCH] f2fs-tools: initialize allocated node area
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Need to initialize allocated node areas after memory allocation.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/node.c       | 1 +
 include/f2fs_fs.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fsck/node.c b/fsck/node.c
index 3761470..6508340 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -127,6 +127,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 
 	node_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk);
+	memset(node_blk, 0, BLOCK_SZ);
 
 	F2FS_NODE_FOOTER(node_blk)->nid = cpu_to_le32(dn->nid);
 	F2FS_NODE_FOOTER(node_blk)->ino = F2FS_NODE_FOOTER(f2fs_inode)->ino;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 3c7451c..7e22278 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1826,6 +1826,8 @@ static inline void show_version(const char *prog)
 static inline void f2fs_init_inode(struct f2fs_super_block *sb,
 		struct f2fs_node *raw_node, nid_t ino, time_t mtime, mode_t mode)
 {
+	memset(raw_node, 0, F2FS_BLKSIZE);
+
 	F2FS_NODE_FOOTER(raw_node)->nid = cpu_to_le32(ino);
 	F2FS_NODE_FOOTER(raw_node)->ino = cpu_to_le32(ino);
 	F2FS_NODE_FOOTER(raw_node)->cp_ver = cpu_to_le64(1);
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
