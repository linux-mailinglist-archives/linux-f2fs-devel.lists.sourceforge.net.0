Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A8BCFA28
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 19:24:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8QfPyEwAOIyrqrPsRTr7mRJY63oQzrkTnXCTsgEF3BU=; b=NdVv1utX8yJHQFDJBwC9mtV/6C
	eP3SQEIn2DxtbBY+9LZDvEeWuPS3eFo+g2t7sDNmlWHgVeHTNjf+iV5Wu9q2Ewy6MwhSNs8E50rAf
	99r5C9BdgGLnj+AREdoy8dS4fmBSr8P4LQLZatrrIGK99qtSMS+Dm6spp1WbLxJxwz1Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7dKi-0008Vq-Jg;
	Sat, 11 Oct 2025 17:24:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogunix@gmail.com>) id 1v7dKZ-0008Vc-6K
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 17:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nr75ZFbZ4/qx4rlwkOcGtUvCvFckrNfl3ESmCUVAzBQ=; b=Nj71JHtr1qA6jcjMebqXou60KB
 CpftBGEj7lrR6dvp6cdFlsMNvyW4hZ/yO6Lk7L+LtykzR/ATHIod0MWr7tdRjuYoT3oh2ppR7Uuv2
 28boy+yuHEMiWCX9DorB3qzdpkqoKxjjeJYG6P+QJhDScezTOVsJa8OVGrArj4rhKcmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nr75ZFbZ4/qx4rlwkOcGtUvCvFckrNfl3ESmCUVAzBQ=; b=m
 41DZSArxYy5Huru6GPju9ep4e8adzlZBdY+EQ+zlDbwuqGonDALLFLpwl+NkEWW7SsDygjIPi7ldK
 k+joYaSOk7bfeeTIbiLlhM+TzvxoWeIlie4N5zPoGt91PslLEFmWwa8FaIBldpOVGZbbS8ygGMR6m
 4aJCtrMB7TJniBJw=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v7dKY-0004tf-EU for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 17:24:31 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-26e81c17d60so6233665ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Oct 2025 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760203465; x=1760808265; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nr75ZFbZ4/qx4rlwkOcGtUvCvFckrNfl3ESmCUVAzBQ=;
 b=bC6whphuO63wjKEI1rJyuVBj7Y9FL34KgK40eZOoYjKhW1mOOLNNBxkoVOcm07+Bsr
 62u+kqR+R44ghRDjjbssGHqgRMtNAdSsj8KewxxkhmDVSs5wtney+WLqatejKvJMutNL
 rFF4RRnhHUtUs5TeEZ3sIxnLi9XJ2I+U7JmGdtpXA6jLs3JHAsiRk3vquS5CE0VOnojp
 iMdTs4+UnlAPXGiH978Nc4N2qCgEXNiCdEAGG3BCRntgrlFQTCz2BTVnWRpTHPvamtvy
 Z/bb2gIsxaDO2+1IHv4wHEwPs9KCQN//mUd3Euv6cCWEuKU3pfX3HZG8cOQjqO7pp71e
 iqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760203465; x=1760808265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nr75ZFbZ4/qx4rlwkOcGtUvCvFckrNfl3ESmCUVAzBQ=;
 b=ixF8ADRBCy4r5N9DZOqIeTUOkR0Uslck7dv3HRwEgnXGQsEmv0KWsc84xx4Al9QC+w
 6k9gkaaFoJuv0sQppQ8MmK4QF8O9kXcWFAXxxXDlWv5G2e3aXwR+bAtkTQL2uqc+6car
 MWAhntqBWrE3kxTtDgqIXY8n7dI4bsKsxdV0dh6lPj+5EOEpe/Geg1RV+dIgbS47deE1
 WxdIS4bgMhoPtc2nuHgglNJqTIKVIZ4nEFS94Etfem1AIo9ODhk1Y/ZOWUQjuCwGjp+4
 4OsD/7VggU3u/jOkgNKSLwYRcRffvbxl9CeWjRBKWIHDnvaEsUETHQ0wUkeLA9hEGH/A
 oD+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpklbPr4QRs8LFqC/r8xptHe5zT9+WGmfzMkmpRI6Xzt4+bvwpDUv+7gOUu+HNjP/ImSAqzA/XUMPluOP/9WoH@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz4cokJsF2z9vVWehoobdKzbOOU8BbQLEpP+ruEWJ3jrExwWOj+
 OwjbxoeZueUiMTwcQhtnDutxoSWkhyCrF0ud+o/d/nDc1ngF/XwFHc43BiAHo2BR
X-Gm-Gg: ASbGncuvCAa+k2uRJT6KmJAiUInfIYUGD/cx0kajCiZGIESPY+NiOk/aZMssJ4Dr/XK
 khITjsdlmwa21N1+33IC6ObJ3FSZj9k2O5Bo0i25rz6eiJqq1QW1suhu8ET6IsgjOgWejrgwphV
 1bF4Z8BgcdUXlO2C4I9HoBPKuPRSU3irZJpxhqqTLhacUyPwiui2C5jyOOpCUOhcdVB5e7jqKHy
 yGXZgJnJRdHBv1D6nkjgKonaPnVvpwES5DrNKWMABbaNIyQG624L3iNNoDg6opiJyWskW/cIwRG
 hRJFioHP/KI8KmdwTiXq+MZmgLUEFRTf9y8MNixzJ7Y1Mp+i+huW119c153zgUga8jme3n1hN7U
 bXZlG2M2naIhwgq6QWrQRKA3tTYbILOrOeVj463B6CCXGvx/Fm6i3wWwjUY8=
X-Google-Smtp-Source: AGHT+IHDS/1rGu/qMTg3HP/g+EzjHB0vBFkMKwHWzTIyGYYPbY2si4NNPBadPtSI7F369JWGXkWS7w==
X-Received: by 2002:a17:902:c950:b0:26a:3c75:5241 with SMTP id
 d9443c01a7336-2902744bc67mr119102425ad.9.1760203464660; 
 Sat, 11 Oct 2025 10:24:24 -0700 (PDT)
Received: from elitemini.flets-east.jp
 ([2400:4050:d860:9700:ff1c:3f53:c7ab:f611])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034dea083sm89355075ad.24.2025.10.11.10.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 10:24:24 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Date: Sun, 12 Oct 2025 02:24:15 +0900
Message-ID: <20251011172415.114599-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Sphinx LaTeX builder fails with the following error: Markup
 is unsupported in LaTeX: filesystems/f2fs:: longtable does not support nesting
 a table. Wrap the ASCII tables in literal code blocks so that they are
 rendered
 as code instead of interpreted as tables. This fixes pdfdocs build failure.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nogunix(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v7dKY-0004tf-EU
Subject: [f2fs-dev] [PATCH] Documentation: f2fs: wrap tables in literal code
 blocks to fix LaTeX build
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
Cc: Masaharu Noguchi <nogunix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sphinx LaTeX builder fails with the following error:

  Markup is unsupported in LaTeX:
  filesystems/f2fs:: longtable does not support nesting a table.

Wrap the ASCII tables in literal code blocks so that they are rendered
as code instead of interpreted as tables. This fixes pdfdocs build
failure.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 106 ++++++++++++++++-------------
 1 file changed, 57 insertions(+), 49 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..80f94f309cea 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -188,34 +188,36 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 enabled with fault_injection option, fault type value
 			 is shown below, it supports single or combined type.
 
-			 ===========================      ==========
-			 Type_Name                        Type_Value
-			 ===========================      ==========
-			 FAULT_KMALLOC                    0x00000001
-			 FAULT_KVMALLOC                   0x00000002
-			 FAULT_PAGE_ALLOC                 0x00000004
-			 FAULT_PAGE_GET                   0x00000008
-			 FAULT_ALLOC_BIO                  0x00000010 (obsolete)
-			 FAULT_ALLOC_NID                  0x00000020
-			 FAULT_ORPHAN                     0x00000040
-			 FAULT_BLOCK                      0x00000080
-			 FAULT_DIR_DEPTH                  0x00000100
-			 FAULT_EVICT_INODE                0x00000200
-			 FAULT_TRUNCATE                   0x00000400
-			 FAULT_READ_IO                    0x00000800
-			 FAULT_CHECKPOINT                 0x00001000
-			 FAULT_DISCARD                    0x00002000
-			 FAULT_WRITE_IO                   0x00004000
-			 FAULT_SLAB_ALLOC                 0x00008000
-			 FAULT_DQUOT_INIT                 0x00010000
-			 FAULT_LOCK_OP                    0x00020000
-			 FAULT_BLKADDR_VALIDITY           0x00040000
-			 FAULT_BLKADDR_CONSISTENCE        0x00080000
-			 FAULT_NO_SEGMENT                 0x00100000
-			 FAULT_INCONSISTENT_FOOTER        0x00200000
-			 FAULT_TIMEOUT                    0x00400000 (1000ms)
-			 FAULT_VMALLOC                    0x00800000
-			 ===========================      ==========
+			 .. code-block:: none
+
+			     ===========================      ==========
+			     Type_Name                        Type_Value
+			     ===========================      ==========
+			     FAULT_KMALLOC                    0x00000001
+			     FAULT_KVMALLOC                   0x00000002
+			     FAULT_PAGE_ALLOC                 0x00000004
+			     FAULT_PAGE_GET                   0x00000008
+			     FAULT_ALLOC_BIO                  0x00000010 (obsolete)
+			     FAULT_ALLOC_NID                  0x00000020
+			     FAULT_ORPHAN                     0x00000040
+			     FAULT_BLOCK                      0x00000080
+			     FAULT_DIR_DEPTH                  0x00000100
+			     FAULT_EVICT_INODE                0x00000200
+			     FAULT_TRUNCATE                   0x00000400
+			     FAULT_READ_IO                    0x00000800
+			     FAULT_CHECKPOINT                 0x00001000
+			     FAULT_DISCARD                    0x00002000
+			     FAULT_WRITE_IO                   0x00004000
+			     FAULT_SLAB_ALLOC                 0x00008000
+			     FAULT_DQUOT_INIT                 0x00010000
+			     FAULT_LOCK_OP                    0x00020000
+			     FAULT_BLKADDR_VALIDITY           0x00040000
+			     FAULT_BLKADDR_CONSISTENCE        0x00080000
+			     FAULT_NO_SEGMENT                 0x00100000
+			     FAULT_INCONSISTENT_FOOTER        0x00200000
+			     FAULT_TIMEOUT                    0x00400000 (1000ms)
+			     FAULT_VMALLOC                    0x00800000
+			     ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
 			 writes towards main area.
@@ -298,12 +300,14 @@ compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo"
 compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
 			 "lz4" and "zstd" support compress level config.
 
-                         =========      ===========
+			 .. code-block:: none
+
+			     =========      ===========
 			 algorithm	level range
-                         =========      ===========
+			     =========      ===========
 			 lz4		3 - 16
 			 zstd		1 - 22
-                         =========      ===========
+			     =========      ===========
 compress_log_size=%u	 Support configuring compress cluster size. The size will
 			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
 compress_extension=%s	 Support adding specified extension, so that f2fs can enable
@@ -368,38 +372,42 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 the partition in read-only mode. By default it uses "continue"
 			 mode.
 
-			 ====================== =============== =============== ========
-			 mode			continue	remount-ro	panic
-			 ====================== =============== =============== ========
-			 access ops		normal		normal		N/A
-			 syscall errors		-EIO		-EROFS		N/A
-			 mount option		rw		ro		N/A
-			 pending dir write	keep		keep		N/A
-			 pending non-dir write	drop		keep		N/A
-			 pending node write	drop		keep		N/A
-			 pending meta write	keep		keep		N/A
-			 ====================== =============== =============== ========
+			 .. code-block:: none
+
+			     ====================== =============== =============== ========
+			     mode			continue	remount-ro	panic
+			     ====================== =============== =============== ========
+			     access ops		normal		normal		N/A
+			     syscall errors		-EIO		-EROFS		N/A
+			     mount option		rw		ro		N/A
+			     pending dir write	keep		keep		N/A
+			     pending non-dir write	drop		keep		N/A
+			     pending node write	drop		keep		N/A
+			     pending meta write	keep		keep		N/A
+			     ====================== =============== =============== ========
 nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
 			 by default it's disabled.
 lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			 directories. This option has no effect on directories
 			 that do not have the casefold feature enabled.
 
-			 ================== ========================================
-			 Value		    Description
-			 ================== ========================================
-			 perf		    (Default) Enforces a hash-only lookup.
+			 .. code-block:: none
+
+			     ================== ========================================
+			     Value		    Description
+			     ================== ========================================
+			     perf		    (Default) Enforces a hash-only lookup.
 					    The linear search fallback is always
 					    disabled, ignoring the on-disk flag.
-			 compat		    Enables the linear search fallback for
+			     compat		    Enables the linear search fallback for
 					    compatibility with directory entries
 					    created by older kernel that used a
 					    different case-folding algorithm.
 					    This mode ignores the on-disk flag.
-			 auto		    F2FS determines the mode based on the
+			     auto		    F2FS determines the mode based on the
 					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
 					    flag.
-			 ================== ========================================
+			     ================== ========================================
 ======================== ============================================================
 
 Debugfs Entries
-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
