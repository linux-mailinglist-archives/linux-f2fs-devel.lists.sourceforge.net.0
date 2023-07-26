Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7547631B6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 11:22:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOais-0000lN-OB;
	Wed, 26 Jul 2023 09:22:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOair-0000lH-AJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=; b=Xzy5+Dap4AauUWLEJDEq1WS3D/
 PSc/oyqYi16/ujJuidkpt6iovBmxZ52FxjcmTroZGoqT1qAEVSUS74BpR4lvj1Oawnn1BKeKaPZXE
 rlsLXzK5kuXu7KlLTGmtmOA/xBoF+nX89bcSkauNYkbEtR8eIdNP3+xMYOBbrtxYtgF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=; b=jyuxFnrnXnr78XTanK1+mD82cU
 IZ4XIqGj6yuoDLKbnz2bL8orOFE+t99bg6ZmuEH10W3LckGIrAKz3dY74XFb1qcG+jn7mwY6jJpI3
 HNGND82rC2EJA+PvKEcgg/KSokOlSGKX7iJc6LZeZ/SqMv1pH5BH+am+TAZH7kQavoIc=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOaiq-002t01-Ob for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:22:21 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so1487680b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363335; x=1690968135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
 b=jAMndxc3vAfZ9MlugwiN2m1td4+ENgo1ZcEkULNu4w0l2e+7SjL15Aj8xsnH/hg6mq
 Yuh7Pj+WIpy+9FKbmqcmIZPowwXwCsZ/HE/uYPa/USpf5RWRvsmKXdX1EOhGqDHtCRhA
 5Tx4ycmmPjyUjagwQ6weN00EPkG2yYEGVkFAeT+5NL38WWOxpIAWxDe7x+TtdzGSmFXw
 AaN6OIhFdWcuFQV9AajQEHTHNR/HQhAWIjBkgsz+1GmBQBDd2nNKfKbDgsLcpETIdF18
 CdbQtqtDxhcETBnzscklNfC8QDSVXvKpexDlKf4G6IIrjU6vkXpbe5y1T2yEBA/OqHN2
 vBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363335; x=1690968135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
 b=FauH82U0xPFu9jXWwuLy+2XG88IKCCu9GC+WqBGU/XdQnerJF4SAMquamhC9KfHywx
 Hnn+8Ovotj9S0w/Y+Hgf/8rIoYldJorOIFLvrZmflr4bW8GAbbvyrZxweAl41FRmUBLe
 ec9LbtYH0onEgPiW+JOhf3YaJofAhW9fnD3hcKWWQJ839cZLdylmkloQkpUiTug/vHXY
 WfbOU9rMeW43bM7pNWMYoUwKCdBLso865XisUHLzBNKjVxe0UCDIwI6yNqLNF4ta4KXU
 r4nFPT6+U2KHarTyimNT0GfzvSRWY/UdG9OewFdGUxcuyqIxVq8Mbj+UHCK21GZTIQtc
 bnFg==
X-Gm-Message-State: ABy/qLaxTs76jTBcnJthdIKCUFKeYGESksgkVyTIcaW8tAxfYClmEqeO
 6vW15hS8cFf/9RoCe7SYC9QpjQ==
X-Google-Smtp-Source: APBJJlGzKLkoeooTK7rnc1fJ6mfD6dUCrzzNETRC7Ci4c1Yh8zXhisYlXfajH5gn3qqQbLizO8XVQA==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id
 o26-20020a056a20729a00b00100b92be8bemr1779967pzk.2.1690363335131; 
 Wed, 26 Jul 2023 02:22:15 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 k11-20020aa790cb000000b006827c26f147sm10955045pfk.138.2023.07.26.02.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:22:14 -0700 (PDT)
Message-ID: <d96777ce-be8a-1665-dd00-1e696e5575a8@bytedance.com>
Date: Wed, 26 Jul 2023 17:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-12-zhengqi.arch@bytedance.com>
 <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
In-Reply-To: <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/26 14:49, Muchun Song wrote: > > > On 2023/7/24
 17:43, Qi Zheng wrote: >> Use new APIs to dynamically allocate the gfs2-qd
 shrinker. >> >> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com [...]
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
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
X-Headers-End: 1qOaiq-002t01-Ob
Subject: Re: [f2fs-dev] [PATCH v2 11/47] gfs2: dynamically allocate the
 gfs2-qd shrinker
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

CgpPbiAyMDIzLzcvMjYgMTQ6NDksIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgZ2ZzMi1xZCBzaHJpbmtlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUWkg
WmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgo+PiAtLS0KPj4gwqAgZnMvZ2ZzMi9t
YWluLmPCoCB8wqAgNiArKystLS0KPj4gwqAgZnMvZ2ZzMi9xdW90YS5jIHwgMjYgKysrKysrKysr
KysrKysrKysrKystLS0tLS0KPj4gwqAgZnMvZ2ZzMi9xdW90YS5oIHzCoCAzICsrLQo+PiDCoCAz
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZnMvZ2ZzMi9tYWluLmMgYi9mcy9nZnMyL21haW4uYwo+PiBpbmRleCBhZmNi
MzI4NTRmMTQuLmU0N2IxY2M3OWY1OSAxMDA2NDQKPj4gLS0tIGEvZnMvZ2ZzMi9tYWluLmMKPj4g
KysrIGIvZnMvZ2ZzMi9tYWluLmMKPj4gQEAgLTE0Nyw3ICsxNDcsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBpbml0X2dmczJfZnModm9pZCkKPj4gwqDCoMKgwqDCoCBpZiAoIWdmczJfdHJhbnNfY2Fj
aGVwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsX2NhY2hlcDg7Cj4+IC3CoMKgwqAg
ZXJyb3IgPSByZWdpc3Rlcl9zaHJpbmtlcigmZ2ZzMl9xZF9zaHJpbmtlciwgImdmczItcWQiKTsK
Pj4gK8KgwqDCoCBlcnJvciA9IGdmczJfcWRfc2hyaW5rZXJfaW5pdCgpOwo+PiDCoMKgwqDCoMKg
IGlmIChlcnJvcikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbF9zaHJpbmtlcjsKPj4g
QEAgLTE5Niw3ICsxOTYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbml0X2dmczJfZnModm9pZCkK
Pj4gwqAgZmFpbF93cTI6Cj4+IMKgwqDCoMKgwqAgZGVzdHJveV93b3JrcXVldWUoZ2ZzX3JlY292
ZXJ5X3dxKTsKPj4gwqAgZmFpbF93cTE6Cj4+IC3CoMKgwqAgdW5yZWdpc3Rlcl9zaHJpbmtlcigm
Z2ZzMl9xZF9zaHJpbmtlcik7Cj4+ICvCoMKgwqAgZ2ZzMl9xZF9zaHJpbmtlcl9leGl0KCk7Cj4+
IMKgIGZhaWxfc2hyaW5rZXI6Cj4+IMKgwqDCoMKgwqAga21lbV9jYWNoZV9kZXN0cm95KGdmczJf
dHJhbnNfY2FjaGVwKTsKPj4gwqAgZmFpbF9jYWNoZXA4Ogo+PiBAQCAtMjI5LDcgKzIyOSw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IGluaXRfZ2ZzMl9mcyh2b2lkKQo+PiDCoCBzdGF0aWMgdm9pZCBf
X2V4aXQgZXhpdF9nZnMyX2ZzKHZvaWQpCj4+IMKgIHsKPj4gLcKgwqDCoCB1bnJlZ2lzdGVyX3No
cmlua2VyKCZnZnMyX3FkX3Nocmlua2VyKTsKPj4gK8KgwqDCoCBnZnMyX3FkX3Nocmlua2VyX2V4
aXQoKTsKPj4gwqDCoMKgwqDCoCBnZnMyX2dsb2NrX2V4aXQoKTsKPj4gwqDCoMKgwqDCoCBnZnMy
X3VucmVnaXN0ZXJfZGVidWdmcygpOwo+PiDCoMKgwqDCoMKgIHVucmVnaXN0ZXJfZmlsZXN5c3Rl
bSgmZ2ZzMl9mc190eXBlKTsKPj4gZGlmZiAtLWdpdCBhL2ZzL2dmczIvcXVvdGEuYyBiL2ZzL2dm
czIvcXVvdGEuYwo+PiBpbmRleCA3MDQxOTJiNzM2MDUuLmJjOTg4M2NlYTg0NyAxMDA2NDQKPj4g
LS0tIGEvZnMvZ2ZzMi9xdW90YS5jCj4+ICsrKyBiL2ZzL2dmczIvcXVvdGEuYwo+PiBAQCAtMTg2
LDEzICsxODYsMjcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZ2ZzMl9xZF9zaHJpbmtfY291bnQo
c3RydWN0IAo+PiBzaHJpbmtlciAqc2hyaW5rLAo+PiDCoMKgwqDCoMKgIHJldHVybiB2ZnNfcHJl
c3N1cmVfcmF0aW8obGlzdF9scnVfc2hyaW5rX2NvdW50KCZnZnMyX3FkX2xydSwgc2MpKTsKPj4g
wqAgfQo+PiAtc3RydWN0IHNocmlua2VyIGdmczJfcWRfc2hyaW5rZXIgPSB7Cj4+IC3CoMKgwqAg
LmNvdW50X29iamVjdHMgPSBnZnMyX3FkX3Nocmlua19jb3VudCwKPj4gLcKgwqDCoCAuc2Nhbl9v
YmplY3RzID0gZ2ZzMl9xZF9zaHJpbmtfc2NhbiwKPj4gLcKgwqDCoCAuc2Vla3MgPSBERUZBVUxU
X1NFRUtTLAo+PiAtwqDCoMKgIC5mbGFncyA9IFNIUklOS0VSX05VTUFfQVdBUkUsCj4+IC19Owo+
PiArc3RhdGljIHN0cnVjdCBzaHJpbmtlciAqZ2ZzMl9xZF9zaHJpbmtlcjsKPj4gKwo+PiAraW50
IGdmczJfcWRfc2hyaW5rZXJfaW5pdCh2b2lkKQo+IAo+IEl0J3MgYmV0dGVyIHRvIGRlY2xhcmUg
dGhpcyBhcyBfX2luaXQuCgpPSywgV2lsbCBkby4KCj4gCj4+ICt7Cj4+ICvCoMKgwqAgZ2ZzMl9x
ZF9zaHJpbmtlciA9IHNocmlua2VyX2FsbG9jKFNIUklOS0VSX05VTUFfQVdBUkUsICJnZnMyLXFk
Iik7Cj4+ICvCoMKgwqAgaWYgKCFnZnMyX3FkX3Nocmlua2VyKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gK8KgwqDCoCBnZnMyX3FkX3Nocmlua2VyLT5jb3VudF9v
YmplY3RzID0gZ2ZzMl9xZF9zaHJpbmtfY291bnQ7Cj4+ICvCoMKgwqAgZ2ZzMl9xZF9zaHJpbmtl
ci0+c2Nhbl9vYmplY3RzID0gZ2ZzMl9xZF9zaHJpbmtfc2NhbjsKPj4gK8KgwqDCoCBnZnMyX3Fk
X3Nocmlua2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4+ICsKPj4gK8KgwqDCoCBzaHJpbmtl
cl9yZWdpc3RlcihnZnMyX3FkX3Nocmlua2VyKTsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30K
Pj4gKwo+PiArdm9pZCBnZnMyX3FkX3Nocmlua2VyX2V4aXQodm9pZCkKPj4gK3sKPj4gK8KgwqDC
oCBzaHJpbmtlcl91bnJlZ2lzdGVyKGdmczJfcWRfc2hyaW5rZXIpOwo+PiArfQo+PiDCoCBzdGF0
aWMgdTY0IHFkMmluZGV4KHN0cnVjdCBnZnMyX3F1b3RhX2RhdGEgKnFkKQo+PiDCoCB7Cj4+IGRp
ZmYgLS1naXQgYS9mcy9nZnMyL3F1b3RhLmggYi9mcy9nZnMyL3F1b3RhLmgKPj4gaW5kZXggMjFh
ZGEzMzJkNTU1Li5mOWNiODYzMzczZjcgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2dmczIvcXVvdGEuaAo+
PiArKysgYi9mcy9nZnMyL3F1b3RhLmgKPj4gQEAgLTU5LDcgKzU5LDggQEAgc3RhdGljIGlubGlu
ZSBpbnQgZ2ZzMl9xdW90YV9sb2NrX2NoZWNrKHN0cnVjdCAKPj4gZ2ZzMl9pbm9kZSAqaXAsCj4+
IMKgIH0KPj4gwqAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBxdW90YWN0bF9vcHMgZ2ZzMl9xdW90YWN0
bF9vcHM7Cj4+IC1leHRlcm4gc3RydWN0IHNocmlua2VyIGdmczJfcWRfc2hyaW5rZXI7Cj4+ICtp
bnQgZ2ZzMl9xZF9zaHJpbmtlcl9pbml0KHZvaWQpOwo+PiArdm9pZCBnZnMyX3FkX3Nocmlua2Vy
X2V4aXQodm9pZCk7Cj4+IMKgIGV4dGVybiBzdHJ1Y3QgbGlzdF9scnUgZ2ZzMl9xZF9scnU7Cj4+
IMKgIGV4dGVybiB2b2lkIF9faW5pdCBnZnMyX3F1b3RhX2hhc2hfaW5pdCh2b2lkKTsKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
