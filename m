Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NIiMsg/kWk/gwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 04:38:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CF13DF50
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 04:38:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqq0uH/mP9XhROk5KtWOi82jjyyt7Hra+hDX8vfDHxo=; b=RZTvufqf2n5oPEddcpD8RpO9jy
	rCwYtTxleW5VxGYaOD3sP4hxc4C4kdTZ0o7f/zSd7oobge1KRi1Av7X4CmjBAqzxs0TXI9eKDPtov
	eDODUvbRQTVTIYmQcU4wIPKsjg8KSpyAkqsUPWEhpEevpl6oAWqEc8L9XyC2v6Rcf3S0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrSxv-0004kn-Fp;
	Sun, 15 Feb 2026 03:38:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vrSxt-0004kh-C6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 03:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0gpfc51mMBICMZmGSyQ+Dobd2xh/Dm49e3wlNSsja6E=; b=TeVjGfSM2eUnzLK2dhWK+2oh0n
 RAlqysMEe8tUgq/vKULMIkfsdnWghYgymB+ZbifPM5uz+pARCYCEwxvaIc7+fH+sz1j+YvrCNK2Qj
 7oxEdmhuRR0IFtEWITfy02zLy+qJ2W1cCckB2emdHyA6kA7bkUVhDBqppZEu03SUcW2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0gpfc51mMBICMZmGSyQ+Dobd2xh/Dm49e3wlNSsja6E=; b=RYVzYT3KyCskLxyCi7bvFltoHy
 cd7t0Vi7HyTigTurcEBt1487ZYNnvBgHghMeqkGTJHy/J/6r6K16v9uu82yIiXyJjpVXwO6KTcKeB
 N5dDvXPjo56qyYMB6TGN+YNULG2eZVbmW008voJQ15sJdzIWbkbA31ERFUgLkYlPxT/M=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrSxs-0006xK-Bm for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 03:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0gpfc51mMBICMZmGSyQ+Dobd2xh/Dm49e3wlNSsja6E=; b=TJkrfu6eJ/FrKsuZAPyRl83W5f
 QzHLP50urhisoeJ71skSoKTB7AWEBZPqp7KUIgsVrWg7sy+dlAZdPxqDCzYuT8GktAv8Y5gqiQxeE
 6u4J1eomKJ/2B5nWKYIYUFjg62rdwy4Wp1hnc8qCdB/GfmKRPloI/eXTk+zy5UqhVvHfNArJI/j/3
 p7+KTrSTghBKAgpdHrRVRu6HWianl3SdbEkPH/n5/ZmMsxf5aKtzwor3/NEhsPFNc0KYINvZ1PiDz
 bSg6aFXqBxb7vD4znouXWRu/tu5TfuvxqoQhuLQptAiK5FrCiCmod2RGOB1AilU8Uf/rr9ZXPP4ep
 YyGAGBDw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vrSxg-00000000WIy-1ApT;
 Sun, 15 Feb 2026 03:38:20 +0000
Date: Sun, 15 Feb 2026 03:38:20 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aZE_rKsOAgYqTjZ_@casper.infradead.org>
References: <20260214211830.15437-1-ebiggers@kernel.org>
 <20260214211830.15437-2-ebiggers@kernel.org>
 <20260214215008.GA15997@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214215008.GA15997@quark>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Feb 14, 2026 at 01:50:08PM -0800, Eric Biggers wrote:
 > On Sat, Feb 14, 2026 at 01:18:29PM -0800,
 Eric Biggers wrote: > > +++ b/fs/f2fs/compress.c
 > > @@ -1811,15 +1811,19 @@ static void f2fs_ [...] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vrSxs-0006xK-Bm
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use fsverity_verify_blocks()
 instead of fsverity_verify_page()
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 4A2CF13DF50
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 01:50:08PM -0800, Eric Biggers wrote:
> On Sat, Feb 14, 2026 at 01:18:29PM -0800, Eric Biggers wrote:
> > +++ b/fs/f2fs/compress.c
> > @@ -1811,15 +1811,19 @@ static void f2fs_verify_cluster(struct work_struct *work)
> >  	int i;
> >  
> >  	/* Verify, update, and unlock the decompressed pages. */
> >  	for (i = 0; i < dic->cluster_size; i++) {
> >  		struct page *rpage = dic->rpages[i];
> > +		struct folio *rfolio;
> > +		size_t offset;
> >  
> >  		if (!rpage)
> >  			continue;
> > +		rfolio = page_folio(rpage);
> > +		offset = folio_page_idx(rfolio, rpage) * PAGE_SIZE;
> >  
> > -		if (fsverity_verify_page(dic->vi, rpage))
> > +		if (fsverity_verify_blocks(dic->vi, rfolio, PAGE_SIZE, offset))
> >  			SetPageUptodate(rpage);

Yeah, no.

		if (fsverity_verify_blocks(dic->vi, rfolio,
				folio_size(rfolio), 0));
			folio_mark_uptodate(rfolio);

> >  		else
> >  			ClearPageUptodate(rpage);

This never needed to be here.  The folio must already be !uptodate.
Just delete these two lines.

> >  		unlock_page(rpage);

folio_unlock(rfolio);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
