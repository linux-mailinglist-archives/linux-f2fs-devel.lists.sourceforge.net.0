Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AiWFJbVAmpXyAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 09:24:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F287F51BC38
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 09:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j+o7oD+ZAwr8l4OsqpVRM4gpnlae4bJs51q9DBSqNg=; b=HI2zj7YkKKegIBSPrQ6glEuEp/
	UIjGgUbsAAyvfZux8ISwxsPOQG2WxDZkpzjeJSUayzom41FxH+CSftq6xPVk9k3i3VONPmpRql2EI
	i9aAU/3g896MVroFqrZTwNCnRt6bQE1aXh5ScLg0/SSw6XGLUaxGOiD5I3Q1/BowAXjA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMhTB-0003ot-6R;
	Tue, 12 May 2026 07:23:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1wMhTA-0003on-I6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 07:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BU2y59SqFukqO7Luqv9lSeOSHObUdXJCRb74gvCvzQ8=; b=migCcJP8aebhXSm4PKvFFmxQDm
 nTFImzdQE+7vn9uxa+MfpQ+4xgpe3Wo+qGKABKB0gxsNpsCicb2lJeozsHXv/Aj7mJLlTjrYxqEkW
 eQgUKoOCtQXLkizeisZBWFPSWJ70XlNsEULlIBmxGUIjfVa7t8uXtvvAGztDpaZ5LkG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BU2y59SqFukqO7Luqv9lSeOSHObUdXJCRb74gvCvzQ8=; b=C2acur5PgRKER2kDk0XOxlQm0n
 vlG9tnRv4VF/EExFxAlmNruwa8eysvf9daPpO2CHHw3Sm1yP7Gjvm2MedQHz4VbbL7WR6Gg654EW+
 R0zAesaEJPYYcyRDpotHLGkBR+AiaMftBnDCTF8A+ctRpBlYyK/S8XdeonQFTq+2N4KQ=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMhTA-0001wT-7u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 07:23:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E305568BFE; Tue, 12 May 2026 09:23:47 +0200 (CEST)
Date: Tue, 12 May 2026 09:23:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20260512072347.GA32756@lst.de>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-8-hch@lst.de>
 <217f91d9-4d5f-47a6-ad20-0404968b8e08@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <217f91d9-4d5f-47a6-ad20-0404968b8e08@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 12, 2026 at 04:21:47PM +0900,
 Damien Le Moal wrote:
 > On 5/12/26 14:35, Christoph Hellwig wrote: > > Don't blindly pass the value
 from the swap header to swap_add_extent, > > but instead t [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1wMhTA-0001wT-7u
Subject: Re: [f2fs-dev] [PATCH 07/12] swap,
 block: limit swap file size to device size
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
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Chris Li <chrisl@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, linux-btrfs@vger.kernel.org,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: F287F51BC38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dlemoal@kernel.org,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:hch@lst.de,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,lst.de,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email,lst.de:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:21:47PM +0900, Damien Le Moal wrote:
> On 5/12/26 14:35, Christoph Hellwig wrote:
> > Don't blindly pass the value from the swap header to swap_add_extent,
> > but instead the device size rounded down to page granularity.  This
> > activated the sanity checking in the core code that catches a too large
> > value in the swap header.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Looks OK to me, though this maybe could be folded in the previous patch ?

I prefer to keep behavior changes as isolated as possible.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
