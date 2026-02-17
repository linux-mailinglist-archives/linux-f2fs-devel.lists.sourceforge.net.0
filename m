Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v+8qMUralGl7IQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DA1509B4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77QkCt556XLEii9P2jrrLnsjVOil8zpJl+bIf5YiVrg=; b=APihMHmPN+qBOVPRrTJFhgTJo+
	N1jtNR18uPJUrbGKYxt5j6WAkvm6FijIxzplGkGGw+OpCB6CEhORrsYhJcoYFwHE49ywWj5JgGx6j
	GYBilUltDZzrV+WFNQNw0vohPKnwaaPplVwgmu0+AmCm9YCQMe8O3SOa1f447Wy1ome4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsSP3-0007x3-8T;
	Tue, 17 Feb 2026 21:14:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vsSP1-0007wx-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=erEpju3wDMbu+r4Apb8AgKhBcReE2bKf/STDd0NLMQI=; b=epDHeABOZl2M3G56dSDqQYvips
 3PWKDuejUrQudELfPu/pOx7fupD35N1DZ8wDLK02frmopjUViZ/I2txAqliWJzXNTGylGzE0xSibW
 geZvBLsNp4AoHbg38W46ciU/i6OWV+WHVMTcAhIUsTJaZ0kwq93Oa1JzEwRuG99UCqgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=erEpju3wDMbu+r4Apb8AgKhBcReE2bKf/STDd0NLMQI=; b=G
 GIrCi36YtmFsv/DdN0WPuuTxbjrWZGpQ/5GLvsAuC7WTtviTAwFN7Of0H0c/2zBwIR3BVgo/het8B
 8SE96Igdi2tAUL95netOcHsmAJOZZH+yk3HakY157FP07lQD9sWc7JAGTJOgafXov0js4BldkyCr1
 Y1dM3Prt4zqUn+7s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsSP1-0001T0-DZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECD9743CB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Feb 2026 21:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC01FC4CEF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Feb 2026 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771362873;
 bh=PJHkYbmwDtL4EjZn5ONZ+Qv8SogFeY6Ed2NyZybMEQY=;
 h=Subject:From:Date:To:From;
 b=dh8tdrovsYE3cl0YkvqEmwA2HWINM2T9r5TM7PxerqpnUFhudHn4BVozQTGZd8net
 sPaVfxfHnTwG495mMTwc8iTWe5/V4GJ4hcWW/6fcEYZxJg9aX8OAykwm3XbLCTd6YT
 gsHiOzeINHigRQbB2ppbypHmQ6df1h6TZVeSefLWZEQPkYMKDnU91RRhTKfyyzrqWX
 2Og0MqvVsiLCkV67DwAWB/0OLhrNtDPgzz+nIHj1zg2sr5z5HmqLxw4T/e9w/L8zrS
 OwVJ818DJpr1z5ZA7LH2u2pBkiT8FyTtRsxrYUgMJhEZLx2xa0rCwmGZZbhr5p6OOj
 unnA5ohL5WrFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 C47B53806667 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Feb 2026 21:14:26 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177136286524.643511.17517466762972897289.git-patchwork-summary@kernel.org>
Date: Tue, 17 Feb 2026 21:14:25 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: block: ignore
 __blkdev_issue_discard()
 ret value Submitter: Chaitanya Kulkarni <ckulkarnilinux@gmail.com> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=1027128 Lore link:
 h [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vsSP1-0001T0-DZ
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_ONE(0.00)[1];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email,kernel.dk:email]
X-Rspamd-Queue-Id: 123DA1509B4
X-Rspamd-Action: no action

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: block: ignore __blkdev_issue_discard() ret value
  Submitter: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1027128
  Lore link: https://lore.kernel.org/r/20251124234806.75216-1-ckulkarnilinux@gmail.com
    Patches: [f2fs-dev,V3,1/6] block: ignore discard return value
             [f2fs-dev,V3,2/6] md: ignore discard return value
             [f2fs-dev,V3,4/6] nvmet: ignore discard return value
             [f2fs-dev,V3,6/6] xfs: ignore discard return value

Series: [f2fs-dev,01/15] fs, fsverity: reject size changes on fsverity files in setattr_prepare
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Eric Biggers <ebiggers@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1048139
  Lore link: https://lore.kernel.org/r/20260128152630.627409-2-hch@lst.de
    Patches: [f2fs-dev,01/15] fs, fsverity: reject size changes on fsverity files in setattr_prepare
             [f2fs-dev,02/15] fs, fsverity: clear out fsverity_info from common code
             [f2fs-dev,03/15] ext4: don't build the fsverity work handler for !CONFIG_FS_VERITY
             [f2fs-dev,04/15] f2fs: don't build the fsverity work handler for !CONFIG_FS_VERITY
             [f2fs-dev,09/15] fsverity: deconstify the inode pointer in struct fsverity_info
             [f2fs-dev,11/15] fs: consolidate fsverity_info lookup in buffer.c
             [f2fs-dev,14/15] btrfs: consolidate fsverity_info lookup

Series: vfs: require filesystems to explicitly opt-in to lease support
  Submitter: Jeff Layton <jlayton@kernel.org>
  Committer: Christian Brauner <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1040039
  Lore link: https://lore.kernel.org/r/20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org
    Patches: [f2fs-dev,01/24] fs: add setlease to generic_ro_fops and read-only filesystem directory operations
             [f2fs-dev,02/24] affs: add setlease file operation
             [f2fs-dev,03/24] btrfs: add setlease file operation
             [f2fs-dev,04/24] erofs: add setlease file operation
             [f2fs-dev,05/24] ext2: add setlease file operation
             [f2fs-dev,06/24] ext4: add setlease file operation
             [f2fs-dev,07/24] exfat: add setlease file operation
             [f2fs-dev,08/24] f2fs: add setlease file operation
             [f2fs-dev,09/24] fat: add setlease file operation
             [f2fs-dev,10/24] gfs2: add a setlease file operation
             [f2fs-dev,11/24] jffs2: add setlease file operation
             [f2fs-dev,12/24] jfs: add setlease file operation
             [f2fs-dev,13/24] nilfs2: add setlease file operation
             [f2fs-dev,14/24] ntfs3: add setlease file operation
             [f2fs-dev,15/24] ocfs2: add setlease file operation
             [f2fs-dev,16/24] orangefs: add setlease file operation
             [f2fs-dev,17/24] overlayfs: add setlease file operation
             [f2fs-dev,18/24] squashfs: add setlease file operation
             [f2fs-dev,19/24] tmpfs: add setlease file operation
             [f2fs-dev,20/24] udf: add setlease file operation
             [f2fs-dev,21/24] ufs: add setlease file operation
             [f2fs-dev,22/24] xfs: add setlease file operation
             [f2fs-dev,23/24] filelock: default to returning -EINVAL when ->setlease operation is NULL
             [f2fs-dev,24/24] fs: remove simple_nosetlease()

Series: [f2fs-dev,01/11] fscrypt: pass a real sector_t to fscrypt_zeroout_range_inline_crypt
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Jens Axboe <axboe@kernel.dk>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1024658
  Lore link: https://lore.kernel.org/r/20251118062159.2358085-2-hch@lst.de
    Patches: [f2fs-dev,01/11] fscrypt: pass a real sector_t to fscrypt_zeroout_range_inline_crypt
             [f2fs-dev,02/11] fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt

Series: [f2fs-dev,01/11] fsverity: don't issue readahead for non-ENOENT errors from __filemap_get_folio
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Eric Biggers <ebiggers@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1049576
  Lore link: https://lore.kernel.org/r/20260202060754.270269-2-hch@lst.de
    Patches: [f2fs-dev,01/11] fsverity: don't issue readahead for non-ENOENT errors from __filemap_get_folio
             [f2fs-dev,05/11] fsverity: deconstify the inode pointer in struct fsverity_info
             [f2fs-dev,07/11] fs: consolidate fsverity_info lookup in buffer.c
             [f2fs-dev,10/11] btrfs: consolidate fsverity_info lookup


Total patches: 41

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
