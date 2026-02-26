Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OevCLqVdoGlViwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD71A7EAC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6VbeXH3oykFt1end0qZsOjsGKoqutkriKwsiRs2mp40=; b=N3Ppg4tcMx7cR0Kxdvf9O5tqh/
	ZyTI4OAyZf3954Ukfx8x88xBZCckXVnMBQ8wX8sbtmlYhJSyl/Ds9WEGmwbLGNwVBxqViHY78c0wl
	6wXOLQp6x/kdbF42AYlIBZgmHxmmwjHWJDlTuEW75BYFYBmB2nptfk5lUITk/xhK1Y0w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvcgr-0003pi-7p;
	Thu, 26 Feb 2026 14:50:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vvcgp-0003pH-UG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mlW1GrWYPpKtXEVPnQNWBHiFH5LdPT6NCG40um9+2Jk=; b=lz3520WRTnZbk2d/QyO8e/jusf
 xliFp1/ML68P+GpUJuy4L7jWkysBzJ3JayyMxZM+Rbp8av3h4e3/rosYo6Je8aopBgwHdhTHWG3D9
 UAPJHJ2PSDxKyVekyTOyCg1lEU9c3MMr2klMbjScyCFoRHOak5i/2qw7KnJ/HCL3qLR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mlW1GrWYPpKtXEVPnQNWBHiFH5LdPT6NCG40um9+2Jk=; b=K
 v7VSOkyW8WOKFwtAA2c4yvLVU/Wz+bWtyhcs585oHuY2qoIbfAoDpNHuPShGp5Q2ji00Q6g3RNtn4
 zlO2e9yKTudBdLnF6IRSf9JxlUqRE54ccqvMpC0JxNEjOtOBo1U6r7QMfgQoOS8AqaOQ3G/r256Vz
 PhoSFjf9oLTTxw3M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvcgp-0000SF-91 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mlW1GrWYPpKtXEVPnQNWBHiFH5LdPT6NCG40um9+2Jk=; b=mVvuPZbubKAsBHIRa9ZgMZp7up
 6jBDAhlLzfognU5MoSboXf6xY+4hguYbUiwKibxPVZNaYznsY84WjoTE5yf8uVxB6akss0xbP5C36
 Ks+m6P1nleLZJXHAsDCZeGYMM3HYMk/1lek+KTxojvGRwVPwKsM27NHmQWolGybPywiXlR73dDj9i
 GcDV9T3ghCAv9BPC57TYLcYsvH1dMBaQnHdXjxgqqRus1ibChr9WNzVeBGoJCT2Svceg/apgIJp2p
 XwYc9djEQzWodISFIKsPptFLYEbAoFZVbTMApgTeYd+BwEgliKfM0g3NtLqc4S+ME81XCygCY8NkA
 /AKwlRbA==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvcgd-00000006NaB-1e5p; Thu, 26 Feb 2026 14:49:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 26 Feb 2026 06:49:20 -0800
Message-ID: <20260226144954.142278-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series cleans up various fscrypt APIs to pass
 logical offsets in and lengths in bytes, and on-disk sectors as 512-byte
 sector units, like most of the VFS and block code. Changes since v1: - remove
 all buffer_head helpers, and do that before the API cleanups to simplify
 the series - fix a bisection hazard - spelling fixes in the commit logs -
 use "file position" to des [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vvcgp-0000SF-91
Subject: [f2fs-dev] fscrypt API cleanups v2
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0EAD71A7EAC
X-Rspamd-Action: no action

Hi all,

this series cleans up various fscrypt APIs to pass logical offsets in
and lengths in bytes, and on-disk sectors as 512-byte sector units,
like most of the VFS and block code.

Changes since v1:
 - remove all buffer_head helpers, and do that before the API cleanups
   to simplify the series
 - fix a bisection hazard
 - spelling fixes in the commit logs
 - use "file position" to describe the byte offset into an inode
 - add another small ext4 cleanup at the end

Diffstat:
 fs/buffer.c                 |   17 ++++++++
 fs/crypto/bio.c             |   37 ++++++++----------
 fs/crypto/fscrypt_private.h |    3 -
 fs/crypto/inline_crypt.c    |   86 ++++----------------------------------------
 fs/crypto/keysetup.c        |    2 -
 fs/ext4/inode.c             |    5 ++
 fs/ext4/page-io.c           |   28 ++++++++++----
 fs/ext4/readpage.c          |   10 ++---
 fs/f2fs/data.c              |    7 ++-
 fs/f2fs/file.c              |    4 +-
 fs/iomap/direct-io.c        |    6 +--
 include/linux/fscrypt.h     |   37 ++++--------------
 12 files changed, 89 insertions(+), 153 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
