Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDoZKFcNE2pd7AYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 May 2026 16:38:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C895C2B23
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 May 2026 16:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0k/frirgRGp3xV7wKYfc8+tquGgqcw0LNSnAWMkI00M=; b=On21BQ6l+XQ3BLIrSsdiy5D9lA
	k4bYi95025Gg/KJGw52kyd8WnwXMWAwEVBDceUkMbmRtcO9PfyFQC29W25WQxYYRF/WjtqI8tDqN6
	KYMYGYchDyLr1n+FaHjRcEXGpTOBst3TnZN7421W6h0rz8PaBWEbYM5N7ihPT6CEqTcw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wR9xk-0004dB-Fx;
	Sun, 24 May 2026 14:37:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wR9xj-0004d0-EE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 May 2026 14:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=idwjcreDAfv2v2d9qS8qe9q6midjUQkWcXWsMGoahPY=; b=aJ5iCCzwOOVYabMKNbQ0bjmqHq
 FUrpYE3Y+jQ7dZPR2aAfi4va4JK2tcE45KDbFoObPeb3Z/Pl5RY6j5tn6xRKcoc9YkTYBu1BlbP8j
 b65tUcZoRNH16BLf+axP+2BaNdJspYfCEeUVkK03vkmhf75FIuzCQvdHoZQO9X+Yl17Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=idwjcreDAfv2v2d9qS8qe9q6midjUQkWcXWsMGoahPY=; b=J
 N2CIF83MR4nZ7wZMwQMxmMw0RvGLy4tzmsb+z+SpZe4FUjXlxH2/l6Y9YgRUNjEsl1dmiRNdiGa1V
 OuN/zr7m2raH3vgufD3iRKEVbc774jfnROEqwFvZtNeCnGZM+95/O1yhZ5gYvpRNC4K33SI1ORFW9
 pfyfx6EUjNfmxTLU=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wR9xj-0002DG-5B for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 May 2026 14:37:56 +0000
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2ba17c8cfacso92741935ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 May 2026 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779633465; x=1780238265; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=idwjcreDAfv2v2d9qS8qe9q6midjUQkWcXWsMGoahPY=;
 b=Do8qKHvGpVdmxiSuWzlJNdZSPKNtw+1FJ5OSg+fpUka4R81RXCoARk67+2VgG3P3eX
 6FDLdrZfcettZ3rSQabv/E5s1t1plw8JgIEiTvRpiZI1JIw4vm5APuNhjCHDqO1QEEjy
 1Fu/hvYAilV1L/B4Hvn3kBecWRnps6rjBNVCQeQvfNH4PvxBqX6DaJbs6kdFVzUOcKF7
 HPL2kReYWTYSNaW4n1cslU3t4Qeah3Lg5cn9yE+F4Gbe2C0h9aCsEYZrtK3tKm1VsLaV
 EhMra4WOjgeJwX8wH92q0qv+vwe2CFqbdSzfp7MCBdjv5zqcioK6RAEteEsTi7puBGef
 zxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779633465; x=1780238265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idwjcreDAfv2v2d9qS8qe9q6midjUQkWcXWsMGoahPY=;
 b=AENpn9j0S7u8aJPwpfoWVYgTIiNnTPJKmlUczcXOohCwe3Cpo7k82wzTARad1mNPkC
 DR6gmWgzMkNun0OfVahgdPWAGVMOMw7XKt4Dlm38sCkcd87teKAFaMQmyVPifyTOGOHK
 5u4UqNcCcyfLcJ2XA8x40RON8RszII0tqKdZXcvkysH6dIGfQhdjIqw92iGiukpUVOGg
 20P5T6mTdy55FaWT8TwwWbxNU6P7HpKRPsOlF5XrrG/WGN38ZAPk4dPX2iK682TzRQpf
 daVDKTPCPaxhAumBnVbibofCQT6NeML39IQkCnUkcc/EJ01n+pCPuLDVdbT6XOUHFHBD
 DtIQ==
X-Gm-Message-State: AOJu0YyXsUnpB+/iHsT9CbnwLxKCgTiFTCsC9S3d9Fblmf4H0ETU4WrZ
 SnpyzGgdvOHFSz2+yWMhXK+m3UBU6RN4Ry918apQ+EpFRvz6Lbzu4c32
X-Gm-Gg: Acq92OE67RwJuDDTf4dVkr9HGDuRWNrsX0byLMYcl9DaSJrucJHTgR78oxMEYk2rop7
 cBXrWJq9PPYSJbpPICvPS1S6d5xPd91OtUzjNd9yKo4oqQy9OjCTn1dHM7vc7CLv7ECZmWXVcak
 WRhrd0u+NOnD05poPTQTzIj77LvdurnwsG0rTLFGZb6QXv17nBGY8qrN11Lv7FU41ieAF6sxQRE
 7l/PXqiDq4jaykXb+u8l7oKkxbyGPLAAP0l+4KAVTO5yJ4JyQMvYtIat5Yg2QbpWp/HkD7WY/yJ
 1H2FuZ7bu5aYu7t/SFtrMT8NiNC7araafg1GMGauKmaQsQD3HPpsF8HfEPRNagwA2OfwFNXejEB
 HFoxq83DHMC8Y4WRZGMRwHK4WaEtXGvl+imqpvXPPQmDJeNVx3y8TmhH+UTjZTrA64AMfEg1Z/F
 /BicWvuyLj5ewso6B2H3fieGZDEIio0+n2cJEcYpG/1Q==
X-Received: by 2002:a17:903:390d:b0:2ba:b643:1f81 with SMTP id
 d9443c01a7336-2beb038150emr124655605ad.15.1779633464777; 
 Sun, 24 May 2026 07:37:44 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58b3058sm71063155ad.39.2026.05.24.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 07:37:44 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 24 May 2026 22:37:38 +0800
Message-Id: <20260524143738.1966071-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_acl_count() only validates the aggregate ACL xattr
 length.
 A malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
 contains struct f2fs_acl_entry_short bytes, and f2fs_acl_from_ [...] 
 Content analysis details:   (1.8 points, 5.0 required)
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wR9xj-0002DG-5B
Subject: [f2fs-dev] [PATCH] f2fs: validate ACL entry sizes in
 f2fs_acl_from_disk()
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
Cc: zerocling0077@gmail.com, 2045gemini@gmail.com,
 Zhang Cen <rollkingzzc@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:zerocling0077@gmail.com,m:2045gemini@gmail.com,m:rollkingzzc@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[gmail.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: E2C895C2B23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_acl_count() only validates the aggregate ACL xattr length. A
malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
contains struct f2fs_acl_entry_short bytes, and f2fs_acl_from_disk()
then reads entry->e_id before verifying that a full entry fits.

Require a short entry before reading e_tag and e_perm, and require a
full entry before reading e_id for ACL_USER and ACL_GROUP. This keeps
corrupted ACL xattrs on the existing -EINVAL path without reading past
the copied xattr value.

Validation reproduced this kernel report:
KASAN slab-out-of-bounds in __f2fs_get_acl+0x6fb/0x7e0
RIP: 0033:0x7f4b835ea7aa
The buggy address belongs to the object at ffff888114589960 which belongs
to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes to the right of allocated 8-byte
region [ffff888114589960, ffff888114589968)
Read of size 4
Call trace:
  dump_stack_lvl+0x66/0xa0 (?:?)
  print_report+0xce/0x630 (?:?)
  __f2fs_get_acl+0x6fb/0x7e0 (fs/f2fs/acl.c:169)
  srso_alias_return_thunk+0x5/0xfbef5 (?:?)
  __virt_addr_valid+0x224/0x430 (?:?)
  kasan_report+0xe0/0x110 (?:?)
  __f2fs_get_acl+0x5/0x7e0 (fs/f2fs/acl.c:169)
  __get_acl+0x281/0x380 (?:?)
  vfs_get_acl+0x10b/0x190 (?:?)
  do_get_acl+0x2a/0x410 (?:?)
  do_get_acl+0x9/0x410 (?:?)
  do_getxattr+0xe8/0x260 (?:?)
  filename_getxattr+0xd1/0x140 (?:?)
  do_getname+0x2d/0x2d0 (?:?)
  path_getxattrat+0x16c/0x200 (?:?)
  lock_release+0xc8/0x290 (?:?)
  cgroup_update_frozen+0x9d/0x320 (?:?)
  lockdep_hardirqs_on_prepare+0xea/0x1a0 (?:?)
  trace_hardirqs_on+0x1a/0x170 (?:?)
  _raw_spin_unlock_irq+0x28/0x50 (?:?)
  do_syscall_64+0x115/0x6a0 (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)

Fixes: af48b85b8cd3 ("f2fs: add xattr and acl functionalities")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
---
 fs/f2fs/acl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index fa8d81a30fb9..290fee451637 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -70,7 +70,7 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 
 	for (i = 0; i < count; i++) {
 
-		if ((char *)entry > end)
+		if ((char *)entry + sizeof(struct f2fs_acl_entry_short) > end)
 			goto fail;
 
 		acl->a_entries[i].e_tag  = le16_to_cpu(entry->e_tag);
@@ -86,6 +86,8 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 			break;
 
 		case ACL_USER:
+			if ((char *)entry + sizeof(struct f2fs_acl_entry) > end)
+				goto fail;
 			acl->a_entries[i].e_uid =
 				make_kuid(&init_user_ns,
 						le32_to_cpu(entry->e_id));
@@ -93,6 +95,8 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 					sizeof(struct f2fs_acl_entry));
 			break;
 		case ACL_GROUP:
+			if ((char *)entry + sizeof(struct f2fs_acl_entry) > end)
+				goto fail;
 			acl->a_entries[i].e_gid =
 				make_kgid(&init_user_ns,
 						le32_to_cpu(entry->e_id));
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
