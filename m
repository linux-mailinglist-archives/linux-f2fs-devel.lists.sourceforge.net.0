Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKylC9fzD2qXRwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 08:12:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D25AF68A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 08:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aBfv1b+nWO5sTbGa9BwGLXgT5BGx/WITcOlm+e49b6g=; b=CkVli54laQ3u3uc1z31gn8Rfoe
	tpWaFsMCp2NAQQXxinxlSUjIJchNyta/06kcM1MRCr6sSNH7d9LtLGSTRivG8U7UAWN8gE/27GUA/
	EOVymBrO9it9bOyf/Ss4pbYwYQtHSxbf78IN0/Bz2A46GUjDbLYfbDL+p80JhIVKwQG0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQJ7P-0004Kj-PZ;
	Fri, 22 May 2026 06:12:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wQJ7O-0004Kc-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 06:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6CYsnbQpwdBss8UJyhFzNCVV7Ck7wGnXEx/PkWGq2/s=; b=I2J1d+w5FohP6O/7U1W//Rke4X
 8WRNQZEDc+nF5vCV1CRKsdhVrk9XWXFzBtR/367rno6x6MdEPFh20Os/jnx8IHxgFUkwMRwuhht1z
 WGOMnbBBty51YpZCPfNomsd24ECtkWOoxFiM+cAtRx53VAM2rKiH4WWQxFevizPGUr14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6CYsnbQpwdBss8UJyhFzNCVV7Ck7wGnXEx/PkWGq2/s=; b=E
 veVSBoNmQhteEhKgC6Ip+I0p8mY70ggqxPYGdh3XGh3IEb7Jt8GX1rd1nVqu0acSKuiG914NM9Op9
 LyMycsMBBnkuCBhzr2m8QfqMhElKRVzQDEKRjrQbC4MEshmo4KSjdFwYPrl4VrfRe2+5HPvnsnZyA
 QYiokIeTfsib9dlY=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wQJ7O-0005r0-Mq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 06:12:23 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-36900945df5so3532818a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2026 23:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779430332; x=1780035132; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6CYsnbQpwdBss8UJyhFzNCVV7Ck7wGnXEx/PkWGq2/s=;
 b=JQ1cDCxMt+wgfnqxOuUDPZpWD28yHrc9xVRX4jAuI7GkxUzJ2ZGrY3glPiHLHayaQR
 dXGzW39mWK3/I1WyVRMsEBe1pvorgDdeE+i+vCVF7dGwhEXIPq9j56q33QoiAhwwkM6k
 of52mfj5VI2vLlbaqiHx3ciBCmRY9vGrbqBthYmUH0jB5lXRx2C0RUpti4B0fcIaYMP5
 Kh3bQ6J6QcQt7isYl4i8S4ye0V+EgutcD1eGZchRoXu432F9Oodn/wH+cHPz5QEu0fyk
 YV8VMIhd7Mf6VJxoh6x2rME1B+rWBG1Hd+12ZNE+iN3I3p0GFB8oe/hwYuNnMN7DfkkS
 O0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779430332; x=1780035132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CYsnbQpwdBss8UJyhFzNCVV7Ck7wGnXEx/PkWGq2/s=;
 b=oFZxM4KYLs4YPmJt7/9kMOZC+gr6AVJNbAU7KxTHpqrR28uyIDIhhazUgi36LFBEpB
 m0LbZDV4aoy+J5ewdUxT60LPbJ1Xn4gl+vdtKpY9dMbY8/VSlc669RLJp93ccRH0K0v4
 6V5i9gpVgw8lFIuaZxHx17X3vq27lCNeFUF8iSuL2keoHh5iCvnyJpdcgO1nDLt34dMR
 /tvSxUmg2AYByGQdobRvK1uvrg3fixNBYMXEthV9cR876U7Hwnfm3p0Fp2ZQ75czdE/3
 TSVF0HkdJGtHj9B4p5t70egx+qDtvujnFN7+LH5Yb0rtXi+uWXJMh5AwnpXrGw/L99Fq
 H5PA==
X-Gm-Message-State: AOJu0YzWFbVKCMiIvsNy9k+bneUyY8quWEkrzLNE3He0zj07jEz8HUHE
 J77aYWfX9bbpBQm8Wx8V7LJT0D2Ios1j/KnWvCe8FIhe/NruRdMGLLAJTh8Tb7Yz
X-Gm-Gg: Acq92OHcyCLITjxt5BtM2xwjylZ1AwLpL3c+0L37j5x5c4bCsBR87lBKvPEKWCnGxfs
 UiJBKTEV63rmytT/jHpsh4dVgisy5h2yM2djyXcIWqWElazYRYmeCBd0ndyThzN2kpO7ancaKwI
 NezsuUqxAsDxLvaaPrJ1D2kW0poW7lg9vl5SiyYWpuXaJNTXLD+5dFd3bJQBEJx88Yid/5XVqjc
 ua90VlA8SigWjbtUH1sfsSxWh2Z+sxCokozsdXGWY9b6upXfs18s3OOJoTws9PaT7gauV6R6Fog
 W/05IGSLUi1FSyRVsMjIMmMfImndAZCkg+v6/xJapz2BcDv29j5G6xe3FwBGDiT6DbTZcGSNr7a
 MTjl7I9nfKy9hK8aEtrBJjsB/DI/9z1jeTbAziH/c9Rlsg7RFJsdBaCXXb0cjcs9y+ENBVaRtzF
 J529DrtevfUezwjXboQBolVWPxdWRkasUd4Q+V6S9EgUEK+cu/VncNa6hs5Nwyket4lfW7ZQ==
X-Received: by 2002:a17:90b:2812:b0:369:b1d3:fa48 with SMTP id
 98e67ed59e1d1-36a6761ead9mr2052200a91.18.1779430332431; 
 Thu, 21 May 2026 23:12:12 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a71dc0f5csm827473a91.7.2026.05.21.23.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 23:12:12 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 22 May 2026 14:12:06 +0800
Message-ID: <20260522061206.2405336-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: io_uring can pass a per-I/O write stream through
 kiocb->ki_write_stream, 
 and block direct I/O propagates that value to bio->bi_write_stream. F2FS
 added FDP stream mapping for DATA writes, but its direct write submit hook
 always rewrites bio->bi_write_stream from the inode write hint and F2FS
 temperature. As a result, a direct write with an [...] 
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
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wQJ7O-0005r0-Mq
Subject: [f2fs-dev] [PATCH] f2fs: honor per-I/O write streams for direct
 writes
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 688D25AF68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

io_uring can pass a per-I/O write stream through kiocb->ki_write_stream,
and block direct I/O propagates that value to bio->bi_write_stream.

F2FS added FDP stream mapping for DATA writes, but its direct write
submit hook always rewrites bio->bi_write_stream from the inode write
hint and F2FS temperature. As a result, a direct write with an explicit
io_uring write_stream is submitted to the F2FS-selected stream instead
of the user-requested stream.

Validate an explicit write stream before starting F2FS direct I/O, pass
the kiocb through the iomap private pointer, and preserve the per-I/O
stream in the direct write bio. When no per-I/O stream is supplied, keep
using the existing F2FS temperature-to-stream mapping.

Fixes: 42f7a7a50a33 ("f2fs: map data writes to FDP streams")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/file.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 71385ca4163d..20d6e7ab7416 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5074,17 +5074,36 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 	return 0;
 }
 
+static bool f2fs_valid_write_stream(struct f2fs_sb_info *sbi, u8 write_stream)
+{
+	int i;
+
+	if (!write_stream)
+		return true;
+	if (!f2fs_is_multi_device(sbi))
+		return write_stream <= bdev_max_write_streams(sbi->sb->s_bdev);
+
+	for (i = 0; i < sbi->s_ndevs; i++)
+		if (write_stream > bdev_max_write_streams(FDEV(i).bdev))
+			return false;
+	return true;
+}
+
 static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 					struct bio *bio, loff_t file_offset)
 {
 	struct inode *inode = iter->inode;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct kiocb *iocb = iter->private;
 	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
 	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
 
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
-	bio->bi_write_stream =
-		f2fs_io_type_to_write_stream(bio->bi_bdev, DATA, temp);
+	if (iocb->ki_write_stream)
+		bio->bi_write_stream = iocb->ki_write_stream;
+	else
+		bio->bi_write_stream =
+			f2fs_io_type_to_write_stream(bio->bi_bdev, DATA, temp);
 	blk_crypto_submit_bio(bio);
 }
 
@@ -5122,6 +5141,11 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 
 	trace_f2fs_direct_IO_enter(inode, iocb, count, WRITE);
 
+	if (!f2fs_valid_write_stream(sbi, iocb->ki_write_stream)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (iocb->ki_flags & IOCB_NOWAIT) {
 		/* f2fs_convert_inline_inode() and block allocation can block */
 		if (f2fs_has_inline_data(inode) ||
@@ -5159,7 +5183,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	if (pos + count > inode->i_size)
 		dio_flags |= IOMAP_DIO_FORCE_WAIT;
 	dio = __iomap_dio_rw(iocb, from, &f2fs_iomap_ops,
-			     &f2fs_iomap_dio_write_ops, dio_flags, NULL, 0);
+			     &f2fs_iomap_dio_write_ops, dio_flags, iocb, 0);
 	if (IS_ERR_OR_NULL(dio)) {
 		ret = PTR_ERR_OR_ZERO(dio);
 		if (ret == -ENOTBLK)

base-commit: 520760b9f9156bf9698de38dc44c614fad68a1f9
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
