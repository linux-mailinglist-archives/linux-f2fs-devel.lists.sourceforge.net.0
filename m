Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113BACE89E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 05:31:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFCuc4UlHl/oU4GTkZa7Av/WRYehxqoakrFyzUX5rIs=; b=NWwmR1CgWwQu8ww3JVsxTiGbl5
	s5UarKXSVb6aSRivn8FeNrxjatTSltWNRM4uMVouQHviErtCKFH7u3SjGbO8dAJLqG7LJo1Ug4Jz5
	Ril8W+ZpWux3MBchVaq6SheNO01XX++a1gjFJH51AMlsnTWFdfQSIapgIkjhE3N8L6VE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN1KY-0000tX-Rb;
	Thu, 05 Jun 2025 03:31:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uN1KX-0000tP-74
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 03:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTIKEI6K0bEXWHGIAV+Df9MykHap9mFkQ7BLBFjjFG4=; b=WMDp6x6w8W9HtO8Xb8ARNfyZWC
 PIUSpLv+tEb66N2I5epxKgLBCCN1pJVKE1HCZEMAUpplOEGSf7TO+5gNJgW51a8HhmJ9vD4Ri7ZLI
 lJ3lprLgHHEYu3Ehf8N912p5LdjXKwej95Fcjzt++A8oI0XgRjkAKVAQoSgWu8LuZ3EY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTIKEI6K0bEXWHGIAV+Df9MykHap9mFkQ7BLBFjjFG4=; b=PHHnZbgfXnXJY7lDxmoFEUtXwG
 isqUWISyNRv5ZbkiG4damT0P7mZ1WU+r5QswmkqC3XJko9wi9YbYTVRUjUbz/vJjCszuk6t30PJwr
 KI+wUiUeYZYA+y8SohFyKGQsJ+vXSikCA7Jc7W1cyMJTz+BjILoN++XxGLVAjncGWBbw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uN1KW-0008HX-OQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 03:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2804A44B73;
 Thu,  5 Jun 2025 03:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058F1C4CEEB;
 Thu,  5 Jun 2025 03:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749094298;
 bh=zD9KLdlxoxnlel0R+Dkuhh1beMBQe4Pg1pYX12Fw11w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=N0mNAoodH8TxwIffoYAp4amYWbVnUShMldcW4shFI9Q/GpK8mGqNUXUYAktsr4ENm
 r1JuvnXsClo3jrA+Ytf96oIb9pwpDI3IBMQHKeWUZDKwMfnBmWMvEr2roh/G8XlE+z
 p2D1ae2GUomPL+GMpSywOWft13FqwUqVs2wKOUIMH0yPghuaEa6hszSQaA0wNSLYnI
 rYyhSUdgkrlgCOm4WcDIMy8QdsslayX00qr+oKJfLkojas6Uceey8+8aKRwhMsUuGZ
 53D1yxHwsKlqY5hy+NBVMnR6XV7SrBDmHAjNL+cCGYRlD5NEQwldkdOLu9CMRznpRU
 UHEflhRf82O5g==
Message-ID: <2a387dd6-9c10-478d-aae2-8284ad395944@kernel.org>
Date: Thu, 5 Jun 2025 11:31:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
 <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
 <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 6/5/25 10:44, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2025年6月5日周四 10:23写道： >> >> On 6/4/25 19:37, Zhiguo Niu
    wrote: >>> The decompress_io_ctx may be released asynchronously [...] 
 
 Content analysis details:   (-0.5 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uN1KW-0008HX-OQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNi81LzI1IDEwOjQ0LCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4g5LqOMjAyNeW5tDbmnIg15pel5ZGo5ZubIDEwOjIz5YaZ6YGT77yaCj4+Cj4+IE9uIDYv
NC8yNSAxOTozNywgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IFRoZSBkZWNvbXByZXNzX2lvX2N0eCBt
YXkgYmUgcmVsZWFzZWQgYXN5bmNocm9ub3VzbHkgYWZ0ZXIKPj4+IEkvTyBjb21wbGV0aW9uLiBJ
ZiB0aGlzIGZpbGUgaXMgZGVsZXRlZCBpbW1lZGlhdGVseSBhZnRlciByZWFkLAo+Pj4gYW5kIHRo
ZSBrd29ya2VyIG9mIHByb2Nlc3NpbmcgcG9zdF9yZWFkX3dxIGhhcyBub3QgYmVlbiBleGVjdXRl
ZCB5ZXQKPj4+IGR1ZSB0byBoaWdoIHdvcmtsb2FkcywgSXQgaXMgcG9zc2libGUgdGhhdCB0aGUg
aW5vZGUoZjJmc19pbm9kZV9pbmZvKQo+Pj4gaXMgZXZpY3RlZCBhbmQgZnJlZWQgYmVmb3JlIGl0
IGlzIHVzZWQgZjJmc19mcmVlX2RpYy4KPj4+Cj4+PiAgICAgVGhlIFVBRiBjYXNlIGFzIGJlbG93
Ogo+Pj4gICAgIFRocmVhZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBU
aHJlYWQgQgo+Pj4gICAgIC0gZjJmc19kZWNvbXByZXNzX2VuZF9pbwo+Pj4gICAgICAtIGYyZnNf
cHV0X2RpYwo+Pj4gICAgICAgLSBxdWV1ZV93b3JrCj4+PiAgICAgICAgIGFkZCBmcmVlX2RpYyB3
b3JrIHRvIHBvc3RfcmVhZF93cQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLSBkb191bmxpbmsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGlwdXQKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBldmljdAo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBjYWxsX3JjdQo+
Pj4gICAgIFRoaXMgZmlsZSBpcyBkZWxldGVkIGFmdGVyIHJlYWQuCj4+Pgo+Pj4gICAgIFRocmVh
ZCBDICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3dvcmtlciB0byBwcm9jZXNzIHBv
c3RfcmVhZF93cQo+Pj4gICAgIC0gcmN1X2RvX2JhdGNoCj4+PiAgICAgIC0gZjJmc19mcmVlX2lu
b2RlCj4+PiAgICAgICAtIGttZW1fY2FjaGVfZnJlZQo+Pj4gICAgICBpbm9kZSBpcyBmcmVlZCBi
eSByY3UKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0g
cHJvY2Vzc19zY2hlZHVsZWRfd29ya3MKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtIGYyZnNfbGF0ZV9mcmVlX2RpYwo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfZnJlZV9kaWMKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19yZWxlYXNl
X2RlY29tcF9tZW0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVh
ZCAoZGljLT5pbm9kZSktPmlfY29tcHJlc3NfYWxnb3JpdGhtCj4+Pgo+Pj4gVGhpcyBwYXRjaCB1
c2UgX19pZ2V0IGJlZm9yZSBmMmZzX2ZyZWVfZGljIGFuZCBpcHV0IGFmdGVyIGZyZWUgdGhlIGRp
Yy4KPj4+Cj4+PiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IEZp
eGVzOiBiZmYxMzliNDlkOWYgKCJmMmZzOiBoYW5kbGUgZGVjb21wcmVzcyBvbmx5IHBvc3QgcHJv
Y2Vzc2luZyBpbiBzb2Z0aXJxIikKPj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEJhb2NvbmcgTGl1IDxiYW9jb25n
LmxpdUB1bmlzb2MuY29tPgo+Pj4gLS0tCj4+PiB2MjogdXNlIF9faWdldC9pcHV0IGZ1bmN0aW9u
Cj4+PiAtLS0KPj4+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCAxNiArKysrKysrKysrKy0tLS0tCj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+
Pj4gaW5kZXggYjNjMWRmOS4uM2YwYzE4ZCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvY29tcHJl
c3MuYwo+Pj4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+PiBAQCAtMTY4Nyw3ICsxNjg3LDcg
QEAgc3RhdGljIHZvaWQgZjJmc19yZWxlYXNlX2RlY29tcF9tZW0oc3RydWN0IGRlY29tcHJlc3Nf
aW9fY3R4ICpkaWMsCj4+PiAgfQo+Pj4KPj4+ICBzdGF0aWMgdm9pZCBmMmZzX2ZyZWVfZGljKHN0
cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+Pj4gLSAgICAgICAgICAgICBib29sIGJ5cGFz
c19kZXN0cm95X2NhbGxiYWNrKTsKPj4+ICsgICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJv
eV9jYWxsYmFjaywgYm9vbCBsYXRlX2ZyZWUpOwo+Pj4KPj4+ICBzdHJ1Y3QgZGVjb21wcmVzc19p
b19jdHggKmYyZnNfYWxsb2NfZGljKHN0cnVjdCBjb21wcmVzc19jdHggKmNjKQo+Pj4gIHsKPj4+
IEBAIC0xNzQzLDEyICsxNzQzLDEyIEBAIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZjJmc19h
bGxvY19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4+PiAgICAgICByZXR1cm4gZGljOwo+
Pj4KPj4+ICBvdXRfZnJlZToKPj4+IC0gICAgIGYyZnNfZnJlZV9kaWMoZGljLCB0cnVlKTsKPj4+
ICsgICAgIGYyZnNfZnJlZV9kaWMoZGljLCB0cnVlLCBmYWxzZSk7Cj4+PiAgICAgICByZXR1cm4g
RVJSX1BUUihyZXQpOwo+Pj4gIH0KPj4+Cj4+PiAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywKPj4+IC0gICAgICAgICAgICAgYm9vbCBieXBh
c3NfZGVzdHJveV9jYWxsYmFjaykKPj4+ICsgICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJv
eV9jYWxsYmFjaywgYm9vbCBsYXRlX2ZyZWUpCj4+PiAgewo+Pj4gICAgICAgaW50IGk7Cj4+Pgo+
Pj4gQEAgLTE3NzUsNiArMTc3NSw4IEBAIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0
IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsCj4+PiAgICAgICB9Cj4+Pgo+Pj4gICAgICAgcGFnZV9h
cnJheV9mcmVlKGRpYy0+aW5vZGUsIGRpYy0+cnBhZ2VzLCBkaWMtPm5yX3JwYWdlcyk7Cj4+PiAr
ICAgICBpZiAobGF0ZV9mcmVlKQo+Pj4gKyAgICAgICAgICAgICBpcHV0KGRpYy0+aW5vZGUpOwo+
Pj4gICAgICAga21lbV9jYWNoZV9mcmVlKGRpY19lbnRyeV9zbGFiLCBkaWMpOwo+Pj4gIH0KPj4+
Cj4+PiBAQCAtMTc4MywxNiArMTc4NSwyMCBAQCBzdGF0aWMgdm9pZCBmMmZzX2xhdGVfZnJlZV9k
aWMoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+Pj4gICAgICAgc3RydWN0IGRlY29tcHJlc3Nf
aW9fY3R4ICpkaWMgPQo+Pj4gICAgICAgICAgICAgICBjb250YWluZXJfb2Yod29yaywgc3RydWN0
IGRlY29tcHJlc3NfaW9fY3R4LCBmcmVlX3dvcmspOwo+Pj4KPj4+IC0gICAgIGYyZnNfZnJlZV9k
aWMoZGljLCBmYWxzZSk7Cj4+PiArICAgICBmMmZzX2ZyZWVfZGljKGRpYywgZmFsc2UsIHRydWUp
Owo+Pj4gIH0KPj4+Cj4+PiAgc3RhdGljIHZvaWQgZjJmc19wdXRfZGljKHN0cnVjdCBkZWNvbXBy
ZXNzX2lvX2N0eCAqZGljLCBib29sIGluX3Rhc2spCj4+PiAgewo+Pj4gICAgICAgaWYgKHJlZmNv
dW50X2RlY19hbmRfdGVzdCgmZGljLT5yZWZjbnQpKSB7Cj4+PiAgICAgICAgICAgICAgIGlmIChp
bl90YXNrKSB7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgZjJmc19mcmVlX2RpYyhkaWMsIGZh
bHNlKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBmMmZzX2ZyZWVfZGljKGRpYywgZmFsc2Us
IGZhbHNlKTsKPj4+ICAgICAgICAgICAgICAgfSBlbHNlIHsKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICBJTklUX1dPUksoJmRpYy0+ZnJlZV93b3JrLCBmMmZzX2xhdGVfZnJlZV9kaWMpOwo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIC8qIHRvIGF2b2lkIGlub2RlIGlzIGV2aWN0ZWQgc2ltdWx0
YW5lb3VzbHkgKi8KPj4+ICsgICAgICAgICAgICAgICAgICAgICBzcGluX2xvY2soJmRpYy0+aW5v
ZGUtPmlfbG9jayk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgX19pZ2V0KGRpYy0+aW5vZGUp
Owo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkaWMtPmlub2RlLT5pX2xv
Y2spOwo+Pgo+PiBPaCwgaG93IGFib3V0IHVzaW5nIGlncmFiKCkgaW5zdGVhZD8KPiBIaSBDaGFv
LAo+IGFmdGVyIEkgY2hlY2sgaWdyYWIsIEkgdGhpbmsgaXQgaXMgb2ssCj4gYnV0IGhlcmUgV2Ug
ZG9uJ3QgbmVlZCBjYXJlIGFib3V0IGlnYXJiJ3MgcmV0dXJuIHZhbHVlLCByaWdodD8KCkkgZ3Vl
c3MgInJldHVybiBOVUxMIiBzaG91bGQgYmUgaW1wb3NzaWJsZSBjYXNlLCBidXQgc3RpbGwgd2Ug
Y2FuIGFkZApmMmZzX2J1Z19vbigpIHRvIGRldGVjdCBhbnkgcG90ZW50aWFsIGJ1ZywgcmlnaHQ/
CgpUaGFua3MsCgo+IFRoYW5rcyEKPiAKPj4KPj4+ICAgICAgICAgICAgICAgICAgICAgICBxdWV1
ZV93b3JrKEYyRlNfSV9TQihkaWMtPmlub2RlKS0+cG9zdF9yZWFkX3dxLAo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZGljLT5mcmVlX3dvcmspOwo+Pj4gICAgICAg
ICAgICAgICB9Cj4+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
