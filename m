Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p0XDOsfvNGr+kQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 09:29:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED976A4565
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 09:29:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=igEL3zyE;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=W1hzIIHT;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=V8npIXJm;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=fwpGdNfg;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYz9RCV7NH88A6GTs4ia4DExyWs+8F/7ypdWt1AnOiM=; b=igEL3zyE0uATeTBVLMz6cKXCNu
	1MUQu+QBGwrFFHbqlcs6sjuPF60loY6CwLMzC1MLIsSb0oCy6+cBkZbWwTTZtAONG6O3jpkrhpmDv
	snC+1NjC9QzVEHc+PfxCCHItP3bOx/EgkjM7cfc9pFrGJAsJVBH9OHDe/4G6zHh35Ga0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waTel-0000Ed-Nr;
	Fri, 19 Jun 2026 07:28:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1waTek-0000EX-K9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 07:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=; b=W1hzIIHTUJdWijkSyWzqU84MPr
 ktDt+EmJShdaCHYlpAyutilT/X73z6lozu2KkH+swZcYmSgNjn1bO30IJOR9W0uyFe97HAURZHwzN
 oxgMqHgK4WDUI6YLU2SxBcM9rFSuOvxXUZDVry7+GP/wwf22pGTp4HHgL7+lqw4eaKrM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=; b=V8npIXJmCL9sAYLUw5OpTJWtbm
 /+tMyOOIOrxKuHJIz8gXfs4h6i5dbmzJE/HyzLoeMBnPyrA84FlwLMg3WUhB281Mo3n07ldbxRown
 zSg+Qb9bkLWUbjpKuFW2u/HMq1ck68iTDCtisN4c4Tvlzm/4p7mugfFgYdP72vWWx7DA=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1waTej-0008Ll-FT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 07:28:51 +0000
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-693c69b97e7so2886956a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Jun 2026 00:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781854123; cv=none;
 d=google.com; s=arc-20240605;
 b=NKxs/rnp4xtUQS6BonaX2KnLcGmiVhNxK1Sm8+O6IslR0537L5Sccuuo0UdRwDrsaz
 gBbMFU8jMT2LFY8JM//B3vwIHtBNoDDq4MzNzbqYMqb1oJf/9RVCLKTve1PyXXWF/GMC
 R0jcYJliTgybfVzYV3w/GkO7EFG3kuuQjIx1diSzpeMz+wGqQOAsGW+vHsVFcbKAnQzp
 mMKz5d/Rdr5VADw3xSldsarTvya1Ase6mAqEGikX9nwqOd1f47AN90WH2idlt0EMK/TE
 4JUNvpmH85sxYOY0ukZxw+QCv5sI7kS+MZZcDdta1didowQqts1DdE1cpMJairAY51II
 aLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=;
 fh=5vKdkwwwcv7NZ3ZR8q2b61icMcPo4iL7MjXe7EkRulo=;
 b=TYMHhViAjBgTMRi8LCg8nfvjhoZf03DX+gEVZi+W1fLezXYwTkAuWWhlmXaNXIMjPJ
 ckoq+FCUNuWubc6sGCgRjMd9h4yS2K9B1xVhenTdVLCqhcacn3HmUD8eIXb5OJxrXWgU
 k9xsjvRU+Z/xKqidB2mIDX3A99dTIaU6vD4jRnuuI+9Z6pK9zClsMcnTnOiFeR01w+Jj
 F3SqYPWmqedC2iEymmk9JDBASigEfB2gXgIeRff599Wbrkqcsd/IIFkCFdqfhSE70DJo
 DnNqWODi5W17oQnKTHBgyUPDrJpPOUGbaR884TEbpXsrgCy5KAoFSOwBVZfmgiDtIO6s
 mw8Q==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781854123; x=1782458923; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=;
 b=fwpGdNfgiIyttn4IihvXKJ3uw7UbNyEoMyDHuDxsIi33yn/GaUqtrLVt+OhQC2rets
 aukz5/OSqT8e+/XE2d0h0L/0qTtSDGrKkc+6qd456YOvAp6z3nEBRp5dM5IbVO6hnTMK
 Nqv7W2VCUsce+0+xZwXfhySfrBLoqQuRtJBcIQTwtSz+ro1N2qjd7nMOLrGM8hF6OqeW
 5JmlHMt1BqXegYlhRN19vrr6vjxntBXqqrKdoYEpYrqVVSjfNUqZbIPDma2n3M473rUL
 wHHsyXjSolsyH7IGJLFicppdn6MJjTkYeeMtepYZk7K/0xesnZfEy5uqu9mHIezjf2zA
 mSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781854123; x=1782458923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cXsAttpCRAfo1jUwXpOflkS7AbE4OJcRHMhxuP67MIc=;
 b=COKUeRa+/UuEhDWm53vUyQFacHSlohI5c8r9QKw+WBGlG5/7O2IJJ+49z7miUCLHW7
 KKr1VzQq8fcHGR5r0MH/QWNrb1leyhIQdK6o0qILCX7j01VezVL6q6ayvYAmS08ZUxf9
 gUPcta7ErXclW8yap2AAPvoOsGjAQibreBSepYjT2w2xs7Auc4BiCBIScfHwTXEPlmp0
 yM7hlxBS0DtvMrvqPHxVKo3K58VqR+W5tQs1XZpNCSja7pIcl5SA7zyjmNLtbCuFJqtM
 xo3L/9Q3u3jARP4x9OzabZFkLDxUB424+7AviiDpnInYXId1kbYzCO6WG1OT0VAnCq3p
 YHVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/f8Dc7oLyRlnAhbsocP97h5YVSYZCQHl9uXgTu8MuAZ0OFdd12zg4ECidWi3V+KhPnHvjFbxUiBdjIAQ9cAr8u@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxAHHaSyAwOhmYT7Ors/ZTM21HUXC15xp2tAWmAbZmHF8FbSAZB
 il5cZvoJdeizHD+eshEeeoHekJYpFghyEvJilswYKXL78zsPlZqfGNhq4diDL368gc5/ezZLfxo
 v0u3XSJepQh4Q2EMmif9w6B9d6xx/yjU=
X-Gm-Gg: AfdE7cmmN/74MKl+MlhyWBVu+05E7EuVmhTpPAyLEHdg7mUO99B36blGshFCFoj06dm
 cSJOnA9q7gMAs81ooLqTh3Gul5nSB8M2f8VVLJajPcMPaIIt5RPI9zIJXatkJdbyp/GrG/MemOX
 1wqCbhF45mKTJ89a9Ivo9+O7/cGRHblsDybU2HYGWBOIEzaefQaLbS73qbNWh0l/nyp8+/1+NH+
 81Z9Ic3QsKXRh0Q5mdlywpJGzjGQzTPcP46VwqH+EKQDWhWT2IrJ+/ACI/qBeLT1BrUq8SYmstQ
 pJUm6mEoGSoJJbvCEfCdCChT4nBKJ8y5TebfwkkeRA==
X-Received: by 2002:a05:6402:5107:b0:695:572a:7ab5 with SMTP id
 4fb4d7f45d1cf-69711e00675mr1216968a12.19.1781854123208; Fri, 19 Jun 2026
 00:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260520123722.405752-4-aalbersh@kernel.org>
 <20260520190719.GB3424023@google.com>
In-Reply-To: <20260520190719.GB3424023@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 19 Jun 2026 09:28:31 +0200
X-Gm-Features: AVVi8CcyPPKNjODd0CeG8qbXXsZeOsRanxA9PmKFMYeTLACw7w0uBX2gqOCDc0w
Message-ID: <CAOQ4uxh_hfiSwMw8ABhhrz7GguZWjHEiBmvb3eq16Wfqw0+ZrQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 20, 2026 at 9:07 PM Eric Biggers wrote: > > On
 Wed, May 20, 2026 at 02:37:01PM +0200, Andrey Albershteyn wrote: > > fsverity
 now exposes fsverity_ensure_verity_info() which could be used [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.52 listed in wl.mailspike.net]
X-Headers-End: 1waTej-0008Ll-FT
Subject: Re: [f2fs-dev] [PATCH v10 03/22] ovl: use core fsverity ensure info
 interface
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
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>,
 djwong@kernel.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[amir73il@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sashiko.dev:url,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ED976A4565

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgOTowN+KAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyMCwgMjAyNiBhdCAwMjozNzowMVBN
ICswMjAwLCBBbmRyZXkgQWxiZXJzaHRleW4gd3JvdGU6Cj4gPiBmc3Zlcml0eSBub3cgZXhwb3Nl
cyBmc3Zlcml0eV9lbnN1cmVfdmVyaXR5X2luZm8oKSB3aGljaCBjb3VsZCBiZSB1c2VkCj4gPiBp
bnN0ZWFkIG9mIG9wZW5pbmcgZmlsZSB0byBlbnN1cmUgdGhhdCBmc3Zlcml0eSBpbmZvIGlzIGxv
YWRlZCBhbmQKPiA+IGF0dGFjaGVkIHRvIGlub2RlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBBbGJlcnNodGV5biA8YWFsYmVyc2hAa2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBBbWly
IEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZnMvb3ZlcmxheWZz
L3V0aWwuYyB8IDE0ICsrKy0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBSZXZpZXdlZC1ieTogRXJpYyBCaWdnZXJzIDxl
YmlnZ2Vyc0BrZXJuZWwub3JnPgo+Cj4gSSdtIHN0aWxsIGNvbmZ1c2VkIGJ5IHRoZSBuZXcgaW1w
bGVtZW50YXRpb24gb2YgZnN2ZXJpdHlfYWN0aXZlKCkgdGhhdAo+IGdvdCBpbnRyb2R1Y2VkIGJ5
ICJmc3Zlcml0eTogdXNlIGEgaGFzaHRhYmxlIHRvIGZpbmQgdGhlIGZzdmVyaXR5X2luZm8iLAo+
IHRob3VnaC4gIEkgc2hvdWxkIGhhdmUgY2F1Z2h0IHRoaXMgZHVyaW5nIHJldmlldyBvZiB0aGF0
IGNvbW1pdC4gIEZvcgo+IG9uZSBpdHMgY29tbWVudCBpcyBvdXRkYXRlZCwgYnV0IGFsc28gdGhl
IG1lbW9yeSBiYXJyaWVyIHNlZW1zIHRvIGJlCj4gc3BlY2lmaWMgdG8gdGhlIGZzdmVyaXR5X2dl
dF9pbmZvKCkgY2FsbGVyIGFuZCBwcm9iYWJseSBzaG91bGQgYmUgbW92ZWQKPiB0byB0aGVyZS4g
IEFueXdheSwgdGhhdCdzIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHRoaXMgcGF0Y2guCgpFcmlj
LCBBbmRyZXksCgpEaWQgeW91IHNlZSB0aGUgU2FzaGlrbyByZXZpZXcgZm9yIHRoaXMgcGF0Y2gg
YW5kIG90aGVycyBpbiB0aGlzIHNlcmllcz8KCmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDUyMDEyMzcyMi40MDU3NTItMS1hYWxiZXJzaCU0MGtlcm5lbC5vcmcKCkl0IGFubm90
YXRlZCBzb21lIHJldmlldyBjb21tZW50cyBhcyBoaWdoIGFuZCBjcml0aWNhbC4KRm9yIHRoaXMg
cGF0Y2ggaXQgaXMgYWJvdXQgaW50ZXJhY3Rpb24gd2l0aCBmc2NyeXB0LgoKUGxlYXNlIHRha2Ug
YSBsb29rIGFuZCBzYXkgaWYgdGhpcyBpcyBjb25jZXJuaW5nIG9yIGZhbHNlIHBvc2l0aXZlLgoK
VGhhbmtzLApBbWlyLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
