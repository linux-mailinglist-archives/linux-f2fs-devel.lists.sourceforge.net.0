Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F07973822
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 14:58:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so0Rj-0000Ds-5j;
	Tue, 10 Sep 2024 12:58:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1so0Rh-0000Dd-C4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 12:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8gOqnFxbdeBR8LP2N/J1Uj12n9MfCFc2UBVpTZiRkw=; b=euxx/4Fd+nkI7XE9eftoTAIavU
 JJquuSu6N5nSvnJJruJt8NZ7jYGzJyCYFIKtC7EosDjYMHmvtwVQByrfdXRalQhdqsq4Uovn73hm9
 1d2L9Vr+zEkYQLcY2ExCN5PZq35uMPvfCA1snF0j+SX809c7mcvIRjbcly27LBIfWm2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i8gOqnFxbdeBR8LP2N/J1Uj12n9MfCFc2UBVpTZiRkw=; b=E
 sue4Dm7D6b82RshOKceWY6AsmrhGtobnPDO5S8bAAjju4pUX+UriG/yKKJoHfVBiSEe408Keo/fPz
 nvrwjTSqWaBatHz3y2NmcfkD1ooM7NVRPU/B42xTwADy93pkOxOTfSFX9AuSxD32BDfa/7wqBNCOH
 HZ0KNEBh61w7rfd4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1so0Rg-0006OL-KR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 12:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4E90FA4470F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 12:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551E1C4CEC6;
 Tue, 10 Sep 2024 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725973081;
 bh=vwQ88BpQCZ7595D2+tEmHq3Pwl2yGQtzZstSueKAOZE=;
 h=From:To:Cc:Subject:Date:From;
 b=eHD3uvoJ/I8pfd67YeayNC93MTrU3OMqBOUZph4Y49FHjaZcElkbyyZ4M9+Q9PF7F
 hNhR08toQ9Mkrnr5RezZijq2JHltsnvmV9fpOK3Nmj5dp12xCFPxIPvdwTB/iDHklY
 IivOMtRDIoSHTMtAKpB0eHI3O4p+cpeUst0wceH8TWS3TqmySMk5NWMKeiQTtz/NfH
 RrCA1a0KM9La9lQyOxeIQcC1ofvBq10PYdcp5kY3QBa+jqJ/wY3gGPJ8ob/aEBlNPY
 JArEByH3QWMPu0H/T9KN7+s31qeJcSMrwtcLT7J38kO2OWorKAQO4R5c22FS2Dt3Yy
 GeC0YR8m28dEw==
To: jaegeuk@kernel.org
Date: Tue, 10 Sep 2024 20:57:53 +0800
Message-Id: <20240910125753.80502-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After commit 5c8764f8679e ("f2fs: fix to force buffered IO
 on inline_data inode"), f2fs starts to force using buffered IO on inline_data
 inode. And also, it will cause f2fs_getattr() returning invalid zeroed value
 on .dio_mem_align and .dio_offset_align fields, however, STATX_DIOALIGN flag
 was been tagged. User may use zeroed .stx_dio_offset_ [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1so0Rg-0006OL-KR
Subject: [f2fs-dev] [PATCH] f2fs: fix to tag STATX_DIOALIGN only if inode
 support dio
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After commit 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data
inode"), f2fs starts to force using buffered IO on inline_data inode.

And also, it will cause f2fs_getattr() returning invalid zeroed value on
.dio_mem_align and .dio_offset_align fields, however, STATX_DIOALIGN flag
was been tagged. User may use zeroed .stx_dio_offset_align value
since STATX_DIOALIGN was been tagged, then it causes a deadloop during
generic/465 test due to below logic:

align=stx_dio_offset_align(it equals to zero)
page_size=4096
while [ $align -le $page_size ]; do
	echo "$AIO_TEST -a $align -d $testfile.$align" >> $seqres.full
	$AIO_TEST -a $align -d $testfile.$align 2>&1 | tee -a $seqres.full
	align=$((align * 2))
done

Quoted from description of statx manual:

" If  a  filesystem  does  not support a field or if it has an
  unrepresentable value (for instance, a file with an exotic type),
  then the mask bit corresponding to that field will be cleared in
  stx_mask even if the user asked for it and a dummy value will be
  filled in for compatibility purposes if one is available (e.g.,
  a dummy UID and GID may be specified to mount under some
  circumstances)."

We should not set STATX_DIOALIGN flag in kstat.stx_mask if inode
does not support DIO, so that it can indicate related fields contain
dummy value, and avoid following incorrect use of them.

Fixes: c8c02272a9f7 ("f2fs: support STATX_DIOALIGN")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 99903eafa7fe..f0b8b77e93ba 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -906,14 +906,11 @@ int f2fs_getattr(struct mnt_idmap *idmap, const struct path *path,
 	 * f2fs sometimes supports DIO reads but not DIO writes.  STATX_DIOALIGN
 	 * cannot represent that, so in that case we report no DIO support.
 	 */
-	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
-		unsigned int bsize = i_blocksize(inode);
-
+	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode) &&
+				!f2fs_force_buffered_io(inode, WRITE)) {
+		stat->dio_mem_align = F2FS_BLKSIZE;
+		stat->dio_offset_align = F2FS_BLKSIZE;
 		stat->result_mask |= STATX_DIOALIGN;
-		if (!f2fs_force_buffered_io(inode, WRITE)) {
-			stat->dio_mem_align = bsize;
-			stat->dio_offset_align = bsize;
-		}
 	}
 
 	flags = fi->i_flags;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
