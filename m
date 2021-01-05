Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F52EA2DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 02:29:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwb9g-0001va-Sn; Tue, 05 Jan 2021 01:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kwb9f-0001vL-EC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 01:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C3UjD26QN0UA/ub3IY5/65dvjqpB+2GS72iiAT/kBTU=; b=bHZC6LylWBCWCgZVKxBji4Rk0W
 FteWljVN9mxqu9YyJA2EiD4n3Pbw622Jn7zdMJxT/+vPbsJqyp9s7zVqmLT13kxq9eGbF2Ig9u1OK
 HBPflw+N39FdfEg/o3gMZ1NFinC3TWE1C6xIgtQTGeAqJQmFB8Men2ud+L6xrfTGm/7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C3UjD26QN0UA/ub3IY5/65dvjqpB+2GS72iiAT/kBTU=; b=d
 1zUt8BlMlC/661DV4FD0WwMcKFpx2wm6vCCZgjoZtFp7xs9j3cTYMF9njwzJYFcAflldf/Z/R5cSU
 hsOAJlL5MIfgdl4+QKVbEXkF4929UncocaW1+OcqzSgj9SxSX+NGl86s4z+DHCLhsPPSn9qCylyfd
 MLqFkukvFhaeVKHM=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwb9a-00E402-C3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 01:28:59 +0000
Received: by mail-pj1-f44.google.com with SMTP id b5so735013pjl.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Jan 2021 17:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3UjD26QN0UA/ub3IY5/65dvjqpB+2GS72iiAT/kBTU=;
 b=Slobn0e8o4BZv6BeB5DyM/pu1y93XUeoGPA3Fp5x33Lx8DO5Emw6mGz9vvERtceiwD
 LxLfX4kdY04SBYfvOz/lIJBB0qcMpb9Z0wDeTM58BUXOhPmJu75OMJe0CPOciSCq04Ka
 Y8OpIhDFY5Tj0Di8BCVPz/XhvpoS/uI+/07hQKYFBnF3+M5zRBsv2NNH/FcbFBQti0DX
 KS1/wV4dBtMND6OJkUIbRk8HBShwdL9Lhi1RzBX4FmWn5nh4995NXeVs6BeQuhbFobyV
 YjQ0Wwi6pOKywkEgkUwTTC1J/oTf4TyRFaDWA364u4me/ve7tgCGbt6I9V5G3NbNSczU
 DcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3UjD26QN0UA/ub3IY5/65dvjqpB+2GS72iiAT/kBTU=;
 b=jWg1wrV2kKoo2c/Sqep1FYKSqaAvsEdIx5rAeCjSMrOHXzdta4Ei1B9tygLEWdt+7y
 Pm6Om+fTKb9wl5LjswxDdIkQeMp1WhX4y1nkTgxAT3hMofQcGVuQFYww/2sGHBqqpU1K
 cHLSDY0BlbQaJANQHogAnjAzPdMwkto1xlZNMZRItzxjYreRi0BxUD1yKdm3qwb3TA2r
 Og2BquGu7/XwKUZnaY0EEJa7Gf86OQpsijncDdQ5nGW2k1toXZJdQtHuRbhToaqv8vyZ
 QbzXJIVcOPNSbsDC/0DXe5+8ZwqJSbVmgfiqcbBET4zXcokbs/NJSTI5vyNZJtpRIsCq
 T3oQ==
X-Gm-Message-State: AOAM532NEB+wujfaN8kiDHdaAz4P7mjL6VNs83dnNwF6HvFkOCdbFscI
 Md9ex1B6PMo2A2eTstOG7Ic=
X-Google-Smtp-Source: ABdhPJxrKeoDrpk/5rKEEhyYr9KaUFCepjqwD9TehEVWXuoIAm/tlbIcKWcAzv1OubjLUWL/lR3lIQ==
X-Received: by 2002:a17:90a:5914:: with SMTP id
 k20mr1582782pji.199.1609810121409; 
 Mon, 04 Jan 2021 17:28:41 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id gk8sm531043pjb.52.2021.01.04.17.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 17:28:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  5 Jan 2021 10:28:26 +0900
Message-Id: <20210105012826.956800-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.44 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
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
X-Headers-End: 1kwb9a-00E402-C3
Subject: [f2fs-dev] [PATCH] f2fs: fix null page reference in redirty_blocks
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
Cc: Colin Ian King <colin.king@canonical.com>,
 Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Fixed null page reference when find_lock_page() fails in
redirty_blocks().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reported-by: Colin Ian King <colin.king@canonical.com>
Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
---
 fs/f2fs/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9e5275716be8..bf6682a52433 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4060,8 +4060,10 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 
 	for (i = 0; i < page_len; i++, redirty_idx++) {
 		page = find_lock_page(mapping, redirty_idx);
-		if (!page)
+		if (!page) {
 			ret = -ENOENT;
+			continue;
+		}
 		set_page_dirty(page);
 		f2fs_put_page(page, 1);
 		f2fs_put_page(page, 0);
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
