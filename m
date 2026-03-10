Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJYaFSjmr2nkdAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:36:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E7248907
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OPMM9imOdRjz/ltcyvbxZYt1+lOo4WKGO1r10U25xPI=; b=Q4hXtfGzuQuuL49sk20Y/z44K0
	z4u2mgxKYKLV+9CIoFJILViobC6kXJm+B3lI676O0ROWBtFwfHMbGVa1MJQDuXKEbIY0EJvyKGfzu
	Vmt6Te7JMG7lSVdDFFwu30wx9+5uinYsyo6pnlYQrqAu8cUSBRwRE2DOor2ScQkA6uEA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vztVx-0006fK-Aa;
	Tue, 10 Mar 2026 09:36:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vztVw-0006fE-6k
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HnobEGT+yE5xs3GYZMsSARPMwoF1A9DCmGMdH6GPkho=; b=F13KF4J9T7xSdZs5MsIuNw0gtY
 B8TIHnubtzMj2MZkdWTWXgp/ujuWy3b63fK7/wZkCVnM5FHJvMANhKrQJu2IJP8Yk4PsWr7PKCdIB
 H1u3DwKS8SQIjSaEvMsUIgHPytHracaYDAXxKcYc3niSUra9+cvMZfx5/BJaQoKjR0Fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HnobEGT+yE5xs3GYZMsSARPMwoF1A9DCmGMdH6GPkho=; b=b
 bVGQBKRdrq3WXw/gMMKD/6nJXL05+V+CaNdAhVFt8HqcL/uFd06pAsa4Smup3UdqFuGrG1wr7DWh4
 K145A2++EKRYcBZ/pB2aQFQ9tvB4w+wEyLxj3N6fPyOjbDy0GF5PkjYoY33XSbuDquv7J8Y2ko6r1
 E6SkIrtOhq36SqIk=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vztVv-0002fu-6Z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773135391; bh=HnobEGT+yE5xs3GYZMsSARPMwoF1A9DCmGMdH6GPkho=;
 h=From:Subject:Date:Message-ID;
 b=hbiqSuHS/ISHn5eGkh0AdDyQMOp2H3RFtSqsQ3TLaZJNlIOukJU5A8rTWn9YAo6P7
 xmLJ99aQwNIZJ7OsnY5y7176NzVdU7V0GKyHGh6E+2U9AtqyrgCPaVjD6cOpA1v2Ox
 NZHpjl+uHS1HU2trpLhVi2W1NhK8sqyeryskFvA8=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69AFE614000071F2; Tue, 10 Mar 2026 17:36:22 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2880056685145
X-SMAIL-UIID: 0A19579D396947BFB83E2A21393C90DF-20260310-173622-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 10 Mar 2026 17:36:10 +0800
Message-ID: <20260310093611.2865092-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patchset addresses a data
 consistency
 issue caused by the lack of mutual exclusion between checks of the
 HAS_FSYNCED_INODE, 
 IS_CHECKPOINTED, and HAS_LAST_FSYNC flags and the checkpoint write path [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vztVv-0002fu-6Z
Subject: [f2fs-dev] [PATCH 0/2] f2fs: fix data consistency issue caused by
 nat_entry flag
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2A2E7248907
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email,sina.com:mid]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patchset addresses a data consistency issue caused by the lack of
mutual exclusion between checks of the HAS_FSYNCED_INODE,
IS_CHECKPOINTED, and HAS_LAST_FSYNC flags and the checkpoint write path.

In f2fs_flush_nat_entries(), after writing back the NAT block, the code
sets HAS_LAST_FSYNC and IS_CHECKPOINTED, and clears HAS_FSYNCED_INODE.
Although accesses and updates to these flags are protected by
nm_i->nat_tree_lock, observing this state in the fsync context does not
guarantee that the corresponding nat_entry state has already been
persisted to the device.

The root cause is that the semantics of these three flags are only
guaranteed after the checkpoint write completes, while the fsync path
does not follow this constraint.

This patchset ensures that accesses and updates to nat_entry flags in
the fsync path are protected by sbi->node_write.

There are still call paths not protected by sbi->node_write:
need_do_checkpoint()->f2fs_is_checkpointed_node() and
need_do_checkpoint()->f2fs_need_dentry_mark().

The flags obtained in these paths may be imprecise, but they only affect
whether a checkpoint is triggered and do not impact consistency. Adding
lock protection here would increase lock contention, so these paths are
left unchanged.

Yongpeng Yang (2):
  f2fs: fix fsck inconsistency caused by incorrect nat_entry flag usage
  f2fs: fix data loss caused by incorrect use of nat_entry flags

 fs/f2fs/node.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
