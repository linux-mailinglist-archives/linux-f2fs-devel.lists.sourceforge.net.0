Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA4B173D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 17:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3DXHWNrIDK+PMgkDlj8iSbFNkoLThE6GAlPm5Plwtw=; b=L5tkN2fcMJd7Lx7KTLseuIaNby
	wtLGS4luc0DUHjgrHN2jCWVBHx8QW2ZQUBvP3f/myV1EGXpyo3qQCiaS+ex21AlDFxtRo4a8TO+CG
	6mSba5Be7PYafIYpAIWXBMgfVLVX5LEQvUvA48yYh2E6f/lmNVlvMvlHT1r2f7WZ3OMM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhV49-0005Fm-NA;
	Thu, 31 Jul 2025 15:19:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <masonzhang.linuxer@gmail.com>) id 1uhV48-0005FW-4G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 15:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ntUJofDKe8wwaimI0OS2So25zzUtNcde+OO7bpC6jDs=; b=Ny9Mj9gHupVADBxh+d6lwAV5+M
 HECwBJ8xjtpDDAIL4CSJFenXZMxQi0iGtkG4UvUiYeJLeoDmhbdr0sx/3u4zMgvg2jDvvvQ8Qhqpc
 jdhvHzjjEK1XqYYR87lmMYgW7/i8mXdvlezKw8UaR0PfG1Yq0GMfIYBqG73/QpNleqo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ntUJofDKe8wwaimI0OS2So25zzUtNcde+OO7bpC6jDs=; b=d
 MTNpf9IGlnqi/N8Ka67F5MHfeuQSJLeF0sYIALxRPCEiWkdys1XeGzsYQT1Zm9igFxaupEsUl0ZZU
 akvHU2yZKnMut7XFTxnEhFkjkcGVyqaq3yP8vLfjIClcKb72SFcGFjoVJb2cOmQmYtg33VjXy0Idv
 NO+DQ48H2wX+LDl0=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uhV48-0002Y2-J7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 15:19:32 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7698e914cd2so666431b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Jul 2025 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753975162; x=1754579962; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ntUJofDKe8wwaimI0OS2So25zzUtNcde+OO7bpC6jDs=;
 b=G81WYeOJ9Npijx0+ydvk2tIN8K9alqaIAlGwcIXUae2b8ScW6YBjq+gO/4KtP2JrQw
 iNhICN9eVj5CC367zS1TyMJmwCxt9RJgFfPT6pj7zWKaMVC+IcpdQC/8P4zVCRYRG1ow
 UqupzmuN6u5mlE8Cz2QIxiD3kh6ExiVQK28vO/heEZqpogUMwwq1oZJafYlGgZeUUmMC
 6ro/YvOZjzqgCsuQWQLP6UCAjcHUX7Rwrg9g4VCDotGx9Id/0uOiTORvo+duLrTPVce4
 uUctjlJCVqCnBRDvxrAOEY25H4Zoe2705M08FSopRSCbddcUghc1K/ot6rKGIFtyQE10
 dzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753975162; x=1754579962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ntUJofDKe8wwaimI0OS2So25zzUtNcde+OO7bpC6jDs=;
 b=EEcCYY/EnYT1vSQw2a+e1WaP+UXOZJRwQRpb1nmxZtQggW9rmsChg2m9FQnWid+MVd
 ftY4ShsHP0yW8Lo/4M9Ey5UZtJhFqNK5tJ+IC2jCTvhC5/x/cbi+p9G0h4SlioNlgoqm
 YhQed616JwGM4MBzrtQtB7j7aN5hG5tRCOJbEdN6+IRnvHgMaiebYrV5f30u4MGSOO03
 5mUWTHIP95iQeR8PxsDIO+BqSlHG8BagtRVE/z/68xtUS9F6VQih6EdT2uqfjp7OAv11
 i+01d3/lCbvp5Jc39QdheteidReUO92AcS+L60Wr0NMHCm0+5c66RBBhGhplEJ4eoTNc
 q69A==
X-Gm-Message-State: AOJu0YytYtEH5MEMu/nyxjwk3SwHDD6ch/Zj7Diwkbz9SOZ7W6LYIo0N
 Ptd7odUCRlzapUCnloEbdGHLYqhypdwP5Jbct7d6UkwIhJ1Nq/xLhMe2
X-Gm-Gg: ASbGnctjTacsUkH8ow+CXhK+d1OfZV9bCiR641zjAggMbfRXlQWWZAm0Dbh+xfQl41t
 ZrgDayfJBUQxJDB8ckB9j6NTEnYbsbMr2SKibuLRRi8CI4iS5i7g7Il7T/6Dvu+oSUR7YAJtGOs
 TlpuwTHSg22P6/Nxb4VjQ1FbOWLjkBDWzvPjJRJfx1UnhLJ99IMKM1xFW79emzyFk6PnMXL9T+4
 Graby2632wblpsHHmurMYq0D6j+UdPd4SS2trBVYR9E8w4PM8fzvanWVNmcZVpwWWADdfobetf1
 Nuv23rY7icdeshytE/oK7yUPBFkOq1mtJHALYJx2QOnsxN0+qLilezh5FRWrZ9LrY/g0J7rA4do
 IcLPQLHky2O00fbXbBuZp12vtd/FbS4Q=
X-Google-Smtp-Source: AGHT+IGLoUTKAtWdvyiVturBVj/0fg+adawvkZ0OKT1ir434tjDDoB9sw7+kApOWZOoJmk6l5Kmsug==
X-Received: by 2002:a05:6a00:4b05:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-76ab1021233mr9332756b3a.1.1753975161820; 
 Thu, 31 Jul 2025 08:19:21 -0700 (PDT)
Received: from localhost ([61.152.208.177])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-76bccfcfe18sm1918279b3a.93.2025.07.31.08.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:19:21 -0700 (PDT)
From: "mason.zhang" <masonzhang.linuxer@gmail.com>
To: chao@kernel.org
Date: Thu, 31 Jul 2025 23:19:17 +0800
Message-ID: <20250731151917.24800-1-masonzhang.linuxer@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 the filesystem may unaware of potential file corruption.
 Signed-off-by: mason.zhang --- fs/f2fs/segment.c | 10 ++++++++-- 1 file
 changed, 8 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
 index ae1223ef648f..9992922df86f 100644 --- a/fs/f2fs/segment.c +++
 b/fs/f2fs/segment.c
 @@ -3936,12 +3936,18 @@ static void do_write_page(struct f2fs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [masonzhang.linuxer(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uhV48-0002Y2-J7
Subject: [f2fs-dev] [PATCH v3] f2fs: add error checking in do_write_page()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, the filesystem may unaware of potential file corruption.

Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>
---
 fs/f2fs/segment.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ae1223ef648f..9992922df86f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3936,12 +3936,18 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 	int seg_type = log_type_to_seg_type(type);
 	bool keep_order = (f2fs_lfs_mode(fio->sbi) &&
 				seg_type == CURSEG_COLD_DATA);
+	int err;
 
 	if (keep_order)
 		f2fs_down_read(&fio->sbi->io_order_lock);
 
-	if (f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio)) {
+	err = f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
+			&fio->new_blkaddr, sum, type, fio);
+	if (unlikely(err)) {
+		f2fs_err_ratelimited(fio->sbi,
+			"%s Failed to allocate data block, ino:%u, index:%lu, type:%d, old_blkaddr:0x%x, new_blkaddr:0x%x, err:%d",
+			__func__, fio->ino, folio->index, type,
+			fio->old_blkaddr, fio->new_blkaddr, err);
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
