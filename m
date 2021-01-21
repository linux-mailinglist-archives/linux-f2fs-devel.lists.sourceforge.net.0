Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC52FF868
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wd5Z6VGUXJ+EzeOgg7zOfuZXboDt6Hcf2NtL5NRkZ5E=; b=Cpx2Ej/gq62OHrSUVl5VuuP2h
	ONDkE+xtbrC3ZfmizcGBYPlUWcTDRPm91VcGcqbSo+dYSG6NSGaAYlZLIgT2TvpYX63D5UlNUl5yh
	oGgH/dyZ10v5lshbmfxrDec7ss0FwSrGT16nU6GQORIekyW/U0lh9/V+7x/on6x+0FfVs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2j26-000319-Mz; Thu, 21 Jan 2021 23:06:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3WAgKYAYKAJcJ1KP1K7FF7C5.3FD@flex--satyat.bounces.google.com>)
 id 1l2j1y-0002lJ-63
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rQjj2/WzWm3qCtm3ibhFIzAxq8pwrDZXF1QHOMz3o4g=; b=U2S/cFfvOlriW8SDBl6v8DZbC
 veCYwThdOP0hGZ9v8tun71hbitcnUPrbmqTpivzr7VvnyOEMSMq9yUUOdHAbf6mEJwNLO8rSX9Vi0
 wfOxXK2gu7fjGc2T5uNS9D6neGTjmg1bXHU4u8+Awix/JCjYiN5QR6lomfHivxY4JHjwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rQjj2/WzWm3qCtm3ibhFIzAxq8pwrDZXF1QHOMz3o4g=; b=khKEYpAN1V46GD9SfucAih3F73
 SJVtTcAJfBvi6SFrXt2N2VkmRYAyFdOt/RmLRs2ZD/g2QaG2z8w52sfXkOjP8KJeJjhabYV+31CDQ
 Zqjedvu3zYVunlkpyPS/x/sS+gKBU8Y7JOl/rJi43wBrfRGtZjKsRhl0SSffcbZFyyX0=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2izf-006Hh5-6J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:13 +0000
Received: by mail-qk1-f201.google.com with SMTP id p21so2753711qke.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=rQjj2/WzWm3qCtm3ibhFIzAxq8pwrDZXF1QHOMz3o4g=;
 b=OQwGeNkLyENvgqmLiHvbP7CSYH33j6r4RtJwGizSN8nWtM8Bd2dSMW/aHoyzXkcIXQ
 SFQAzk5HLMFt5kaGzlRUPtwP9Cbhd/ympkQ6qOFzAlI2PxYcVQ0gf5Y41UoQBpok/ssF
 pdjthPoUH3UPaE0tH2FUI6ZXptBS76fptbASUd5oFKbwFtVjL+37a5dGq3QxI8snd6w2
 /ZXit2IQfvc79GmSw0sHRQPGpRCCqCtWa32wqwXTBD9Q5oUnteXCjDPx8vA++4qRAB8/
 5eOStHbSSsuYUP+zC61cZOHerpgOL2Kh/UfZQ+22Z1w+MhDwLjcekAl9wXkg40ZZM1zP
 yyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rQjj2/WzWm3qCtm3ibhFIzAxq8pwrDZXF1QHOMz3o4g=;
 b=DSOZVQSJsnu3obRPE51YjiKJAxo3ZMwRvMWEa23hoI35Ta6v0wd1WmDIB0NS1NeHFL
 SQSkb7b7vgQ47qvQcoxKQ/h100hE8XgEn488V2qXTiwzKOcgFHV95QXt2NSpFGCkpj6q
 +aZ97ahgxGsJ1WSYJjPgYhN/h+W1Nye9prvyvyf7EKZyrkXx5QRYVQr4LNABklw3GMZu
 nC4qau1YMPaGHdc9Mj17BrUB7Wy1qMyztBqIR61t3tcpZJZCfqiLng0wwpJTvqd9hx4g
 ipIjdQzCsUWOOWyydUue6dWaPe3JkGF7Nt2ec5Ln/a4QG/LAdU8QmFSen9bUxzwDVsok
 IGww==
X-Gm-Message-State: AOAM531XNtJBoLUb46tm7eBKwbON/wycbTzZkEtscmNzm+UTrJE043cM
 PlZ+bOPDTjtJIf5g3ghdDdU+lEH8+Ho=
X-Google-Smtp-Source: ABdhPJzBS4n+vW6iQYRenoIZnviw813XxH38zeCsNFuDUBoahsAaZ41A78g1uNGV7RY2FFPhiAQAyieotuA=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a0c:a692:: with SMTP id
 t18mr2037203qva.18.1611270232543; 
 Thu, 21 Jan 2021 15:03:52 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:35 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-8-satyat@google.com>
Mime-Version: 1.0
References: <20210121230336.1373726-1-satyat@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2izf-006Hh5-6J
Subject: [f2fs-dev] [PATCH v8 7/8] f2fs: support direct I/O with fscrypt
 using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up f2fs with fscrypt direct I/O support. direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when the *length* of the
I/O is aligned to the filesystem block size (which is *not* necessarily the
same as the block device's block size).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb11759191dc..5130423a13e7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4091,7 +4091,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (f2fs_post_read_required(inode))
+	if (!fscrypt_dio_supported(iocb, iter))
+		return true;
+	if (fsverity_active(inode))
+		return true;
+	if (f2fs_compressed_file(inode))
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-- 
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
