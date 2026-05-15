Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN9gJzyXB2r/9wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 23:59:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0635D558846
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2026 23:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRBKtdZpdNDAD5cGjbXMq9+RCyqntcjqsbqUz8HYKAE=; b=MNWh9MrLUCPGSPkiDZjkaXOdHH
	lheJpYnkWCN2NWGbGHd5q87sNyPH6oR7oawgJg7bKTeLzEuZX7sGIhXcGd4jqdWxtB6N8LRzWo9Jb
	fXqDFoWW1xThATkLldlWxlBE8XtCLRS24IEk4fBh3WXMnpjxRhKDTDyFtdEgsvJC2JW4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0Yz-0004XF-Rh;
	Fri, 15 May 2026 21:59:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0Yy-0004X7-9z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 21:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tefq8HvM4P5E2wSS3fwKg/uRUohzy18j3qB5eF3vc+I=; b=WiwYm6vyKeIrCjfL0OzvLAXAsB
 ofzi+h59vVBGxnKElg+wkc3lL+9dU0eT3AevnKTz71oOT57fXTccUtEKElII8Q8QDHwfJU8MoI+Cu
 Ua3Uj6oopbR2LHnaw0kjPO4KV7D0iofol9uvMJSk8dkzU3rKznF+IsFl1LO7iId402Po=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tefq8HvM4P5E2wSS3fwKg/uRUohzy18j3qB5eF3vc+I=; b=DryOVeO6qUu1HI2MKEsUKKaGLf
 Ydc8j1eTBqRVOru5eY/oP6Tz8kmOt6LTWIG2xMmPSmugszLRpNXIfO67af/uoE56SasjVulDD0P1+
 n1p6V7QtP7kwMr8R3J79abBQFtf02LduKXTLzB8tF39USAftQqB/lkJZrSt2pr4/aRQc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0Yx-00029Y-09 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 21:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C74B8601DF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 21:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DAAC2BCFA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778882348;
 bh=Tefq8HvM4P5E2wSS3fwKg/uRUohzy18j3qB5eF3vc+I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mlxAZ0IAIzSCHzLngeDmNQ4J6co9JfMfAyyTD56EEM12uxEwPF+d70rIFEgbXNu+t
 nmFWRYoP8nH71/SzDNTwckMpq9wyB25aRToRPAIigrb7jE/X+huxz3wV5weJQEh3lf
 ZsxLaxQxb/gZTw7PSxPLrOv75lNNcS2p2VvYZC9t6B4LYinmg6kLafUf0DfUj6eBpq
 kZXCFWY/C9/weqMV5t5f0tzNqll4Mc26mgKMjPP/M9Z9q4x7BWVbGRpdIXWiR96TOE
 0nKaYS+uAe3dGdJ5WvMJ67+DHS+m1Sv1+QgNDDJhKoqmJOrx70mm+Pc9QAldu7MgQe
 B0cPfkZiG0HUw==
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso837524d50.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 14:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+zIIKB+jdqVjqkDRpOnM71ltkDK7xS285nvB1ByKOsZdFidGnPxqSfPwNMDGjnqPp8/YMrvocATSIHuE3sGRER@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxav+PsRZdp5LLxCXJRh4UxyoFchx8stJplacC09MBpQAKvcvwf
 mC8p0H4umtDiF5Y2wuvqS1/kH2+QZT0Q+pdlX+a7Wesp3YTrdXxuno2sxjjSFrGfQSoyGw6tzc5
 pV48aPIKXoHucJUJQQJFsuRAGhzSVDRMTzkNArFfOBg==
X-Received: by 2002:a05:690e:4188:b0:65c:477a:2ad7 with SMTP id
 956f58d0204a3-65e22733998mr4980962d50.25.1778882347862; Fri, 15 May 2026
 14:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-12-hch@lst.de>
In-Reply-To: <20260512053625.2950900-12-hch@lst.de>
Date: Fri, 15 May 2026 14:58:56 -0700
X-Gmail-Original-Message-ID: <CACePvbWMpfBo0zSFmMGLh7uxrpL2ugHCmD9xp=FC4aXiv9GYmQ@mail.gmail.com>
X-Gm-Features: AVHnY4JjyLNu3psg3JDksoA1h3sEopdVsiktUSZMp2g3bBnm0ZZ5mBGkhXfViRA
Message-ID: <CACePvbWMpfBo0zSFmMGLh7uxrpL2ugHCmD9xp=FC4aXiv9GYmQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:38 PM Christoph Hellwig <hch@lst.de>
 wrote: > > struct swap_extent is only used inside of mm/swapfile.c, so move
 it > there. > > Signed-off-by: Christoph Hellwig <hch@lst.de [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
X-Headers-End: 1wO0Yx-00029Y-09
Subject: Re: [f2fs-dev] [PATCH 11/12] swap: move struct swap_extent to
 swapfile.c
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
X-Rspamd-Queue-Id: 0635D558846
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzjigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBzdHJ1Y3Qgc3dhcF9leHRlbnQgaXMgb25seSB1c2VkIGluc2lk
ZSBvZiBtbS9zd2FwZmlsZS5jLCBzbyBtb3ZlIGl0Cj4gdGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCkFja2VkLWJ5OiBDaHJpcyBMaSA8Y2hy
aXNsQGtlcm5lbC5vcmc+CgpDaHJpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
