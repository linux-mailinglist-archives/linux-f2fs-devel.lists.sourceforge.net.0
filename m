Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KnfuDk1QMmr5yQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 09:44:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392F6973F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2026 09:44:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="d71+st/2";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=cOvdMN2a;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="e I6JrVM";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=jC1mWMtl;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VVsWVlIxm6JQC68OUn6nkh/M4EsfD7nRGbVcWUDcMa0=; b=d71+st/2Bh9aR2ytOsV9xytxlY
	2Ie4Oe9XF1Xd76rX1ZHPthRHXdYUNGgvBIDILLJHJzzQFs4Xg+Z0WUEdxUPM8w5dtrjh6n66UCWdj
	yFTbm5FpT8dm4xsCcq3B3HfQbbnOYgWTpJnLPVnhqSMv9ObhowX3Me/19l5h4xalFOwo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZkwN-0003eF-CT;
	Wed, 17 Jun 2026 07:44:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZkwM-0003e8-BQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 07:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MN6iMgjWTt+fzPWv3mvp50bOE+tz3W24wU6jiAdRIsg=; b=cOvdMN2aCRWyaaIWPJgDuGU2a0
 VKm0s//J4ZKQ9ldpQ/UyYGF235Sjk/CM7i14k9x1N1oEH2X5PVknLkmVKqoHdrP9gokfHrLpHlhfl
 Xbo9Hyy6rXth3kBev5HOuxXjgHJ1lxQqeSpsRm9uYdU8i777aWAhV6IaGNPrm39nBPeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MN6iMgjWTt+fzPWv3mvp50bOE+tz3W24wU6jiAdRIsg=; b=e
 I6JrVMGdLHJ10PUSnHrwFK3kKpxA43AvlnmgwrWPXIwaReTdUSly71mTyzdGRITtdClbrosiGxxOr
 P+H1ZMDHZYr3PNCLyrC6lw55+uOuMAyHQQI+ORUUMZSs64Q2jgmpntkiKVgPvHoirb91NOscfJ8YW
 tSHy0JfHAbHv2Aa0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZkwL-00067O-Vy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jun 2026 07:44:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 264A5402A6;
 Wed, 17 Jun 2026 07:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C8F1F000E9;
 Wed, 17 Jun 2026 07:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781682232;
 bh=MN6iMgjWTt+fzPWv3mvp50bOE+tz3W24wU6jiAdRIsg=;
 h=From:To:Cc:Subject:Date;
 b=jC1mWMtlRoiyFvu1xg2SMRnVokFr/HWGu36A2VKp1S/9/SuDn6eAWyzjrDN5T0voO
 tejuVulkKmDLzZGOqiseK7nmCuafR1FWu8V2Hfsh3Q4UFBoG90v6AzgthEdnz5UOJi
 uRKz3TEA79AuLuq4RT2UZj6Q9vZV5gS94Bow4XGEzsHqqCEf+km4a6hNapagBSEymi
 Skwq3+66f1xaNFq6+DPwWP4DLqiPRCoY9l50W+9Tv+aiLrtTiir/McWYSn0ANS2VAM
 HqB82yXANiapXiNDIvDt9ftgWweuUqmIIcxbWteZgD6NmiJHNMl1rrkclrtbCDBaNM
 yE+DvW2CoSS2Q==
To: jaegeuk@kernel.org
Date: Wed, 17 Jun 2026 07:43:39 +0000
Message-ID: <20260617074339.103640-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fsck.f2fs -d1 <device> [fix_section_type:3036] wrong
 sit->type
 (4) in DATA secno:1 segno:2 [fix_section_type:3036] wrong sit->type (4) in
 DATA secno:5 segno:11 fsck.f2fs -f <device> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZkwL-00067O-Vy
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: support to fix inconsistent
 sit->type of segments in large section
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:daehojeong@google.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.30.29.66:received];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7392F6973F7

fsck.f2fs -d1 <device>

[fix_section_type:3036] wrong sit->type (4) in DATA secno:1 segno:2
[fix_section_type:3036] wrong sit->type (4) in DATA secno:5 segno:11

fsck.f2fs -f <device>

[FIX] (fix_section_type:3040)  --> Fix wrong sit->type (4 -> 2) in DATA secno (1), segno (2)
[FIX] (fix_section_type:3050)  --> Fix wrong sit->type in DATA secno (1), totally 1 empty segment(s)
[FIX] (fix_section_type:3040)  --> Fix wrong sit->type (4 -> 2) in DATA secno (5), segno (11)
[FIX] (fix_section_type:3050)  --> Fix wrong sit->type in DATA secno (5), totally 1 empty segment(s)

Now it can only fix wrong sit->type of segment from NODE to DATA in a DATA
section, such inconsistent image can be generated by recovery.

For fuzzed image which contains below inconsistent sit->type, we can support
to detect and repair later:
1) empty NODE segment in DATA section (FIXED w/ current patch)
2) empty DATA segment in NODE section
3) valid segments w/ different temperature in DATA section
4) valid segments w/ different temperature in NODE section
5) valid segments w/ different sit->type in section

Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- remove unused empty_data_seg to avoid compile warning
 fsck/f2fs.h | 13 ++++++++
 fsck/fsck.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 5e7eb63..e4e5d0c 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -572,6 +572,19 @@ static inline int IS_CUR_SEGNO(struct f2fs_sb_info *sbi, u32 segno)
 	return 0;
 }
 
+static inline int IS_CUR_SECNO(struct f2fs_sb_info *sbi, u32 secno)
+{
+	int i;
+
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		struct curseg_info *curseg = CURSEG_I(sbi, i);
+
+		if (secno == GET_SEC_FROM_SEG(sbi, curseg->segno))
+			return 1;
+	}
+	return 0;
+}
+
 static inline u64 BLKOFF_FROM_MAIN(struct f2fs_sb_info *sbi, u64 blk_addr)
 {
 	ASSERT(blk_addr >= SM_I(sbi)->main_blkaddr);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 1230d7b..4ad7e33 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3012,6 +3012,94 @@ int check_sit_types(struct f2fs_sb_info *sbi)
 	}
 	return err;
 }
+enum type_fix   {
+	TYPE_DATA,		/* fix sit->type of empty node segment to data */
+	TYPE_NODE,		/* fix sit->type of empty data segment to node */
+	TYPE_DATA_TEMP,		/* fix inconsistent sit->type temperature of data segment */
+	TYPE_NODE_TEMP,		/* fix inconsistent sit->type temperature of node segment */
+	TYPE_MIGRATE,		/* migrate node segments in mixed section */
+};
+static bool fix_section_type(struct f2fs_sb_info *sbi, unsigned int secno,
+				unsigned char type, enum type_fix type_fix)
+{
+	unsigned int segno = secno * sbi->segs_per_sec;
+	unsigned int end_segno = segno + sbi->segs_per_sec;
+	unsigned int empty = 0;
+	bool fixed = false;
+
+	for (; segno < end_segno; segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, segno);
+
+		if (type_fix == TYPE_DATA) {
+			if (se->valid_blocks)
+				continue;
+			DBG(1, "wrong sit->type (%d) in DATA secno:%d segno:%d\n",
+				se->type, secno, segno);
+			if (!c.fix_on)
+				continue;
+			FIX_MSG("Fix wrong sit->type (%d -> %d) in DATA secno (%u), segno (%d)",
+				se->type, type, secno, segno);
+			se->type = type;
+			empty++;
+			fixed = true;
+			continue;
+		}
+	}
+
+	if (fixed && type_fix == TYPE_DATA)
+		FIX_MSG("Fix wrong sit->type in DATA secno (%u), totally %d empty segment(s)",
+			secno, empty);
+
+	return fixed;
+}
+
+static bool check_large_section_types(struct f2fs_sb_info *sbi)
+{
+	unsigned int secno;
+	bool fixed = false;
+
+	if (sbi->segs_per_sec <= 1)
+		return 0;
+
+	for (secno = 0; secno < sbi->total_sections; secno++) {
+		struct seg_entry *se;
+		unsigned int segno = secno * sbi->segs_per_sec;
+		unsigned int end_segno = segno + sbi->segs_per_sec;
+		unsigned short data_seg = 0;
+		unsigned short node_seg = 0;
+		unsigned short empty_node_seg = 0;
+		unsigned char data_type = NO_CHECK_TYPE;
+
+		if (IS_CUR_SECNO(sbi, secno))
+			continue;
+
+		for (; segno < end_segno; segno++) {
+			se = get_seg_entry(sbi, segno);
+			if (IS_DATASEG(se->type)) {
+				if (se->valid_blocks) {
+					data_seg++;
+					data_type = se->type;
+				}
+			} else {
+				if (se->valid_blocks)
+					node_seg++;
+				else
+					empty_node_seg++;
+			}
+		}
+
+		/* skip free section */
+		if (!data_seg && !node_seg)
+			continue;
+
+		/* data section, fix sit->type of empty node segment to data */
+		if (data_seg && !node_seg && empty_node_seg) {
+			if (fix_section_type(sbi, secno, data_type, TYPE_DATA))
+				fixed = true;
+		}
+	}
+	return fixed;
+}
 
 static struct f2fs_node *fsck_get_lpf(struct f2fs_sb_info *sbi)
 {
@@ -3834,6 +3922,9 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	if (check_sit_types(sbi) != 0)
 		force = 1;
 
+	if (check_large_section_types(sbi))
+		force = 1;
+
 	printf("[FSCK] other corrupted bugs                          ");
 	if (c.bug_on == 0) {
 		printf(" [Ok..]\n");
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
