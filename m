Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDKtMPN8G2pNDgkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 May 2026 02:12:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4E613F97
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 May 2026 02:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmzNjlN3NEw6gn5b/rArppdMSxlD29ufp9dsFDu4CQQ=; b=L9vYf8eek6znHW0XusXFAls3Ph
	cNunJTs0oiJBRd4+T3m17EcEnr49TVNM+JJyenFrVcchXemkkWhBFwOplaDSXrIA7T/uqUy/XdrrJ
	lYBXSmMN7S/MRR6k1jwEps6Kc6wut60AGCWta43bXagn8GEYayADYVjMYy8vRsj1SfK0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wTTmw-0002Jm-OL;
	Sun, 31 May 2026 00:12:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wTTmv-0002Jg-8O
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 May 2026 00:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYvRVj4ATb1VjPqyrKnbeBCWG0iaq3Bc8et+a/muwak=; b=TMKki/0qrLSRxPth9U6mdfIrwZ
 PxZPLzMG50cixZTNvBjqwRrorAp0ZUqiVbqTeY2HGS/1kLciCzUr03oC//WGxXPYDVo+EWx2pBahd
 3mUt9rE9COb5YQ1U8D38Q95yasqV6QFb5bgttpvXA2L8duXZZat8LsnXqYZ2POTzZpKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYvRVj4ATb1VjPqyrKnbeBCWG0iaq3Bc8et+a/muwak=; b=OIm2xLNMvZVR+OJaL1X4jUuIyV
 hsMARmS+GrebxIVupdu6LyVxbMOOIxwIiyDqGMIkS2pSRQIROBQKyHKaUQB4dk9afVYIk99LGDhiP
 LgT4uDq3y5/nJ8k9WJiZkO3WiHdfIx2zSxwF21mNl1zvOlNkh4BaSUE3YD/Tcmj8q008=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wTTmu-000688-A4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 31 May 2026 00:12:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FFDB6001A;
 Sun, 31 May 2026 00:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C321F00893;
 Sun, 31 May 2026 00:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780186329;
 bh=OYvRVj4ATb1VjPqyrKnbeBCWG0iaq3Bc8et+a/muwak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fHOhsAuR4ScpU7RKty78SP/q0nx98PvpFWPIMukzAHEP+/dxNLJI95BYxZOkZRH8b
 0vvtGETBPj6snAsl5sZla2ANtjpOu4hsZ5T9xZfqKEMyFTJ+hOr94AJt2anvzGK+2I
 UUkR+VjHrS2bRTK7MRYAYRcbwjVawM7kdJGKgjfyVuHrHvzAsPTa4LYjInu5Z7qURl
 uNsap2grrmNTO60WkFlgwkIZCj4q1gkDfjY+QhvWLXJjz4UkmrfX7fYLTkcA4ucLZJ
 K8wxewMF4nOOu52EePN9R+PXM0YUBOJ2WgVAEF3VTJ1jlevVgFJhgTDaF6fDHUvvrK
 pcE0/tyMGqKtg==
Date: Sun, 31 May 2026 00:12:07 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <aht812OhSPFqIBPK@google.com>
References: <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <f4e521ac-2381-49ca-8dcc-3cb3cf3ffaea@acm.org>
 <ahaPDHiXcJoVShPv@infradead.org> <ahcU5xbVy7xjps02@google.com>
 <ahkl52N3RDcusCNd@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahkl52N3RDcusCNd@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/28, Christoph Hellwig wrote: > On Wed, May 27, 2026
 at 03:59:35PM +0000, Jaegeuk Kim wrote: > > F2FS merges bios before submit_bio,
 regardless of small or large folios, > > since the block addre [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wTTmu-000688-A4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:tytso@mit.edu,m:bvanassche@acm.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: EDE4E613F97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/28, Christoph Hellwig wrote:
> On Wed, May 27, 2026 at 03:59:35PM +0000, Jaegeuk Kim wrote:
> > F2FS merges bios before submit_bio, regardless of small or large folios,
> > since the block addresses are consecutive. So, I think IO subsystem was
> > working in full speed.
> 
> As does every other remotely modern file system.  But that merging is
> surprisingly expensive, which is why using folios gets really major
> performance improvements.
> 
> For one doing these checks to merge touch quite a few cache lines.
> Second, devices are often a lot more efficient if they see fewer SGL
> entries.  I.e. having a 1MB bio a single SGL tends to work better than
> having 256 of them.
> The same is true in the kernel code itself, both in the submission path
> (dma mapping and co), and even more so in the page cache handling
> both before submitting and in the completion path.
> 
> See Bart's patch about how long the walk of the bio_vecs in the f2fs
> completion path can take.  We had similar issues in XFS even in the
> workqueue completion path due to lack of rescheduling, and these simply
> go away when you do the folio manipulation in larger chunks (LAZY_PREEMPT
> would avoid the need to explicit rescheduling these days, but that just
> papers over the symptoms in this case).
> 

I see. That's also super helpful. Let me kick off the large folio support asap.
Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
