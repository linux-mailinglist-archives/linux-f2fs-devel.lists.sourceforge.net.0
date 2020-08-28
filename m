Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E4D255419
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Aug 2020 07:46:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kBXDu-00061k-W0; Fri, 28 Aug 2020 05:46:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kBXDt-00061W-Om
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Aug 2020 05:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jRfQwvLhAtFfxvtMX4zIhuTmuddEpLVIB/VUrkOJiQ=; b=FX19PcanY23u9FapD0gUqjxpax
 GfoE5GM+Dg57utxqVk9ay5T7SgtZR4Hz78CRC4H1o094vpcZ1wnWBet/zOL6adSO1Z4fkDi4Nb2MU
 /QMjXyP+CnQoJowlujDLKTjX/qYOyj9Fki3Ec/iWTwKUbvhc4HVRkhQhRC0slN6YYo2k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/jRfQwvLhAtFfxvtMX4zIhuTmuddEpLVIB/VUrkOJiQ=; b=E
 eo9Uk84IgmmxfOf+0+Z0xu6zSAhVc9ZH2Oy5UnWV0LNzv5uCC/W1ZIz51XbhVrIVeU3WKPsD32Xx5
 jY5FDb9K37ded/cShLPju/04z7kYMBADX/wpmucCXAU/mKwYU+aPJlE1lUikgU+xhMTKL6hU9rPfb
 MHGlzTwbxPpnct0A=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kBXDr-008Fjb-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Aug 2020 05:46:49 +0000
Received: by mail-pf1-f194.google.com with SMTP id u128so91902pfb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Aug 2020 22:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jRfQwvLhAtFfxvtMX4zIhuTmuddEpLVIB/VUrkOJiQ=;
 b=IiWHNQkHgZPC0TsBfmFV2AS+Df0EPWPq6l47PKXDOYEfMkf89n+tcSrf6Dj9FuDoFq
 JjdC38OKwhAsfOQIwPVwJOvagoda+tNnCAN5VuRWLsZPkZWEWLxMEqRzdR2yO9eKq7oR
 9gWXu/qcEJaAEKtf9zISVDK6RY4FI9nQcmnC/AgVjxpxB264y6iCcaAui7dkWVTyqC3Y
 t2dajbRqBYWXntoYCMVsge2zwfs4fv/yQpRIWX9YSjgNA2VmvrFRheART4BjT3RwakMq
 QW2H09atY0cjCGswRLUM59GgsM8eoOX1SHjFt/9iK3DkwSh3dWQNov9v+Oh6ZE9VL9k2
 4jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jRfQwvLhAtFfxvtMX4zIhuTmuddEpLVIB/VUrkOJiQ=;
 b=mzJaHOIu8/gRNOXFMaZJJn2IVdHi3bMLX/MCuwgOowp8gVJJEJG56SRY6ZcOkt6QWy
 J7TBQ67H3q+xlnuTUkomjQuUDDLL5q9Jv/hlvEewogPyhrfnzq+I2+Ktc1rtAtzCAhJJ
 gDseZV7fUuV/Us3XVzyF7gueSzqwxl64TRkFaJqZC6xC0w+xfIHjtaeksiEX/56psbwn
 NPCs+0bSElo+UK9saPKvngUo7/mpM3n3Hjc1tp0LJo6eP1YNSk/lPP7mofJ/zv0ij4HO
 V7DzAHZUdy627ZGdjlLsBJGrNN/8dJLWHa9XMlETdUj8PkFski0hTaHOl9OfCJ92ALrQ
 Ts9Q==
X-Gm-Message-State: AOAM5302uAyRepgXjIt/8Vlpd/HEDJ5RdPpPz+gq4GAJ4jRZpfH0aXRA
 wB1yAVhm5nkKzMzmvPXqeYk=
X-Google-Smtp-Source: ABdhPJzHmHCjGjAmzLG98CQoExTJ+LGEMlsgo0GmZdOidFv3bBky3ImCeVk9HYn548RcP9GGG2Wubw==
X-Received: by 2002:a63:1848:: with SMTP id 8mr16953pgy.347.1598593602391;
 Thu, 27 Aug 2020 22:46:42 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id y126sm47252pfy.138.2020.08.27.22.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 22:46:41 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 28 Aug 2020 14:46:29 +0900
Message-Id: <20200828054629.583577-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kBXDr-008Fjb-Vh
Subject: [f2fs-dev] [PATCH] f2fs: prevent compressed file from being
 disabled after releasing cblocks
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

After releasing cblocks, the compressed file can be accidentally
disabled in compression mode, since it has zero cblocks. As we are
using IMMUTABLE flag to present released cblocks state, we can add
IMMUTABLE state check when considering the compressed file disabling.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 02811ce15059..14d30740ba03 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3936,6 +3936,8 @@ static inline u64 f2fs_disable_compressed_file(struct inode *inode)
 	if (!f2fs_compressed_file(inode))
 		return 0;
 	if (S_ISREG(inode->i_mode)) {
+		if (IS_IMMUTABLE(inode))
+			return 1;
 		if (get_dirty_pages(inode))
 			return 1;
 		if (fi->i_compr_blocks)
-- 
2.28.0.402.g5ffc5be6b7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
