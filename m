Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A812EACFC18
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jun 2025 07:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jCK9utmpsEQlZCzq1wA3OUDoOu0lpStqtt5rtWK5TA=; b=A6xyqxVZD9uhFjZc3xEypWl3A6
	aeCd6fDDnbRZLUo3MCU4YAwg6q9Hf0BtThE8zo6Ks4Iif5PwV+gRr97VV09hj8hMnIixrcngyQjeC
	HgP98eUmj3R9q2FsxfPmEhhpmx7e4mpRo8JiV7M91PMfjRVWTiE1Mjz+3vdiX+P/hG04=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNPGP-0003aZ-Cz;
	Fri, 06 Jun 2025 05:05:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundanthebest@gmail.com>) id 1uNPGO-0003aT-7l
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 05:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x7O9dSJB968DODyLuNRE+vyi9c088XkY9pghf6qlNoA=; b=WHnnuQkzISV0Pgo9NmQ/BJUtKV
 4CU7qd55eHchKUqj+njLCzjoDCrxv/PjjuDi7D06KTNoYxAHhbIJBbJr1dmNuPwNGsmPqrJo/cQfF
 3Rs7tFewAoZFPc8aB9TTGsejc4SZ9gC1Jbot/cxaIwWwEctiWcjcUozb2yGvDef3voP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x7O9dSJB968DODyLuNRE+vyi9c088XkY9pghf6qlNoA=; b=B3Q8HcoH8LZ3OAEgbku5PUTW7l
 DmM1mn7u1hKtK6huc0VEcmLYtrds+gTXtu9yjJaPAwpccc8+vc8f9tN7+Jtr8grnsmUEXDVwQpEKo
 J8e2w7PvmDArGa7UwTqsm5WUhxYHM1Ef347AnqrMk09lySdin5YuIlkR9TRopKT4rF4A=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uNPGN-0002K2-T2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 05:05:08 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-602e203db66so2919253a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Jun 2025 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749186296; x=1749791096; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7O9dSJB968DODyLuNRE+vyi9c088XkY9pghf6qlNoA=;
 b=W1E5pbNsnaFUGdfZKR2ed5ihdtiBfVtNHt7RkV45vsXxXqLVs//b+AAKXWPwjC2fdF
 HudX4p2Mpl5ZZOWsrlppExCef6K9bt/ZaxWqVAthqhiXXNeWzZ63KkUgW9I81LOqLyDV
 njpeqotZ6dkLLKXR0YyBSLMZL2IWvO4alQcbld9BAfy8uF3tfZ/DyK/uOOmIbBOtJAyc
 /bzpSZqVWwlsi8xHHl1Q5//AJ16rLf0w9IQxzjAwYlQRRjnrZ5qPht5o60DH9MRplDyx
 z7D/TA64to7y7vmy4YmyvAmqrS1XfXviyR5uHITS3/JSh1xnqjloXD+MFyaqrqlVMj9h
 q9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749186296; x=1749791096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7O9dSJB968DODyLuNRE+vyi9c088XkY9pghf6qlNoA=;
 b=NOnf/5WwccalWK7Snpj5nukevbMG0gtxYmcOn6XMSXBqvBqPVnm2PCX6i+sDs6KAXO
 AjvxBr7vtcgL5/oz/cxdS0pzH8ATTtMh3dqnkG75hO3urhD0TDYa3/49ZI5X8TRkyzwx
 QwdjaFZQLvf4PMLb0+EVN6X89ETBlQ1fdpPyd2FJrpngzU437h5eEOZeg4qWEKsU2BlH
 TfR8ou3B812C1n4CX+MRWA1VQFiSW6BWfuOz6V+5G1yKx2i9kb3vzP5fIi+ZVR7Xz4dQ
 JjLlyjZGBobSDKobO85kWj+MTc1GWk4zBt6DMm6L5PvKJFSBxwggHf10uLxmo/nSF7/q
 6N/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqII7FSuqMkhfAxPP99n43ZGM+tZ8uJ7ImZMJf7z3pZXV86L74tHain+JPlMoJCQ6ZxfmfUrTvC1KYfByHIODc@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzthTtEAoFZQDayKy6+wbGJma3ktK94tvGBwYrZPf571DhTwS5F
 rt/hMBJGLeEnnUbtdZKpnPYH5Yct3+cyS8a351uN6v99RMWYq59Z8szhegwFMq990pwMbenob+6
 27HHxHvsJv1ed9GnU+7vpogagbkZBqvk=
X-Gm-Gg: ASbGncsufNLoZ7jsAKjlzOwTOCgd9qcIku/WnWn6p+qIlOwtL+KuT2nzRYHiNPE6490
 DEShdBDQhsqyOQyrX21DIA6HB8Y19v3vsiFVwWWgT/dpD3JbJP0/yGBB2EmKQid0596a16KkhOw
 P+x1Teh2cUcd1dC32thSos3oiALyUGExzW+PTAIgiSIgrnk+cxUlRN72Lbi6N2Dhz2Qw==
X-Google-Smtp-Source: AGHT+IEVXR9+wlONFFF0pVmQeCbZZqUlGtHJsfnQn89wNLFqjyadnVgDXduPX3FgpzRh4Sq2aUSNlvX2yGgw+9F0I/g=
X-Received: by 2002:a17:907:940e:b0:ad8:932e:77ba with SMTP id
 a640c23a62f3a-ade1aa06f9bmr166304966b.38.1749186295861; Thu, 05 Jun 2025
 22:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
 <20250603140445.GA14351@lst.de> <20250603140513.GB14351@lst.de>
In-Reply-To: <20250603140513.GB14351@lst.de>
From: Kundan Kumar <kundanthebest@gmail.com>
Date: Fri, 6 Jun 2025 10:34:42 +0530
X-Gm-Features: AX0GCFtEIAaI-VeodZn7ESl9-Aw4m_sJDaXecGQwiyGHiN7UJTfm9c_uBk6SQ-Q
Message-ID: <CALYkqXoAGHqGkX9WqEE+yiOftcWkap-ZGH3CSAeFk-cPg4q25A@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 3, 2025 at 7:35 PM Christoph Hellwig wrote: >
 > On Tue, Jun 03, 2025 at 04:04:45PM +0200, Christoph Hellwig wrote: > > On
 Tue, Jun 03, 2025 at 07:22:18PM +0530, Anuj gupta wrote: > > > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kundanthebest(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
X-Headers-End: 1uNPGN-0002K2-T2
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, Anuj gupta <anuj1072538@gmail.com>, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, david@fromorbit.com,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com, dave@stgolabs.net,
 agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMywgMjAyNSBhdCA3OjM14oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMDMsIDIwMjUgYXQgMDQ6MDQ6NDVQTSArMDIw
MCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAwMywgMjAyNSBhdCAw
NzoyMjoxOFBNICswNTMwLCBBbnVqIGd1cHRhIHdyb3RlOgo+ID4gPiA+IEEgbW91bnQgb3B0aW9u
IGlzIGFib3V0IHRoZSB3b3JzdCBwb3NzaWJsZSBpbnRlcmZhY2UgZm9yIGJlaGF2aW9yCj4gPiA+
ID4gdGhhdCBkZXBlbmRzIG9uIGZpbGUgc3lzdGVtIGltcGxlbWVudGF0aW9uIGFuZCBwb3NzaWJs
eSBoYXJkd2FyZQo+ID4gPiA+IGNoYWN0ZXJpc3RpY3MuICBUaGlzIG5lZWRzIHRvIGJlIHNldCBi
eSB0aGUgZmlsZSBzeXN0ZW1zLCBwb3NzaWJseQo+ID4gPiA+IHVzaW5nIGdlbmVyaWMgaGVscGVy
cyB1c2luZyBoYXJkd2FyZSBpbmZvcm1hdGlvbi4KPiA+ID4KPiA+ID4gUmlnaHQsIHRoYXQgbWFr
ZXMgc2Vuc2UuIEluc3RlYWQgb2YgdXNpbmcgYSBtb3VudCBvcHRpb24sIHdlIGNhbgo+ID4gPiBp
bnRyb2R1Y2UgZ2VuZXJpYyBoZWxwZXJzIHRvIGluaXRpYWxpemUgbXVsdGlwbGUgd3JpdGViYWNr
IGNvbnRleHRzCj4gPiA+IGJhc2VkIG9uIHVuZGVybHlpbmcgaGFyZHdhcmUgY2hhcmFjdGVyaXN0
aWNzIOKAlCBlLmcuLCBudW1iZXIgb2YgQ1BVcyBvcgo+ID4gPiBOVU1BIHRvcG9sb2d5LiBGaWxl
c3lzdGVtcyBsaWtlIFhGUyBhbmQgRVhUNCBjYW4gdGhlbiBjYWxsIHRoZXNlIGhlbHBlcnMKPiA+
ID4gZHVyaW5nIG1vdW50IHRvIG9wdCBpbnRvIHBhcmFsbGVsIHdyaXRlYmFjayBpbiBhIGNvbnRy
b2xsZWQgd2F5Lgo+ID4KPiA+IFllcy4gIEEgbW91bnQgb3B0aW9uIG1pZ2h0IHN0aWxsIGJlIHVz
ZWZ1bCB0byBvdmVycmlkZSB0aGlzIGRlZmF1bHQsCj4gPiBidXQgaXQgc2hvdWxkIG5vdCBiZSBu
ZWVkZWQgZm9yIHRoZSBub3JtYWwgdXNlIGNhc2UuCj4KPiAuLiBhY3R1YWxseSBhIHN5c2ZzIGZp
bGUgb24gdGhlIGJkaSBpcyBwcm9iYWJseSB0aGUgYmV0dGVyIGludGVyZmFjZQo+IGZvciB0aGUg
b3ZlcnJpZGUgdGhhbiBhIG1vdW50IG9wdGlvbi4KCkhpIENocmlzdG9waCwKClRoYW5rcyBmb3Ig
dGhlIHN1Z2dlc3Rpb24g4oCUIEkgYWdyZWUgdGhlIGRlZmF1bHQgc2hvdWxkIGNvbWUgZnJvbSBh
CmZpbGVzeXN0ZW0tbGV2ZWwgaGVscGVyLCBub3QgYSBtb3VudCBvcHRpb24uCgpJIGxvb2tlZCBp
bnRvIHRoZSBzeXNmcyBvdmVycmlkZSBpZGVhLCBidXQgb25lIGNoYWxsZW5nZSBpcyB0aGF0Cm5y
X3diX2N0eCBtdXN0IGJlIGZpbmFsaXplZCBiZWZvcmUgYW55IHdyaXRlcyBvY2N1ci4gVGhhdCBs
ZWF2ZXMgb25seQphIG5hcnJvdyB3aW5kb3cg4oCUIGFmdGVyIHRoZSBiZGkgaXMgcmVnaXN0ZXJl
ZCBidXQgYmVmb3JlIGFueSBpbm9kZXMKYXJlIGRpcnRpZWQg4oCUIHdoZXJlIGNoYW5naW5nIGl0
IGlzIHNhZmUuCgpUaGlzIG1ha2VzIHRoZSBzeXNmcyBrbm9iIGEgYml0IGZyYWdpbGUgdW5sZXNz
IHdlIHRpZ2h0bHkgZ3VhcmQgaXQKKGUuZy4sIG1hcmsgaXQgcmVhZC1vbmx5IGFmdGVyIGluaXQp
LiBBIG1vdW50IG9wdGlvbiwgZXZlbiBqdXN0IGFzIGFuCm92ZXJyaWRlLCBmZWVscyBzaW1wbGVy
IGFuZCBtb3JlIHByZWRpY3RhYmxlLCBzaW5jZSBpdOKAmXMgc2V0IGJlZm9yZQp0aGUgRlMgYmVj
b21lcyBhY3RpdmUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
