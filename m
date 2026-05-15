Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLfJBraXB2r/9wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:01:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6FC55888B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrPb0ln3OOUC8NkV+ffErvGjXCLvJSmJmenyEoLYdzw=; b=g11im6AmKCDHj0QeQOUuNo7HPp
	0zPnPwEEkvt8dTQA7MwuG2+99CmK5WGxAkewQeR/lka0sgHcQ3tAlTi5jTXQOxYRR8yz1cDp48FTI
	kSqH7g1x9RxYMhVllL6B/fcVqT0ESEOo8jYnJx+c8dHOqRn4wLkU9DSIuB5LQSGgXGS0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0av-0004bk-BM;
	Fri, 15 May 2026 22:01:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0au-0004be-4g
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Da1KZpOjYE8D68IakmHMLRFYpruCGLnO4oj2vfewy4A=; b=MQGwtHRKv0ntO2/No4eqsVnTUo
 4NezjMIJ7B7fk4Reozp5ULKbj/gmLt12AFdZmzX6dv/gcEOIZKsjnBuJ6bc213oCXog9z0MN6SGlt
 IMYo+fzSBNJ/FBU9L9zkpZmAn/eMmW01HYjrAjlh9roF9m6AdqMHO1KHXuRADVndAo0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Da1KZpOjYE8D68IakmHMLRFYpruCGLnO4oj2vfewy4A=; b=OZxlmf+ooBuqq6WrtIYy/huO0I
 2CPuk45S667iq2cSQznlifZUPO2hvMCOUnQSZu0NykzgLJxfMELSUpREp9qkwNWjcNM7E2ByNhkxn
 ezFv3Uq9YENfmlNeKu0b1sqms0qo3nt3dqXjBNmXFSAoj2ON0yluHxfsd7OVDJXx81cA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0aq-0002K1-4x for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CAA54405F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAF2C2BCFB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778882466;
 bh=8FzUPImWV18kvph4lTxQrEFg0N5DGTFbvVX3bryYp3g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VnxyRqbTDYx6GgcrEkNlGe2hGiAg4yRf75lATHoVW0PpFzHCCZ+JgXUyuTTzFzYbZ
 nNFOXRco11MWvh1JDJOczfjW/o82VAln7pHQl4C82nUu1ViOis3SosrtDwHSbeQ5h2
 7hh5YIRfWUUE01drL01kz1ymKoCuIOuYafR/+moxrWHGCFsIPM/YwkCOoOMPR2BW2F
 sEFBWfkOLqEDVYWBgUv069lwh+x4UOBR3ulzyYJOKkob68jjmMKdwTenYe8GkABinC
 7xFMM9GSsMSLs+ZAmcpTxsTv3F41hHwR75Z87TBgh2LyaBVb9TXRTx2e7ts+Cg9SFX
 aQUiJr4F/vybw==
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-6579254f996so476058d50.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/cwPrtukIafykTCDKgleffBsL8ieM0MFXGk8ey/TWn5HhPvYVebWI2p39q9XEjmQDW/01JMu9Lq6+R2XZl+exE@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxf9CEinnAakYutTEaipF/LnOrES4zcmxnPvfzN96KNPfEe2hN1
 F2lEx3uxo8R3NER+Vx7AZpxyD7RFLN3WuyTldyoJptxsvqOpXD940VtN87VDu4bG1wFwxQqNYaX
 iMNAjHcUTW6uOZ43IBZFRMfEQCPJvivYM1p6MIRF7xQ==
X-Received: by 2002:a53:accd:0:20b0:654:468c:7dd5 with SMTP id
 956f58d0204a3-65e2280d9e5mr5432439d50.33.1778882465457; Fri, 15 May 2026
 15:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-11-hch@lst.de>
In-Reply-To: <20260512053625.2950900-11-hch@lst.de>
Date: Fri, 15 May 2026 15:00:54 -0700
X-Gmail-Original-Message-ID: <CACePvbXY5sdG=JXV2TE65NAWaEQ975wHhcGGzuFg5mRECkwy+Q@mail.gmail.com>
X-Gm-Features: AVHnY4LoQkrm9-GqAeD5m6WwSsE12ARR5KdnPZLUwdKcGhFx_HvxcMbpEFa8lE4
Message-ID: <CACePvbXY5sdG=JXV2TE65NAWaEQ975wHhcGGzuFg5mRECkwy+Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:37 PM Christoph Hellwig <hch@lst.de>
 wrote: > > Add a helper abstracting away the low-level details of enabling
 > fs_ops-based swapping. This prepares for taking swap_info_s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wO0aq-0002K1-4x
Subject: Re: [f2fs-dev] [PATCH 10/12] swap: add a swap_activate_fs_ops helper
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
From: Chris Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chris Li <chrisl@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Kairui Song <kasong@tencent.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 5D6FC55888B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chrisl@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzfigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBBZGQgYSBoZWxwZXIgYWJzdHJhY3RpbmcgYXdheSB0aGUgbG93
LWxldmVsIGRldGFpbHMgb2YgZW5hYmxpbmcKPiBmc19vcHMtYmFzZWQgc3dhcHBpbmcuICBUaGlz
IHByZXBhcmVzIGZvciB0YWtpbmcgc3dhcF9pbmZvX3N0cnVjdAo+IHByaXZhdGUuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCkFja2VkLWJ5OiBDaHJp
cyBMaSA8Y2hyaXNsQGtlcm5lbC5vcmc+CgpDaHJpcwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
