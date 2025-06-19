Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBBAE033E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jun 2025 13:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3OZ0aZ0o6CCJji8d+VymkvIpI3xDrena74g8QpHcAlk=; b=ezrB3DRkQYC3svt6DXYW8Jf06f
	mpP1rqQlSStdUt+cm3HtJHQ6fjUacYGVsdYHbBI20FA8k7j3n+g5oZgKspms1lo3+fo8JUe4Od4ed
	eixTrynLPu5hzLS9CHIxHT+WBg10PfJacrB5uQslCeF6YjTg0W3uG19bJgXpVPIChDSQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uSDGK-0000e1-5A;
	Thu, 19 Jun 2025 11:16:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <abinashlalotra@gmail.com>) id 1uSDGI-0000dv-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jun 2025 11:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuFM1YbwpAAAQMd/gx8Z2BVa5dBU8bXNQwjwSquZUvk=; b=FvwQu1V1TR3wLHzPqLBHtn90+l
 e3Q6thmtoxzpC0aIYZAxCgEKSMf5JUQGTi2AWVHWOHkYMq35uQFncaxuvkhkY/N3/Ln0Zo+dgUMAl
 S50atkovXO8OedsTyIEH5Tk06RBVT3oYaKagLxAbSKBNINA045MSUc94HrTAC4LHn82Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GuFM1YbwpAAAQMd/gx8Z2BVa5dBU8bXNQwjwSquZUvk=; b=j
 Rh9/JQalSbKbpW7P+0sLGF74OhAjNZUII/1GIBMgRgrq2NysS9UwPCu/LCo0cOqSVPn0BZYt+/03j
 Inf8hX0mweMkw3zQX4e+hJWz+dmr05uYOtkzyGbrtDwuQOgdgKS5kdYwwOZIA8mVr4C2qPswJaqRr
 jEAU6osLYFrjcW5U=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uSDGH-0006xS-Q7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jun 2025 11:16:54 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-236377f00a1so6059375ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jun 2025 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750331803; x=1750936603; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GuFM1YbwpAAAQMd/gx8Z2BVa5dBU8bXNQwjwSquZUvk=;
 b=LXjsbAJZbf7f9KLq1yaCzCLnMNVZkvW3eXm7mZapNNbLNI6v4SHQwGr30GJhaKqLI3
 fUzVFSj+redQxqBQNfAyzt0uMp+uI8IjG2PIaLw/pyZnlYtRBmmRCNgsVGtmlE+uRqkV
 ZoaBBak2vUcdseBCyN1Qdz6ls8EVEx02BDCRn6H3Ql8JFpWOECwt2OtEMN9Ed1t37SMP
 TyNvbLl046t/x98/fYGnmBAWsWhzk/zL3Xsq/Dpfu72Tuaj77uuCVStHb238pcQ0V394
 crBjjYdRbI9TOZgKGmHWeX3n53LrjWivAiQ+vkJo7mhGUxgaMH6T4hL5BA+n6K2WumZ5
 wp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750331803; x=1750936603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GuFM1YbwpAAAQMd/gx8Z2BVa5dBU8bXNQwjwSquZUvk=;
 b=MnNkXdlS0BtbsVnx594yj6MapxHs3yE6jtIpKFDCDUcG8CFRknB8YKQooQKDZ2x7Pz
 Zn28JITyii95eu2AfFOXFkG2L+kKpGcvd4sgahTX4GXLZtxWpOXBZRO7h1iX/Oad4df7
 30EKeH32X25yuSgxyHkUz1pfCMER6pn2aArw60Q/z1gYpIiBiKvr1S+bG3Gp3UVF3Eg3
 r1xjT+NyjdafsOME8qnr1aVPf3Yzqj2kHowBvpKT9oGhhKiUz5MNg5LYOLp8QlzF+1Mi
 sm6amIgPswKEk2fTuQseTOlCq2yUZaKnmJMAYa4OFd513kuo8iIWfuFB1WKpfTxUhJ/Y
 fCTA==
X-Gm-Message-State: AOJu0Yxlm/rTT3+JY11pgV3QO0JUcuY34tHgUvcfD55SnLtxNFTMGnDc
 tzfDhikNfZuee2swLyA+FysqL2w+jMaDhU4hlgXoOKYlJLnzOUePWlwEJfdpJCFo
X-Gm-Gg: ASbGncu5gudUMnLVSeSRZEtNniIYGQw4CXHt5zoxXxNSVtFFUQzSYkUt1wadCKReRN3
 AxER+hUPDq5oy4/5HC5TunxB9qG72tBQnPBCIWSanu3Eh/lzCYDzJzBBjQdJc4LjGD7HpnhlD2v
 chY591yMZEKgIas1S0GqYwYWwobQkiF5Ihu/2KaXR8oHlN9WX9TSqBNKdpQkvIscl4jw09kUF/R
 ILVZ6i/bJamsEJQNH4tn6OfPHKW1Y+KSZXNtXgBB/PhycFGEDba+llpBENyBcwJAdzjEn14KLub
 LpPklA+Dh4IYCFXo/R+AO+vuQgfaPJRu2urIOR1VA5dcLIRBNz7l9g14CBHKz2gwE3VtJdPbxLJ
 0c0WM+IEIvixn+y/GMaVe
X-Google-Smtp-Source: AGHT+IFr10DL/nrTOrnxO5gYYxx6P2P4jBT1kZ85cwerLt6/BLpP5KnnBr5Y4XQvn0r/OdAjaAEGwg==
X-Received: by 2002:a17:903:40cf:b0:234:ba37:87a5 with SMTP id
 d9443c01a7336-2366b1224b4mr319180945ad.25.1750331802869; 
 Thu, 19 Jun 2025 04:16:42 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS..
 ([2401:4900:88e2:4433:2a7d:bb88:9d3c:be74])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0d22edsm117422515ad.240.2025.06.19.04.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 04:16:42 -0700 (PDT)
From: avinashlalotra <abinashlalotra@gmail.com>
X-Google-Original-From: avinashlalotra <abinashsinghlalotra@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Jun 2025 16:44:07 +0530
Message-ID: <20250619111407.113334-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [abinashlalotra(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uSDGH-0006xS-Q7
Subject: [f2fs-dev] [PATCH] f2fs: fix KMSAN uninit-value in extent_info usage
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
 avinashlalotra <abinashsinghlalotra@gmail.com>,
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
Signed-off-by: avinashlalotra <abinashsinghlalotra@gmail.com>
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
