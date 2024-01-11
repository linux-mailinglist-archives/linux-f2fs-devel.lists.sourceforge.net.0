Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D882A58A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 02:26:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNjqD-0002DR-0V;
	Thu, 11 Jan 2024 01:26:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNjqB-0002DL-Hd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 01:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MfUr0p0eCPq9Mz+6tHI+M7YmY+VNgecUPZj/d/72S3E=; b=gkcSQlKf8XEZ8IIHXf2TerlP4g
 6X+Du8f/iviQq937Y6/UX3MNUsJRf3hauP+z4GyEiF1NcBaT0nB9/LquCeA03w6DIOeQVMh9fUb82
 3hBDnsPw4cX1aRU07jzL1JWLv2VWlj8SCipFlsw1uEfoAvUzPLKgdpQ+T9I3xvdSiwp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MfUr0p0eCPq9Mz+6tHI+M7YmY+VNgecUPZj/d/72S3E=; b=F9EBF00BSRZgZCPZa1IsBVakU0
 YW0N4TlI7kDcy6D3kmzdCsqJhuAZghq6IX6/dfp1jg7+6uqELB+yhLThwZFFS6fDxWIwWEhGLbFGA
 DEg+YNtljOGteV76qRAXgy/rcbnF7ynrIPhZVwzcU/+GKB44x2/bLqHWfMEygschv2Ig=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNjqA-0002bk-Ey for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 01:26:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E59BAB81E59;
 Thu, 11 Jan 2024 01:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BC2C433C7;
 Thu, 11 Jan 2024 01:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704936388;
 bh=5R41srxwELgpcVkdWas/ZAU8OawuQEn8G6bkikiGVnU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DcJQ9/Ckit2VZ2a96ohX0Wrz0cYJKkmSK8D2FMQVNEVyPeg7YzVhsIIKj+xIA/l3z
 ljREURXvQzyKmC3YPNMR3NzDhlOjLYkszJMCH5N5QVJmng1zJsu/3WLly5GIVPsRbt
 Syd+ZZRjXw1TxolfmgVKcrHbaRh72yCnq1IJ+TSqcHIjSfckOruoRRc5ukbsoMFFAU
 3Uan/l8HaxyiBvcyJuw77NRxQdNqC1j9rGN1q9GUQIImFX2epfyMGXxFCA/2t++WI+
 zt1PWYVEa10y3Pr+kCDazn6qLlEFchgDhkfq36xyxzPBhkKs1Uvluy4kxHQbWK1fZS
 fC7xRKLaMP91w==
Message-ID: <dcefc352-d528-41e3-bc7a-5cb388f43240@kernel.org>
Date: Thu, 11 Jan 2024 09:26:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20231228143152.1543509-1-chao@kernel.org>
 <CACOAw_xXGUt=2JJgq5yfW5ZG7EfZMm1iNTVxvfA9FoJVDwbH_A@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CACOAw_xXGUt=2JJgq5yfW5ZG7EfZMm1iNTVxvfA9FoJVDwbH_A@mail.gmail.com>
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/1/11 8:55, Daeho Jeong wrote: > On Thu, Dec 28, 2023
    at 6:33 AM Chao Yu <chao@kernel.org> wrote: >> >> If data block in compressed
    cluster is not persisted with metadata >> during checkpoint [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNjqA-0002bk-Ey
Subject: Re: [f2fs-dev] [PATCH v3 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xLzExIDg6NTUsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFRodSwgRGVjIDI4LCAy
MDIzIGF0IDY6MzPigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBJ
ZiBkYXRhIGJsb2NrIGluIGNvbXByZXNzZWQgY2x1c3RlciBpcyBub3QgcGVyc2lzdGVkIHdpdGgg
bWV0YWRhdGEKPj4gZHVyaW5nIGNoZWNrcG9pbnQsIGFmdGVyIFNQT1IsIHRoZSBkYXRhIG1heSBi
ZSBjb3JydXB0ZWQsIGxldCdzCj4+IGd1YXJhbnRlZSB0byB3cml0ZSBjb21wcmVzc2VkIHBhZ2Ug
YnkgY2hlY2twb2ludC4KPj4KPj4gRml4ZXM6IDRjOGZmNzA5NWJlZiAoImYyZnM6IHN1cHBvcnQg
ZGF0YSBjb21wcmVzc2lvbiIpCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KPj4gLS0tCj4+IHYzOgo+PiAtIHRyZWF0IGNvbXByZXNzZWQgcGFnZSBhcyBDUCBndWFy
YW50ZWVkIGRhdGEgZXhwbGljdGx5Lgo+PiAgIGZzL2YyZnMvY29tcHJlc3MuYyB8ICA0ICsrKy0K
Pj4gICBmcy9mMmZzL2RhdGEuYyAgICAgfCAxNyArKysrKysrKystLS0tLS0tLQo+PiAgIGZzL2Yy
ZnMvZjJmcy5oICAgICB8ICA0ICsrKy0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVz
cy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+IGluZGV4IGM1YTQzNjRjNDQ4Mi4uOTk0MGI3ODg2
ZTVkIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPj4gKysrIGIvZnMvZjJmcy9j
b21wcmVzcy5jCj4+IEBAIC0xNDE4LDYgKzE0MTgsOCBAQCB2b2lkIGYyZnNfY29tcHJlc3Nfd3Jp
dGVfZW5kX2lvKHN0cnVjdCBiaW8gKmJpbywgc3RydWN0IHBhZ2UgKnBhZ2UpCj4+ICAgICAgICAg
IHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IGJpby0+YmlfcHJpdmF0ZTsKPj4gICAgICAgICAg
c3RydWN0IGNvbXByZXNzX2lvX2N0eCAqY2ljID0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IChzdHJ1Y3QgY29tcHJlc3NfaW9fY3R4ICopcGFnZV9wcml2YXRlKHBhZ2UpOwo+PiArICAgICAg
IGVudW0gY291bnRfdHlwZSB0eXBlID0gV0JfREFUQV9UWVBFKHBhZ2UsCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZjJmc19pc19jb21wcmVzc2VkX3BhZ2UocGFnZSkpOwo+PiAg
ICAgICAgICBpbnQgaTsKPj4KPj4gICAgICAgICAgaWYgKHVubGlrZWx5KGJpby0+Ymlfc3RhdHVz
KSkKPj4gQEAgLTE0MjUsNyArMTQyNyw3IEBAIHZvaWQgZjJmc19jb21wcmVzc193cml0ZV9lbmRf
aW8oc3RydWN0IGJpbyAqYmlvLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4KPj4gICAgICAgICAgZjJm
c19jb21wcmVzc19mcmVlX3BhZ2UocGFnZSk7Cj4+Cj4+IC0gICAgICAgZGVjX3BhZ2VfY291bnQo
c2JpLCBGMkZTX1dCX0RBVEEpOwo+PiArICAgICAgIGRlY19wYWdlX2NvdW50KHNiaSwgdHlwZSk7
Cj4+Cj4+ICAgICAgICAgIGlmIChhdG9taWNfZGVjX3JldHVybigmY2ljLT5wZW5kaW5nX3BhZ2Vz
KSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm47Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Rh
dGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+IGluZGV4IGRjZThkZWZkZjRjNy4uODFmOWUyY2M0OWUy
IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+
PiBAQCAtNDgsNyArNDgsNyBAQCB2b2lkIGYyZnNfZGVzdHJveV9iaW9zZXQodm9pZCkKPj4gICAg
ICAgICAgYmlvc2V0X2V4aXQoJmYyZnNfYmlvc2V0KTsKPj4gICB9Cj4+Cj4+IC1zdGF0aWMgYm9v
bCBfX2lzX2NwX2d1YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4+ICtib29sIGYyZnNfaXNf
Y3BfZ3VhcmFudGVlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4gICB7Cj4+ICAgICAgICAgIHN0cnVj
dCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gcGFnZS0+bWFwcGluZzsKPj4gICAgICAgICAgc3Ry
dWN0IGlub2RlICppbm9kZTsKPj4gQEAgLTY1LDggKzY1LDYgQEAgc3RhdGljIGJvb2wgX19pc19j
cF9ndWFyYW50ZWVkKHN0cnVjdCBwYWdlICpwYWdlKQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgU19JU0RJUihpbm9kZS0+aV9tb2RlKSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPj4KPj4gLSAgICAgICBpZiAoZjJmc19pc19jb21wcmVzc2VkX3BhZ2UocGFnZSkpCj4+IC0g
ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gCj4gT3V0IG9mIGN1cmlvc2l0eSwgd2h5IGRv
bid0IHdlIHNpbXBseSBjaGFuZ2UgdGhlIGFib3ZlIHRvICJyZXR1cm4gdHJ1ZSI/CgpEYWVobywK
CkkgdXNlZCB0aGUgaW1wbGVtZW50YXRpb24sIHBsZWFzZSBjaGVjayB2MSBhbmQgcmVsYXRlZCBj
b21tZW50cwpmcm9tIEphZWdldWsgYW5kIG1lLCBsZXQgbWUga25vdyBpZiB0aGF0IHdhcyBub3Qg
Y2xlYXIgZW5vdWdoLiA6KQoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZl
bC9hYWU2NTRlNy04YTdlLTQ3OGQtOWY1YS02NTgwN2EwZTAzNDNAa2VybmVsLm9yZy8KCj4gCj4+
ICAgICAgICAgIGlmICgoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSAmJiBJU19OT1FVT1RBKGlub2Rl
KSkgfHwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2VfcHJpdmF0ZV9nY2luZyhwYWdl
KSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gQEAgLTMzOCw3ICszMzYsNyBA
QCBzdGF0aWMgdm9pZCBmMmZzX3dyaXRlX2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8pCj4+Cj4+ICAg
ICAgICAgIGJpb19mb3JfZWFjaF9zZWdtZW50X2FsbChidmVjLCBiaW8sIGl0ZXJfYWxsKSB7Cj4+
ICAgICAgICAgICAgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBidmVjLT5idl9wYWdlOwo+PiAt
ICAgICAgICAgICAgICAgZW51bSBjb3VudF90eXBlIHR5cGUgPSBXQl9EQVRBX1RZUEUocGFnZSk7
Cj4+ICsgICAgICAgICAgICAgICBlbnVtIGNvdW50X3R5cGUgdHlwZSA9IFdCX0RBVEFfVFlQRShw
YWdlLCBmYWxzZSk7Cj4+Cj4+ICAgICAgICAgICAgICAgICAgaWYgKHBhZ2VfcHJpdmF0ZV9kdW1t
eShwYWdlKSkgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfcGFnZV9wcml2YXRl
X2R1bW15KHBhZ2UpOwo+PiBAQCAtNzYyLDcgKzc2MCw3IEBAIGludCBmMmZzX3N1Ym1pdF9wYWdl
X2JpbyhzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4+ICAgICAgICAgICAgICAgICAgd2JjX2Fj
Y291bnRfY2dyb3VwX293bmVyKGZpby0+aW9fd2JjLCBmaW8tPnBhZ2UsIFBBR0VfU0laRSk7Cj4+
Cj4+ICAgICAgICAgIGluY19wYWdlX2NvdW50KGZpby0+c2JpLCBpc19yZWFkX2lvKGZpby0+b3Ap
ID8KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgX19yZWFkX2lvX3R5cGUocGFnZSkgOiBXQl9E
QVRBX1RZUEUoZmlvLT5wYWdlKSk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fcmVhZF9p
b190eXBlKHBhZ2UpIDogV0JfREFUQV9UWVBFKGZpby0+cGFnZSwgZmFsc2UpKTsKPj4KPj4gICAg
ICAgICAgaWYgKGlzX3JlYWRfaW8oYmlvX29wKGJpbykpKQo+PiAgICAgICAgICAgICAgICAgIGYy
ZnNfc3VibWl0X3JlYWRfYmlvKGZpby0+c2JpLCBiaW8sIGZpby0+dHlwZSk7Cj4+IEBAIC05NzMs
NyArOTcxLDcgQEAgaW50IGYyZnNfbWVyZ2VfcGFnZV9iaW8oc3RydWN0IGYyZnNfaW9faW5mbyAq
ZmlvKQo+PiAgICAgICAgICBpZiAoZmlvLT5pb193YmMpCj4+ICAgICAgICAgICAgICAgICAgd2Jj
X2FjY291bnRfY2dyb3VwX293bmVyKGZpby0+aW9fd2JjLCBmaW8tPnBhZ2UsIFBBR0VfU0laRSk7
Cj4+Cj4+IC0gICAgICAgaW5jX3BhZ2VfY291bnQoZmlvLT5zYmksIFdCX0RBVEFfVFlQRShwYWdl
KSk7Cj4+ICsgICAgICAgaW5jX3BhZ2VfY291bnQoZmlvLT5zYmksIFdCX0RBVEFfVFlQRShwYWdl
LCBmYWxzZSkpOwo+Pgo+PiAgICAgICAgICAqZmlvLT5sYXN0X2Jsb2NrID0gZmlvLT5uZXdfYmxr
YWRkcjsKPj4gICAgICAgICAgKmZpby0+YmlvID0gYmlvOwo+PiBAQCAtMTAwNyw2ICsxMDA1LDcg
QEAgdm9pZCBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykK
Pj4gICAgICAgICAgZW51bSBwYWdlX3R5cGUgYnR5cGUgPSBQQUdFX1RZUEVfT0ZfQklPKGZpby0+
dHlwZSk7Cj4+ICAgICAgICAgIHN0cnVjdCBmMmZzX2Jpb19pbmZvICppbyA9IHNiaS0+d3JpdGVf
aW9bYnR5cGVdICsgZmlvLT50ZW1wOwo+PiAgICAgICAgICBzdHJ1Y3QgcGFnZSAqYmlvX3BhZ2U7
Cj4+ICsgICAgICAgZW51bSBjb3VudF90eXBlIHR5cGU7Cj4+Cj4+ICAgICAgICAgIGYyZnNfYnVn
X29uKHNiaSwgaXNfcmVhZF9pbyhmaW8tPm9wKSk7Cj4+Cj4+IEBAIC0xMDQ2LDcgKzEwNDUsOCBA
QCB2b2lkIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+
PiAgICAgICAgICAvKiBzZXQgc3VibWl0dGVkID0gdHJ1ZSBhcyBhIHJldHVybiB2YWx1ZSAqLwo+
PiAgICAgICAgICBmaW8tPnN1Ym1pdHRlZCA9IDE7Cj4+Cj4+IC0gICAgICAgaW5jX3BhZ2VfY291
bnQoc2JpLCBXQl9EQVRBX1RZUEUoYmlvX3BhZ2UpKTsKPj4gKyAgICAgICB0eXBlID0gV0JfREFU
QV9UWVBFKGJpb19wYWdlLCBmaW8tPmNvbXByZXNzZWRfcGFnZSk7Cj4+ICsgICAgICAgaW5jX3Bh
Z2VfY291bnQoc2JpLCB0eXBlKTsKPj4KPj4gICAgICAgICAgaWYgKGlvLT5iaW8gJiYKPj4gICAg
ICAgICAgICAgICghaW9faXNfbWVyZ2VhYmxlKHNiaSwgaW8tPmJpbywgaW8sIGZpbywgaW8tPmxh
c3RfYmxvY2tfaW5fYmlvLAo+PiBAQCAtMTA1OSw3ICsxMDU5LDggQEAgdm9pZCBmMmZzX3N1Ym1p
dF9wYWdlX3dyaXRlKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPj4gICAgICAgICAgICAgICAg
ICBpZiAoRjJGU19JT19BTElHTkVEKHNiaSkgJiYKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGZpby0+dHlwZSA9PSBEQVRBIHx8IGZpby0+dHlwZSA9PSBOT0RFKSAmJgo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaW8tPm5ld19ibGthZGRyICYgRjJGU19J
T19TSVpFX01BU0soc2JpKSkgewo+PiAtICAgICAgICAgICAgICAgICAgICAgICBkZWNfcGFnZV9j
b3VudChzYmksIFdCX0RBVEFfVFlQRShiaW9fcGFnZSkpOwo+PiArICAgICAgICAgICAgICAgICAg
ICAgICBkZWNfcGFnZV9jb3VudChzYmksIFdCX0RBVEFfVFlQRShiaW9fcGFnZSwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlvLT5jb21wcmVzc2Vk
X3BhZ2UpKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGZpby0+cmV0cnkgPSAxOwo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBza2lwOwo+PiAgICAgICAgICAgICAgICAgIH0K
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4gaW5kZXgg
NjUyOTRlM2IwYmVmLi41MGYzZDU0NmRlZDggMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5o
Cj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+IEBAIC0xMDgwLDcgKzEwODAsOCBAQCBzdHJ1Y3Qg
ZjJmc19zbV9pbmZvIHsKPj4gICAgKiBmMmZzIG1vbml0b3JzIHRoZSBudW1iZXIgb2Ygc2V2ZXJh
bCBibG9jayB0eXBlcyBzdWNoIGFzIG9uLXdyaXRlYmFjaywKPj4gICAgKiBkaXJ0eSBkZW50cnkg
YmxvY2tzLCBkaXJ0eSBub2RlIGJsb2NrcywgYW5kIGRpcnR5IG1ldGEgYmxvY2tzLgo+PiAgICAq
Lwo+PiAtI2RlZmluZSBXQl9EQVRBX1RZUEUocCkgICAgICAgIChfX2lzX2NwX2d1YXJhbnRlZWQo
cCkgPyBGMkZTX1dCX0NQX0RBVEEgOiBGMkZTX1dCX0RBVEEpCj4+ICsjZGVmaW5lIFdCX0RBVEFf
VFlQRShwLCBmKSAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAoZiB8fCBmMmZzX2lz
X2NwX2d1YXJhbnRlZWQocCkgPyBGMkZTX1dCX0NQX0RBVEEgOiBGMkZTX1dCX0RBVEEpCj4+ICAg
ZW51bSBjb3VudF90eXBlIHsKPj4gICAgICAgICAgRjJGU19ESVJUWV9ERU5UUywKPj4gICAgICAg
ICAgRjJGU19ESVJUWV9EQVRBLAo+PiBAQCAtMzgwNCw2ICszODA1LDcgQEAgdm9pZCBmMmZzX2lu
aXRfY2twdF9yZXFfY29udHJvbChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+PiAgICAqLwo+
PiAgIGludCBfX2luaXQgZjJmc19pbml0X2Jpb3NldCh2b2lkKTsKPj4gICB2b2lkIGYyZnNfZGVz
dHJveV9iaW9zZXQodm9pZCk7Cj4+ICtib29sIGYyZnNfaXNfY3BfZ3VhcmFudGVlZChzdHJ1Y3Qg
cGFnZSAqcGFnZSk7Cj4+ICAgaW50IGYyZnNfaW5pdF9iaW9fZW50cnlfY2FjaGUodm9pZCk7Cj4+
ICAgdm9pZCBmMmZzX2Rlc3Ryb3lfYmlvX2VudHJ5X2NhY2hlKHZvaWQpOwo+PiAgIHZvaWQgZjJm
c19zdWJtaXRfcmVhZF9iaW8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgYmlvICpi
aW8sCj4+IC0tCj4+IDIuNDAuMQo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
