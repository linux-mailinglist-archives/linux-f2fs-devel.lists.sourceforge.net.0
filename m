Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E62CE89C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 08:28:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl5Vy-00045V-4F; Fri, 04 Dec 2020 07:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kl5Vw-00045B-0g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 07:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6FUQZouuGjXV7HSSzP01pZBA9c+FXEpV0zJrdVApAds=; b=nFPn2r0tHRNpyCbLDXwSerULG/
 IcWSyCNIXiOV7RsvVviaphuUFDlGfyHh/f3473j9hWFUsbhbpom0pElcUNkEQfc0sEWjL0D+oX8tc
 i0rB2RHrOfaDeJfzNEQN/z8V0v3mJeq3sv9p4OkGwT79OoUF4EBChpPa3uPqSqlVn7nM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6FUQZouuGjXV7HSSzP01pZBA9c+FXEpV0zJrdVApAds=; b=O
 uRnD6rfuyeAA7dT8B7diZ+nm8N4vmy9SFkJHsMKpWZVLV6uUZO3IUhHYtWm3FssfoKm/8iajGdY9n
 0uyRnrPAUHYM1a+ZJvR94En1nG0KeJuIqSHbC/E1hcPoONutt8u37vHl8AaEsGncvaCthMVe11SKF
 YwV8h8q9Zr7+mLC8=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kl5Vp-00EeDs-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 07:28:23 +0000
Received: by mail-pl1-f196.google.com with SMTP id l11so2643639plt.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 23:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FUQZouuGjXV7HSSzP01pZBA9c+FXEpV0zJrdVApAds=;
 b=abcIpuyG156+yQo7RBk+VToXBkhacslHs6qiH3+OqIBHPWtdIkndVjmQGkjTyZ1ARp
 wxsBXZr8KGHOjjPPlTAp3QzJlrRztXfZ0I7V1L9hUgrZOrjTasfEm/imYysm1jTACNF5
 9SunK4/ZzqVcK/prZyGhXESh6oslVhqaZOymADxYDBshwnIUr5HTh03yBnL47ulOaXgC
 x5CP2xQgjX4gM49nu06hftGVu2Rm5PETUTHHraQfeNO3QYN3MZ5bjaGC7TbXSTQ9XK3s
 CCPokds3X8RgK4P0ZjtezE6Z0CjB2vGGvj3/GpRuAhWTH3XWDEgh11Lc3y5LKjaPGpLY
 bEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FUQZouuGjXV7HSSzP01pZBA9c+FXEpV0zJrdVApAds=;
 b=KnCu97Nzudak6y+T9si9hUHXY2D4pwIByuzxOvxSWoQAJR+MoCIonkzRM565bO5RPu
 K3PCO5K5Ijj25TrGbU8wfgvWQjdd182EelTGWdsmhe1CCdS6rtNrAipaK45IVBjxS9Sw
 +GIhw/fXa8TTnQgjHMDKUie9C0i3505Vn4VemkxS1cXrxCXSXJXUB9DOwYCfDZ80I/sg
 bGsSSlDTgAYE5Q0lXG/sWr8s88vnB2/Rf6UWSiP9tmez4aWX+n0VSyKT9cPanL2ClA5q
 3bT16jojuPDfGfteCpme3FZ5u8036MHpkZ440VeFiEXdJW73pE4IzHdLZdxa5Is2eqis
 fQlg==
X-Gm-Message-State: AOAM532KMk8Iwhpgk/9wB2RwnL0tVMVUDGpk4hVPQmP3B6XhbUUSsr47
 R+9HKbJ6Im4D8d6NPsc0E1s=
X-Google-Smtp-Source: ABdhPJyX5/lUuPfPfy0V+XJ+9eza3uZQVd4xV93OLzIXber+Tz3h/DysCbJJ5KZ427zr5tmXkCji9w==
X-Received: by 2002:a17:902:76c8:b029:d9:d6c3:357d with SMTP id
 j8-20020a17090276c8b02900d9d6c3357dmr2922413plt.34.1607066891803; 
 Thu, 03 Dec 2020 23:28:11 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id v6sm3371666pgk.2.2020.12.03.23.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 23:28:11 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  4 Dec 2020 16:28:02 +0900
Message-Id: <20201204072802.795397-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
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
X-Headers-End: 1kl5Vp-00EeDs-Ed
Subject: [f2fs-dev] [PATCH v2] f2fs: fix race of pending_pages in
 decompression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

I found out f2fs_free_dic() is invoked in a wrong timing, but
f2fs_verify_bio() still needed the dic info and it triggered the
below kernel panic. It has been caused by the race condition of
pending_pages value between decompression and verity logic, when
the same compression cluster had been split in different bios.
By split bios, f2fs_verify_bio() ended up with decreasing
pending_pages value before it is reset to nr_cpages by
f2fs_decompress_pages() and caused the kernel panic.

[ 4416.564763] Unable to handle kernel NULL pointer dereference
               at virtual address 0000000000000000
...
[ 4416.896016] Workqueue: fsverity_read_queue f2fs_verity_work
[ 4416.908515] pc : fsverity_verify_page+0x20/0x78
[ 4416.913721] lr : f2fs_verify_bio+0x11c/0x29c
[ 4416.913722] sp : ffffffc019533cd0
[ 4416.913723] x29: ffffffc019533cd0 x28: 0000000000000402
[ 4416.913724] x27: 0000000000000001 x26: 0000000000000100
[ 4416.913726] x25: 0000000000000001 x24: 0000000000000004
[ 4416.913727] x23: 0000000000001000 x22: 0000000000000000
[ 4416.913728] x21: 0000000000000000 x20: ffffffff2076f9c0
[ 4416.913729] x19: ffffffff2076f9c0 x18: ffffff8a32380c30
[ 4416.913731] x17: ffffffc01f966d97 x16: 0000000000000298
[ 4416.913732] x15: 0000000000000000 x14: 0000000000000000
[ 4416.913733] x13: f074faec89ffffff x12: 0000000000000000
[ 4416.913734] x11: 0000000000001000 x10: 0000000000001000
[ 4416.929176] x9 : ffffffff20d1f5c7 x8 : 0000000000000000
[ 4416.929178] x7 : 626d7464ff286b6b x6 : ffffffc019533ade
[ 4416.929179] x5 : 000000008049000e x4 : ffffffff2793e9e0
[ 4416.929180] x3 : 000000008049000e x2 : ffffff89ecfa74d0
[ 4416.929181] x1 : 0000000000000c40 x0 : ffffffff2076f9c0
[ 4416.929184] Call trace:
[ 4416.929187]  fsverity_verify_page+0x20/0x78
[ 4416.929189]  f2fs_verify_bio+0x11c/0x29c
[ 4416.929192]  f2fs_verity_work+0x58/0x84
[ 4417.050667]  process_one_work+0x270/0x47c
[ 4417.055354]  worker_thread+0x27c/0x4d8
[ 4417.059784]  kthread+0x13c/0x320
[ 4417.063693]  ret_from_fork+0x10/0x18

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2: merged verity_pages with pending_pages, and increased the
    pending_pages count only if STEP_VERITY is set on bio
---
 fs/f2fs/compress.c | 2 --
 fs/f2fs/data.c     | 2 ++
 fs/f2fs/f2fs.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 87090da8693d..832b19986caf 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -803,8 +803,6 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	if (cops->destroy_decompress_ctx)
 		cops->destroy_decompress_ctx(dic);
 out_free_dic:
-	if (verity)
-		atomic_set(&dic->pending_pages, dic->nr_cpages);
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
 								ret, false);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 42254d3859c7..b825d63cabdd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2290,6 +2290,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		ctx = bio->bi_private;
 		if (!(ctx->enabled_steps & (1 << STEP_DECOMPRESS)))
 			ctx->enabled_steps |= 1 << STEP_DECOMPRESS;
+		if (ctx->enabled_steps & (1 << STEP_VERITY))
+			atomic_inc(&dic->pending_pages);
 
 		inc_page_count(sbi, F2FS_RD_DATA);
 		f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 94d16bde5e24..a9ee7921c7ec 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1340,7 +1340,7 @@ struct decompress_io_ctx {
 	struct compress_data *cbuf;	/* virtual mapped address on cpages */
 	size_t rlen;			/* valid data length in rbuf */
 	size_t clen;			/* valid data length in cbuf */
-	atomic_t pending_pages;		/* in-flight compressed page count */
+	atomic_t pending_pages;		/* in-flight compressed + verity page count */
 	bool failed;			/* indicate IO error during decompression */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
