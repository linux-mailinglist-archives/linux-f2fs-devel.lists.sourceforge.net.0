Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08029C43B70
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 09 Nov 2025 10:54:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0F3uJfogg6OSjS5KmHJA7/94jzUi6TV0H0jZW51qu2E=; b=nKKYNRDcCD8BX8ZrlE7rww1twV
	sWQI/qymr17ncgNuSWWmZDAyPYlqGhzJe11Wnfj7mAtIaHwG8cFN4Ig6n/vM5LFNFwU0QNFMldcCV
	J64R1j8lyWWN35b6Pm7mxBzVYY1fD1hrlftrhbT2TMp5/ez8sDHtVpmiqKuvIiOKTdBI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vI285-0002hf-MN;
	Sun, 09 Nov 2025 09:54:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogunix@gmail.com>) id 1vI283-0002hZ-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 09 Nov 2025 09:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2mJACnQxh4sD/p1rN5JTzDZGkA2szKxHiA+o6hUrw0=; b=PmSfL95ICCBLjGX0svUM7cI6VE
 scUOCTJwvnrQxHtmGprId3hvTafkWAKcdoVj6lREWIMiHTPUILmOlGLmfpT28yhSARuyPOpIPAQ57
 O8rjKkKtYzAwZaEXuLHpYGxTi5AaRDohsvIbQHQLPfiLbR9j4ytCcFeVESO/GpRGGPg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W2mJACnQxh4sD/p1rN5JTzDZGkA2szKxHiA+o6hUrw0=; b=B
 pCU1GI/kOSR9YS2If5Cad6bmF2qT9hoN2WjKSuzQtqLzSqERg4mrXNTWSb4gPt9qQTran2t0XwFYf
 PNR/q+uRmDMDaVZSEW4k+bAqOSdQzyi8rZiOoagM41BXDmWZloE3sixsBzW4C4aTalsUm/3m+C9Iq
 2E9IpJgC8Mia8lfU=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vI27y-0007ur-4w for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 09 Nov 2025 09:54:35 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-340ad724ea4so267317a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 09 Nov 2025 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762682064; x=1763286864; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W2mJACnQxh4sD/p1rN5JTzDZGkA2szKxHiA+o6hUrw0=;
 b=NTkVf/bY+/QBb88S8w524mqyH3+Dza5VAJaMRxEdL8dWQCOI/jtv0DaUsehnbjEWMz
 odMHI8zbKEONqw7VSKMgBWBR3NRx1xtGwmbypRl58Z5Lmi6YvSTYz5O1cVVh0PmszBjE
 Xy7Vo9MIR/0K2HLP6KJ33d2fX7lxHBN5WdG2pS+RSoCc6krjDdcREQ9llpsXzNksAsm9
 j9waZcnDeDFw0giA6k3QLfoZq3kXxKlCd4G+3K83nJcEnU0+yGyYzsQd6krDxc9xOF1z
 2qBeDV1TIz+dFZxJd4/Kvrjms70GRaCPp75ssnDL90Fsl8NCFBrcouqWDZ+X/UlnUvAw
 zWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762682064; x=1763286864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2mJACnQxh4sD/p1rN5JTzDZGkA2szKxHiA+o6hUrw0=;
 b=FpoooEHuEHrdnwe1Gvx9YvPuueLhbFZVYM+LrCwmOwu1fN60QbmLqIp7psP1UspeI0
 tFJnD4WS/ib0SXDF5S97m2zs01BEi/ty/rwl/YtuCh3wKu9kDRgv427s30ssKRRsfAA7
 p8Wugd1btDpw/f00SNhU1SpDeUn9OfFq7qGuFamUl1e5VEfjUPIoTIC0h+QTu5YRUPXu
 roGHuO2aGeCG4TPhgEcFzR0RD5q7znrl3qF2lUZRmv+zJWU32Lm539dyVq5a/HSput+q
 2xUXR24jl4NZXiLJxovmOVEV4Tm4emmPsdbmgUXQ+Z6HFhAmfQJbv87AI7fCsM4UAA1z
 MNKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRqGfGxzid/dr/R+IuoWIauPbeHnTu3htZNTYslOrmHR5OnAbYqOWxBp7Kiy85SKBntsbhXQlNq0bhFl+tRrY+@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz0tI/Kpmz4y9JWUFbjxmD4SGVva5Crtp05YuOkwmrCu3eeo6lm
 Fydv0NY17HwjjMoYABiarfVimWLYJp1Yq0HNdwYmniAnqnUHjzMQHiNs
X-Gm-Gg: ASbGnctGUqQziQRK+oG+LFcDwkA0LZqoi5Xw+vCjoU5iD7r2YHB8WL/8F4GY/TtIXvc
 FEjvNJVxfIGN/2WU33NZ9LxC1HRxfnkeBxLT34lF9Z3NCSVweGXuqciFXBNnU2OePSNxk6Rsidd
 BzNoPbEH5dkTC585bSl1p8KUYR6FS2Ob9C69nqLTtzyVSxi2eYjvcoz4xPAcETMDnwcEGZD0ybZ
 ns86i62xJow/iHitHIsHoaVg9a4OBZeVngoOOzT2UUHPxzRc3CU4NmLDgPc5PNH6lh0UZwUVBwk
 Z4SvWUNZI0U2UVWTiUFc5sSaB8jIdQVJiFwQ32ynkeToAUGIm/bKvLI/J4O7oqBCOTnczduZska
 Vzet0Ug6whB7f3XoFQhrv7QZGaJGiXplhMCZ+Ds3ULI75Eb95ufeBifnKsVvEs86brux+EK0Gz8
 0oHTzOI3u2cN2RXHSPheB1eB7oO8qN
X-Google-Smtp-Source: AGHT+IGb0U3tFr9TL8bOD50VtKU25lK/Pj6KKmtdQ7daasGpBhl7uujoLGSXyt/2ZeJKF5VCSgi1Gw==
X-Received: by 2002:a17:902:d4c8:b0:297:fe30:3b94 with SMTP id
 d9443c01a7336-297fe304a7fmr17440385ad.9.1762682064333; 
 Sun, 09 Nov 2025 01:54:24 -0800 (PST)
Received: from elitemini.flets-east.jp
 ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c70381sm109013265ad.66.2025.11.09.01.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 01:54:24 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  9 Nov 2025 18:54:16 +0900
Message-ID: <20251109095416.2428351-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Sphinx LaTeX builder fails with the following error when it
 tries to turn the ASCII tables in f2fs.rst into nested longtables: Markup
 is unsupported in LaTeX: filesystems/f2fs:: longtable does not support nesting
 a table. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nogunix(at)gmail.com]
X-Headers-End: 1vI27y-0007ur-4w
Subject: [f2fs-dev] [PATCH v2] Documentation: f2fs: wrap tables in literal
 code blocks
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sphinx LaTeX builder fails with the following error when it tries to
turn the ASCII tables in f2fs.rst into nested longtables:

  Markup is unsupported in LaTeX:
  filesystems/f2fs:: longtable does not support nesting a table.

Wrap the tables in literal code blocks so that Sphinx renders them as
verbatim text instead. This prevents the LaTeX builder from attempting
unsupported table nesting and fixes the pdfdocs build.

Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
builder already handles these nested tables. I still want to fix the
current documentation because Sphinx 8.3 is not released yet, and the
LaTeX build on the stable 8.2.x series (which also requires
"docutils<0.22" for now) remains broken without this change.

Link: https://lore.kernel.org/lkml/20251011172415.114599-1-nogunix@gmail.com/
Changes in v2:
 - wrap the compression level table in a literal block and add the
   missing blank lines so docutils no longer warns about malformed
   tables
 - consistently use ``.. code-block:: none`` for the other ASCII tables
   that previously triggered the LaTeX error

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..07b8e752476d 100644
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
+				 algorithm	level range
+				 =========      ===========
+				 lz4		3 - 16
+				 zstd		1 - 22
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
2.51.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
