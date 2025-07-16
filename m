Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B254AB06C16
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 05:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0tUFqzUrlDegLIxhCaegAI+ycYzzqB8rfqsYwHviADc=; b=YDkaFjuyaS62qo0VSq3xkNEZIO
	rIYGvj612ajjFJMnhWvojVLKnnX0P6XG8OZWYozMDegqhiLplY+nK09wciK7luvcW1upnGn2khZPt
	z4Ghs7oM/4rBqFFGCTWWsyeHtiKVxG0xLWR4XMSk95amvwQVTFM2SKUVW7fi/hJYLZm8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubsiE-0008SO-Ts;
	Wed, 16 Jul 2025 03:21:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1ubsiD-0008SG-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 03:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=InUiyMm7gr3COTuSD5WM9WcRkq/+CKpu41nT3AXnmRI=; b=j/g77jMzMVo/xdZKW+ZgQ8dCnC
 g+2DVBAW/g+xw5gF+HAsmqTkGyylhH1hlFGR0a5k7axAzEeLb7eLfDTpPPc8/iXZ7aQFgj2V3GPG7
 o+uUQmAODiE9oKI0HbbFSvps3nQuFukx1PipMzhvilZ4XUn2We2YU0Rd/sHs6KdN8h3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=InUiyMm7gr3COTuSD5WM9WcRkq/+CKpu41nT3AXnmRI=; b=H
 pc9IopBXMmfz5WDmZmnP4BzbqZqpkwawAc9iwEaavgWg85j6aX2V309X8NCYZCGrcfca24ky/xW12
 h9NK/Iw0gJjeaZwmLAxayWlB6iRJgkLhHCEgpE7Fbj8Xd5fs3Y7mOdiHOpjMfhAHK881f6WkZKDpE
 iMf+zjcWg4tnFFo4=;
Received: from mail-oa1-f68.google.com ([209.85.160.68])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubsiC-0002C0-TQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 03:21:41 +0000
Received: by mail-oa1-f68.google.com with SMTP id
 586e51a60fabf-2efdd5c22dfso3387896fac.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 20:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752636090; x=1753240890; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=InUiyMm7gr3COTuSD5WM9WcRkq/+CKpu41nT3AXnmRI=;
 b=m3bfJkJforPe5CpgMJKG4zDA6/ogAz5ddyBAVoWhaSzDfgVP81xHrjGQe4ClN2zYWw
 ywt93m9uwxwEEi1ChUbajioOh1bjx0n5Z+FbcFzrGGGJmu8wtI2rEAqp3tBOMmKedpoR
 6eXUgLCfS5zx0rkbsAnRbMMqBUdNqtlU/UVrbCcF0m/pYqawg0/yuex5sSBpqmi23+Yg
 hL7yw+2VdXXqsr7H1x++1pKC1G/4JA1vE6vXFY8i3xSRtsc11eB8aZTC9hJlZx6BtiWT
 MhjllkvM8KpXuK/OtgusWlo5f3cwLFSoarHdbRHuvKLEIJreb/k2e6wKDqy5bO3ah7+p
 pFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752636090; x=1753240890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=InUiyMm7gr3COTuSD5WM9WcRkq/+CKpu41nT3AXnmRI=;
 b=aL7N/cNyVbYpHtTIZR/oe2YTbFocguSXWpVq8D82Vkg2o1JPxX+mN/7Dnt8zz06PD4
 Zu9ym4pbdl2r1VLPIJpcBPPyIsTJKzBMSklnhDf/4xtTlaNYVayEKJWNyp8xpIfPqRfL
 QqoBHSdhZgULH1PBlpAStCiUSC8oRPTqjssyIhrX9WuFXoRKlhvSSbT0bN+1FXCnIrkD
 upXMgyMvlR/Y9gRMlHPwmnplevuTJu3MRtMJsJRAz8gpKNXd0qGvJ/l6IUSwg7/WcMFl
 0VtQkbunjjqwFrC+4fbmniSaEylsrFxg4n7OliDo0nVgnA9LjfZmXWeuUXSuZenI2c/p
 yNhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTH3zf1FWYNYpwrXGL51/4nRjYZMoZFanE5cvI378KpnYneod/Mh9F3AO/EPm/nWREexHgVnfK0qPGs6HolA5a@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwS4rZvStfozb+/CLGNdMXo1IIjUd2y7YD7U/bMczOiBDQZkdhL
 iNLV7i379YbBt05iZ5dztJ27BxiVU+8cABrucmRe58121fT7/8qyK3tokEe7vinGi8VhWdjyP7s
 CsjR3sRMVuARax7nUy/TuGXzF9Yvx34mQsE8kfAKs32ajYEHnXg==
X-Gm-Gg: ASbGncuJLjecZaRc5JGyGLfRvTdoQF9Ij9AT7lUbofbLSwmNTP3saamd1n8vYDd/nwb
 Z1AYJLVwiC6fVzPe7b+iPjVjGAaAaf2Gj84iGG3nKi6+gowBwCXab+pZqgav3ziBQAc1Nxyze3U
 7S/kt9/GQhvTOMKpMNIrW3UJmwB4aYlOnJnKHZGJH4SDJ3Lb8bY+fuWzr88QvUmXagl6SDBCYTU
 rWHYZowB/LABHXZ
X-Google-Smtp-Source: AGHT+IFyLwkV9mILJQbV+kbn7RjvFiGLh7yKX5x2YaAx2SKlK7xvUhTjS6vpStp4kfPeSkmgwOKnQtHPTOz5BVne74A=
X-Received: by 2002:a05:6870:d88a:b0:2d5:336f:1b5c with SMTP id
 586e51a60fabf-2ffb24d192amr988390fac.34.1752636090098; Tue, 15 Jul 2025
 20:21:30 -0700 (PDT)
MIME-Version: 1.0
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Wed, 16 Jul 2025 11:21:18 +0800
X-Gm-Features: Ac12FXxyvfNuoq6EvJBxQuF0ETJxEKTBdNSnwB_ChV1lMjyZmff8pJLBThDiALw
Message-ID: <CAMLCH1HCPByhWGQjix6040fZuZhjkj19k=4pqmNzPDtGeZ0Q6A@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Matthew and other filesystem developers,
 I've been experimenting
 with implementing large folio support for compressed files in F2FS locally,
 and I'd like to describe the situation from the F2FS perspective. 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao.sigma(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.68 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ubsiC-0002C0-TQ
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: jack@suse.cz, pc@manguebit.org, dhowells@redhat.com, clm@fb.com,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org, richard@nod.at,
 xiang@kernel.org, josef@toxicpanda.com, netfs@lists.linux.dev,
 dsterba@suse.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 almaz.alexandrovich@paragon-software.com, nico@fluxnic.net,
 dwmw2@infradead.org, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, sfrench@samba.org,
 linux-fsdevel@vger.kernel.org, phillip@squashfs.org.uk, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBNYXR0aGV3IGFuZCBvdGhlciBmaWxlc3lzdGVtIGRldmVsb3BlcnMsCgpJJ3ZlIGJlZW4g
ZXhwZXJpbWVudGluZyB3aXRoIGltcGxlbWVudGluZyBsYXJnZSBmb2xpbyBzdXBwb3J0IGZvcgpj
b21wcmVzc2VkIGZpbGVzIGluIEYyRlMgbG9jYWxseSwgYW5kIEknZCBsaWtlIHRvIGRlc2NyaWJl
IHRoZQpzaXR1YXRpb24gZnJvbSB0aGUgRjJGUyBwZXJzcGVjdGl2ZS4KCj4gRmlyc3QsIEkgYmVs
aWV2ZSB0aGF0IGFsbCBmaWxlc3lzdGVtcyB3b3JrIGJ5IGNvbXByZXNzaW5nIGZpeGVkLXNpemUK
PiBwbGFpbnRleHQgaW50byB2YXJpYWJsZS1zaXplZCBjb21wcmVzc2VkIGJsb2Nrcy4KCldlbGws
IHllcy4gRjJGUydzIGN1cnJlbnQgY29tcHJlc3Npb24gaW1wbGVtZW50YXRpb24gZG9lcyBjb21w
cmVzcwpmaXhlZC1zaXplIG1lbW9yeSBpbnRvIHZhcmlhYmxlLXNpemVkIGJsb2Nrcy4gSG93ZXZl
ciwgRjJGUyBvcGVyYXRlcwpvbiBhIGZpeGVkLXNpemUgdW5pdCBjYWxsZWQgYSAiY2x1c3Rlci4i
IEEgZmlsZSBpcyBsb2dpY2FsbHkgZGl2aWRlZAppbnRvIHRoZXNlIGNsdXN0ZXJzLCBhbmQgZWFj
aCBjbHVzdGVyIGNvcnJlc3BvbmRzIHRvIGEgZml4ZWQgbnVtYmVyIG9mCmNvbnRpZ3VvdXMgcGFn
ZSBpbmRpY2VzLiBUaGUgY2x1c3RlciBzaXplIGlzIDQgPDwgbiBwYWdlcywgd2l0aCBuCnR5cGlj
YWxseSBkZWZhdWx0aW5nIHRvIDAgKG1ha2luZyBhIDQtcGFnZSBjbHVzdGVyKS4KCkYyRlMgY2Fu
IG9ubHkgcGVyZm9ybSBjb21wcmVzc2lvbiBvbiBhIHBlci1jbHVzdGVyIGJhc2lzOyBpdCBjYW5u
b3QKb3BlcmF0ZSBvbiBhIHVuaXQgbGFyZ2VyIHRoYW4gdGhlIGxvZ2ljYWwgc2l6ZSBvZiBhIGNs
dXN0ZXIuIFNvLCBmb3IgYQoxNi1wYWdlIGZvbGlvIHdpdGggYSA0LXBhZ2UgY2x1c3RlciBzaXpl
LCB3ZSB3b3VsZCBoYXZlIHRvIHNwbGl0IHRoZQpmb2xpbyBpbnRvIGZvdXIgc2VwYXJhdGUgY2x1
c3RlcnMuIFdlIHRoZW4gcGVyZm9ybSBjb21wcmVzc2lvbiBvbiBlYWNoCmNsdXN0ZXIgaW5kaXZp
ZHVhbGx5IGFuZCB3cml0ZSBiYWNrIGVhY2ggY29tcHJlc3NlZCByZXN1bHQgdG8gZGlzawpzZXBh
cmF0ZWx5LldlIGNhbm5vdCBwZXJmb3JtIGNvbXByZXNzaW9uIG9uIHRoZSB3aG9sZSBsYXJnZSBj
aHVuayBvZgpmb2xpby4gSW4gZmFjdCwgdGhlIGZhY3QgdGhhdCBhIGxhcmdlIGZvbGlvIGNhbiBz
cGFuIG11bHRpcGxlIGNsdXN0ZXJzCndhcyB0aGUgbWFpbiBoZWFkYWNoZSBpbiBteSBhdHRlbXB0
IHRvIGltcGxlbWVudCBsYXJnZSBmb2xpbyBzdXBwb3J0CmZvciBGMkZTIGNvbXByZXNzaW9uLgoK
V2h5IGlzIHRoaXMgdGhlIGNhc2U/IEl0J3MgZHVlIHRvIEYyRlMncyBjdXJyZW50IG9uLWRpc2sg
bGF5b3V0IGZvcgpjb21wcmVzc2VkIGRhdGEuIEVhY2ggY2x1c3RlciBpcyBwcmVmaXhlZCBieSBh
IHNwZWNpYWwgYmxvY2sgYWRkcmVzcywKQ09NUFJFU1NfQUREUiwgd2hpY2ggc2VwYXJhdGVzIG9u
ZSBjbHVzdGVyIGZyb20gdGhlIG5leHQgb24gZGlzay4KRnVydGhlcm1vcmUsIGFmdGVyIEYyRlMg
Y29tcHJlc3NlcyB0aGUgb3JpZ2luYWwgZGF0YSBpbiBhIGNsdXN0ZXIsIHRoZQpzcGFjZSBmcmVl
ZCB1cCB3aXRoaW4gdGhhdCBjbHVzdGVyIHJlbWFpbnMgcmVzZXJ2ZWQgb24gZGlzazsgaXQgaXMg
bm90CnJlbGVhc2VkIGZvciBvdGhlciBmaWxlcyB0byB1c2UuIFlvdSBtYXkgaGF2ZSBoZWFyZCB0
aGF0IEYyRlMKY29tcHJlc3Npb24gZG9lc24ndCBhY3R1YWxseSBzYXZlIHNwYWNlIGZvciB0aGUg
dXNlcuKAlHRoaXMgaXMgdGhlCnJlYXNvbi4gSW4gRjJGUywgdGhlIG1vZGVsIGlzIG5vdCB3aGF0
IHdlIG1pZ2h0IGludHVpdGl2ZWx5IGV4cGVjdOKAlGEKbGFyZ2UgY2h1bmsgb2YgZGF0YSBiZWlu
ZyBjb21wcmVzc2VkIGludG8gYSBzZXJpZXMgb2YgdGlnaHRseSBwYWNrZWQKZGF0YSBibG9ja3Mg
b24gZGlzayAod2hpY2ggSSBhc3N1bWUgaXMgdGhlIG1vZGVsIG90aGVyIGZpbGVzeXN0ZW1zCmFk
b3B0KS4KClNvLCByZWdhcmRpbmc6Cgo+IFNvLCBteSBwcm9wb3NhbCBpcyB0aGF0IGZpbGVzeXN0
ZW1zIHRlbGwgdGhlIHBhZ2UgY2FjaGUgdGhhdCB0aGVpciBtaW5pbXVtCj4gZm9saW8gc2l6ZSBp
cyB0aGUgY29tcHJlc3Npb24gYmxvY2sgc2l6ZS4gVGhhdCBzZWVtcyB0byBiZSBhcm91bmQgNjRr
LAo+IHNvIG5vdCBhbiB1bnJlYXNvbmFibGUgbWluaW11bSBhbGxvY2F0aW9uIHNpemUuCgoKRjJG
UyBkb2Vzbid0IGhhdmUgYSB1bmlmb3JtICJjb21wcmVzc2lvbiBibG9jayBzaXplLiIgSXQgcHVy
ZWx5CmRlcGVuZHMgb24gdGhlIGNvbmZpZ3VyZWQgY2x1c3RlciBzaXplLCBhbmQgdGhlIHJlc3Vs
dGluZyBjb21wcmVzc2VkCnNpemUgaXMgZGV0ZXJtaW5lZCBieSB0aGUgY29tcHJlc3Npb24gcmF0
aW8uIEZvciBleGFtcGxlLCBhIDQtcGFnZQpjbHVzdGVyIGNvdWxkIGJlIGNvbXByZXNzZWQgZG93
biB0byBhIHNpbmdsZSBibG9jay4KClJlZ2FyZGluZyB0aGUgZm9saW8gb3JkZXIsIHBlcmhhcHMg
d2UgY291bGQgc2V0IGl0cyBtYXhpbXVtIG9yZGVyIHRvCm1hdGNoIHRoZSBjbHVzdGVyIHNpemUs
IHdoaWxlIGtlZXBpbmcgdGhlIG1pbmltdW0gb3JkZXIgYXQgMC4gSG93ZXZlciwKZm9yIHNtYWxs
ZXIgY2x1c3RlciBzaXplcywgdGhpcyB3b3VsZCBjb21wbGV0ZWx5IGxpbWl0IHRoZSBwb3RlbnRp
YWwKb2YgdXNpbmcgbGFyZ2VyIGZvbGlvcy4gTXkgb3duIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
bWFrZXMgbm8KYXNzdW1wdGlvbnMgYWJvdXQgdGhlIG1heGltdW0gZm9saW8gb3JkZXIuIEFzIEkg
YW0gYSBzdHVkZW50LCBJIGxhY2sKZXh0ZW5zaXZlIGV4cGVyaWVuY2UsIHNvIGl0J3MgZGlmZmlj
dWx0IGZvciBtZSB0byBldmFsdWF0ZSB0aGUgcHJvcwphbmQgY29ucyBvZiB0aGVzZSB0d28gYXBw
cm9hY2hlcy4gSSBiZWxpZXZlIE1yIENoYW8gWXUgY291bGQgcHJvdmlkZSBhCm1vcmUgY29uc3Ry
dWN0aXZlIHN1Z2dlc3Rpb24gb24gdGhpcyBwb2ludC4KClRoaW5raW5nIGFib3V0IGEgcG9zc2li
bGUgaW1wbGVtZW50YXRpb24gZm9yIHlvdXIgcHJvcG9zYWwgb2YgYSA2NEtCCnNpemUgYW5kIGlu
LXBsYWNlIGNvbXByZXNzaW9uIGluIHRoZSBjb250ZXh0IG9mIEYyRlMsIEkgdGhpbmsgdGhlCnBv
c3NpYmxlIGFwcHJvYWNoIG1heSBiZSB0byBzZXQgdGhlIG1heGltdW0gZm9saW8gb3JkZXIgdG8g
NCBwYWdlcy4KVGhpcyB3b3VsZCBhbGlnbiB3aXRoIHRoZSBkZWZhdWx0IGNsdXN0ZXIgc2l6ZSAo
ZXNwZWNpYWxseSByZWxldmFudCBhcwpGMkZTIG1vdmVzIHRvIHN1cHBvcnQgMTZLIHBhZ2VzIGFu
ZCBibG9ja3MpLiBXZSBjb3VsZCB0aGVuIHBlcmZvcm0KY29tcHJlc3Npb24gaW4tcGxhY2UsIGVs
aW1pbmF0aW5nIHRoZSBuZWVkIGZvciBzY3JhdGNoIHBhZ2VzICh3aGljaAphcmUgdGhlIGNvbXBy
ZXNzZWQgcGFnZXMvZm9saW9zIGluIHRoZSBGMkZTIGNvbnRleHQpIGFuZCBhbHNvIGRpc2FibGUK
cGVyLXBhZ2UgZGlydHkgdHJhY2tpbmcgZm9yIHRoYXQgZm9saW8uCgpIb3dldmVyLCBGMkZTIGhh
cyBmYWxsYmFjayBsb2dpYyBmb3Igd2hlbiBjb21wcmVzc2lvbiBmYWlscyBkdXJpbmcKd3JpdGVi
YWNrLiBUaGUgb3JpZ2luYWwgRjJGUyBsb2dpYyBzdGlsbCByZWxpZXMgb24gcGVyLXBhZ2UgZGly
dHkKdHJhY2tpbmcgZm9yIHdyaXRlcy4gSWYgd2Ugd2VyZSB0byBjb21wbGV0ZWx5IHJlbW92ZSBw
ZXItcGFnZSB0cmFja2luZwpmb3IgdGhlIGZvbGlvLHRoZW4gaW4gY29tcHJlc3Npb24gZmFpbHVy
ZSBjYXNlIHdlIHdvdWxkIGJlYXIgdGhlIGNvc3QKb2Ygb25lIHdyaXRlIGFtcGxpZmljYXRpb24u
CgpUaGVzZSBhcmUganVzdCBteSBwZXJzb25hbCB0aG91Z2h0cyBvbiB5b3VyIHByb3Bvc2FsLiBJ
IGJlbGlldmUgTXIKQ2hhbyBZdSBjYW4gcHJvdmlkZSBtb3JlIGRldGFpbGVkIGluc2lnaHRzIGlu
dG8gdGhlIHNwZWNpZmljcyBvZiBGMkZTLgoKQmVzdCByZWdhcmRzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
