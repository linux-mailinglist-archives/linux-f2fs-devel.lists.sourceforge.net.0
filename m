Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8PsHX25S2r2ZAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 16:19:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C2711DDF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 16:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HEXI97ny;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=kdoXCGwd;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="EEqH/2FX";
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=casper.20170209 header.b=Y9KfOoib;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojbRSxHrLfOwNXIcJKzDEbSExfE1muFDAS1WbsmXgNk=; b=HEXI97ny/9U4J/3DUhcvEZ7ARx
	ht0vShIVGSBYyxqxScR/0V2qLAfIHLT43bU+8gaPUKtNWmo2rocYP+8KIF6iWLsf31Xz+FdwcBF2V
	tKsyrowowNgf1P+KanRjSjdnkGPRXfdBS0GDOp0v1Ke8MxrWxPKh8LL7k3o5wNCYWfV0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgkAM-0001m1-LF;
	Mon, 06 Jul 2026 14:19:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1wgkA8-0001ln-Qe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 14:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xruYhMX6XX22knH4dR2Q9nFX7MPsNbx/yLiH/Ump/1U=; b=kdoXCGwdTgCHfTYFCGCBq8F3LQ
 mLxnoIXFF7M5+vXSBw1BQK8XE2b2S79ktmFPAngyIRI/z2x1cmayPZlSkiB1HlEeaXTf5z7xL9BER
 7/r/bqCwNWQUZTHBQYt01dy+mYa5H44vs8oHbi4kY5Wb9NBlTknJjwAGVHgtosgDEgXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xruYhMX6XX22knH4dR2Q9nFX7MPsNbx/yLiH/Ump/1U=; b=EEqH/2FXjjIHCZ3iaRcq3GLzac
 9Kqtj3zOv3uFsxcwg/N57/wcjzInCYmSZ2XrfkT/4lxmDzcgwZ8CIdomYzbAr6uzei14H9tobYPe/
 VGPd3d0HFILUK1U2SYXQG/kLIweijFOmjotQcKp568/HWfwy++seOV33UpAnWTSkJMCM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgkA6-0004WD-CZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 14:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xruYhMX6XX22knH4dR2Q9nFX7MPsNbx/yLiH/Ump/1U=; b=Y9KfOoib1Cxi1vPI4E9MKAbpaL
 zUimUmxxxnEFvcRVDHoq2WN6qYt83bSRv25BZnNBYgw9/40exA4r0KvD8DoiCGndI9Ri23a6Tqvgp
 a3f5LsZBXda+ghWn6mDW/Ib3EDFnV1aHAi6WV6npGGn0NQ+ggTWCDupfipShjNV8txupcq14ArTDI
 PSLdfa76k00085yPi/DkRuPi5uwGjMsOAzQDqSZbnwdnPYGgVP3GYbs03MBtEfqvUaMHImxzcVhln
 JwQ3D5o5lGyCIKLqGPagTmvO8Bps2EejvgUzdSAbzQCvX6xtY84uFynv9tz/JxTw5k7v2GNwgh3lw
 NdLKlDQA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wgk9v-0000000G1qi-1F2s;
 Mon, 06 Jul 2026 14:18:55 +0000
Date: Mon, 6 Jul 2026 15:18:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aku5T3TYNMDlJMns@casper.infradead.org>
References: <20260706095943.2560208-1-chao@kernel.org>
 <20260706095943.2560208-2-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706095943.2560208-2-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 06, 2026 at 05:59:43PM +0800, Chao Yu wrote: >
 FGP_NOFS could be removed later, let's use memalloc_nofs_{save,restore} >
 instead, which is recommended to be used to avoid potential deadloc [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wgkA6-0004WD-CZ
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: quota: use memalloc_nofs_{save,
 restore} instead of FGP_NOFS
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F7C2711DDF

On Mon, Jul 06, 2026 at 05:59:43PM +0800, Chao Yu wrote:
> FGP_NOFS could be removed later, let's use memalloc_nofs_{save,restore}
> instead, which is recommended to be used to avoid potential deadlock
> when memory allocation in f2fs_quota_write() will call into filesystem
> interface again, e.g. .writepages, evict_inode, shrinker due to
> complicated lock race condition.

I think we need to be clear on why we need the memalloc_nofs_save()
call here.  What problem would it cause if we did call into the
filesystem to reclaim memory?

I suspect this is the wrong place to insert this call and it should be
near the lock that causes the problem.  I've attempted a rewrite of the
memalloc_nofs_save documentation; let me know what you think:

/**
 * memalloc_nofs_save - Prevent recursion into the filesystem.
 *
 * All memory allocations between calling this function and calling
 * memalloc_nofs_restore() will be prevented from calling into filesystems
 * to reclaim memory.  Clean page cache memory can still be reclaimed,
 * but (for example) inodes will not be.
 *
 * The primary reason to do this is that the caller has taken a lock
 * which would be needed by FS reclaim.  While we could theoretically
 * call into a different filesystem in this case, it can be a deep call
 * stack so it is better to avoid all filesystems.
 *
 * Filesystems often choose to incorporate a call to this function as part
 * of starting a journal transaction.  While not a lock in the normal
 * sense, it has much the same effect as nested journal transactions
 * are either prohibited or expensive.
 *
 * Also call this function if you need to allocate memory while holding
 * a file folio locked.  High order allocations (such as those requested
 * by slab) can trigger compaction which will attempt to lock the folio.
 *
 * Context: This function is safe to be used from any context.
 * Return: The saved flags to be passed to memalloc_nofs_restore.
 */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
