Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COg+MAgmGWq5rAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 07:37:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A885FD639
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 07:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy9i8aVg1u9/LcT0wsYjTzZOeXtH1bDu+6xxcmXfnK0=; b=k6SDDWw2mmp5dOpbmTVAn81tzz
	/oTzYl3rM6R2w6EF7NalTztUeUDJNVpAs9B/leVGOFkjqCkr3FjqV55u8qYVHk8aWaqjNr8j8+G96
	1W7tJFoP3i19uH9rdECOiOXZ6lGg1/Yf7slCLaA8V7T8YWZJooOGMG8T2SGvH2S2btFg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSptz-000497-BO;
	Fri, 29 May 2026 05:36:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+07363440a70d19ca35bc+8314+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wSptw-000490-Fh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 05:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWo/gTZ+lk7qCswHD1K4xHit8Q7TVDZZNoyS6wwTu8Y=; b=cUHOrXbwSoCheb44jxrI36W/7P
 uJmEfU5/wNetmQV7SfjYV6PThQbW78Ry5MLCgBhbOtUvdbx1BIZqJkPwikADwNVpRdthvuK+WeJ1y
 7YyvdTZKdu3ym0Z0hozuhLl1qFJ7umZ1yRtZMY2V0NQeoQHXTpvjHnrD+bUr9ddoX+Ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aWo/gTZ+lk7qCswHD1K4xHit8Q7TVDZZNoyS6wwTu8Y=; b=MdoYwiNePXTkJvIs1wJneNgkW+
 sJTS/2Cbidk+N9aSDV+VXXmrOOV8ZqPf/+RXECH7ykrru90+VTwYKPExSjTmbkovvXhZLPJCp3qAg
 AX/snlhEzCyP7sxNfhyw9F903Gz4Vk0DkxznwHl2hinyWgcdQbhFU/SCrqBZm4M3dKAk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSpts-0002Mh-5o for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 05:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aWo/gTZ+lk7qCswHD1K4xHit8Q7TVDZZNoyS6wwTu8Y=; b=vZ6FwFY/6VqF6WzikjGIZxuBlC
 FLMmpJLHB1p5hx2CsiBI/QUAU2dEbJULNxIZqhYJcJWSj4LkthqJ3RzSqurUj8ga5p7zkk+DGxIbb
 l0CrRbsr9CTjvx51lSw1qc0faVXR5JH0vmj6Ikbyfh23v42jgWYoZ6v2AbGP/kjGmb2GZAjzcPI6z
 IluxeI7aHavbJ3PLPUbgjtngBQyObKDGlnQbakChVVkOGCAP4EJy/6Umqu93cGXoPGws54kMp3tED
 U+OMb9FtkrQnZhUtkvZlDtU4ulHdOD05FgUGQCY0ug52p0Bk0z6/rwsAHUr9uOCWNjjK+d9jeTFmX
 Q1Ew1VRw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wSptf-00000006laY-1dEg;
 Fri, 29 May 2026 05:36:39 +0000
Date: Thu, 28 May 2026 22:36:39 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <ahkl52N3RDcusCNd@infradead.org>
References: <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <f4e521ac-2381-49ca-8dcc-3cb3cf3ffaea@acm.org>
 <ahaPDHiXcJoVShPv@infradead.org> <ahcU5xbVy7xjps02@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahcU5xbVy7xjps02@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 27, 2026 at 03:59:35PM +0000, Jaegeuk Kim wrote:
 > F2FS merges bios before submit_bio, regardless of small or large folios,
 > since the block addresses are consecutive. So, I think IO subs [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wSpts-0002Mh-5o
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
Cc: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:tytso@mit.edu,m:bvanassche@acm.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid]
X-Rspamd-Queue-Id: F0A885FD639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 03:59:35PM +0000, Jaegeuk Kim wrote:
> F2FS merges bios before submit_bio, regardless of small or large folios,
> since the block addresses are consecutive. So, I think IO subsystem was
> working in full speed.

As does every other remotely modern file system.  But that merging is
surprisingly expensive, which is why using folios gets really major
performance improvements.

For one doing these checks to merge touch quite a few cache lines.
Second, devices are often a lot more efficient if they see fewer SGL
entries.  I.e. having a 1MB bio a single SGL tends to work better than
having 256 of them.
The same is true in the kernel code itself, both in the submission path
(dma mapping and co), and even more so in the page cache handling
both before submitting and in the completion path.

See Bart's patch about how long the walk of the bio_vecs in the f2fs
completion path can take.  We had similar issues in XFS even in the
workqueue completion path due to lack of rescheduling, and these simply
go away when you do the folio manipulation in larger chunks (LAZY_PREEMPT
would avoid the need to explicit rescheduling these days, but that just
papers over the symptoms in this case).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
