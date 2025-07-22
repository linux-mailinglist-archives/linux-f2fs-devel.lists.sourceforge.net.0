Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD6B0D129
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 07:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gp1ctm/xOF9oKTzcHgHPq4N5Q+U0z10KLuNAep47d58=; b=REvOFkvaX/SBgu0PHbetmPYtSE
	DZ7ANznvzXU1xFj5ANL828/gmjEm5V/gKL8UCufd5M8DxV/GPWPz5cXZ9DkmEe2C0CYhcfO7k1nCR
	B56jBcLX7BZWZknkI8J0RVNsTpiFAJ2VTrCK+/zS4KTeOjsPfmAlarvUWTqWm4GDhLsk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue5R1-0000IR-HH;
	Tue, 22 Jul 2025 05:21:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1ue5R0-0000IL-3l
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 05:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DDjp3aFBJIVhK1GvbGRYuEOWFCgxJNvbABXYxEDqqcE=; b=gVxT1XdMQhmFOEuEW97/QYvZLX
 23Pt/UFP0Gb8bWCVjdTD1NPkTxjDWw7FnzbL2cGWCiWqO/pYgGyCOUJVdaNIIOIQSnfYosfwyk46z
 MtS3ldqmj4ZdLMrOnhtH53X5WUIv97+OjzVUPtnedpxW3Ty9RElWzoWfKGfoG7a7ti30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DDjp3aFBJIVhK1GvbGRYuEOWFCgxJNvbABXYxEDqqcE=; b=H
 8fWXAkjxMhTX/uwyAlpDgM9iavF41BbT7tFF5Xl3oN7A2igEnV0LTvEf4oLelX2cAfneH78QM+7H4
 0/b41lkY73+FNaExE9+3jXB5z6j9RQqZ5YURBPMuHmXyml0U2OIzcHCH8lFD4HPBj6RlhwdKgqGHN
 YVj8P4mE/IC/efzc=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ue5Qz-0001bz-Ga for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 05:21:02 +0000
X-AuditID: a67dfc59-03fff7000000aab6-16-687f1fb28103
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 22 Jul 2025 14:20:45 +0900
Message-ID: <20250722052046.1445-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXC9ZZnoe4m+foMgxMdihanp55lsniyfhaz
 xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdx2aSk5mSWpRbp2yVwZUxbElKwnqvizNwu
 pgbGvRxdjJwcEgImEldbbrPD2P9+P2ADsdkENCT+9PYyg9giApoSRzpnAtVwcTALtDFKtB9t
 YgVJCAukS6w59QHMZhFQldi2azlYA6+AmcTyRUuZIYZqSuz4cp4JIi4ocXLmExYQm1lAXqJ5
 62xmkKESAndZJW5f3gTVIClxcMUNlgmMvLOQ9MxC0rOAkWkVo0hmXlluYmaOsV5xdkZlXmaF
 XnJ+7iZGYDgtq/0TuYPx24XgQ4wCHIxKPLwKDXUZQqyJZcWVuYcYJTiYlUR4v+0GCvGmJFZW
 pRblxxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamDk5PZd78Xey2cw9crZ
 BVZ9H5aGZS7a8PhkxSb3H7tUvzW0/okREV71aaPJ+XX3iu6aCUvc51l52IAhoE2ivrnsWSzj
 1O/rDY2T5vYbVMV3NKpt2KnItlDI/8yx7kPa9pqXbi5wXbOk6ZbU91hmCeEV/KsuMbdPYL34
 /GpSwilWxtLe2xO+10cosRRnJBpqMRcVJwIAK2M0yCMCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsXCNUNlju4m+foMg/87JC1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgypi2JKRgPVfFmbldTA2Mezm6GDk5JARMJP79fsAGYrMJaEj86e1lBrFFBDQljnTOZO9i
 5OJgFmhjlGg/2sQKkhAWSJdYc+oDmM0ioCqxbddysAZeATOJ5YuWMkMM1ZTY8eU8E0RcUOLk
 zCcsIDazgLxE89bZzBMYuWYhSc1CklrAyLSKUSQzryw3MTPHTK84O6MyL7NCLzk/dxMjMECW
 1f6ZtIPx22X3Q4wCHIxKPLwKDXUZQqyJZcWVuYcYJTiYlUR4v+0GCvGmJFZWpRblxxeV5qQW
 H2KU5mBREuf1Ck9NEBJITyxJzU5NLUgtgskycXBKNTBqJSRO2bW0vNV32/pGoXMKTdZvevk1
 c2LuZ+xi2TQ748RM/XV/poRb30vZdlvtUXR+0uSf/LZeh5hlrwR82PhAY33Qj8MLm9cvsP2W
 5zfn1nr+k5c4zhuw8zQ+MHEN27s4O6/6qWDJh21TX+68cyb1z7aYyW96nbeYfe1bE3dlS+4t
 RwkphR8ZSizFGYmGWsxFxYkAFvgumAwCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  read for the pinfile using Direct I/O do not wait for dio
 write. Signed-off-by: yohan.joung <yohan.joung@sk.com> --- fs/f2fs/file.c
 | 8 ++++++-- 1 file changed, 6 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index 4039ccb5022c..2b7e5c46c1ae 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -4834, 6 +4834,
 7 @@ static ssize_t f2fs_file_read_iter(struct kiocb *io [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ue5Qz-0001bz-Ga
Subject: [f2fs-dev] [PATCH v2] f2fs: zone: wait for inflight dio completion,
 excluding pinned files read using dio
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

read for the pinfile using Direct I/O do not wait for dio write.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/file.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4039ccb5022c..2b7e5c46c1ae 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4834,6 +4834,7 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct inode *inode = file_inode(iocb->ki_filp);
 	const loff_t pos = iocb->ki_pos;
 	ssize_t ret;
+	bool dio;
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
@@ -4842,12 +4843,15 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
 					iov_iter_count(to), READ);
 
+	dio = f2fs_should_use_dio(inode, iocb, to);
+
 	/* In LFS mode, if there is inflight dio, wait for its completion */
 	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
-	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
+	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
+		!(f2fs_is_pinned_file(inode) && dio))
 		inode_dio_wait(inode);
 
-	if (f2fs_should_use_dio(inode, iocb, to)) {
+	if (dio) {
 		ret = f2fs_dio_read_iter(iocb, to);
 	} else {
 		ret = filemap_read(iocb, to, 0);
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
