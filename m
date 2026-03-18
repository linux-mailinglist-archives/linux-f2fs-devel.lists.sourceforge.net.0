Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPyREZBmumklWAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 09:47:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 943ED2B85F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 09:47:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRFFWjWWCSoEysfLpATWzNpPoKbJZEYhX2YeU4QbTOY=; b=KY7gil3dfw1zWjw9wXfowibAju
	iEECpQG9voyduUdxvtHDGfglfLaZq+lZr/Gu00SMtV+Z/iF7hALVHtO8Hy73PuZ2a+yRvcXLSXe1F
	V7sUqNwbsGd7gbXKXHcMnp/qA0yyLGxbh0Z1yI5PYTUfs94/klh3MJPNVIxq853HqxQA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2mYX-0006g0-DN;
	Wed, 18 Mar 2026 08:47:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w2mYW-0006ft-D8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 08:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=egKhg2ZlDcNHyOk4JOYiEsfNNPA5j3o23bxaDDi0hQQ=; b=gEA6oBxzpdbQ/KRkNwoo/TtTCa
 FfJ4YRs/d/1JgTp6d2mAawOKB+2E7VBMHYwz0OZsHdiSnHLbFSTzW4nhh87ebg0NmY0jJyyaeoptZ
 A6ItwU/6R2Yqn7f5kncg9O0FlagHDgq4rAUosoEUQ4nhTqhyO/hJsLiue3FPUK6u0o+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=egKhg2ZlDcNHyOk4JOYiEsfNNPA5j3o23bxaDDi0hQQ=; b=ZNt3R8GiIOoXIdQxHz+0K/++lM
 /ErV+ZjjNAntmxrkPgYfA4OyahQGeSrj9u25pECt9jPQ9AmGOMBOxIDzoN4Dnc84DCtr+yFLAwZ6V
 Q0y+qmXaFAglt1hOjf8WI1+4/76WD0x30y/9wEE7xpgG/SbcpvlamVnemZ+Ea0Ix/WFQ=;
Received: from mail3-163.sinamail.sina.com.cn ([202.108.3.163])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2mYW-0002yv-AW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 08:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773823628; bh=egKhg2ZlDcNHyOk4JOYiEsfNNPA5j3o23bxaDDi0hQQ=;
 h=From:Subject:Date:Message-ID;
 b=dUjBIGlTsLomhVXjIWZM8cwCdISl6bSXDc2Dt9BMlijTcX+xkaksec6qXlDiOPveq
 tRhqiLnXoQFiKZhh1D21zAfWLCxCLcGC4zmiFGFrSFBSEjTZyzf4AqdQ08+p+hxXLb
 lnRhyI5sTf5+M3fdFdSWBBh9LHtS3vSBJ9FHeSCg=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69BA667A000055B4; Wed, 18 Mar 2026 16:46:54 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 3660926291997
X-SMAIL-UIID: A57CB7E2723849CD82A2A17857AF4867-20260318-164654-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 18 Mar 2026 16:46:35 +0800
Message-ID: <20260318084534.373516-5-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084534.373516-2-monty_pavel@sina.com>
References: <20260318084534.373516-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang When f2fs_fiemap() is called with
 `fileinfo->fi_flags`
 containing the FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
 retrieving file mappings via filemap_write_and_wait(). However, th [...] 
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
 [monty_pavel(at)sina.com]
X-Headers-End: 1w2mYW-0002yv-AW
Subject: [f2fs-dev] [PATCH v5 4/4] f2fs: fix inline data not being written
 to disk in writeback path
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email,sina.com:mid]
X-Rspamd-Queue-Id: 943ED2B85F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
retrieving file mappings via filemap_write_and_wait(). However, there is
an issue where the file does not get mapped as expected. The following
scenario can occur:

root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
root@vm:/mnt/f2fs# xfs_io data.3k -c "fiemap -v 0 4096"
data.3k:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..5]:          0..5                 6 0x307

The root cause of this issue is that f2fs_write_single_data_page() only
calls f2fs_write_inline_data() to copy data from the data folio to the
inode folio, and it clears the dirty flag on the data folio. However, it
does not mark the data folio as writeback. When
__filemap_fdatawait_range() checks for folios with the writeback flag,
it returns early, causing f2fs_fiemap() to report that the file has no
mapping.

To fix this issue, the solution is to call
f2fs_write_single_node_folio() in f2fs_inline_data_fiemap() when
getting fiemap with FIEMAP_FLAG_SYNC flags. This patch ensures that the
inode folio is written back and the writeback process completes before
proceeding.

Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v5:
- Declare f2fs_write_single_node_folio() in fs/f2fs/f2fs.h.
v4:
- Fix the missing return value check for f2fs_get_inode_folio().
v3:
- Call f2fs_write_single_node_folio() instead of f2fs_sync_node_pages()
v2:
- Call f2fs_sync_node_pages() in getting fiemap path rather than
writeback path.
---
 fs/f2fs/f2fs.h   | 2 ++
 fs/f2fs/inline.c | 9 +++++++++
 fs/f2fs/node.c   | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2de1764e693f..3b1fdaac1ef6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3950,6 +3950,8 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					enum node_type ntype, bool in_irq);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
+int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
+			bool mark_dirty, enum iostat_type io_type);
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 86d2abbb40ff..62a8a1192a41 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -814,6 +814,15 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 	}
 
+	if (fieinfo->fi_flags & FIEMAP_FLAG_SYNC) {
+		err = f2fs_write_single_node_folio(ifolio, true, false, FS_NODE_IO);
+		if (err)
+			return err;
+		ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+		if (IS_ERR(ifolio))
+			return PTR_ERR(ifolio);
+		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
+	}
 	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
 	if (start >= ilen)
 		goto out;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3e4847c6e3a3..6bb810d0f4c3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1848,7 +1848,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool do_fsync,
 	return false;
 }
 
-static int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
+int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
 			bool mark_dirty, enum iostat_type io_type)
 {
 	int err = 0;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
