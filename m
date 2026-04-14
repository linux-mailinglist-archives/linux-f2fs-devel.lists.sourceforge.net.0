Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI3LDmDz3WmMlQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 09:57:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9C3F6D01
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2026 09:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CxDRJGQq5GR0PVh180hetB0M7CNlPtoaQGO/AjW5VE=; b=e4kALu2cJm6uM9NS55JoX80qgv
	qah1OsQBGKIhwH1S+n8US+LAYabOM8VfZ/R00QfVXmetyhmfKpIlAHue2NJDy+okMh24UWskM7Nf/
	n2irVFGPEbNm0qlyf2RoNGX5z8Pr8MsZ0kiuKgKAUBXRjObtMoMi2nLH7xy0RumPyKY4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCYdy-0000JT-W5;
	Tue, 14 Apr 2026 07:57:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c83a8b98330cc0662794+8269+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wCYdx-0000JL-9u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Apr 2026 07:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3K7FttOvq8iXxufEoa5R9Agqd7XYyOWbVVEycm3fGI=; b=F1h5Cee9KMPN9XD+a3hOkXpFUO
 xueaG+KQxxnm1DLy3u7RzoHEasYRD6EPzoX5PJ07LG0IRFtd3V/NFDT+rdFqu1cL99Ge3kfJflfJ6
 bvJ6CghW6KZIKBgyC4Kv5C1f480g0sDhh+hePQxwShh8I4TjbrXiNpLRtr/aajyBPYq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F3K7FttOvq8iXxufEoa5R9Agqd7XYyOWbVVEycm3fGI=; b=QF4Q8z3XWv7g3eVpmvrSJTxHGW
 WYTc71gCh+eLu0spxeVJIRtJMCApZAPVFoNyIVF3pkXDxjUYUBxTf4s7XGUdNtQQj6JvpJeg89CrT
 d3yj/5W725xHMkQ+czCCOL1YO1MAp8yzJZB2GGtpig/MTEKdASf7bXwcwFRdz6BU0elU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCYdw-00029t-8s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Apr 2026 07:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F3K7FttOvq8iXxufEoa5R9Agqd7XYyOWbVVEycm3fGI=; b=vbCctZ39PPVVgUPC8arCrwuVoB
 T+V1r5AQpU/xk0QwQB/NmGZC0H0W3YW1Mc1vEiivmGxacR3doZXOiZBxF2B3kUz4+acPZumNK6bXb
 D1cLfDAinsfGLBCCmzv38NcuB3xADnlCAThmAcrYKd5gamw2g0q2CGJ2iXJRBLHgQ3IUmPF4pnz3Y
 GqS0Uxuo5dlXDEM03O0aY4cmRvEFHQpMzqg5iuARTQYsW8y8a9sO4//exZDULxuTOet3FGuvrZkAR
 1rrdZir74g+oW0eJ5NJ3VA5TzW0jp9re6q6jBa6Iq6tEy0cZnDOxJyD8nsziRcLYWI8VezJAtl/qQ
 /Z1T3QrQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wCYdq-0000000Gvhm-1Tus;
 Tue, 14 Apr 2026 07:57:02 +0000
Date: Tue, 14 Apr 2026 00:57:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <ad3zThMKaWZ65XE2@infradead.org>
References: <20260410131821.991005-1-jprusakowski@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410131821.991005-1-jprusakowski@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 10, 2026 at 01:18:20PM +0000, Jan Prusakowski
 wrote: > F2FS uses a checkpoint mechanism for metadata consistency rather
 than a > traditional journal. Roll-forward recovery is only needed i [...]
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wCYdw-00029t-8s
Subject: Re: [f2fs-dev] [PATCH] generic/050: handle f2fs as nojournal
 filesystem
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
Cc: wqu@suse.com, anand.jain@oracle.com, zlang@kernel.org,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:jprusakowski@google.com,m:wqu@suse.com,m:anand.jain@oracle.com,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid]
X-Rspamd-Queue-Id: BCD9C3F6D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 01:18:20PM +0000, Jan Prusakowski wrote:
> F2FS uses a checkpoint mechanism for metadata consistency rather than a
> traditional journal. Roll-forward recovery is only needed if there are
> fsync'd files since the last checkpoint.
> 
> In this test case, files are created without fsync, so there is no
> roll-forward data to replay during mount.
> 
> Therefore, F2FS does not need to write to the device to recover, and
> successfully mounts on the read-only block device. Thus, it should be
> treated as nojournal in this case.

This looks ok, but I always wonder if we want an opt-in for this
"journaling" behavior and/or define it clear in common/.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
