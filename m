Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C474BA6EB1F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 09:09:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twzM0-0004lW-Vz;
	Tue, 25 Mar 2025 08:09:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twzLy-0004lP-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jhJpWreeCACbh+l6F3cuxPD301sINfqOtuzylC+9EaI=; b=FM4R2Lgi/QTnNA60BkZaMw1e/J
 WVDMt3kpJVU5Bjm5s1Jx4kOuHrkf2MDAiy/wofPLaJUGMoSU58/YhRzQaFLpxJYnVEBlWeP/hcHhL
 7U9Q22IgwQOb9e4wSfNNXuf6ylu221jLwDFs3hgthLmtV/jPe2/DkzFicaUtSCLifRU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jhJpWreeCACbh+l6F3cuxPD301sINfqOtuzylC+9EaI=; b=Hosz4H5Ud4cu/vjvCdEoWjXKwr
 7KrgYFEPexzk26bITrvgbH8AtVrRWteohkpxz/W14OKItpOHXsbl2V7YfZuSIaqob3wmSxRGAavBV
 ACBrkehtWHSxOxbvc5qeg/yitKYruRjobo2H7XnTDKOdFCU2LUbsx7dg9mPCa2eupenQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twzLs-0001HH-BA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D3756156D;
 Tue, 25 Mar 2025 08:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF85C4CEE4;
 Tue, 25 Mar 2025 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742890165;
 bh=t7ku1Yjv6c5+qa7d3xQ27A85ZDF0wVyffRWddMb6pmo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=F27BsnLZ88Cj6eKSR/GsIDu9JFjnbDybcenIapq4WyFl4xsd18gDrlRAYTIgD02AH
 YEibtBuB2WH9nIeFD0ZTa7LPIISwlap82XdK8VOHlnDmRl/vdsd62SctAVTe0T+2b4
 4ULNZytLTrHBK4hbPKALe3B1STUE0yR1/Zjz1ct08DfJbaCI56RLg9SjXQX+0PsFJm
 7Lwu1g65OB3VcD5xWKdKGLaiUpwzXuzo7IwChNkViaLPw7++SeJbW72JL6gCl7Sf5K
 3AR5/b7lF+w1K0Mon/974n0UC9xANZAsjGCk+2MeefkkieCqu0uU9zMCsdagaSUTfT
 PKc5zMDBmFAcg==
Message-ID: <1afd3158-19bb-472b-905e-6ae0c6e7a416@kernel.org>
Date: Tue, 25 Mar 2025 16:09:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250324113249.3084413-1-chao@kernel.org>
 <CAHJ8P3L0vJKdLQMSGGQJuDD3_++8BhV1b4cvL4PCFu0WY+EWwg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3L0vJKdLQMSGGQJuDD3_++8BhV1b4cvL4PCFu0WY+EWwg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/25/25 14:31, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年3月24日周一 19:36写道：
    >> >> This patch uses i_sem to protect access/upd [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.105.4.254 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twzLs-0001HH-BA
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a fast path in
 finish_preallocate_blocks()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8yNS8yNSAxNDozMSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IHZpYSBMaW51eC1m
MmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiDkuo4y
MDI15bm0M+aciDI05pel5ZGo5LiAIDE5OjM25YaZ6YGT77yaCj4+Cj4+IFRoaXMgcGF0Y2ggdXNl
cyBpX3NlbSB0byBwcm90ZWN0IGFjY2Vzcy91cGRhdGUgb24gZjJmc19pbm9kZV9pbmZvLmZsYWcK
Pj4gaW4gZmluaXNoX3ByZWFsbG9jYXRlX2Jsb2NrcygpLCBpdCBhdm9pZHMgZ3JhYmJpbmcgaW5v
ZGVfbG9jaygpIGluCj4+IGVhY2ggb3BlbigpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1
IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgZnMvZjJmcy9maWxlLmMgfCA0MCArKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+IGluZGV4IGFiYmNiYjU4NjVhMy4uYmI2YmEzMjY5
ZGUwIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+PiArKysgYi9mcy9mMmZzL2ZpbGUu
Ywo+PiBAQCAtNTU0LDE5ICs1NTQsMjQgQEAgc3RhdGljIGludCBmMmZzX2ZpbGVfbW1hcChzdHJ1
Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4+Cj4+ICBzdGF0aWMg
aW50IGZpbmlzaF9wcmVhbGxvY2F0ZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSkKPj4gIHsK
Pj4gLSAgICAgICBpbnQgcmV0Owo+PiArICAgICAgIGludCByZXQgPSAwOwo+PiArICAgICAgIGJv
b2wgb3BlbmVkOwo+Pgo+PiAtICAgICAgIGlub2RlX2xvY2soaW5vZGUpOwo+PiAtICAgICAgIGlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfT1BFTkVEX0ZJTEUpKSB7Cj4+IC0gICAgICAg
ICAgICAgICBpbm9kZV91bmxvY2soaW5vZGUpOwo+PiArICAgICAgIGYyZnNfZG93bl9yZWFkKCZG
MkZTX0koaW5vZGUpLT5pX3NlbSk7Cj4+ICsgICAgICAgb3BlbmVkID0gaXNfaW5vZGVfZmxhZ19z
ZXQoaW5vZGUsIEZJX09QRU5FRF9GSUxFKTsKPj4gKyAgICAgICBmMmZzX3VwX3JlYWQoJkYyRlNf
SShpbm9kZSktPmlfc2VtKTsKPj4gKyAgICAgICBpZiAob3BlbmVkKQo+PiAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4+IC0gICAgICAgfQo+Pgo+PiAtICAgICAgIGlmICghZmlsZV9zaG91bGRf
dHJ1bmNhdGUoaW5vZGUpKSB7Cj4+IC0gICAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9k
ZSwgRklfT1BFTkVEX0ZJTEUpOwo+PiAtICAgICAgICAgICAgICAgaW5vZGVfdW5sb2NrKGlub2Rl
KTsKPj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+PiAtICAgICAgIH0KPj4gKyAgICAgICBp
bm9kZV9sb2NrKGlub2RlKTsKPj4gKyAgICAgICBmMmZzX2Rvd25fcmVhZCgmRjJGU19JKGlub2Rl
KS0+aV9zZW0pOwo+PiArICAgICAgIG9wZW5lZCA9IGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBG
SV9PUEVORURfRklMRSk7Cj4+ICsgICAgICAgZjJmc191cF9yZWFkKCZGMkZTX0koaW5vZGUpLT5p
X3NlbSk7Cj4gSGkgQ2hhbywKPiBGMkZTX0koaW5vZGUpLT5pX3NlbSBpcyBub3QgbmVlZGVkIGZv
ciB0aGlzIGp1ZGdtZW50IEZJX09QRU5FRF9GSUxFIGFyZWE/Cj4gYmVjYXVzZSBpbm9kZV9sb2Nr
IGhhcyBiZWVuIGhvbGQgYW5kIHRoaXMgaXMgYSB3cml0ZSBsb2NrLCBpZiBwcm9jZXNzCj4gQSBn
ZXQgaW5vZGVfbG9jaywKPiBvdGhlciBwcm9jY2Vzc2VzIHdpbGwgYmUgYmxvY2tlZCBpbm9kZV9s
b2NrIHVudGlsIGlub2RlX3VubG9jayB3aXRoCj4gRklfT1BFTkVEX0ZJTEUgIGJlZW4gc2V0Pwo+
IGhvdyBkbyB5b3UgdGhpbms/CgpaaGlndW8sCgpBZ3JlZWQsIGxldCBtZSB1cGRhdGUgaXQuIFRo
YW5rIHlvdS4KClRoYW5rcywKCj4gdGhhbmtz77yBCj4+ICsgICAgICAgaWYgKG9wZW5lZCkKPj4g
KyAgICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9jazsKPj4gKwo+PiArICAgICAgIGlmICghZmls
ZV9zaG91bGRfdHJ1bmNhdGUoaW5vZGUpKQo+PiArICAgICAgICAgICAgICAgZ290byBvdXRfdXBk
YXRlOwo+Pgo+PiAgICAgICAgIGYyZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19y
d3NlbVtXUklURV0pOwo+PiAgICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5p
X21hcHBpbmcpOwo+PiBAQCAtNTc2LDE2ICs1ODEsMTcgQEAgc3RhdGljIGludCBmaW5pc2hfcHJl
YWxsb2NhdGVfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Cj4+ICAgICAgICAgZmlsZW1h
cF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKPj4gICAgICAgICBmMmZzX3Vw
X3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4+IC0KPj4gLSAgICAg
ICBpZiAoIXJldCkKPj4gLSAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9P
UEVORURfRklMRSk7Cj4+IC0KPj4gLSAgICAgICBpbm9kZV91bmxvY2soaW5vZGUpOwo+PiAgICAg
ICAgIGlmIChyZXQpCj4+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiArICAgICAgICAg
ICAgICAgZ290byBvdXRfdW5sb2NrOwo+Pgo+PiAgICAgICAgIGZpbGVfZG9udF90cnVuY2F0ZShp
bm9kZSk7Cj4+IC0gICAgICAgcmV0dXJuIDA7Cj4+ICtvdXRfdXBkYXRlOgo+PiArICAgICAgIGYy
ZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9zZW0pOwo+PiArICAgICAgIHNldF9pbm9k
ZV9mbGFnKGlub2RlLCBGSV9PUEVORURfRklMRSk7Cj4+ICsgICAgICAgZjJmc191cF93cml0ZSgm
RjJGU19JKGlub2RlKS0+aV9zZW0pOwo+PiArb3V0X3VubG9jazoKPj4gKyAgICAgICBpbm9kZV91
bmxvY2soaW5vZGUpOwo+PiArICAgICAgIHJldHVybiByZXQ7Cj4+ICB9Cj4+Cj4+ICBzdGF0aWMg
aW50IGYyZnNfZmlsZV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxw
KQo+PiAtLQo+PiAyLjQ4LjEKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
