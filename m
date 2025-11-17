Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C414FC64084
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Nov 2025 13:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HUd53xY6bR7bEeVBUFj2EtcZEO8KhFYd2F5HT5WsInU=; b=IllPZfGdv1x0REqO1eAJxdZXhf
	7+iRQyIDiMNu2Iy+1HPrbqpN1nLBLBCXOPZl4BAM95ur5xYDn3bYsbArOpU/yVX+VV+gVqN6jHDd9
	wGHqtnb0CFd+JsLyeQXVE0R1NEIXSFo+rTy1vFBbC3wCwm4uTQ1xy1Tp+87YDbgZM8Mw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKyLA-0002ZX-Kc;
	Mon, 17 Nov 2025 12:28:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogunix@gmail.com>) id 1vKyL9-0002ZP-Ks
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 12:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxFwABS4E9AqqW3H7WCXTzoCQXbQOjdnmgdZA6SbR24=; b=FYA3qq1JTY+oDnKLYY7gbd3Xww
 1tisuFkROEQwJjxFhs8e6HweXdCQRB8423bPkpQaFU1nthpZBmVhqwPn/RXF53o/BpQ9XkzduViMV
 c6EvcH856b+PikpZ89w+sH95sTPREAcIGOJcC0v6wPUXG/OZDqVo6/hI31T+NYmRSHMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BxFwABS4E9AqqW3H7WCXTzoCQXbQOjdnmgdZA6SbR24=; b=e
 0hHQI8Gw/SVeeVt1/KJ3J/DzEEkLX8EliSzjFDh5Z8na3kP07ebT+QCu6VmMYvj70rm/2/gXSAjkY
 DhkwgAR9DFuSThjaBjBKtkbU0bRSq4Wra/JV5N7pwdz+3B4DGAkQJNCC23TTEBPcs9PUBqBATSPW0
 mDF7qMIdORWfF7oA=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vKyL9-000492-0v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 12:28:15 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-29800ac4ef3so11204355ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Nov 2025 04:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763382484; x=1763987284; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BxFwABS4E9AqqW3H7WCXTzoCQXbQOjdnmgdZA6SbR24=;
 b=QHKFWAhQoEE5P7zlVnKUQv2Zxe/ux6Hl0zWij59TYyfy3km84UIZFvNLj1bEH3jByx
 To7JUIBJLOOfVtJqmUXNK5UI2zwoj7BfIcLixLtblnyPkkXliXMBSq4bHlCa4wVz2R2Z
 Vxck3q0xqsOqWfrLo5EDyB95vnQKmrxHwqkNePJtTeD65qf3H70T9ORrIkTkaLE5xCQd
 KiKxuGYS7687/9/KGvFaY//WQIVta+T6hnc7Z3ytBuUa1B8y7DgDL4VdrOYVNBAEVZMv
 DYlOnFXLx4dsFE0/hwPwZbnjU56kvBs4lBCx97znmu3gHkVQ29KORJ8ymUY4BgB0KwQK
 6OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763382484; x=1763987284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxFwABS4E9AqqW3H7WCXTzoCQXbQOjdnmgdZA6SbR24=;
 b=k9bUXf6izxSrVAQFK6Ixwhw7nLu5Qf7X9BGQas8e2IrDooUf3Tl1RdJgxV2V8pI9GC
 6a+0GE8DWTQW87oEV+7H3839jW41HftnVwhCBkRxUf8A9l8lV7dy3jdkqLrAjup5bJTi
 A29lkVOrnga4UAe6Wf9D/NgfOnFrBTeffOOm49rjyzVDHK1/ORlkKWc16bVU0i1YstWw
 t5dc16gGkgjtftgHOHCabQ9g4uV11tOxxvRpLxA7W5o4G77DhdFwwHEPgzGkta2Ofj4e
 ijzb2tiROB43WmR74eRLYb61CDxtvbpPnWqCH17I/ACcdaJzJKlNx8yCuqiuHBRYiCg3
 DKEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyi10WsKWiWO+qKWg+mNL981T0NfGHgdO2g7/xGWYCwdaXdWvUhrD3R10rOoje6OOOh5vR7i+Y6+OZPVRZMgM9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwzwYz6tw7+pE3+PjhqFfeGu/QG5+Jt17tIoDDvd0zmV6UbY28E
 7NmojX4pz6R1nq7cXcPzf1aDLwxRT8chxNfVXKl/5Xap1DWrGVBVtdQS
X-Gm-Gg: ASbGncvJzKkhv6xayqBXyCogOqXpT+BdIePQ7j8mx+EHDgpbZgWpZGt7xFuR7Rb5SJ+
 1Hb8WOFMNg23QsoYSwRJAvHMGpwEO6r++UTCA0MLLa8TnsPv3wr0oZ0hDeDw8qMM+B3dx8dZNce
 QkBY0kL3vyyll2J/p5H8+Q1EpB+MTeZ+eJBdsexWUy0KhKdcri7BsY4gxABxrJvAErO+KvnBM1H
 OgF2R879628luN54VQFcyXYLJBpvFAcc7hNX33ubuaNmuooQeHFRhbQqyDpBDT0gCzpZ8OYNHkh
 uxyAo0bvmwcx3xxvTcQu2A7Sz/1olJW42oIJeuxrvmH1iw8j5ssebQr8Uq0CNZO4QCJMoLCOGzT
 yopdewEB5VCaC+/hzMbMgv46G3rseIB2bCaWE450vJrK4EHeYlNPv4ijKOoAHzej6htmvJNTgEH
 dnSmQgQqbrI1IO8G37EQz6598ovI0X
X-Google-Smtp-Source: AGHT+IG//xVmBBm8Lcd2pfIWDTXsKbwEnW3B3WB83QwmOBkRuUAs/3VQEOXgbd0NazUgZkeqTpOWGg==
X-Received: by 2002:a17:902:ecd0:b0:277:c230:bfca with SMTP id
 d9443c01a7336-2986a6d55e0mr69417135ad.4.1763382484230; 
 Mon, 17 Nov 2025 04:28:04 -0800 (PST)
Received: from elitemini.flets-east.jp
 ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2b1055sm139841435ad.59.2025.11.17.04.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 04:28:03 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 17 Nov 2025 21:27:54 +0900
Message-ID: <20251117122754.297742-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Sphinx's LaTeX builder fails when converting the nested ASCII
 tables in f2fs.rst, producing the following error: "Markup is unsupported
 in LaTeX: longtable does not support nesting a table." Wrap the affected
 ASCII tables in literal code blocks to force Sphinx to render them verbatim.
 This prevents nested longtables and fixes the PDF build failure on Sphinx
 8.2.x. Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nogunix(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vKyL9-000492-0v
Subject: [f2fs-dev] [PATCH v5] docs: f2fs: wrap ASCII tables in literal
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
Cc: corbet@lwn.net, nogunix@gmail.com, linux-doc@vger.kernel.org,
 akiyks@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sphinx's LaTeX builder fails when converting the nested ASCII tables in
f2fs.rst, producing the following error:

  "Markup is unsupported in LaTeX: longtable does not support nesting a table."

Wrap the affected ASCII tables in literal code blocks to force Sphinx to
render them verbatim. This prevents nested longtables and fixes the PDF
build failure on Sphinx 8.2.x.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

---
Changes in v5:
 - Fix commit reference style (commit <sha1> ("<title>"))
 - Move version history below '---' per canonical format
 - Update Link: tags to lore.kernel.org where possible
 - No code changes from v4

Changes in v4:
 - Rebased on commit 62242ac51061 ("Documentation: f2fs: Reword title")
 - Cleaned up Changelog placement
 - Verified `make htmldocs` and `make pdfdocs` build fine

Changes in v3:
 - Replace TABs inside ASCII tables with spaces

Changes in v2:
 - Wrap nested ASCII tables in literal blocks
 - Add missing blank lines around code blocks

Link: https://www.spinics.net/lists/kernel/msg5929575.html
Link: https://www.spinics.net/lists/kernel/msg5921848.html
Link: https://www.spinics.net/lists/kernel/msg5918264.html
Link: https://www.spinics.net/lists/kernel/msg5875662.html
---
 Documentation/filesystems/f2fs.rst | 131 +++++++++++++++--------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..cb90d1ae82d0 100644
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
@@ -296,14 +298,15 @@ nocheckpoint_merge	 Disable checkpoint merge feature.
 compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
 			 "lz4", "zstd" and "lzo-rle" algorithm.
 compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
-			 "lz4" and "zstd" support compress level config.
-
-                         =========      ===========
-			 algorithm	level range
-                         =========      ===========
-			 lz4		3 - 16
-			 zstd		1 - 22
-                         =========      ===========
+			 "lz4" and "zstd" support compress level config::
+
+				 =========      ===========
+				 algorithm      level range
+				 =========      ===========
+				 lz4            3 - 16
+				 zstd           1 - 22
+				 =========      ===========
+
 compress_log_size=%u	 Support configuring compress cluster size. The size will
 			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
 compress_extension=%s	 Support adding specified extension, so that f2fs can enable
@@ -368,38 +371,42 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
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
+			     mode                   continue        remount-ro      panic
+			     ====================== =============== =============== ========
+			     access ops             normal          normal          N/A
+			     syscall errors         -EIO            -EROFS          N/A
+			     mount option           rw              ro              N/A
+			     pending dir write      keep            keep            N/A
+			     pending non-dir write  drop            keep            N/A
+			     pending node write     drop            keep            N/A
+			     pending meta write     keep            keep            N/A
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
-					    The linear search fallback is always
-					    disabled, ignoring the on-disk flag.
-			 compat		    Enables the linear search fallback for
-					    compatibility with directory entries
-					    created by older kernel that used a
-					    different case-folding algorithm.
-					    This mode ignores the on-disk flag.
-			 auto		    F2FS determines the mode based on the
-					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
-					    flag.
-			 ================== ========================================
+			 .. code-block:: none
+
+			     ================== ========================================
+			     Value              Description
+			     ================== ========================================
+			     perf               (Default) Enforces a hash-only lookup.
+					        The linear search fallback is always
+					        disabled, ignoring the on-disk flag.
+			     compat             Enables the linear search fallback for
+					        compatibility with directory entries
+					        created by older kernel that used a
+					        different case-folding algorithm.
+					        This mode ignores the on-disk flag.
+			     auto               F2FS determines the mode based on the
+					        on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
+					        flag.
+			     ================== ========================================
 ======================== ============================================================
 
 Debugfs Entries
-- 
2.51.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
