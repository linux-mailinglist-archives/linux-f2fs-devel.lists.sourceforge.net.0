Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qvC2MUMpOmpM3AcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 08:35:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB96B4924
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 08:35:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=AHmf4MB4;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="S/PkS5y+";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="e xJJJHi";
	dkim=fail ("body hash did not verify") header.d=google.com header.s=20251104 header.b=Zdvvs46d;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2v3TwdrzD+ZmFgccbFXa72LJRCHu6gQTorMg6YxBVug=; b=AHmf4MB4iW0ZptvQ6VBkUClP2w
	6HA1Kz5BZIQLpaLiObHzEpM2O7tB3E2cmPk6ygeVqst/BVPhuoG3UBCFg6cidh+sa29qKzGsI94Fa
	J+Od3cnQV8tl29rTubdbVWcOA98g6bO7thmAdTLytH44+IsBOIuQad29WjEIcmuaElwE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbujL-00046l-59;
	Tue, 23 Jun 2026 06:35:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3LCk6agsKAL8otfssjhmnjslttlqj.htr@flex--joannechien.bounces.google.com>)
 id 1wbujJ-00046W-NC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 06:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7euHvllGVN2xR+H7CES7r8htrHKGHGiwc6X1lxzcng=; b=S/PkS5y+yNYINUE+pPNh27hfCR
 hQ/PQnbL4dUQRdvvYVp7c2twa8YBxJZAOgHGxI18aSB6jKS1qaAOHDLGINz70fN27CZsv4bWjmzc/
 bSn0zAJomvT/jvolPCXi6dxfwRV9jYvwulySV4kpiYwN4tNmfDee1BEmtqO6/8yfC2lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P7euHvllGVN2xR+H7CES7r8htrHKGHGiwc6X1lxzcng=; b=e
 xJJJHi3BvI1b/3hSmkBXGCCZ3VpQweHJ/0rRDDIl9XlMQRGbkuCDP+jBVYpZKbpe7Yuhtg8ijm5nG
 YLkbexWoesWmflFxVtnftGgRqaKHKIxsFfJW1MMIu8eGBGzVJ/5KM7RQ0dOJPRnKPcaB+PnkbHaKC
 p4bl6u04sdTOjzNU=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wbujJ-0004rp-Dz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 06:35:30 +0000
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c88da04b71dso3315130a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 23:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782196524; x=1782801324;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P7euHvllGVN2xR+H7CES7r8htrHKGHGiwc6X1lxzcng=;
 b=Zdvvs46dM+9DB6kv0Wu5e3NLbaF/Nd7o4ydiV1dFHsPHQSL3BNUgVyrDDxUXLQI/31
 Hko/r+NSzHINcmZ1BRT6SBEP8zupl3sGdOsk2fkKIHviw+MoBwtDul/AgoIvWgZAiS7F
 98ds3nAIXCaGSj9mInqMXCKxRjs/Q6xUYRKwYMmIvYOaKaDn2CYJ3TFnycpgZybpGYp3
 WuaUuFmX5Cs4cz+5zAGVd5UyeFcMPsGP0JqzFZUyOQ7ST49URva4X/lAGu7nAhAY1qcx
 SYb9SHchbKUwn6RuQnsfXoPgiL7D9DFD/MTYhhzmOsFa/badGudskuI3SLEpO/Hc0IkX
 /61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782196524; x=1782801324;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P7euHvllGVN2xR+H7CES7r8htrHKGHGiwc6X1lxzcng=;
 b=seREo4oEmOabIV0AQ7eFykdp3fvFd2g1jacB3nHUbEYlYMcWDquaftmTz8265YsBdp
 FDKQrJbUMzSHFINBGKj+nP6QSHf/3Nr5bQhyb49IRoO7akJVDCQESHFu3XDQwc8KLsuE
 9PNtCFSApFE8Gb/5Oflu0UZgNifEqpmsUi2nCmWq/eMNJLPtvOqcd02n2QU3GlDmaDHU
 XndxL1tF46YfMY9WL/D95K4OvwwxHe7yzlLU/8pkex5+Zw9dc0A95sIpk6GhUcz02iC9
 w3WGqusLKz/SNBvP6mUYet1gL1aa/YKahYnRbe1CX8y7m/p4WQ6q+l1oAaYulJfn0tIk
 K8mg==
X-Gm-Message-State: AOJu0YwTQrMaHDgva13yHmG71gUFGI782YcWClC7Zm8MnhmP8wZIKp2V
 xWA8HNB3kGhWhtxXF5SfQDzkzy6ker0qrwZ17SYMRWq6pant/caI0omuIlb+pr6Ouysa4zeBhRV
 5eXzxpCra1GZ869e76fPgUps68Q==
X-Received: from pfr9.prod.google.com ([2002:a05:6a00:94c9:b0:842:3697:8685])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b95:b0:842:4f20:5402 with SMTP id
 d2e1a72fcca58-8456253555amr14657406b3a.21.1782196524023; 
 Mon, 22 Jun 2026 23:35:24 -0700 (PDT)
Date: Tue, 23 Jun 2026 06:34:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260623063428.222361-1-joannechien@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Xfstests generic/547 sometimes fail with mismatched directory
 metadata before and after a power failure. This happens because when a
 directory
 entry is added, renamed, or deleted, its mtime and ctime [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.201 listed in wl.mailspike.net]
X-Headers-End: 1wbujJ-0004rp-Dz
Subject: [f2fs-dev] [PATCH v2] f2fs: dirty directory inodes on mtime/ctime
 update
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Joanne Chang <joannechien@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:joannechien@google.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[joannechien@google.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8BB96B4924

Xfstests generic/547 sometimes fail with mismatched directory metadata
before and after a power failure. This happens because when a directory
entry is added, renamed, or deleted, its mtime and ctime are updated and
the inode is marked dirty via
f2fs_mark_inode_dirty_sync(dir, sync=false). The sync=false flag means
the dirty inode is not added to the global DIRTY_META list. Therefore,
subsequent checkpoints skip flushing these updated directory blocks,
causing directory timestamps to revert to stale values after a sudden
power failure.

Address this by changing the dirtying parameter to sync=true during
directory entry mutations and renames. This forces F2FS to immediately
queue the updated directory blocks on the global DIRTY_META list,
ensuring timestamps are committed to checkpoints.

Fixes: 7c45729a4d6d ("f2fs: keep dirty inodes selectively for checkpoint")
Cc: stable@vger.kernel.org
Signed-off-by: Joanne Chang <joannechien@google.com>
---
v1 -> v2:
- added Fixes and Cc tags

 fs/f2fs/dir.c    | 6 +++---
 fs/f2fs/inline.c | 2 +-
 fs/f2fs/namei.c  | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index a9563f7fcd88..e1c42d2b5c15 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -460,7 +460,7 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 	folio_mark_dirty(folio);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
-	f2fs_mark_inode_dirty_sync(dir, false);
+	f2fs_mark_inode_dirty_sync(dir, true);
 	f2fs_folio_put(folio, true);
 }
 
@@ -615,7 +615,7 @@ void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
 		clear_inode_flag(inode, FI_NEW_INODE);
 	}
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
-	f2fs_mark_inode_dirty_sync(dir, false);
+	f2fs_mark_inode_dirty_sync(dir, true);
 
 	if (F2FS_I(dir)->i_current_depth != current_depth)
 		f2fs_i_depth_write(dir, current_depth);
@@ -927,7 +927,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct folio *folio,
 	f2fs_folio_put(folio, true);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
-	f2fs_mark_inode_dirty_sync(dir, false);
+	f2fs_mark_inode_dirty_sync(dir, true);
 
 	if (inode)
 		f2fs_drop_nlink(dir, inode);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index e2f7bedf1552..aec06fb4fd76 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -732,7 +732,7 @@ void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
 	f2fs_folio_put(folio, true);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
-	f2fs_mark_inode_dirty_sync(dir, false);
+	f2fs_mark_inode_dirty_sync(dir, true);
 
 	if (inode)
 		f2fs_drop_nlink(dir, inode);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index cac03b8e91a1..7ffdf23cea5e 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1076,7 +1076,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	f2fs_up_write(&F2FS_I(old_inode)->i_sem);
 
 	inode_set_ctime_current(old_inode);
-	f2fs_mark_inode_dirty_sync(old_inode, false);
+	f2fs_mark_inode_dirty_sync(old_inode, true);
 
 	f2fs_delete_entry(old_entry, old_folio, old_dir, NULL);
 	old_folio = NULL;
@@ -1246,7 +1246,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_i_links_write(old_dir, old_nlink > 0);
 		f2fs_up_write(&F2FS_I(old_dir)->i_sem);
 	}
-	f2fs_mark_inode_dirty_sync(old_dir, false);
+	f2fs_mark_inode_dirty_sync(old_dir, true);
 
 	/* update directory entry info of new dir inode */
 	f2fs_set_link(new_dir, new_entry, new_folio, old_inode);
@@ -1265,7 +1265,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_i_links_write(new_dir, new_nlink > 0);
 		f2fs_up_write(&F2FS_I(new_dir)->i_sem);
 	}
-	f2fs_mark_inode_dirty_sync(new_dir, false);
+	f2fs_mark_inode_dirty_sync(new_dir, true);
 
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT) {
 		f2fs_add_ino_entry(sbi, old_dir->i_ino, TRANS_DIR_INO);
-- 
2.55.0.rc0.786.g65d90a0328-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
