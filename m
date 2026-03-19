Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJEtIypiu2lujQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 03:40:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C10AE2C5106
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 03:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DKG3+l7e5Jierc9u4gp2vw2PF4Y3prjNZ2W4KD/Bhrg=; b=N8dLXjyuGfZixhKIMDsyP71fMz
	n4VoWXNH/YS4YMCskQPreyuvB8sPpD7/LcYxZvJHa3fNQG2b9MAvd4zWenIfo+PFqf3iJKBMcrN8b
	uV5juW6SBYz0qpZfnVhZJKteqg+5rizLp4g/X2D1YC20JOVEZCtihPzsn+GH5RRAZSDo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w33JG-0006Ku-3C;
	Thu, 19 Mar 2026 02:40:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zzzccc427@gmail.com>) id 1w33JE-0006Kn-A9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 02:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HF3dhpPX3brhaCSBxcgIx0vD92ueHkK4Zsm76LgK6Dk=; b=Qknnbx30xsbavR8N1SYb7oXWam
 z6b26cdRCcmq21UcftIenGrmlor3H+WYXHpg1l6dPGxCbhwwD2OGjkD8HolJTkbd4hu/gZhteM/SF
 nbqh6TvOn23urwSgJ+NnQWsS9ju8Z8/66OKYh1xYekhOJtvx2TzVBB+11aNMSysE9cZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HF3dhpPX3brhaCSBxcgIx0vD92ueHkK4Zsm76LgK6Dk=; b=M
 Wgs8IGRAtJWE7loyrLDyrrXfuaK6/r1ikYlsw4UfXPadY63TmrZBZEF4tKnidbzVetxlF8NYXCds0
 cVVb8wgVvnXbC4/rtG2jRJqeSBjj7PzgvYN9ymEO2y0oI7NS8DWxwkgNghTK0vknt8jaTz1QzqNyT
 QcjBA/2mnz9UL0Iw=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w33JD-0007ga-TN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 02:40:28 +0000
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c74280e3468so233486a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2026 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773888017; x=1774492817; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HF3dhpPX3brhaCSBxcgIx0vD92ueHkK4Zsm76LgK6Dk=;
 b=GQOQBJ7r8KYu0nI+9HUto1J8BaCymNXSW213aBuSLOvFpni7CIpDlT+dx2+XSl+8MI
 3zhjLLNjI1By9ZtzGtPaLp1u+QvdVhrfSqCtQvbMTbau4Lf4I3cXkfarS0uWjgDvMS7G
 5BmlPJImAYW1nmpUTGRAlDy1YEjguQNLpJUcikFDnE1F+svbvZmifyCo0w+Bob+06D/c
 GG1j7BzCjPg/IkNLou7k80b051cGbNw+6F2luFmB+QvqBsI02n1ob+UJ8N9fMuF0TtQK
 uSMMhcywQecLKQROz6fx3H2NyRcYxsim0jL9bJk2XoatM0An7egyq55KNIm+ByNZrdTP
 I6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773888017; x=1774492817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HF3dhpPX3brhaCSBxcgIx0vD92ueHkK4Zsm76LgK6Dk=;
 b=lM4zMepiMHR5FNXMGx9jx3gUJVX36GKF+++QLpDvmQYxSmTJV/NZ12VDYotPXCszVV
 2S/dQkt/aaF6WgUwcNDi4XpXJs9CaHZl7MAyeB3FRgDmlPc+8BO0bFJpgfvkxB+Y8VGJ
 t5S4KHWUTEw44pHt2SHijoRkSdMnuovZyMsLapTB1pxKtgOZNwO+Sm74Qc/Uv7zx+AmE
 HriMIej0NfVLwkGeeRVdP9YyEPzbrobkvsBr17mvARHekStJjSK9LdsiiCcTzfhYud3h
 9n/hR74ITiZ2vsmxuQk294eIn2EdhAOlO7VNmsRMGsHJ34tebfJKACLN0rC40CLrdiC1
 OoJg==
X-Gm-Message-State: AOJu0Yw0Q0xrlEknlc+tdvlVf7fB4KV9V5GQ0y0PwBXr0Hq+HJ774l58
 UdEovw7ke8wOK3yZCwi0dNwbXhjpLBFpz7ycRHo6KBvVcnt1cL9Z0Lsq
X-Gm-Gg: ATEYQzwMEeV9ReuAHYLcWJbybSVmAkZf1/KB3FbOVtcQS9bbqRXufg0oOSdvIyZgZWf
 crU+VVlea23YaTtNXotKF9YUUvmlr8YBPQT3krzWLVK5Z+KaO+BTeChAvmh7HBe29ZoRC6Fs+c4
 yvHhvDKJHk6432kwWNfs83OrxGPB4Uk4K0HyEn3VtkfWJC2wzg+9jsR8TDdbjV+LD++3fOFwiqp
 OjMZyAlMUvQIlxozz3UB2VxQ+icL+HytyxkxkJa7KG627eT13qImiAmlbQZc9F9Oj974jgV0PPs
 e/qyNyTv38i1kDcMjrtSjOa5WAusuGuqM1iY9Q8BMt+2iMpgZNuxN4fBFlf7wfUtrXhpopRrN5v
 yTw4lACptLIaucMr5ARx+bRbf3OOUkE1owhu7Mkc2MOJmX4kKp+fL12EG65hDfFVBbtthGl312Y
 9cn6Q+GFALbrkeFPFSPA==
X-Received: by 2002:a05:6a21:690:b0:398:9c27:2479 with SMTP id
 adf61e73a8af0-39b99c8d2d6mr5321541637.5.1773888017010; 
 Wed, 18 Mar 2026 19:40:17 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c742bc99cf4sm528427a12.0.2026.03.18.19.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 19:40:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 19 Mar 2026 10:23:35 +0800
Message-Id: <20260319022335.3213311-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 [209.85.215.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w33JD-0007ga-TN
Subject: [f2fs-dev] [PATCH] f2fs: annotate data races around fi->i_flags
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:baijiaju1990@gmail.com,m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zzzccc427@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C10AE2C5106
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

Fixes: 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4 i_flags")
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
