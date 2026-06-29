Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ecXQKJnsQWpzwAkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 05:55:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76E6D5BE3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 05:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=D6doF63f;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=jQa7vLGG;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QpgfdBOy;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=casper.20170209 header.b="TP7dHc/6";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW4HDJmAeO2azV7OsZkAEkA1kbbL0lK63sGFe/CMT9I=; b=D6doF63fHk560vnJNsQAV72scW
	D1fdXLVE9QyXwoG9D9oiDFHxR0iaPygdWJgx9FxAqjGiKe5Jjb0h2j1g3IaUMMcVo4VgvkEtU/PGC
	Rrh6frMNTlnHNBoJ2DY+zbSFRpBgSiCZKnJTBNd/BQDRqe+owRPIGLfqGMHyb9Doeh2E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1we35E-0006hQ-KP;
	Mon, 29 Jun 2026 03:54:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1we35C-0006hJ-GG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 03:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hFo84/xIaNLmMRGU7rrl3fxKB7EcVv4C+5Nj/34E8+Q=; b=jQa7vLGGBSVNjYv/YK0OzTUxiG
 Y6GknyB2mlsJUuH2H5zDqcvW1dLXoUJX1cDOZcBMoHK8sMEUvo2GSWb5FFzJg+WxUmNFxcg6p2hfd
 yBFPKOjy3fVBuXsFmEmbuigKpx7zkade9wsoRDBGHctVl5X0Tw8UO0j9kYWyX9ectvik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hFo84/xIaNLmMRGU7rrl3fxKB7EcVv4C+5Nj/34E8+Q=; b=QpgfdBOykYTkFIegGhlGgAIzto
 /ozXnyX9jijFFG0oHexzdgmi2lUdcr86saLuvDAD5uDCoLYKubcOQLoSjD8eczxAf123ud+WmUBBi
 7ASmNYStudRfGhjh6vIrgiS92cUXdERZtNU16x6nCm0+q1gHJBuGpqHvjmun/91fx1cw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1we358-0007q0-Ok for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 03:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hFo84/xIaNLmMRGU7rrl3fxKB7EcVv4C+5Nj/34E8+Q=; b=TP7dHc/6LkyMi5+Lrqg6xksMt4
 Yw+T+UPdN7Ltn/4qCUx3By/BEslb+4pMT/PGj15Q6QO7bHvYyfv2eVBzoa1HYUhUtXyzzEAtQaNv2
 uS6aiVoBKxvLTkODEzwXhF+GNMow8yaLI3PHJU3pkCHEonhr1CA8sl4of/stoC8xddISJ2SddO2e0
 0hDyQ+X7Zx6O8Tz3g/PSps74I0n7eDZ8p7+W0RDJ4U5XWwPs5g8WiqZ/bYkdiM7eg/rjmrO5WC3qg
 jQMOvJNTPKeBHPTJvR4QWqSedU3Gjhqs9KCooXex90zpWGuFwErTmSCMRUk93LcySgQVoWYbOLQyv
 C9RHU2lQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1we34w-00000002YaL-1D6c;
 Mon, 29 Jun 2026 03:54:38 +0000
Date: Mon, 29 Jun 2026 04:54:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <akHsfps-sQ1INJfS@casper.infradead.org>
References: <ajwtQRawMxcQkyo8@casper.infradead.org>
 <ca56ceb7-b0a7-41f2-9b26-085e81456794@amlogic.com>
 <324cc5b6-ebfd-4696-b2f4-33710b771249@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <324cc5b6-ebfd-4696-b2f4-33710b771249@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [Adding Jan Kara; retaining whole message for context] On
 Mon, Jun 29, 2026 at 09:39:25AM +0800, Chao Yu wrote: > On 6/26/26 17:30,
 Jiucheng Xu wrote: > > > > > > On 6/25/2026 3:17 AM, Matthew Wilcox wrote:
 > > > [ EXTERNAL EMAIL ] > > > > > > Hi Jiucheng [...] 
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
X-Headers-End: 1we358-0007q0-Ok
Subject: Re: [f2fs-dev] Use of FGP_NOFS in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:jack@suse.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF76E6D5BE3

[Adding Jan Kara; retaining whole message for context]

On Mon, Jun 29, 2026 at 09:39:25AM +0800, Chao Yu wrote:
> On 6/26/26 17:30, Jiucheng Xu wrote:
> > =

> > =

> > On 6/25/2026 3:17 AM, Matthew Wilcox wrote:
> > > [ EXTERNAL EMAIL ]
> > > =

> > > Hi Jiucheng,
> > > =

> > > I am trying to remove FGP_NOFS from the kernel and the last remaining
> > > user was added by you last year in commit 2308de27c03d.=A0 I'm trying=
 to
> > > understand why.=A0 Did you see an actual problem if you do not use it,
> > > or was it theoretical?=A0 The commit message says "to avoid potential
> > > deadlock issues", but it's not clear to me whether you know they are
> > > there, or only think they are there.
> > > =

> > > I'd really like to understand what the issues are as the normal issues
> > > which make calling into the filesystem (holding another folio locked,
> > > holding a mutex relied upon by reclaim) don't seem to be present.
> > > So if there is something, I'm not sure what it is.
> > Hi Matthew,
> > =

> > The FGP_NOFS flag was suggested by Chao and not adding it might lead to=
 deadlock issues.
> > =

> > @Chao could you explain this for Matthew?
> =

> Hi Matthew, Jiucheng,
> =

> IIRC, for normal path from write -> write_begin, it seems fine since ther=
e is
> no f2fs-specified mutex or other folio lock in the path, but I was worrie=
d about
> quota path when I suggested to keep GFP_NOFS flag, as the lock race condi=
tion
> is quite complicated there: f2fs internal lock vs quota system lock vs fo=
lio lock...
> =

> I searched the commits and found this:
> =

> Commit 02117b8ae9c0 ("f2fs: Set GF_NOFS in read_cache_page_gfp while doing
> f2fs_quota_read")
> =

> In this case, f2fs_quota_read() was calling read_mapping_page(), which al=
lowed
> GFP_FS allocations. This triggered the following deadlock:
> =

>     Thread 1 (User Open/Write)
>     - do_sys_open
>      - vfs_open
>       - dquot_file_open
>        - dquot_initialize
>         - dqget
>          - dquot_acquire
>           : locks &dqopt->dqio_mutex (VFS Quota Mutex)
>           - qtree_read_dquot
>            - f2fs_quota_read
>             - read_mapping_page (GFP_KERNEL / allows GFP_FS)
>              - __alloc_pages_nodemask
>               - try_to_free_pages (Direct Reclaim)
>                - prune_icache_sb
>                 - evict
>                  - f2fs_evict_inode
>                   - dquot_drop
>                    - dqput
>                     - dquot_commit
>                      : tries to lock &dqopt->dqio_mutex again
>                      =3D=3D> DEADLOCK (waiting for itself)
> =

> It may trigger deadlock in f2fs_quota_write() as the same way in f2fs_quo=
ta_read()
> path? let me know if I'm missing anything.
> =

> Are memalloc_nofs_save() and memalloc_nofs_restore() recommended for such=
 case?
> any suggestions?

In general, yes, memalloc_nofs_save() after locking dqio_mutex sounds like
the right idea to me.  I'd want to familiarise myself more thoroughly
with the code before making a firm recommendation, and it's probably
quicker to just ask Jan ;-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
