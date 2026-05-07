Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKzmLFt7/GkwQgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:45:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF144E7AA1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VGJPkeoNx1fU0SIAo/GhErx5lhCsOcElICXo8WAKE9U=; b=Isidi9kajVLPHdrLqoH0YEW48N
	jDZjA/3AcypmwWW2HhzuxvArMXMTVSeP+/cxSBkHxhgK+0kdCiU3Ntr5+vjA0bEKB73dWz5Z35PHj
	qSBCzMYM1f/xJWGbz626uDkI3wjKGRuxA4FaOUpy3R3WdcdZIws219PdWYXyetGUdvZw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKxAT-0000Tl-Ld;
	Thu, 07 May 2026 11:45:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wKxAS-0000TV-19
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2mdsyF2Up75q6G9th+oBpp/bcV+HZsE8sgI9JX16WQk=; b=XrxmJCfMiqSUb/Hf/XoarfGw6h
 hE8Bcw0M+rQiAErNZw2HIhiAdvXFP7R6sYKnYz5fH7ZJexZRd08TIyA48AfyF/yUhtyCJd6Dfa8TZ
 ryeufGUvSJyhWVQlK7KKYgYt3PpFQcLQ7PhmEL90TOQPgUqRN9o79uciPg3DdHZZnl3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2mdsyF2Up75q6G9th+oBpp/bcV+HZsE8sgI9JX16WQk=; b=K
 Ff63F7LVMnLxmPGc4JGFkeiPVuc2iweeS+VUzlmNJASmnwg39hMPjzHh+sO4U7VL/CHcpBGgjPz1D
 aXjaaKzf8Sy+iJAhDMEGvwL87/iVkjgMSpfbBi1MA9Pi/NYxWN7AeGbsQFEaTJbIwq90r7aKZwvy8
 9KT48Phby6fUuDIo=;
Received: from mail3-164.sinamail.sina.com.cn ([202.108.3.164])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKxAR-00038S-9Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1778154323; bh=2mdsyF2Up75q6G9th+oBpp/bcV+HZsE8sgI9JX16WQk=;
 h=From:Subject:Date:Message-ID;
 b=S2Y87HJxC1LdQrok68ILjYQ3X6TqanDQDRjMNVa4m9sBAkctjzm3jrhcfMbzJX/s8
 AXyYpuZD3RrnPpPE+gHXUtjxe3MNQ6ZYR9KfeWw7h4hu8eBjUtm66kHJ/mZ0kz82mD
 mT4egONCVVyrIduIndUPlxgqE6eMdeqf8VstUetU=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69FC7B44000045CE; Thu, 7 May 2026 19:45:10 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2720014456695
X-SMAIL-UIID: A3A8FF522AF740E4AB56BC8D87F4ECAE-20260507-194510-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  7 May 2026 19:44:32 +0800
Message-ID: <20260507114434.1353908-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patchset adds inline extent format
 support to f2fs userspace tools, complementing the kernel-side inline extent
 feature. The inline extent format stores block address mappings as compact
 extent entries directly in the inode's data block address area (i_addr[]),
 identified by dual magic numbers. This provides O(log n) lo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wKxAR-00038S-9Q
Subject: [f2fs-dev] [RFC PATCH 0/3] f2fs-tools: add inline extent format
 support
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
X-Rspamd-Queue-Id: 3FF144E7AA1
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
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,xiaomi.com:email]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patchset adds inline extent format support to f2fs userspace tools,
complementing the kernel-side inline extent feature.

The inline extent format stores block address mappings as compact extent
entries directly in the inode's data block address area (i_addr[]),
identified by dual magic numbers. This provides O(log n) lookup via
binary search and reduces space consumption for files with contiguous
block allocations.

Patch 1: fsck/dump core support -- inline extent operations (lookup,
         insert, merge, split, truncate, format conversion),
         integration with datablock_addr(), set_data_blkaddr(), and
         fsck sanity checks.
Patch 2: Build system -- add --disable-inline-extent configure option,
         wire iextent.c/iextent.h into fsck build, define
         HAVE_INLINE_EXTENT macro.
Patch 3: f2fs_io tool -- add "extent" flag support for setflags/
         clearflags/getflags commands.

Yongpeng Yang (3):
  fsck: add inline extent format support
  build: add inline extent build support
  f2fs_io: add support to clear/set extent flags

 configure.ac            |  10 +
 fsck/Makefile.am        |   4 +-
 fsck/dump.c             |   4 +-
 fsck/fsck.c             |  38 ++-
 fsck/iextent.c          | 738 ++++++++++++++++++++++++++++++++++++++++
 fsck/iextent.h          | 100 ++++++
 fsck/mount.c            |  59 +++-
 fsck/node.c             |  30 ++
 fsck/node.h             |  18 +
 tools/f2fs_io/f2fs_io.c |  16 +-
 tools/f2fs_io/f2fs_io.h |   3 +
 11 files changed, 1001 insertions(+), 19 deletions(-)
 create mode 100644 fsck/iextent.c
 create mode 100644 fsck/iextent.h

--
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
