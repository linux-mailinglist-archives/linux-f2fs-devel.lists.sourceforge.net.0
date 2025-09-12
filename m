Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3CEB54F3E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 15:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGkGZvFmpKALoDC9ruBlXqexHkUlk+zf7I6qq2aMMac=; b=N/6U3jhVabw7414Hmr5hZ6kN07
	Dko/PbVZD4wkmZTMXsYWTxSuJFCXSPcqhR1FDDjb7DitHnXp0WP1ODLXber5IsLG5bGS28kzOk1+H
	j2s5Fr/QgfxNf/nsqSq+65gaZUj+8jYBUMZ9tmFkKC7D/3uGkWYiq66XnQU8sHZwTab8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ux3gJ-0004mv-Dq;
	Fri, 12 Sep 2025 13:19:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jprusakowski@google.com>) id 1ux3gB-0004mC-83
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 13:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0IJTgbxKAf0+RaiQSR2CuSpJwpcWD0Pbtbq7THtV8M=; b=aF7LzmSCYSbQZcWJ4GF2NK+myO
 +iGSGfVMZYIVDMcKNe3IplZXEHagG6j6rJLNpDqqz78hg7xhiwmWlFj7qaXV8MszyR64sRMzAShPc
 ZfAzUsS3PjC/U5sCqM1L5mlXBPHYldKNaKFwFKT7NdU87UZhgoC4gA78J5UCRiD9nrjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W0IJTgbxKAf0+RaiQSR2CuSpJwpcWD0Pbtbq7THtV8M=; b=BilwMbKjpauT5LNeJJ54gyk0TW
 Aj5zuUGhkxgIMSpWEvbxzBKyMa8KiaaQeCRGsl39Am9GMavvAlmjtVxJu+7aCd1p8uVFRXyPgZVWr
 ruAGVDGtpddgytdSNE5FnPLOLd/Q0G5nPj3KGrNrjB/c3/Bhpd2ujFTBOo0arvFMK+tY=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ux3gB-0001BY-LM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 13:19:07 +0000
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4b48fc1d998so236911cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Sep 2025 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757683137; x=1758287937;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0IJTgbxKAf0+RaiQSR2CuSpJwpcWD0Pbtbq7THtV8M=;
 b=V146i04NjgomdWVuYo3QofOC8a/NAMwhklVQA6ZI01mtkPbc2i0OQzQW8F/IyAFfMA
 JPfqoAi8aWZCZXY60Xrx/yHxd1zGNzjf+XMknhVC4B28iSt336rSLK9+0v7X4w6LOe30
 H5uAy6rV4Gjx40d8FdMzE0N6+6vVPLrGrInsXx9gXLieLlImctk/fKB7uTBebg8kgHpA
 mDIf0rwvywn8tWVhQ2VgVGPqpKITKpF229Th2KpOWDG1odRXZnTeJrpDJBjxma0495pg
 cqXWUWrL/Nondnh2w3DALmXsaM0K61yuHX4/48wWCive+Q4yrZ6ZnZ8PCNqlX0vm+sor
 UJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757683137; x=1758287937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0IJTgbxKAf0+RaiQSR2CuSpJwpcWD0Pbtbq7THtV8M=;
 b=rYH6XP3ZBcV7iFXtwN8sKMZiEqjlM0PTao6w5j0va8uyMC2m7uLq7ET9Br+okYhuII
 PXkb5qjuf0KSZ0bkZOR8Tlf5v1zouNAiWbdcp7lVxPOmy+F4lI36SzQ2ruzw/KhxTYEB
 SpPizyKIBY+lgaSz6NEJKRlXH2CxzCtGoyaCXFklR+DWiE3pGcc9JIBTLfEQnnQdHnPO
 Vi1uSIQW5ZPe9Spohw4ebCKJGB3j2+jNjiYEGe9LmC2Degb5XfZiQnmITFxhArqf1pUZ
 rBBbhb7pB03jYKeG0Bd05yXaNfNnowq4Mq2yFttsc4DrE9llKzOd0wjPcEY8ICrcOTjE
 1Rzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkSTA2lptZPzuvlgBMExZapkyFsmc5MJ6j3mD3a9ffbzaG1MaujA8n86rp65Jqc1qbr0tsv4bRMmTncnsu4jXL@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7IwCzY8iHdwKJSiu1wjwbBA28TaQBXCVUDvtXHaehhT08vCw5
 YpaNmujI0+9X6JjSapOikPUbDPymV7X/eT0xiifrFZP2FyyAl1xAlauopjR9wuR3J6a1QtyPvs9
 +is06PB6rAC91DZ2nqHQ1MGiKzGL8/cTduhqdyQqy9b/NkNcflyFUZiyxBw8=
X-Gm-Gg: ASbGncsm9W5uTHmB3g2Q1LO7MHy4oo5IbRK/Gm1mGql3d3XiyGMO2Pn7yrL8Y15MDAe
 6WgMTnO60ps1kexYOYPHYZkhLkKtw8dIuY3TwpjaAGnGpAf659pXLQ35irw7Lgh+jS8kAz1Wv9m
 HA6fQUnzFugjwj7/YBMdZWmu+HPPGJ1sJt/s7KNmrHeMDGEQjRv+1+F5oFxw4FHDsNGWsVffjvV
 NKjwn+uFYXqaL8jhUH6pjg1DSsXyZyXMQ==
X-Google-Smtp-Source: AGHT+IGlE0WDMv18QJ1GxIJR6YpLQWS18GGDDF9+CS2pdyiRL1fHYN1lVxFBGUoHghSIWV5HRhnM7f0a73dNgJeqpiM=
X-Received: by 2002:a05:6e02:160c:b0:411:650e:654b with SMTP id
 e9e14a558f8ab-41655b596d9mr19408195ab.12.1757682676499; Fri, 12 Sep 2025
 06:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250904085449.290354-1-jprusakowski@google.com>
 <20250904173917.GB854551@google.com>
In-Reply-To: <20250904173917.GB854551@google.com>
Date: Fri, 12 Sep 2025 15:11:04 +0200
X-Gm-Features: Ac12FXzhk3ZBJu_QrvFVGQM6mz-r4gD8CC07BuagrfHcLgV3UBDDAxsdFWUhp40
Message-ID: <CAHwWncg9NH4xKD3QZfe8jHtqHZ1==XbX-Rif+rrOObbFnEu3hA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 4,
 2025 at 7:39 PM Eric Biggers <ebiggers@kernel.org>
 wrote: > Apparently this is for f2fs. There isn't really any such thing as
 a > "compressed filesystem" for f2fs. Rather, f2fs supports [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ux3gB-0001BY-LM
Subject: Re: [f2fs-dev] [PATCH v1] common/encrypt: Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBTZXAgNCwgMjAyNSBhdCA3OjM54oCvUE0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPiB3cm90ZToKPiBBcHBhcmVudGx5IHRoaXMgaXMgZm9yIGYyZnMuICBUaGVyZSBp
c24ndCByZWFsbHkgYW55IHN1Y2ggdGhpbmcgYXMgYQo+ICJjb21wcmVzc2VkIGZpbGVzeXN0ZW0i
IGZvciBmMmZzLiAgUmF0aGVyLCBmMmZzIHN1cHBvcnRzIGNvbXByZXNzaW9uIG9uCj4gYSBwZXIt
ZmlsZSBiYXNpczogdGhlIGZpbGVzeXN0ZW0gY2FuIGNvbnRhaW4gYSBtaXggb2YgY29tcHJlc3Nl
ZCBhbmQKPiB1bmNvbXByZXNzZWQgZmlsZXMuICBQcm9iYWJseSB5b3UgdXNlZCAnY29tcHJlc3Np
b25fZXh0ZW5zaW9uPSonLCB3aGljaAo+IGNhdXNlZCBmMmZzIHRvIGF1dG9tYXRpY2FsbHkgZW5h
YmxlIGNvbXByZXNzaW9uIG9uIHRoZSBmaWxlcyB0aGF0Cj4geGZzdGVzdHMgY3JlYXRlZCwgd2hp
Y2ggY2F1c2VkIHRoZSB0ZXN0IGZhaWx1cmUuICBCdXQgdGhhdCBiZWhhdmlvciBpcwo+IHNwZWNp
ZmljIHRvICdjb21wcmVzc19leHRlbnNpb249KicsIG5vdCB0byBjb21wcmVzc2lvbiBzdXBwb3J0
IHBlciBzZS4KPgoKWWVzLCBJIHVzZWQgImNvbXByZXNzaW9uX2V4dGVuc2lvbj0qIiBpbiBteSB0
ZXN0cy4KCj4gQnV0IGFsc28sIHdlIGRvbid0IHJlYWxseSBuZWVkIHRvIHNraXAgdGhlc2UgdGVz
dHMuICBJbnN0ZWFkLCBob3cgYWJvdXQKPiB1c2luZyAnY2hhdHRyICttJyB0byBleHBsaWNpdGx5
IHNldCB0aGUgdGVzdCBmaWxlIHRvIHVuY29tcHJlc3NlZD8KCkkgdHJpZWQgdGhhdCBhbmQgImNo
YXR0ciArbSIgZG9lcyBub3Qgd29yayBhcyBpdCB0cmllcyB0bwpzaW11bHRhbmVvdXNseSBzZXQg
MiBtdXR1YWxseSBleGNsdXNpdmUgY29tcHJlc3Npb24gZmxhZ3MgKEZTX0NPTVBSX0ZMCmFuZCBG
U19OT0NPTVBfRkwpLiBIb3dldmVyLCAiY2hhdHRyIC1jIiBvbiBhbiBlbXB0eSBmaWxlIHdvcmtz
LCBzbyBsZXQKbWUgcG9zdCBhIHYyIGF0dGVtcHQgc2hvcnRseS4KClRoYW5rcyEKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
