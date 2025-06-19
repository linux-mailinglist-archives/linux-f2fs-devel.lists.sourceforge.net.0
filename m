Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDECAAE0523
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jun 2025 14:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ce0Ox4amK6joG6rUBf6oNC5Noq7HeRH1e/h2qrDSy1Q=; b=JN3QTiLhB0EAg5Qg5nm3Cd43Rh
	XP+p5atacVYdg7MM0GaNeNC23goXdme1UEciXVMmRmRji4OGmWllJ9DFQnv/cvffay+1PKT+UkLn4
	1bzOFidJinr8V+7X8z8LCXgvHaL65xDhW9FPiP2HzKyvkfIUxUnrOCbhW6YIhrjqZm74=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uSE78-0007nQ-EM;
	Thu, 19 Jun 2025 12:11:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <abinashlalotra@gmail.com>) id 1uSE76-0007nI-KX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jun 2025 12:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B6SRE6bIgx60Vh2G3cKWwxWXV0k70mmpyo5f1tTADIM=; b=cadytbjEMlVFSEZHRyiRFe9qjm
 RzW4CpfXcaTmAMzkgYrlfiX0Aq8BmHVdVJ5k1zl7C5hcymdN2gNNY3fqnAcLJ76gVKs3oC6p0PnSe
 NIANBnoS9S/K2GL8Dd7eneYJRBum+7XmJtA4KIwEtVs/aTTPZi02553/yYkiqzb160Ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B6SRE6bIgx60Vh2G3cKWwxWXV0k70mmpyo5f1tTADIM=; b=M
 4/MZbZfxOkD3jfE2/t4J2/bR0bcRINQX5toWKCRyeg84WgQ0gVX0nKfuTreVw3TExEdQFNoP4QOnD
 /Y6g5Ub6OCFSVugaBpRszEAS2EhINt3ZEodmw+8NXPNzzAkhF4lHJbjumJYegqAxmDell7GBnHQFn
 HsI0uTxuufxWerVY=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uSE76-0001hn-B2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jun 2025 12:11:28 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234c5b57557so7555205ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jun 2025 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750335082; x=1750939882; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B6SRE6bIgx60Vh2G3cKWwxWXV0k70mmpyo5f1tTADIM=;
 b=W3AUQtn/642vRAkbHxhHJ23aEXF+3O8Tkz9gaEZL3qkyEl0DYSaEfOxO7TTiaZk5v8
 32+tDcH6dK2LuK9VNRf4gii1mixC+DLHV+Qxhs365mneuSu+BOGBFqkirIRnZQFUH9e1
 DSHmehRT73M9fkfB0/4RtzLUM9aWmMnzsZ4XFZ9L32MjorqHZViDHJdlM21UaQqDoho4
 qyOSkggke3/jC/dZQAgZlA9ZbJnPlMtv+fiHE044/lI0ivwjBAujOEZg0ZVxW6ZmW35O
 DJ2IG3J98e4bu8nHd+4NFtDrdupLV9++KeJWqFsOGmRl0dPrM74ZmDmebZRBcT7L+ziZ
 /2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750335082; x=1750939882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B6SRE6bIgx60Vh2G3cKWwxWXV0k70mmpyo5f1tTADIM=;
 b=AyYgyUwrWoBRispgk10w6r0Go9BCfZDZWPXZ836zAsGW5w/59Pdj2oevgdQfu+9z2L
 q+iRQSGNOuFY7iibgxuOSBvKAxc2VNdIE3KUgAq+R3y55ujMLHC+hZAQJrKOS8JZ+6Z4
 samURoYM8kALXdy2Vh2N23IusZeu/d5N5KIA4iWxAFywudBjFCug0eMLpfdujamt7BGG
 PxXsUR0LVKmEKTX6Us+mo9oa72MI8Y4RozTm1UmlPUO/Olbf/8cpSJh8Al4pjujQ9Ond
 CaZdHXTKdmZFEKh30K907TQTkraGEpA8V1DSS2h+HldXREyXvvQX5na8PCjTCXzaKrg/
 9lVw==
X-Gm-Message-State: AOJu0YzSacpoyt3ScyOK7csazJx9xBvKQe/BRshygbObhI2zOQYrtSPn
 wRzVqU58S3XTWTaum6JgoCroePhZTLDFmMZbMXbLPrly62XYYEVyxK1IGGwhbtEY
X-Gm-Gg: ASbGncsqDDRl0VJ7oyPuHtguGRRDWoluj5RPleUWGxpPTB0QeofV6nJuewG30/3uU1H
 it+LNzEfsFNecYDtBIK/rGJsZdzQPh7zNtII39VCtLqg2U/0Qj2NyYPbu53bK1xhjWT3lE/hea2
 fveTMMJBUt2Z354WvTu4c6HZ/XRaLkTo6F5VYVxveETp2fWZxTM8+2f1Xy7igHk/ZwI8jNbR8Sb
 qjUAkWW3NV5gqdxzUq7gfXXxxSXw/7Jqia0P4ahfRTZW9xXOxsu0eKXjUts3R7GEwZ6zOgZOREV
 y0vhFfA67tn25B58E5o+i7CIA56PMmxoiqfNktMCrmCGcq2IhquK+fN7YD6jZmo+qpYEan+LFN5
 WGqDF3iXFIO9ymHnbbFR3
X-Google-Smtp-Source: AGHT+IEvdlhLCL59c6evd8bLKO2An1ebnECP+2K1HLQSf5MX8fOY246UKB0mn7G4ZlsL4wRrKX7v2A==
X-Received: by 2002:a17:902:ecce:b0:22f:b6d6:2737 with SMTP id
 d9443c01a7336-2366b32e726mr366200805ad.10.1750335082365; 
 Thu, 19 Jun 2025 05:11:22 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS..
 ([2401:4900:88e2:4433:2a7d:bb88:9d3c:be74])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deca2dasm119088105ad.206.2025.06.19.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 05:11:21 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Jun 2025 17:39:33 +0530
Message-ID: <20250619120933.125932-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: KMSAN reported a use of uninitialized value in
 `__is_extent_mergeable()`
 and `__is_back_mergeable()` via the read extent tree path. The root cause
 is that `get_read_extent_info()` only initializes three fields (`fofs`, `blk`, 
 `len`) of `struct extent_info`, leaving the remaining fields uninitialized.
 This leads to undefined behavi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [abinashlalotra(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uSE76-0001hn-B2
Subject: [f2fs-dev] [PATCH v2] f2fs: fix KMSAN uninit-value in extent_info
 usage
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>,
 syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

KMSAN reported a use of uninitialized value in `__is_extent_mergeable()` and
`__is_back_mergeable()` via the read extent tree path.

The root cause is that `get_read_extent_info()` only initializes three fields
(`fofs`, `blk`, `len`) of `struct extent_info`, leaving the remaining fields
uninitialized. This leads to undefined behavior when those fields are accessed
later, especially during extent merging.

Fix it by zero-initializing the `extent_info` struct before population.

Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>

---
v2 : Corrected Author name
---
 fs/f2fs/extent_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index cfe925a3d555..4ce19a310f38 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
-	struct extent_info ei;
+	struct extent_info ei = {0};
 
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
