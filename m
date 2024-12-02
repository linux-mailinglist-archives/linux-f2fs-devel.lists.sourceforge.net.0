Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9819DF7BB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 02:10:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tHuwx-0002XE-Fd;
	Mon, 02 Dec 2024 01:10:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tHuwp-0002TM-Un
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RhelbwTL2aFpXxb0mxMsXy9zJ2PZTkFOodMiLgkl8UE=; b=FuUMhiu/+rdV9aAgDIGzrTq/Gg
 U6P8B/9P8g3pbK/mhi/VKYcQlaCEyhj5S0NfPQmB7jwtCvJenlhy2k9oFfLK67MYG5iZvP6zDqOTS
 e/GTTkYVMjkRu874zcNg2QcwhGXaHVHGSXfpBubvmD4SXXpbv1H+bie/n/sTW+XHWqbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RhelbwTL2aFpXxb0mxMsXy9zJ2PZTkFOodMiLgkl8UE=; b=BMBVlTyleliuHGVkgWLFqnX47b
 kF+YY51m3u4RrIygAl/n6U/7VYnBWaEbJR8Q2JWQ9zukzFeB3eoU1gl+SjfugLin0KynK2h380n5P
 RgmIu+Iq2qOhORLtBvIaOn9oaCAg3O17NwkYXhgGNce7oTZmTSXE6TRmFvkmntCSkc4Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tHuwa-0006Lf-2X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 358D35C64EF;
 Mon,  2 Dec 2024 01:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99289C4CEDB;
 Mon,  2 Dec 2024 01:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733101780;
 bh=hlFeLzyGc3JjwVBrehvr7U2Wl4Dwvw2DvugpMUEgf6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c86X6HLd9CGSel8rB2pbUPGa6KU3kXJ0LpwwO8yEK2LDGc2G99ba011DxGQxrnaom
 GVFv/AKE5onb2IMbZ3Cmoy/6R0KMf10cDVMIFibxBcLRnmDDIbwKdN1ZQEsU+IQpKw
 6gHtZ1GQeo16TOBgunJJLzFh7CPP3n6PDMTryJNoArPOerjPf4tY2imGc/zOxXV4Mc
 yVEFYaduH9tv6mWW7G100pLLBPKVyNrMMNI5wyrQIcUh8XKkBy2Xtl6D0Zn6EZtazn
 lIHLvUIP7+ckWMh1LKb2l/9KPulqsBrWCxlTDCP7LKTpHlXivtmHltMjIq4fjj3jo7
 O+oaF9UOZoCeg==
To: linux-kernel@vger.kernel.org
Date: Sun,  1 Dec 2024 17:08:44 -0800
Message-ID: <20241202010844.144356-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the
 crc32c()
 library function directly takes advantage of architecture-specific
 optimizations, 
 it is unnecessary to go through the crypto API. Just use crc32c(). This is
 much simpler, and it [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tHuwa-0006Lf-2X
Subject: [f2fs-dev] [PATCH v4 19/19] scsi: target: iscsi: switch to using
 the crc32c library
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 x86@kernel.org, linux-mips@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/target/iscsi/Kconfig              |   3 +-
 drivers/target/iscsi/iscsi_target.c       | 153 +++++++---------------
 drivers/target/iscsi/iscsi_target_login.c |  50 -------
 drivers/target/iscsi/iscsi_target_login.h |   1 -
 drivers/target/iscsi/iscsi_target_nego.c  |  21 +--
 include/target/iscsi/iscsi_target_core.h  |   3 -
 6 files changed, 49 insertions(+), 182 deletions(-)

diff --git a/drivers/target/iscsi/Kconfig b/drivers/target/iscsi/Kconfig
index 1c0517a12571..70d76f3dd693 100644
--- a/drivers/target/iscsi/Kconfig
+++ b/drivers/target/iscsi/Kconfig
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ISCSI_TARGET
 	tristate "SCSI Target Mode Stack"
 	depends on INET
+	select CRC32
 	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRYPTO_HASH
 	help
 	Say M to enable the SCSI target mode stack. A SCSI target mode stack
 	is software that makes local storage available over a storage network
 	to a SCSI initiator system. The supported storage network technologies
 	include iSCSI, Fibre Channel and the SCSI RDMA Protocol (SRP).
diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
index 6002283cbeba..091c1efccfb7 100644
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@ -6,11 +6,11 @@
  *
  * Author: Nicholas A. Bellinger <nab@linux-iscsi.org>
  *
  ******************************************************************************/
 
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #include <linux/string.h>
 #include <linux/kthread.h>
 #include <linux/completion.h>
 #include <linux/module.h>
 #include <linux/vmalloc.h>
@@ -488,12 +488,12 @@ void iscsit_aborted_task(struct iscsit_conn *conn, struct iscsit_cmd *cmd)
 
 	__iscsit_free_cmd(cmd, true);
 }
 EXPORT_SYMBOL(iscsit_aborted_task);
 
-static void iscsit_do_crypto_hash_buf(struct ahash_request *, const void *,
-				      u32, u32, const void *, void *);
+static u32 iscsit_crc_buf(const void *buf, u32 payload_length,
+			  u32 padding, const void *pad_bytes);
 static void iscsit_tx_thread_wait_for_tcp(struct iscsit_conn *);
 
 static int
 iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 			  const void *data_buf, u32 data_buf_len)
@@ -508,13 +508,11 @@ iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 	iov[niov++].iov_len	= ISCSI_HDR_LEN;
 
 	if (conn->conn_ops->HeaderDigest) {
 		u32 *header_digest = (u32 *)&cmd->pdu[ISCSI_HDR_LEN];
 
-		iscsit_do_crypto_hash_buf(conn->conn_tx_hash, hdr,
-					  ISCSI_HDR_LEN, 0, NULL,
-					  header_digest);
+		*header_digest = iscsit_crc_buf(hdr, ISCSI_HDR_LEN, 0, NULL);
 
 		iov[0].iov_len += ISCSI_CRC_LEN;
 		tx_size += ISCSI_CRC_LEN;
 		pr_debug("Attaching CRC32C HeaderDigest"
 			 " to opcode 0x%x 0x%08x\n",
@@ -535,15 +533,13 @@ iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 			pr_debug("Attaching %u additional"
 				 " padding bytes.\n", padding);
 		}
 
 		if (conn->conn_ops->DataDigest) {
-			iscsit_do_crypto_hash_buf(conn->conn_tx_hash,
-						  data_buf, data_buf_len,
-						  padding, &cmd->pad_bytes,
-						  &cmd->data_crc);
-
+			cmd->data_crc = iscsit_crc_buf(data_buf, data_buf_len,
+						       padding,
+						       &cmd->pad_bytes);
 			iov[niov].iov_base = &cmd->data_crc;
 			iov[niov++].iov_len = ISCSI_CRC_LEN;
 			tx_size += ISCSI_CRC_LEN;
 			pr_debug("Attached DataDigest for %u"
 				 " bytes opcode 0x%x, CRC 0x%08x\n",
@@ -564,12 +560,12 @@ iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 }
 
 static int iscsit_map_iovec(struct iscsit_cmd *cmd, struct kvec *iov, int nvec,
 			    u32 data_offset, u32 data_length);
 static void iscsit_unmap_iovec(struct iscsit_cmd *);
-static u32 iscsit_do_crypto_hash_sg(struct ahash_request *, struct iscsit_cmd *,
-				    u32, u32, u32, u8 *);
+static u32 iscsit_crc_sglist(const struct iscsit_cmd *cmd, u32 data_length,
+			     u32 padding, const u8 *pad_bytes);
 static int
 iscsit_xmit_datain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		       const struct iscsi_datain *datain)
 {
 	struct kvec *iov;
@@ -582,14 +578,12 @@ iscsit_xmit_datain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 	tx_size += ISCSI_HDR_LEN;
 
 	if (conn->conn_ops->HeaderDigest) {
 		u32 *header_digest = (u32 *)&cmd->pdu[ISCSI_HDR_LEN];
 
-		iscsit_do_crypto_hash_buf(conn->conn_tx_hash, cmd->pdu,
-					  ISCSI_HDR_LEN, 0, NULL,
-					  header_digest);
-
+		*header_digest = iscsit_crc_buf(cmd->pdu, ISCSI_HDR_LEN, 0,
+						NULL);
 		iov[0].iov_len += ISCSI_CRC_LEN;
 		tx_size += ISCSI_CRC_LEN;
 
 		pr_debug("Attaching CRC32 HeaderDigest for DataIN PDU 0x%08x\n",
 			 *header_digest);
@@ -612,16 +606,12 @@ iscsit_xmit_datain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 
 		pr_debug("Attaching %u padding bytes\n", cmd->padding);
 	}
 
 	if (conn->conn_ops->DataDigest) {
-		cmd->data_crc = iscsit_do_crypto_hash_sg(conn->conn_tx_hash,
-							 cmd, datain->offset,
-							 datain->length,
-							 cmd->padding,
-							 cmd->pad_bytes);
-
+		cmd->data_crc = iscsit_crc_sglist(cmd, datain->length,
+						  cmd->padding, cmd->pad_bytes);
 		iov[iov_count].iov_base	= &cmd->data_crc;
 		iov[iov_count++].iov_len = ISCSI_CRC_LEN;
 		tx_size += ISCSI_CRC_LEN;
 
 		pr_debug("Attached CRC32C DataDigest %d bytes, crc 0x%08x\n",
@@ -1402,81 +1392,49 @@ iscsit_handle_scsi_cmd(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		return 0;
 
 	return iscsit_get_immediate_data(cmd, hdr, dump_payload);
 }
 
-static u32 iscsit_do_crypto_hash_sg(
-	struct ahash_request *hash,
-	struct iscsit_cmd *cmd,
-	u32 data_offset,
-	u32 data_length,
-	u32 padding,
-	u8 *pad_bytes)
+static u32 iscsit_crc_sglist(const struct iscsit_cmd *cmd, u32 data_length,
+			     u32 padding, const u8 *pad_bytes)
 {
-	u32 data_crc;
-	struct scatterlist *sg;
-	unsigned int page_off;
-
-	crypto_ahash_init(hash);
-
-	sg = cmd->first_data_sg;
-	page_off = cmd->first_data_sg_off;
-
-	if (data_length && page_off) {
-		struct scatterlist first_sg;
-		u32 len = min_t(u32, data_length, sg->length - page_off);
-
-		sg_init_table(&first_sg, 1);
-		sg_set_page(&first_sg, sg_page(sg), len, sg->offset + page_off);
-
-		ahash_request_set_crypt(hash, &first_sg, NULL, len);
-		crypto_ahash_update(hash);
-
-		data_length -= len;
-		sg = sg_next(sg);
-	}
+	struct scatterlist *sg = cmd->first_data_sg;
+	unsigned int page_off = cmd->first_data_sg_off;
+	u32 crc = ~0;
 
 	while (data_length) {
-		u32 cur_len = min_t(u32, data_length, sg->length);
+		u32 cur_len = min_t(u32, data_length, sg->length - page_off);
+		const void *virt;
 
-		ahash_request_set_crypt(hash, sg, NULL, cur_len);
-		crypto_ahash_update(hash);
+		virt = kmap_local_page(sg_page(sg)) + sg->offset + page_off;
+		crc = crc32c(crc, virt, cur_len);
+		kunmap_local(virt);
 
-		data_length -= cur_len;
 		/* iscsit_map_iovec has already checked for invalid sg pointers */
 		sg = sg_next(sg);
-	}
 
-	if (padding) {
-		struct scatterlist pad_sg;
-
-		sg_init_one(&pad_sg, pad_bytes, padding);
-		ahash_request_set_crypt(hash, &pad_sg, (u8 *)&data_crc,
-					padding);
-		crypto_ahash_finup(hash);
-	} else {
-		ahash_request_set_crypt(hash, NULL, (u8 *)&data_crc, 0);
-		crypto_ahash_final(hash);
+		page_off = 0;
+		data_length -= cur_len;
 	}
 
-	return data_crc;
+	if (padding)
+		crc = crc32c(crc, pad_bytes, padding);
+
+	return ~crc;
 }
 
-static void iscsit_do_crypto_hash_buf(struct ahash_request *hash,
-	const void *buf, u32 payload_length, u32 padding,
-	const void *pad_bytes, void *data_crc)
+static u32 iscsit_crc_buf(const void *buf, u32 payload_length,
+			  u32 padding, const void *pad_bytes)
 {
-	struct scatterlist sg[2];
+	u32 crc = ~0;
 
-	sg_init_table(sg, ARRAY_SIZE(sg));
-	sg_set_buf(sg, buf, payload_length);
-	if (padding)
-		sg_set_buf(sg + 1, pad_bytes, padding);
+	crc = crc32c(crc, buf, payload_length);
 
-	ahash_request_set_crypt(hash, sg, data_crc, payload_length + padding);
+	if (padding)
+		crc = crc32c(crc, pad_bytes, padding);
 
-	crypto_ahash_digest(hash);
+	return ~crc;
 }
 
 int
 __iscsit_check_dataout_hdr(struct iscsit_conn *conn, void *buf,
 			   struct iscsit_cmd *cmd, u32 payload_length,
@@ -1660,15 +1618,12 @@ iscsit_get_dataout(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		return -1;
 
 	if (conn->conn_ops->DataDigest) {
 		u32 data_crc;
 
-		data_crc = iscsit_do_crypto_hash_sg(conn->conn_rx_hash, cmd,
-						    be32_to_cpu(hdr->offset),
-						    payload_length, padding,
-						    cmd->pad_bytes);
-
+		data_crc = iscsit_crc_sglist(cmd, payload_length, padding,
+					     cmd->pad_bytes);
 		if (checksum != data_crc) {
 			pr_err("ITT: 0x%08x, Offset: %u, Length: %u,"
 				" DataSN: 0x%08x, CRC32C DataDigest 0x%08x"
 				" does not match computed 0x%08x\n",
 				hdr->itt, hdr->offset, payload_length,
@@ -1923,14 +1878,12 @@ static int iscsit_handle_nop_out(struct iscsit_conn *conn, struct iscsit_cmd *cm
 			ret = -1;
 			goto out;
 		}
 
 		if (conn->conn_ops->DataDigest) {
-			iscsit_do_crypto_hash_buf(conn->conn_rx_hash, ping_data,
-						  payload_length, padding,
-						  cmd->pad_bytes, &data_crc);
-
+			data_crc = iscsit_crc_buf(ping_data, payload_length,
+						  padding, cmd->pad_bytes);
 			if (checksum != data_crc) {
 				pr_err("Ping data CRC32C DataDigest"
 				" 0x%08x does not match computed 0x%08x\n",
 					checksum, data_crc);
 				if (!conn->sess->sess_ops->ErrorRecoveryLevel) {
@@ -2326,14 +2279,11 @@ iscsit_handle_text_cmd(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		rx_got = rx_data(conn, &iov[0], niov, rx_size);
 		if (rx_got != rx_size)
 			goto reject;
 
 		if (conn->conn_ops->DataDigest) {
-			iscsit_do_crypto_hash_buf(conn->conn_rx_hash,
-						  text_in, rx_size, 0, NULL,
-						  &data_crc);
-
+			data_crc = iscsit_crc_buf(text_in, rx_size, 0, NULL);
 			if (checksum != data_crc) {
 				pr_err("Text data CRC32C DataDigest"
 					" 0x%08x does not match computed"
 					" 0x%08x\n", checksum, data_crc);
 				if (!conn->sess->sess_ops->ErrorRecoveryLevel) {
@@ -2686,14 +2636,12 @@ static int iscsit_handle_immediate_data(
 	}
 
 	if (conn->conn_ops->DataDigest) {
 		u32 data_crc;
 
-		data_crc = iscsit_do_crypto_hash_sg(conn->conn_rx_hash, cmd,
-						    cmd->write_data_done, length, padding,
-						    cmd->pad_bytes);
-
+		data_crc = iscsit_crc_sglist(cmd, length, padding,
+					     cmd->pad_bytes);
 		if (checksum != data_crc) {
 			pr_err("ImmediateData CRC32C DataDigest 0x%08x"
 				" does not match computed 0x%08x\n", checksum,
 				data_crc);
 
@@ -4114,14 +4062,12 @@ static void iscsit_get_rx_pdu(struct iscsit_conn *conn)
 			if (ret != ISCSI_CRC_LEN) {
 				iscsit_rx_thread_wait_for_tcp(conn);
 				break;
 			}
 
-			iscsit_do_crypto_hash_buf(conn->conn_rx_hash, buffer,
-						  ISCSI_HDR_LEN, 0, NULL,
-						  &checksum);
-
+			checksum = iscsit_crc_buf(buffer, ISCSI_HDR_LEN, 0,
+						  NULL);
 			if (digest != checksum) {
 				pr_err("HeaderDigest CRC32C failed,"
 					" received 0x%08x, computed 0x%08x\n",
 					digest, checksum);
 				/*
@@ -4404,19 +4350,10 @@ int iscsit_close_connection(
 	 * If any other processes are accessing this connection pointer we
 	 * must wait until they have completed.
 	 */
 	iscsit_check_conn_usage_count(conn);
 
-	ahash_request_free(conn->conn_tx_hash);
-	if (conn->conn_rx_hash) {
-		struct crypto_ahash *tfm;
-
-		tfm = crypto_ahash_reqtfm(conn->conn_rx_hash);
-		ahash_request_free(conn->conn_rx_hash);
-		crypto_free_ahash(tfm);
-	}
-
 	if (conn->sock)
 		sock_release(conn->sock);
 
 	if (conn->conn_transport->iscsit_free_conn)
 		conn->conn_transport->iscsit_free_conn(conn);
diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index 90b870f234f0..c2ac9a99ebbb 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -6,11 +6,10 @@
  *
  * Author: Nicholas A. Bellinger <nab@linux-iscsi.org>
  *
  ******************************************************************************/
 
-#include <crypto/hash.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/kthread.h>
 #include <linux/sched/signal.h>
 #include <linux/idr.h>
@@ -69,50 +68,10 @@ static struct iscsi_login *iscsi_login_init_conn(struct iscsit_conn *conn)
 out_login:
 	kfree(login);
 	return NULL;
 }
 
-/*
- * Used by iscsi_target_nego.c:iscsi_target_locate_portal() to setup
- * per struct iscsit_conn libcrypto contexts for crc32c and crc32-intel
- */
-int iscsi_login_setup_crypto(struct iscsit_conn *conn)
-{
-	struct crypto_ahash *tfm;
-
-	/*
-	 * Setup slicing by CRC32C algorithm for RX and TX libcrypto contexts
-	 * which will default to crc32c_intel.ko for cpu_has_xmm4_2, or fallback
-	 * to software 1x8 byte slicing from crc32c.ko
-	 */
-	tfm = crypto_alloc_ahash("crc32c", 0, CRYPTO_ALG_ASYNC);
-	if (IS_ERR(tfm)) {
-		pr_err("crypto_alloc_ahash() failed\n");
-		return -ENOMEM;
-	}
-
-	conn->conn_rx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
-	if (!conn->conn_rx_hash) {
-		pr_err("ahash_request_alloc() failed for conn_rx_hash\n");
-		crypto_free_ahash(tfm);
-		return -ENOMEM;
-	}
-	ahash_request_set_callback(conn->conn_rx_hash, 0, NULL, NULL);
-
-	conn->conn_tx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
-	if (!conn->conn_tx_hash) {
-		pr_err("ahash_request_alloc() failed for conn_tx_hash\n");
-		ahash_request_free(conn->conn_rx_hash);
-		conn->conn_rx_hash = NULL;
-		crypto_free_ahash(tfm);
-		return -ENOMEM;
-	}
-	ahash_request_set_callback(conn->conn_tx_hash, 0, NULL, NULL);
-
-	return 0;
-}
-
 static int iscsi_login_check_initiator_version(
 	struct iscsit_conn *conn,
 	u8 version_max,
 	u8 version_min)
 {
@@ -1163,19 +1122,10 @@ void iscsi_target_login_sess_out(struct iscsit_conn *conn,
 		} else
 			spin_unlock_bh(&conn->sess->conn_lock);
 		iscsit_dec_session_usage_count(conn->sess);
 	}
 
-	ahash_request_free(conn->conn_tx_hash);
-	if (conn->conn_rx_hash) {
-		struct crypto_ahash *tfm;
-
-		tfm = crypto_ahash_reqtfm(conn->conn_rx_hash);
-		ahash_request_free(conn->conn_rx_hash);
-		crypto_free_ahash(tfm);
-	}
-
 	if (conn->param_list) {
 		iscsi_release_param_list(conn->param_list);
 		conn->param_list = NULL;
 	}
 	iscsi_target_nego_release(conn);
diff --git a/drivers/target/iscsi/iscsi_target_login.h b/drivers/target/iscsi/iscsi_target_login.h
index e8760735486b..03c7d695d58f 100644
--- a/drivers/target/iscsi/iscsi_target_login.h
+++ b/drivers/target/iscsi/iscsi_target_login.h
@@ -7,11 +7,10 @@
 struct iscsit_conn;
 struct iscsi_login;
 struct iscsi_np;
 struct sockaddr_storage;
 
-extern int iscsi_login_setup_crypto(struct iscsit_conn *);
 extern int iscsi_check_for_session_reinstatement(struct iscsit_conn *);
 extern int iscsi_login_post_auth_non_zero_tsih(struct iscsit_conn *, u16, u32);
 extern int iscsit_setup_np(struct iscsi_np *,
 				struct sockaddr_storage *);
 extern int iscsi_target_setup_login_socket(struct iscsi_np *,
diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index fa3fb5f4e6bc..16e3ded98c32 100644
--- a/drivers/target/iscsi/iscsi_target_nego.c
+++ b/drivers/target/iscsi/iscsi_target_nego.c
@@ -1192,18 +1192,11 @@ int iscsi_target_locate_portal(
 	if (!sessiontype) {
 		if (!login->leading_connection)
 			goto get_target;
 
 		sess->sess_ops->SessionType = 1;
-		/*
-		 * Setup crc32c modules from libcrypto
-		 */
-		if (iscsi_login_setup_crypto(conn) < 0) {
-			pr_err("iscsi_login_setup_crypto() failed\n");
-			ret = -1;
-			goto out;
-		}
+
 		/*
 		 * Serialize access across the discovery struct iscsi_portal_group to
 		 * process login attempt.
 		 */
 		conn->tpg = iscsit_global->discovery_tpg;
@@ -1256,21 +1249,11 @@ int iscsi_target_locate_portal(
 		ret = -1;
 		goto out;
 	}
 	conn->tpg_np = tpg_np;
 	pr_debug("Located Portal Group Object: %hu\n", conn->tpg->tpgt);
-	/*
-	 * Setup crc32c modules from libcrypto
-	 */
-	if (iscsi_login_setup_crypto(conn) < 0) {
-		pr_err("iscsi_login_setup_crypto() failed\n");
-		kref_put(&tpg_np->tpg_np_kref, iscsit_login_kref_put);
-		iscsit_put_tiqn_for_login(tiqn);
-		conn->tpg = NULL;
-		ret = -1;
-		goto out;
-	}
+
 	/*
 	 * Serialize access across the struct iscsi_portal_group to
 	 * process login attempt.
 	 */
 	if (iscsit_access_np(np, conn->tpg) < 0) {
diff --git a/include/target/iscsi/iscsi_target_core.h b/include/target/iscsi/iscsi_target_core.h
index 60af7c63b34e..51ca80abacf7 100644
--- a/include/target/iscsi/iscsi_target_core.h
+++ b/include/target/iscsi/iscsi_target_core.h
@@ -574,13 +574,10 @@ struct iscsit_conn {
 	spinlock_t		nopin_timer_lock;
 	spinlock_t		response_queue_lock;
 	spinlock_t		state_lock;
 	spinlock_t		login_timer_lock;
 	spinlock_t		login_worker_lock;
-	/* libcrypto RX and TX contexts for crc32c */
-	struct ahash_request	*conn_rx_hash;
-	struct ahash_request	*conn_tx_hash;
 	/* Used for scheduling TX and RX connection kthreads */
 	cpumask_var_t		conn_cpumask;
 	cpumask_var_t		allowed_cpumask;
 	unsigned int		conn_rx_reset_cpumask:1;
 	unsigned int		conn_tx_reset_cpumask:1;
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
