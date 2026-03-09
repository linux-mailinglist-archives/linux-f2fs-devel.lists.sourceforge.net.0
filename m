Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCZlJcqFrmnKFgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 09:33:14 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 822AC23581F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 09:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UhxNHPhkysFN3HBDAChVeL4dzWDffz6taKZhv1WlR8o=; b=KnTSN5QD8+bEMNYAcNEpvNaus2
	+aP+6j5z8D/rFW7YlIR/cQB5h2VU3IMWU/DtxnOaFG426nePa2vStwKY+5TdHNwu21hguxbLBn+Gc
	ZEz6N56fPqt5pMdmD2tL5hD9UOOfmxLNtF20e7HVQxZP69Ebdss59BJS8hbxgyacjFbA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzW2y-0003Ky-NH;
	Mon, 09 Mar 2026 08:33:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rob_garcia@163.com>) id 1vzW2w-0003Kr-Vz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 08:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EEleLpm7u4mAEEE1CXuictIykzFh26/ppdcuLkRYW9Y=; b=kqQOMm1PK1lUYBiDEukcVpoQfs
 tMpeQtsUxFaJAiFKPj18oABoau7gh/Fj4jyek6a92rV961K7bAcyBOhEKHtcM3WlVmKLSrKqRMCHF
 lZw/WiiUVqTKRb71RBjbu6lLsInYBU1CND4lFQQbHUNVqg0SurFod+8D8WTyey+uB8Pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EEleLpm7u4mAEEE1CXuictIykzFh26/ppdcuLkRYW9Y=; b=Z
 BPE9F2FjXDo8joTeccDYvr/FdHz6OFD3vIjlx8X5BDMbzKGvot6aXGlD3wNKol8pyO6ofVcaR3G7g
 3JppCjWkJjtBAcrqAwYU1bZTUUzgp2qCoCN+qcZOaFho7osTsLBczf7sATHTwAbt92Ta0JO8NfwX1
 dAWcQpuqmE+/A2Ak=;
Received: from m16.mail.163.com ([117.135.210.4])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzW2v-0000ou-QB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 08:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EE
 leLpm7u4mAEEE1CXuictIykzFh26/ppdcuLkRYW9Y=; b=PndsVnYgaDdCqbjc9v
 VCYtZfVDcRbOT/mQaEgbvuJr5YR683jDmVh8yLYywxZ66g9k8J1IsM6b5g+UB7vG
 wzHMcFk7Q2APKogd7NUSPuOFy1EiPsjNVQyJe+FFKnH1NmfuFbu6JCyVMc1bKLCj
 99qlXDeCt9dm5eUTipGYFxrOA=
Received: from pek-lpg-core5.wrs.com (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wCnDnOcha5pR2wjRQ--.26049S2; 
 Mon, 09 Mar 2026 16:32:28 +0800 (CST)
From: Robert Garcia <rob_garcia@163.com>
To: stable@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Date: Mon,  9 Mar 2026 16:32:27 +0800
Message-Id: <20260309083227.3241109-1-rob_garcia@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wCnDnOcha5pR2wjRQ--.26049S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4ruw17KF1DuFWDKFW7urg_yoW5ZFy7pF
 1rCFn7Krsakr4xZ3WktF15CFyYy34vvF17GrZIga1vq3sxJF1FqFn0y3s0qF1xXryrAFWY
 qry7uryFgwn8Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UL_-PUUUUU=
X-Originating-IP: [60.247.85.88]
X-CM-SenderInfo: 5uresw5dufxti6rwjhhfrp/xtbDARyO+WmuhZwBRgAA3z
X-Spam-Score: 4.8 (++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu [ Upstream commit
 d625a2b08c089397d3a03bff13fa8645e4ec7a01
 ] It reports a bug from device w/ zufs: 
 Content analysis details:   (4.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 4.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [117.135.210.4 listed in dnsbl-1.uceprotect.net]
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [117.135.210.4 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rob_garcia(at)163.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vzW2v-0000ou-QB
Subject: [f2fs-dev] [PATCH 6.6.y] f2fs: fix to avoid migrating empty section
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
Cc: Robert Garcia <rob_garcia@163.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 822AC23581F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:chao@kernel.org,m:rob_garcia@163.com,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rob_garcia@163.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER(0.00)[rob_garcia@163.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,163.com:s=s110527];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[163.com,kernel.org,google.com,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,163.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: Chao Yu <chao@kernel.org>

[ Upstream commit d625a2b08c089397d3a03bff13fa8645e4ec7a01 ]

It reports a bug from device w/ zufs:

F2FS-fs (dm-64): Inconsistent segment (173822) type [1, 0] in SSA and SIT
F2FS-fs (dm-64): Stopped filesystem due to reason: 4

Thread A				Thread B
- f2fs_expand_inode_data
 - f2fs_allocate_pinning_section
  - f2fs_gc_range
   - do_garbage_collect w/ segno #x
					- writepage
					 - f2fs_allocate_data_block
					  - new_curseg
					   - allocate segno #x

The root cause is: fallocate on pinning file may race w/ block allocation
as above, result in do_garbage_collect() from fallocate() may migrate
segment which is just allocated by a log, the log will update segment type
in its in-memory structure, however GC will get segment type from on-disk
SSA block, once segment type changes by log, we can detect such
inconsistency, then shutdown filesystem.

In this case, on-disk SSA shows type of segno #173822 is 1 (SUM_TYPE_NODE),
however segno #173822 was just allocated as data type segment, so in-memory
SIT shows type of segno #173822 is 0 (SUM_TYPE_DATA).

Change as below to fix this issue:
- check whether current section is empty before gc
- add sanity checks on do_garbage_collect() to avoid any race case, result
in migrating segment used by log.
- btw, it fixes misc issue in printed logs: "SSA and SIT" -> "SIT and SSA".

Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
[ Use IS_CURSEC instead of is_cursec according to
commit c1cfc87e49525 ("f2fs: introduce is_cur{seg,sec}()"). ]
Signed-off-by: Robert Garcia <rob_garcia@163.com>
---
 fs/f2fs/gc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8122135bb1ff..816a5aa263e6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1742,6 +1742,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					GET_SUM_BLOCK(sbi, segno));
 		f2fs_put_page(sum_page, 0);
 
+		if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
+			f2fs_err(sbi, "%s: segment %u is used by log",
+							__func__, segno);
+			f2fs_bug_on(sbi, 1);
+			goto skip;
+		}
+
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
 		if (gc_type == BG_GC && __is_large_section(sbi) &&
@@ -1752,7 +1759,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		sum = page_address(sum_page);
 		if (type != GET_SUM_TYPE((&sum->footer))) {
-			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
+			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SIT and SSA",
 				 segno, type, GET_SUM_TYPE((&sum->footer)));
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			f2fs_stop_checkpoint(sbi, false,
@@ -2005,6 +2012,13 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
+		/*
+		 * avoid migrating empty section, as it can be allocated by
+		 * log in parallel.
+		 */
+		if (!get_valid_blocks(sbi, segno, true))
+			continue;
+
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
 						dry_run_sections == 0);
 		put_gc_inode(&gc_list);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
