Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E342787FC3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 08:23:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZQEU-0007Rx-Mt;
	Fri, 25 Aug 2023 06:23:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=76011e4a25=lizhi.xu@windriver.com>)
 id 1qZQET-0007Rq-5Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 06:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0kBRV+hwLL8nmN1CEnpsNCRXsICS7stE9OWDLrPCRU=; b=l88HIdYf3C0yXYIAogsUxeu/6j
 QvHrhsWWjH6wP2SgSssfgDQX0L+y9Z5LuxnO+YhzkDcEdAcdUItcXOqZUfkwyTQhVPCipvmaB8Gze
 jBDeXHhe0f5sP+n8oN7JOYYFHo1vI2oiumALbsn3heoqqbOTVzy/3YbLwzSCP7y7/WGE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W0kBRV+hwLL8nmN1CEnpsNCRXsICS7stE9OWDLrPCRU=; b=abUOLG9SiZVjLN1a0W36SUBnZs
 I3gk1UjSJWa9GUOkjWhQ3BunsaKPRRqNK+s2BsDqZq/wyZ95ihEtxvJ9d2s7SdouOUfhsgsxayVp6
 GyvMepueDBrCf0fG12eUIm2jOQF1J55vJYaTMQGWVt3fxUrcGHT/5DgVu0RCYsTac+ls=;
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZQER-00ExDP-Rv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 06:23:45 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37P4ffNE008796; Thu, 24 Aug 2023 22:37:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 PPS06212021; bh=W0kBRV+hwLL8nmN1CEnpsNCRXsICS7stE9OWDLrPCRU=; b=
 UMlCtlKzF/EgFobXYXcjexr4g3Kg9Qr/b7XC1UoNXzSJ2yEz8aVbazqEW1q9dNLr
 FChA3jOSg45LcZqcsT2kC5zltsV9SzYhuIS7BM5QlbkkUvyFxQbaQilncMPpcgQ/
 Qu7Zl1/yM+GpAuRlB4gm28FTl/9IH+RE1KsV+J4sb4jap0S7rNQk61iniy/KBPgC
 CUXvp03lY7fYNlgofl0ivRT1JF/Ym36gUGJkuAVsbPVUIJnRKWomXz0tbEJlEsKL
 dxVth7vSm4VQqlPcJyVvBf/kD4Z7IeTHx3GPnk/I0acNMKc2K00gqoaa2hFloLkf
 yFsjQ1hZta/1CAF5oaok8A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com
 [147.11.82.252])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20djumm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 24 Aug 2023 22:37:35 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 22:37:34 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 22:37:32 -0700
To: <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
Date: Fri, 25 Aug 2023 13:37:32 +0800
Message-ID: <20230825053732.3098387-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0000000000000f188605ffdd9cf8@google.com>
References: <0000000000000f188605ffdd9cf8@google.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: y5N4ZYVp_oaQ2GeQlb1tYlS30VuFONJi
X-Proofpoint-GUID: y5N4ZYVp_oaQ2GeQlb1tYlS30VuFONJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_04,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 mlxlogscore=411 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2308250047
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There are two paths: 1.
 f2fs_add_dentry->f2fs_down_read->f2fs_add_inline_entry->down_write->
 up_write->f2fs_up_read 2.
 f2fs_add_dentry->f2fs_add_regular_entry->down_write->
 f2fs_init_inode_metadata->f [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.220.166.238 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.220.166.238 listed in wl.mailspike.net]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qZQER-00ExDP-Rv
Subject: [f2fs-dev] [PATCH] f2fs: fix deadlock in f2f2_add_dentry
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
From: Lizhi Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are two paths:
1. f2fs_add_dentry->f2fs_down_read->f2fs_add_inline_entry->down_write->
   up_write->f2fs_up_read
2. f2fs_add_dentry->f2fs_add_regular_entry->down_write->
   f2fs_init_inode_metadata->f2fs_down_read->f2fs_up_read->up_write

Force order lock to read->write.

Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
Reported-and-tested-by: syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com
---
 fs/f2fs/dir.c    | 4 +---
 fs/f2fs/inline.c | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d635c58cf5a3..022dc02c1390 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -736,12 +736,12 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	f2fs_wait_on_page_writeback(dentry_page, DATA, true, true);
 
 	if (inode) {
-		f2fs_down_write(&F2FS_I(inode)->i_sem);
 		page = f2fs_init_inode_metadata(inode, dir, fname, NULL);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
 			goto fail;
 		}
+		f2fs_down_write(&F2FS_I(inode)->i_sem);
 	}
 
 	make_dentry_ptr_block(NULL, &d, dentry_blk);
@@ -780,9 +780,7 @@ int f2fs_add_dentry(struct inode *dir, const struct f2fs_filename *fname,
 		 * Should get i_xattr_sem to keep the lock order:
 		 * i_xattr_sem -> inode_page lock used by f2fs_setxattr.
 		 */
-		f2fs_down_read(&F2FS_I(dir)->i_xattr_sem);
 		err = f2fs_add_inline_entry(dir, fname, inode, ino, mode);
-		f2fs_up_read(&F2FS_I(dir)->i_xattr_sem);
 	}
 	if (err == -EAGAIN)
 		err = f2fs_add_regular_entry(dir, fname, inode, ino, mode);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4638fee16a91..7618b383c2b7 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -628,10 +628,12 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
 
+	f2fs_down_read(&F2FS_I(dir)->i_xattr_sem);
 	inline_dentry = inline_data_addr(dir, ipage);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
+	f2fs_up_read(&F2FS_I(dir)->i_xattr_sem);
 	if (bit_pos >= d.max) {
 		err = do_convert_inline_dir(dir, ipage, inline_dentry);
 		if (err)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
