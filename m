Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 907957FAFCC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 02:54:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7nIT-0004EK-CZ;
	Tue, 28 Nov 2023 01:53:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7nIR-0004EE-Sa
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 01:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKuYNn5jPujIJEE02jCh+XzNIl7zdh0qqEoUECmx9FE=; b=iUjlv/Uvzx3V55DmYtB3D8zq6z
 F2sEINIlAfjpRe9+KNnreUdkslKBEYW0D4bPEesbiyN0N2nE59NmVXr/mi2/23E2x/fjH7w8IP3MI
 yRL4vxb6BRpoM3WSKcLFzMFD/JB9K6HXTPYSoeoOF8ll+UnUqEIkhq+VJS053Sq8Re5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TKuYNn5jPujIJEE02jCh+XzNIl7zdh0qqEoUECmx9FE=; b=mfKiNC51CMAw3wZnvshDqhDG7O
 vsZ46UVKsHLP2vgzGX+G8CBmElvyWZkfLBGKxao6KkWXQd0VxN0/hDqIkpgm4lrLKJnT0CSc0712I
 8jGDaJWn3reNV4HAhy6MdtBm8zWMK2KXeH1YnRlf8hWOF3zbW7mm90wPeRRENGqo5Rq4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7nIM-0006bk-55 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 01:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F0A4CE1411;
 Tue, 28 Nov 2023 01:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEC0C433C8;
 Tue, 28 Nov 2023 01:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701136414;
 bh=8skDDkB8Qm73sL7P1GOXpyNCWMNfEICwHczxqIP/PMw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=isAUvbUkENKiu39tXbm1q74RlRvvprtBH7aE/C3ctWV3kuCZjCp3feYmcNZ32Tnzo
 VVVoyrfpMh8tITw9PGqa3/iX+biZJC5HyotWovkKmZuNr/Su1qWYwtla6VZan0CTl8
 y2vYLx0LYbKyCEf5MX5sTowPCeWJjVsWWgNZWSv3IJIwIcYcxAWhwlat935cTzul+N
 KjOVqUhVJvA7qiH9hB0yJWTsBlMyJqmiKOfY/dviWcbI/AaJ/UCdUlG78G0h1B2k1G
 QZS7Nz1NtHJtAAb5SZNvGSwJPvCq6OSyStjfGo3yFvsqdujgMYpUwlp4OavpuKTFxD
 J3sNgdRmj9vtA==
Message-ID: <c5b8d16c-c1fa-0595-d948-462ba537d4b6@kernel.org>
Date: Tue, 28 Nov 2023 09:53:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daniel Rosenberg <drosen@google.com>
References: <20231118020309.1894531-1-drosen@google.com>
 <20231118020309.1894531-3-drosen@google.com>
 <b68dfcda-5e30-d752-1539-e88db98949ee@kernel.org>
 <CA+PiJmRh0pGjdAqobB74VEWuS+EW9YXRsvWwfigmNdEe0G+c-A@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CA+PiJmRh0pGjdAqobB74VEWuS+EW9YXRsvWwfigmNdEe0G+c-A@mail.gmail.com>
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/11/28 8:52, Daniel Rosenberg wrote: > On Sun, Nov
   26, 2023 at 5:42 PM Chao Yu <chao@kernel.org> wrote: >> >> Hi Daniel, >>
    >> How about this? It be more explicit to indicate the logic? >> >> [...]
    
 
 Content analysis details:   (-4.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7nIM-0006bk-55
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs-tools: Wait for Block Size to
 initialize Cache
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMS8yOCA4OjUyLCBEYW5pZWwgUm9zZW5iZXJnIHdyb3RlOgo+IE9uIFN1biwgTm92
IDI2LCAyMDIzIGF0IDU6NDLigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pgo+PiBIaSBEYW5pZWwsCj4+Cj4+IEhvdyBhYm91dCB0aGlzPyBJdCBiZSBtb3JlIGV4cGxpY2l0
IHRvIGluZGljYXRlIHRoZSBsb2dpYz8KPj4KPj4gLS0tCj4+ICAgIGZzY2svbW91bnQuYyAgICAg
IHwgMiArKwo+PiAgICBpbmNsdWRlL2YyZnNfZnMuaCB8IDMgKysrCj4+ICAgIGxpYi9saWJmMmZz
X2lvLmMgIHwgNCArKysrCj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9mc2NrL21vdW50LmMgYi9mc2NrL21vdW50LmMKPj4gaW5kZXggNzI1
MTZmNC4uNGRmYjk5NiAxMDA2NDQKPj4gLS0tIGEvZnNjay9tb3VudC5jCj4+ICsrKyBiL2ZzY2sv
bW91bnQuYwo+PiBAQCAtMTIzOCw2ICsxMjM4LDggQEAgaW50IGluaXRfc2JfaW5mbyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpCj4+ICAgICAgICAgIE1TRygwLCAiSW5mbzogdG90YWwgRlMgc2Vj
dG9ycyA9ICUiUFJJdTY0IiAoJSJQUkl1NjQiIE1CKVxuIiwKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdG90YWxfc2VjdG9ycywgdG90YWxfc2VjdG9ycyA+Pgo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDIwIC0gZ2V0X3NiKGxv
Z19zZWN0b3JzaXplKSkpOwo+PiArCj4+ICsgICAgICAgYy5jYWNoZV9jb25maWcuYmxrc2l6ZV9p
bml0aWFsaXplZCA9IHRydWU7Cj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAgICB9Cj4+Cj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4+IGluZGV4
IDZkZjJlNzMuLmUzNzdkNDggMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5oCj4+ICsr
KyBiL2luY2x1ZGUvZjJmc19mcy5oCj4+IEBAIC00NjAsNiArNDYwLDkgQEAgdHlwZWRlZiBzdHJ1
Y3Qgewo+PiAgICAgICAgICB1bnNpZ25lZCBtYXhfaGFzaF9jb2xsaXNpb247Cj4+Cj4+ICAgICAg
ICAgIGJvb2wgZGJnX2VuOwo+PiArCj4+ICsgICAgICAgLyogd2hldGhlciBibGtzaXplIGhhcyBi
ZWVuIGluaXRpYWxpemVkICovCj4+ICsgICAgICAgYm9vbCBibGtzaXplX2luaXRpYWxpemVkOwo+
PiAgICB9IGRldl9jYWNoZV9jb25maWdfdDsKPj4KPj4gICAgLyogZjJmc19jb25maWdyYXRpb24g
Zm9yIGNvbXByZXNzaW9uIHVzZWQgZm9yIHNsb2FkLmYyZnMgKi8KPj4gZGlmZiAtLWdpdCBhL2xp
Yi9saWJmMmZzX2lvLmMgYi9saWIvbGliZjJmc19pby5jCj4+IGluZGV4IDM5ZDM3NzcuLmJiNzc0
MTggMTAwNjQ0Cj4+IC0tLSBhL2xpYi9saWJmMmZzX2lvLmMKPj4gKysrIGIvbGliL2xpYmYyZnNf
aW8uYwo+PiBAQCAtMTk5LDYgKzE5OSwxMCBAQCB2b2lkIGRjYWNoZV9pbml0KHZvaWQpCj4+ICAg
IHsKPj4gICAgICAgICAgbG9uZyBuOwo+Pgo+PiArICAgICAgIC8qIE11c3Qgbm90IGluaXRpYXRl
IGNhY2hlIHVudGlsIGJsb2NrIHNpemUgaXMga25vd24gKi8KPj4gKyAgICAgICBpZiAoIWMuY2Fj
aGVfY29uZmlnLmJsa3NpemVfaW5pdGlhbGl6ZWQpCj4+ICsgICAgICAgICAgICAgICByZXR1cm47
Cj4+ICsKPj4gICAgICAgICAgaWYgKGMuY2FjaGVfY29uZmlnLm51bV9jYWNoZV9lbnRyeSA8PSAw
KQo+PiAgICAgICAgICAgICAgICAgIHJldHVybjsKPj4KPj4gLS0KPj4gMi40MC4xCj4+Cj4+Cj4g
SSB0aGluayB0aGF0IHdvcmtzIHRvby4gSSB3YXMgaW5pdGlhbGx5IGdvaW5nIHRvIGdvIHdpdGgg
Y29kZSBsaWtlCj4gdGhhdCwgYnV0IEkgd2FzIHVuc3VyZSBpZiByZWFkL3dyaXRlcyB0aGF0IGFy
ZW4ndCBpbiB0aGUgZnNjayBwYXRoCj4gdXNlZCBjYWNoaW5nIGFzIHdlbGwuIFRoZXJlJ3MgYSBm
ZXcgdXNlcyBvZiB0aG9zZSBpbiB0aGUgbWtmcy8gcGF0aHMsCj4gYnV0IEkgZG9uJ3QgdGhpbmsg
dGhlcmUncyBhbnl0aGluZyB0aGF0IHNldHMKPiBjYWNoZV9jb25maWcubnVtX2NhY2hlX2VudHJ5
IHRoZXJlLiBJIHdhcyB3b3JyaWVkIGFib3V0IG1pc3NpbmcgY29kZQo+IHBhdGhzIGxpa2UgdGhh
dCwgc28gSSBoYWQgcmVzdHJpY3RlZCB0aGUgY2hhbmdlcyB0byB3aGVyZSBJIGtuZXcgd2UKPiB3
ZXJlIHJlYWRpbmcgdGhlIHN1cGVyYmxvY2sgb2ZmIGRpc2suIElmIHRoZXJlIGlzIGEgcHJvYmxl
bSwgaXQgY291bGQKPiBiZSBjb3ZlcmVkIGJ5IHNldHRpbmcgYy5jYWNoZV9jb25maWcuYmxrc2l6
ZV9pbml0aWFsaXplZCA9IHRydWUgd2l0aGluCj4gdGhlIG1rZnMgY29kZSBhZnRlciB0aGUgYmxv
Y2tzaXplIGlzIHNldCBpbiBmMmZzX3BhcnNlX29wdGlvbnMuIEJ1dAo+IHRoYXQgaXNuJ3QgbmVl
ZGVkIGlmIHRoZXJlJ3Mgbm8gY2FjaGluZyBpbiBta2ZzLgoKT2gsIEkgdGhpbmsgdGhlIG1vc3Qg
dXNlZnVsIGNhc2Ugb2YgZGNhY2hlIGlzIGZzY2ssIG5vdCBzdXJlIGFib3V0IHJlc2l6ZSwKYnV0
IEkgZG9uJ3QgdGhpbmsgaXQgd2lsbCBiZSBiZW5lZml0IHRvIG1rZnMvc2xvYWQsIGJhc2VkIG9u
IElPIHBhdHRlcm4gb2YKdGhlc2UgY2FzZXMuCgpJTU8sIHdlIGNhbiBnZXQgcmlkIG9mIGRjYWNo
ZSBmb3IgbWtmcy9zbG9hZCBjYXNlcyBpbiBvcmRlciB0byBhdm9pZAptYWludGFpbmluZyBjb21w
bGljYXRlZCBkZXNpZ24vbG9naWMuCgpUaGFua3MsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
