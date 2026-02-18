Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KaQE9JQlWnBOQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 06:40:34 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0415325E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 06:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5pWaR1MX3YD3vWovxDx77MdgXjw6qkdDbS6vNO6wjY=; b=dEE6hLeZ2z8uKyDSqJggX22JM/
	4ijNzRTHM1ljoNzdGVh8xhypzjHRl+hbXFlXJ8Ca9TTkUDO6yv/8HSGYpUkzysH0zq1t7VxpPDh7e
	UUx3RSxubxMy4ywP3NS1FwXPcYr8xLITCvugy7nsHDyVC+8in7RotMU9O/RmN4eAjaeM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsaIS-00033l-QM;
	Wed, 18 Feb 2026 05:40:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b7a6f314dcfbee4e7dbb+8214+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vsaIQ-00033U-SU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 05:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1jlxD8osAAxmiNkGQAgvylVgW1b45QP244UBWD+dDVI=; b=RESrawaJSWsSPpH2qYkSPaaln8
 MdUSnhwZP7MCBQRZG0fNXqB3+JAIti0WwhAryHg7wjZk3iswvMA7CBEG1K4NRmr7YzfSuL+YVocZ/
 grDAbyTa6+ud6oAsA3d2+bISMCXKDDXBwDTSI3F81wpHItH2jBqrUGQiaAZSvITpdc9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1jlxD8osAAxmiNkGQAgvylVgW1b45QP244UBWD+dDVI=; b=NkXYI2Apg5H4xn1nJX9GisnyjJ
 ESIWWMKmClKVUMis8H1LQ1if8QKEEkrZY71x269RJbfzwY0h0dk6vj7bbfnSGv4Ud8laah3g40uNr
 8CQb5ZGOrgBTPVF9OMUiBX6hOCA9kfZDEN2LZDKozq/JlsXNtXI5UpIfdezpnL6lnj3s=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsaIQ-0005L9-Lj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 05:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1jlxD8osAAxmiNkGQAgvylVgW1b45QP244UBWD+dDVI=; b=2qfKRofsyFv8MIIk3wyJ7cwYm9
 Q8y22c8jWANVoHmrd2H+xlQxGoXDV9e2IPbmmrr2T4Mt+I+PNt51RulwEU+ydQJVWybsxLS6AEAnd
 RWUqoCCSIxuQpAIeAFzeq8tspDvP8/NSJXS+8U6Dip8A5Ny9FxOzUHKJKsZQ0RGAjumKbFpkIihCp
 6A30PlqYNASbJiZlpzxVpTCqGq+I90Cndg4172NEVwUW235MQN0BG4ZgbaKkKfdw7+118TugqgkGE
 ydyHMQWAZ6Jwo0J6sAZdQm68AI8NqMZeZzoc237S30Uf/tnDur9p0jzYeBqKGpYeZVsRISvVsbtbz
 jsPFWh/A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vsaIF-00000009KQo-3RdA;
 Wed, 18 Feb 2026 05:40:11 +0000
Date: Tue, 17 Feb 2026 21:40:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aZVQu_1z_Z_0mQMx@infradead.org>
References: <20260218012244.18536-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260218012244.18536-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 17, 2026 at 05:22:44PM -0800, Eric Biggers wrote:
 > hppa-linux-gcc 9.5.0 generates a call to fsverity_readahead() in >
 f2fs_readahead()
 when CONFIG_FS_VERITY=n, because it fails to do the [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vsaIQ-0005L9-Lj
Subject: Re: [f2fs-dev] [PATCH] fsverity: fix build error by adding
 fsverity_readahead() stub
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
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:lkp@intel.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: D6B0415325E
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 05:22:44PM -0800, Eric Biggers wrote:
> hppa-linux-gcc 9.5.0 generates a call to fsverity_readahead() in
> f2fs_readahead() when CONFIG_FS_VERITY=n, because it fails to do the
> expected dead code elimination based on vi always being NULL.  Fix the
> build error by adding an inline stub for fsverity_readahead().  Since
> it's just for opportunistic readahead, just make it a no-op.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602180838.pwICdY2r-lkp@intel.com/

Pretty silly that we need it, but looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
