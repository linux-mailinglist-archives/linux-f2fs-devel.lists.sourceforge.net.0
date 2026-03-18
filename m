Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF02JrBqumnnWAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 10:04:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FA2B8A4E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 10:04:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nn3I4cRRKcZGv1Bj2IDCHxwHaNyCIT2OzzfcR2bc/bc=; b=A4Qka1kzpnLpjxHWq6GBQQGB6k
	u8bIaloQc7PV9kV8KOKXC1SA7C2J5d75qNo2nJ6oOSgxtATruF++tF0wYKGwsjPT1oPwo4CJvxXJr
	6LcGwmly5jdnfsNUAkH+PonUqp4c1Ov7QsIcYT4Ij9070LGLo7+rrzLtJzK8zrRJpkxQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2mpU-0007VL-U5;
	Wed, 18 Mar 2026 09:04:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gality369@gmail.com>) id 1w2mpO-0007Tl-UP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 09:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bl+hlvVpCQaqxcRnovEkM7RqYY7uFTt4xrtlJUrWOI0=; b=BR3onpEoW+wPju8LRffTWt481q
 y8y+w+9aj6PI1wKEH1+mloqYEjVNB3aXrVQIyF2+wtUj2MgugOgGbF3MZL1zV4jmQJJZTMVmBO8ZM
 QurN+4FnZYZ8RUKBFhYhUDBYTBTZpPEIw4GBgwK60oMMsP5iHZkeR977Ph3XgswB+BCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Bl+hlvVpCQaqxcRnovEkM7RqYY7uFTt4xrtlJUrWOI0=; b=Q
 GxQeN4j0gzmtBLvAJZtuh/s21zeMnpk7sjDqnyO7WwWy4tYr0KCHZZ6nfvTjKtejNlWlb9Bsuu24o
 kmMwhvD8d7UkFa8ScZszof04raRQ//xiLJ6Crp83qetVdcAmfiz7U6w7T76xZ8dT2ACAOAccqXE4M
 RqbcGqqGavfLj/x4=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w2mpN-0004n2-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 09:04:34 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-82995242934so368626b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2026 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773824662; x=1774429462; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bl+hlvVpCQaqxcRnovEkM7RqYY7uFTt4xrtlJUrWOI0=;
 b=NxOp4nj6RNXNniVA2uYZzkF5CjIhJDg1sONrM6jlB6Q5uw3UM/1/GqOwt0tw62z+y/
 FCjeuVb14QOWio1EBfhljGViiffdzPKmn/iBqGiqUi/4bZ4+J3CFZNVJOVRtbWjDLKeF
 C2HKZUuRIWjH8MxLPR4rSSMJVN6PFjAOVQI+xwcoCm1pW06839iHDsEJ1b9O06cGkKYO
 FSsV3Y31q4rYOjHt3ambYv1aeGfNB+bUcWr99YB3KeCytxPbQV3OiZ2Wav+kVONSVsBA
 YQleQ+VjsI4kvXZXcjSZCO7f92iYTqjpgGrBjCqGwxHL1ark9pavOrpnQQQ4YHFy5rEq
 w1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773824662; x=1774429462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bl+hlvVpCQaqxcRnovEkM7RqYY7uFTt4xrtlJUrWOI0=;
 b=aDyTq3RGJgVuGEtu/QHkETawQfnsfLqG4kNGOmDaA6pRKL/mbo4ub+4Uq277UKf08c
 GR+0DW/qJ4xn1dpS4vUjUl6XHO2bkpJ0JYyGXxg1RS+cuSUuSnDLJy0CbrVLvujzPQHR
 wTsqzXA1JOtRzHyXDsgQ/GO1X7gwP3gUmGBo49nO7YDudOM2b+REXWdhgs9IU1xrcdjh
 8HPilcvvVCMpY+j4dARr8lKY3NQJD4fmFec5pOU6qojWeE41cu2mW6AiZG+0gl6tXjY3
 yX+AC6sDA1tIF5K61Uymy/GOkvLfqi0YrsZiQUVgzzWoSMv+7Ep9OG3qP/6EEuRs9vwL
 clKQ==
X-Gm-Message-State: AOJu0YxEfyzfwdQuxM2kHjoT1GDwBNtt01Xyp8cWUEwsujmO2eG/IJL6
 cymM9CqDp3l3/KbTK8Vdik4sVKoCQsLEFW1qezi0XB3zkM2ZQT4ToMNX
X-Gm-Gg: ATEYQzwfweqy0dDmwt+cTzchC7i4ZzTLsoAVpyRWVfRnZDiOJM/w6eu4063EbTIsAqD
 DJQaElA6h94fwhQcurOlIY7DWcbZ8XbuEL5FZRJROXmZRYaiVMm6HwKbH+K/tRZ5wUBX6ty095A
 Ko8yjQAisxZoGRHbkF4DIIDv0SjGJT1Pl/d67aEZe1FR9OjAtodCVjmMNaKaF6fXIWpE8aloHGf
 JAHOWunmnb9frXfDHUW4LiKdGigYRhiVQwmODFnc3Lt9NaPMmZvAn7xRtq51noREXEz/dLYc1G7
 Z283xlpXKvwQyP8sOE3wZJ0pHJQjeIMEvkgqqiyJ+uHcLzJdITxCeGDi6MR5ZowkTDaiVYsPmLa
 dXrjH/lPYpaEekZl9iAs/JJ3+sZciVITWIQVSq2RP/Wldcg7hmf6yRGanCuw/l307/H5M838gYn
 bHjXCDI3hIeLjriIirzbRtd30+LM82lsDHAkKyD/B2L7u66Y4oeeNyaTnfpnYHDzlBN1mdWQo=
X-Received: by 2002:a05:6a00:7089:b0:823:1444:7873 with SMTP id
 d2e1a72fcca58-82a56277fb7mr4670214b3a.32.1773824662246; 
 Wed, 18 Mar 2026 02:04:22 -0700 (PDT)
Received: from kernel-fuzz.. ([103.172.182.26])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a6b52e5a0sm2608913b3a.4.2026.03.18.02.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 02:04:21 -0700 (PDT)
From: ZhengYuan Huang <gality369@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	cm224.lee@samsung.com
Date: Wed, 18 Mar 2026 17:04:10 +0800
Message-ID: <20260318090410.3368669-1-gality369@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [BUG] When accessing a crafted f2fs filesystem via
 open_by_handle_at(2), 
 a KASAN null-pointer dereference is triggered deep inside the fscrypt
 inline-encryption
 path: KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
 RIP: 0010:__fscrypt_inode_uses_inline_crypto fs/crypto/inline_crypt.c:266
 RIP: 0010:fscrypt_set_bio_crypt_ctx+0x200/0x300 fs/cry [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [gality369(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [gality369(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w2mpN-0004n2-4Z
Subject: [f2fs-dev] [PATCH] f2fs: reject non-directory inode in
 f2fs_get_parent() to prevent null-ptr-deref
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
Cc: ZhengYuan Huang <gality369@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 baijiaju1990@gmail.com, zzzccc427@gmail.com, r33s3n6@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:cm224.lee@samsung.com,m:gality369@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:r33s3n6@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[gality369@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gality369@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E90FA2B8A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[BUG]
When accessing a crafted f2fs filesystem via open_by_handle_at(2), a
KASAN null-pointer dereference is triggered deep inside the fscrypt
inline-encryption path:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:__fscrypt_inode_uses_inline_crypto fs/crypto/inline_crypt.c:266
  RIP: 0010:fscrypt_set_bio_crypt_ctx+0x200/0x300 fs/crypto/inline_crypt.c:308
  Call Trace:
    f2fs_set_bio_crypt_ctx fs/f2fs/data.c:492 [inline]
    f2fs_grab_read_bio+0x262/0x7d0 fs/f2fs/data.c:1056
    f2fs_submit_page_read+0xb2/0x180 fs/f2fs/data.c:1095
    f2fs_get_read_data_folio+0x633/0xbe0 fs/f2fs/data.c:1263
    f2fs_find_data_folio+0x146/0x330 fs/f2fs/data.c:1286
    find_in_level fs/f2fs/dir.c:302 [inline]
    __f2fs_find_entry+0x651/0xe10 fs/f2fs/dir.c:377
    f2fs_find_entry+0xc6/0x200 fs/f2fs/dir.c:418
    f2fs_inode_by_name+0x2a/0x1d0 fs/f2fs/dir.c:435
    f2fs_get_parent+0x9b/0x160 fs/f2fs/namei.c:451
    reconnect_one fs/exportfs/expfs.c:130 [inline]
    reconnect_path+0x1f6/0x8c0 fs/exportfs/expfs.c:220
    exportfs_decode_fh_raw+0x3f3/0x780 fs/exportfs/expfs.c:535
    do_handle_to_path fs/fhandle.c:276 [inline]
    handle_to_path fs/fhandle.c:400 [inline]
    do_handle_open+0x62f/0xb30 fs/fhandle.c:415
    __do_sys_open_by_handle_at fs/fhandle.c:455 [inline]
    __se_sys_open_by_handle_at fs/fhandle.c:446 [inline]
    __x64_sys_open_by_handle_at+0x7a/0xc0 fs/fhandle.c:446
    x64_sys_call+0x1cd5/0x26a0 arch/x86/include/generated/asm/syscalls_64.h:305
    ...

The bug is reproducible on next-20260313 with our dynamic
metadata fuzzing tool that corrupts f2fs metadata at runtime.

[CAUSE]
The export reconnect path (exportfs_decode_fh_raw -> reconnect_path ->
reconnect_one -> f2fs_get_parent) does not validate that the inode
embedded in a file handle is actually a directory before treating it
as one.

A crafted file handle can therefore supply a non-directory inode that
has IS_ENCRYPTED set and S_IFREG in i_mode. f2fs_get_parent() calls
f2fs_inode_by_name() on this inode, which eventually calls
f2fs_grab_read_bio() to read the inode's data blocks.
f2fs_grab_read_bio() calls fscrypt_set_bio_crypt_ctx(), which detects:

  fscrypt_needs_contents_encryption() == true  (IS_ENCRYPTED && S_ISREG)

and proceeds to call __fscrypt_inode_uses_inline_crypto(), which does:

  fscrypt_get_inode_info_raw(inode)->ci_inlinecrypt

Because the inode was never opened through the normal f2fs_file_open()
path, fscrypt_file_open() was never called, so i_crypt_info is NULL.
fscrypt_get_inode_info_raw() returns NULL unconditionally (only
printing a VFS_WARN_ON_ONCE), and the subsequent dereference of
NULL->ci_inlinecrypt triggers the null-ptr-deref.

[FIX]
Add an S_ISDIR() check at the top of f2fs_get_parent().  The function
is the f2fs implementation of export_operations::get_parent, which by
contract is only supposed to receive directory dentries.  Reject any
non-directory inode with -ENOTDIR before attempting to search for the
".." entry, so that a crafted file handle carrying a non-dir inode
cannot reach the fscrypt bio setup path without a properly initialised
i_crypt_info.

After this fix, the same crafted file handle will instead be rejected by
f2fs_get_parent() with -ENOTDIR, and the export reconnect path will not
proceed to call f2fs_inode_by_name() on the non-directory inode.

Fixes: 57397d86c62d ("f2fs: add inode operations for special inodes")
Cc: stable@vger.kernel.org
Signed-off-by: ZhengYuan Huang <gality369@gmail.com>
---
 fs/f2fs/namei.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b882771e4699..0e81a2124a50 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -447,8 +447,14 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 
 struct dentry *f2fs_get_parent(struct dentry *child)
 {
+	struct inode *inode = d_inode(child);
 	struct folio *folio;
-	unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &folio);
+	unsigned long ino;
+
+	if (!S_ISDIR(inode->i_mode))
+		return ERR_PTR(-ENOTDIR);
+
+	ino = f2fs_inode_by_name(inode, &dotdot_name, &folio);
 
 	if (!ino) {
 		if (IS_ERR(folio))
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
