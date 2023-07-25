Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12B760FDD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 11:57:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOEmo-0001zc-4F;
	Tue, 25 Jul 2023 09:56:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOEmm-0001zP-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 09:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/casiWQBa8FLPDyI/Gjog1Q/iFy65e/7JWaM5Gwrppw=; b=COdUUTuipBhzO30Q8iw7xHBGSN
 72ZFZxbeHlg5XApyAIz3D4XW5t7dvN3Cae981QcAupPPJMe6+72XFhTTaTTaWHom/z1Tv8hzyBU8W
 w5zMdFBUWWl/uWQG1sf552MgAe8IPC2Fl5TrKIJAZ4wC5Ulu2auYJ/5VbGLrSembu92I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/casiWQBa8FLPDyI/Gjog1Q/iFy65e/7JWaM5Gwrppw=; b=fjazyejUAD99xqkGcvQ3gpQnIv
 o/2t4pl4N3GVjB03seJfz6J4sC8Uv3dfq9YWDiRAdJZTEcOotJRyPl1GZiXB8o/dwhxNSd0nSLqw5
 YCiDW81HR/bPPKCtPBHR1fDh4piqdHmCEsO7CR8lCyiVQQDh3YhEhJh2bBQ1vkN8bB0k=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOEmj-001i9j-ND for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 09:56:55 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2659b1113c2so706754a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jul 2023 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690279003; x=1690883803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/casiWQBa8FLPDyI/Gjog1Q/iFy65e/7JWaM5Gwrppw=;
 b=kzP9jxhdW7EUIP2JpY6nQ4V3KB8KzHZHwXd+bJOEeLU9gCN3lvtKTIOyV+D6pg6POw
 Q2+Agk0fHs6Wf0nJIf8rf8T9VZNFr/hsapg2zga11FSk7AOs0JkWfaLjemq0FDeG0Uw5
 HhEk2mitTuKDolaaQqjf+O9IL+c+U5F1pPsQI+4eucs75jhsRhGM9fqq3uQDPTEvroq0
 /U4/CVAvtL3Xk0W286vaVtW9MXQ1p85A5kNQw+kxMFfLtXWo8Tn1go6QyxS1jqmnrw9a
 uFzHc2WhcIqVkW0xdKzdkJ+42hQ6tNSe2IXCsgIEyfURXIjl60ODrk022w8+JVfo8hQI
 ne/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690279003; x=1690883803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/casiWQBa8FLPDyI/Gjog1Q/iFy65e/7JWaM5Gwrppw=;
 b=QLL4MYMuns4+17G05V4XmNN7sDPZTPKmpEVnHfPXYMxrGAsvizkLajAkvn/8wvpQ8n
 bWcP4KTm+0z4kPaWgShJYh1zy6tKcwj9x9wsQrn1smZqeniz7vgOX2NJy9w9ObgrJnkH
 TCBCzUL3fc0chYDq1ojzy8SyC6xPp+2DOihjlSIbhgjszLgFKUOe1NVKsvCUffNZC+x7
 VsEFSmOWvcjXK/Epl15ZTgyMaptoXdHZQZzaXXq1dEWouC2xBUXvP4PhtbBZkfq8rOc8
 Aj/FuT2qI/xNNvnt7JZ4wotDxjkwvbZlDapFC6iuzspQAr06KIBw+NJDvW6P8b0ZJ8gh
 b8gA==
X-Gm-Message-State: ABy/qLazzU9C3jo4EDOI4hQeIyPngRAb8/fI0wrL9Cqu9FSRiJIjwBIu
 WYJh8mtoGs3mb0FwQS+a6ojfGA==
X-Google-Smtp-Source: APBJJlE4g3zxacKAsn4H4YysRKAp71VN9gqUpsqodFXfAXxBRsoAel6FjePiWo+WkUy1agkNvA6LJQ==
X-Received: by 2002:a17:90a:74cf:b0:268:196f:9656 with SMTP id
 p15-20020a17090a74cf00b00268196f9656mr4627258pjl.1.1690279003192; 
 Tue, 25 Jul 2023 02:56:43 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170902da8800b001b39ffff838sm10605398plx.25.2023.07.25.02.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 02:56:42 -0700 (PDT)
Message-ID: <c1a1952f-0c3e-2fa1-fdf9-8b3b8a592b23@bytedance.com>
Date: Tue, 25 Jul 2023 17:56:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
 <3648ca69-d65e-8431-135a-a5738586bc25@linux.dev>
In-Reply-To: <3648ca69-d65e-8431-135a-a5738586bc25@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Muchun, On 2023/7/25 17:02, Muchun Song wrote: > > > On
 2023/7/24 17:43, Qi Zheng wrote: >> Currently, the shrinker instances can
 be divided into the following three >> types: >> >> a) global shrinker instanc
 [...] Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.47 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOEmj-001i9j-ND
Subject: Re: [f2fs-dev] [PATCH v2 03/47] mm: shrinker: add infrastructure
 for dynamically allocating shrinker
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

SGkgTXVjaHVuLAoKT24gMjAyMy83LzI1IDE3OjAyLCBNdWNodW4gU29uZyB3cm90ZToKPiAKPiAK
PiBPbiAyMDIzLzcvMjQgMTc6NDMsIFFpIFpoZW5nIHdyb3RlOgo+PiBDdXJyZW50bHksIHRoZSBz
aHJpbmtlciBpbnN0YW5jZXMgY2FuIGJlIGRpdmlkZWQgaW50byB0aGUgZm9sbG93aW5nIHRocmVl
Cj4+IHR5cGVzOgo+Pgo+PiBhKSBnbG9iYWwgc2hyaW5rZXIgaW5zdGFuY2Ugc3RhdGljYWxseSBk
ZWZpbmVkIGluIHRoZSBrZXJuZWwsIHN1Y2ggYXMKPj4gwqDCoMKgIHdvcmtpbmdzZXRfc2hhZG93
X3Nocmlua2VyLgo+Pgo+PiBiKSBnbG9iYWwgc2hyaW5rZXIgaW5zdGFuY2Ugc3RhdGljYWxseSBk
ZWZpbmVkIGluIHRoZSBrZXJuZWwgbW9kdWxlcywgCj4+IHN1Y2gKPj4gwqDCoMKgIGFzIG1tdV9z
aHJpbmtlciBpbiB4ODYuCj4+Cj4+IGMpIHNocmlua2VyIGluc3RhbmNlIGVtYmVkZGVkIGluIG90
aGVyIHN0cnVjdHVyZXMuCj4+Cj4+IEZvciBjYXNlIGEsIHRoZSBtZW1vcnkgb2Ygc2hyaW5rZXIg
aW5zdGFuY2UgaXMgbmV2ZXIgZnJlZWQuIEZvciBjYXNlIGIsCj4+IHRoZSBtZW1vcnkgb2Ygc2hy
aW5rZXIgaW5zdGFuY2Ugd2lsbCBiZSBmcmVlZCBhZnRlciBzeW5jaHJvbml6ZV9yY3UoKSAKPj4g
d2hlbgo+PiB0aGUgbW9kdWxlIGlzIHVubG9hZGVkLiBGb3IgY2FzZSBjLCB0aGUgbWVtb3J5IG9m
IHNocmlua2VyIGluc3RhbmNlIHdpbGwKPj4gYmUgZnJlZWQgYWxvbmcgd2l0aCB0aGUgc3RydWN0
dXJlIGl0IGlzIGVtYmVkZGVkIGluLgo+Pgo+PiBJbiBwcmVwYXJhdGlvbiBmb3IgaW1wbGVtZW50
aW5nIGxvY2tsZXNzIHNsYWIgc2hyaW5rLCB3ZSBuZWVkIHRvCj4+IGR5bmFtaWNhbGx5IGFsbG9j
YXRlIHRob3NlIHNocmlua2VyIGluc3RhbmNlcyBpbiBjYXNlIGMsIHRoZW4gdGhlIG1lbW9yeQo+
PiBjYW4gYmUgZHluYW1pY2FsbHkgZnJlZWQgYWxvbmUgYnkgY2FsbGluZyBrZnJlZV9yY3UoKS4K
Pj4KPj4gU28gdGhpcyBjb21taXQgYWRkcyB0aGUgZm9sbG93aW5nIG5ldyBBUElzIGZvciBkeW5h
bWljYWxseSBhbGxvY2F0aW5nCj4+IHNocmlua2VyLCBhbmQgYWRkIGEgcHJpdmF0ZV9kYXRhIGZp
ZWxkIHRvIHN0cnVjdCBzaHJpbmtlciB0byByZWNvcmQgYW5kCj4+IGdldCB0aGUgb3JpZ2luYWwg
ZW1iZWRkZWQgc3RydWN0dXJlLgo+Pgo+PiAxLiBzaHJpbmtlcl9hbGxvYygpCj4+Cj4+IFVzZWQg
dG8gYWxsb2NhdGUgc2hyaW5rZXIgaW5zdGFuY2UgaXRzZWxmIGFuZCByZWxhdGVkIG1lbW9yeSwg
aXQgd2lsbAo+PiByZXR1cm4gYSBwb2ludGVyIHRvIHRoZSBzaHJpbmtlciBpbnN0YW5jZSBvbiBz
dWNjZXNzIGFuZCBOVUxMIG9uIGZhaWx1cmUuCj4+Cj4+IDIuIHNocmlua2VyX2ZyZWVfbm9uX3Jl
Z2lzdGVyZWQoKQo+Pgo+PiBVc2VkIHRvIGRlc3Ryb3kgdGhlIG5vbi1yZWdpc3RlcmVkIHNocmlu
a2VyIGluc3RhbmNlLgo+IAo+IEF0IGxlYXN0IEkgZG9uJ3QgbGlrZSB0aGlzIG5hbWUuIEkga25v
dyB5b3Ugd2FudCB0byB0ZWxsIG90aGVycwo+IHRoaXMgZnVuY3Rpb24gb25seSBzaG91bGQgYmUg
Y2FsbGVkIHdoZW4gc2hyaW5rZXIgaGFzIG5vdCBiZWVuCj4gcmVnaXN0ZWQgYnV0IGFsbG9jYXRl
ZC4gTWF5YmUgc2hyaW5rZXJfZnJlZSgpIGlzIG1vcmUgc2ltcGxlLgo+IEFuZCBhbmQgYSBjb21t
ZW50IHRvIHRlbGwgdGhlIHVzZXJzIHdoZW4gdG8gdXNlIGl0LgoKT0ssIGlmIG5vIG9uZSBlbHNl
IG9iamVjdHMsIEkgd2lsbCBjaGFuZ2UgaXQgdG8gc2hyaW5rZXJfZnJlZSgpIGluCnRoZSBuZXh0
IHZlcnNpb24uCgo+IAo+Pgo+PiAzLiBzaHJpbmtlcl9yZWdpc3RlcigpCj4+Cj4+IFVzZWQgdG8g
cmVnaXN0ZXIgdGhlIHNocmlua2VyIGluc3RhbmNlLCB3aGljaCBpcyBzYW1lIGFzIHRoZSBjdXJy
ZW50Cj4+IHJlZ2lzdGVyX3Nocmlua2VyX3ByZXBhcmVkKCkuCj4+Cj4+IDQuIHNocmlua2VyX3Vu
cmVnaXN0ZXIoKQo+Pgo+PiBVc2VkIHRvIHVucmVnaXN0ZXIgYW5kIGZyZWUgdGhlIHNocmlua2Vy
IGluc3RhbmNlLgo+Pgo+PiBJbiBvcmRlciB0byBzaW1wbGlmeSBzaHJpbmtlci1yZWxhdGVkIEFQ
SXMgYW5kIG1ha2Ugc2hyaW5rZXIgbW9yZQo+PiBpbmRlcGVuZGVudCBvZiBvdGhlciBrZXJuZWwg
bWVjaGFuaXNtcywgc3Vic2VxdWVudCBzdWJtaXNzaW9ucyB3aWxsIHVzZQo+PiB0aGUgYWJvdmUg
QVBJIHRvIGNvbnZlcnQgYWxsIHNocmlua2VycyAoaW5jbHVkaW5nIGNhc2UgYSBhbmQgYikgdG8K
Pj4gZHluYW1pY2FsbHkgYWxsb2NhdGVkLCBhbmQgdGhlbiByZW1vdmUgYWxsIGV4aXN0aW5nIEFQ
SXMuCj4+Cj4+IFRoaXMgd2lsbCBhbHNvIGhhdmUgYW5vdGhlciBhZHZhbnRhZ2UgbWVudGlvbmVk
IGJ5IERhdmUgQ2hpbm5lcjoKPj4KPj4gYGBgCj4+IFRoZSBvdGhlciBhZHZhbnRhZ2Ugb2YgdGhp
cyBpcyB0aGF0IGl0IHdpbGwgYnJlYWsgYWxsIHRoZSBleGlzdGluZwo+PiBvdXQgb2YgdHJlZSBj
b2RlIGFuZCB0aGlyZCBwYXJ0eSBtb2R1bGVzIHVzaW5nIHRoZSBvbGQgQVBJIGFuZCB3aWxsCj4+
IG5vIGxvbmdlciB3b3JrIHdpdGggYSBrZXJuZWwgdXNpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmtl
cnMuIFRoZXkKPj4gbmVlZCB0byBicmVhayAoYm90aCBhdCB0aGUgc291cmNlIGFuZCBiaW5hcnkg
bGV2ZWxzKSB0byBzdG9wIGJhZAo+PiB0aGluZ3MgZnJvbSBoYXBwZW5pbmcgZHVlIHRvIHVzaW5n
IHVuY292ZXJ0ZWQgc2hyaW5rZXJzIGluIHRoZSBuZXcKPj4gc2V0dXAuCj4+IGBgYAo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+IC0t
LQo+PiDCoCBpbmNsdWRlL2xpbnV4L3Nocmlua2VyLmggfMKgwqAgNiArKysKPj4gwqAgbW0vc2hy
aW5rZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMTMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2hyaW5rZXIuaCBiL2luY2x1ZGUv
bGludXgvc2hyaW5rZXIuaAo+PiBpbmRleCA5NjFjYjg0ZTUxZjUuLjI5NmY1ZTE2Mzg2MSAxMDA2
NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9zaHJpbmtlci5oCj4+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvc2hyaW5rZXIuaAo+PiBAQCAtNzAsNiArNzAsOCBAQCBzdHJ1Y3Qgc2hyaW5rZXIgewo+PiDC
oMKgwqDCoMKgIGludCBzZWVrczvCoMKgwqAgLyogc2Vla3MgdG8gcmVjcmVhdGUgYW4gb2JqICov
Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgZmxhZ3M7Cj4+ICvCoMKgwqAgdm9pZCAqcHJpdmF0ZV9k
YXRhOwo+PiArCj4+IMKgwqDCoMKgwqAgLyogVGhlc2UgYXJlIGZvciBpbnRlcm5hbCB1c2UgKi8K
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4+IMKgICNpZmRlZiBDT05GSUdf
TUVNQ0cKPj4gQEAgLTk4LDYgKzEwMCwxMCBAQCBzdHJ1Y3Qgc2hyaW5rZXIgewo+PiDCoCB1bnNp
Z25lZCBsb25nIHNocmlua19zbGFiKGdmcF90IGdmcF9tYXNrLCBpbnQgbmlkLCBzdHJ1Y3QgbWVt
X2Nncm91cCAKPj4gKm1lbWNnLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
IHByaW9yaXR5KTsKPj4gK3N0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXJfYWxsb2ModW5zaWduZWQg
aW50IGZsYWdzLCBjb25zdCBjaGFyICpmbXQsIAo+PiAuLi4pOwo+PiArdm9pZCBzaHJpbmtlcl9m
cmVlX25vbl9yZWdpc3RlcmVkKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpOwo+PiArdm9pZCBz
aHJpbmtlcl9yZWdpc3RlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPj4gK3ZvaWQgc2hy
aW5rZXJfdW5yZWdpc3RlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPj4gwqAgZXh0ZXJu
IGludCBfX3ByaW50ZigyLCAzKSBwcmVhbGxvY19zaHJpbmtlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNo
cmlua2VyLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb25zdCBjaGFyICpmbXQsIC4uLik7Cj4+IGRpZmYgLS1naXQgYS9tbS9zaHJpbmtlci5j
IGIvbW0vc2hyaW5rZXIuYwo+PiBpbmRleCAwYTMyZWY0MmYyYTcuLmQ4MjBlNGNjNTgwNiAxMDA2
NDQKPj4gLS0tIGEvbW0vc2hyaW5rZXIuYwo+PiArKysgYi9tbS9zaHJpbmtlci5jCj4+IEBAIC01
NDgsNiArNTQ4LDExOSBAQCB1bnNpZ25lZCBsb25nIHNocmlua19zbGFiKGdmcF90IGdmcF9tYXNr
LCBpbnQgCj4+IG5pZCwgc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLAo+PiDCoMKgwqDCoMKgIHJl
dHVybiBmcmVlZDsKPj4gwqAgfQo+PiArc3RydWN0IHNocmlua2VyICpzaHJpbmtlcl9hbGxvYyh1
bnNpZ25lZCBpbnQgZmxhZ3MsIGNvbnN0IGNoYXIgKmZtdCwgCj4+IC4uLikKPj4gK3sKPj4gK8Kg
wqDCoCBzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyOwo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBz
aXplOwo+PiArwqDCoMKgIHZhX2xpc3QgX19tYXliZV91bnVzZWQgYXA7Cj4+ICvCoMKgwqAgaW50
IGVycjsKPj4gKwo+PiArwqDCoMKgIHNocmlua2VyID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHNo
cmlua2VyKSwgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFzaHJpbmtlcikKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBOVUxMOwo+PiArCj4+ICsjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RF
QlVHCj4+ICvCoMKgwqAgdmFfc3RhcnQoYXAsIGZtdCk7Cj4+ICvCoMKgwqAgc2hyaW5rZXItPm5h
bWUgPSBrdmFzcHJpbnRmX2NvbnN0KEdGUF9LRVJORUwsIGZtdCwgYXApOwo+PiArwqDCoMKgIHZh
X2VuZChhcCk7Cj4+ICvCoMKgwqAgaWYgKCFzaHJpbmtlci0+bmFtZSkKPj4gK8KgwqDCoMKgwqDC
oMKgIGdvdG8gZXJyX25hbWU7Cj4+ICsjZW5kaWYKPiAKPiBTbyB3aHkgbm90IGludHJvZHVjZSBh
bm90aGVyIGhlbHBlciB0byBoYW5kbGUgdGhpcyBhbmQgZGVjbGFyZSBpdAo+IGFzIGEgdm9pZCBm
dW5jdGlvbiB3aGVuICFDT05GSUdfU0hSSU5LRVJfREVCVUc/IFNvbWV0aGluZyBsaWtlIHRoZQo+
IGZvbGxvd2luZzoKPiAKPiAjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RFQlVHCj4gc3RhdGljIGlu
dCBzaHJpbmtlcl9kZWJ1Z2ZzX25hbWVfYWxsb2Moc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwg
Y29uc3QgCj4gY2hhciAqZm10LAo+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIMKgwqDCoMKgIHZhX2xpc3QgdmFyZ3MpCj4gCj4gewo+
ICDCoMKgwqAgc2hyaW5rZXItPm5hbWUgPSBrdmFzcHJpbnRmX2NvbnN0KEdGUF9LRVJORUwsIGZt
dCwgdmFyZ3MpOwo+ICDCoMKgwqAgcmV0dXJuIHNocmlua2VyLT5uYW1lID8gMCA6IC1FTk9NRU07
Cj4gfQo+ICNlbHNlCj4gc3RhdGljIGludCBzaHJpbmtlcl9kZWJ1Z2ZzX25hbWVfYWxsb2Moc3Ry
dWN0IHNocmlua2VyICpzaHJpbmtlciwgY29uc3QgCj4gY2hhciAqZm10LAo+ICDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIMKgwqDCoMKg
IHZhX2xpc3QgdmFyZ3MpCj4gewo+ICDCoMKgwqAgcmV0dXJuIDA7Cj4gfQo+ICNlbmRpZgoKV2ls
bCBkbyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiAKPj4gK8KgwqDCoCBzaHJpbmtlci0+ZmxhZ3Mg
PSBmbGFnczsKPj4gKwo+PiArwqDCoMKgIGlmIChmbGFncyAmIFNIUklOS0VSX01FTUNHX0FXQVJF
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSBwcmVhbGxvY19tZW1jZ19zaHJpbmtlcihzaHJp
bmtlcik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyID09IC1FTk9TWVMpCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNocmlua2VyLT5mbGFncyAmPSB+U0hSSU5LRVJfTUVNQ0dfQVdBUkU7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChlcnIgPT0gMCkKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBkb25lOwo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycl9mbGFnczsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDC
oCAvKgo+PiArwqDCoMKgwqAgKiBUaGUgbnJfZGVmZXJyZWQgaXMgYXZhaWxhYmxlIG9uIHBlciBt
ZW1jZyBsZXZlbCBmb3IgbWVtY2cgYXdhcmUKPj4gK8KgwqDCoMKgICogc2hyaW5rZXJzLCBzbyBv
bmx5IGFsbG9jYXRlIG5yX2RlZmVycmVkIGluIHRoZSBmb2xsb3dpbmcgY2FzZXM6Cj4+ICvCoMKg
wqDCoCAqwqAgLSBub24gbWVtY2cgYXdhcmUgc2hyaW5rZXJzCj4+ICvCoMKgwqDCoCAqwqAgLSAh
Q09ORklHX01FTUNHCj4+ICvCoMKgwqDCoCAqwqAgLSBtZW1jZyBpcyBkaXNhYmxlZCBieSBrZXJu
ZWwgY29tbWFuZCBsaW5lCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIHNpemUgPSBzaXplb2Yo
KnNocmlua2VyLT5ucl9kZWZlcnJlZCk7Cj4+ICvCoMKgwqAgaWYgKGZsYWdzICYgU0hSSU5LRVJf
TlVNQV9BV0FSRSkKPj4gK8KgwqDCoMKgwqDCoMKgIHNpemUgKj0gbnJfbm9kZV9pZHM7Cj4+ICsK
Pj4gK8KgwqDCoCBzaHJpbmtlci0+bnJfZGVmZXJyZWQgPSBremFsbG9jKHNpemUsIEdGUF9LRVJO
RUwpOwo+PiArwqDCoMKgIGlmICghc2hyaW5rZXItPm5yX2RlZmVycmVkKQo+PiArwqDCoMKgwqDC
oMKgwqAgZ290byBlcnJfZmxhZ3M7Cj4+ICsKPj4gK2RvbmU6Cj4+ICvCoMKgwqAgcmV0dXJuIHNo
cmlua2VyOwo+PiArCj4+ICtlcnJfZmxhZ3M6Cj4+ICsjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RF
QlVHCj4+ICvCoMKgwqAga2ZyZWVfY29uc3Qoc2hyaW5rZXItPm5hbWUpOwo+PiArwqDCoMKgIHNo
cmlua2VyLT5uYW1lID0gTlVMTDsKPiAKPiBUaGlzIGNvdWxkIGJlIHNocmlua2VyX2RlYnVnZnNf
bmFtZV9mcmVlKCkKCldpbGwgZG8uCgo+IAo+PiArZXJyX25hbWU6Cj4+ICsjZW5kaWYKPj4gK8Kg
wqDCoCBrZnJlZShzaHJpbmtlcik7Cj4+ICvCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+ICt9Cj4+ICtF
WFBPUlRfU1lNQk9MKHNocmlua2VyX2FsbG9jKTsKPj4gKwo+PiArdm9pZCBzaHJpbmtlcl9mcmVl
X25vbl9yZWdpc3RlcmVkKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpCj4+ICt7Cj4+ICsjaWZk
ZWYgQ09ORklHX1NIUklOS0VSX0RFQlVHCj4+ICvCoMKgwqAga2ZyZWVfY29uc3Qoc2hyaW5rZXIt
Pm5hbWUpOwo+PiArwqDCoMKgIHNocmlua2VyLT5uYW1lID0gTlVMTDsKPiAKPiBUaGlzIGNvdWxk
IGJlIHNocmlua2VyX2RlYnVnZnNfbmFtZV9mcmVlKCkKPiAKPj4gKyNlbmRpZgo+PiArwqDCoMKg
IGlmIChzaHJpbmtlci0+ZmxhZ3MgJiBTSFJJTktFUl9NRU1DR19BV0FSRSkgewo+PiArwqDCoMKg
wqDCoMKgwqAgZG93bl93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+PiArwqDCoMKgwqDCoMKgwqAg
dW5yZWdpc3Rlcl9tZW1jZ19zaHJpbmtlcihzaHJpbmtlcik7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1
cF93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGtm
cmVlKHNocmlua2VyLT5ucl9kZWZlcnJlZCk7Cj4+ICvCoMKgwqAgc2hyaW5rZXItPm5yX2RlZmVy
cmVkID0gTlVMTDsKPj4gKwo+PiArwqDCoMKgIGtmcmVlKHNocmlua2VyKTsKPj4gK30KPj4gK0VY
UE9SVF9TWU1CT0woc2hyaW5rZXJfZnJlZV9ub25fcmVnaXN0ZXJlZCk7Cj4+ICsKPj4gK3ZvaWQg
c2hyaW5rZXJfcmVnaXN0ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKPj4gK3sKPj4gK8Kg
wqDCoCBkb3duX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4+ICvCoMKgwqAgbGlzdF9hZGRfdGFp
bCgmc2hyaW5rZXItPmxpc3QsICZzaHJpbmtlcl9saXN0KTsKPj4gK8KgwqDCoCBzaHJpbmtlci0+
ZmxhZ3MgfD0gU0hSSU5LRVJfUkVHSVNURVJFRDsKPj4gK8KgwqDCoCBzaHJpbmtlcl9kZWJ1Z2Zz
X2FkZChzaHJpbmtlcik7Cj4+ICvCoMKgwqAgdXBfd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPj4g
K30KPj4gK0VYUE9SVF9TWU1CT0woc2hyaW5rZXJfcmVnaXN0ZXIpOwo+PiArCj4+ICt2b2lkIHNo
cmlua2VyX3VucmVnaXN0ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKPiAKPiBZb3UgaGF2
ZSBtYWRlIGFsbCBzaHJpbmtlcnMgdG8gYmUgZHluYW1pY2FsbHkgYWxsb2NhdGVkLCBzbwo+IHdl
IHNob3VsZCBwcmV2ZW50IHVzZXJzIGZyb20gYWxsb2NhdGluZyBzaHJpbmtlcnMgc3RhdGljYWxs
eSBhbmQKPiB1c2UgdGhpcyBmdW5jdGlvbiB0byB1bnJlZ2lzdGVyIGl0LiBJdCBpcyBiZXR0ZXIg
dG8gYWRkIGEKPiBmbGFnIGxpa2UgU0hSSU5LRVJfQUxMT0NBVEVEIHdoaWNoIGlzIHNldCBpbiBz
aHJpbmtlcl9hbGxvYygpLAo+IGFuZCBjaGVjayB3aGV0aGVyIGl0IGlzIHNldCBpbiBzaHJpbmtl
cl91bnJlZ2lzdGVyKCksIGlmIG5vdAo+IG1heWJlIGEgd2FybmluZyBzaG91bGQgYmUgYWRkZWQg
dG8gdGVsbCB0aGUgdXNlcnMgd2hhdCBoYXBwZW5lZC4KCk1ha2Ugc2Vuc2UsIHdpbGwgZG8uCgo+
IAo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfZW50cnk7Cj4+ICvCoMKg
wqAgaW50IGRlYnVnZnNfaWQ7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIXNocmlua2VyIHx8ICEoc2hy
aW5rZXItPmZsYWdzICYgU0hSSU5LRVJfUkVHSVNURVJFRCkpCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47Cj4+ICsKPj4gK8KgwqDCoCBkb3duX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4+ICvC
oMKgwqAgbGlzdF9kZWwoJnNocmlua2VyLT5saXN0KTsKPj4gK8KgwqDCoCBzaHJpbmtlci0+Zmxh
Z3MgJj0gflNIUklOS0VSX1JFR0lTVEVSRUQ7Cj4+ICvCoMKgwqAgaWYgKHNocmlua2VyLT5mbGFn
cyAmIFNIUklOS0VSX01FTUNHX0FXQVJFKQo+PiArwqDCoMKgwqDCoMKgwqAgdW5yZWdpc3Rlcl9t
ZW1jZ19zaHJpbmtlcihzaHJpbmtlcik7Cj4+ICvCoMKgwqAgZGVidWdmc19lbnRyeSA9IHNocmlu
a2VyX2RlYnVnZnNfZGV0YWNoKHNocmlua2VyLCAmZGVidWdmc19pZCk7Cj4gCj4gSW4gdGhlIGlu
dGVybmFsIG9mIHRoaXMgZnVuY3Rpb24sIHlvdSBhbHNvIGNvdWxkIHVzZQo+IHNocmlua2VyX2Rl
YnVnZnNfbmFtZV9mcmVlKCkuCgpZZWFoLCB3aWxsIGRvLgoKVGhhbmtzLApRaQoKPiAKPiBUaGFu
a3MuCj4gCj4+ICvCoMKgwqAgdXBfd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPj4gKwo+PiArwqDC
oMKgIHNocmlua2VyX2RlYnVnZnNfcmVtb3ZlKGRlYnVnZnNfZW50cnksIGRlYnVnZnNfaWQpOwo+
PiArCj4+ICvCoMKgwqAga2ZyZWUoc2hyaW5rZXItPm5yX2RlZmVycmVkKTsKPj4gK8KgwqDCoCBz
aHJpbmtlci0+bnJfZGVmZXJyZWQgPSBOVUxMOwo+PiArCj4+ICvCoMKgwqAga2ZyZWUoc2hyaW5r
ZXIpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTChzaHJpbmtlcl91bnJlZ2lzdGVyKTsKPj4gKwo+
PiDCoCAvKgo+PiDCoMKgICogQWRkIGEgc2hyaW5rZXIgY2FsbGJhY2sgdG8gYmUgY2FsbGVkIGZy
b20gdGhlIHZtLgo+PiDCoMKgICovCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
