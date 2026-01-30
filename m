Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMsnE0hGfGn+LgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 06:48:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E1CB772E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 06:48:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE93E1XpfTVZLzp3ttz8A4kp4zUE+ikh4mXdf2c5sww=; b=BsMxch7ztYPLr8JFl1WivYrhXH
	mXK20l2NTEW4g+Z8/AgJRuIo06AP6jvueM/GPhM6+argMnrxZuc0AYnnHOz9h6jZoe8pPNUa0Lncr
	6BZorg2zv1cXxKh0skaAzehWw0BTF/TxYxajQvGraZabyplcpKFCH2WiYypGoaNwHFJ4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlhN6-0000db-3G;
	Fri, 30 Jan 2026 05:48:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vlhN3-0000dS-Cn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 05:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uIZ4FgjPpBtxEJieDWo+YXJaGh8LsG4MzQMVbui02nc=; b=ewTqSsqO6oKsg19OoCdUeEKfyT
 9Xe0YdpZeVJfuKtSp8y1jPt4X11xnamDG+TrZ8v3T6KJmkMgtEEg/dwVUre99bDSgfPndrrzxHNy3
 MGnrNKOanWcLcen+vOb+rliCfl8obGOgl+j2HrfBMH3LiQVt/vdKY5D8AbxxbqfBkup0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uIZ4FgjPpBtxEJieDWo+YXJaGh8LsG4MzQMVbui02nc=; b=eLW+2DdHIAp/DS64wxUnohtzG1
 TBTxaWrJzt+bWOYuKHwHW7Oxpesy2p3Y3ZQcx1fJ9q44j9TJcL6zbuKk5liu1Dv8m4ml3oRGgmTT3
 jmbVTsJESOcDzsOcHXPlwxNHheblLH6qiXvFGMWC+I7UdYJY8LtU/I9FY46dUwf8qubE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlhN2-0001iu-94 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 05:48:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 20A8268AFE; Fri, 30 Jan 2026 06:48:32 +0100 (CET)
Date: Fri, 30 Jan 2026 06:48:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260130054831.GA622@lst.de>
References: <20260128152630.627409-1-hch@lst.de>
 <20260128152630.627409-8-hch@lst.de> <20260128234814.GC2024@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128234814.GC2024@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 03:48:14PM -0800, Eric Biggers wrote:
 > This patch is still incorrect: when IS_ERR(folio) && folio != >
 ERR_PTR(-ENOENT)
 it falls through to folio_file_page(), which crashes. > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vlhN2-0001iu-94
Subject: Re: [f2fs-dev] [PATCH 07/15] fsverity: don't issue readahead for
 non-ENOENT errors from __filemap_get_folio
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid]
X-Rspamd-Queue-Id: E0E1CB772E
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:48:14PM -0800, Eric Biggers wrote:
> This patch is still incorrect: when IS_ERR(folio) && folio !=
> ERR_PTR(-ENOENT) it falls through to folio_file_page(), which crashes.
> See https://lore.kernel.org/r/20260126205301.GD30838@quark/ for a
> correct suggestion.

Sorry, I missed that part that only applies to the version after this
patch.  Fixed now.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
