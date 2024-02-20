Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B659D85B2C1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 07:14:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcJOS-0008Ec-3u;
	Tue, 20 Feb 2024 06:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcJOQ-0008EW-HQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hyTRxgZouENAUYYiushBJuUdSN1ibJMaVQTinCKjCMQ=; b=nQ1CCx7YG2OfOC6MOIluum01ue
 Gt+mivZk7vsGsGknIsoqX7d0rVY9H8DXun4Mug8NxhHffYaM1MUnzphgUlzdlDC2FOCtn195+yb97
 ISAuxlt0Eo5ymlBFUCQxV8VGFOL0/+n3VBsbRJ7Q9qv6x82MkxkUnm7lRy0CXWzZpqrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hyTRxgZouENAUYYiushBJuUdSN1ibJMaVQTinCKjCMQ=; b=EAeKVsm1WqHVri+kLsBAFBepJd
 io/3Qt8V3qfWzTlDmdviZ7Nk5TXKj19c0fr+CVCmm6GnqERAaOQ+wQ1pFUX5gmUoJq67nuZju9ZeP
 jm7UByC1LqEc1spM3WDklfwwPHO+nKru3UZynyT7/TBEYqJ4MSkZRuKDQmS23hCIgO0w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcJOP-0005HN-BV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55B286102D;
 Tue, 20 Feb 2024 06:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11421C433C7;
 Tue, 20 Feb 2024 06:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708409644;
 bh=im/xk8WtovhJ/os0s4GcpOv9OZ51L0bRmgYqEcvT6vo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IGi9zuZFET8P9j2g0MUwu3V1H5u2I53toTuls49nsgr8KPPmo7gT428SUePHCtLgl
 11E4N7Y8t+7nwp1qh5R4yWcog80dCcCIq4OsYGWbbabkGg5621LUAhGkHWdSrxtCqd
 OvrgY2L4zbzRuvIb0J1oNBnyRvoFxJjhJQJd2CXJQr6rTsiwlFgyVWnlfCXnWtIZJN
 0HMw0ldBpMlQPDgFAziT99ZatOnHtzZFupMBXG3Z1RuQDYlu9FutWuwQHxm1RVweh8
 mXDl3ZyYFX2M2PIdtm2U64KXYmsSVNPewpM0ruChyhjTErLL6oAQXfgVa6mIBAHyHe
 bYVKjHCuJGeBw==
Message-ID: <c2bc04b6-be23-426f-ad6c-1d47dad7259b@kernel.org>
Date: Tue, 20 Feb 2024 14:13:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1707103845-17220-1-git-send-email-zhiguo.niu@unisoc.com>
 <e2680238-9e9c-422a-adf3-bcee71dfe0a8@kernel.org>
 <ZcGoWAsl08d5-U0g@google.com>
 <6f01fe1b-d580-4a2a-adc5-7eb3baebeb7a@kernel.org>
 <CAHJ8P3J6CrYeBHUHmk4rQXRr=V0jHkLWOKHjdC+xuLgb4a+NQQ@mail.gmail.com>
 <17c9e85a-54b6-4e1c-b95f-262c771b0f1d@kernel.org>
 <4bcf0a1c-b21d-4735-bf57-b78439a65df5@kernel.org>
 <CAHJ8P3+25FxdpqWNW53yyiLLG8J7LnMAeYr_DV3ARF9-3LCUUg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+25FxdpqWNW53yyiLLG8J7LnMAeYr_DV3ARF9-3LCUUg@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/2/20 13:34, Zhiguo Niu wrote: > On Tue, Feb 20, 2024
    at 10:36 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/2/19 22:36,
   Chao Yu wrote: >>>>>> Please think about how to optimize this, whi [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcJOP-0005HN-BV
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8yLzIwIDEzOjM0LCBaaGlndW8gTml1IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDIwLCAy
MDI0IGF0IDEwOjM24oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNC8yLzE5IDIyOjM2LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4gUGxlYXNlIHRoaW5rIGFi
b3V0IGhvdyB0byBvcHRpbWl6ZSB0aGlzLCB3aGljaCBpcyByZWFsbHkgdWdseSBub3cKPj4gLS0t
Cj4+ICAgIGZzL2YyZnMvY2hlY2twb2ludC5jIHwgMTIgKysrKysrKystLS0tCj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+IGluZGV4
IDg3YjdjOTg4YzhjYS4uMDg5YzI2YjgwYmUzIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2NoZWNr
cG9pbnQuYwo+PiArKysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+PiBAQCAtMTM1LDcgKzEzNSw3
IEBAIHN0cnVjdCBwYWdlICpmMmZzX2dldF90bXBfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksIHBnb2ZmX3QgaW5kZXgpCj4+ICAgIH0KPj4KPj4gICAgc3RhdGljIGJvb2wgX19pc19iaXRt
YXBfdmFsaWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIsCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IHR5cGUpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCB0eXBlLCBib29sICpyZWNvcmRfZXJyb3IpCj4+ICAgIHsKPj4gICAgICAgICAgc3RydWN0
IHNlZ19lbnRyeSAqc2U7Cj4+ICAgICAgICAgIHVuc2lnbmVkIGludCBzZWdubywgb2Zmc2V0Owo+
PiBAQCAtMTYwLDYgKzE2MCw3IEBAIHN0YXRpYyBib29sIF9faXNfYml0bWFwX3ZhbGlkKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBibGthZGRyLAo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJsa2FkZHIsIGV4aXN0KTsKPj4gICAgICAgICAgICAgICAgICBzZXRfc2JpX2Zs
YWcoc2JpLCBTQklfTkVFRF9GU0NLKTsKPj4gICAgICAgICAgICAgICAgICBkdW1wX3N0YWNrKCk7
Cj4+ICsgICAgICAgICAgICAgICAqcmVjb3JkX2Vycm9yID0gdHJ1ZTsKPj4gICAgICAgICAgfQo+
Pgo+PiAgICAgICAgICByZXR1cm4gZXhpc3Q7Cj4+IEBAIC0yMDksMTAgKzIxMCwxMyBAQCBzdGF0
aWMgYm9vbCBfX2YyZnNfaXNfdmFsaWRfYmxrYWRkcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBkdW1wX3N0YWNrKCk7Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycjsKPj4gICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICB2YWxpZCA9IF9faXNfYml0bWFwX3ZhbGlkKHNiaSwgYmxr
YWRkciwgdHlwZSk7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICgoIXZhbGlkICYmIHR5
cGUgIT0gREFUQV9HRU5FUklDX0VOSEFOQ0VfVVBEQVRFKSB8fAo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh2YWxpZCAmJiB0eXBlID09IERBVEFfR0VORVJJQ19FTkhBTkNFX1VQ
REFURSkpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmVjb3JkX2Vycm9yID0gZmFs
c2U7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmFsaWQgPSBfX2lzX2JpdG1hcF92
YWxpZChzYmksIGJsa2FkZHIsIHR5cGUsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJlY29yZF9lcnJvcik7Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghdmFsaWQgfHwgcmVjb3JkX2Vycm9yKQo+IGlmICAgdHlwZSA9PSBE
QVRBX0dFTkVSSUNfRU5IQU5DRV9VUERBVEUgJiYgYml0bWFwIGNoZWNrIGludmFsaWQsICBpdAo+
IGlzIGEgT0sgY2FzZSwgYnV0ICF2YWxpZAo+IHdpbGwgZ290byBkbyBlcnJvciBoYW5kbGluZy4K
ClllcywgaXQgbG9va3Mgd2UgbmVlZCB0byByZW1vdmUgIXZhbGlkIGNvbmRpdGlvbiB0byBhdm9p
ZCBlcnJvciBoYW5kbGluZywKYW5kIGFzc2lnbiByZWNvcmRfZXJyb3IgY29ycmVjdGx5IGluc2lk
ZSBfX2lzX2JpdG1hcF92YWxpZCgpIGZvciBhbGwgdGhlCmNhc2VzLgoKPiBJIHRoaW5rIGRvIGYy
ZnNfaGFuZGxlX2Vycm9yIGluIF9faXNfYml0bWFwX3ZhbGlkIGlzIGEgZ29vZCB3YXkuCgpMZXQg
bWUgcmV2aXNlIHRoZSBkaWZmIHBhdGNoIGZvciBjb21tZW50cy4KClRoYW5rcywKCj4gCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+PiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gdmFsaWQ7Cj4+ICAgICAgICAgICAgICAgICAgfQo+PiAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICBjYXNlIE1FVEFfR0VORVJJQzoKPj4gLS0KPj4g
Mi40MC4xCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
