Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDKxFH5SEGodWQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 14:56:30 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD95B49D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 14:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBnYD0Mv7cmJQ7EULdnOdg0/C5MTIswtmKf+xaI7qFU=; b=MujtmeL/S5RSI9E1v72fRxGMHg
	qWOUsfmNGXMa3Yf1M0ywDR9FDI+DoYFuNrGu9QUWYdbWo9GAVXei1wUwAg+0rbWEb5q7jAIZSWnpi
	eiPiDGU597PW0txHvbIkIgmWVuy+cWyWe+RMBJ/QU6W19GSu091hMk0OPA/+vswXy+B0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQPQK-0001DT-69;
	Fri, 22 May 2026 12:56:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1wQPQI-0001DN-NS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 12:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GJRt9Lpuwesly2s9mn+jBQgZQVuZWSioljyp5VarGsg=; b=jX/hb3M6hDLhVhW7NTy+aqE65M
 KMQwNacp2/7mDPsiREt3b9x9yf3c70o4GYr/dfb955fLY6hErf77wz5V2kB3h3RR+UATmp1L/RHug
 k2UouRvWMoHNWHUTBXowD3Unyl6EzcgFPtMIRqdSU5NRkWrFK/DbTr871VuV3WtJkznk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GJRt9Lpuwesly2s9mn+jBQgZQVuZWSioljyp5VarGsg=; b=WD6xBWw0nxFZwfUUBU5TCSuTGU
 TEtaLkBJ7IBIqXD4xli1C/6zs5Sq27LWhKAlbtPTIpzCLpaGbQqDHc0IkW79cQNaaQnJfhjzV4D/u
 /04bpoDU9nWS5/b3tYnrcfX1VpmreNVIV1FMTJw4QHEk6TLw5zXqVCi812gxrP+EcfJk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQPQD-0004qy-Ii for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 12:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GJRt9Lpuwesly2s9mn+jBQgZQVuZWSioljyp5VarGsg=; b=XvONFtj/OYXrdj+0CGgw20dTEG
 RY2jeN/WZcKK38rmHxiRjUt+SntpeA8EPhwp2eWQWftIp/acL8AUxIddJ+0Qpiy+TLiwpATROeCSo
 Fs8dFNF5pwkTnR8BnpYnT1ogZ2D4SQiq/XJ/cQlURwpKK+ui/LLoaO9oOVEQE/K2K3XuLXS3K9dTC
 Zw4aVVXiNdo4g11gW8T3dKmIDul5g8DUK/ZAhtr+ArwedNMhdliuq3YawrBCctxlDVIeoH478fdCF
 3c5teZhzX197GPxz/qNKg4LapdHnk4Ok9Nta/gHolWI0GTNkbg16dMhpolPgBSuplVd/zsQQPhcqZ
 hutvFDhg==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wQPPz-0000000A6hF-37gM;
 Fri, 22 May 2026 12:55:59 +0000
Date: Fri, 22 May 2026 13:55:59 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ahBSXyOi9b1jxNkX@casper.infradead.org>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag9D6_7dttbDGHZ6@casper.infradead.org>
 <ag_UsW_OrlXD9dWX@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag_UsW_OrlXD9dWX@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 03:59:45AM +0000, Jaegeuk Kim wrote:
 > On 05/21, Matthew Wilcox wrote: > > On Thu, May 21, 2026 at 11:57:48AM
 -0400, Theodore Tso wrote: > > > So let me get this straight. This [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wQPQD-0004qy-Ii
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
Cc: Theodore Tso <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: E5FD95B49D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 03:59:45AM +0000, Jaegeuk Kim wrote:
> On 05/21, Matthew Wilcox wrote:
> > On Thu, May 21, 2026 at 11:57:48AM -0400, Theodore Tso wrote:
> > > So let me get this straight.  This is a magic xattr interface which is
> > > not even persisted in the file system, but instead sets a 32-bit
> > > bitmask in the struct inode which disappears once the inode gets
> > > flushed from the inode stack.  And it uses a generic xattr name,
> > > "user.fadvise".
> > > 
> > > There's no way in *hell* any other file system is likely to adopt such
> > > a broken interface, so why didn't you just use an ioctl to set this
> > > magic f2fs-specific flag?
> > 
> > I mean, yes, this API is horrendous.  But it's just another example of
> > f2fs thinking it's somehow special and not just enabling large folios
> > like other filesystems do.  This hurts everyone, not just people who use
> > f2fs.
> 
> >From the production viewpoint, I raised a concern on setting large folio by
> default, since that exhausts lots of high-order pages, which were needed for
> essential system services and critical apps.

Random fears or actual data?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
