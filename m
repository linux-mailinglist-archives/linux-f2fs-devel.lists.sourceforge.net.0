Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fo1bJYi8AmrKwAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:37:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8E51A2ED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByGiSAj/aQj3L0I2rA8b40cGf1p1l/OYsivgTR0yKok=; b=JC6TVQsjROxbAihQs/5LNVdjPy
	zsxN7oyl5QROGojmB7tWmeqQNLxA0FCOSRfPv1uVKD7N55h8uTBAoyfMPqIRwM680y0ml5H+ak0Pz
	8AeZP++6kILxgtwA59plROUca+QVZsdjhua5qvuEtrcMVBZH6Al2wYXwlwYnDSXUti3o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMfnk-0007Rb-Bb;
	Tue, 12 May 2026 05:37:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9f3c1ea353498f61ccd0+8297+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wMfni-0007RI-VX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L6G3lv4jbdMbQ4QsNCiCXE8kA9OQYRVEnsOclxNjvlk=; b=XWf9rnClI0xC2u6uscgFLa7dtO
 4Fpi/S5NKyXTQ8CrIeMHZRgLvnB5AU8Z6Ykzwz5SVLP8MvHHJhMBoYtErGbOS27x0hvkDgIlhH4KJ
 yxyVCzC60k2sxsKS1y2xMK/7vv/+taCrggA/KDVSULSdgjMjNPD0e5lzMDaN0my7PTQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L6G3lv4jbdMbQ4QsNCiCXE8kA9OQYRVEnsOclxNjvlk=; b=A
 ocuRveuJeKsIFh6+weckrzlDoJHiTPD2Z5ZdNyXovbBua8QvNgUjzJOIx0CRbvn+iKDNN6KwnOyY0
 MYU/0JxKc1b3/LdKyDQRJGeJkowPkYshmA5et2mGGZvL0f9jT7601cOlaoBqWzdMax4KJn8oQIucj
 W9l+bb6X5ZVV+qb0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMfne-0004nW-Lo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=L6G3lv4jbdMbQ4QsNCiCXE8kA9OQYRVEnsOclxNjvlk=; b=KIK+jQvSnKRXIFRrePcKSt8tSC
 gTDIoVa3ilaBJgAv2JyiBq1oBQNEEVuR8cAKQZACHFbXeQgzOq5bCCS43yMoo3rZpQpygSiDzL+5p
 k8ewxMk5abPknkbI0BLQkk18U//bp1Se74dgd8ytTOIwgIqIRD8+j0upZnmtm9RP/nG0Iay4iv5BI
 0R0Ux2iGn5C8GSW0QkgvHRpchKQA0HU/3surCqZ+w6g1XBcpaQIEofBGAUjsWIOw9fW5TdRUHOoZH
 pIElcotsE4NXj4I4GC6C78nmVfU4K8GqhWK2VIAj1M/0+2fkttDIMP1Vqdy9WFOxCQtHvlSJJWz7z
 NqzmFnXw==;
Received: from
 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wMfnF-0000000FfDa-0NfM; Tue, 12 May 2026 05:36:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>
Date: Tue, 12 May 2026 07:35:16 +0200
Message-ID: <20260512053625.2950900-1-hch@lst.de>
X-Mailer: git-send-email 2.53.0
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
 Content preview:  Hi all, Darrick recently posted iomap support for fuse-iomap,
 which was trivial but a bit ugly, which triggered me into looking how this
 could be done in a cleaner way. The result of that is this fairly big s [...]
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1wMfne-0004nW-Lo
Subject: [f2fs-dev] improve the swap_activate interface
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong " <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B1E8E51A2ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,mit.edu,lists.sourceforge.net,samba.org];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:trondmy@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid]
X-Rspamd-Action: no action

Hi all,

Darrick recently posted iomap support for fuse-iomap, which was trivial
but a bit ugly, which triggered me into looking how this could be done
in a cleaner way.  The result of that is this fairly big series that
reworks how the MM code calls into the file system to activate swap
files to make it much cleaner and easier to use.

I've tested this with swap devices manually, and using the swap tests
in xfstests on btrfs, ext3, ext4, f2fs and xfs to exercise the different
implementation.  Out of those all passed, but f2fs actually notruns all
tests even in the baseline as it requires special preparation for
swapfiles which never got wired up in xfstests.

Diffstat:
 Documentation/filesystems/iomap/operations.rst |    3 
 Documentation/filesystems/locking.rst          |   35 +--
 Documentation/filesystems/vfs.rst              |   40 ++--
 block/fops.c                                   |   15 +
 fs/btrfs/btrfs_inode.h                         |    3 
 fs/btrfs/file.c                                |    4 
 fs/btrfs/inode.c                               |   72 -------
 fs/ext4/file.c                                 |    6 
 fs/ext4/inode.c                                |   11 -
 fs/f2fs/data.c                                 |   50 -----
 fs/f2fs/f2fs.h                                 |    2 
 fs/f2fs/file.c                                 |    4 
 fs/iomap/swapfile.c                            |  165 +++---------------
 fs/nfs/direct.c                                |    1 
 fs/nfs/file.c                                  |   21 --
 fs/nfs/nfs4file.c                              |    3 
 fs/ntfs/aops.c                                 |    8 
 fs/ntfs/file.c                                 |    6 
 fs/smb/client/cifsfs.c                         |   18 +
 fs/smb/client/cifsfs.h                         |    3 
 fs/smb/client/file.c                           |   16 -
 fs/xfs/xfs_aops.c                              |   48 -----
 fs/xfs/xfs_file.c                              |   39 ++++
 fs/zonefs/file.c                               |   30 +--
 include/linux/fs.h                             |   11 -
 include/linux/iomap.h                          |    5 
 include/linux/nfs_fs.h                         |    3 
 include/linux/swap.h                           |  129 +-------------
 mm/page_io.c                                   |   45 ----
 mm/swap.h                                      |   92 ++++++++++
 mm/swapfile.c                                  |  227 ++++++++++++++-----------
 31 files changed, 471 insertions(+), 644 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
