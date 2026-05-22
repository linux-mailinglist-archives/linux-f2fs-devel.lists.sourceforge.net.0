Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HxXGd7bEGpaewYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 May 2026 00:42:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9627A5BB32C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 May 2026 00:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQ/bSoMDSqTXXXhpziYQ9IcWsbmXQWXSclZ+xtxqMK0=; b=lO2yNb6GSG5ybZL1xLM+aD4xk8
	Li2fWmH05z6K50Tu/IP++osSOSrIyo4kZnvJIzL7XiIFDRejz7wJlRsricK95MGz24IMAWTUbGRNn
	C8qRJW1J2bmOf585njuu1TedJ/1zzbtDLUijXrHhEYQNIUKD8s5x0PvTzL13pmi0mIok=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQYZV-00054M-PG;
	Fri, 22 May 2026 22:42:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1wQYYy-00053d-1W
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 22:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKk+R/Gk87+i0eU1luqUgLxjRP4P7rgGxNJYbCK1vPs=; b=IBT7e47Cg46q5b9FQeAbZ3Fj5k
 ZHW895TnwmEc7AuVW4kFS3VCQpZXNFtdPpfTMq/SFQFTA4QcrNYQrnrP0VA6FWSKFn+wg/kHhNu+R
 kL/43u/mThP7nUTPSyaeCjNd3gZe0KxLyy/QiRDFFBXbnEh4PasI/wAWamDDVDutiY50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mKk+R/Gk87+i0eU1luqUgLxjRP4P7rgGxNJYbCK1vPs=; b=NCEBS1TFhHwoyn4ofGo+80AqWh
 h+FmaBOg46zuUZy/tObCyOoyIOCsdjzgMOQicamPhTAY4Euw89kCjVvtPLpUiX3UGOrNQ1YOGJyXP
 Jb/dpEBU3cPuIUSLBVmDjpS0fpZf3ApjiDRnRLxviryyDT1tzLbGvypaqDvER+77t0/c=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQYYw-0001wT-II for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 22:41:51 +0000
Received: from macsyma.thunk.org (pool-173-48-115-85.bstnma.fios.verizon.net
 [173.48.115.85]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64MMf9rW014755
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 May 2026 18:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1779489673; bh=mKk+R/Gk87+i0eU1luqUgLxjRP4P7rgGxNJYbCK1vPs=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=fzGRFuDbzkUMu0uEQK2H4c1RfcgnLM3RfKHwG4javJ75OC9qF6AhAaDCLYfTMwPlz
 of/InxBIn2Z19QZdFO9Lfn35k3wShr53V1AkPLqBH3y926x31L8yIiX5Ft+VhXuzZj
 u6QWzugSykkNUHT2ZVgG3qguLUAzpDtoZQDbXZTjVM2bX8O4fdSlNwy/eEePJkgPbH
 xkPsLmfmndIESLSSXVVw5gUV1IIehEFz4Ze8ZLr5XDmXaN6ar/CferRPBKhzJ1xyA5
 xOcBMHr5C2Y9tZn++wyEJ2rpZjhv/cRPVTE2PhDddfmQdZgYpBQseZeb0sjiF8InMO
 Oiul1xSVQJQJA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id DB24469EAC01; Fri, 22 May 2026 18:41:08 -0400 (EDT)
Date: Fri, 22 May 2026 18:41:08 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20260522224108.GA18663@macsyma-wired.lan>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahCNmWbcd_2lAJyk@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 05:08:41PM +0000, Jaegeuk Kim wrote:
 > > Thank you for the explanation. It seems I made a wrong assumption on
 the > usage of "user." prefix where each filesystem can support in [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wQYYw-0001wT-II
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,mit.edu:s=outgoing];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,mit.edu:-];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macsyma-wired.lan:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 9627A5BB32C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 05:08:41PM +0000, Jaegeuk Kim wrote:
> 
> Thank you for the explanation. It seems I made a wrong assumption on the
> usage of "user." prefix where each filesystem can support in different
> ways.

The "user." prefix is used by all userspace applications that wish to
store extended attributes.  For example, user.mime_type,
user.xdg.origin_url, user.charset, user.appache_handler, etc

For more information, see:

    https://www.freedesktop.org/wiki/CommonExtendedAttribute
    https://wiki.archlinux.org/title/Extended_attributes

I certainly assumed this was common knowledge across all file system
maintainers, but this was apparently not true in your case.  I don't
know how this could be the case given that f2fs implements extended
attributes, and I would have thought you would have known that when
testing that feature.

> I shared some motivation when replying to Darrick's feedback [1], but yes,
> it was not enough for all heads-up. The problem started that some speicific
> application needs as many high-order pages as possible mostly for reads. So,
> I thought we can turn on large folio on the specific files per hints. One way
> for the hints was using immutable bit, but it turned out it's very hard to
> manage disabling the bit whenever deleting the files. Along with limited
> ioctl() and requiring inode eviction to manage large folio activation, I had
> to implement this path.
> 
> [1] https://lore.kernel.org/lkml/aeA5C8byIpXWla7f@google.com/

Actually, you still haven't explained your use case, at least, not
well enough for me to understand what you are trying to do.

So an application wants a particular file to use as many high-order
pages as possible.  Why?  What sort of guarantees do you need to
provide?  What happens if they can't be provided?  What happens if a
possibly malicious, or at least gready, application uses this
interface to grab a lot of high-order pages?

From your patch:

1. setxattr(file, "user.fadvise", &value, sizeof(unsigned int), 0)
 -> register the inode number for large folio
2. chmod(0400, file)
 -> make Read-Only
3. open()
 -> f2fs_iget() with large folio
4. open(WRITE), mkwrite on mmap, chmod(WRITE)
 -> return error
5. iput() and open()
 -> goto #3
6. unlink
 -> deregister the inode number

Why should making the file read-only matter?  And when you say
"derigster the inode number", why should this be related to deleting
the inode?

This is an interface which seems to be very specific to your use case.
What if those requirements change over time?  What if you want pull in
a file without making it be read-only?  And what if you want to
release the large-order pages without deleting the file?

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
