Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1PESZZumnFUgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 08:49:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CFB2B7389
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 08:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4znjl86vP5Cya+zsLpzJnxtEiicD3XSavjbbibwHO+M=; b=FxnwUlkGm4gl8HI9YOEySXwhAd
	WRAzs8ptdEggw2EWgWvVFdjBVKRG4l+LHXi2XWSLIHSPN9H57HuTx3AIPA7wju5VFJavKmeO76KuT
	4Y6cqDgnbbEalNCajCf749S2oiogxZH1z7JElToBlkUwDJlqz6sPrNRN+cTcMNtAyfXw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2ley-00089l-3L;
	Wed, 18 Mar 2026 07:49:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1w2lew-00089e-5L
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 07:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TaWUN2xZ6ZNLkJtyGAWp0KGRb8y1SHDUdrDq8BJZywg=; b=fouWpjiAMGDcVVLPHQv2hsUA00
 vxr8N7n9zQMZVIEhZTFtxTGnwyJWRQci0qLgSAz/i7ObkfGWw/01xtzHWObtsgOLDAW/ikaJL2gGN
 G+saY2wHJ+QKCiKfSGH3JquEChpMlRaNOXEx2HbEf3ovh1xNBX2+zLgk3sfm2g9VTeqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TaWUN2xZ6ZNLkJtyGAWp0KGRb8y1SHDUdrDq8BJZywg=; b=N
 wRsNOKvNLF0isZ7xO6kigUFPTfguWx1IeOkwSttjGOfCy47SeTYkSMAJ6IBm8PiLXS+4/OyT9kt3M
 YoKASSwMw2kyBy3eL5bxC6LM3YOZXnz/f6ViJjg4kZp+TkxhlX+CYOeaz6+CBcd/VJUSRFpPbomqK
 x86pbcj7UCCK1RNA=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w2lev-0006QC-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 07:49:42 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2b0484a6de4so2162815ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2026 00:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773820171; x=1774424971; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TaWUN2xZ6ZNLkJtyGAWp0KGRb8y1SHDUdrDq8BJZywg=;
 b=Q97uFpImX8Tm2yBuwILKGy1BPYMlXDEsT6aPzuB8+4FfV0vPFp4hvD4oJ5PHh7+79R
 EYqDVZ2zNBf1yXDpPvq7hOntDfdDSZzaisJFfYYWPeHFCFq1eDbudv1G3dvW8ryGnK+b
 uam8HYxIq58GixPEHZqr4tyFLYqVyRidi1qBCLAGSSvFXbtc7dYhwVkM7Y0+lgdKxWWM
 q6PvGE76SuijzGHjIEHAuscFFq4+vVA2hxxLA8BNCLknxKY1GL+JFAwCK0gg9MSKGOnR
 UDYOCqYN7KyYOKQE4MERfy1OVa2E4ZOKLk4dciyolgkRUjzmM/OvKt9Y6LI8ow6a32ZF
 NBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773820171; x=1774424971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TaWUN2xZ6ZNLkJtyGAWp0KGRb8y1SHDUdrDq8BJZywg=;
 b=mWkWNskUSQaP8UzutAtMRTy0uAL4PN2HP2EEJ4IAfAa7HdiHW82neJsCN0FoG2H9y/
 I9VtfOx02Qc2fZhMeHn7B1TtO7HgJrJia37MzL0lj0dpRVgDfCUOvJKzLx4jq4PgSNl0
 yUigkAk1WBspclEqIIp2s17qgfuBJnboJlp5uvqqlULM3RGCRvMyB87VzYWKvoLsdM7M
 e8mEZxjxAkAKAJEhGLxzAb3g/Ebkt2fpcyl11M+mC8o74qbQqsesFmhBE7ARKfkGA0+n
 XCWmK1sFGjHelLUDwhV4sNoR/sriINMXapqSUlyRQvvQYEMKtKdKvd48YmQxCdXxH87s
 q6Kg==
X-Gm-Message-State: AOJu0YyTJW9BxbF8j6oNb1Ti006CT9OrnFIx7+Zz0SYF+Zz+imODKQFk
 uNWGA+DjF0xqXB1lywKWOw2Bp+MVMunqCf/fTGD8vSJqk0rankXWf6mw
X-Gm-Gg: ATEYQzzLPH2DJ8eGOly77MRNX7CmOMyo2o5QNYIaCCKUMirykQNA3HKyvSFoo6XOoqB
 5BxYrsJldD5eIJgxS77rq0V6b56V6NzUMOyzVgQ8bPaKqZBrrfbhu3np34navTHwGTZwrMKWg6v
 UBzzwnFjNo7RDg18+tvrN/BdFpJnoG+bRnapCSRauDCEHrOg32OhERhlMYiCWD+sg2tYwdNj6ce
 NqveO4dxpfY8WwfITVnFW1ZUMYBLfUMmzPEmwCzgQB9amHplBtEbSmXLRdmQsHoXltRxvid9+cX
 Nb8TqEUUu/XRzA6wKlo8/BvTV8uxfTC93Tl1FFMwkaPGhDv8qvllo96XwiYApWMfJ7J+CowUFkj
 kufNvEJsyM666xWg6RxxcRb+QYsJS/Rt5CwxnjLxxAkykCdQ0we1/X9yBzAK6a3vdirj6xdAg6M
 yiRCxi8fu0XlYTGJJ+WQ==
X-Received: by 2002:a17:903:1a67:b0:2b0:48ca:a641 with SMTP id
 d9443c01a7336-2b06e3c3abdmr23929835ad.25.1773820171046; 
 Wed, 18 Mar 2026 00:49:31 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b06e604e7bsm23349425ad.63.2026.03.18.00.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 00:49:30 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 18 Mar 2026 15:32:53 +0800
Message-Id: <20260318073253.3108313-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_update_inode() reads inode->i_blocks without holding
 i_lock to serialize it to the on-disk inode, while concurrent truncate or
 allocation paths may modify i_blocks under i_lock. Since blkcnt_t is [...]
 Content analysis details:   (2.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zzzccc427(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zzzccc427(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w2lev-0006QC-Rj
Subject: [f2fs-dev] [PATCH v2] f2fs: add READ_ONCE() for i_blocks in
 f2fs_update_inode()
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
Cc: baijiaju1990@gmail.com, Cen Zhang <zzzccc427@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 83CFB2B7389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_update_inode() reads inode->i_blocks without holding i_lock to
serialize it to the on-disk inode, while concurrent truncate or
allocation paths may modify i_blocks under i_lock.  Since blkcnt_t is
u64, this risks torn reads on 32-bit architectures.

Following the approach in ext4_inode_blocks_set(), add READ_ONCE() to prevent
potential compiler-induced tearing.

Fixes: 19f99cee206c ("f2fs: add core inode operations")
Cc: stable@vger.kernel.org
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/f2fs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 078874db918c..73b913dbe02a 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -694,7 +694,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 	ri->i_uid = cpu_to_le32(i_uid_read(inode));
 	ri->i_gid = cpu_to_le32(i_gid_read(inode));
 	ri->i_links = cpu_to_le32(inode->i_nlink);
-	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
+	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(READ_ONCE(inode->i_blocks)) + 1);
 
 	if (!f2fs_is_atomic_file(inode) ||
 			is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
