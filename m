Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5947FAE6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Dec 2021 09:11:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n1l66-0001kZ-Gm; Mon, 27 Dec 2021 08:11:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1n1l64-0001kP-DU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Dec 2021 08:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJv1HuMz4xNwy+4oFYPflv1goayo2naNxScR/pdTEno=; b=IOQBSptKctSOGpfQJY82DjOCVw
 8/PrZVdgVAEXgBWCPTmDdtKsSa4tXB4NZTeDQVi8YgFf4u44sgyxo/ZsV88155B+nAQikZg23gTKB
 HHK05QvE3XtRtaSZt0eOaaWRZ39JAUgmP5kwM/dkRXH0UkVslvP0VPGrRwi+c5b/gE+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJv1HuMz4xNwy+4oFYPflv1goayo2naNxScR/pdTEno=; b=LEcwHXpmXZz8QpWsGeDJL4Ihau
 eZ7ppNQNZ0wIbbdNBOovApyzf9bFxYpqcQFZsi0lBEhAgM1TYxyA0yWq4jmho06Bdx2Y5hMN6ndsR
 2ZB4quZyaayXVcf2hZS/aC6etnE4AVZu25xAtMH17AqzC7L6Bzo4x8p7Ho4gkyJ+Y3Qo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n1l60-0003zJ-KM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Dec 2021 08:11:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08F49CE0E62;
 Mon, 27 Dec 2021 08:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FD3C36AEA;
 Mon, 27 Dec 2021 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640592650;
 bh=QvPADwn4OZWPuVkXi7icFX3UplNYV1TwRRWp5mZoydI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QfkRU8CRDOd59MpaT794M30G5U3Sgthm9i7Wzk2dI52cPmTBL8Eq3Hsz50PtH2Y0j
 9k5T8sJQaWOKngHxKIW4rNGgamWV+uGsLvpm5HD6CdKOVhDrNCFKVD8e2Xpt5tNkgY
 RofIWgU3U3O6tu5r3zHu+QCTDAYPGMtoD6Na/Wsq+Berko3Cxj2LL7prejsd6DhuXE
 Q04VsAKCog9FyYbgZESKQtYkMOK9N6KNOTHb09wyjPZUBpnVrwnmUkrsFU1Lyrv2Jg
 EW24n+sVIppklAqXvntT/QfoOMQnkVbRj4vPexutCzaz45X3J86M9fyMOeM6Nk+5+9
 pq/9ZsZinQiXg==
Message-ID: <40e604de-c59a-b4e8-6266-99bd3adde5ff@kernel.org>
Date: Mon, 27 Dec 2021 16:10:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211213085857.8554-1-changfengnan@vivo.com>
 <KL1PR0601MB4003AE5E6A8449368F3290BBBB7C9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB4003AE5E6A8449368F3290BBBB7C9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/12/21 11:59, 常凤楠 wrote: >> 
 
 Content analysis details:   (-2.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n1l60-0003zJ-KM
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redunant invalidate compress
 pages
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMi8yMSAxMTo1OSwg5bi45Yek5qWgIHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQo+PiBGcm9tOiDluLjlh6TmpaAKPj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAx
MywgMjAyMSA0OjU5IFBNCj4+IFRvOiBqYWVnZXVrQGtlcm5lbC5vcmc7IGNoYW9Aa2VybmVsLm9y
Zwo+PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IOW4uOWHpOal
oCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IHJlbW92
ZSByZWR1bmFudCBpbnZhbGlkYXRlIGNvbXByZXNzIHBhZ2VzCj4+Cj4+IENvbXByZXNzIHBhZ2Ug
d2lsbCBpbnZhbGlkYXRlIGluIHRydW5jYXRlIGJsb2NrIHByb2Nlc3MgdG9vLCBzbyByZW1vdmUK
Pj4gcmVkdW5hbnQgaW52YWxpZGF0ZSBjb21wcmVzcyBwYWdlcyBpbiBmMmZzX2V2aWN0X2lub2Rl
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5j
b20+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvaW5vZGUuYyB8IDMgLS0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lub2RlLmMgYi9m
cy9mMmZzL2lub2RlLmMgaW5kZXggOTM1MDE2ZTU2MDEwLi41OTUyNzA2NDZkNjkKPj4gMTAwNjQ0
Cj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+PiArKysgYi9mcy9mMmZzL2lub2RlLmMKPj4gQEAg
LTc1MSw5ICs3NTEsNiBAQCB2b2lkIGYyZnNfZXZpY3RfaW5vZGUoc3RydWN0IGlub2RlICppbm9k
ZSkKPj4gICAJdHJhY2VfZjJmc19ldmljdF9pbm9kZShpbm9kZSk7Cj4+ICAgCXRydW5jYXRlX2lu
b2RlX3BhZ2VzX2ZpbmFsKCZpbm9kZS0+aV9kYXRhKTsKPj4KPj4gLQlpZiAodGVzdF9vcHQoc2Jp
LCBDT01QUkVTU19DQUNIRSkgJiYgZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKQo+PiAtCQlm
MmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZXMoc2JpLCBpbm9kZS0+aV9pbm8pOwo+PiAtCj4g
Cj4gSGkgSmFlZ2V1aywgY2hhbzoKPiBBZnRlciBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC8/aD1kZXYmaWQ9NjYy
ZjZhY2RiMDEzNmRmZGEzZDA1NWYwMDA4NmUyYzhlZDVjOGJmYwo+IEkgdGhpbmsgdGhpcyBwYXRj
aCBzdGlsbCBuZWNlc3NhcnksIGl0IGNvdWxkIHNwZWVkIHVwIGV2aWN0IGlub2RlLiBmMmZzX2lu
dmFsaWRhdGVfY29tcHJlc3NfcGFnZXMgZmluZCBhbGwgcGFnZXMgYW5kIGNvbXBhcmUgdG8gZGVj
aWRlIHdoaWNoIHBhZ2VzIG5lZWQgaW52YWxpZGF0ZSwgaWYgdGhlcmUgYXJlIG1hbnkgY29tcHJl
c3NlZCBmaWxlIGNhY2hlZCwgaXQgbWF5IG5lZWQgbXVjaCB0aW1lLiBBbmQgaW4gbGF0ZXIgdHJ1
bmNhdGUgYmxvY2sgd2lsbCBpbnZhbGlkYXRlIHBhZ2Ugb25lIGJ5IG9uZSwgdGhpcyBtYXkgbW9y
ZSBlZmZlY3RpdmUuCgpXZWxsLCBmb3IgdGhlIGNhc2UgaW5vZGUgaGFzIG5vbi16ZXJvIG5saW5r
IHZhbHVlLCBpdCBuZWVkcyB0byAKaW52YWxpZGF0ZSBjb21wcmVzc2VkIHBhZ2VzIGFmdGVyIHRy
dW5jYXRlX2lub2RlX3BhZ2VzX2ZpbmFsKCksIApvdGhlcndpc2UgcmVsYXRlZCBjb21wcmVzc2Vk
IHBhZ2VzIG1heSBiZSBsZWZ0IGluIG1lbW9yeSBhZnRlciBpbm9kZSB3YXMgCmV2aWN0ZWQuCgpo
dHRwczovL3d3dy5hbnN5bWJvbC5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9mcy9mMmZzL2lub2Rl
LmMjTDc1NAoKVGhhbmtzLAoKPiAKPj4gICAJaWYgKGlub2RlLT5pX2lubyA9PSBGMkZTX05PREVf
SU5PKHNiaSkgfHwKPj4gICAJCQlpbm9kZS0+aV9pbm8gPT0gRjJGU19NRVRBX0lOTyhzYmkpIHx8
Cj4+ICAgCQkJaW5vZGUtPmlfaW5vID09IEYyRlNfQ09NUFJFU1NfSU5PKHNiaSkpCj4+IC0tCj4+
IDIuMzIuMAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
