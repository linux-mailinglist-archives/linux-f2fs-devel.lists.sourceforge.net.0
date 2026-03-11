Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JylC60psWkBrgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 09:37:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3FA25F714
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 09:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gLRnZf+Vo8G3Im/iFHZrdozAVmXp3vklCCQo1kKOyFg=; b=Eh0i9DKVOCCixLZCJThhTOHH0k
	e/TTIuVAz46P486y/1LDn6ts7iTKvBAt9brkxdrtadanorMxfeFZQJvJWLPNHO/MvALZt+PtpXUe9
	I7xOp9kQQaLwdX+mXC+rCZxAEngBEmU9H/uoIx0x0JgTe0ac8N0z22YvJZzKdUmqNDd8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0F3e-0007G2-TA;
	Wed, 11 Mar 2026 08:36:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1w0F3X-0007Fp-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 08:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b8h94gxFhQ/kZpyb+oeX4dbR1vvUq7gmbCUoXoPHwNo=; b=hqroyATRdavmzQ8ldxzK6fGB5j
 TKGsyrAw8jHFCsKLpvvljBHNjUkw/STyoYrjIh0gLydmmdGORg/1NJBHtVvBLlgW27DwT33ZzrBJV
 arWCMiqSaOVW0rubsIe/Q92EkV2B5dpb+CTbES72bPpUXhoqDvzevh3iNRd7RQ1d39f4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b8h94gxFhQ/kZpyb+oeX4dbR1vvUq7gmbCUoXoPHwNo=; b=h
 zbfkPmfPJyzTTq71WcOBDRUJ10sJYzU84aZtZ+a/kOEBm52DUyOyKe9rBuVFF+L6Xsvazl9rOKmmI
 Ozno01ciPmGIAsJOX6V0w4kESRtEbdlg9j+wnWAUm3H0LYLvbKh+sVz0STXTn1m9LjPXbY8soBgrF
 owa6uArKJKCe/g3E=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0F3X-0004dH-LA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 08:36:39 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-829a27414a3so2936545b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773218194; x=1773822994; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b8h94gxFhQ/kZpyb+oeX4dbR1vvUq7gmbCUoXoPHwNo=;
 b=P08JECWBb1cxUiaDGjP5mizDB6KrKiKfUH/hnmxwPnjqOhy+tuU5gMGWPEFyc0k9lj
 rah/ilsFTCMG80s+iEy1cMaoXtskTg/cBftItm0IyNfgTXZbL/huv8r+ItxkNffs4vHU
 r+nEvV7tX98xfQZcREEWtTCVrN2BqC+8bB+SIvwUZS/7X1Y5Fd1S6Oxdw4AQkSFefBGw
 N/ycrux0+HV8XUSF2xTScSee23RP+0L7sVK6wXqQImAZrV+kbgq253wkDta2NMv5SZDw
 mpef5kYI4Ahn4Ck5OrEOrxn0jLuG3spqrCzsZb8IgHFsKxx9uY6HkIyMxe2k5O62E/g8
 T99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773218194; x=1773822994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8h94gxFhQ/kZpyb+oeX4dbR1vvUq7gmbCUoXoPHwNo=;
 b=AU4D9icImuGatKKP16Na1ZAL8mwxDz2J3UD0rFoMdbHKTklauA4gPlBHFAUvDwq+dQ
 +mhMSBV5E7X1uOwVgegZHEnhYrqgk26oAT+GlVMhooPqVlATXQaZx768tWnMmFGXTrVF
 poZCfDm9CrJTGVDOETD0imEamL1dOTEm57GQ2Ju7rXIAl3mvOwr3m9Pe+QfqFswseNIv
 CJi/cgeM019M5Qu4iLnqXGrjSFiNtIlPM4dlOGBfZSFfftpXngVpxDAKrOWUZerDSZN2
 ikswNOWFpCgk9qCMdMIpp5UtbeFiMCRLqSAwMz6G0+YPSq3LterWt0eQc/YweeypJSFj
 DZug==
X-Gm-Message-State: AOJu0YzrZIS4weVwJUDS5DVzbemvhdjXuqtkZrlBtWsUwIwFGQbKNRs1
 8S44JGzD5RPQAoeUSZkrPpNUyI5Ei3/1brMbFmpOar799V1k3uQAJhCK
X-Gm-Gg: ATEYQzyyxpOCKsZoP5z0hz5xye06FmD8kjkXyg3F4/MS2v7DDLk8guOwRD1UTEwmNp/
 1An5+HOfJetWnj2ZM6pL19Vq8eMwyAnDu3yKDckpbrUH1LsD2UboPqxcd8NFN5AFe9+C66NlPr/
 lL+KpKtWDlL2keIOvbs2sHnxuLggwZlPLY195RtSIXJMQAU13cpwFPSyrUNn6nbWOaEJlurhvfH
 eHfcSKNC3tRhT1h91dmxWMm1zZoAYhV1InU62pv5C+vpMZjRSugP+1wPddCsVYm9jKimEs4qD3C
 CBrEQoTLm03Wowae7mMRBmCsNNUi+q/PgRTJgfNuQJ9KoOURu86dk4sBOLPjLyH9UqTfLa+0kFl
 hxnaRStyb2TpuCPKAh3GzQhMV6i67pVO1EtTVDTa6KqLSblEuNxHMlpxNJ6bVljXpKbPj6jAtA1
 F1McDcAimIxZJE30qqyEvYlemQM4B4TFym+NwrsWYRRA==
X-Received: by 2002:a05:6a00:2d28:b0:829:8cfb:df45 with SMTP id
 d2e1a72fcca58-829f6ea611emr1712907b3a.15.1773218193774; 
 Wed, 11 Mar 2026 01:36:33 -0700 (PDT)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:d2d5:a44:599c:b689])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829f6dc2d76sm1592503b3a.8.2026.03.11.01.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 01:36:33 -0700 (PDT)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org,
	daehojeong@google.com
Date: Wed, 11 Mar 2026 16:35:28 +0800
Message-ID: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ad1357c34023 ("f2fs-tools: revert summary entry count from
 2048 to 512 in 16kb block support") changed the logic for migrating SSA blocks,
 regardless of whether the packed_ssa feature is enabled. Duri [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0F3X-0004dH-LA
Subject: [f2fs-dev] [PATCH v3 1/3] resize.f2fs: fix to avoid zeroing main
 area blocks in migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: BF3FA25F714
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 
512 in 16kb block support") changed the logic for migrating SSA
blocks, regardless of whether the packed_ssa feature is enabled.
During the reisze process, this patch may corrupt the file system
root inode.

Reproducer:
dd if=/dev/zero of=/data/f2fs.img bs=4k count=525312
make_f2fs -g android /data/f2fs.img 131072
resize.f2fs -F /data/f2fs.img
mkdir /mnt/f2fs
mount /data/f2fs.img /mnt/f2fs

The root cause is that the number of SSA blocks after segment
alignment is inconsistent with `get_newsb(segment_count)`.
This may result in some SSA blocks not being zeroed out, or
the main area blocks being incorrectly zeroed out during SSA
migration. Zeroing out the main area blocks may corrupt the
root inode.

Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
Changes in v3:
 - Split the fix and cleanup into two patches
 - Add reproduction steps

Changes in v2:
 - Modify the commit message
---
 fsck/resize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index e6502837b209..b73a2529dc75 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -258,7 +258,7 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 	block_t old_sum_blkaddr = get_sb(ssa_blkaddr);
 	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
 	unsigned int expand_segno = MAIN_SEGS(sbi) - offset;
-	unsigned int new_seg_total = get_newsb(segment_count);
+	unsigned int new_seg_total = get_newsb(main_blkaddr) - new_sum_blkaddr;
 	int new_segno;
 	int ret = 0;
 	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
