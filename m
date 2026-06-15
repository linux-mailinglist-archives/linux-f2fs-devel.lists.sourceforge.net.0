Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WHPAKcKnL2qqEAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 09:20:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0268423D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 09:20:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VQF7d6ce;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=iJQUh8Tb;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="g yBysj5";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=DhI8mMlN;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oScRGX8JbVxS8Gtv3W6zXyGGQZm3q1NPRqbhtfMUHW4=; b=VQF7d6cesm/UNX9Osgr+XAndk2
	tiCN4zStLb25jFKoB5xrmC3LgzJVLq6R3GHtw0jQTPXO5qkkIcdoEqclLa9iqFWHEQl0iZTAzdeb7
	xeFP3zCdi1OPRUA5frSzsjHwfW/8qZcqm3t17y2v6KdFrufZTMfKIW3pEtTe9yT6+auY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ1cQ-0007Xx-Hg;
	Mon, 15 Jun 2026 07:20:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wZ1cB-0007Xi-9F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 07:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=frXAoG9W+1/5yVm6iJaF2YLozS+IttKmuZ56CDlLO0U=; b=iJQUh8Tb8hrLdpZY6mjpErDytK
 O2xdvBrng2wyImIRmX7Sod374MuruHjjz3yt3eY3Meq3F4tKSu2zOadJjTyvGdwaAGs+H/ma/rDbY
 EfuBHDkAK/EJjhK2ZZKwfyKOrTRifIk7naQhArLqJq1QcVzPa8zgHw0f/sLdWCev5yZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=frXAoG9W+1/5yVm6iJaF2YLozS+IttKmuZ56CDlLO0U=; b=g
 yBysj53PSbjyXRjdUjRCnwcfXcGi98iRL2kpJ4I4jIrsidMuRYlMlNNJ8+/cf9IkfEtFPheW2X7+V
 4JbYMvnbWnpbTPOoGc8ViL0C4LfYO7ass6y2aYAAB0MEDiamereGFWvcBadUrdWvo1vT6P8jcJ5T7
 zWc7PCY6D//QDzFw=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZ1c9-0003sK-Eb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 07:20:11 +0000
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-8422f148dfcso1677507b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781508004; x=1782112804; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=frXAoG9W+1/5yVm6iJaF2YLozS+IttKmuZ56CDlLO0U=;
 b=DhI8mMlNXxionlp2oLDWrVsyZ7Wiox58yOFdfy+N9W+SYeT2dRMV4u/rKFTovO8xtn
 Fn6LbKsUfMCdtQOqvsJV/OqpafaplqrMNXfcuR9k7Ov7QzuYUj7wrtJhygzeGa1JWaWY
 XSKUU7AyN7Ypdj9i6yFAT/FC1TyvpoKOQOShv32YUEvlmvtrpUzoQG8OxrOQiL4ADhG3
 uaNOzflQAE8pMar+DlQs77mi7lAeAXxZDc33JCB9bgy9+/ef4A1vi5Q1HANa1+YchsDr
 b+MY8OJrDtCFNJH2EsBnPmNbI3rfIJ8oeVg3VxCMPg44ZV1T7oH2fdYmqvW4XTAIowsy
 J5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781508004; x=1782112804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frXAoG9W+1/5yVm6iJaF2YLozS+IttKmuZ56CDlLO0U=;
 b=DMXG9//MiZr5kmgYcbFj8xbjGkoZD2XZ37SFoO5D4+nzIOkq6WsP5rrOltUGu/2veq
 Qgsap7ZDdYVGBGyqG/pY5KQyAC6FLD5RDFwD0t4u2QKGHZNteLO2PYHgovHLbD6NUBax
 WNwcnELQp74mMH7pTSanwb3i4M/5cPy7S6OjaqRITNlXmdT+BVO0jxRgazHMTkocf1on
 rwyNH81xnheK/c7djOoXhhX3rSRzfxBR9EjSpkABxGY85lsA6ST2LWOYqf35XWJll8vT
 cvQ+N1G22XhzOqF7sJ4OtZZn1AdxRqM6OtChT69wXM6E47OgXFWe45hFkCoVxv8oappX
 NEMw==
X-Gm-Message-State: AOJu0YyES4kpRaVdR1/PEWh0zIl8LlcoZGrgE/NfzwES8YbJJlPxERdw
 yQ+9vw7YR2f+9L3My2W2Px2YukUoapkcr0TYFdMfyg8IEb60hNJZbmja
X-Gm-Gg: Acq92OGlGDerwDlQIiKU1pL8rcWEsfSKmCyd7wtUz2qbhtvlgb5WLBF79NCvGhAGE6u
 ++AX8sH511OFG0cw1+OstM8vfqHvDMbkbkQpLibumbPpF6wIcr4moWRVWm3o1nH13TBJriPLWKZ
 TTWfenFMz3H9A7MkvzOy4tGxA5+7LbnjZi5wlnTtRpWH9otAdYZl/EDnLFSoQhHuBWjJUI+XAPP
 zDZ7IFT+hRM1/whdKFLITDv60HaAkIhNpJmgnLFgbApRY2UfYFF0RmbA0jt6BodNGmArh/jkSA9
 lDZ3IyyXWVi+5G5M0KlMhaq74q3QjDppX4XsFZyfEZTrpps2adMztEX8EnD5VXSpoE1tHwMx2Bq
 hBviAQ8aqfeEBYWNnBGCugCT8urROhoWHfxbs9aRrjpVUZV86zp3PbEgG1BRBbMEeCy2vvtMgx9
 aXSBbN+kBVoDU37ocBWNtIjMOpZzc/I/5ufz7QW0Kkv5wMwz6g6NUteJ1EHwka6GlQbZ5MaqB1r
 Cpq3g==
X-Received: by 2002:a05:6a00:238c:b0:835:41f3:f440 with SMTP id
 d2e1a72fcca58-8434cdfe0ffmr14740566b3a.14.1781508002630; 
 Mon, 15 Jun 2026 00:20:02 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434acf23a7sm8791736b3a.22.2026.06.15.00.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 00:20:02 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 15 Jun 2026 15:19:54 +0800
Message-Id: <20260615071954.4118409-1-rollkingzzc@gmail.com>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wZ1c9-0003sK-Eb
Subject: [f2fs-dev] [PATCH v3] f2fs: validate ACL entry sizes in
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
Cc: 2045gemini@gmail.com, zerocling0077@gmail.com, linux-kernel@vger.kernel.org,
 Zhang Cen <rollkingzzc@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.sourceforge.net:server fail];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:2045gemini@gmail.com,m:zerocling0077@gmail.com,m:linux-kernel@vger.kernel.org,m:rollkingzzc@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7A0268423D

f2fs_acl_count() only validates the aggregate ACL xattr length. A
malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
contains struct f2fs_acl_entry_short bytes, and f2fs_acl_from_disk()
then reads entry->e_id before verifying that a full entry fits.

Require a short entry before reading e_tag and e_perm, and require a
full entry before reading e_id for ACL_USER and ACL_GROUP. Return
-EFSCORRUPTED from these new truncated-entry checks, while keeping the
pre-existing -EINVAL paths unchanged.

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
Changes in v3:
- Keep the pre-existing -EINVAL error paths unchanged.
- Return -EFSCORRUPTED only from the newly added truncated-entry checks.

Changes in v2:
- Wrap the new ACL entry-size checks in unlikely().
- Return -EFSCORRUPTED for malformed on-disk ACL blobs.

 fs/f2fs/acl.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index fa8d81a30fb91..d3253549173e6 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -47,6 +47,7 @@ static inline int f2fs_acl_count(size_t size)
 static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 {
 	int i, count;
+	int err = -EINVAL;
 	struct posix_acl *acl;
 	struct f2fs_acl_header *hdr = (struct f2fs_acl_header *)value;
 	struct f2fs_acl_entry *entry = (struct f2fs_acl_entry *)(hdr + 1);
@@ -70,8 +71,11 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 
 	for (i = 0; i < count; i++) {
 
-		if ((char *)entry > end)
+		if (unlikely((char *)entry +
+				sizeof(struct f2fs_acl_entry_short) > end)) {
+			err = -EFSCORRUPTED;
 			goto fail;
+		}
 
 		acl->a_entries[i].e_tag  = le16_to_cpu(entry->e_tag);
 		acl->a_entries[i].e_perm = le16_to_cpu(entry->e_perm);
@@ -86,6 +90,11 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 			break;
 
 		case ACL_USER:
+			if (unlikely((char *)entry +
+					sizeof(struct f2fs_acl_entry) > end)) {
+				err = -EFSCORRUPTED;
+				goto fail;
+			}
 			acl->a_entries[i].e_uid =
 				make_kuid(&init_user_ns,
 						le32_to_cpu(entry->e_id));
@@ -93,6 +102,11 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 					sizeof(struct f2fs_acl_entry));
 			break;
 		case ACL_GROUP:
+			if (unlikely((char *)entry +
+					sizeof(struct f2fs_acl_entry) > end)) {
+				err = -EFSCORRUPTED;
+				goto fail;
+			}
 			acl->a_entries[i].e_gid =
 				make_kgid(&init_user_ns,
 						le32_to_cpu(entry->e_id));
@@ -108,7 +122,7 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 	return acl;
 fail:
 	posix_acl_release(acl);
-	return ERR_PTR(-EINVAL);
+	return ERR_PTR(err);
 }
 
 static void *f2fs_acl_to_disk(struct f2fs_sb_info *sbi,
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
