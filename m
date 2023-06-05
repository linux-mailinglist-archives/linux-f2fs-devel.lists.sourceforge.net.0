Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6D721DDC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jun 2023 08:09:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q63P0-0005Gr-O8;
	Mon, 05 Jun 2023 06:09:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <korotkov.maxim.s@gmail.com>) id 1q63Oz-0005Gl-U4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 06:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h272X7GSP6SPOjaKaqpzvfEgDto2frNVTZG+ppqS1Co=; b=OP0RKupqjDaK97CVGskHmNEKwY
 0lF1RD6aoqMFK/jiRLwK7eSLbzeg5hRJKGX4cs6R8XQuBuHJm4GDrQEmgj08poy43/IyyvPnynBTC
 PvQIBO6MTn60+f3iPSB5kjXIlTe1yCNgnCm5b+G9FJCQOM1q5TZyzF+IEZGH4Y/c2kcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h272X7GSP6SPOjaKaqpzvfEgDto2frNVTZG+ppqS1Co=; b=a
 Er0fx3z7nrjzaHrCKfdRpNimAgoYTf2WwO4xcnSuqEjCuGJkITksk3pkbsPgWp9HvFMS9BxC7dNV2
 xQEptMmewVFqj7W/zbM+oiRgxg9R97gSegiTnBipdgLtkzBSOZI/D1OQrrxYF6zZ4yx6/0BU/EteT
 WO+7JfDJPtGD37k0=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q63Ou-0005fi-WF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 06:09:14 +0000
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4f505aace48so5505266e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 04 Jun 2023 23:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685945342; x=1688537342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h272X7GSP6SPOjaKaqpzvfEgDto2frNVTZG+ppqS1Co=;
 b=F3F1ZV4ZJQ0ideM7opwdr0iVDF3OKN44DPgligDsOblOLaiMREk8W9aXsfRUL5ExR2
 b4wJ8QnJk6CFm6ROt6S3kWb6RYMXrnUh0BGnDG+nz952J+EvDGDy3AnrGh9tnoI98Zhl
 Q3wvaNSIZ31NjivhPKLAkhsFxuXh859VTYg1r5c+JIgykYzD/itR0cqjoaqxsmQwdFs/
 YaWW8TkFqPOKd2jsV0m4xNbpqqGEKp2kyMpzPFBtTlIsbOX0rNdRqvyijIFXbpLNpML+
 3LEXtR5XSjJvIOHBUSVDTtN34P1mNutqAE6YqfyOH9RLEY28lngv9aWGwXwlReacpBEZ
 OYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685945342; x=1688537342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h272X7GSP6SPOjaKaqpzvfEgDto2frNVTZG+ppqS1Co=;
 b=YCR69KCVq+mUzsaPr4NBoQn7MJPjpEjmnZwi27jOpCTfc6h3Kr++RhmpAP8y47Df0u
 stxCiRUTNRORwFnNq/0z1se26dayPQhbw+jWm3rfGFhcr39e9tDlIfYlf9vnRxvggDdJ
 hJMoJ6cufMYIIjzC1pBnKUSufo4KkV7s5blC0h4rXKHU7oK71YCUU30xwxDHFXkiCsY4
 78PPM6L5QsdCX2KiZLA7kKXgQm7UNKbfulVuWi+wkwdFcdNUv8LMNHQRmdvHMUcg/cuA
 WBfKX3wkp+J+cpdOBpsnv+rwoM9OMaJHZhSvbVXbwbzl9x3j1Y1yXCuJeDuXzlh43jgH
 A1Nw==
X-Gm-Message-State: AC+VfDwUHL2HVrXiwoJz8clvWBKLSAaEto428mwGgOc7SPu4wh3XVyE8
 4HEvKFxP/YAotsFjdgHxTCoPQpl/9sZVbqZU
X-Google-Smtp-Source: ACHHUZ6yfRBVk9snRdaSoUB1+ky1u6AFlY9uKg3SNtl2u2AaFnkkIryr7SRiUUHMNPfq0LKAshV4cQ==
X-Received: by 2002:a05:6512:4c6:b0:4f6:924:8fa3 with SMTP id
 w6-20020a05651204c600b004f609248fa3mr5052899lfq.58.1685945341985; 
 Sun, 04 Jun 2023 23:09:01 -0700 (PDT)
Received: from mkorotkov.rasu.local ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a197506000000b004edc55d3900sm1002527lfe.0.2023.06.04.23.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 23:09:01 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Chao Yu <chao@kernel.org>
Date: Mon,  5 Jun 2023 09:08:53 +0300
Message-Id: <20230605060853.679169-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error handling cases, exiting a function without releasing
 memory Signed-off-by: Maxim Korotkov --- changelog: removed trailing indent
 fsck/dir.c | 10 +++++++--- 1 file changed, 7 insertions(+), 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [korotkov.maxim.s[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.48 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q63Ou-0005fi-WF
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: fix memleak in f2fs_create()
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
Cc: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In error handling cases, exiting a function without releasing memory

Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
---
changelog: removed trailing indent
 fsck/dir.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 4a3eb6e..793fe11 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -704,7 +704,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	ret = convert_inline_dentry(sbi, parent, ni.blk_addr);
 	if (ret) {
 		MSG(0, "Convert inline dentry for pino=%x failed.\n", de->pino);
-		return -1;
+		ret = -1;
+		goto free_parent_dir;
 	}
 
 	ret = f2fs_find_entry(sbi, parent, de);
@@ -713,6 +714,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 					de->name, de->pino, ret);
 		if (de->file_type == F2FS_FT_REG_FILE)
 			de->ino = 0;
+		ret = 0;
 		goto free_parent_dir;
 	}
 
@@ -728,7 +730,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		if (hardlink_ni.blk_addr == NULL_ADDR) {
 			MSG(1, "No original inode for hard link to_ino=%x\n",
 				found_hardlink->to_ino);
-			return -1;
+			ret = -1;
+			goto free_child_dir;
 		}
 
 		/* Use previously-recorded inode */
@@ -750,6 +753,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	if (ret) {
 		MSG(0, "Skip the existing \"%s\" pino=%x ERR=%d\n",
 					de->name, de->pino, ret);
+		ret = 0;
 		goto free_child_dir;
 	}
 
@@ -804,7 +808,7 @@ free_child_dir:
 	free(child);
 free_parent_dir:
 	free(parent);
-	return 0;
+	return ret;
 }
 
 int f2fs_mkdir(struct f2fs_sb_info *sbi, struct dentry *de)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
