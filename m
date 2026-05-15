Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJjOHgmcB2oD+wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:19:53 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9917558BDE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDBsXOhc+tDjyZnCrnT6Y1AZ3WA37kx3jAOtjTQmDpE=; b=eidt5qA07Y3oNESpJZ1sQqF5Bk
	vnb5kktgSDW9hErQh4irE/Dfgl6XBB1UPzvNthGldOW6HLPWlczzuK2BNoyk5xBOTigYyL7+T7Ojy
	gD2xLWLaZ8VEogHE2v3WXyAknvc1/2P1rIMESAp5mYWYYXUft9Sh2X3P2hmACN7MOlg0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0so-0005L0-Qp;
	Fri, 15 May 2026 22:19:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0sn-0005Kl-C8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EvCWNGBV0/IbyJ8baDSLSIZ4bAFvtnRm9ehorzRiQS8=; b=Qrh2zn8h4g0+g8AQZ/zxKGLB0F
 q7HuRLQ+A1HimtmF0D5MSiX+g6qzuPe4gpgrhdaK0mWtDGcx8o1xqPFiBtQL8G/TRBVRajW00/Tu8
 vbLt4h8lHWg/dDBIyuu97wcCjrb2i8dRGiFaP2f/VnBJgxBS3KWAnp64RdCZ0nx1yEn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EvCWNGBV0/IbyJ8baDSLSIZ4bAFvtnRm9ehorzRiQS8=; b=jB1vqTna3cO3iPXsQfgNs2ESwD
 /ybHm2tqPxD/GNXC3EePhGIdkdDmChpW+iZiohJP9QGBKzGECIhQeGdT9V4nA1fUQTNb+xn7FTAOb
 2HOgf2c90kwj/LcpIbUTsCXI4olrxFG1Mh2fcqV6Zas6N6sm2vC3IUeP70TMuJBmKW0Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0sm-0003FQ-8P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:19:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 795C2445A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA36C2BD05
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778883583;
 bh=W0dCpwZODJFKPu2SY6eKQzfEttHd/2HhQ48IKdHDqaI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qPLUzIqe+TD/Ajtl2DCP1cDvkOJuqKO9ysrycysQpsE+m+xWszTfV+rlfwO2rVKqE
 9F9C5+WMgR58Dq4JWhybLmVz6E2Gq1ppksYTWnpZZFoGIO2vmeRi1n5dNTZU0lZZUM
 LHgpphCcyo4hniv1oCFJL/7skvnp5MyvMD82drSl7iHg2CdK9SgPMcT1eji4QEntu+
 bKqWwOLzI8aqSyUq6S+qUu1FZ0TsUcs+G7zeRfwLEDUj7EhUwoZcp6lrZ+yJD0TAga
 Y0BGiekqxRPhNJJkDIYjraBHPn27CGWMSn4nt6BcPAwp/tcUOYNTNfVjYZTGnNn7yX
 yQrUAd2V5+gzA==
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-65c52bb5dd7so653844d50.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+JYEIH1uggg9GjI/+uMznLOxhNAHbFcFrC1nRtkr1PPq58hrJ5qEAbVCMA3FTmDaiBC2EQ9aNTbHGvvD9fJKlU@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzvE6ChdeSu3D7Snv887THMHKuGlpx68Ny6d5fQ1sgPGo9ACrBT
 FmWX7zAqOrKhIjjBmCo7H0Aqqf7qWeuz69wdLabNoZo+ocraApabbGw9p8Q7J93lTCR8mTDpbGC
 KLWS35moJ3xLDTCgLiGQGNh6nigU21hPkeB/rRyLWjA==
X-Received: by 2002:a05:690e:4381:b0:651:c264:dd61 with SMTP id
 956f58d0204a3-65e226f5107mr4855343d50.7.1778883582591; Fri, 15 May 2026
 15:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-5-hch@lst.de>
In-Reply-To: <20260512053625.2950900-5-hch@lst.de>
Date: Fri, 15 May 2026 15:19:31 -0700
X-Gmail-Original-Message-ID: <CACePvbUgHmSuo_r9WDSD+oMnQeW0537OziTPMt-sRHx96ihg3Q@mail.gmail.com>
X-Gm-Features: AVHnY4JAgCglMa8_5PLakfMWnAw05abJthdzcE1NPle548GazZ3X3WKDUpcNb-c
Message-ID: <CACePvbUgHmSuo_r9WDSD+oMnQeW0537OziTPMt-sRHx96ihg3Q@mail.gmail.com>
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
 wrote: > > Various swap code assumes it runs either on a block device or
 on a > regular file. Make this restriction explicit using check [...] 
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
X-Headers-End: 1wO0sm-0003FQ-8P
Subject: Re: [f2fs-dev] [PATCH 04/12] swap: restrict to regular files or
 block devices
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
X-Rspamd-Queue-Id: D9917558BDE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzfigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBWYXJpb3VzIHN3YXAgY29kZSBhc3N1bWVzIGl0IHJ1bnMgZWl0
aGVyIG9uIGEgYmxvY2sgZGV2aWNlIG9yIG9uIGEKPiByZWd1bGFyIGZpbGUuICBNYWtlIHRoaXMg
cmVzdHJpY3Rpb24gZXhwbGljaXQgdXNpbmcgY2hlY2tzIHJpZ2h0Cj4gYWZ0ZXIgb3BlbmluZyB0
aGUgZmlsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgoKQWNrZWQtYnk6IENocmlzIExpIDxjaHJpc2xAa2VybmVsLm9yZz4KCkNocmlzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
