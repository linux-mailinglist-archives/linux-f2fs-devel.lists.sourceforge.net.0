Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733A88B8CF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 04:39:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1roxf6-00066u-3O;
	Tue, 26 Mar 2024 03:39:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1roxf4-00066h-Qh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 03:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/ybcAWlUCHmoySSU86mwFcgprc/w7f5uICPA/CHnbQ=; b=ajE+9c9yB5L06TIOt2iQtyNHRp
 /sDFYj66O3EW+A8P5v1gLRXiR5TqKMvDcea4/C7NM4wm9MBwVIdjP/HNgGXRQG83QGOycSRSbAxkA
 jtsoHzYitmS14gHkv59brJ+YioXSwJ2jnvSvoxNzhmGNA0rz2NdhDNtn731rLdLeU2bY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N/ybcAWlUCHmoySSU86mwFcgprc/w7f5uICPA/CHnbQ=; b=ToBJN8kTkraRfzTnxInFPkIbcR
 F1rB/JwtZYUHX5WNnAQkwWFVc1rf26TdqBZJuTB+Kx2Ez8OnVm1OMd0E9yuDm9MK4Mf1yuVDfw/s5
 kOx7ATrOEApvjuiGhvws4xWw3vFzo8L7/aTeSCVlAOFdvpy1ce5K0hr6PhsC6pGq8yfQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1roxf4-0006pa-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 03:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D76D6115B;
 Tue, 26 Mar 2024 03:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBADC43390;
 Tue, 26 Mar 2024 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711424377;
 bh=P3vreY2sz09wZD7BtqL79mQRFOWcQ2qQmdy79Frd0Q4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IhxLN1IdkHiZ64LTHLbvCtomJaVRZtRfO2u0R5NhiFGnaaCNZchQvv+HLwhXo9j72
 qMZWHzmrfjiUQz/+AAsc0jsYdhUbCNn0P97P749R1l6+TxAIRgWiykAw9dZDDk5Zwk
 hCLzQKIKQ3DnHgsFPtW8vhqvLjm3AU0cy9wdQj17n2LpTJTXjTnOsUpp1iQWYot0Ib
 I+ISYRzTx68ay9l8zMbVNQ97VQpF/lHHPM9clxQ0Nin44os951PUuYDOQwOIRLSulZ
 iUnT23G/MyVu4hpKPdmrdp+pQWSjwVX8Na8bu5vizMSIzaVvU2Y4/hp/c2AqQbgZRt
 SEPxYmLBTbHnw==
Message-ID: <30419139-6fdd-48df-b32a-9db7575cebb8@kernel.org>
Date: Tue, 26 Mar 2024 11:39:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240319212316.4193790-1-daeho43@gmail.com>
 <712f380c-68ef-4743-bd9b-7342e838ced7@kernel.org>
 <CACOAw_yAWGbx2Bx2or1OyVUUw6HSgTd=fo3e151d1JHU+Op5qQ@mail.gmail.com>
 <c1fd6c09-0083-439b-a81d-0d2f39cb10d4@kernel.org>
 <CACOAw_xejyoA9f2x9J0Z-MgbmrHAPYeAmpz8Lf1GfLDs-yHh5w@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_xejyoA9f2x9J0Z-MgbmrHAPYeAmpz8Lf1GfLDs-yHh5w@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/3/25 23:02, Daeho Jeong wrote: > On Fri, Mar 22, 2024
    at 9:26 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/3/21 1:42, Daeho
    Jeong wrote: >>> On Wed, Mar 20, 2024 at 2:38 AM Chao Yu <c [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1roxf4-0006pa-Gy
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent writing without fallocate()
 for pinned files
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8zLzI1IDIzOjAyLCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBGcmksIE1hciAyMiwg
MjAyNCBhdCA5OjI24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNC8zLzIxIDE6NDIsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gT24gV2VkLCBNYXIgMjAs
IDIwMjQgYXQgMjozOOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4K
Pj4+PiBPbiAyMDI0LzMvMjAgNToyMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+IEZyb206IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pj4+Cj4+Pj4+IEluIGEgY2FzZSB3
cml0aW5nIHdpdGhvdXQgZmFsbG9jYXRlKCksIHdlIGNhbid0IGd1YXJhbnRlZSBpdCdzIGFsbG9j
YXRlZAo+Pj4+PiBpbiB0aGUgY29udmVudGlvbmFsIGFyZWEgZm9yIHpvbmVkIHN0cm9hZ2UuCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5j
b20+Cj4+Pj4+IC0tLQo+Pj4+PiB2MjogY292ZXJlZCB0aGUgZGlyZWN0IGlvIGNhc2UKPj4+Pj4g
djM6IGNvdmVyZWQgdGhlIG1rd3JpdGUgY2FzZQo+Pj4+PiAtLS0KPj4+Pj4gICAgIGZzL2YyZnMv
ZGF0YS5jIHwgMTQgKysrKysrKysrKysrLS0KPj4+Pj4gICAgIGZzL2YyZnMvZmlsZS5jIHwgMTYg
KysrKysrKystLS0tLS0tLQo+Pj4+PiAgICAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0
YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gaW5kZXggYzIxYjkyZjE4NDYzLi5kM2U1YWIyNzM2
YTYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZGF0YS5jCj4+Pj4+IEBAIC0xNTg0LDggKzE1ODQsMTEgQEAgaW50IGYyZnNfbWFwX2Jsb2Nrcyhz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFn
KQo+Pj4+Pgo+Pj4+PiAgICAgICAgIC8qIHVzZSBvdXQtcGxhY2UtdXBkYXRlIGZvciBkaXJlY3Qg
SU8gdW5kZXIgTEZTIG1vZGUgKi8KPj4+Pj4gICAgICAgICBpZiAobWFwLT5tX21heV9jcmVhdGUg
JiYKPj4+Pj4gLSAgICAgICAgIChpc19ob2xlIHx8IChmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxh
ZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pKSkgewo+Pj4+PiAtICAgICAgICAgICAgIGlmICh1bmxp
a2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7Cj4+Pj4+ICsgICAgICAgICAoaXNfaG9sZSB8fCAo
ZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYmCj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIWYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpKSkpIHsK
Pj4+Pj4gKyAgICAgICAgICAgICBpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSB8fAo+
Pj4+PiArICAgICAgICAgICAgICAgICAoZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkgJiYgaXNf
aG9sZSAmJgo+Pj4+PiArICAgICAgICAgICAgICAgICAgZmxhZyAhPSBGMkZTX0dFVF9CTE9DS19Q
UkVfRElPKSkgewo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUlPOwo+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHN5bmNfb3V0Owo+Pj4+PiAgICAgICAgICAg
ICAgICAgfQo+Pj4+PiBAQCAtMzM3OCw2ICszMzgxLDggQEAgc3RhdGljIGludCBwcmVwYXJlX3dy
aXRlX2JlZ2luKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4gICAgICAgICAgICAgICAg
IGYyZnNfbWFwX2xvY2soc2JpLCBmbGFnKTsKPj4+Pj4gICAgICAgICAgICAgICAgIGxvY2tlZCA9
IHRydWU7Cj4+Pj4+ICAgICAgICAgfSBlbHNlIGlmICgocG9zICYgUEFHRV9NQVNLKSA+PSBpX3Np
emVfcmVhZChpbm9kZSkpIHsKPj4+Pj4gKyAgICAgICAgICAgICBpZiAoZjJmc19pc19waW5uZWRf
ZmlsZShpbm9kZSkpCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKPj4+
Pj4gICAgICAgICAgICAgICAgIGYyZnNfbWFwX2xvY2soc2JpLCBmbGFnKTsKPj4+Pj4gICAgICAg
ICAgICAgICAgIGxvY2tlZCA9IHRydWU7Cj4+Pj4+ICAgICAgICAgfQo+Pj4+PiBAQCAtMzQwNyw2
ICszNDEyLDExIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV93cml0ZV9iZWdpbihzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4+Pj4+Cj4+Pj4+ICAgICAgICAgaWYgKCFmMmZzX2xvb2t1cF9yZWFkX2V4
dGVudF9jYWNoZV9ibG9jayhpbm9kZSwgaW5kZXgsCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZG4uZGF0YV9ibGthZGRyKSkgewo+Pj4+PiAr
ICAgICAgICAgICAgIGlmIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSkgewo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTzsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0Owo+Pj4+PiArICAgICAgICAgICAgIH0KPj4+Pj4gKwo+Pj4+PiAgICAgICAgICAg
ICAgICAgaWYgKGxvY2tlZCkgewo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBm
MmZzX3Jlc2VydmVfYmxvY2soJmRuLCBpbmRleCk7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZz
L2ZpbGUuYwo+Pj4+PiBpbmRleCA4MjI3N2U5NWM4OGYuLjRkYjNiMjFjODA0YiAxMDA2NDQKPj4+
Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4g
QEAgLTU3LDcgKzU3LDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZjJmc192bV9wYWdlX21rd3JpdGUo
c3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+Pj4+ICAgICAgICAgc3RydWN0IGlub2RlICppbm9kZSA9
IGZpbGVfaW5vZGUodm1mLT52bWEtPnZtX2ZpbGUpOwo+Pj4+PiAgICAgICAgIHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+Pj4+ICAgICAgICAgc3RydWN0IGRu
b2RlX29mX2RhdGEgZG47Cj4+Pj4+IC0gICAgIGJvb2wgbmVlZF9hbGxvYyA9IHRydWU7Cj4+Pj4+
ICsgICAgIGJvb2wgbmVlZF9hbGxvYyA9ICFmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKTsKPj4+
Pgo+Pj4+IFdpbGwgdGhpcyBjaGVjayByYWNlcyB3LyBwaW5maWxlIGdldHxzZXQ/Cj4+Pgo+Pj4g
RG8geW91IG1lYW4gInNldC9jbGVhciIgY2FzZT8gSSBiZWxpZXZlICJzZXQiIGNhc2UgaXMgb2th
eSwgc2luY2Ugd2UKPj4KPj4gWXVwLAo+Pgo+Pj4gY2FuJ3Qgc2V0IGlmIHRoZSBpbm9kZSBhbHJl
YWR5IGhhcyBhIGRhdGEgYmxvY2suIEZvciAiY2xlYXIiIGNhc2UsIEkKPj4KPj4gSG93ZXZlciwg
d2UgY2FuIHNldCBwaW5maWxlIG9uIHdyaXR0ZW4gaW5vZGUgaW4gcmVndWxhciBibG9jayBkZXZp
Y2U6Cj4gCj4gWW91J3JlIHJpZ2h0LiBJIG1pc3NlZCBpdC4gTWF5YmUgSSB0aGluayB3ZSBzaG91
bGQga2VlcCB0aGUgY29uY2VwdAo+IGNvbnNpc3RlbnQgYWNyb3NzIGRldmljZXMgcmVnYXJkbGVz
cyBvZiB6b25lZCBzdG9yYWdlIHN1cHBvcnQuIEhvdwo+IGFib3V0IHByZXZlbnRpbmcgZmlsZSBw
aW5uaW5nIGZvciBhbHJlYWR5IHdyaXR0ZW4gaW5vZGVzIGFjcm9zcyBhbGwKPiBkZXZpY2UgdHlw
ZXM/IEkgYW0gY2hhbmdpbmcgdGhlIHBpbmZpbGUgY29uY2VwdCBieSBhbGxvd2luZyB0aGUgdXNl
cnMKCkknbSBva2F5IHdpdGggdGhhdCwgb3Igd2UgY2FuIHRyaWVzIHRvIG1pZ3JhdGUgZGF0YSBi
bG9jayBvZiB0YXJnZXQgZmlsZQpmcm9tIHNlcS16b25lIHRvIGNvbnYtem9uZSBvciByZWd1bGFy
LWRldmljZSBiZWZvcmUgc2V0dGluZyBpdCB3LyBwaW4gZmxhZy4uLgoKVGhhbmtzLAoKPiB0byB3
cml0ZSBvbiBvbmx5IGZhbGxvY2F0ZSgpLWVkIHNwYWNlLgo+IAo+Pgo+PiAgICAgICAgICBpZiAo
ZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBGMkZTX0hBU19CTE9DS1MoaW5vZGUpKSB7Cj4+
ICAgICAgICAgICAgICAgICAgcmV0ID0gLUVGQklHOwo+PiAgICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+PiAgICAgICAgICB9Cj4+Cj4+IFNob3VsZCB3ZSBhZGQgdGhlIGxvZ2ljIG9ubHkgaWYg
Ymxrem9uZWQgZmV0dXJlIGlzIGVuYWJsZWQ/Cj4+Cj4+PiBiZWxpZXZlIG1rd3JpdGUgZmFpbHVy
ZSBpcyBva2F5IGluIHJhY3kgY29uZGl0aW9ucyBjYXVzZWQgYnkgY2xlYXJpbmcKPj4+IHRoZSBw
aW4gZmxhZy4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Cj4+IE9yIHdlIGNhbiB1c2UgZmlsZW1hcF9p
bnZhbGlkYXRlX2xvY2soKSBpbiBmMmZzX2lvY19zZXRfcGluX2ZpbGUoKSB0bwo+PiBhdm9pZCB0
aGUgcmFjZSBjb25kaXRpb24/Cj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+Pj4KPj4+PiBUaGFua3Ms
Cj4+Pj4KPj4+Pj4gICAgICAgICBpbnQgZXJyID0gMDsKPj4+Pj4gICAgICAgICB2bV9mYXVsdF90
IHJldDsKPj4+Pj4KPj4+Pj4gQEAgLTExNCwxOSArMTE0LDE1IEBAIHN0YXRpYyB2bV9mYXVsdF90
IGYyZnNfdm1fcGFnZV9ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+Pj4+PiAgICAgICAg
ICAgICAgICAgZ290byBvdXRfc2VtOwo+Pj4+PiAgICAgICAgIH0KPj4+Pj4KPj4+Pj4gKyAgICAg
c2V0X25ld19kbm9kZSgmZG4sIGlub2RlLCBOVUxMLCBOVUxMLCAwKTsKPj4+Pj4gICAgICAgICBp
ZiAobmVlZF9hbGxvYykgewo+Pj4+PiAgICAgICAgICAgICAgICAgLyogYmxvY2sgYWxsb2NhdGlv
biAqLwo+Pj4+PiAtICAgICAgICAgICAgIHNldF9uZXdfZG5vZGUoJmRuLCBpbm9kZSwgTlVMTCwg
TlVMTCwgMCk7Cj4+Pj4+ICAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX2dldF9ibG9ja19sb2Nr
ZWQoJmRuLCBwYWdlLT5pbmRleCk7Cj4+Pj4+IC0gICAgIH0KPj4+Pj4gLQo+Pj4+PiAtI2lmZGVm
IENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+Pj4+IC0gICAgIGlmICghbmVlZF9hbGxvYykg
ewo+Pj4+PiAtICAgICAgICAgICAgIHNldF9uZXdfZG5vZGUoJmRuLCBpbm9kZSwgTlVMTCwgTlVM
TCwgMCk7Cj4+Pj4+ICsgICAgIH0gZWxzZSB7Cj4+Pj4+ICAgICAgICAgICAgICAgICBlcnIgPSBm
MmZzX2dldF9kbm9kZV9vZl9kYXRhKCZkbiwgcGFnZS0+aW5kZXgsIExPT0tVUF9OT0RFKTsKPj4+
Pj4gICAgICAgICAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+Pj4+ICAgICAgICAgfQo+
Pj4+PiAtI2VuZGlmCj4+Pj4+ICsKPj4+Pj4gICAgICAgICBpZiAoZXJyKSB7Cj4+Pj4+ICAgICAg
ICAgICAgICAgICB1bmxvY2tfcGFnZShwYWdlKTsKPj4+Pj4gICAgICAgICAgICAgICAgIGdvdG8g
b3V0X3NlbTsKPj4+Pj4gQEAgLTQ2MTEsNiArNDYwNywxMCBAQCBzdGF0aWMgaW50IGYyZnNfcHJl
YWxsb2NhdGVfYmxvY2tzKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVy
LAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4+PiAgICAgICAg
IH0KPj4+Pj4KPj4+Pj4gKyAgICAgLyogRm9yIHBpbm5lZCBmaWxlcywgaXQgc2hvdWxkIGJlIGZh
bGxvY2F0ZSgpLWVkIGluIGFkdmFuY2UuICovCj4+Pj4+ICsgICAgIGlmIChmMmZzX2lzX3Bpbm5l
ZF9maWxlKGlub2RlKSkKPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPj4+Pj4gKwo+Pj4+
PiAgICAgICAgIC8qIERvIG5vdCBwcmVhbGxvY2F0ZSBibG9ja3MgdGhhdCB3aWxsIGJlIHdyaXR0
ZW4gcGFydGlhbGx5IGluIDRLQi4gKi8KPj4+Pj4gICAgICAgICBtYXAubV9sYmxrID0gRjJGU19C
TEtfQUxJR04ocG9zKTsKPj4+Pj4gICAgICAgICBtYXAubV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JM
Syhwb3MgKyBjb3VudCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
