Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA238D579E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 03:10:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCqnA-0007pD-Ol;
	Fri, 31 May 2024 01:10:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCqn8-0007p4-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 01:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kf8RrbGmyBPVEldVomKklKXx5lnqFdTs0TnJiURySEU=; b=ZlLrs0sw2Dsr4dmkZSYdeeyEe1
 BqcCF8ZFOXGJ9HYACK6h77xdjXQiuOVvNqeA06jQOz/zEwBny9ITIlke7uFrd36Bun89RYbKspdKc
 egsijquGaqVhBb/tMtuXyXOYqfODruMZTGz+bgqmszNB8zdp0Krg+y8iMPlldOuKI7T0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kf8RrbGmyBPVEldVomKklKXx5lnqFdTs0TnJiURySEU=; b=is4jXDy2D8bCZh5Urcr0SBiQk9
 nUayP/xf3ja+6bkfWJeulG+pUVJKdqHs6yHDoNLt5kLfRzr4SL6osS2XNJx+d6RoDkXrkmX5cwNTG
 uwv+91R4ewFCFxWFcXqcCpB97X2rQwDlpp+ALfLaD9nlqVVDO4G/lMUqZHl+IJTgZlmI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCqn9-0001cT-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 01:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D714BCE1B92
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 May 2024 01:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FC4C2BBFC;
 Fri, 31 May 2024 01:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717117839;
 bh=uA64qXapqFpuXT6IfdLO6TrNP1oJkW/fj7+/SfChMsk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JjLOgUl5ojLhhSDXg48wclsJjJgMhOOH4gcd6NBopdQHzoMpHxOhS7MTWKsG3q01U
 wDjKS7uwVejQg0lPwsnAED71v6Y6jMPfUI83g6jPiNvxdWyiNLS4/EjKXSPwEKQvR/
 UylF8l5ddD2Ota+ttTtuRCKYBr0ZQzqSqqkf9SECy3anqTY+nDwAkFplz3WfmsdSph
 1qYqc9NIlQvs5RAbVNPiKke1Jl86qcKxgh+4oRq9tzFdUruX55e/k2RyfKaVMlvhuL
 eJvoF3CJNPr2NpC7oMRKOPc6IeI8jM/Y1JoRM7BuTWilmdrGQwJj7WBA1hYCL6EFjg
 bKsOIu/qVI+Dg==
Message-ID: <41187ebc-cfc5-49a5-93e8-0350d2686d42@kernel.org>
Date: Fri, 31 May 2024 09:10:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240411082354.1691820-1-chao@kernel.org>
 <11d5d736-bae5-4a71-b400-087b8722893c@kernel.org>
 <03647897-8b1f-4c82-b2b6-0aa0704bed05@kernel.org>
 <ZlkOLN0BugwQ2p5p@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZlkOLN0BugwQ2p5p@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/31 7:39, Jaegeuk Kim wrote: > On 05/29, Chao Yu
 wrote: >> Ping, Jaegeuk, > > Chao, sorry, I might need some time to take a
 look at the change cautiously. 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCqn9-0001cT-EZ
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use per-log target_bitmap to
 improve lookup performace of ssr allocation
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

T24gMjAyNC81LzMxIDc6MzksIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA1LzI5LCBDaGFvIFl1
IHdyb3RlOgo+PiBQaW5nLAoKSmFlZ2V1aywKCj4gCj4gQ2hhbywgc29ycnksIEkgbWlnaHQgbmVl
ZCBzb21lIHRpbWUgdG8gdGFrZSBhIGxvb2sgYXQgdGhlIGNoYW5nZSBjYXV0aW91c2x5LgoKTm8g
cHJvYmxlbSwgSSd2ZSBkb25lIHNvbWUgdGVzdHMgb24gdGhpcyBwYXRjaCwgdGhvdWdoLCBJIHdp
bGwga2VlcGluZyB0aGlzIGluCm15IHF1ZXVlLCBhbmQgZG8gdGVzdCBiYXNlIG9uIHRoZSBxdWV1
ZSB3aGVuZXZlciBpdCBjb21lcyBuZXcgcGF0Y2hlcy4KClRoYW5rcywKCj4gCj4+Cj4+IE9uIDIw
MjQvNC8yMyAxMDowNywgQ2hhbyBZdSB3cm90ZToKPj4+IEphZWdldWssIGFueSBjb21tZW50cyBm
b3IgdGhpcyBzZXJpYWxzPwo+Pj4KPj4+IE9uIDIwMjQvNC8xMSAxNjoyMywgQ2hhbyBZdSB3cm90
ZToKPj4+PiBBZnRlciBjb21taXQgODk5ZmVlMzZmYWMwICgiZjJmczogZml4IHRvIGF2b2lkIGRh
dGEgY29ycnVwdGlvbiBieQo+Pj4+IGZvcmJpZGRpbmcgU1NSIG92ZXJ3cml0ZSIpLCB2YWxpZCBi
bG9jayBiaXRtYXAgb2YgY3VycmVudCBvcGVubmVkCj4+Pj4gc2VnbWVudCBpcyBmaXhlZCwgbGV0
J3MgaW50cm9kdWNlIGEgcGVyLWxvZyBiaXRtYXAgaW5zdGVhZCBvZiB0ZW1wCj4+Pj4gYml0bWFw
IHRvIGF2b2lkIHVubmVjZXNzYXJ5IGNhbGN1bGF0aW9uIG92ZXJoZWFkIHdoZW5ldmVyIGFsbG9j
YXRpbmcKPj4+PiBmcmVlIHNsb3Qgdy8gU1NSIGFsbG9jYXRvci4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiB2MjoKPj4+PiAt
IHJlYmFzZSB0byBsYXN0IGRldi10ZXN0IGJyYW5jaC4KPj4+PiAgwqAgZnMvZjJmcy9zZWdtZW50
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4+PiAgwqAgZnMvZjJmcy9z
ZWdtZW50LmggfMKgIDEgKwo+Pj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50
LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+IGluZGV4IDY0NzRiNzMzOGU4MS4uYWY3MTY5MjVk
YjE5IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4gKysrIGIvZnMvZjJm
cy9zZWdtZW50LmMKPj4+PiBAQCAtMjg0MCwzMSArMjg0MCwzOSBAQCBzdGF0aWMgaW50IG5ld19j
dXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwgYm9vbCBuZXdfc2VjKQo+
Pj4+ICDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+ICDCoCB9Cj4+Pj4gLXN0YXRpYyBpbnQgX19u
ZXh0X2ZyZWVfYmxrb2ZmKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHNlZ25vLCBibG9ja190IHN0YXJ0KQo+
Pj4+ICtzdGF0aWMgdm9pZCBfX2dldF9zZWdtZW50X2JpdG1hcChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgKnRhcmdldF9tYXAsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGludCBzZWdubykKPj4+PiAgwqAgewo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBz
ZWdfZW50cnkgKnNlID0gZ2V0X3NlZ19lbnRyeShzYmksIHNlZ25vKTsKPj4+PiAgwqDCoMKgwqDC
oCBpbnQgZW50cmllcyA9IFNJVF9WQkxPQ0tfTUFQX1NJWkUgLyBzaXplb2YodW5zaWduZWQgbG9u
Zyk7Cj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nICp0YXJnZXRfbWFwID0gU0lUX0koc2JpKS0+
dG1wX21hcDsKPj4+PiAgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpja3B0X21hcCA9ICh1bnNp
Z25lZCBsb25nICopc2UtPmNrcHRfdmFsaWRfbWFwOwo+Pj4+ICDCoMKgwqDCoMKgIHVuc2lnbmVk
IGxvbmcgKmN1cl9tYXAgPSAodW5zaWduZWQgbG9uZyAqKXNlLT5jdXJfdmFsaWRfbWFwOwo+Pj4+
ICDCoMKgwqDCoMKgIGludCBpOwo+Pj4+ICDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBlbnRy
aWVzOyBpKyspCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB0YXJnZXRfbWFwW2ldID0gY2twdF9t
YXBbaV0gfCBjdXJfbWFwW2ldOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IF9fbmV4
dF9mcmVlX2Jsa29mZihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGxvbmcgKmJp
dG1hcCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHNl
Z25vLCBibG9ja190IHN0YXJ0KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBfX2dldF9zZWdtZW50X2Jp
dG1hcChzYmksIGJpdG1hcCwgc2Vnbm8pOwo+Pj4+IC3CoMKgwqAgcmV0dXJuIF9fZmluZF9yZXZf
bmV4dF96ZXJvX2JpdCh0YXJnZXRfbWFwLCBCTEtTX1BFUl9TRUcoc2JpKSwgc3RhcnQpOwo+Pj4+
ICvCoMKgwqAgcmV0dXJuIF9fZmluZF9yZXZfbmV4dF96ZXJvX2JpdChiaXRtYXAsIEJMS1NfUEVS
X1NFRyhzYmkpLCBzdGFydCk7Cj4+Pj4gIMKgIH0KPj4+PiAgwqAgc3RhdGljIGludCBmMmZzX2Zp
bmRfbmV4dF9zc3JfYmxvY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgY3Vyc2VnX2luZm8gKnNlZykKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGN1cnNlZ19pbmZvICpzZWcpCj4+Pj4gIMKgIHsK
Pj4+PiAtwqDCoMKgIHJldHVybiBfX25leHRfZnJlZV9ibGtvZmYoc2JpLCBzZWctPnNlZ25vLCBz
ZWctPm5leHRfYmxrb2ZmICsgMSk7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gX19maW5kX3Jldl9uZXh0
X3plcm9fYml0KHNlZy0+dGFyZ2V0X21hcCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEJMS1NfUEVSX1NFRyhzYmkpLCBzZWctPm5leHRfYmxrb2ZmICsgMSk7Cj4+Pj4gIMKg
IH0KPj4+PiAgwqAgYm9vbCBmMmZzX3NlZ21lbnRfaGFzX2ZyZWVfc2xvdChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIGludCBzZWdubykKPj4+PiAgwqAgewo+Pj4+IC3CoMKgwqAgcmV0dXJuIF9f
bmV4dF9mcmVlX2Jsa29mZihzYmksIHNlZ25vLCAwKSA8IEJMS1NfUEVSX1NFRyhzYmkpOwo+Pj4+
ICvCoMKgwqAgcmV0dXJuIF9fbmV4dF9mcmVlX2Jsa29mZihzYmksIFNJVF9JKHNiaSktPnRtcF9t
YXAsIHNlZ25vLCAwKSA8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBCTEtTX1BFUl9TRUcoc2JpKTsKPj4+PiAgwqAgfQo+Pj4+ICDC
oCAvKgo+Pj4+IEBAIC0yODkwLDcgKzI4OTgsOCBAQCBzdGF0aWMgaW50IGNoYW5nZV9jdXJzZWco
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPj4+PiAgwqDCoMKgwqDCoCByZXNl
dF9jdXJzZWcoc2JpLCB0eXBlLCAxKTsKPj4+PiAgwqDCoMKgwqDCoCBjdXJzZWctPmFsbG9jX3R5
cGUgPSBTU1I7Cj4+Pj4gLcKgwqDCoCBjdXJzZWctPm5leHRfYmxrb2ZmID0gX19uZXh0X2ZyZWVf
Ymxrb2ZmKHNiaSwgY3Vyc2VnLT5zZWdubywgMCk7Cj4+Pj4gK8KgwqDCoCBjdXJzZWctPm5leHRf
Ymxrb2ZmID0gX19uZXh0X2ZyZWVfYmxrb2ZmKHNiaSwgY3Vyc2VnLT50YXJnZXRfbWFwLAo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y3Vyc2VnLT5zZWdubywgMCk7Cj4+Pj4gIMKgwqDCoMKgwqAgc3VtX3BhZ2UgPSBmMmZzX2dldF9z
dW1fcGFnZShzYmksIG5ld19zZWdubyk7Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKElTX0VSUihzdW1f
cGFnZSkpIHsKPj4+PiBAQCAtNDYzNSw2ICs0NjQ0LDEwIEBAIHN0YXRpYyBpbnQgYnVpbGRfY3Vy
c2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzaXplb2Yoc3RydWN0IGYyZnNfam91cm5hbCksIEdGUF9LRVJORUwpOwo+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhcnJheVtpXS5qb3VybmFsKQo+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgYXJyYXlbaV0udGFyZ2V0X21hcCA9IGYyZnNfa3phbGxvYyhzYmksIFNJVF9WQkxPQ0tfTUFQ
X1NJWkUsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
IWFycmF5W2ldLnRhcmdldF9tYXApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9NRU07Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaSA8IE5SX1BFUlNJU1RFTlRf
TE9HKQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcnJheVtpXS5zZWdfdHlwZSA9
IENVUlNFR19IT1RfREFUQSArIGk7Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChp
ID09IENVUlNFR19DT0xEX0RBVEFfUElOTkVEKQo+Pj4+IEBAIC01NDUzLDYgKzU0NjYsNyBAQCBz
dGF0aWMgdm9pZCBkZXN0cm95X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+Pj4g
IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IE5SX0NVUlNFR19UWVBFOyBpKyspIHsKPj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKGFycmF5W2ldLnN1bV9ibGspOwo+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqAga2ZyZWUoYXJyYXlbaV0uam91cm5hbCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGtmcmVlKGFycmF5W2ldLnRhcmdldF9tYXApOwo+Pj4+ICDCoMKgwqDCoMKgIH0KPj4+PiAgwqDC
oMKgwqDCoCBrZnJlZShhcnJheSk7Cj4+Pj4gIMKgIH0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9zZWdtZW50LmggYi9mcy9mMmZzL3NlZ21lbnQuaAo+Pj4+IGluZGV4IGUxYzBmNDE4YWExMS4u
MTBmM2U0NGYwMzZmIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oCj4+Pj4gKysr
IGIvZnMvZjJmcy9zZWdtZW50LmgKPj4+PiBAQCAtMjkyLDYgKzI5Miw3IEBAIHN0cnVjdCBjdXJz
ZWdfaW5mbyB7Cj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfc3VtbWFyeV9ibG9jayAqc3Vt
X2JsazvCoMKgwqAgLyogY2FjaGVkIHN1bW1hcnkgYmxvY2sgKi8KPj4+PiAgwqDCoMKgwqDCoCBz
dHJ1Y3Qgcndfc2VtYXBob3JlIGpvdXJuYWxfcndzZW07wqDCoMKgIC8qIHByb3RlY3Qgam91cm5h
bCBhcmVhICovCj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfam91cm5hbCAqam91cm5hbDvC
oMKgwqDCoMKgwqDCoCAvKiBjYWNoZWQgam91cm5hbCBpbmZvICovCj4+Pj4gK8KgwqDCoCB1bnNp
Z25lZCBsb25nICp0YXJnZXRfbWFwO8KgwqDCoMKgwqDCoMKgIC8qIGJpdG1hcCBmb3IgU1NSIGFs
bG9jYXRvciAqLwo+Pj4+ICDCoMKgwqDCoMKgIHVuc2lnbmVkIGNoYXIgYWxsb2NfdHlwZTvCoMKg
wqDCoMKgwqDCoCAvKiBjdXJyZW50IGFsbG9jYXRpb24gdHlwZSAqLwo+Pj4+ICDCoMKgwqDCoMKg
IHVuc2lnbmVkIHNob3J0IHNlZ190eXBlO8KgwqDCoMKgwqDCoMKgIC8qIHNlZ21lbnQgdHlwZSBs
aWtlIENVUlNFR19YWFhfVFlQRSAqLwo+Pj4+ICDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzZWdu
bzvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGN1cnJlbnQgc2VnbWVudCBudW1iZXIgKi8KPj4+
Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
