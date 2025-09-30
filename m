Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E64BAC3B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 11:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:To:Message-ID:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l74jhxxga5xWtNSicSPu3YH3YOOkukHBZZQz9RKDlPM=; b=GtjIzA4NNq5tEB6cc48f4kM0Hc
	9ShTd1W0wKCq9xEuNUbn7TMP52kFylOodAxNPry4k+0F9ZBUJNQOI+PVS+GLJjCI39LNVegFHWUJk
	EUa+VQxACvDN2QCKMUpPORICSvCbNPGKgbgd21G1vKl5hibtacrkfU0Be92QR6aw6TRc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3WTo-0005Ku-IV;
	Tue, 30 Sep 2025 09:17:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <920484857@qq.com>) id 1v3WTm-0005Kl-Ni
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 09:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject
 :Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjKOMSUKFceEsi2HVyF69WgmsGT8yilr2nItsl+yc10=; b=nTl16lvZxR5j9fQErwqdwNsi3y
 jBYZknQnDbV4HE1PY3y1VSq87HMwZ3e4lJkCgXbh0G950RlD8vft2XcmiSS4nn+Yk/CG4ajiSmEU0
 plLNiLLc1YX7ATxu+IzDkUpZ7RCRUz93vfVNnSYdO7JiGcpCGHKn0c0S3dK40ZhvRZ3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Message-ID
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sjKOMSUKFceEsi2HVyF69WgmsGT8yilr2nItsl+yc10=; b=P
 OLw/URpZmmR9g2Hxx9gyykKYuYLxFdM7B2bdLxbY5U3PSk3r7fZMLtHjQfJjnPOMAJMBrxFfCGlMf
 41XD/Qs38PZ80G9MT5JGAM9jfxrn9bUCTmKInR3NZEDD17zfPLA7BvwluhlMDhUtEjw9nQES+pjT/
 sDO+PgtHHAk3lHSo=;
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3WTl-00022S-Eh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 09:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1759223806; bh=sjKOMSUKFceEsi2HVyF69WgmsGT8yilr2nItsl+yc10=;
 h=From:To:Cc:Subject:Date;
 b=LfQkgmDHVctZFltQmn383F/0P9cgs5+VbyPQWNfDcfqdLMpXO7dZRmb7yqt0vFUnL
 1Bj+GZ2dRvMBEWAXGogDpnp1b4uyJ7TRLeCFKSzIRM0PRfsKHA4hOQx3gP3PY9RkKH
 fEpV2bK37/KXur1JhSCPTpFB/zmFdXC+05HLLbPk=
Received: from localhost.localdomain ([116.128.244.171])
 by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
 id 4191B498; Tue, 30 Sep 2025 17:16:25 +0800
X-QQ-mid: xmsmtpt1759223785thn26fkks
Message-ID: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
X-QQ-XMAILINFO: OKZmdVNIw/gXA5s3qo7J1+t0PGITjuC65oo1emaYhlWFT/KnKh9Lz5G4FR6smF
 GUz+lqBcgG9ItF2hL0vkpTbd53/GEGR/k/9IU5G3R28rqwRW99fNeaDlSl46mydd2KGLE7uPOoM7
 lbGlyPa3NLWbs739E9QugkMnMgYBYMNRdBNLSb10e6egsqtFcOhU+46lu8JzEMCJ3QWagzhqJFm4
 oc0PYY9z2SyCo2970aoOV5JBl2O8tk2RR61X1U3Sy8DOxb7InqKubmjtTHwz8TIbHGbkt/xo1p+P
 dpwQZJrSQc/lFduLKLOpCLSw5FGLtH6Oc/EWebcAczSlT+wBD01LvY7J7j01hppO+BGAJH0fqKpf
 Z1960ni2xMPftIabtPsnvdY8k+BE2uPxYknGWi68CkRF5ZSiJh8zmZjVgyjNarLQ71AK60pXrDfg
 7DorJm6jdfLQANOVDEL1KyVs1u992S6sI9CwJmXZTVNhTnVtXObQ6kzl4Dh14rOkRZZdbjKgO2kz
 GqrTNj3F2cE0DVwH1CkVUUnWgo2fak7kixz5JeNCfVpa6md9tR65SsnS3o6vWizSke2OTEna5F5E
 TJ40AySI6oVxgvxpziGgPPspJrKl8njkGgGcLFKGSphYsUmZZ+PwpW7s8PjyfgW7c1P6Vqpg1F19
 8MewWVqq2GRmbxpTtRKnTqnjxKT3SPz17tf+raKtfLuaL4V9ssbEwRQY9OjWDQpKUlivy6Xdn2a4
 1jA2gg420V3P1yw2GU5rRq8N49GBpmdUpSMltZL3LKzZbvzgFWZ6O0HfrHFCx8SrilOTLyojsiLG
 FwXfvbDx5/yxj6GL/IdjL6H3T2MBfcd6ZsQ68KXcjehKQoRUIgI8ak3ScRIb8tUuF727dNjD+D3Z
 p46IjBK36mkvj7jDVAjFYyYrelJNjXtFGPkvhYe4gTviGkKoewsfHvu+v6uBI2QWTlFelUbjckXo
 bDSS/kl84YzpPRqwndojbqqCAeACaW7fikKSybBMrTFgVj0r0TItZRv1rDip3AKyR86b+lqTlTy/
 OWS3sRHRwb71mvdLbmBQVWMO3PrJE8BF5W+6SWkFGTwUqf6hVLAMA//8H0oyEs+QkhjV6suhu/kv
 MnY84b
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 30 Sep 2025 17:16:21 +0800
X-OQ-MSGID: <20250930091621.4006285-1-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 3.7 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Haofeng Li Fixes a memory leak issue in
 f2fs_move_inline_dirents()
 where the ifolio is not properly released in certain error paths. Problem
 Analysis: - In f2fs_try_convert_inline_dir(),
 ifolio is acquired via f2fs_get_inode_folio()
 - When do_convert_inline_dir() fails, the caller expects ifolio to be released
 - However, in f2fs_mo [...] 
 Content analysis details:   (3.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [920484857(at)qq.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [920484857(at)qq.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [162.62.57.49 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP addr
 1)
X-Headers-End: 1v3WTl-00022S-Eh
Subject: [f2fs-dev] [PATCH] f2fs: fix ifolio memory leak in
 f2fs_move_inline_dirents error path
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
From: Haofeng Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Haofeng Li <920484857@qq.com>
Cc: Haofeng Li <lihaofeng@kylinos.cn>, Haofeng Li <13266079573@163.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Haofeng Li <lihaofeng@kylinos.cn>

Fixes a memory leak issue in f2fs_move_inline_dirents() where
the ifolio is not properly released in certain error paths.

Problem Analysis:
- In f2fs_try_convert_inline_dir(), ifolio is acquired via f2fs_get_inode_folio()
- When do_convert_inline_dir() fails, the caller expects ifolio to be released
- However, in f2fs_move_inline_dirents(), two specific error paths don't release ifolio

Fixes: 201a05be9628a ("f2fs: add key function to handle inline dir")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 fs/f2fs/inline.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 58ac831ef704..2496866fc45d 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -425,7 +425,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 	set_new_dnode(&dn, dir, ifolio, NULL, 0);
 	err = f2fs_reserve_block(&dn, 0);
 	if (err)
-		goto out;
+		goto out_put_ifolio;
 
 	if (unlikely(dn.data_blkaddr != NEW_ADDR)) {
 		f2fs_put_dnode(&dn);
@@ -434,7 +434,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 			  __func__, dir->i_ino, dn.data_blkaddr);
 		f2fs_handle_error(F2FS_F_SB(folio), ERROR_INVALID_BLKADDR);
 		err = -EFSCORRUPTED;
-		goto out;
+		goto out_put_ifolio;
 	}
 
 	f2fs_folio_wait_writeback(folio, DATA, true, true);
@@ -479,6 +479,10 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 out:
 	f2fs_folio_put(folio, true);
 	return err;
+
+out_put_ifolio:
+	f2fs_folio_put(ifolio, true);
+	goto out;
 }
 
 static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
