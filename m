Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBgCA1ygB2rP/QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:38:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A4558F68
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 May 2026 00:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Blr0G1/NNcoHAM2U6xdiVJOI0YEl1Nb1p8ZU3+l/f9I=; b=hu+A4WMBffqt0uqnyZ9yhrUY/M
	/zcXErcFX3qyS1NpmM8ZUriLnmUEiOqu1jAKim6SyQUFUhu7xU0UMqSrOZqLxpaNTCkysCbzJwk6y
	choFP792rpfdQe2A023RGtWi3LZbnJMII6JMntad4/PXfYNTNHxCN/fXcgKr7cp6NyIc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wO1Ad-00033u-Mu;
	Fri, 15 May 2026 22:38:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chrisl@kernel.org>) id 1wO1AY-00033j-KG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p2jCAN1uGGBFod+dAEVc9V87Hx8HKAYcRyCM/+scJWs=; b=ZE5UfIws7DVhQeqIMwnf9WsQfo
 mvkmmOmXYK0+05Kqz4/w9ttvS4iq/dRay2X2bJxmthb3T1GXVrdeVRDWxeOiQLdin/nYWIH61JNwd
 czZCqpqrl5RAV936bemxIYvwfhkY5n+OaEFUQzqonU4RpiJXlw6CVw4ch6/ZmD5CYj+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p2jCAN1uGGBFod+dAEVc9V87Hx8HKAYcRyCM/+scJWs=; b=j4CGSdhtHyh6nWZaJGKqR6zdKu
 3yb75iXjHEmTMvmSIpvtkltfz8StbUIXLMU04ej9NGfNWw9cHu5PG8aNrOixwgcyUwJZEZ8NQQESF
 u0BQ4wstLe6UzQgmq61AhkkbSM4SUflu9+3JwYZyf+BlzLCV8qKeehMCOLWrp9UEa/SY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wO1AV-0004Am-2k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 May 2026 22:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 324B3445BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A97C2BCF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778884677;
 bh=J22XAuCby1Nk4FIP13WT2u/GUxKM6wuoH7hrzV1Eqf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J6SQPUHbeQl+M/9tFaMbK8dZygMG4wF3FeDwXrfnAGoeuZ9v43RFXPi3i6PlUEyiY
 qBY2PB9tpcgkHiNjKM3nu+tcCujL6QueIqUkX9tN/dTiWw6og/+ClebItMZvq3cMkT
 vgZnaxUDZ5ZpKpPGSQXREQbo72kuouuzw8BV7etUgGve0Sj0gy7Gf3dVbWhB4ui+SJ
 8aVZ/MPSUGgiJiIlGr/mzCEQp6NXdNvts0FxgtV7VTfgZICdUvENCJTtEbhFIHPwLu
 wKsygrKzRHlvxrF3qEqfDaUVvViuaPg4sRY8c8vqUrBVwcjH1EGTh3YzoMz3G9HpWQ
 RKL1x7I9KsoDw==
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-65c477a3278so689540d50.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2026 15:37:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/Td4iQr8mCewo6Ir0BpvXGL5Hf3T5jBBzrWFSMl24bI/dtWfzv0kUgsqc+PXCrKFmDxgbe30Ub/qLdBpPnPxTL@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxHWt4k96jx+OWxtqZjDCGoc1EUDkAM9NTT3oiFMlqO9ebRpE+0
 1IFn5gTZ32aMaV3k0gv1UqfVUO2TIqqvRDh8v0eIlLSCfohVMRSgEpF4ky3xPmh2utdW5Kd9mGP
 05PyCzjrUBIaQYv128igocGCnbi2vlbUVnO764SeioA==
X-Received: by 2002:a05:690e:1482:b0:651:b13e:f9ef with SMTP id
 956f58d0204a3-65e226d2c42mr6465616d50.14.1778884676176; Fri, 15 May 2026
 15:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-2-hch@lst.de>
In-Reply-To: <20260512053625.2950900-2-hch@lst.de>
Date: Fri, 15 May 2026 15:37:44 -0700
X-Gmail-Original-Message-ID: <CACePvbWdxJfCgZzbfFoSOFLKnizDJE62oHKj=mA5jkBGo0dHkw@mail.gmail.com>
X-Gm-Features: AVHnY4KhYBpZIvUDwx68vRewVOsNKOXtAJOmYrhmxnQGCpjvviSHXcfEap0R7tY
Message-ID: <CACePvbWdxJfCgZzbfFoSOFLKnizDJE62oHKj=mA5jkBGo0dHkw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 11,
 2026 at 10:36 PM Christoph Hellwig <hch@lst.de>
 wrote: > > Always use si->max which is updated setup_swap_extents instead
 of copying > into and out of maxpages. > > Signed-off-by: Chri [...] 
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
X-Headers-End: 1wO1AV-0004Am-2k
Subject: Re: [f2fs-dev] [PATCH 01/12] swap: remove the maxpages variable in
 sys_swapon
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
X-Rspamd-Queue-Id: 478A4558F68
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMTA6MzbigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4gd3JvdGU6Cj4KPiBBbHdheXMgdXNlIHNpLT5tYXggd2hpY2ggaXMgdXBkYXRlZCBz
ZXR1cF9zd2FwX2V4dGVudHMgaW5zdGVhZCBvZiBjb3B5aW5nCj4gaW50byBhbmQgb3V0IG9mIG1h
eHBhZ2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
CgpBY2tlZC1ieTogQ2hyaXMgTGkgPGNocmlzbEBrZXJuZWwub3JnPgoKPiAtLS0KPiAgbW0vc3dh
cGZpbGUuYyB8IDI3ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbW0v
c3dhcGZpbGUuYyBiL21tL3N3YXBmaWxlLmMKPiBpbmRleCA5MTc0ZjFlZWZmYjAuLmY3ZWJkOTdl
MjhhMyAxMDA2NDQKPiAtLS0gYS9tbS9zd2FwZmlsZS5jCj4gKysrIGIvbW0vc3dhcGZpbGUuYwo+
IEBAIC0zMzUwLDEwICszMzUwLDkgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgcmVhZF9zd2FwX2hl
YWRlcihzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2ksCj4gIH0KPgo+ICBzdGF0aWMgaW50IHNl
dHVwX3N3YXBfY2x1c3RlcnNfaW5mbyhzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2ksCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5pb24gc3dhcF9oZWFkZXIgKnN3YXBf
aGVhZGVyLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbWF4cGFnZXMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5pb24g
c3dhcF9oZWFkZXIgKnN3YXBfaGVhZGVyKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIG5y
X2NsdXN0ZXJzID0gRElWX1JPVU5EX1VQKG1heHBhZ2VzLCBTV0FQRklMRV9DTFVTVEVSKTsKPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfY2x1c3RlcnMgPSBESVZfUk9VTkRfVVAoc2ktPm1heCwg
U1dBUEZJTEVfQ0xVU1RFUik7Cj4gICAgICAgICBzdHJ1Y3Qgc3dhcF9jbHVzdGVyX2luZm8gKmNs
dXN0ZXJfaW5mbzsKPiAgICAgICAgIGludCBlcnIgPSAtRU5PTUVNOwo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBpOwo+IEBAIC0zMzk1LDcgKzMzOTQsNyBAQCBzdGF0aWMgaW50IHNldHVwX3N3YXBf
Y2x1c3RlcnNfaW5mbyhzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2ksCj4gICAgICAgICAgICAg
ICAgIGlmIChlcnIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gICAgICAg
ICB9Cj4gLSAgICAgICBmb3IgKGkgPSBtYXhwYWdlczsgaSA8IHJvdW5kX3VwKG1heHBhZ2VzLCBT
V0FQRklMRV9DTFVTVEVSKTsgaSsrKSB7Cj4gKyAgICAgICBmb3IgKGkgPSBzaS0+bWF4OyBpIDwg
cm91bmRfdXAoc2ktPm1heCwgU1dBUEZJTEVfQ0xVU1RFUik7IGkrKykgewo+ICAgICAgICAgICAg
ICAgICBlcnIgPSBzd2FwX2NsdXN0ZXJfc2V0dXBfYmFkX3Nsb3Qoc2ksIGNsdXN0ZXJfaW5mbywg
aSwgdHJ1ZSk7CgpOaXRwaWNrOiBJIGNvdWxkbid0IGhsZXAgYnV0IG5vdGljZSB0aGUgc2ktPm1h
eCBkb2VzIG5vdCBjaGFuZ2UKYmV0d2VlbiBzZXR1cCBiYWQgc2xvdHMsIHNvIGluIHRoZW9yeSB5
b3UgY2FuIGNhY2hlIHRoZSBzaS0+bWF4IHZhbHVlCnRvIGEgbG9jYWwgdmFyaWFibGUgZm9yIHRo
ZSBsb29wLiBJbiByZWFsIGxpZmUsIGl0IHdpbGwgbWFrZSBubwpkaWZmZXJlbmNlLCBzbyBmZWVs
IGZyZWUgdG8ga2VlcCBpdCBhcyBpcy4KCkNocmlzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
