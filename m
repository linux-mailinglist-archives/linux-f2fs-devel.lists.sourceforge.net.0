Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D81763252
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 11:34:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOau5-00007P-FW;
	Wed, 26 Jul 2023 09:33:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOau3-00007G-Vc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=; b=Qz8K+dJJppgALHZvwpQbJ49h/7
 9F/GUEXnBJ16+ljF0Ru+fLjtDlz0IT59vn5NVXq0/lV6bZugNOigTRKUVaJKTzj0ScaYYHwqjhS3s
 gI5NB8gbe2qya877S8j2Qn29UWVI2JppiVi1Czzd/Li8Fsfj69pLz+hVTdyITDHbjraU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=; b=NlhHrjFc0ve23afawKpXlqdhLD
 QBM7eTqK+UP4VFg7qpRyiX2AXDKmhEFYwsSaUw7Hy85gP/fIHhM0jWFkd7fCPI1z5Z0zezxYJtUsR
 Y8YEFNZfpaGgYA3r7QxbPMGinIVSO+sNI53x5yj3WwaK7YcQKoSsxNKArtlhzmjpniiQ=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOau3-002tYq-Kq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:33:56 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso1487402b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690364030; x=1690968830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
 b=QJhhRpaTfMAfucHkCz2d9TS31hpYk30s2kQKv681O+Sl1mLTZQhZq5VKb4l9mXe+gX
 5Eax6ixoNcCSNY9H6aAkwgnBd/g9cM9X43ylT+UhHbYekfmlgjo/JXqlix6WaCFQ7jVV
 2D4QfnYhGItzA17GFTgozRmivkdC7H5IwsXEWhmkOBzQK5UpXhnT6Ls+I4I3tsoeozxU
 24KbqK2Cq3sIWZ8RaqWYBiX9Q9627K0AND5qR2t9+dtM8IjHsDiCPK6lh5ggLgTON/bP
 sMZVbirBGOz1XlXtXsxmGmw+9U7+KmVQpZdmOnau0hPanAHKCfZx0jR+DbnWSE4a/7ep
 yq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690364030; x=1690968830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
 b=iZW9Qo4E4LJByutBKwvQlKyiPuncqkX2mlvn3WQq72fKgkrTpz91weK6/Vvw5AZ+vn
 gKFKLfLEwbTRUJ08uYRJ5HbIqgLkUYIMGef1/XuRzUmpUZLAtptDr8p0/Akyr8ROxBoX
 DS7ZSvZmIMMRlxuQpfLxjHbt/N+kV5OMk868HjMN66c6heBE+ipGlF/fr3oSAS53TOpK
 N9F1+REE68sm+MLpQUsrmGj3ntinA/gzw8VOTRahgwU649/UT4jABGlKICG8bmz/mMGH
 hp+REW8Im4bDGM/9EXcWHkTvA5uVV43IqfUGshJ7cin4f39pt1U/8Ptg3XuozVyX3Z1z
 tPsw==
X-Gm-Message-State: ABy/qLYt7yRwOSdB8jb+zuMR5A6iqo7lLKMbzZsQvuDd3yz9Lj3e6zjS
 KIJJO3TSZao8UYlOq7Q4okB2fQ==
X-Google-Smtp-Source: APBJJlG8LKe8O0SB++JE7Hsj6dMankp6b2TdGG8KZmgQCX7ZvwrXNm6kysx08G1J6PXDjDRRJyafNA==
X-Received: by 2002:a17:903:32c9:b0:1b8:5827:8763 with SMTP id
 i9-20020a17090332c900b001b858278763mr2037984plr.4.1690364030014; 
 Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902d2c500b001b89466a5f4sm12582766plc.105.2023.07.26.02.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:33:49 -0700 (PDT)
Message-ID: <0f12022e-5dd2-fb1c-f018-05f8ff0303ae@bytedance.com>
Date: Wed, 26 Jul 2023 17:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-29-zhengqi.arch@bytedance.com>
 <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
In-Reply-To: <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/26 15:32, Muchun Song wrote: > > > On 2023/7/24
 17:43, Qi Zheng wrote: >> In preparation for implementing lockless slab shrink,
 use new APIs to >> dynamically allocate the md-bcache shrinker [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOau3-002tYq-Kq
Subject: Re: [f2fs-dev] [PATCH v2 28/47] bcache: dynamically allocate the
 md-bcache shrinker
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

CgpPbiAyMDIzLzcvMjYgMTU6MzIsIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIGZvciBpbXBsZW1l
bnRpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmssIHVzZSBuZXcgQVBJcyB0bwo+PiBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgbWQtYmNhY2hlIHNocmlua2VyLCBzbyB0aGF0IGl0IGNhbiBiZSBmcmVl
ZAo+PiBhc3luY2hyb25vdXNseSB1c2luZyBrZnJlZV9yY3UoKS4gVGhlbiBpdCBkb2Vzbid0IG5l
ZWQgdG8gd2FpdCBmb3IgUkNVCj4+IHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0aW9uIHdoZW4gcmVs
ZWFzaW5nIHRoZSBzdHJ1Y3QgY2FjaGVfc2V0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVu
ZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL21kL2Jj
YWNoZS9iY2FjaGUuaCB8wqAgMiArLQo+PiDCoCBkcml2ZXJzL21kL2JjYWNoZS9idHJlZS5jwqAg
fCAyNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPj4gwqAgZHJpdmVycy9tZC9iY2FjaGUv
c3lzZnMuY8KgIHzCoCAzICsrLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDEzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9iY2FjaGUv
YmNhY2hlLmggYi9kcml2ZXJzL21kL2JjYWNoZS9iY2FjaGUuaAo+PiBpbmRleCA1YTc5YmIzYzI3
MmYuLmM2MjJiYzUwZjgxYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZC9iY2FjaGUvYmNhY2hl
LmgKPj4gKysrIGIvZHJpdmVycy9tZC9iY2FjaGUvYmNhY2hlLmgKPj4gQEAgLTU0MSw3ICs1NDEs
NyBAQCBzdHJ1Y3QgY2FjaGVfc2V0IHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYmlvX3NldMKgwqDC
oMKgwqDCoMKgIGJpb19zcGxpdDsKPj4gwqDCoMKgwqDCoCAvKiBGb3IgdGhlIGJ0cmVlIGNhY2hl
ICovCj4+IC3CoMKgwqAgc3RydWN0IHNocmlua2VywqDCoMKgwqDCoMKgwqAgc2hyaW5rOwo+PiAr
wqDCoMKgIHN0cnVjdCBzaHJpbmtlcsKgwqDCoMKgwqDCoMKgICpzaHJpbms7Cj4+IMKgwqDCoMKg
wqAgLyogRm9yIHRoZSBidHJlZSBjYWNoZSBhbmQgYW55dGhpbmcgYWxsb2NhdGlvbiByZWxhdGVk
ICovCj4+IMKgwqDCoMKgwqAgc3RydWN0IG11dGV4wqDCoMKgwqDCoMKgwqAgYnVja2V0X2xvY2s7
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2JjYWNoZS9idHJlZS5jIGIvZHJpdmVycy9tZC9i
Y2FjaGUvYnRyZWUuYwo+PiBpbmRleCBmZDEyMWE2MWYxN2MuLmMxNzZjN2ZjNzdkOSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9tZC9iY2FjaGUvYnRyZWUuYwo+PiArKysgYi9kcml2ZXJzL21kL2Jj
YWNoZS9idHJlZS5jCj4+IEBAIC02NjcsNyArNjY3LDcgQEAgc3RhdGljIGludCBtY2FfcmVhcChz
dHJ1Y3QgYnRyZWUgKmIsIHVuc2lnbmVkIGludCAKPj4gbWluX29yZGVyLCBib29sIGZsdXNoKQo+
PiDCoCBzdGF0aWMgdW5zaWduZWQgbG9uZyBiY2hfbWNhX3NjYW4oc3RydWN0IHNocmlua2VyICpz
aHJpbmssCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBz
aHJpbmtfY29udHJvbCAqc2MpCj4+IMKgIHsKPj4gLcKgwqDCoCBzdHJ1Y3QgY2FjaGVfc2V0ICpj
ID0gY29udGFpbmVyX29mKHNocmluaywgc3RydWN0IGNhY2hlX3NldCwgCj4+IHNocmluayk7Cj4+
ICvCoMKgwqAgc3RydWN0IGNhY2hlX3NldCAqYyA9IHNocmluay0+cHJpdmF0ZV9kYXRhOwo+PiDC
oMKgwqDCoMKgIHN0cnVjdCBidHJlZSAqYiwgKnQ7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9u
ZyBpLCBuciA9IHNjLT5ucl90b19zY2FuOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZnJl
ZWQgPSAwOwo+PiBAQCAtNzM0LDcgKzczNCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGJjaF9t
Y2Ffc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgCj4+ICpzaHJpbmssCj4+IMKgIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIGJjaF9tY2FfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmssCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNocmlua19jb250cm9sICpz
YykKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBjYWNoZV9zZXQgKmMgPSBjb250YWluZXJfb2Yo
c2hyaW5rLCBzdHJ1Y3QgY2FjaGVfc2V0LCAKPj4gc2hyaW5rKTsKPj4gK8KgwqDCoCBzdHJ1Y3Qg
Y2FjaGVfc2V0ICpjID0gc2hyaW5rLT5wcml2YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgaWYgKGMt
PnNocmlua2VyX2Rpc2FibGVkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IEBA
IC03NTIsOCArNzUyLDggQEAgdm9pZCBiY2hfYnRyZWVfY2FjaGVfZnJlZShzdHJ1Y3QgY2FjaGVf
c2V0ICpjKQo+PiDCoMKgwqDCoMKgIGNsb3N1cmVfaW5pdF9zdGFjaygmY2wpOwo+PiAtwqDCoMKg
IGlmIChjLT5zaHJpbmsubGlzdC5uZXh0KQo+PiAtwqDCoMKgwqDCoMKgwqAgdW5yZWdpc3Rlcl9z
aHJpbmtlcigmYy0+c2hyaW5rKTsKPj4gK8KgwqDCoCBpZiAoYy0+c2hyaW5rKQo+PiArwqDCoMKg
wqDCoMKgwqAgc2hyaW5rZXJfdW5yZWdpc3RlcihjLT5zaHJpbmspOwo+PiDCoMKgwqDCoMKgIG11
dGV4X2xvY2soJmMtPmJ1Y2tldF9sb2NrKTsKPj4gQEAgLTgyOCwxNCArODI4LDE5IEBAIGludCBi
Y2hfYnRyZWVfY2FjaGVfYWxsb2Moc3RydWN0IGNhY2hlX3NldCAqYykKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGMtPnZlcmlmeV9kYXRhID0gTlVMTDsKPj4gwqAgI2VuZGlmCj4+IC3CoMKgwqAgYy0+
c2hyaW5rLmNvdW50X29iamVjdHMgPSBiY2hfbWNhX2NvdW50Owo+PiAtwqDCoMKgIGMtPnNocmlu
ay5zY2FuX29iamVjdHMgPSBiY2hfbWNhX3NjYW47Cj4+IC3CoMKgwqAgYy0+c2hyaW5rLnNlZWtz
ID0gNDsKPj4gLcKgwqDCoCBjLT5zaHJpbmsuYmF0Y2ggPSBjLT5idHJlZV9wYWdlcyAqIDI7Cj4+
ICvCoMKgwqAgYy0+c2hyaW5rID0gc2hyaW5rZXJfYWxsb2MoMCwgIm1kLWJjYWNoZTolcFUiLCBj
LT5zZXRfdXVpZCk7Cj4+ICvCoMKgwqAgaWYgKCFjLT5zaHJpbmspIHsKPj4gK8KgwqDCoMKgwqDC
oMKgIHByX3dhcm4oImJjYWNoZTogJXM6IGNvdWxkIG5vdCBhbGxvY2F0ZSBzaHJpbmtlclxuIiwg
X19mdW5jX18pOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4gCj4gU2VlbXMg
eW91IGhhdmUgY2hlYW5nZWQgdGhlIHNlbWFudGljIG9mIHRoaXMuIEluIHRoZSBwYXN0LAo+IGl0
IGlzIGJldHRlciB0byBoYXZlIGEgc2hyaW5rZXIsIGJ1dCBub3cgaXQgYmVjb21lcyBhIG1hbmRh
dG9yeS4KPiBSaWdodD8gSSBkb24ndCBrbm93IGlmIGl0IGlzIGFjY2VwdGFibGUuIEZyb20gbXkg
cG9pbnQgb2YgdmlldywKPiBqdXN0IGRvIHRoZSBjbGVhbnVwLCBkb24ndCBjaGFuZ2UgYW55IGJl
aGF2aW91ci4KCk9oLCBzaG91bGQgcmV0dXJuIDAgaGVyZSwgd2lsbCBkby4KCj4gCj4+ICvCoMKg
wqAgfQo+PiArCj4+ICvCoMKgwqAgYy0+c2hyaW5rLT5jb3VudF9vYmplY3RzID0gYmNoX21jYV9j
b3VudDsKPj4gK8KgwqDCoCBjLT5zaHJpbmstPnNjYW5fb2JqZWN0cyA9IGJjaF9tY2Ffc2NhbjsK
Pj4gK8KgwqDCoCBjLT5zaHJpbmstPnNlZWtzID0gNDsKPj4gK8KgwqDCoCBjLT5zaHJpbmstPmJh
dGNoID0gYy0+YnRyZWVfcGFnZXMgKiAyOwo+PiArwqDCoMKgIGMtPnNocmluay0+cHJpdmF0ZV9k
YXRhID0gYzsKPj4gLcKgwqDCoCBpZiAocmVnaXN0ZXJfc2hyaW5rZXIoJmMtPnNocmluaywgIm1k
LWJjYWNoZTolcFUiLCBjLT5zZXRfdXVpZCkpCj4+IC3CoMKgwqDCoMKgwqDCoCBwcl93YXJuKCJi
Y2FjaGU6ICVzOiBjb3VsZCBub3QgcmVnaXN0ZXIgc2hyaW5rZXJcbiIsCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgX19mdW5jX18pOwo+PiArwqDCoMKgIHNocmlua2VyX3JlZ2lz
dGVyKGMtPnNocmluayk7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWQvYmNhY2hlL3N5c2ZzLmMgYi9kcml2ZXJzL21kL2JjYWNoZS9zeXNm
cy5jCj4+IGluZGV4IDBlMmMxODgwZjYwYi4uNDVkOGFmNzU1ZGU2IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL21kL2JjYWNoZS9zeXNmcy5jCj4+ICsrKyBiL2RyaXZlcnMvbWQvYmNhY2hlL3N5c2Zz
LmMKPj4gQEAgLTg2Niw3ICs4NjYsOCBAQCBTVE9SRShfX2JjaF9jYWNoZV9zZXQpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBzYy5nZnBfbWFzayA9IEdGUF9LRVJORUw7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBzYy5ucl90b19zY2FuID0gc3RydG91bF9vcl9yZXR1cm4oYnVmKTsKPj4gLcKgwqDCoMKg
wqDCoMKgIGMtPnNocmluay5zY2FuX29iamVjdHMoJmMtPnNocmluaywgJnNjKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChjLT5zaHJpbmspCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGMtPnNo
cmluay0+c2Nhbl9vYmplY3RzKGMtPnNocmluaywgJnNjKTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKg
wqDCoMKgwqAgc3lzZnNfc3RydG91bF9jbGFtcChjb25nZXN0ZWRfcmVhZF90aHJlc2hvbGRfdXMs
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
