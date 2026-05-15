Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D3qLfiaB2oD+wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:15:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CD558A92
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QakKVDjnRw+kfaiGWmaDwMX75Dvbgy8uJjcdtHUMerU=; b=SEf0l/+OZSJneC9Xwve4WHqu1T
	WH9oHKnAxXZkWvVqUYOdAOa474dGWDlDq1EE38lLekFJ8w65SxzIG6b5pFr+HYBzndBfUbmDg64/J
	kBENgJLtch0hkmd00ULT6cQlhIrCjN3Q/iVWQNCPnAjGPvuiw9whxXIxNWpowKOVo+5o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0oQ-00016g-TP;
	Fri, 15 May 2026 22:15:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0oP-00016Z-8T
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jBov2HinV/dwF9IJ2Ido+SSIYnzOEQz6Xz/xjaqgFls=; b=QcWzyC7w6/Uw9xMhzGZUtRPgl1
 0jRHbL0CLhxDss24AkLEJxTjyhbw069/TKigFXM1gyf4HZWXeAL2l5YfGMwEHi5KgcO6S4ayxwTUp
 G9LXj9otCF/kSuxWKIobTNpikWU4UhVfRFqm/tqNrDsvyoYxU7COBo1/FtiuY1dGVWrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jBov2HinV/dwF9IJ2Ido+SSIYnzOEQz6Xz/xjaqgFls=; b=mtqzz2A3p63jQg24KqEsZDbvXA
 kj54eLMgQh3JlAVkj/2E8ZmiDzFZ/2w5KqZLlJk39hwmDjM67/va1QRRlT5+kce2JWN7CGLJ3rLnl
 SEMZtOAeqDFqDm0u5PmoowXvC7WBMegulhoaRiggo7zR91ZBSSzJC0Y8ybew0b29uvBk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0oK-00033B-Qa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 58DC3601E2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27ED5C2BCF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778883302;
 bh=HEI3NInBIsei/EoRNgiy0qpwrOV6JThvbMsnk7Bz8SQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jxh1uappRE+fFuV27sWkHNzCj5+d2aVT1j65RMydPiA3+qfe9fqYBuFzc0ZIj/Fpu
 cFQRaQJoY/iHrKXBJdS2wsRk5rq1xzOyNcs7yejiWh8W6RgAaWEhBqEdZJpxTPy77M
 JRYi4PNnn2wtzhR/wyqz4rMdmJR+bxiI2vRMwsQLdaCDEgehFvJoO/bHVv0iHuTfP4
 wfuarXy7ruNKoiYul90mjrrYps4vYn1HEB9yDrtHODVNDLOu+Ppdbyoz4u0hRfUsC2
 37C28MIvN0l8wESpsUfo9irFJWsoyatkAK0iZULeakWTs0Pc88eJ2PNYyU/VJuXeeM
 L/xniqqnaAmhQ==
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-651b4d09141so544456d50.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:15:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+NuBD1JrS4g1drpzQeFU2RSBz1GWb+/KdNhx4mur9ISwSrxF7HisA5ER7wpVx+jI2uFxjvRY+IPOTz6kOO/UCX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyyUi7aB6fCRuxMfztDMo9LlA4iEd40DhJEW2PLxTb0bGB273r9
 oK1+2ovh6DbrdvpeF/7XZUiyTrMID5qEK/pU58HDSfPn4XwZNnDw/Ds24lwNQhs0aFO1EkGewJp
 znLPX/VnaTd1Z1i4ovEyfNOjgtfBbKotcLGnN1DlrBw==
X-Received: by 2002:a05:690e:b46:b0:654:3fca:3515 with SMTP id
 956f58d0204a3-65e0b21fe50mr8034402d50.30.1778883300972; Fri, 15 May 2026
 15:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-7-hch@lst.de>
In-Reply-To: <20260512053625.2950900-7-hch@lst.de>
Date: Fri, 15 May 2026 15:14:50 -0700
X-Gmail-Original-Message-ID: <CACePvbVAWsNZ22gzuDEfLiCK3zxb18svrJ+ksuzHnR2eQOyZyA@mail.gmail.com>
X-Gm-Features: AVHnY4JHBmh6X5lXS1qOF4QpMHKR8b6gUc4PeaeujUpSr4VXuziU4ZJkvW_XRo8
Message-ID: <CACePvbVAWsNZ22gzuDEfLiCK3zxb18svrJ+ksuzHnR2eQOyZyA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:37 PM Christoph Hellwig <hch@lst.de>
 wrote: > > Make use of the abstractions we have. This is a preparation for
 > moving more special casing down into block/. > > Signed-off [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wO0oK-00033B-Qa
Subject: Re: [f2fs-dev] [PATCH 06/12] swap,
 block: move the block device swapon code into block/fops.c
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
X-Rspamd-Queue-Id: 008CD558A92
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzfigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBNYWtlIHVzZSBvZiB0aGUgYWJzdHJhY3Rpb25zIHdlIGhhdmUu
ICBUaGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yCj4gbW92aW5nIG1vcmUgc3BlY2lhbCBjYXNpbmcg
ZG93biBpbnRvIGJsb2NrLy4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgoKQWNrZWQtYnk6IENocmlzIExpIDxjaHJpc2xAa2VybmVsLm9yZz4KCkNocmlz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
