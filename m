Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D689AC4E029
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 14:04:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3acAQo0ikwtZbKPmpUO6adTlCW78UMW4ayFtcHpokY=; b=U5yIeSCH+B/MajJRy9gUNKcMNP
	HrmnKao5Lf6nYEHPBv8JcMgqP0Fy68qEQsRts+RtVNim6HXLFTPfQEeSKWPU7vphdpdkjyNFSgdpS
	21vj1rC78VKfjCO6pTKg6S1JhKEVuHU5/YCI8y+/PaDB6NS+2ur/PFHl6A+mg9tk1YQ0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIo2Y-0000Kq-2V;
	Tue, 11 Nov 2025 13:04:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogunix@gmail.com>) id 1vIo2X-0000Kf-24
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 13:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ozXRud7hnbH/C6N6bIIB2OSxH4nIfZC/nZQgtGIV7s=; b=kgz0DAyEgSUADNruvxLgbl5xkB
 oNoOT3CHOU5Pl2iXTUDnf26IwcQ/cagWD7Bg2+9pUcrduvPU0ok3EsjGdN3ImMY4PJVsycneyz61l
 OdZcyr8Nmprn7UhAaBseQ7UHZEsujcOye6yA3EzO2+i6KHkQq5yDSwraZogx0GKFrKs0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6ozXRud7hnbH/C6N6bIIB2OSxH4nIfZC/nZQgtGIV7s=; b=f
 JxmDdU0nk29nEGG4wjGjTs+AOtcDmsZEjzWmKtVuUUF7hzwaDs7BsOccFMPoZQU/40ttPIKvIWcOK
 we/EeHTUM9KePBsHC/ZWTcOogz3kN0gL6RABW2t2Dkg8ICv6w8xw1YgimHIQbNxv1xgvFLgZbwm3v
 adK/dppJCEgOmWcs=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vIo2X-0006z6-6k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 13:04:05 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7aee3b3a7faso244028b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 05:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762866239; x=1763471039; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ozXRud7hnbH/C6N6bIIB2OSxH4nIfZC/nZQgtGIV7s=;
 b=MDzZmFK96sqhgFY8hAnahSau+UyzCjdbMtu9Frck3TH8YiT0+wxWa5Yo7n7TT/1krJ
 HAVX2iyjGpIjpr639DcTiEENRvMCJ/bKLj0fNd0x/S7i4Sr9mc6LB0oWR3wu0JQCH8xX
 FP4FM0ttzGmFNdLPoikgDqHmkYCyJkM6dL0Ny+NyVQYsNfnhERPHCOAhdak1rly7mufV
 epiCg0ebIsDzwSRfBnnRZY9X1u+jXjGwUJg4Tli1K7tfFoeF8odJFPkw7ehhvYHfZFgj
 BgGrJ59EDfW38Y9OXNXuHK8LnSfmnqMlAhxB+RB4FRccczaheMEbsO+ySYR9U89C5PlB
 A0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762866239; x=1763471039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ozXRud7hnbH/C6N6bIIB2OSxH4nIfZC/nZQgtGIV7s=;
 b=H2E991Wz9MkDwR4XUVTCWKiWhdgzIYFVU7a+dQ1jxX/LpXycak81FzDZSY05OkJuOs
 V3JY9hKN3wRKsF5h2C+cmExJLQb5apvt9LN0zU3FxiOSYXpB6bSU3zYMWM1v1w/MXSz7
 M8qkCzx2JZcIsYuwz0TLNgf85+9byCQnlXoNJCuCp9LIpB1R1NNUbcyYo5FEC+ULDNvG
 0hbOVRZruF4s6uNJWp5DoTGk3XCIiVIEVy6T2+uASMnjkDfrCfcpwxKhogTQNuIhN1cj
 FP+YNYUxaKeSEaMmvqcjcJYPsRIZI2vFNvJch1dlsX7gqe8DW85xH23MYRLR0idB/8+L
 vo6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVprye8ayLZx4hj3+vLXUjwsDJghTAKVS6gf4RGjHhuIvXuT/MSX76fynJtfplIVL7ISl+VSpEPl8WhDrxfwpIc@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz4SkHOO87QwgdjascnRiedatEfLAoqSa29pNJKBoJn6zEprmym
 RhiBrNDvI751zpG1UIUjIbXVAsZOUoeZyUAv8Xcp10Aj4JtaF/L2wMjo
X-Gm-Gg: ASbGncsJTqpK13VGMKpJ7aVALFeZ58NMEYVeMo7KKJ5KqhLReWY6dNkuZeFEVlmJRWr
 UKSM3cehWOcrhAtYw2o1HGojxHJidFrvkPATLtlbq+at5NIEM2lFRcb3Jw/IMeZtPwd1B8REo/c
 OOErOmAdM6dzhGqVBXWN8h3o1S5D9FS3vWjl7+JiuyLyk4rBnDQiL+3V6CWaAPEeBIgFU90wCH5
 qB24GgL7conksKwJrsaH3FBfM77hL/FXEIFMN6qi8A4iSarcRatuLGEFbzWOk0zg6SXYNW8XkVn
 /I61J3nx7F6+fBqfAbq/ovCyEEwk4nLv+hy3tE6QPVuHzn6ihs6+hgSVH/xl+b+br26yDRNdLpS
 sthhyhmo4H/hn76rrqc5VyXEZ+yfLAvQjUqadFrYO0F4Ng1R5plKlbfXeKbe6SagnVLnGfW1dx6
 y+nRSgOtvGWT8apLXgYA==
X-Google-Smtp-Source: AGHT+IHu4EywhajIUey4lbULY1rrvTzR5HGvXc4GreqR0sPeWXBldY1/v7wftHXonsc2QxGK9vnrZg==
X-Received: by 2002:a05:6a00:4fcb:b0:77f:1a6a:e72b with SMTP id
 d2e1a72fcca58-7b226e825d4mr7474236b3a.5.1762866239288; 
 Tue, 11 Nov 2025 05:03:59 -0800 (PST)
Received: from elitemini.flets-east.jp
 ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0ccb5a517sm15010286b3a.57.2025.11.11.05.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 05:03:58 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 11 Nov 2025 22:00:39 +0900
Message-ID: <20251111130349.3856302-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Akira and Bagas, As suggested, I replaced TABs inside the
 ASCII tables with white spaces for better readability. No other content
 changes were made. Thanks for your reviews and acks. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nogunix(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIo2X-0006z6-6k
Subject: [f2fs-dev] [PATCH v3] Documentation: f2fs: wrap tables in literal
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
 linux-f2fs-devel@lists.sourceforge.net, bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Akira and Bagas,

As suggested, I replaced TABs inside the ASCII tables with white spaces
for better readability. No other content changes were made.

Thanks for your reviews and acks.

Best regards,
Masaharu Noguchi

---
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
Changes in v3:
 - Replace TABs inside ASCII tables with white spaces for readability
 - Keep Reviewed-by and Acked-by tags as the technical content remains unchanged

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index a8d02fe5be83..1de0bc83d76e 100644
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
+			     mode              continue        remount-ro      panic
+			     ====================== =============== =============== ========
+			     access ops        normal          normal          N/A
+			     syscall errors    -EIO            -EROFS          N/A
+			     mount option      rw              ro              N/A
+			     pending dir write keep            keep            N/A
+			     pending non-dir write drop        keep            N/A
+			     pending node write drop           keep            N/A
+			     pending meta write keep           keep            N/A
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
+			     Value            Description
+			     ================== ========================================
+			     perf            (Default) Enforces a hash-only lookup.
 					    The linear search fallback is always
 					    disabled, ignoring the on-disk flag.
-			 compat		    Enables the linear search fallback for
+			     compat          Enables the linear search fallback for
 					    compatibility with directory entries
 					    created by older kernel that used a
 					    different case-folding algorithm.
 					    This mode ignores the on-disk flag.
-			 auto		    F2FS determines the mode based on the
+			     auto            F2FS determines the mode based on the
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
