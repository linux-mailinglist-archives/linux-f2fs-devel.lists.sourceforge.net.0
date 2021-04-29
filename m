Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C036E51D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Apr 2021 08:51:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lc0W0-0004tG-DR; Thu, 29 Apr 2021 06:51:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daejun7.park@samsung.com>) id 1lc0Vz-0004t4-B0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Apr 2021 06:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tlw0avSX2wOoEZ1KYfcEj/kTJmF/Mffz5DkEvg1IGFQ=; b=nE2BP0uSHg2vOHml0CMLXCH1jS
 Ldmys5MIXPFp8osWDEJXqSMAwOD55IjvC1ue/ZYsZenRaMOxXm6uuDhCdnkNXkQZB0gzcFHDhfmP2
 rqj58m8zbypQqDNTneMoLmfJGqQEI54vTwl+mw/IKqASP3LvAWam6DPyfOZxW7JOMchQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tlw0avSX2wOoEZ1KYfcEj/kTJmF/Mffz5DkEvg1IGFQ=; b=A
 4ELXZw16z1K5y3G7O1CPcnsBgzBZ22Gmq4nS04fC1cnI3dZfaC9+dIZY3OsmzqyocCIcD+nB2fi00
 1VzfNlppi7c5S9Goc47UKBaRppHA3SAGkxDbwMXjifL8WhTUqOejhCh7hI0behESzQ1uI4Lb7RGIy
 0RFbeEb6ih6fKzRY=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lc0Vp-0002M9-By
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Apr 2021 06:51:11 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210429065051epoutp02bffa799237d61cd6b5e523235284b4b0~6QYQiiONV1557915579epoutp02H
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Apr 2021 06:50:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210429065051epoutp02bffa799237d61cd6b5e523235284b4b0~6QYQiiONV1557915579epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619679051;
 bh=tlw0avSX2wOoEZ1KYfcEj/kTJmF/Mffz5DkEvg1IGFQ=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=EY6ZkIOqlC+9QEA4lhu0CbhrfiC+xePsp7uxmplPv0a3cau3NYsfA91uplRFp6L/K
 lD1P+va+TcvSeaJhXUzdk6o915GTEpJXJEpq8bDcs10hX1ObcHUUnJlnbWHZbqydkx
 Pl2rpaksEoRD0lX0Z32B2yJ105DgA9cIqNYEqPXE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20210429065048epcas2p28806dc6a3ffe0af4cd9b2c924ca329c0~6QYNZqFOw2841528415epcas2p2j;
 Thu, 29 Apr 2021 06:50:48 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.185]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4FW5jz1Ft4z4x9Pw; Thu, 29 Apr
 2021 06:50:47 +0000 (GMT)
X-AuditID: b6c32a46-e01ff700000025de-a1-608a5744395d
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A0.DC.09694.4475A806; Thu, 29 Apr 2021 15:50:44 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Chao Yu <yuchao0@huawei.com>,
 Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20210429065038epcms2p538390e44af97feae43437fb97aa0759e@epcms2p5>
Date: Thu, 29 Apr 2021 15:50:38 +0900
X-CMS-MailID: 20210429065038epcms2p538390e44af97feae43437fb97aa0759e
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTQtclvCvB4Od5VYvTU88yWbw8pGmx
 6kG4xZP1s5gtLi1yt7i8aw6bxdTHa1kd2D1ajrxl9di0qpPNY/eCz0wefVtWMXp83iQXwBqV
 Y5ORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdIOSQlli
 TilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8DQsECvODG3uDQvXS85P9fK0MDAyBSoMiEn
 Y/3WzWwFB40q5r/YzNrAeFmzi5GTQ0LARKJn+R+mLkYuDiGBHYwSt2fOYO5i5ODgFRCU+LtD
 GKRGWMBC4kz7WiYQW0hASWL9xVnsEHE9iVsP1zCC2GwCOhLTT9xnB5kjIrCJSWLJks3MEAt4
 JWa0P2WBsKUlti/fyghha0j8WNYLVSMqcXP1W3YY+/2x+VA1IhKt985C1QhKPPi5GyouKXFs
 9wcmCLteYuudX4wgiyUEehglDu+8xQqR0Je41rERbDGvgK/Eytn/wRpYBFQlzu+/C7XMRWLh
 yh1gQ5kF5CW2v50D9jyzgKbE+l36IKaEgLLEkVssMK80bPzNjs5mFuCT6Dj8Fy6+Y94TqNPU
 JNb9XM8EMUZG4tY8qOs9JNbNes84gVFxFiKgZyE5YRbCCQsYmVcxiqUWFOempxYbFRghx+0m
 RnBy1HLbwTjl7Qe9Q4xMHIyHGCU4mJVEeH+v60wQ4k1JrKxKLcqPLyrNSS0+xGgK9PxEZinR
 5Hxges4riTc0NTIzM7A0tTA1M7JQEuf9mVqXICSQnliSmp2aWpBaBNPHxMEp1cB0ViSm279a
 4Eilmn5lMKOyaYe/j379dTEbG6OyQNFXPwuOzdHcf+9479ms5e1bPwQ9ZQjYq/hbb4LR15Rj
 mg9m/N3YqX85V5996xYGbvvAzL5Uj2Mqb251tpdXl5S1i8Tsaa08MXWfvFXRwYcT139yO/v5
 xK/6mPmd13tYmv9Pe3VP9ujcrNpmt5rNrFK2PzT36xUe3Bx7b3rY9i/CKrGnFnyQKzr9+JPr
 bae4iV+Yo7emTHebuernmQVtSzgO1jD5heg7+2rO2XTVdoK0tO+tkL43l+f236lqdFj8etlN
 859TpjL4sFZPte4N+bvm795gvZwT1q0J+31bm0Kflb99crrR97NUou+T5A3XPd8osRRnJBpq
 MRcVJwIAzfgARxcEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210429065038epcms2p538390e44af97feae43437fb97aa0759e
References: <CGME20210429065038epcms2p538390e44af97feae43437fb97aa0759e@epcms2p5>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lc0Vp-0002M9-By
Subject: [f2fs-dev] [PATCH] f2fs: refactoring nat and sit functions
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
Reply-To: daejun7.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch separates the APIs for nat and sit.

f2fs_lookup_journal_in_cursum -> f2fs_lookup_journal_{nats|sits}_in_cursum
__has_cursum_space -> __has_{nats|sits}_in_cursum_space

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/f2fs.h    | 16 +++++++++++-----
 fs/f2fs/node.c    | 11 +++++------
 fs/f2fs/segment.c | 46 +++++++++++++++++++++++++++-------------------
 3 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b9d5317db0a7..e264fedacc9e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -416,11 +416,15 @@ static inline int update_sits_in_cursum(struct f2fs_journal *journal, int i)
 	return before;
 }
 
-static inline bool __has_cursum_space(struct f2fs_journal *journal,
-							int size, int type)
+static inline bool __has_nats_in_cursum_space(struct f2fs_journal *journal,
+					      int size)
+{
+	return size <= MAX_NAT_JENTRIES(journal);
+}
+
+static inline bool __has_sits_in_cursum_space(struct f2fs_journal *journal,
+					      int size)
 {
-	if (type == NAT_JOURNAL)
-		return size <= MAX_NAT_JENTRIES(journal);
 	return size <= MAX_SIT_JENTRIES(journal);
 }
 
@@ -3420,7 +3424,9 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 								block_t len);
 void f2fs_write_data_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
-int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
+int f2fs_lookup_journal_sits_in_cursum(struct f2fs_journal *journal,
+			unsigned int val, int alloc);
+int f2fs_lookup_journal_nats_in_cursum(struct f2fs_journal *journal,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e67ce5f13b98..cb295eb8ed91 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -554,7 +554,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 
 	/* Check current segment summary */
 	down_read(&curseg->journal_rwsem);
-	i = f2fs_lookup_journal_in_cursum(journal, NAT_JOURNAL, nid, 0);
+	i = f2fs_lookup_journal_nats_in_cursum(journal, nid, 0);
 	if (i >= 0) {
 		ne = nat_in_journal(journal, i);
 		node_info_from_raw_nat(ni, &ne);
@@ -2891,7 +2891,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	 * #2, flush nat entries to nat page.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal, set->entry_cnt, NAT_JOURNAL))
+		!__has_nats_in_cursum_space(journal, set->entry_cnt))
 		to_journal = false;
 
 	if (to_journal) {
@@ -2914,8 +2914,8 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 		f2fs_bug_on(sbi, nat_get_blkaddr(ne) == NEW_ADDR);
 
 		if (to_journal) {
-			offset = f2fs_lookup_journal_in_cursum(journal,
-							NAT_JOURNAL, nid, 1);
+			offset = f2fs_lookup_journal_nats_in_cursum(journal,
+							nid, 1);
 			f2fs_bug_on(sbi, offset < 0);
 			raw_ne = &nat_in_journal(journal, offset);
 			nid_in_journal(journal, offset) = cpu_to_le32(nid);
@@ -2985,8 +2985,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * into nat entry set.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal,
-			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
+		!__has_nats_in_cursum_space(journal, nm_i->nat_cnt[DIRTY_NAT]))
 		remove_nats_in_journal(sbi);
 
 	while ((found = __gang_lookup_nat_set(nm_i,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index efac388d2468..63bfbc2603ae 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4013,25 +4013,33 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk)
 	write_normal_summaries(sbi, start_blk, CURSEG_HOT_NODE);
 }
 
-int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
+int f2fs_lookup_journal_nats_in_cursum(struct f2fs_journal *journal,
 					unsigned int val, int alloc)
 {
 	int i;
 
-	if (type == NAT_JOURNAL) {
-		for (i = 0; i < nats_in_cursum(journal); i++) {
-			if (le32_to_cpu(nid_in_journal(journal, i)) == val)
-				return i;
-		}
-		if (alloc && __has_cursum_space(journal, 1, NAT_JOURNAL))
-			return update_nats_in_cursum(journal, 1);
-	} else if (type == SIT_JOURNAL) {
-		for (i = 0; i < sits_in_cursum(journal); i++)
-			if (le32_to_cpu(segno_in_journal(journal, i)) == val)
-				return i;
-		if (alloc && __has_cursum_space(journal, 1, SIT_JOURNAL))
-			return update_sits_in_cursum(journal, 1);
-	}
+	for (i = 0; i < nats_in_cursum(journal); i++)
+		if (le32_to_cpu(nid_in_journal(journal, i)) == val)
+			return i;
+
+	if (alloc && __has_nats_in_cursum_space(journal, 1))
+		return update_nats_in_cursum(journal, 1);
+
+	return -1;
+}
+
+int f2fs_lookup_journal_sits_in_cursum(struct f2fs_journal *journal,
+					unsigned int val, int alloc)
+{
+	int i;
+
+	for (i = 0; i < sits_in_cursum(journal); i++)
+		if (le32_to_cpu(segno_in_journal(journal, i)) == val)
+			return i;
+
+	if (alloc && __has_sits_in_cursum_space(journal, 1))
+		return update_sits_in_cursum(journal, 1);
+
 	return -1;
 }
 
@@ -4174,7 +4182,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * entries, remove all entries from journal and add and account
 	 * them in sit entry set.
 	 */
-	if (!__has_cursum_space(journal, sit_i->dirty_sentries, SIT_JOURNAL) ||
+	if (!__has_sits_in_cursum_space(journal, sit_i->dirty_sentries) ||
 								!to_journal)
 		remove_sits_in_journal(sbi);
 
@@ -4192,7 +4200,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		unsigned int segno = start_segno;
 
 		if (to_journal &&
-			!__has_cursum_space(journal, ses->entry_cnt, SIT_JOURNAL))
+			!__has_sits_in_cursum_space(journal, ses->entry_cnt))
 			to_journal = false;
 
 		if (to_journal) {
@@ -4220,8 +4228,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			}
 
 			if (to_journal) {
-				offset = f2fs_lookup_journal_in_cursum(journal,
-							SIT_JOURNAL, segno, 1);
+				offset = f2fs_lookup_journal_sits_in_cursum(
+						journal, segno, 1);
 				f2fs_bug_on(sbi, offset < 0);
 				segno_in_journal(journal, offset) =
 							cpu_to_le32(segno);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
