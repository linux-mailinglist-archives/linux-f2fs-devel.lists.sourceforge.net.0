Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F5D1074D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 04:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vugOmhQe8nAiOfDDliD5sYKayiCG7eLIGRMqyxJPwko=; b=ggZr8ggWdF4aQKIFeeiHCNdul3
	G6oqR20ObVPvEPYaf8xoUn5sXgQFGkrMOgeIIuD6OsAnqjYbQ5sJUWkg07O/94stLs7Q9BbxCgrAv
	zFX5qFH0D46V+aLpwmVasNLukON9cyoDc0rDIQFHJX9fwY9fJrawfNTE4IpvXJjIvZok=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vf8UM-0002cG-0j;
	Mon, 12 Jan 2026 03:21:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannechien@google.com>) id 1vf8UK-0002c9-Ij
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 03:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EiOwJsS2Mb41IcQigwv6qcMuzuTrJ+f/o5v4xhTPl8s=; b=M5Yfgat6t+9eR3ruD/LCpTOia8
 2MOcI6ZcpCXKpybf7nE1KOGPRZpH6YuVtMgYpDRBDuVnwdq7FpnXkbEXcfgffBkxRT2Gx0heSTcGd
 FNgcgBki9yQsBG/4TnEIEMnx2AShQ/OWOVRmRtNM897DLbygTVJqd+eVA45pafw9aO38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EiOwJsS2Mb41IcQigwv6qcMuzuTrJ+f/o5v4xhTPl8s=; b=iuvp34pdQc4axMfi7Rjf8kyJoi
 NCuzIBsI7SaXqhtiztYS5815/ZEoCdKGfqTeN1xK5pxoC6UyX4MW4otUsXWpp5Pg47lUQPRiJdBFz
 zcj/pjCNv1CsvUHg/stoRvkYgBJZa8iHtBkzc0PLh0WR9n3I5y+cdl+F4InTO6tj9QPU=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vf8UK-00072y-6K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 03:21:04 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64baa44df99so7606a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Jan 2026 19:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768188052; cv=none;
 d=google.com; s=arc-20240605;
 b=XlAAIQ69WpKVE/uLxQD0P0rla5DGoWqGzFnZegjZY24BfmBaJpE6eNICa/dUuqnf7D
 SceGfFWL5kF2+p558dhDNw40q+gF1i0NhBOzvEhzKUsX1QYxjCWF3dcVXsbKGXA6vEB5
 zpcB0NFce0D//RvvGgwnKU8D3tDbCp78Lkty6CB6Kwy9bmYI1UH1RIgbgOFPviRXvpKC
 aV35OadT/b+HDP2Pc1RB/4EevxDmcAwoluncGpDu0SgI9Etj8Hh8VeX/MJhFztpIvIar
 gDgma4UBMys1L6JyM4JSzWNLnAYy8m7msc2/hKvoFGNEwefniYQu0TIBj3E6m2cJ26vA
 SzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EiOwJsS2Mb41IcQigwv6qcMuzuTrJ+f/o5v4xhTPl8s=;
 fh=kECVkmUYkCbiTQuVpwuPNnulVGlce2kx8OmWH1LXywQ=;
 b=BuwxD9xtPPEC/31KiGgN5++ZeDeHasZiluGcUcBm0zWFBsN8IGaOM9gDVa6ODo5FAE
 x5pZyshVN8bFSYtcLFIxV5VyeToeBMkkNnmSMPH099eGDVglJHGz3nAOXbxLJXC3+YnP
 Ud0p8/somyMYDmJ9A1D46Rzv+Wmw0+LFyfdzg6mhuwjq3KgbQr3WSeqi/xAfZhXRDXmH
 fJf/eDD/MiEvuGRaXPsxfe/6YSp8bFTZS4poeFSEbTMhd+TwkiEmUgRUT9MNFzCEpV5t
 3SwUFs9vCb+CX9oIHfA0P/WZqIar2xkB4H6k2NnFXpkttrjhzVKpZMr98inLtVan9REm
 bj5w==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768188052; x=1768792852;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EiOwJsS2Mb41IcQigwv6qcMuzuTrJ+f/o5v4xhTPl8s=;
 b=YrvPKsE1zl+6+SGXZkJtgOvJxx0kpsTdaOcx6W7QBJohIg725wbwa0g2RhwYQ252Ae
 gjWzzFy+C+pFpvR55mldxis3ehyjh5X+YTsXKQcLZwTz9cUon8K84Nx/vE6ow1OSKTvK
 9Ji6J+JLukWBbNiK6J9BaAOA2GBTWaLhfgzFYcBiuqAbv5yiJ6YCVKa+3Y51j9lNxRc3
 2sA9wRuQVC4oE/zGiGov/XZRT6kQ3CHJ70L+OyqVSVvfvVwhqDo+tuQFLCYRrAh+dhne
 zLu4wreIkeMbqtnoOe9xB4G9+leZer01ShX0IvoI613qSAiWnrIt1XAxIJjqJytyLWAk
 3Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188052; x=1768792852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EiOwJsS2Mb41IcQigwv6qcMuzuTrJ+f/o5v4xhTPl8s=;
 b=Cakib6OKsg5t4crMajR4fqWAVgjV/UOlUxzMykzWMasw38Rv1stQEmXRXLCA2dcNl2
 JEfGpRI/Qit8WIaRUT+Vsd/moWBJTQtLAAZozgFtfdgxsKBM0dgFEnNdAyIv6SgWpQd7
 E/jN/7HkbA1KU3U2eZVZn7ZMLf1BEAFXnNGCX0UmrYvu+l9iKEDsIKqnevvApgn7FbsR
 ejmyZzCjBrQYjW9jNh66LyM3DUoXj89wi0eJTHdANRLLiIAFqgs/O7vKSl4EP4gCIZD4
 W5t6UrFnoFNQpIQ8EABJa14WfPkHDFcQ6+ry8YiOS1AqpnZGwtXqNIIGv/NK625shnad
 sAoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhNLxnLud832AoKiCkfphy4ri5jRBM/+Fi8GDZSHXhzBWrcdfkpfWCOvcn3iNS7I6cCJ5Zb52jO9gUmnQxV1Xr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YynsR2DcvnMOh3L+E5Yd7ZYAPBO/dMCY12CxbcW6HimjK4BMe0X
 IBYXXBozVklFKzVLF+rHCLpwcV4MYgzfwblExjEXzhCQIS3DwzJyapdX4tLzZQGQyv17NudQ9tU
 dh7qGFBH7u0eMYCoYZ7yeYYrRlJ/2ab2+RZVSgRat
X-Gm-Gg: AY/fxX6YyY/vjMWnv8xL5AxvI5Du7ghsGZ4+RopOca/3BBMrqnV0ip6mrb5ndkP9RgR
 bj/mWWU/HrsZHoSwcTXO10teOyJSZKVM7hL8+VnxTyTUPKc+wJs6OE3D0+Tbv32ul0Y82tN39Zj
 rwpnxpOVr5dcK1VW5+vqj3yNCqM/MvemD4TI4q5fMtC84S8ozjBCEnhHKCRtHfsmfqikVKi7Bmn
 +lDj5RVBNazjMRiRzoCmKTbuU9mWH0K5XcQrzgX6nxTSwk/PFLQ8WAXrd3+//zVz1yeUqmZhuXa
 t7InGDJvC9qLYlqFH1Gycf9gCw==
X-Received: by 2002:a05:6402:3247:10b0:640:914c:ab91 with SMTP id
 4fb4d7f45d1cf-650e1c630b2mr25369a12.3.1768188052435; Sun, 11 Jan 2026
 19:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20260108022501.754320-1-joannechien@google.com>
 <20260110013802.GB15541@frogsfrogsfrogs>
In-Reply-To: <20260110013802.GB15541@frogsfrogsfrogs>
Date: Mon, 12 Jan 2026 11:20:36 +0800
X-Gm-Features: AZwV_QgU0fitCf0PtTsBsdoG7CCI7PWtCAAHNpGVJaE4kCuClnPyVV2Wi5ljuKM
Message-ID: <CACQK4XDtrE5P-PjwSqvGtmEmMvEQS4r2KZkDh55LXY2YAoH6vw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 10,
 2026 at 9:38 AM Darrick J. Wong <djwong@kernel.org>
 wrote: > On Thu, Jan 08, 2026 at 02:25:01AM +0000, Joanne Chang wrote: >
 > generic/735 attempts to create a file with nearly 2^32 bl [...] 
 Content analysis details:   (-7.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.208.53 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 ARC_VALID              Message has a valid ARC signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.53 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vf8UK-00072y-6K
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: add _require_blocks_in_file
 helper
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBKYW4gMTAsIDIwMjYgYXQgOTozOOKAr0FNIERhcnJpY2sgSi4gV29uZyA8ZGp3b25n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgSmFuIDA4LCAyMDI2IGF0IDAyOjI1OjAxQU0g
KzAwMDAsIEpvYW5uZSBDaGFuZyB3cm90ZToKPiA+IGdlbmVyaWMvNzM1IGF0dGVtcHRzIHRvIGNy
ZWF0ZSBhIGZpbGUgd2l0aCBuZWFybHkgMl4zMiBibG9ja3MuIEhvd2V2ZXIsCj4gPiBzb21lIGZp
bGVzeXN0ZW1zIGhhdmUgYSBtYXhpbXVtIGZpbGUgYmxvY2sgbGltaXQgYmVsb3cgdGhpcyB0aHJl
c2hvbGQuCj4gPiBGb3IgaW5zdGFuY2UsIEYyRlMgaXMgbGltaXRlZCB0byBhcHByb3hpbWF0ZWx5
IDJeMzAgYmxvY2tzIGR1ZSB0byB0aGUKPiA+IGNhcGFjaXR5IG9mIHRoZSBpbm9kZS4gU28gYWRk
IF9yZXF1aXJlX2Jsb2Nrc19pbl9maWxlIGhlbHBlciB0byBza2lwIHRoZQo+ID4gdGVzdCBpbiBz
dWNoIGNhc2VzLgo+ID4KPiA+IFRoZSBoZWxwZXIgdXNlcyBhIGhhcmRjb2RlZCBjb25zdGFudCBp
bnN0ZWFkIG9mIGEgcHJvZ3JhbW1hdGljIG1ldGhvZCwKPiA+IHNvIHRoYXQgYnVncyB3aGljaCBh
ZmZlY3QgdGhlIG1heGltdW0gZmlsZSBzaXplIGFyZSBub3QgbWFza2VkLgo+Cj4gTm90IHRvIG1l
bnRpb24gdHJ5aW5nIHRvIGNyZWF0ZSBhIGZpbGUgd2l0aCAxLDA1NywwNTMsNDM5IGJsb2Nrcwo+
IGFsbG9jYXRlZCB0byBpdCB3b3VsZCBwcm9iYWJseSB0YWtlIGZvcmV2ZXIuCj4KPiBIYW5nIG9u
LCB3ZSdyZSB0YWxraW5nIGFib3V0IGlibG9ja3MgKGFrYSB0aGUgbnVtYmVyIG9mIGJsb2NrcyBh
bGxvY2F0ZWQKPiB0byB0aGlzIGlub2RlKSwgbm90IHRoZSBtYXhpbXVtIGZpbGUgc2l6ZSBpbiBi
bG9ja3MsIHJpZ2h0Pwo+Cj4gSWYgc28sIHRoZW4gbWF5YmUgdGhpcyBmdW5jdGlvbiBhbmQgaXRz
IGNvbW1lbnRzIHNob3VsZAo+IHMvYmxvY2tzL2libG9ja3MvPyAgT3IgYW0gSSBjb25mdXNlZD8g
OykKPgo+IC0tRAoKSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgZ2VuZXJpYy83MzUgY3JlYXRl
cyBhIGxhcmdlIGxvZ2ljYWwgZmlsZSwgYnV0CnRoZSBhY3R1YWwgcGh5c2ljYWwgYmxvY2sgYWxs
b2NhdGlvbiBpcyBtdWNoIHNtYWxsZXIuIEFsc28sIHRoZSBGMkZTCmxpbWl0YXRpb24gaXMgYWJv
dXQgaG93IG1hbnkgYmxvY2tzIHRoZSBpbm9kZSBjYW4gYWRkcmVzcywgbm8gbWF0dGVyIGlmCnRo
ZSBibG9ja3MgYXJlIGFjdHVhbGx5IGFsbG9jYXRlZC4KClNvIEkgYmVsaWV2ZSB0aGUgcmVxdWly
ZW1lbnQgaXMgYWJvdXQgdGhlIG1heGltdW0gZmlsZSBzaXplIGluIGJsb2NrcywKbm90IHRoZSBu
dW1iZXIgb2YgYmxvY2tzIGFjdHVhbGx5IGFsbG9jYXRlZC4gRG9lcyBpdCBtYWtlIHNlbnNlIHRv
IGtlZXAKdGhlIG5hbWUsIG9yIGRvIHlvdSB0aGluayBhbm90aGVyIHRlcm0gd291bGQgYmUgY2xl
YXJlcj8gSSBhcHByZWNpYXRlCnlvdXIgdGhvdWdodHMgb24gdGhpcy4KCkJlc3QgcmVnYXJkcywK
Sm9hbm5lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
