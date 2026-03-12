Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLwONKIxs2ntSwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 22:35:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1827A116
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 22:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXUCR51CJaLcWEtrYyadNbZh/AwFQMAzBqJIHU8y5po=; b=U+tAAj3Sf7CisXg45q6ej2Ehvp
	jMqKKKhVZrzxOKZczb+N1NLYIu0PtlfpsgnB0fqxpwk2xpEMDNqG3Ap5kSi+eK0osrcNCx72p3PpN
	rVDt4/LjsYgjYxouwfR+YytmrOTKxuPZvwf2nRsjxU7QtDDuPddLQKxBynWZIMxiFUF0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0ngd-0002MK-Um;
	Thu, 12 Mar 2026 21:35:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w0ngb-0002MD-Mm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 21:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sm596WfvFM1IyntYWId+BqP5D9te8yC/sKPPDVUn4XM=; b=myrkDZHYcOjcY0ZLCvrO6zu3se
 gpnrB7Idf5Fba5vEKorWM7qJPs2Sjd2QlPry9zhF5rlZckBvk8RX6Wa17w+DeqUEkKG51d+qTkk1c
 5G9LHWjHfjuUrB94pNb3XYcMP7xlgd7i1rz0LBfzks+nufGQiySG8GweFvhob4uqUlVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sm596WfvFM1IyntYWId+BqP5D9te8yC/sKPPDVUn4XM=; b=mYpA49qq18tZWwbUwtHV4aJbmm
 lstGCIPNNL+shyv9x0cui/DhqRvmX7MIeqsWNt8XPNqkafGFylQx6xzTFSk/2ihFRwfQaIBCFZojV
 sCrA5NRA814QvcJUGC3rGBXiSIBCpk7Uf8zRjXrOKiFmT3cG5gdR6BxiibzIOV5CzFKQ=;
Received: from mail-vs1-f51.google.com ([209.85.217.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w0ngb-00015E-2s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 21:35:17 +0000
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-5ffc879c1aeso960695137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2026 14:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773351311; cv=none;
 d=google.com; s=arc-20240605;
 b=MWXMKTtnfxEP7mKEWKTFQya58kNNmEHjR0IF/AgH1funuRF29biuTAxbHkqV2lwpZG
 AWVSj8iemX7IApv+6TlVI3k3PEKndc4tlaFNFLTA4hxVbH2zwGttdI1rlGYt1G41N9Sm
 KJnugiuefRGBE1HkaSkOgWBs5r3ptm7pSC0a3SUM39+wDfdGhYx1doQ7gj6snVS/Qw2o
 0V/LLaDdW+cLZIyqmBYa47WLgm2oR/YlMK8k805tCFBuoZp4/rpVMN0BmjWXGbQied/q
 el2LoulLrO9+UpfBnYjh5DpP4MK6i0ebDIJsd7s0p6E5uZ0sjcK8ZKU2w/IUgUUWgnRF
 +G3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Sm596WfvFM1IyntYWId+BqP5D9te8yC/sKPPDVUn4XM=;
 fh=9rXGTV/+MecrjZQohSDk19r0QXd67/zHYVMjm7D/rlA=;
 b=K5TKt8nx18ceQQaru9I1kcqcghjIhIgJYnnuQjmP1rpEdCD2BDmNuC7AZQ5U7RydsI
 Q3ms0tpbHY2rHtBzwKhttXr8NueTVN9IMd7zGPb43EguyH0TNPziWEhYP0dQdFnXml8U
 DIUKWngxg9JMVOnJ0+Brlckrt55Jo/Ou2M+kOZpmBkvs3QazKdNaanwGa9OrisPxfevF
 lAu4pJwf7A/4Xj586dWvOO3GsijQaRcfGsr21kQrJl094pNUiVP+Nl5AY0GSBDSdsjiW
 53aOPAIQFAWA9EHuIomWQW0v6blCT5ITEvAd0XOR5M7RfsVtrzQlXSfzC+57k/e07Bza
 oi6A==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773351311; x=1773956111; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sm596WfvFM1IyntYWId+BqP5D9te8yC/sKPPDVUn4XM=;
 b=Rs9sAseIXaFLhUim3iK8NlapynwCRQ/t0U3s426NwrhCPb8HP2yPRTEaWUxrLGFwFp
 vXaL1CqWwz5nX/ngtKUWkto4aF/4EIegTOegPe56QQ8kJN3sWE9FZQ1cZMfXfGdbpik3
 EBu9iqkx7TS8SGEKxcn17tp7h5WDNg4dIAS5LDLXlFmJH85xa5eouIm1a8n61Lr2crhv
 jxbYazkFRBcofc3BUvX0SDUXfAd3kxbuXi+3r8/3z/RJ5FFh5hTKvVnzUI0wRTFP7qp6
 D5/gv+I7C45BSuFQ3k6dZthcEcx+cJL3/26rbTtyCycP2URpcUn33SKRkQ8nDd+2li4z
 deWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773351311; x=1773956111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sm596WfvFM1IyntYWId+BqP5D9te8yC/sKPPDVUn4XM=;
 b=cLLBq7V03k7M9rIMPbbKL7BlfXhmsVvZCU7dkAk/h+l7W0d6PiYbnUsbu/09TWmOA9
 knASVnkZE/RAjjW5wkgWyj2iZpbyshjXD6JqYB3RFogEWPCGHn4PXVzNSeD5ioN18+PX
 MSR7jCHHkY6ZcS++5S491poMt8I6rxYFI/LvK+HyXie1Av9qlkhFxc4ta9ARbuNnWFR0
 Vo4Oq/+3TsdzThxf3g0e5bO8CsEe/YPEMyFBdAZlAtS6EVQ62p2BHeXsfJD9BbdwrCAP
 VBCLDETVqQqsajXmRjxBC6CN5uoyBHoiVyC8dA0P9llmmuzny1rIIinK9V+ow5wcHJHW
 MywQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmf2baGPXj6fFAMw2NCTzIR6nAAlRDCkr4/woEuThAKbeuLSERYMHndZp/ZDPyZ3I1lX4/UyTJQuT/vIqGkatF@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzlC2khbbMK1Ssa2q4XWyfF0sR5QSjPPjiatGrbm5BXAgt+l7oe
 EKuvxU14PnUk2VVsbWSvjcMMHJ195rfgDhNXaDuMZpvKi/bI+v5uCp7aLGKf9Ew2OWxpN0v5wtJ
 pFroPqaFe3ClXQgmozlHBs3qGXese5Gw=
X-Gm-Gg: ATEYQzxMuUED6VKDClFbdOekOGjL6u7YKTXxiJ2P7GZumiRq4g1Yp8QIB/koTPSfqHD
 UJaVDO1a/4k/v5gFLUTKY3JHQJeVNaeoOZ24ylr6uAOcr/hudiUiwEsTazAqo5XGTDv7UvpREYP
 HeHUFQMU9y33sGsX5tiz8WnsfBRAWAlFixWeLZNL8ZfZliJRG49UbwX1TcX7aw/mHcZyOEqNuTb
 Q7lhWAM325rHuUNODL2ue3g4bReFO5PggC8nd9uN19ABG1lrLxvw8wn+VGtP5NEaflbsXpXGEti
 o4UE4zmOHsL5V/dvFkmshjDOiakinBB248WKuKrcoSNl1Dr/EVk5fh836rECrQvC+w==
X-Received: by 2002:a05:6102:d92:b0:5f9:39eb:590a with SMTP id
 ada2fe7eead31-6020e25cc75mr459771137.9.1773351310970; Thu, 12 Mar 2026
 14:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260310175428.1156719-1-daeho43@gmail.com>
 <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
 <CACOAw_yXPoSBox4o5pMv_0Jv0B8yHA6TFakcKNOpGZWKBSZYKw@mail.gmail.com>
 <615947f2-fe08-4875-87d9-baef36897e81@kernel.org>
 <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
In-Reply-To: <CACOAw_wUpR=8qXi06VLCk_oH5qL+_RVqzMAP8x4JaTE9Te3WQw@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 12 Mar 2026 14:34:59 -0700
X-Gm-Features: AaiRm52ZkKxz5bRtNgvteKXZ5tnkucWURG0ljQksNQg-8lyODKKJJwHxRWJ7Poo
Message-ID: <CACOAw_zw_pYjxGdMgYwMDK9JFev7Mi8H9mmNmc3GRA_9JhfUEQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 12, 2026 at 8:28 AM Daeho Jeong wrote: > > On
 Thu, Mar 12, 2026 at 2:07 AM Chao Yu wrote: > > > > On 2026/3/12 00:05, Daeho
 Jeong wrote: > > > On Wed, Mar 11, 2026 at 6:44 AM Chao Yu [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.51 listed in wl.mailspike.net]
X-Headers-End: 1w0ngb-00015E-2s
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 10B1827A116
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgODoyOOKAr0FNIERhZWhvIEplb25nIDxkYWVobzQzQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAxMiwgMjAyNiBhdCAyOjA34oCvQU0gQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiAyMDI2LzMvMTIgMDA6MDUs
IERhZWhvIEplb25nIHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1hciAxMSwgMjAyNiBhdCA2OjQ04oCv
QU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBPbiAyMDI2
LzMvMTEgMDE6NTQsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPj4+IEZyb206IERhZWhvIEplb25n
IDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+Pj4KPiA+ID4+PiBJbiBhZ2UtYmFzZWQgdmlj
dGltIHNlbGVjdGlvbiAoQVRHQywgQVRfU1NSLCBvciBHQ19DQiksIGYyZnNfZ2V0X3ZpY3RpbQo+
ID4gPj4+IGNhbiBlbmNvdW50ZXIgc2VjdGlvbnMgd2l0aCB6ZXJvIHZhbGlkIGJsb2Nrcy4gVGhp
cyBzaXR1YXRpb24gb2Z0ZW4KPiA+ID4+PiBhcmlzZXMgd2hlbiBjaGVja3BvaW50IGlzIGRpc2Fi
bGVkIG9yIGR1ZSB0byByYWNlIGNvbmRpdGlvbnMgYmV0d2Vlbgo+ID4gPj4+IFNJVCB1cGRhdGVz
IGFuZCBkaXJ0eSBsaXN0IG1hbmFnZW1lbnQuCj4gPiA+Pj4KPiA+ID4+PiBJbiBzdWNoIGNhc2Vz
LCBmMmZzX2dldF9zZWN0aW9uX210aW1lKCkgcmV0dXJucyBJTlZBTElEX01USU1FLCB3aGljaAo+
ID4gPj4+IHN1YnNlcXVlbnRseSB0cmlnZ2VycyBhIGZhdGFsIGYyZnNfYnVnX29uKHNiaSwgbXRp
bWUgPT0gSU5WQUxJRF9NVElNRSkKPiA+ID4+PiBpbiBhZGRfdmljdGltX2VudHJ5KCkgb3IgZ2V0
X2NiX2Nvc3QoKS4KPiA+ID4+Pgo+ID4gPj4+IFRoaXMgcGF0Y2ggYWRkcyBhIGNoZWNrIGluIGYy
ZnNfZ2V0X3ZpY3RpbSdzIHNlbGVjdGlvbiBsb29wIHRvIHNraXAKPiA+ID4+PiBzZWN0aW9ucyB3
aXRoIG5vIHZhbGlkIGJsb2Nrcy4gVGhpcyBwcmV2ZW50cyB1bm5lY2Vzc2FyeSBhZ2UKPiA+ID4+
PiBjYWxjdWxhdGlvbnMgZm9yIGVtcHR5IHNlY3Rpb25zIGFuZCBhdm9pZHMgdGhlIGFzc29jaWF0
ZWQga2VybmVsIHBhbmljLgo+ID4gPj4+IFRoaXMgY2hhbmdlIGFsc28gYWxsb3dzIHJlbW92aW5n
IHJlZHVuZGFudCBjaGVja3MgaW4gYWRkX3ZpY3RpbV9lbnRyeSgpLgo+ID4gPj4+Cj4gPiA+Pj4g
U2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+ID4+
PiAtLS0KPiA+ID4+PiAgICBmcy9mMmZzL2djLmMgfCA5ICsrKy0tLS0tLQo+ID4gPj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+Pj4KPiA+
ID4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4gPiA+Pj4gaW5k
ZXggMmUwZjY3OTQ2OTE0Li45ODFlYWM2MjlmZTkgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEvZnMvZjJm
cy9nYy5jCj4gPiA+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4gPiA+Pj4gQEAgLTUyMSwxMiArNTIx
LDYgQEAgc3RhdGljIHZvaWQgYWRkX3ZpY3RpbV9lbnRyeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCj4gPiA+Pj4gICAgICAgIHN0cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+
ID4gPj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgbXRpbWUgPSAwOwo+ID4gPj4+Cj4gPiA+
Pj4gLSAgICAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxF
RCkpKSB7Cj4gPiA+Pj4gLSAgICAgICAgICAgICBpZiAocC0+Z2NfbW9kZSA9PSBHQ19BVCAmJgo+
ID4gPj4+IC0gICAgICAgICAgICAgICAgICAgICBnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8s
IHRydWUpID09IDApCj4gPiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4+
PiAtICAgICB9Cj4gPiA+Pj4gLQo+ID4gPj4+ICAgICAgICBtdGltZSA9IGYyZnNfZ2V0X3NlY3Rp
b25fbXRpbWUoc2JpLCBzZWdubyk7Cj4gPiA+Pj4gICAgICAgIGYyZnNfYnVnX29uKHNiaSwgbXRp
bWUgPT0gSU5WQUxJRF9NVElNRSk7Cj4gPiA+Pj4KPiA+ID4+PiBAQCAtODg5LDYgKzg4Myw5IEBA
IGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBp
bnQgKnJlc3VsdCwKPiA+ID4+PiAgICAgICAgICAgICAgICBpZiAoc2VjX3VzYWdlX2NoZWNrKHNi
aSwgc2Vjbm8pKQo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4g
Pj4+Cj4gPiA+Pj4gKyAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdu
bywgdHJ1ZSkpCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4dDsKPiA+ID4+
Cj4gPiA+PiBXZWxsLCBmb3IgZjJmc19nZXRfdmljdGltKCwgQVRfU1NSKSwgb25jZSB0aGVyZSBh
cmUgbm8gZGlydHkgc2VnbWVudCwgaWYgd2UKPiA+ID4+IGRvbid0IGNvdW50IGZyZWUgc2VnbWVu
dCBhcyBjYW5kaWRhdGVzLCB0aGVuLCB3ZSBjYW4gbm90IGZpbmQgYW55IHZhbGlkIHZpY3RpbT8K
PiA+ID4KPiA+ID4gT2gsIEFUX1NTUiBuZWVkcyB0byBzZWxlY3QgdGhlIGZyZWUgc2VjdGlvbiBp
biB0aGlzIGNhc2U/Cj4gPgo+ID4gSSB0aGluayBzbywgZm9yIGV4dHJlbWUgY2FzZS4KPiA+Cj4g
PiA+IEkgYW0gY29uZnVzZWQuIFdoeSBkbyB3ZSBuZWVkIHRoZSBiZWxvdyBsb2dpYz8KPiA+ID4g
TG9va3MgbGlrZSBXQSBmb3IgdGhlIEFUX1NTUiBjYXNlPwo+ID4gPgo+ID4gPiBJbiBmMmZzX2dl
dF9zZWN0aW9uX210aW1lKCkKPiA+ID4gb3V0Ogo+ID4gPiAgICAgICAgICBpZiAodW5saWtlbHko
bXRpbWUgPT0gSU5WQUxJRF9NVElNRSkpCj4gPiA+ICAgICAgICAgICAgICAgICAgbXRpbWUgLT0g
MTsKPiA+ID4gICAgICAgICAgcmV0dXJuIG10aW1lOwo+ID4KPiA+IFRoZXJlIGFyZSB0d28gY29u
ZGl0aW9ucywgaW4gYSBzZWN0aW9uOgo+ID4KPiA+IGEpIGlmIHRoZXJlIGFyZSBubyB2YWxpZCBi
bG9ja3MsIGl0IHdpbGwgcmV0dXJuIElOVkFMSURfTVRJTUUuCj4gPiBiKSBpZiB0aGVyZSBhcmUg
dmFpbGQgYmxvY2tzLCBpdCB0cmllcyB0byByZXR1cm4gbXRpbWUgd2hpY2ggaXMgY2FsY3VsYXRl
ZCwgYnV0Cj4gPiBpZiB1bmx1Y2t5IHRoZSBjYWxjdWxhdGVkIG10aW1lIGlzIGVxdWFsIHRvIElO
VkFMSURfTVRJTUUsIGluIG9yZGVyIHRvIGRpc3Rpbmd1aXNoCj4gPiBmcm9tIGNhc2UgYSksIHdl
IHdpbGwgcmV0dXJuIElOVkFMSURfTVRJTUUgLSAxIGluc3RlYWQuCj4KPiBJZiB3ZSBmaW5kIGEg
ZnJlZSBzZWdtZW50IGFuZCBwYXNzIGl0IHRvIGYyZnNfZ2V0X3NlY3Rpb25fbXRpbWUoKSBmb3IK
PiAoIV9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKSBjYXNlLgo+IFdoYXQgaXMgdGhlIGV4cGVjdGVk
IG91dHB1dCBvZiBpdD8gKElOVkFMSURfTVRJTUUgLSAxKT8KPiBJIGRvbid0IHRoaW5rIHRoaXMg
aXMganVzdCBhbiB1bmx1Y2t5IGNhc2UuIElzIHRoaXMgZXhwZWN0ZWQgcmVzdWx0PwoKSG1tLCBs
b29rcyBsaWtlIElOVkFMSURfTVRJTUUgaXMgdXNlZCBvbmx5IGZvciBsYXJnZSBzZWN0aW9uIGNh
c2VzLgpJdCdzIGEgYml0IGNvbXBsaWNhdGVkIHRvIHByb2Nlc3MgaXQuIExldCBtZSBkaWdlc3Qg
aXQgbW9yZS4gOigKCj4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gPgo+ID4gPgo+ID4gPj4KPiA+
ID4+IFRoYW5rcywKPiA+ID4+Cj4gPiA+Pj4gKwo+ID4gPj4+ICAgICAgICAgICAgICAgIC8qIERv
bid0IHRvdWNoIGNoZWNrcG9pbnRlZCBkYXRhICovCj4gPiA+Pj4gICAgICAgICAgICAgICAgaWYg
KHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKSB7Cj4gPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBpZiAocC5hbGxvY19tb2RlID09IExGUykgewo+ID4g
Pj4KPiA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
