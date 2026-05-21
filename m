Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBGKFU5gDmoD+QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 03:30:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 734AE59DAA5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 03:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMq58TMGyoGkLalMizL+mlGSOh8oSjoDJjYR/OedQC4=; b=StIeMELFbiU1iQEoWwOid1UQKX
	xhj/v+yadOECmXmnTjW56nQBZhVdhq0l1DvusR7RAz++AY8sUNXV4ASIjDKhjyVnpG0k9BodgW7Jv
	lyULybKHt0XJIvNLg3wlsNJtFFGc62ZFWxQbA/s9FRbp9dtq+blWDJqXppEKKm6hz02A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPsFA-00020a-Mn;
	Thu, 21 May 2026 01:30:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wPsEj-0001ya-06
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 01:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9YGt2++WFNyjiYBB6q9LeDg3jwsBN8tocw4HLbw/iTg=; b=lbAvsV2DD1YDycLIR6bOqFCcjr
 QiaGA4nB9RmDpWLDF//Zc+MTXPAVofPMSmAujcQRKZeGAzgiSwq60samxmsqafAokAYd+wXp0j1SP
 EyafWhZ3b8N+YjdQLa1JQBfwF0arGGMaqSSWw6DwiC2QIIzSLHRTv7nTUyHtFQ7EU75s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9YGt2++WFNyjiYBB6q9LeDg3jwsBN8tocw4HLbw/iTg=; b=n
 VANI2mzH54FGs1lJWcOENOjFXz4EkKL1P2r7KjkcY/4Cv1LP3fSG+V0hOvmXSFgJZfd+QLRw//HnJ
 lpUSkvZXR0OewdC/zD6/2dw14sNHDJ2JdzVe2DRsgZS4TFUvsKEQcFnu8t83iAOXiTnMz3Q3C3o+v
 ma5iJJ/nFciXMK4o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPsEg-0007tb-0O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 01:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CD67260098;
 Thu, 21 May 2026 01:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B43B1F000E9;
 Thu, 21 May 2026 01:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779326995;
 bh=9YGt2++WFNyjiYBB6q9LeDg3jwsBN8tocw4HLbw/iTg=;
 h=From:To:Cc:Subject:Date;
 b=QkdQbfCYlO/bvG4mu5ZWBNvBEjOor9KHPrHtvEoP48oPIMX7Ht6oRl0P/AhXid+vW
 dm4ng9kgIB2bjUNqHO/D1ysZ0JKh1s0s51uUd5fZYE19klL9B8A9xdRLjAUAsWu9+g
 NtFb8AIRuT59EYD+WooOVP/Lge2ik8AH90mdPww59yQMBSb9nqQT7eqzy3viizVbHy
 WpzGMZbW6exfPGhDjxF9Bmg99S8HEB23T8xLVeZRs8FV1zOt1mt6yc3JsJNVNWDWAu
 SmdrtYmcOjSald7/bt7+BFPfPBPjZxTx31XL8Qmdtcp+LvZ8jVAXNwqdoFXW/KsMx3
 JTS31FRNf58tA==
To: jaegeuk@kernel.org
Date: Thu, 21 May 2026 09:29:42 +0800
Message-ID: <20260521012942.1345592-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wPsEg-0007tb-0O
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: support to fix inconsistent
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:daehojeong@google.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCPT_COUNT_THREE(0.00)[3];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 734AE59DAA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v2:
- fix printed log
 fsck/f2fs.h | 13 ++++++++
 fsck/fsck.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

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
index 1230d7b..4fca4dd 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3012,6 +3012,97 @@ int check_sit_types(struct f2fs_sb_info *sbi)
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
+		unsigned short empty_data_seg = 0;
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
+				} else {
+					empty_data_seg++;
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
@@ -3834,6 +3925,9 @@ int fsck_verify(struct f2fs_sb_info *sbi)
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
