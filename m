Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGnuMFG8gWm7JAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 10:13:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BFD6A58
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 10:13:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5JMqF11UASXfNnowKuqf8mJOXL88kAYMiachEozL3pY=; b=bRQ1KtiK7oXbqb9P+DBPttKccV
	+junrg6nT1gC/ybI6bq64TC4msRRJtm4NfyNuT5xXRFoqHMxVjTDXuAjxqvX1/MD8vUv1S4dT3LAA
	cYRQ++/MktoNO81O8Bbjm+YoNLJzkTOjZHFtvJY8c5EjaanXiROHo0NdWeG0QKuVfIYo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnCTW-0007cQ-Ef;
	Tue, 03 Feb 2026 09:13:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vnCTU-0007cK-G1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 09:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YP+HixCNTVvtIn71grC6Aqnsi/VEiRq8uOloSMOvv2w=; b=N8DZ2RI2vJcyusU/mAbVCeVwU+
 u68oGzwfS7BzjstIpt9J2ebQBWjTjYufo70BUS/MwERJLfEp26Jmq3dkHY9Xi7pq9EUNvGv7CnUmC
 grqe6XXi3ncUu0Yer6sctzTq7pXnncHl0c/ERfN1gX+nT/RqXuSxOV/5EQ3oZfqFLN4Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YP+HixCNTVvtIn71grC6Aqnsi/VEiRq8uOloSMOvv2w=; b=W
 yA06vRB/iZB2XLrXqo3GujAeSRQUlEeMLvVAzjQu/ghd9aR1QRQUOhua9IBXjounR2JhtYGEq/Hw9
 q2uxpIzNeAcmLe/JKDvhpuYwLFVhZimItPm4C9AXPuQEfZeznYSoZbRTrtMHG2m6rQlcRCFqusqBm
 YU8ML4WGkfWFOL6M=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vnCTT-0004W0-9P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 09:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=YP
 +HixCNTVvtIn71grC6Aqnsi/VEiRq8uOloSMOvv2w=; b=L4/Zi5LSqOJt/q0ime
 v7tkmCr4lIcoUJp3Wq3ZdFOoeWpCHotJuEPLdEoxTAEBwxzYGf0OXGy7bTbT/ihp
 9VpeZRfzAzpbazFHC9KZyOYLkTrwoJq7vXNYMMLSzr96dePuA/QMkU2QXPr+W6Lt
 ym980wqKRaZW4d27YKzxBE5z8=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wD3l2kivIFpOegGAA--.25117S2; 
 Tue, 03 Feb 2026 17:13:07 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 Feb 2026 17:12:47 +0800
Message-Id: <20260203091256.854842-1-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3l2kivIFpOegGAA--.25117S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF45GF15Wry3Zr1DJr1fZwb_yoW8KFWxpF
 Wakr1fGrn5Jr17ZrnxAF1jqr1Fgw48Jr4UJFWxJryIq3W5Ar1rWF1kt340qry7JryfJr1f
 Za1UAryxWF1UJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziJPEfUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowPxwWmBvCMAMgAA3V
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This RFC PATCH series adds support for large folio buffered
 writes to regular readable and writable files in f2fs with exception of
 atomic/compressed/inlined
 files. Since adapting page writeback to su [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [58.240.165.118 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.8 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vnCTT-0004W0-9P
Subject: [f2fs-dev] [RFC PATCH v1 0/5] Support large folios buffered write
 for regular files
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[126.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:nzzhao@126.com,m:21cnbao@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[126.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[126.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nzzhao@126.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 0D3BFD6A58
X-Rspamd-Action: no action

This RFC PATCH series adds support for large folio buffered writes
to regular readable and writable files in f2fs with exception of 
atomic/compressed/inlined files. 
Since adapting page writeback to support large folios is relatively complex, 
it is not included in this series.

I ran simple `dd` tests on a Pixel 6 device. 
During the tests, dirty page writeback was temporarily disabled.
---------------------------------------------------------------------------------
Test:
echo 100 > /proc/sys/vm/dirty_ratio
echo 100 > /proc/sys/vm/dirty_background_ratio
echo 0 > /proc/sys/vm/dirty_writeback_centisecs
echo 8640000 > /proc/sys/vm/dirty_expire_centisecs

Before large folio enable:
oriole:/data # dd if=/dev/zero of=lf.c bs=2M count=500
500+0 records in
500+0 records out
1048576000 bytes (0.9 G) copied, 0.815 s, 1.1 G/s

After large folio enable:
oriole:/data # dd if=/dev/zero of=lf.c bs=2M count=500                                               
500+0 records in
500+0 records out
1048576000 bytes (0.9 G) copied, 0.330 s, 2.9 G/s
---------------------------------------------------------------------------------
Note: 
- bs=2M means always allocating the largest folio order in buffered write,
  so it represents a theoretical maximum write performance.
- Because large folio support can only be enabled for files via f2fs_iget,
  it may be more convenient for testing to create a large file first and then 
  immediately reboot the device so that the inode is reloaded.

**Discussion:**  
I would like to add fault injection to `f2fs_write_end` to simulate short writes 
(copied != len). 
However, I am concerned that directly adding time_to_inject inside f2fs_write_end 
and returning 0 may cause generic_perform_write to loop forever during testing. 
Better ideas are appreciated.

Thanks.

---



Nanzhe Zhao (5):
  f2fs: Move f2fs_folio_state to f2fs.h
  f2fs: Introduce f2fs_inode_may_use_large_folio
  f2fs: Preallocate partial-write blocks for large-folio write
  f2fs: Support large folios buffered write
  f2fs: Make folio->private flags work with folio state

 fs/f2fs/data.c  | 226 ++++++++++++++++++++++++++++++++++++++++++++----
 fs/f2fs/f2fs.h  |  58 ++++++++++---
 fs/f2fs/file.c  |  21 +++--
 fs/f2fs/inode.c |   3 +-
 4 files changed, 272 insertions(+), 36 deletions(-)


base-commit: bc367775f60214312befa33f101b31fe74bba48a
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
