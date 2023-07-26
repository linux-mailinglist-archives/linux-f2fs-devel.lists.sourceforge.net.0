Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 009627631F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 11:28:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOaoS-0000rB-6m;
	Wed, 26 Jul 2023 09:28:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOaoR-0000r5-Kq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=; b=GZm7Nlh8DxUkmcZ+U2cgGg1O9j
 H8weuSJyCG5CW/O2pA3gpXPPuCZfUdmaB29nMjOx4kC3We4190fA1An3zsivSj7f6bQtU7ooaURAc
 n9rcjabAiTJoPyxcg/C7GgEszfMWSePCdupydpIO3/iJsunP20N5IYGK/Kxv5YDlQBmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=; b=PaOEZUQ33w3jvI7Xhm7vcaikx/
 pfmHZS7X2UbanxL3B6J9yxUeoMswm27L4K41u4zKe53uFYqdiNSPHyEw/x7R+hbmXOOApSy6c7db+
 O7EPRPNbeD679QLiqzQ/nuKAKhJAvJr19CdERwxuzU1HCDMCaPfnZ+u5ZqIV0QC22ySo=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOaoR-002tL4-0G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 09:28:07 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6864c144897so1488720b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363681; x=1690968481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
 b=VrX61tolI6lx5cf13TzjBUi7Jr7lyRI0PErux25Ugwzya6Gr7la8Z5mF2+cskv3TWz
 UBVd0Z5Poj3PRTux8odPv45l8gQzAXnTFOr3Tf8UDx7d9uUEKzN37AEVIKYy6agrhmgA
 YruSiWL83SB/lZ95d/ocS5Ez1ClN1w8sLcjpu26a2KNj8aWhEC89NaIXAD4IQeJcJzfH
 uYL7oLGt6F17I0XKTtTRSbeLX7ktBDSzYJstMwVG/599hz7kBf24kzbOMqBXrGbap2ZR
 iYE22Dihl4RYEd6b6MxzHd9sXrRhtrB75dhklT8m88pkRrstmkcW4eCpJX3cURQ8vJOi
 rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363681; x=1690968481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
 b=MVjA9TwlsmCRuBd+5DcNl7H9EUaahlgYx7/79O2JswTjw/gwvh8JuspBuTIBCbB5QK
 Q/iUK9EpmWkrgGVOV7eaCjnC+i4I4oqwdS/mqle7J8Q24gIM84bHTqqOI9fU/6wOE7uY
 4DyICtexAPO1L48DTqJzArVpb7//fbEOwKlHk4n9g/V3PU9SPpPy6/ni53ZVB0BYJ40o
 Kh2YoQYfQhTxaDuuxYkPgy80mTgxZF6wTSK7sjfR6Pm9RcLXA9Q2uwyGxKtZiOrlFE23
 CAM5C80x6HS6NXN0H1yjVygK1hsRUeIlyx4Mx7CUyhUDeIbWqy42u6jo6voSHwNsMxEO
 ZSnw==
X-Gm-Message-State: ABy/qLbWBPSCJ/1gGJP8Auadnr3xU1eVgGmNU0EOKPdLVGGV6neiK/V4
 z9Dkmek62zUuOpkidxpr0EUK1g==
X-Google-Smtp-Source: APBJJlFbGXVT1jvZWB8OqMMjwV1wWa8tPHrXXzsgQ/SF73jQ8jhDFJz/C4eSTJgkpJW81UF91auuJQ==
X-Received: by 2002:a05:6a20:3c90:b0:134:d4d3:f0a5 with SMTP id
 b16-20020a056a203c9000b00134d4d3f0a5mr1941746pzj.2.1690363681365; 
 Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 l73-20020a633e4c000000b00563da87a52dsm1901427pga.40.2023.07.26.02.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Message-ID: <665ccd89-8434-fc45-4813-c6412ef80c10@bytedance.com>
Date: Wed, 26 Jul 2023 17:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-20-zhengqi.arch@bytedance.com>
 <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
In-Reply-To: <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/26 15:10, Muchun Song wrote: > > > On 2023/7/24
 17:43, Qi Zheng wrote: >> Use new APIs to dynamically allocate the thp-zero
 and thp-deferred_split >> shrinkers. >> >> Signed-off-by: Qi Zheng [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
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
X-Headers-End: 1qOaoR-002tL4-0G
Subject: Re: [f2fs-dev] [PATCH v2 19/47] mm: thp: dynamically allocate the
 thp-related shrinkers
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

CgpPbiAyMDIzLzcvMjYgMTU6MTAsIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgdGhwLXplcm8gYW5kIHRocC1kZWZlcnJlZF9zcGxpdAo+PiBzaHJpbmtl
cnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNl
LmNvbT4KPj4gLS0tCj4+IMKgIG1tL2h1Z2VfbWVtb3J5LmMgfCA2OSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQ1
IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vaHVn
ZV9tZW1vcnkuYyBiL21tL2h1Z2VfbWVtb3J5LmMKPj4gaW5kZXggOGM5NGIzNDAyNGEyLi40ZGI1
YTE4MzRkODEgMTAwNjQ0Cj4+IC0tLSBhL21tL2h1Z2VfbWVtb3J5LmMKPj4gKysrIGIvbW0vaHVn
ZV9tZW1vcnkuYwo+PiBAQCAtNjUsNyArNjUsMTEgQEAgdW5zaWduZWQgbG9uZyB0cmFuc3BhcmVu
dF9odWdlcGFnZV9mbGFncyAKPj4gX19yZWFkX21vc3RseSA9Cj4+IMKgwqDCoMKgwqAgKDE8PFRS
QU5TUEFSRU5UX0hVR0VQQUdFX0RFRlJBR19LSFVHRVBBR0VEX0ZMQUcpfAo+PiDCoMKgwqDCoMKg
ICgxPDxUUkFOU1BBUkVOVF9IVUdFUEFHRV9VU0VfWkVST19QQUdFX0ZMQUcpOwo+PiAtc3RhdGlj
IHN0cnVjdCBzaHJpbmtlciBkZWZlcnJlZF9zcGxpdF9zaHJpbmtlcjsKPj4gK3N0YXRpYyBzdHJ1
Y3Qgc2hyaW5rZXIgKmRlZmVycmVkX3NwbGl0X3Nocmlua2VyOwo+PiArc3RhdGljIHVuc2lnbmVk
IGxvbmcgZGVmZXJyZWRfc3BsaXRfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmssCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNocmlua19j
b250cm9sICpzYyk7Cj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBkZWZlcnJlZF9zcGxpdF9zY2Fu
KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKTsKPj4gwqAgc3RhdGljIGF0
b21pY190IGh1Z2VfemVyb19yZWZjb3VudDsKPj4gwqAgc3RydWN0IHBhZ2UgKmh1Z2VfemVyb19w
YWdlIF9fcmVhZF9tb3N0bHk7Cj4+IEBAIC0yMjksMTEgKzIzMyw3IEBAIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIAo+PiBzaHJpbmtfaHVnZV96ZXJvX3BhZ2Vfc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgKnNo
cmluaywKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiAtc3RhdGljIHN0cnVjdCBz
aHJpbmtlciBodWdlX3plcm9fcGFnZV9zaHJpbmtlciA9IHsKPj4gLcKgwqDCoCAuY291bnRfb2Jq
ZWN0cyA9IHNocmlua19odWdlX3plcm9fcGFnZV9jb3VudCwKPj4gLcKgwqDCoCAuc2Nhbl9vYmpl
Y3RzID0gc2hyaW5rX2h1Z2VfemVyb19wYWdlX3NjYW4sCj4+IC3CoMKgwqAgLnNlZWtzID0gREVG
QVVMVF9TRUVLUywKPj4gLX07Cj4+ICtzdGF0aWMgc3RydWN0IHNocmlua2VyICpodWdlX3plcm9f
cGFnZV9zaHJpbmtlcjsKPiAKPiBTYW1lIGFzIHBhdGNoICMxNy4KCk9LLCB3aWxsIGRvLgoKPiAK
Pj4gwqAgI2lmZGVmIENPTkZJR19TWVNGUwo+PiDCoCBzdGF0aWMgc3NpemVfdCBlbmFibGVkX3No
b3coc3RydWN0IGtvYmplY3QgKmtvYmosCj4+IEBAIC00NTQsNiArNDU0LDQwIEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBodWdlcGFnZV9leGl0X3N5c2ZzKHN0cnVjdCAKPj4ga29iamVjdCAqaHVnZXBh
Z2Vfa29iaikKPj4gwqAgfQo+PiDCoCAjZW5kaWYgLyogQ09ORklHX1NZU0ZTICovCj4+ICtzdGF0
aWMgaW50IHRocF9zaHJpbmtlcl9pbml0KHZvaWQpCj4gCj4gQmV0dGVyIHRvIGRlY2xhcmUgaXQg
YXMgX19pbml0LgoKV2lsbCBkby4KCj4gCj4+ICt7Cj4+ICvCoMKgwqAgaHVnZV96ZXJvX3BhZ2Vf
c2hyaW5rZXIgPSBzaHJpbmtlcl9hbGxvYygwLCAidGhwLXplcm8iKTsKPj4gK8KgwqDCoCBpZiAo
IWh1Z2VfemVyb19wYWdlX3Nocmlua2VyKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9N
RU07Cj4+ICsKPj4gK8KgwqDCoCBkZWZlcnJlZF9zcGxpdF9zaHJpbmtlciA9IHNocmlua2VyX2Fs
bG9jKFNIUklOS0VSX05VTUFfQVdBUkUgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNIUklOS0VSX01FTUNHX0FXQVJFIHwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTSFJJTktFUl9OT05TTEFC
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ0
aHAtZGVmZXJyZWRfc3BsaXQiKTsKPj4gK8KgwqDCoCBpZiAoIWRlZmVycmVkX3NwbGl0X3Nocmlu
a2VyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzaHJpbmtlcl9mcmVlX25vbl9yZWdpc3RlcmVkKGh1
Z2VfemVyb19wYWdlX3Nocmlua2VyKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVN
Owo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGh1Z2VfemVyb19wYWdlX3Nocmlua2VyLT5j
b3VudF9vYmplY3RzID0gCj4+IHNocmlua19odWdlX3plcm9fcGFnZV9jb3VudDsKPj4gK8KgwqDC
oCBodWdlX3plcm9fcGFnZV9zaHJpbmtlci0+c2Nhbl9vYmplY3RzID0gc2hyaW5rX2h1Z2VfemVy
b19wYWdlX3NjYW47Cj4+ICvCoMKgwqAgaHVnZV96ZXJvX3BhZ2Vfc2hyaW5rZXItPnNlZWtzID0g
REVGQVVMVF9TRUVLUzsKPj4gK8KgwqDCoCBzaHJpbmtlcl9yZWdpc3RlcihodWdlX3plcm9fcGFn
ZV9zaHJpbmtlcik7Cj4+ICsKPj4gK8KgwqDCoCBkZWZlcnJlZF9zcGxpdF9zaHJpbmtlci0+Y291
bnRfb2JqZWN0cyA9IGRlZmVycmVkX3NwbGl0X2NvdW50Owo+PiArwqDCoMKgIGRlZmVycmVkX3Nw
bGl0X3Nocmlua2VyLT5zY2FuX29iamVjdHMgPSBkZWZlcnJlZF9zcGxpdF9zY2FuOwo+PiArwqDC
oMKgIGRlZmVycmVkX3NwbGl0X3Nocmlua2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4+ICvC
oMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoZGVmZXJyZWRfc3BsaXRfc2hyaW5rZXIpOwo+PiArCj4+
ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHRocF9zaHJpbmtl
cl9leGl0KHZvaWQpCj4gCj4gU2FtZSBhcyBoZXJlLgoKV2lsbCBkby4KCj4gCj4+ICt7Cj4+ICvC
oMKgwqAgc2hyaW5rZXJfdW5yZWdpc3RlcihodWdlX3plcm9fcGFnZV9zaHJpbmtlcik7Cj4+ICvC
oMKgwqAgc2hyaW5rZXJfdW5yZWdpc3RlcihkZWZlcnJlZF9zcGxpdF9zaHJpbmtlcik7Cj4+ICt9
Cj4+ICsKPj4gwqAgc3RhdGljIGludCBfX2luaXQgaHVnZXBhZ2VfaW5pdCh2b2lkKQo+PiDCoCB7
Cj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4gQEAgLTQ4MiwxMiArNTE2LDkgQEAgc3RhdGljIGlu
dCBfX2luaXQgaHVnZXBhZ2VfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKgIGlmIChlcnIpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9zbGFiOwo+PiAtwqDCoMKgIGVyciA9IHJlZ2lzdGVy
X3Nocmlua2VyKCZodWdlX3plcm9fcGFnZV9zaHJpbmtlciwgInRocC16ZXJvIik7Cj4+IC3CoMKg
wqAgaWYgKGVycikKPj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2h6cF9zaHJpbmtlcjsKPj4g
LcKgwqDCoCBlcnIgPSByZWdpc3Rlcl9zaHJpbmtlcigmZGVmZXJyZWRfc3BsaXRfc2hyaW5rZXIs
IAo+PiAidGhwLWRlZmVycmVkX3NwbGl0Iik7Cj4+ICvCoMKgwqAgZXJyID0gdGhwX3Nocmlua2Vy
X2luaXQoKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBl
cnJfc3BsaXRfc2hyaW5rZXI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9zaHJpbmtlcjsK
Pj4gwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqAgKiBCeSBkZWZhdWx0IGRpc2FibGUgdHJh
bnNwYXJlbnQgaHVnZXBhZ2VzIG9uIHNtYWxsZXIgc3lzdGVtcywKPj4gQEAgLTUwNSwxMCArNTM2
LDggQEAgc3RhdGljIGludCBfX2luaXQgaHVnZXBhZ2VfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKg
IHJldHVybiAwOwo+PiDCoCBlcnJfa2h1Z2VwYWdlZDoKPj4gLcKgwqDCoCB1bnJlZ2lzdGVyX3No
cmlua2VyKCZkZWZlcnJlZF9zcGxpdF9zaHJpbmtlcik7Cj4+IC1lcnJfc3BsaXRfc2hyaW5rZXI6
Cj4+IC3CoMKgwqAgdW5yZWdpc3Rlcl9zaHJpbmtlcigmaHVnZV96ZXJvX3BhZ2Vfc2hyaW5rZXIp
Owo+PiAtZXJyX2h6cF9zaHJpbmtlcjoKPj4gK8KgwqDCoCB0aHBfc2hyaW5rZXJfZXhpdCgpOwo+
PiArZXJyX3Nocmlua2VyOgo+PiDCoMKgwqDCoMKgIGtodWdlcGFnZWRfZGVzdHJveSgpOwo+PiDC
oCBlcnJfc2xhYjoKPj4gwqDCoMKgwqDCoCBodWdlcGFnZV9leGl0X3N5c2ZzKGh1Z2VwYWdlX2tv
YmopOwo+PiBAQCAtMjg1MSw3ICsyODgwLDcgQEAgdm9pZCBkZWZlcnJlZF9zcGxpdF9mb2xpbyhz
dHJ1Y3QgZm9saW8gKmZvbGlvKQo+PiDCoCAjaWZkZWYgQ09ORklHX01FTUNHCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAobWVtY2cpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9z
aHJpbmtlcl9iaXQobWVtY2csIGZvbGlvX25pZChmb2xpbyksCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmVycmVkX3NwbGl0X3Nocmlua2VyLmlkKTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmZXJyZWRfc3BsaXRf
c2hyaW5rZXItPmlkKTsKPj4gwqAgI2VuZGlmCj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRzX3F1ZXVlLT5zcGxpdF9xdWV1ZV9sb2NrLCBmbGFn
cyk7Cj4+IEBAIC0yOTI1LDE0ICsyOTU0LDYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZGVmZXJy
ZWRfc3BsaXRfc2NhbihzdHJ1Y3QgCj4+IHNocmlua2VyICpzaHJpbmssCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIHNwbGl0Owo+PiDCoCB9Cj4+IC1zdGF0aWMgc3RydWN0IHNocmlua2VyIGRlZmVycmVk
X3NwbGl0X3Nocmlua2VyID0gewo+PiAtwqDCoMKgIC5jb3VudF9vYmplY3RzID0gZGVmZXJyZWRf
c3BsaXRfY291bnQsCj4+IC3CoMKgwqAgLnNjYW5fb2JqZWN0cyA9IGRlZmVycmVkX3NwbGl0X3Nj
YW4sCj4+IC3CoMKgwqAgLnNlZWtzID0gREVGQVVMVF9TRUVLUywKPj4gLcKgwqDCoCAuZmxhZ3Mg
PSBTSFJJTktFUl9OVU1BX0FXQVJFIHwgU0hSSU5LRVJfTUVNQ0dfQVdBUkUgfAo+PiAtwqDCoMKg
wqDCoMKgwqDCoCBTSFJJTktFUl9OT05TTEFCLAo+PiAtfTsKPj4gLQo+PiDCoCAjaWZkZWYgQ09O
RklHX0RFQlVHX0ZTCj4+IMKgIHN0YXRpYyB2b2lkIHNwbGl0X2h1Z2VfcGFnZXNfYWxsKHZvaWQp
Cj4+IMKgIHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
