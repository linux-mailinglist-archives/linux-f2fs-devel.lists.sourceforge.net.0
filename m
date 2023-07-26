Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4899776322B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 11:31:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOarq-0008W1-Gs;
	Wed, 26 Jul 2023 09:31:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOarp-0008Vu-54
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=; b=VMjw5085kAhP9f9KFT4FOmOIxb
 l9mBhNr11kjINuspeHV6wXqk9Gee2howCTx0qY3bZ49ubpEiRxP2OaqEAeeYrZtLU7WUpEEAJtz5J
 NUnFpkUT3mTIK5y/fif0p0xjzrKSmDyFRt+guw9XPanvjlJF639Jchj7jNSPBrezrcko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=; b=JSiV2jg8eTvwjnTw/6vPnnDs7t
 crY2AlMwjul44/punwRF64NuoPdINxLQJ4mt+U45xFnSz62Ul5FBNgeMZ7s4jYNdk3bhiYWlXuflg
 NYPFtTK5DYpO4KrH4pW83s6XcSS5R5oeRz361sqizytZN4eRKfFrVmvNrak3yT1qUf0U=;
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOarl-002tTt-U2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:31:37 +0000
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-55b78bf0423so262342a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363888; x=1690968688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
 b=EQF1AXz3x2yXYd4qjMocTxTPUv5xmp+rmGdaUf3NNuCw5J/jTQ4A7IZT9vF7epjgJn
 KpwUuVkJ6HJRDUdWsR7NfWHbSXC8PWsHFdh4oIHUbaD9e84jeocWSrQORf7q4ywyRFQs
 1LGzZPZFXEkz9W3LLj6dH3mxCQb9lJbVi2esRgVEZwICTBL25qmDvMRXpJTk+hKerksQ
 5luk2+UVNUyo38NcOvmQg3etwWF0YvvBh8PEUa0Itb7+IS99+a0eXqafnZ8swwiJM5Cj
 hj/kRKpfCuHQwUVrKGY+/fSvHLFGiflLsA9oD4Oo9Kuwpr8gW47+Nnd/Sw58xHubMwbF
 Qyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363888; x=1690968688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
 b=XIjNqWK7BF6swAnZ+SDYiOEjClJcOP8sSUwDQu1sbVWegwuLN4XajOockTBUznJMQP
 sy9a1idcMKx8UssUMtatjyT49OQzORBNtwGN82h7zAZRa1VIcz4Eo/iz4T57WPdeWkEV
 3H8go0oU0OVzr2+DJuuPvnbWws0G9rHWT2SaZaBYradlzZ70uQzPL9pTxJB4Upply9DM
 +QF84m0TskFYfDoDdTTxfi21vVf55eCu6S9YKqnh8U/5+KKMq5W+yLDC8g/7rHJ00lmL
 H7lb2UwhGwitgbJIja3TbmmSYlUB3OlLqjLKIhos3StSaLMeLpO3fKI7cwyr9hXvJ5Lw
 9A7w==
X-Gm-Message-State: ABy/qLb0yiQU+RDlLHL9ab3EXpoUSe3P70ZEtpJwXofcg/ZizpF8RMbC
 XWMkrAMHyLsibkTRU4HHzTbHfQ==
X-Google-Smtp-Source: APBJJlEqsGncSKz6JEtDSHUBqLuH7hBKwqIpyMup6VZ4SlPsq4lxhQ8OawAhUiBJ+OlnlseBEBKBeQ==
X-Received: by 2002:a05:6a00:4a10:b0:686:b990:560f with SMTP id
 do16-20020a056a004a1000b00686b990560fmr1620878pfb.2.1690363888304; 
 Wed, 26 Jul 2023 02:31:28 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa791c5000000b0065446092699sm11395167pfa.141.2023.07.26.02.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:31:27 -0700 (PDT)
Message-ID: <b941338c-56e7-65e7-da45-bfefc484ad80@bytedance.com>
Date: Wed, 26 Jul 2023 17:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
 <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
In-Reply-To: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/26 15:24, Muchun Song wrote: > > > On 2023/7/24
 17:43, Qi Zheng wrote: >> In preparation for implementing lockless slab shrink,
 use new APIs to >> dynamically allocate the drm-msm_gem shrink [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.179 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOarl-002tTt-U2
Subject: Re: [f2fs-dev] [PATCH v2 23/47] drm/msm: dynamically allocate the
 drm-msm_gem shrinker
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIzLzcvMjYgMTU6MjQsIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIGZvciBpbXBsZW1l
bnRpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmssIHVzZSBuZXcgQVBJcyB0bwo+PiBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgZHJtLW1zbV9nZW0gc2hyaW5rZXIsIHNvIHRoYXQgaXQgY2FuIGJlIGZy
ZWVkCj4+IGFzeW5jaHJvbm91c2x5IHVzaW5nIGtmcmVlX3JjdSgpLiBUaGVuIGl0IGRvZXNuJ3Qg
bmVlZCB0byB3YWl0IGZvciBSQ1UKPj4gcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24gd2hlbiBy
ZWxlYXNpbmcgdGhlIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
TXVjaHVuIFNvbmcgPHNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbT4KPiAKPiBBIG5pdCBiZWxsb3cu
Cj4gCj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuY8KgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNCArKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmjCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dl
bV9zaHJpbmtlci5jIHwgMzYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4gwqAgMyBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2Rydi5jCj4+IGluZGV4IDg5MWVmZjg0MzNhOS4uN2Y2OTMzYmU3MDNmIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9kcnYuYwo+PiBAQCAtNDYxLDcgKzQ2MSw5IEBAIHN0YXRpYyBpbnQg
bXNtX2RybV9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgCj4+IHN0cnVjdCBkcm1fZHJp
dmVyICpkcnYpCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyX21zbV91bmluaXQ7Cj4+IC3CoMKgwqAgbXNtX2dlbV9zaHJpbmtlcl9pbml0KGRkZXYp
Owo+PiArwqDCoMKgIHJldCA9IG1zbV9nZW1fc2hyaW5rZXJfaW5pdChkZGV2KTsKPj4gK8KgwqDC
oCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfbXNtX3VuaW5pdDsKPj4gwqDC
oMKgwqDCoCBpZiAocHJpdi0+a21zX2luaXQpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IHByaXYtPmttc19pbml0KGRkZXYpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZHJ2LmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKPj4gaW5kZXgg
ZTEzYThjYmQ2MWM5Li44NDUyM2Q0YTFlNTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2Rydi5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oCj4+
IEBAIC0yMTcsNyArMjE3LDcgQEAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSB7Cj4+IMKgwqDCoMKg
wqAgfSB2cmFtOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBub3RpZmllcl9ibG9jayB2bWFwX25vdGlm
aWVyOwo+PiAtwqDCoMKgIHN0cnVjdCBzaHJpbmtlciBzaHJpbmtlcjsKPj4gK8KgwqDCoCBzdHJ1
Y3Qgc2hyaW5rZXIgKnNocmlua2VyOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fYXRvbWljX3N0
YXRlICpwbV9zdGF0ZTsKPj4gQEAgLTI3OSw3ICsyNzksNyBAQCBpbnQgbXNtX2lvY3RsX2dlbV9z
dWJtaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4+IHZvaWQgKmRhdGEsCj4+IMKgIHVuc2ln
bmVkIGxvbmcgbXNtX2dlbV9zaHJpbmtlcl9zaHJpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
Cj4+IHVuc2lnbmVkIGxvbmcgbnJfdG9fc2Nhbik7Cj4+IMKgICNlbmRpZgo+PiAtdm9pZCBtc21f
Z2VtX3Nocmlua2VyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7Cj4+ICtpbnQgbXNtX2dl
bV9zaHJpbmtlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwo+PiDCoCB2b2lkIG1zbV9n
ZW1fc2hyaW5rZXJfY2xlYW51cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKPj4gwqAgaW50IG1z
bV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IAo+PiB2
bV9hcmVhX3N0cnVjdCAqdm1hKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2dlbV9zaHJpbmtlci5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zaHJp
bmtlci5jCj4+IGluZGV4IGYzODI5NmFkODc0My4uN2RhYWIxMjk4YzExIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYwo+PiBAQCAtMzQsOCArMzQsNyBAQCBzdGF0
aWMgYm9vbCBjYW5fYmxvY2soc3RydWN0IHNocmlua19jb250cm9sICpzYykKPj4gwqAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcKPj4gwqAgbXNtX2dlbV9zaHJpbmtlcl9jb3VudChzdHJ1Y3Qgc2hyaW5r
ZXIgKnNocmlua2VyLCBzdHJ1Y3QgCj4+IHNocmlua19jb250cm9sICpzYykKPj4gwqAgewo+PiAt
wqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPQo+PiAtwqDCoMKgwqDCoMKgwqAg
Y29udGFpbmVyX29mKHNocmlua2VyLCBzdHJ1Y3QgbXNtX2RybV9wcml2YXRlLCBzaHJpbmtlcik7
Cj4+ICvCoMKgwqAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHNocmlua2VyLT5wcml2
YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgY291bnQgPSBwcml2LT5scnUuZG9udG5l
ZWQuY291bnQ7Cj4+IMKgwqDCoMKgwqAgaWYgKGNhbl9zd2FwKCkpCj4+IEBAIC0xMDAsOCArOTks
NyBAQCBhY3RpdmVfZXZpY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4+IMKgIHN0YXRp
YyB1bnNpZ25lZCBsb25nCj4+IMKgIG1zbV9nZW1fc2hyaW5rZXJfc2NhbihzdHJ1Y3Qgc2hyaW5r
ZXIgKnNocmlua2VyLCBzdHJ1Y3QgCj4+IHNocmlua19jb250cm9sICpzYykKPj4gwqAgewo+PiAt
wqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPQo+PiAtwqDCoMKgwqDCoMKgwqAg
Y29udGFpbmVyX29mKHNocmlua2VyLCBzdHJ1Y3QgbXNtX2RybV9wcml2YXRlLCBzaHJpbmtlcik7
Cj4+ICvCoMKgwqAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHNocmlua2VyLT5wcml2
YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkcm1fZ2VtX2xydSAqbHJ1Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCAoKnNocmlu
aykoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwo+PiBAQCAtMTQ4LDEwICsxNDYsMTEgQEAg
bXNtX2dlbV9zaHJpbmtlcl9zaHJpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4+IHVuc2ln
bmVkIGxvbmcgbnJfdG9fc2NhbikKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wg
c2MgPSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfdG9fc2NhbiA9IG5yX3RvX3NjYW4sCj4+
IMKgwqDCoMKgwqAgfTsKPj4gLcKgwqDCoCBpbnQgcmV0Owo+PiArwqDCoMKgIHVuc2lnbmVkIGxv
bmcgcmV0ID0gU0hSSU5LX1NUT1A7Cj4+IMKgwqDCoMKgwqAgZnNfcmVjbGFpbV9hY3F1aXJlKEdG
UF9LRVJORUwpOwo+PiAtwqDCoMKgIHJldCA9IG1zbV9nZW1fc2hyaW5rZXJfc2NhbigmcHJpdi0+
c2hyaW5rZXIsICZzYyk7Cj4+ICvCoMKgwqAgaWYgKHByaXYtPnNocmlua2VyKQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0ID0gbXNtX2dlbV9zaHJpbmtlcl9zY2FuKHByaXYtPnNocmlua2VyLCAmc2Mp
Owo+PiDCoMKgwqDCoMKgIGZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKPj4gwqDCoMKg
wqDCoCByZXR1cm4gcmV0Owo+PiBAQCAtMjEwLDE2ICsyMDksMjcgQEAgbXNtX2dlbV9zaHJpbmtl
cl92bWFwKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIAo+PiB1bnNpZ25lZCBsb25nIGV2ZW50
LCB2b2lkICpwdHIpCj4+IMKgwqAgKgo+PiDCoMKgICogVGhpcyBmdW5jdGlvbiByZWdpc3RlcnMg
YW5kIHNldHMgdXAgdGhlIG1zbSBzaHJpbmtlci4KPj4gwqDCoCAqLwo+PiAtdm9pZCBtc21fZ2Vt
X3Nocmlua2VyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4gK2ludCBtc21fZ2VtX3No
cmlua2VyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4gwqAgewo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBkZXYtPmRldl9wcml2YXRlOwo+PiAtwqDC
oMKgIHByaXYtPnNocmlua2VyLmNvdW50X29iamVjdHMgPSBtc21fZ2VtX3Nocmlua2VyX2NvdW50
Owo+PiAtwqDCoMKgIHByaXYtPnNocmlua2VyLnNjYW5fb2JqZWN0cyA9IG1zbV9nZW1fc2hyaW5r
ZXJfc2NhbjsKPj4gLcKgwqDCoCBwcml2LT5zaHJpbmtlci5zZWVrcyA9IERFRkFVTFRfU0VFS1M7
Cj4+IC3CoMKgwqAgV0FSTl9PTihyZWdpc3Rlcl9zaHJpbmtlcigmcHJpdi0+c2hyaW5rZXIsICJk
cm0tbXNtX2dlbSIpKTsKPj4gKwo+PiArwqDCoMKgIHByaXYtPnNocmlua2VyID0gc2hyaW5rZXJf
YWxsb2MoMCwgImRybS1tc21fZ2VtIik7Cj4+ICvCoMKgwqAgaWYgKCFwcml2LT5zaHJpbmtlcikg
ewo+IAo+IEp1c3QgImlmIChXQVJOX09OKCFwcml2LT5zaHJpbmtlcikpIgoKQXMgc3VnZ2VzdGVk
IGJ5IFN0ZXZlbiBQcmljIGluIHBhdGNoICMyNCwgdGhpcyB3YXJuaW5nIGlzCnVubmVjZXNzYXJ5
LCBzbyBJIHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IAo+PiArwqDCoMKg
wqDCoMKgwqAgV0FSTl9PTigxKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+
PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHByaXYtPnNocmlua2VyLT5jb3VudF9vYmplY3Rz
ID0gbXNtX2dlbV9zaHJpbmtlcl9jb3VudDsKPj4gK8KgwqDCoCBwcml2LT5zaHJpbmtlci0+c2Nh
bl9vYmplY3RzID0gbXNtX2dlbV9zaHJpbmtlcl9zY2FuOwo+PiArwqDCoMKgIHByaXYtPnNocmlu
a2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4+ICvCoMKgwqAgcHJpdi0+c2hyaW5rZXItPnBy
aXZhdGVfZGF0YSA9IHByaXY7Cj4+ICsKPj4gK8KgwqDCoCBzaHJpbmtlcl9yZWdpc3Rlcihwcml2
LT5zaHJpbmtlcik7Cj4+IMKgwqDCoMKgwqAgcHJpdi0+dm1hcF9ub3RpZmllci5ub3RpZmllcl9j
YWxsID0gbXNtX2dlbV9zaHJpbmtlcl92bWFwOwo+PiDCoMKgwqDCoMKgIFdBUk5fT04ocmVnaXN0
ZXJfdm1hcF9wdXJnZV9ub3RpZmllcigmcHJpdi0+dm1hcF9ub3RpZmllcikpOwo+PiArCj4+ICvC
oMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAgLyoqCj4+IEBAIC0yMzIsOCArMjQyLDggQEAg
dm9pZCBtc21fZ2VtX3Nocmlua2VyX2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4g
wqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBkZXYtPmRl
dl9wcml2YXRlOwo+PiAtwqDCoMKgIGlmIChwcml2LT5zaHJpbmtlci5ucl9kZWZlcnJlZCkgewo+
PiArwqDCoMKgIGlmIChwcml2LT5zaHJpbmtlcikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgV0FS
Tl9PTih1bnJlZ2lzdGVyX3ZtYXBfcHVyZ2Vfbm90aWZpZXIoJnByaXYtPnZtYXBfbm90aWZpZXIp
KTsKPj4gLcKgwqDCoMKgwqDCoMKgIHVucmVnaXN0ZXJfc2hyaW5rZXIoJnByaXYtPnNocmlua2Vy
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNocmlua2VyX3VucmVnaXN0ZXIocHJpdi0+c2hyaW5rZXIp
Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgfQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
