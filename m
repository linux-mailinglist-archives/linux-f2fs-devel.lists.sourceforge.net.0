Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3pq8KwRkUWo9DwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:28:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E64BD73EE63
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:28:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=eRvQ1zfs;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=T3nnYbQY;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="S oZcduP";
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b=mFgiNiGD;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=crzezkxyU/Q2mcgOKx+Rs3DIecsGQvGzoTznmNbPacc=; b=eRvQ1zfsOKW9NFtM9GiRRWh+CW
	0m1bwuhQeJ6Kwq8mUJQf6qcKRvkz9W9pGdHeNmnp3mG1jKTMlHSw2/c2tmC7l+u+epXc5aA+guAmG
	J7jSp8WRIIRkL9aEX9l5r2dHhGjLfyFbnZvTrjfdjiG6cDAtMcsRx0TMz9M+ZIXLSASM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIlq-00040q-1A;
	Fri, 10 Jul 2026 21:28:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5651d212ed=kbusch@meta.com>) id 1wiIln-00040U-M1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAsEQB+ej52ISVSeW0QY/kgNMdTWYAu3CU+oqE/r7E8=; b=T3nnYbQYOwq3uJa/q2a18ReBJG
 nAMNotU8xMBugu91CXSZBmFqudp2xS9UAt3h5KyEHzinwfr93s77qhkUDlxkKwj9MvuLwCYp7w1IM
 6UdqEU8bLx05lbsHcBqoqg5lJQoZt6k30kQHwIKSfWwOsCC2ZW/jDDEErhrt/Up2rSzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VAsEQB+ej52ISVSeW0QY/kgNMdTWYAu3CU+oqE/r7E8=; b=S
 oZcduP68Hn8hGsscjokEHFGQQO46l86tGf/hBkXqW886+bLCA+QOB7shuK0ZDP3Y49F3AEyMAu22B
 lg/F3PgSypKDRU3STYD7lS6ABE+qNbTVYxZbyIiR0j6my7kcZNebHF8vnQEoyHlyrrA22cb0skjO4
 5BYsAc1kZPocgjAA=;
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIln-0007RG-Q7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:28:28 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3TEO2399823
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 10 Jul 2026 14:28:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=s2048-2025-q2; bh=VAsEQB+ej52ISVSeW0
 QY/kgNMdTWYAu3CU+oqE/r7E8=; b=mFgiNiGDQoEhc4WqcH+Oj0O9r3VIaRJzUm
 tnOxDamaVTL5W3YD3aloSGAGkctXg8tL4MZxGUGEJC1gxEIdVx1oXMavdKoQhi4P
 oNql1IfHd+0nCdeN0h0JK2Dt6cji80ishzkA8Fi4thg/7ySexa2eNpWE6kIyc1j5
 5bRT3iAdf1RKrPU4Vi/jX62Z0E6RACSanDWXeqaQxYucY/p9rSqMkKaQ9J4zRZl7
 q/sy7EJnU0/o2CgTyb9Fp/fOgdkYfKhOxKXv7rrgHac6VAMmBsTEuQuL3/m6KaGH
 ChfFf4weqDMEWzDxn//8ph/y23/UOtc0MP1c0ivyPhCemnKHgZbw==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fajrdfa0n-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jul 2026 14:28:22 -0700 (PDT)
Received: from twshared20290.04.snb2.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 10 Jul 2026 21:28:20 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 46C7024F006F3; Fri, 10 Jul 2026 14:06:47 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Fri, 10 Jul 2026 14:06:41 -0700
Message-ID: <20260710210646.3576365-1-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNSBTYWx0ZWRfXwaWAvFaLVJpB
 4DKWLoaGr8Fc9yRYMsTuEi/GMrn+KFVfky7NM/5Y+lJ7mJDXCfYa9meeVC+ad6AAbChiBVYNk5h
 g6KHvMBsw2JJav+0OFAC18QJfMH9KMn3kJ6wGe+8f5/KoCFEvCwqniVBG7p2P5O3qPOJqnKlpVt
 suOb2nhO+dAzb2BMiFMOp9U3A0JNaUg8nN9v5mHxnVExXk+ENaNlUcBTFU4J+u8+WcqvZQ6x2Xm
 OBZDigVnludV4+q/EaIVXcGfhN4zKX1M4WP6cHNBfPW1ZEj8223Ce1+OkYjLlus+DDJrTFZ/Zga
 dffkrXOE6QwaFzPi1hhIzMboJlbXg1VL2jBH4SbMDGLtVkRbHUnzqH0wgIbXjZyfDM58BSWPA2n
 egucGFFSH1Xjk/1UyVHCxmCNT2WgWmcJvPQv3QJkZfLxqrf9q2pW/4vs6ZM3akyyOHU4vOy50ZV
 UMD2VJYvwPMwnLqAEKA==
X-Proofpoint-ORIG-GUID: xpBJSHsoq3wK4tO3k4eI2wuwHT2I6674
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNSBTYWx0ZWRfX6eCJpujZiLij
 S6wmT0INR2ETgkFqhasBY9g9eeOuZ62265SOpbK1cyDVpcqITCDfxGoc2/ZOlGptyhhnQFPUmsP
 V/yfdLDm+/8m+pPtTzcyzhsAhbDVQm8=
X-Proofpoint-GUID: xpBJSHsoq3wK4tO3k4eI2wuwHT2I6674
X-Authority-Analysis: v=2.4 cv=faydDUQF c=1 sm=1 tr=0 ts=6a5163f6 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VwQbUJbxAAAA:8 a=vYknhWM2Pyct8yg2-RQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Keith Busch <kbusch@kernel.org> The attributes reported
 through statx are incomplete for applications to fully know exactly how IO
 construction is valid or not. The statx call can report minimum memory
 alignment and total granularit [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.145.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wiIln-0007RG-Q7
Subject: [f2fs-dev] [PATCHv2 0/5] direct-io file extended attributes
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@meta.com>
Cc: axboe@kernel.dk, brauner@kernel.org, aalbersh@kernel.org, jack@suse.cz,
 tytso@mit.edu, Keith Busch <kbusch@kernel.org>, jaegeuk@kernel.org,
 cem@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:aalbersh@kernel.org,m:jack@suse.cz,m:tytso@mit.edu,m:kbusch@kernel.org,m:jaegeuk@kernel.org,m:cem@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,meta.com:s=s2048-2025-q2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,meta.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,meta.com:mid,meta.com:replyto];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[kbusch@meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E64BD73EE63

From: Keith Busch <kbusch@kernel.org>

The attributes reported through statx are incomplete for applications to
fully know exactly how IO construction is valid or not. The statx call
can report minimum memory alignment and total granularity, but it
doesn't show the underlying gap boundary requirements or max segments
per granule.

This series adds the minimum to the extended file attributes through
file_getattr. I hear this is the preferred interface for reporting such
things over adding more fields to statx. In order to get everything
under a single syscall, some of the attributes are duplicated from
statx.

Keith Busch (5):
  fs: add direct io attributes to file_getattr
  block: report direct io attributes through file_getattr
  xfs: report direct io attributes through file_getattr
  ext4: report direct io attributes through file_getattr
  f2fs: report direct io attributes through file_getattr

 block/bdev.c             | 37 +++++++++++++++++++++++++++++++++++++
 fs/ext4/ioctl.c          | 23 +++++++++++++++++++++++
 fs/f2fs/file.c           | 20 ++++++++++++++++++++
 fs/file_attr.c           | 13 ++++++++++++-
 fs/xfs/xfs_ioctl.c       | 26 ++++++++++++++++++++++++++
 include/linux/blkdev.h   | 14 ++++++++++++++
 include/linux/fileattr.h | 10 ++++++++--
 include/uapi/linux/fs.h  | 10 +++++++++-
 8 files changed, 149 insertions(+), 4 deletions(-)

-- 
2.53.0-Meta



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
