Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rUWyNt5Ex2nbUwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2026 04:02:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C834D202
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2026 04:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pxAsWha+kzOFb987cHFe+DM02x7OXiTq1SyJESmqFHs=; b=csO2fZ6WykxtHiYZuupXLUgIpk
	xlBcITosERH7vYJq3kC8kdjaNFIlFi5sKWjtN1z1FzWpDGmSp4LUCKfLrIHbslvV3RRC0OGYtwpLT
	M3Bi4vLJm225CZyA22X2FIPmrwwyYbAw7fp6HmAnw7CuvrpwMushgJdra9BxiJZefaik=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w6Jwi-0001UD-JN;
	Sat, 28 Mar 2026 03:02:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w6Jwh-0001Tz-Hw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Mar 2026 03:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kqg3HWhMD8HFZWTVXBjQHXM8Qkp6mrgaRsKx6u9e/SY=; b=ZkfRscIuRzwv9wuStr2tc/x1DY
 Vt4eTV5pEOwh3feisJJHQ1IqUuKImeIS2myf968fRomLS4gl/AElBmFrOgtmnPaVs5BWJePCI2HbC
 kizT5OVItkJP5s6nJChDCt+lo0yIciCsXsOFP3V38Rk1udwmlqbwDxX0XfbidcrRSpe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Kqg3HWhMD8HFZWTVXBjQHXM8Qkp6mrgaRsKx6u9e/SY=; b=D
 tsRiHPTfHMBMzgkKkX7zwz7c/1cgp+3X4erBA3q3AfhiWFWTCusapOKUmBGSMeJTW5Vi6Pve87+5g
 XLytOO9RRsFPJY/FxhMfdwjL6MTdrWeGqXx5TEirUxVBlMh3CLJeMlrZjw/uAoqnuo6F93Re34BmU
 lsoXd9KBTspR8bmE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w6Jwh-0005FQ-KY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Mar 2026 03:02:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B45BF600AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Mar 2026 03:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37E9C19423;
 Sat, 28 Mar 2026 03:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774666952;
 bh=NNfyDgdLMeqBdm5/FBCvD9hxYkPQGpgeyMqv91Qssgw=;
 h=From:To:Cc:Subject:Date:From;
 b=pyl/MxvOBm8qyg3OUC+Y7PWTlKNe5sgQbOsKvqrQQRCbkqWZRcvrwswXCy2RgIYN0
 +3kZ1rkPf6mPrq8MnZN83QOaqf7c15qLv94m1ZjjjoY9zp6oGSZLFeh3JzGZPHZnJk
 E2AoT+EkwY9cXKqaLute0X/SATAvRhbY7F9WnLWd1GbeAZtLEP1PnUU7IRPHp38jie
 5rPkIT5NQXmOzdn0yK7A/YwgyWC2Z8IT91XXg+93yq489hajv1vqZAobW8EraXoXg0
 bDUMhdBp6PJkWyqMwvJ4wKwAOSB/wH6J1GldbPdXdC5FJvzSHqp7fFAVWX+xl1kwQx
 WYRbzvhUWzoaQ==
To: jaegeuk@kernel.org
Date: Sat, 28 Mar 2026 03:02:13 +0000
Message-ID: <20260328030213.2618065-1-chao@kernel.org>
X-Mailer: git-send-email 2.53.0.1118.gaef5881109-goog
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [ 16.609296][ T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)
 --> segno [0x222c] indicates a data segment, but should be node [ 16.609300][
 T423] fsck.f2fs: [ASSERT] (get_sum_block:2422) --> segno [0x2 [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HEXHASH_WORD           Multiple instances of word + hexadecimal hash
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w6Jwh-0005FQ-KY
Subject: [f2fs-dev] [PATCH] fsck.f2fs: add a sanity check in
 update_data_blkaddr()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 200C834D202
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[   16.609296][  T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)  --> segno [0x222c] indicates a data segment, but should be node
[   16.609300][  T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)  --> segno [0x222c] indicates a data segment, but should be node
[   16.609318][  T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)  --> segno [0x222c] indicates a data segment, but should be node
[   16.609323][  T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)  --> segno [0x222c] indicates a data segment, but should be node
[   16.609329][  T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)  --> segno [0x222c] indicates a data segment, but should be node
[   16.609332][  T423] fsck.f2fs: [ASSERT] (get_sum_block:2422)  --> segno [0x222c] indicates a data segment, but should be node

[   16.706176][  T574] DEBUG: Executable: /system/bin/fsck.f2fs
[   16.706347][  T574] DEBUG: Cmdline: /system/bin/fsck.f2fs -a -c 10000 --debug-cache --nolinear-lookup=1 /dev/block/mapper/userdata
[   16.706519][  T574] DEBUG: pid: 531, ppid: 423, tid: 531, name: fsck.f2fs  >>> /system/bin/fsck.f2fs <<<
[   16.706687][  T574] DEBUG: uid: 0
[   16.706861][  T574] DEBUG: tagged_addr_ctrl: 0000000000000001 (PR_TAGGED_ADDR_ENABLE)
[   16.707035][  T574] DEBUG: pac_enabled_keys: 000000000000000f (PR_PAC_APIAKEY, PR_PAC_APIBKEY, PR_PAC_APDAKEY, PR_PAC_APDBKEY)
[   16.707360][  T574] DEBUG: esr: 0000000092000007 (Data Abort Exception 0x24)
[   16.707520][  T574] DEBUG: signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr 0x0000007fe0d0afd0 (read)
[   16.707674][  T574] DEBUG: Cause: stack pointer is in a non-existent map; likely due to stack overflow.
[   16.707832][  T574] DEBUG:     x0  00000056d9adcc08  x1  0000007fe0d0c0b8  x2  0000000000000000  x3  0000000000000001
[   16.707987][  T574] DEBUG:     x4  0000000000000000  x5  00000056d9ad4000  x6  00000056d9adc000  x7  00000056d9adc000
[   16.708141][  T574] DEBUG:     x8  0000000000000040  x9  0000000000000001  x10 0000000000001000  x11 0000007fe0d0afd0
[   16.708296][  T574] DEBUG:     x12 0000000000001000  x13 0000000000000009  x14 000000000008c015  x15 00000000000004bc
[   16.708564][  T574] DEBUG:     x16 b400007b0e7ea780  x17 b4000078fa60e870  x18 0000007b0ea08000  x19 00000000004d184c
[   16.708741][  T574] DEBUG:     x20 00000056d9adcc08  x21 0000007fe0d0bfd0  x22 0000007fe0d0afd0  x23 00000056d9ad4954
[   16.708914][  T574] DEBUG:     x24 0000000000000001  x25 b400007a6a60b9d0  x26 0000000000000037  x27 0000000000000001
[   16.709108][  T574] DEBUG:     x28 0000000000000000  x29 0000007fe0d0c050
[   16.709262][  T574] DEBUG:     lr  005b0fd6d9aba138  sp  0000007fe0d0afd0  pc  00000056d9aaf8a0  pst 0000000060001000
[   16.709416][  T574] DEBUG:     esr 0000000092000007  vg  0000000000000002
[   16.709571][  T574] DEBUG: 512 total frames
[   16.709723][  T574] DEBUG: backtrace:
[   16.710133][  T574] DEBUG:       #00 pc 000000000002f8a0  /system/bin/fsck.f2fs (find_next_free_block+192) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.710482][  T574] DEBUG:       #01 pc 000000000003a134  /system/bin/fsck.f2fs (update_block+276) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.710695][  T574] DEBUG:       #02 pc 000000000002e5e8  /system/bin/fsck.f2fs (update_data_blkaddr+296) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.710875][  T574] DEBUG:       #03 pc 000000000003a250  /system/bin/fsck.f2fs (update_block+560) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)

... (loop)

[   16.806359][  T574] DEBUG:       #505 pc 000000000003a250  /system/bin/fsck.f2fs (update_block+560) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.806544][  T574] DEBUG:       #506 pc 000000000002e5e8  /system/bin/fsck.f2fs (update_data_blkaddr+296) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.806730][  T574] DEBUG:       #507 pc 000000000003a250  /system/bin/fsck.f2fs (update_block+560) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.806915][  T574] DEBUG:       #508 pc 000000000002e5e8  /system/bin/fsck.f2fs (update_data_blkaddr+296) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.807101][  T574] DEBUG:       #509 pc 000000000003a250  /system/bin/fsck.f2fs (update_block+560) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.807293][  T574] DEBUG:       #510 pc 000000000002e5e8  /system/bin/fsck.f2fs (update_data_blkaddr+296) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.807478][  T574] DEBUG:       #511 pc 000000000003a250  /system/bin/fsck.f2fs (update_block+560) (BuildId: e2a4d8d81fcb93e518e8bc64f8df050d)
[   16.807665][  T574] DEBUG: Note: To display stack pointer information, use the pbtombstone tool:

If there is inconsistent status in between SIT and node segment:
1. SIT indicate the segment is data type
2. a node block locates in the segment

It will cause deadloop w/ below patern:

a) fsck call update_block() to update the node block to a newly allocated
blkaddr, however it finds the node is in data segment, so it treat the node
block as data block, then calling update_data_blkaddr() to update it to a
new blkaddr.
b) in update_data_blkaddr(), because node_blk is NULL, so it treats the
newaddr as block address of data block, then calling update_block() to
update metadata of target data block.

This patch adds a sanity check in update_data_blkaddr() to detect such
inconsistency and end up w/ log and ASSERT().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 9b353e3..2f4e6c9 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2515,6 +2515,8 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	int ret;
 
 	if (node_blk == NULL) {
+		struct seg_entry *se;
+
 		node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 		ASSERT(node_blk);
 
@@ -2524,6 +2526,13 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 		ret = dev_read_block(node_blk, ni.blk_addr);
 		ASSERT(ret >= 0);
 		node_blk_alloced = true;
+
+		se = get_seg_entry(sbi, GET_SEGNO(sbi, ni.blk_addr));
+		if (IS_DATASEG(se->type)) {
+			ERR_MSG("NAT and SIT is inconsistent: ino: %u, nid: %u, blkaddr: %u, segtype: %d",
+				ni.ino, ni.nid, ni.blk_addr, se->type);
+			ASSERT(0);
+		}
 	}
 
 	/* check its block address */
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
