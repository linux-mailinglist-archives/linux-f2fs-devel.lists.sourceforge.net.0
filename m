Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB169CB1D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Feb 2023 13:36:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pU5P4-0004v1-Mg;
	Mon, 20 Feb 2023 12:36:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=408d5b2c3=hans.holmberg@wdc.com>)
 id 1pU5P1-0004uq-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Feb 2023 12:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kqGUptKdIaIxfEfJ3MOkZuSL4Yysp0K//QP3iFN9qpw=; b=YH9qCpgPPB5t0iL71IhEx/uJk8
 Tlm5E9M9lgRL9eEQVrwfVz5jcVL2/JO6nws+qOHoz1rBxBO9RLpDZizISF8stTRIRIenkJZAj8i6B
 3Wn1WiE/PKuXgjIALlCpdA01LgZ74XcP9R7AP/Mf/N08E2F26oz7DRqkWFPs2xvXtZLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kqGUptKdIaIxfEfJ3MOkZuSL4Yysp0K//QP3iFN9qpw=; b=N
 Bd2R0EWxRkzlKOhtX/aJAp1SmBKQ2UBa0VU4knJNpZacvnVort6w5j4XQavIrjWsuiqyjYjthkFxx
 CA9yxbrGFvUhP24FMo5SFR4I0VWHe3ltvyEjuhjz/6+h6uBky/N39VGiXlGrBAa6Obr+P04W8VkhI
 mtDftdSTU8dpjmJQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pU5Ow-0007s6-L6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Feb 2023 12:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1676896575; x=1708432575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r2t9/+0mPyYRoKhemlejneFLZV/XH/8xS8WW3RqGIus=;
 b=N8JUVqhweMqSXL6JkDiTI5xSJXAcOxA/ETUd0UQMkUtJTg1IZ4ibjtma
 GCFBN8Jmc1FiccDX3tVMFY7D13gr/yc7/vMOSKOefGTRk4W279s8qxRnx
 Sys70335NukX5lg0x7XOs/j6FeKmHzgW9p3tM2APAc119usJZH1ZNT12J
 2SO4wctVWks4loRi6dK1+nPrZtCDjpTMYjgb8xXWpS54j8bRLH8QJvWda
 MFS0mvE4Sz7yB23EWFD3moivBEOMKApVqu0iCvGnADLiJneWW2N6hVI31
 pdAyWAFGkkFFEApJ06ReQULsE1D7anHk1QL5XqEGQeCBL49t0EmBh/Dfl g==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669046400"; d="scan'208";a="328032387"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2023 20:20:25 +0800
IronPort-SDR: UyuFEY6+KfHxvxtSTgoezXhWyFP4NCqv/rdvYAE3D/5JomzBxPHQpNPqjIAIoc34qKqKgHG0ET
 Vh1fRWW/YI8HhiyNwmOJU13xF/SgghRdTAJWfm96x0OK+hdSNbA7m6BZWaRYaigv3VsYSbfVik
 VdOONa1xuk6FELr/jVFpQ62HXhcG1HJn+x7a7qsbtYqKR3K9unHSNt9fkIIthB6Ijwca6GXoPp
 DdC7MHOQB/J3EoeeX+C6DRya3eTTVu2vtGfCvFvaQsdlaujLBw5NOXsDhcxtG9nzAIofyDAet9
 ML8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Feb 2023 03:31:42 -0800
IronPort-SDR: J4bt4eoSnMDc5GaXdqcwwNCKpVEtitq4fR5WlvKXEZ2TaGvSMXrxLeiUyAS52bOrIp8K3bqlJE
 N7JcGIWpCQvf2NNzWMvpNRD325rj9cP39CfyF9JEVQ6qmyUXsxYjKYyZJM0QvAxbN9zyPk/pE0
 M0zIv76/w1I2UxlDz67Zan3p2tWclBArpQ2JKvDZBfk1Ta/WFmD+cMXXQisp9IAhO+8lIxjWPH
 MVjolckdK2Z89pj8OJ71Zcy2qqsrv/v8vc7hLnSb17N89jeQ4LOKFGE4P7yqxk2qT+qRtwFhUT
 314=
WDCIronportException: Internal
Received: from dellx5.wdc.com (HELO gsv.cphwdc) ([10.200.210.81])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Feb 2023 04:20:23 -0800
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 20 Feb 2023 13:20:04 +0100
Message-Id: <20230220122004.26555-1-hans.holmberg@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In some cases, e.g. for zoned block devices, direct writes
 are forced into buffered writes that will populate the page cache and be
 written out just like buffered io. Direct reads, on the other hand,
 is supported
 for the zoned block device case. This has the effect that applications built
 for direct io will fill up the page cache with data that will never be read,
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.143.124 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pU5Ow-0007s6-L6
Subject: [f2fs-dev] [RFC PATCH] f2fs: preserve direct write semantics when
 buffering is forced
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
From: Hans Holmberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hans Holmberg <hans.holmberg@wdc.com>
Cc: damien.lemoal@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In some cases, e.g. for zoned block devices, direct writes are
forced into buffered writes that will populate the page cache
and be written out just like buffered io.

Direct reads, on the other hand, is supported for the zoned
block device case. This has the effect that applications
built for direct io will fill up the page cache with data
that will never be read, and that is a waste of resources.

If we agree that this is a problem, how do we fix it?

A) Supporting proper direct writes for zoned block devices would
be the best, but it is currently not supported (probably for
a good but non-obvious reason). Would it be feasible to
implement proper direct IO?

B) Avoid the cost of keeping unwanted data by syncing and throwing
out the cached pages for buffered O_DIRECT writes before completion.

This patch implements B) by reusing the code for how partial
block writes are flushed out on the "normal" direct write path.

Note that this changes the performance characteristics of f2fs
quite a bit.

Direct IO performance for zoned block devices is lower for
small writes after this patch, but this should be expected
with direct IO and in line with how f2fs behaves on top of
conventional block devices.

Another open question is if the flushing should be done for
all cases where buffered writes are forced.

Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
---
 fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ecbc8c135b49..4e57c37bce35 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4513,6 +4513,19 @@ static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
 	.end_io = f2fs_dio_write_end_io,
 };
 
+static void f2fs_flush_buffered_write(struct address_space *mapping,
+				      loff_t start_pos, loff_t end_pos)
+{
+	int ret;
+
+	ret = filemap_write_and_wait_range(mapping, start_pos, end_pos);
+	if (ret < 0)
+		return;
+	invalidate_mapping_pages(mapping,
+				 start_pos >> PAGE_SHIFT,
+				 end_pos >> PAGE_SHIFT);
+}
+
 static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 				   bool *may_need_sync)
 {
@@ -4612,14 +4625,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 
 			ret += ret2;
 
-			ret2 = filemap_write_and_wait_range(file->f_mapping,
-							    bufio_start_pos,
-							    bufio_end_pos);
-			if (ret2 < 0)
-				goto out;
-			invalidate_mapping_pages(file->f_mapping,
-						 bufio_start_pos >> PAGE_SHIFT,
-						 bufio_end_pos >> PAGE_SHIFT);
+			f2fs_flush_buffered_write(file->f_mapping,
+						  bufio_start_pos,
+						  bufio_end_pos);
 		}
 	} else {
 		/* iomap_dio_rw() already handled the generic_write_sync(). */
@@ -4717,8 +4725,22 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	inode_unlock(inode);
 out:
 	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
+
 	if (ret > 0 && may_need_sync)
 		ret = generic_write_sync(iocb, ret);
+
+	/* If buffered IO was forced, flush and drop the data from
+	 * the page cache to preserve O_DIRECT semantics
+	 */
+	if (ret > 0 && !dio && (iocb->ki_flags & IOCB_DIRECT)) {
+		struct file *file = iocb->ki_filp;
+		loff_t end_pos = orig_pos + ret - 1;
+
+		f2fs_flush_buffered_write(file->f_mapping,
+					  orig_pos,
+					  end_pos);
+	}
+
 	return ret;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
