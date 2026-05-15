Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DBeBW6aB2r/9wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:13:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 497735589ED
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt/FgRRMygFbKF9ZxoUINtl85wrfIy4efJSAaeWMumU=; b=TY2sySXJ1l853r+yM8Z7NaBsnc
	YzUwztuXXJfnYfAZK0ei9/63CCVAF9mAtIcTLkxw5yytM3uDEovrU2xTvUxMXewY89oXLfGcPECr6
	JZ3uOkzPIKjbG5knIPz9/rStaFMcXes8dbHTOnyCwCCb3wxnTpKpxu8JAhVOMUtLKCf0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO0m4-0004qF-Rk;
	Fri, 15 May 2026 22:12:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO0m1-0004q7-5E
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mb2Px+VFI1la/B1T8HdQLAoDo+pi65QwRBrBz9J8j3A=; b=KhEfyzY9DbbZJ9ppJ40Cjx/Y0/
 WRzNJXTsxlSUOXjyW8W19b0RkTS/C/jm93rCYWvk9j9iF/jVRBYhWmKT3v+hdtw19K9kgwIzmVB5t
 hf7caEadXeUuRtD+7r36Xog7EiKPBCu1gQ8HX7i/bNc+1n//qyaOMnYgDXYn8woG5uUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mb2Px+VFI1la/B1T8HdQLAoDo+pi65QwRBrBz9J8j3A=; b=RTWe6t3s0j5vYLP1XbF2Sb+P2Y
 nNdy99DvkPb43JhrT6nZSPh75v4bZwMX/VTUDDhxKCOplC6fZts1SAxqa/fz5kfTVEBfPQlKQS5DA
 T5lPKu8xTh88/GZ9JmdQ+i22oIUbIelWW8La0AvXKtaKCPo3mC1nGZ9ckoKs09tGDWUs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO0lz-0002tO-WF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B06743E7E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD572C2BCFA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778883162;
 bh=Xo9RN/YaHlAbWe60yDn3HcJADUDb6frVOkoaJStZf5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tv+IRzby0Wc1y1AfRAfBW3nKPJfKGSdDUKMAC83W6JZ/dYSjgCeuFvnvRb+k2fDWh
 xbo5tF45ctQN2+lUP3uiBUSdgPOAi+Wx+0tkvg+4pJup5eskAOQTJlwp6phqJcshLI
 zwma6B6kmV2AJ2QU39YgSPGY+7u3MZcxTeE3mLdPCH/vhNyTGPwjMe4zxLH36reM8B
 Aer/b8HC7tlHs6JLUSTc8CC6m60eU8oVJuXGFC3sjcHNI2tTjQrIJ4E+efJOd+l39W
 8dpKuDtdYrLdKdfWZ3TWstbmXaMPftJx2DJhHT9Ud2qtgOsF/sPz15MPQ/jP7lSeCE
 kkkwEGkOg5Eqg==
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-65c2cd216c9so622262d50.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+AQ4PxKbgl1kQLZU2KGho5WRs22GMV+d4Q0lDceVXUb0132YTmeH9+dymZrHwVRDVnyckPH5gKS1T4e7Tl2qbJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy+/a3YSR8xAIm7pZbW4PF1AgfX9SuuOGmXtGWPr9P7XDMBvSc4
 aUOyX8ymow738bC2zwBPqYBlDxLXm9nkNOMP97Sr07TuiSxsjJZx6Q1Uv5BEo6qIOoqnOcNrF4o
 5PLMVv0WBKtH/+F8yV2zR1pFyVTU0byId/coZvDbOpg==
X-Received: by 2002:a05:690e:14c4:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-65e22807f82mr6158139d50.44.1778883162092; Fri, 15 May 2026
 15:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-10-hch@lst.de>
In-Reply-To: <20260512053625.2950900-10-hch@lst.de>
Date: Fri, 15 May 2026 15:12:31 -0700
X-Gmail-Original-Message-ID: <CACePvbVPV55SgPmivqMX+bP8H7FKcSAbWCwAe5icgZjZV9vUNA@mail.gmail.com>
X-Gm-Features: AVHnY4LtC3KSyPNEsLh1ud1t2IOob9XfSBaYZO4ouG71LQM8qOS5lvZuuzrl4N0
Message-ID: <CACePvbVPV55SgPmivqMX+bP8H7FKcSAbWCwAe5icgZjZV9vUNA@mail.gmail.com>
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
 wrote: > > Only the file operation method knows what block device we'll swap
 > to. So move down setting sis->bdev and the special blockd [...] 
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
X-Headers-End: 1wO0lz-0002tO-WF
Subject: Re: [f2fs-dev] [PATCH 09/12] swap: push down setting sis->bdev into
 ->swap_activate
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
X-Rspamd-Queue-Id: 497735589ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzfigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBPbmx5IHRoZSBmaWxlIG9wZXJhdGlvbiBtZXRob2Qga25vd3Mg
d2hhdCBibG9jayBkZXZpY2Ugd2UnbGwgc3dhcAo+IHRvLiAgU28gbW92ZSBkb3duIHNldHRpbmcg
c2lzLT5iZGV2IGFuZCB0aGUgc3BlY2lhbCBibG9ja2RldiBmbGFnCj4gaW50byAtPnN3YXBfYWN0
aXZhdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
CgpUaGUgY29yZSBzd2FwIHBhcnQgb2YgdGhlIGNvZGUgbG9va3MgZmluZSB0byBtZSwgSSBkaWQg
bm90IGxvb2sgbXVjaApkZWVwZXIgaW50byB0aGUgZnMgc2lkZS4KCkFjay1ieTogQ2hyaXMgTGkg
PGNocmlzbEBrZXJuZWwub3JnPgoKQ2hyaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
