Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF77E581F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Nov 2023 14:49:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0ivr-0002El-M9;
	Wed, 08 Nov 2023 13:49:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1r0ivl-0002Ee-EI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Nov 2023 13:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dOVQvjAd30bPlrgwF/zoJUn8J/52P5ntF/Um+egF0hQ=; b=UF3R8VxwLtxNuc30+Vr8dk+wCn
 sFYz4z4Kde4Bo6N/5d2/xPx1M28w/xiKS/CKz/Ks7hqjkdrSNptQa8X2eOLpJi0PPvHdOjDLU6m/N
 wMh91iDUDV2sVsuKQVGrPlCVOawX5ijXumA//DhJGMPiPFHH3eZULLRwE8fGHbaD/MIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dOVQvjAd30bPlrgwF/zoJUn8J/52P5ntF/Um+egF0hQ=; b=WAbL42H5J3qz5mGcFk5ilrBHh4
 Gs1zksC9ocm/BenFWJT0QftHmayKyKS45y5DYgk8tWkDgYoOAl3Of5L2U8N4ISPIbq0pIvC7DvIMi
 p/2mZqKTaZUc4ztmklvR/+4QXaMeZxMLhoAps4sDgURlS61eayI48pFJCnbHLBHW1Pgk=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r0ivi-0000mk-6P for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Nov 2023 13:49:17 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1cc29f39e7aso47510125ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Nov 2023 05:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699451348; x=1700056148; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dOVQvjAd30bPlrgwF/zoJUn8J/52P5ntF/Um+egF0hQ=;
 b=Uf37RMqSVPdSSwz6I3aG7fZO7vSAaJZ36GP06Y2tA5EmXxwsZtcKwA9n29+ZT5fwOg
 /ePeccis9djqKjuMhuO+sGmVtQteOf3aDpH1Q4V7Ux0+tpTMQ7gOCy1w06jcohJ4TUni
 36NtdygauakIwEzdhHa1rzbICdI24/7f/Pjz8dYkZtXqb3HKKJRTxN49xFmZUv6CM+MZ
 hMmL0wpQEdjS2VwgE9z2uk6fulOutv5FlQc618lg2uzZWMdK1bpfq264Yv5VKaz7iJGE
 bsPd9/5E+2jnLLAf2Kg3wgVQw9IrsGqbhI7GJJBeJvezVWX7jOKIpKVxpwvVq5trO0vc
 PfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699451348; x=1700056148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dOVQvjAd30bPlrgwF/zoJUn8J/52P5ntF/Um+egF0hQ=;
 b=jMFvH3iHqavVE8MOuSchqS4QGMcsZBp2xtaSsTn/s1IHYjUippA7IGe//dXBpf7Xsb
 QKZXD31K5J8jf9wbr5GB/1ix9kz0TUOoqUhWtP+GOAjTsWNMJRi8paSMDlHpLnaSqtEn
 lJVvHs0f8eA1RDyzTRB/yPM386NPUUQO1m4MCFVvHqA8Mt0bdS/G9qVOi6yqVkuEWOPe
 JIV3PaQi7s7/zJjF58/tK6wT5HwJ1slACoLpju5fuinhGJ6PnLnujJwLc/ToWEC5cWb+
 uLoPQQ6e8ejTz+H6Xa/UGgdcNp50orc1rhswBaIezgfevnMNwSUfMQI2KACxeraIsqqN
 m2Hg==
X-Gm-Message-State: AOJu0YxbkenSc9Muh/zp5p4HT9f9hK/depzF0A/i4ltnfLfWfbnUFe/E
 EQhMgIHyoT8kvXNgixYcMNE=
X-Google-Smtp-Source: AGHT+IENTLxUJKFCXpcr7DVd+xUScGlCIJEQlS19CZynEIHEZsdBattk0qL1LdRIbwXmT4J++pGgyw==
X-Received: by 2002:a17:903:41cd:b0:1cc:6fa6:ab62 with SMTP id
 u13-20020a17090341cd00b001cc6fa6ab62mr2087355ple.29.1699451348378; 
 Wed, 08 Nov 2023 05:49:08 -0800 (PST)
Received: from [192.168.50.127] ([164.70.122.136])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a170902c3cd00b001a98f844e60sm1755756plj.263.2023.11.08.05.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 05:49:07 -0800 (PST)
Message-ID: <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
Date: Wed, 8 Nov 2023 21:48:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Chao Yu <chao@kernel.org>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
Content-Language: en-US
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/7 22:39, Chao Yu wrote: > On 2023/10/30 17:40,
 Wu Bo wrote: >> If GC victim has pinned block, it can't be recycled. >> And
 if GC is foreground running, after many failure try, the pinned fi [...] 
 Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1r0ivi-0000mk-6P
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMS83IDIyOjM5LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvMTAvMzAgMTc6NDAs
IFd1IEJvIHdyb3RlOgo+PiBJZiBHQyB2aWN0aW0gaGFzIHBpbm5lZCBibG9jaywgaXQgY2FuJ3Qg
YmUgcmVjeWNsZWQuCj4+IEFuZCBpZiBHQyBpcyBmb3JlZ3JvdW5kIHJ1bm5pbmcsIGFmdGVyIG1h
bnkgZmFpbHVyZSB0cnksIHRoZSBwaW5uZWQgZmlsZQo+PiBpcyBleHBlY3RlZCB0byBiZSBjbGVh
ciBwaW4gZmxhZy4gVG8gZW5hYmxlIHRoZSBzZWN0aW9uIGJlIHJlY3ljbGVkLgo+Pgo+PiBCdXQg
d2hlbiBmYWxsb2NhdGUgdHJpZ2dlciBGR19HQywgR0MgY2FuIG5ldmVyIHJlY3ljbGUgdGhlIHBp
bm5lZAo+PiBzZWN0aW9uLiBCZWNhdXNlIEdDIHdpbGwgZ28gdG8gc3RvcCBiZWZvcmUgdGhlIGZh
aWx1cmUgdHJ5IG1lZXQgdGhlIAo+PiB0aHJlc2hvbGQ6Cj4+IMKgwqDCoMKgaWYgKGhhc19lbm91
Z2hfZnJlZV9zZWNzKHNiaSwgc2VjX2ZyZWVkLCAwKSkgewo+PiDCoMKgwqDCoMKgwqDCoCBpZiAo
IWdjX2NvbnRyb2wtPm5vX2JnX2djICYmCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG90YWxf
c2VjX2ZyZWVkIDwgZ2NfY29udHJvbC0+bnJfZnJlZV9zZWNzKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gZ29fZ2NfbW9yZTsKPj4gwqDCoMKgwqDCoMKgwqAgZ290byBzdG9wOwo+PiDC
oMKgwqDCoH0KPj4KPj4gU28gd2hlbiBmYWxsb2NhdGUgdHJpZ2dlciBGR19HQywgYXQgbGVhc3Qg
cmVjeWNsZSBvbmUuCj4KPiBIbW0uLi4gaXQgbWF5IGJyZWFrIHBpbmZpbGUncyBzZW1hbnRpY3Mg
YXQgbGVhc3Qgb24gb25lIHBpbm5lZCBmaWxlPwo+IEluIHRoaXMgY2FzZSwgSSBwcmVmZXIgdG8g
ZmFpbCBmYWxsb2NhdGUoKSByYXRoZXIgdGhhbiB1bnBpbm5pbmcgZmlsZSwKPiBpbiBvcmRlciB0
byBhdm9pZCBsZWF2aW5nIGludmFsaWQgTEJBIHJlZmVyZW5jZXMgb2YgdW5waW5uZWQgZmlsZSBo
ZWxkCj4gYnkgdXNlcnNwYWNlLgoKQXMgZjJmcyBkZXNpZ25lZCBub3csIEZHX0dDIGlzIGFibGUg
dG8gdW5waW4gdGhlIHBpbm5lZCBmaWxlLgoKZmFsbG9jYXRlKCkgdHJpZ2dlcmVkIEZHX0dDLCBi
dXQgY2FuJ3QgcmVjeWNsZSBzcGFjZS7CoCBJdCBicmVha3MgdGhlIApkZXNpZ24gbG9naWMgb2Yg
RkdfR0MuCgpUaGlzIGlzc3VlIGlzIGhhcHBlbmVkIGluIEFuZHJvaWQgT1RBIHNjZW5hcmlvLsKg
IGZhbGxvY2F0ZSgpIGFsd2F5cyAKcmV0dXJuIGZhaWx1cmUgY2F1c2UgT1RBIGZhaWwuCgogwqBB
bmQgdGhpcyBjb21taXQgY2hhbmdlZCBwcmV2aW91cyBiZWhhdmlvciBvZiBmYWxsb2NhdGUoKToK
CkNvbW1pdCAyZTQyYjdmODE3YWMgKCJmMmZzOiBzdG9wIGFsbG9jYXRpbmcgcGlubmVkIHNlY3Rp
b25zIGlmIEVBR0FJTiAKaGFwcGVucyIpCgpCZWZvcmUgdGhpcyBjb21taXQsIGlmIGZhbGxvY2F0
ZSgpIG1lZXQgdGhpcyBzaXR1YXRpb24sIGl0IHdpbGwgdHJpZ2dlciAKRkdfR0MgdG8gcmVjeWNs
ZSBwaW5uZWQgc3BhY2UgZmluYWxseS4KCkZHX0dDIGlzIGV4cGVjdGVkIHRvIHJlY3ljbGUgcGlu
bmVkIHNwYWNlIHdoZW4gdGhlcmUgaXMgbm8gbW9yZSBmcmVlIApzcGFjZS7CoCBBbmQgdGhpcyBp
cyB0aGUgcmlnaHQgdGltZSB0byBkbyBpdCB3aGVuIGZhbGxvY2F0ZSgpIG5lZWQgZnJlZSAKc3Bh
Y2UuCgpJdCBpcyB3ZWlyZCB3aGVuIGYyZnMgc2hvd3MgZW5vdWdoIHNwYXJlIHNwYWNlIGJ1dCBj
YW4ndCBmYWxsb2NhdGUoKS4gU28gCkkgdGhpbmsgaXQgc2hvdWxkIGJlIGZpeGVkLgoKPgo+IFRo
b3VnaHRzPwo+Cj4gVGhhbmtzLAo+Cj4+Cj4+IFRoaXMgaXNzdWUgY2FuIGJlIHJlcHJvZHVjZWQg
YnkgZmlsbGluZyBmMmZzIHNwYWNlIGFzIGZvbGxvd2luZyBsYXlvdXQuCj4+IEV2ZXJ5IHNlZ21l
bnQgaGFzIG9uZSBibG9jayBpcyBwaW5uZWQ6Cj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+PiB8
IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24KPj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+ICst
Ky0rLSstKy0rLSstLS0tLSstKwo+PiB8IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24rMQo+PiAr
LSstKy0rLSstKy0rLS0tLS0rLSsKPj4gLi4uCj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+PiB8
IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24rawo+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4K
Pj4gQW5kIGZvbGxvd2luZyBhcmUgc3RlcHMgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU6Cj4+IGRk
IGlmPS9kZXYvemVybyBvZj0uL2YyZnNfcGluLmltZyBicz0yTSBjb3VudD0xMDI0Cj4+IG1rZnMu
ZjJmcyBmMmZzX3Bpbi5pbWcKPj4gbWtkaXIgZjJmcwo+PiBtb3VudCBmMmZzX3Bpbi5pbWcgLi9m
MmZzCj4+IGNkIGYyZnMKPj4gZGQgaWY9L2Rldi96ZXJvIG9mPS4vbGFyZ2VfcGFkZGluZyBicz0x
TSBjb3VudD0xNzYwCj4+IC4vcGluX2ZpbGxpbmcuc2gKPj4gcm0gcGFkZGluZyoKPj4gc3luYwo+
PiB0b3VjaCBmYWxsb2NhdGVfNDBtCj4+IGYyZnNfaW8gcGluZmlsZSBzZXQgZmFsbG9jYXRlXzQw
bQo+PiBmYWxsb2NhdGUgLWwgNDE5NDMwNDAgZmFsbG9jYXRlXzQwbQo+Pgo+PiBmYWxsb2NhdGUg
YWx3YXlzIGZhaWwgd2l0aCBFQUdBSU4gZXZlbiB0aGVyZSBoYXMgZW5vdWdoIGZyZWUgc3BhY2Uu
Cj4+Cj4+ICdwaW5fZmlsbGluZy5zaCcgaXM6Cj4+IGNvdW50PTEKPj4gd2hpbGUgOgo+PiBkbwo+
PiDCoMKgwqDCoCAjIGZpbGxpbmcgdGhlIHNlZyBzcGFjZQo+PiDCoMKgwqDCoCBmb3IgaSBpbiB7
MS4uNTExfToKPj4gwqDCoMKgwqAgZG8KPj4gwqDCoMKgwqDCoMKgwqDCoCBuYW1lPXBhZGRpbmdf
JGNvdW50LSRpCj4+IMKgwqDCoMKgwqDCoMKgwqAgZWNobyB3cml0ZSAkbmFtZQo+PiDCoMKgwqDC
oMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRuYW1lIGJzPTRLIGNvdW50PTEgPiAvZGV2
L251bGwgMj4mMQo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIFsgJD8gLW5lIDAgXTsgdGhlbgo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGl0IDAKPj4gwqDCoMKgwqDCoMKgwqDC
oCBmaQo+PiDCoMKgwqDCoCBkb25lCj4+IMKgwqDCoMKgIHN5bmMKPj4KPj4gwqDCoMKgwqAgIyBw
aW4gb25lIGJsb2NrIGluIGEgc2VnbWVudAo+PiDCoMKgwqDCoCBuYW1lPXBpbl9maWxlJGNvdW50
Cj4+IMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRuYW1lIGJzPTRLIGNvdW50PTEgPiAv
ZGV2L251bGwgMj4mMQo+PiDCoMKgwqDCoCBzeW5jCj4+IMKgwqDCoMKgIGYyZnNfaW8gcGluZmls
ZSBzZXQgJG5hbWUKPj4gwqDCoMKgwqAgY291bnQ9JCgoJGNvdW50ICsgMSkpCj4+IGRvbmUKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogV3UgQm8gPGJvLnd1QHZpdm8uY29tPgo+PiAtLS0KPj4gwqAgZnMv
ZjJmcy9maWxlLmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYwo+PiBpbmRleCBjYTU5MDQxMjliMTYuLmU4YTEzNjE2NTQzZiAxMDA2NDQKPj4gLS0t
IGEvZnMvZjJmcy9maWxlLmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4gQEAgLTE2OTAsNyAr
MTY5MCw3IEBAIHN0YXRpYyBpbnQgZjJmc19leHBhbmRfaW5vZGVfZGF0YShzdHJ1Y3QgaW5vZGUg
Cj4+ICppbm9kZSwgbG9mZl90IG9mZnNldCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmluaXRfZ2NfdHlwZSA9IEZHX0dDLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc2hv
dWxkX21pZ3JhdGVfYmxvY2tzID0gZmFsc2UsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5lcnJfZ2Nfc2tpcHBlZCA9IHRydWUsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ucl9m
cmVlX3NlY3MgPSAwIH07Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5ucl9mcmVlX3NlY3Mg
PSAxIH07Cj4+IMKgwqDCoMKgwqAgcGdvZmZfdCBwZ19zdGFydCwgcGdfZW5kOwo+PiDCoMKgwqDC
oMKgIGxvZmZfdCBuZXdfc2l6ZTsKPj4gwqDCoMKgwqDCoCBsb2ZmX3Qgb2ZmX2VuZDsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
