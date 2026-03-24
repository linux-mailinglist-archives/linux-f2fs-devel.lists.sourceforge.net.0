Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOAEEPhvwmmncwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 12:05:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FE8306F92
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 12:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEg7jViCpbstDIAYws9VKfXn8mFZBzwkEB/vXAHazF0=; b=IciWpAvYnKw3tV0GDbsGlBV1zK
	wMcCreF/Xr9AGB5vpIcNzBVQD+SwqmP2ulUSQS5+efcpKz9N0tW+6XEg144b6+74vo24nilu/oRin
	kAxGE005U1ZlVp0hMRcXiAVDo9rCYoNdGMcj60e4zbEfEYL/Cxo6+gJZ11JXQhqfMTU0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4zZU-0006Ef-SM;
	Tue, 24 Mar 2026 11:05:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4zZT-0006EO-4J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 11:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g0UN/prV9YzKJSDlBaEmx/wjiLLkXAyZ41mNnSrZGzc=; b=mcQCE2lquCS3Ua/0046NP1xpzT
 YILsEJ+COv8hUwfDNJHJ8BuYtGibYIgGuAmyEzuBu6MFSm8Pu0lS09H0zmtDreo6IfqJjfFJ/uJvx
 hv1B433wyrCi6GFgwlK5Ee+RjM7XVXG+FtiH/p6wnm+067OsWKqiEahdyb1dW4x5Y1zM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g0UN/prV9YzKJSDlBaEmx/wjiLLkXAyZ41mNnSrZGzc=; b=lAnzD+ynzZ3rYO05ApN3ccFcvJ
 d8V9ROf+UtkC5+1JD/7uB8sPpPTOsR3f2ix1hLXZ4DJImEUHV9ZOzjTsNGwVfQ9BG28dMFYQ6cso2
 Zmhh2RYAf3NmHu1trr5LsELidzRjSEMUm2IGYMg9Gl8SAMKD/rlUsR0+PbU+rcCbrR+Q=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4zZS-00032x-HB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 11:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38A7D43F96;
 Tue, 24 Mar 2026 11:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCEEC19424;
 Tue, 24 Mar 2026 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774350309;
 bh=oFb+8yszMhN5W0y9sy81VMtEO1CbdN3Cr91HykJhTiU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PN96hl/2z5jpe7vRMgCJiBl1DZMErzBgWed9Jb4xg2OEe0iC/dg/tKn2Sa3dKYp4K
 6dFDlYmtFR1oFS6a8gu5Tb1AGxX8Sy/rukWeIisFtvMF5yPOqYA54m4TZfQ5PogxQP
 yCMCVUXzCeuKBzttqSlI8qrgMddUgltpWaoGDinDvEf9nqAYPK/KMfB0LDPZ+1pVDt
 Wl1KEh6TzJeaVbHezcpJgHFm6sIsO5iHfoNPZl7RIG/qPVajgtI8NiIMuPC8K4bwUI
 +gHTqe9mBqSawOgF7okpmPbpnlhNH7GQqLb0LordXhI+n4xZBXXriltefNvx8B4xYa
 UYiiBLELG5goA==
Message-ID: <7813a041-13e7-4e4b-9b5e-16f4e83252d4@kernel.org>
Date: Tue, 24 Mar 2026 19:05:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260324094707.3959420-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260324094707.3959420-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/24/26 17:47, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Neither F2FS nor VFS invalidates the block
 device page cache, which > results in reading stale metadata. An e [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4zZS-00032x-HB
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: invalidate block device page cache
 on umount
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 06FE8306F92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 17:47, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Neither F2FS nor VFS invalidates the block device page cache, which
> results in reading stale metadata. An example scenario is shown below:
> 
> Terminal A                  Terminal B
> mount /dev/vdb /mnt/f2fs
> touch mx // ino = 4
> sync
> dump.f2fs -i 4 /dev/vdb// block on "[Y/N]"
>                             touch mx2 // ino = 5
>                             sync
>                             umount /mnt/f2fs
>                             dump.f2fs -i 5 /dev/vdb // block addr is 0
> 
> After umount, the block device page cache is not purged, causing
> `dump.f2fs -i 5 /dev/vdb` to read stale metadata and see inode 5 with
> block address 0.
> 
> Btrfs has encountered a similar issue before, the solution there was to
> call sync_blockdev() and invalidate_bdev() when the device is closed:
> 
> mail-archive.com/linux-btrfs@vger.kernel.org/msg54188.html
> 
> For the root user, the f2fs kernel calls sync_blockdev() on umount to
> flush all cached data to disk, and f2fs-tools can release the page cache
> by issuing ioctl(fd, BLKFLSBUF) when accessing the device. However,
> non-root users are not permitted to drop the page cache, and may still
> observe stale data.
> 
> This patch calls sync_blockdev() and invalidate_bdev() during umount to
> invalidate the block device page cache, thereby preventing stale
> metadata from being read.
> 
> Note that this may result in an extra sync_blockdev() call on the first
> device, in both f2fs_put_super() and kill_block_super(). The second call
> do nothing, as there are no dirty pages left to flush. It ensures that
> non-root users do not observe stale data.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
