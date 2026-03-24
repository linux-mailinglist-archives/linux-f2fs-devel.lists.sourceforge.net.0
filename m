Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHThNmfewWnxXQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 01:44:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 230182FFECA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 01:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=keUs1ivbZjgr9qhwSJRHyWcEdgqP01RAHvSGbjWx16U=; b=Bvpz9kUlkJTsMDPpZygrWCBO79
	ZI0PTJry6nijjOgk7I7Bv7B2assi0W2JGcAUW23qGSml9A1OXRnC5l3pqeJD2zovs+OFKEjPbwRth
	o3UVrwDwiQYi3nUspw6gF75eH/DALIoj1m0Povl6y1Q6kwbgyI8YBAew3/Qx8nfj2cYk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4psT-0000vm-2R;
	Tue, 24 Mar 2026 00:44:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1w4psR-0000ve-FK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 00:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WDF2rKSjnx+vam0p+IAkZHVoKVx3ZMEABJISbR0EKR8=; b=ivqgSqtcO+B8zDdhK/9gA30l5N
 O7nk3m7GUhhCv2G3DUrAKqhASbYwBwA7Grqi6iGdIw2DYStVrrgM/qj6YdgchumcD/9QrV/vtF/3F
 Cj/QooeXhhIf9JrLCnyARrIAS1ky7dquFzSbgpBzB9PtP5CO91h5m+89Cg4jJ1kw8ywM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WDF2rKSjnx+vam0p+IAkZHVoKVx3ZMEABJISbR0EKR8=; b=k
 WhQx9GmYce7FWCx0GM67vbHie3j2iDqJrzWhpB8NxjO5NauidZG/1kQJby1QQtjyG8Wm0WEAQ/KHb
 g5rYnQMKZhrh3K+bG05mNuUlSNgt0QIXBSrwcge9886wDlTxGYLV2OuQ6g6EZQYLCc/0lLioGdcS7
 apsWRsxnEZMUnT50=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w4psQ-0005bf-Sn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 00:44:11 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-82c28f0a4ecso2089197b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2026 17:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774313040; x=1774917840; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WDF2rKSjnx+vam0p+IAkZHVoKVx3ZMEABJISbR0EKR8=;
 b=NKHiXkL+ULzsnYutgEbgXVU2N24dz3mPg3DrUHnROlYIxyPx+bPYBn3pwSYKcqSWrx
 k8wsBUqe9CCtjNwu4sS6UyvRRZmRy42jGCkfUy9SKUBQyNap7kMF/3AOqomEIjiOH8Ct
 mmvXMFHpjoG69+m+yJM3b6LDJgzT62x8aw69ei6xrXhupb3mfhyxcSonT4PiybPGPoT7
 M5DMMArFQHRMw+maASpj+cR/CJBc8vEYc0WqLmBMduFDZMqetYWZEE4AVY+j2oISIK2f
 3WtOUh0VKK6wXVQSe2SPWoIOQVKanQSDnOe/njkoy4v9PRZ3qwQUYJ4JNmMawJhbHnac
 ovlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774313040; x=1774917840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDF2rKSjnx+vam0p+IAkZHVoKVx3ZMEABJISbR0EKR8=;
 b=ZPKetwLaYfcqbTyfI5MfBQN9ZYUo84UEIVfnzMUjBuk3qrbrLXIZ56FHGEZnxnKr+V
 LulDbcMnpjJyjgS3+NOofKiPpj+4kSEed9+Ug8OkYUheFiUl+0BGHBomeMQOUplME+6z
 F3yRLTjZ62722UjdWangn935NxUudyo0jK8Bzo4a8zYm+oO+hFHD67OFj6ffw3fYC4vo
 EJ0IHkbWuZPFv6bShLB4E8RlNpFr2vueWZ2W5A1wFLPydsU9ikGmQqXqDqP8txzXf7ng
 9UDkncwxoVjYStWVi2nov+EvPak7AUKLD6rTxuDyzLO0Q/Ez8BhnHxPeS28oMearCSPM
 Yu+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsitPFRZ7dlSNjwf1gaI6RVzKkQ2j6lxh2IE9sAXUwRv3pmyD63PahAZ23xVEU3aLbBSgry09Ar3SNSOt8woTs@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx+q8bFj8q96E6cT8pdOwa9KCKMUjyJkDbq+Xu0YpqWQ8tmW3X9
 PqQqhMV3HsKoa09fKgAx2iV7dX/31rCuFofwT3jfwsRKdno6sL/1QX2v
X-Gm-Gg: ATEYQzwmckRot/3q3Q2IJ1+omPNYoh9rue7cbvlusrwGyYiwNx4aeKkSNfBrkGokcxn
 ICQGFNKZPhLijAnzXBzfQJPPFbat1pS06s1KXvTD7mYahAWR1TnEUIhtYiZikWo909qKNqGy2Gq
 /Tzct9OFgvvmJ3b+pKrOMn8Tha5bfADkW9FzR3QZy9DkgJFm2fPAeGXMaylPEELrJ8W6+Fcvzze
 96fPupw+B8FxBy0hQYYgPpXBestlSH6E/dDbRCPMPj2A1BUkCfEKe0k+JZYiMaKnXEKWPBOvnDr
 QzWYOAglSKjPzjv0ViR6UAEllE6YBlrGYTaXwsX9Bku4X5bz5975KQKUdG2ESHb2JE+TlPm+v+D
 oWCRjwgxz+DuCIG2XVqG8/4ZxfHl7uF7bImkpIp8zfyCBFHGHYFUsvr7X5uaKjQB3we1VqOCjXl
 pejcH9KfmafVfYy0bDUQ==
X-Received: by 2002:a05:6a20:734b:b0:38b:dec8:9da2 with SMTP id
 adf61e73a8af0-39bce9f7a44mr12203730637.26.1774313040089; 
 Mon, 23 Mar 2026 17:44:00 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c74443cc2ddsm8105285a12.24.2026.03.23.17.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 17:43:59 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: jaegeuk@kernel.org
Date: Tue, 24 Mar 2026 08:26:20 +0800
Message-Id: <20260324002620.3879274-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fi->i_flags can be read by f2fs_update_inode() in the
 writeback
 path, f2fs_getattr(), and f2fs_fileattr_get() without holding inode_lock
 or fi->i_sem, while it can be concurrently written by f2fs_setf [...] 
 Content analysis details:   (2.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zzzccc427(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zzzccc427(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w4psQ-0005bf-Sn
Subject: [f2fs-dev] [PATCH v2] f2fs: annotate data races around fi->i_flags
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 Cen Zhang <zzzccc427@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 230182FFECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fi->i_flags can be read by f2fs_update_inode() in the writeback path,
f2fs_getattr(), and f2fs_fileattr_get() without holding inode_lock or
fi->i_sem, while it can be concurrently written by
f2fs_setflags_common(), set_compress_context(), and
f2fs_disable_compressed_file() under inode_lock and/or fi->i_sem.

This is a data race as defined by the LKMM.  Use READ_ONCE() on the
read side and WRITE_ONCE() on the write side to ensure proper marking
of the concurrent accesses.

Fixes: 19f99cee206c ("f2fs: add core inode operations")
Cc: stable@vger.kernel.org
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/f2fs/f2fs.h  | 4 ++--
 fs/f2fs/file.c  | 6 +++---
 fs/f2fs/inode.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c66472e409a3..28161df79e4f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4764,7 +4764,7 @@ static inline int set_compress_context(struct inode *inode)
 		fi->i_compress_algorithm == COMPRESS_ZSTD) &&
 			F2FS_OPTION(sbi).compress_level)
 		fi->i_compress_level = F2FS_OPTION(sbi).compress_level;
-	fi->i_flags |= F2FS_COMPR_FL;
+	WRITE_ONCE(fi->i_flags, READ_ONCE(fi->i_flags) | F2FS_COMPR_FL);
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
 	stat_inc_compr_inode(inode);
 	inc_compr_inode_stat(inode);
@@ -4791,7 +4791,7 @@ static inline bool f2fs_disable_compressed_file(struct inode *inode)
 		return false;
 	}
 
-	fi->i_flags &= ~F2FS_COMPR_FL;
+	WRITE_ONCE(fi->i_flags, READ_ONCE(fi->i_flags) & ~F2FS_COMPR_FL);
 	stat_dec_compr_inode(inode);
 	clear_inode_flag(inode, FI_COMPRESSED_FILE);
 	f2fs_mark_inode_dirty_sync(inode, true);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c8a2f17a8f11..abff927a8699 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1005,7 +1005,7 @@ int f2fs_getattr(struct mnt_idmap *idmap, const struct path *path,
 		}
 	}
 
-	flags = fi->i_flags;
+	flags = READ_ONCE(fi->i_flags);
 	if (flags & F2FS_COMPR_FL)
 		stat->attributes |= STATX_ATTR_COMPRESSED;
 	if (flags & F2FS_APPEND_FL)
@@ -2153,7 +2153,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		}
 	}
 
-	fi->i_flags = iflags | (fi->i_flags & ~mask);
+	WRITE_ONCE(fi->i_flags, iflags | (READ_ONCE(fi->i_flags) & ~mask));
 	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
 					(fi->i_flags & F2FS_NOCOMP_FL));
 
@@ -3437,7 +3437,7 @@ int f2fs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	u32 fsflags = f2fs_iflags_to_fsflags(fi->i_flags);
+	u32 fsflags = f2fs_iflags_to_fsflags(READ_ONCE(fi->i_flags));
 
 	if (IS_ENCRYPTED(inode))
 		fsflags |= FS_ENCRYPT_FL;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 078874db918c..17c8aff690fb 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -720,7 +720,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 	else if (S_ISREG(inode->i_mode))
 		ri->i_gc_failures = cpu_to_le16(fi->i_gc_failures);
 	ri->i_xattr_nid = cpu_to_le32(fi->i_xattr_nid);
-	ri->i_flags = cpu_to_le32(fi->i_flags);
+	ri->i_flags = cpu_to_le32(READ_ONCE(fi->i_flags));
 	ri->i_pino = cpu_to_le32(fi->i_pino);
 	ri->i_generation = cpu_to_le32(inode->i_generation);
 	ri->i_dir_level = fi->i_dir_level;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
