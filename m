Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41A85F02D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 04:51:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rd07F-0007ko-42;
	Thu, 22 Feb 2024 03:51:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rd07D-0007kh-3u
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 03:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJY79D8M1SCoCxDQDU82IOlMUxEszgYij44uwT/4mVw=; b=PofvH8XLZwqOViqyPADXC+vYGa
 j3BBTqFSeHrmOBpS9O68HSRcmnmjNdoc+uHUqdvqJniC/t9jAeAWOmi8k7vERjuajeM/KvtrsCIOF
 4Q1lLXHuIH1lu3+SekfIXss1clJI1Q9qEtOQysGkIJYq7+9Y6I+E1kGu9DUDHaKMF6H8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJY79D8M1SCoCxDQDU82IOlMUxEszgYij44uwT/4mVw=; b=PKcI/EWHUq3Bwq9AdPVXxfpmLH
 qd5oEpZTnY7u49bcKSWTFLK61vmMbmflnONTqvkeR1mrMOb47CwoCMbJfS0E9jXJGxCBPGdfOF8z5
 P+goRCeYd6qS2HYCN5wc4SuBPSFcoYHqrwl7r1sCQ70WZFN1m6FY7vGrw5ni91dg/pqU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rd077-0000qA-C8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 03:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ADBBFCE20B7;
 Thu, 22 Feb 2024 03:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12172C433C7;
 Thu, 22 Feb 2024 03:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708573862;
 bh=AmuEmjS5wBqNkgpz1y48vQc7UX9xpoy7av58HWxwi4g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hgxftMf3qeKrempOip8cL2/wXV7Qe0jKIMhcyAMmARCfJBqkTlYH7pfkD6F/QEDTZ
 2P0ENRO11mjnDNpCv7hBGSawqvMBUrKwIvKAyo8lWWM1ybhvBEaAxO17MqZhTpa5s8
 p4M1UQxwr01Lyoo4Uq20z67ck3iuY3rBdOeZyv+q33OuN679bVcPNzASn9v8iNGGta
 uZq3IHdkZiDV/rOlrAxoIpn+TDNnHXI7kWqvZLTjHfXKS5A0y2ZupIrqsVtIe3TzlI
 02OEpLQLbaRfGSfvs/CNkUNZ5ABrzh6snjKoCgdgR9X5wQp4Gt7agAOY/qc7C/+elu
 HdnajIsAvdc4w==
Message-ID: <c0adebd6-8aa3-4704-b429-a14775ed2dcb@kernel.org>
Date: Thu, 22 Feb 2024 11:50:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1708409484-27326-1-git-send-email-zhiguo.niu@unisoc.com>
 <c2ab9d88-b947-42e5-a1a2-204d58e0c1a8@kernel.org>
 <CAHJ8P3+LGb7pQyLVjsxYvLHgO87Wn41VRhVZ_kkvcdqC8y=5Lg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+LGb7pQyLVjsxYvLHgO87Wn41VRhVZ_kkvcdqC8y=5Lg@mail.gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/2/22 10:15, Zhiguo Niu wrote: > > > On Thu, Feb 22,
    2024 at 9:37 AM Chao Yu <chao@kernel.org <mailto:chao@kernel.org>> wrote:
    > > On 2024/2/20 14:11, Zhiguo Niu wrote: > > There is low proba [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rd077-0000qA-C8
Subject: Re: [f2fs-dev] [PATCH v4 4/4] f2fs: stop checkpoint when get a
 out-of-bounds segment
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
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8yLzIyIDEwOjE1LCBaaGlndW8gTml1IHdyb3RlOgo+IAo+IAo+IE9uIFRodSwgRmVi
IDIyLCAyMDI0IGF0IDk6MzfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmcgPG1haWx0bzpj
aGFvQGtlcm5lbC5vcmc+PiB3cm90ZToKPiAKPiAgICAgT24gMjAyNC8yLzIwIDE0OjExLCBaaGln
dW8gTml1IHdyb3RlOgo+ICAgICAgPiBUaGVyZSBpcyBsb3cgcHJvYmFiaWxpdHkgdGhhdCBhbiBv
dXQtb2YtYm91bmRzIHNlZ21lbnQgd2lsbCBiZSBnb3QKPiAgICAgID4gb24gYSBzbWFsbC1jYXBh
Y2l0eSBkZXZpY2UuIEluIG9yZGVyIHRvIHByZXZlbnQgc3Vic2VxdWVudCB3cml0ZSByZXF1ZXN0
cwo+ICAgICAgPiBhbGxvY2F0aW5nIGJsb2NrIGFkZHJlc3MgZnJvbSB0aGlzIGludmFsaWQgc2Vn
bWVudCwgd2hpY2ggbWF5IGNhdXNlCj4gICAgICA+IHVuZXhwZWN0ZWQgaXNzdWUsIHN0b3AgY2hl
Y2twb2ludCBzaG91bGQgYmUgcGVyZm9ybWVkLgo+ICAgICAgPgo+ICAgICAgPiBBbHNvIGludHJv
ZHVjZSBhIG5ldyBzdG9wIGNwIHJlYXNvbjogU1RPUF9DUF9SRUFTT05fTk9fU0VHTUVOVC4KPiAg
ICAgID4KPiAgICAgID4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlz
b2MuY29tIDxtYWlsdG86emhpZ3VvLm5pdUB1bmlzb2MuY29tPj4KPiAgICAgID4gLS0tCj4gICAg
ICA+IGNoYW5nZXMgb2YgdjQ6IHVzZSBtb3JlIHN1aXRhYmxlIE1BQ1JPIG5hbWUgYWNjb3JkaW5n
IHRvIENoYW8ncyBzdWdnZXN0aW9ucwo+ICAgICAgPiBjaGFuZ2VzIG9mIHYzOiBjb3JyZWN0IE1B
Q1JPIHNwZWxsaW5nIGFuZCB1cGRhdGUgYmFzZWQgb24gdGhlIGxhc3RlcyBjb2RlCj4gICAgICA+
IC0tLQo+ICAgICAgPiAtLS0KPiAgICAgID7CoCDCoGZzL2YyZnMvc2VnbWVudC5jwqAgwqAgwqAg
wqB8IDcgKysrKysrLQo+ICAgICAgPsKgIMKgaW5jbHVkZS9saW51eC9mMmZzX2ZzLmggfCAxICsK
PiAgICAgID7CoCDCoDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gICAgICA+Cj4gICAgICA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2Zz
L2YyZnMvc2VnbWVudC5jCj4gICAgICA+IGluZGV4IGMyNWFhZWMuLmU0MmUzNGMgMTAwNjQ0Cj4g
ICAgICA+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gICAgICA+ICsrKyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gICAgICA+IEBAIC0yNjY1LDcgKzI2NjUsMTIgQEAgc3RhdGljIHZvaWQgZ2V0X25l
d19zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgICAgID7CoCDCoCDCoCDCoGlm
IChzZWNubyA+PSBNQUlOX1NFQ1Moc2JpKSkgewo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc2Vjbm8gPSBmaW5kX2ZpcnN0X3plcm9fYml0KGZyZWVfaS0+ZnJlZV9zZWNtYXAsCj4gICAg
ICA+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNQUlOX1NFQ1Moc2JpKSk7Cj4gICAgICA+IC3C
oCDCoCDCoCDCoCDCoCDCoCDCoGYyZnNfYnVnX29uKHNiaSwgc2Vjbm8gPj0gTUFJTl9TRUNTKHNi
aSkpOwo+ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoc2Vjbm8gPj0gTUFJTl9TRUNT
KHNiaSkpIHsKPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZjJmc19z
dG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwKPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU1RPUF9DUF9SRUFTT05fTk9fU0VHTUVOVCk7Cj4gCj4g
ICAgIFdlIHNob3VsZCByZWxvY2F0ZSBzdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgU1RPUF9D
UF9SRUFTT05fTk9fU0VHTUVOVCkgb3V0c2lkZQo+ICAgICBzZWdtYXBfbG9jayBzcGlubG9jaywg
ZHVlIHRvIGl0IG1heSBzbGVlcCBpbiBmMmZzX2ZsdXNoX21lcmdlZF93cml0ZXMoKS4KPiAKPiBJ
bmRlZWQgaXQgaXMuIEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGZpeD8KPiBAQCAtMjY2NSwxMSAr
MjY2NSw3IEBAIHN0YXRpYyB2b2lkIGdldF9uZXdfc2VnbWVudChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksCj4gIMKgIMKgIMKgIMKgIGlmIChzZWNubyA+PSBNQUlOX1NFQ1Moc2JpKSkgewo+ICDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzZWNubyA9IGZpbmRfZmlyc3RfemVyb19iaXQoZnJlZV9p
LT5mcmVlX3NlY21hcCwKPiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgTUFJTl9TRUNTKHNi
aSkpOwo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHNlY25vID49IE1BSU5fU0VDUyhzYmkp
KSB7Cj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmMmZzX3N0b3BfY2hlY2tw
b2ludChzYmksIGZhbHNlLAo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgU1RPUF9DUF9SRUFTT05fTk9fU0VHTUVOVCk7Cj4gLSDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBmMmZzX2J1Z19vbihzYmksIDEpOwo+IC0gwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfQo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZjJmc19idWdfb24oc2JpLCBzZWNubyA+
PSBNQUlOX1NFQ1Moc2JpKSk7Cj4gIMKgIMKgIMKgIMKgIH0KPiAgwqAgwqAgwqAgwqAgc2Vnbm8g
PSBHRVRfU0VHX0ZST01fU0VDKHNiaSwgc2Vjbm8pOwo+ICDCoCDCoCDCoCDCoCB6b25lbm8gPSBH
RVRfWk9ORV9GUk9NX1NFQyhzYmksIHNlY25vKTsKPiBAQCAtMjcwMCw2ICsyNjk2LDggQEAgc3Rh
dGljIHZvaWQgZ2V0X25ld19zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgwqAg
wqAgwqAgwqAgX19zZXRfaW51c2Uoc2JpLCBzZWdubyk7Cj4gIMKgIMKgIMKgIMKgICpuZXdzZWcg
PSBzZWdubzsKPiAgwqAgwqAgwqAgwqAgc3Bpbl91bmxvY2soJmZyZWVfaS0+c2VnbWFwX2xvY2sp
Owo+ICsgwqAgwqAgwqAgaWYgKHNlY25vID49IE1BSU5fU0VDUyhzYmkpKQo+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgU1RPUF9DUF9SRUFT
T05fTk9fU0VHTUVOVCk7CgpIb3cgYWJvdXQgdGhpcz8KCi0tLQogIGZzL2YyZnMvc2VnbWVudC5j
IHwgMTIgKysrKysrKysrLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCmluZGV4IGQwMjA5ZWE3N2RkMi4uOGVkYzQyMDcxZTZmIDEwMDY0NAotLS0gYS9mcy9m
MmZzL3NlZ21lbnQuYworKysgYi9mcy9mMmZzL3NlZ21lbnQuYwpAQCAtMjY0Niw2ICsyNjQ2LDcg
QEAgc3RhdGljIHZvaWQgZ2V0X25ld19zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
ICAJdW5zaWduZWQgaW50IG9sZF96b25lbm8gPSBHRVRfWk9ORV9GUk9NX1NFRyhzYmksICpuZXdz
ZWcpOwogIAlib29sIGluaXQgPSB0cnVlOwogIAlpbnQgaTsKKwlpbnQgcmV0ID0gMDsKCiAgCXNw
aW5fbG9jaygmZnJlZV9pLT5zZWdtYXBfbG9jayk7CgpAQCAtMjY3MSw5ICsyNjcyLDggQEAgc3Rh
dGljIHZvaWQgZ2V0X25ld19zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKICAJCXNl
Y25vID0gZmluZF9maXJzdF96ZXJvX2JpdChmcmVlX2ktPmZyZWVfc2VjbWFwLAogIAkJCQkJCQlN
QUlOX1NFQ1Moc2JpKSk7CiAgCQlpZiAoc2Vjbm8gPj0gTUFJTl9TRUNTKHNiaSkpIHsKLQkJCWYy
ZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsCi0JCQkJU1RPUF9DUF9SRUFTT05fTk9fU0VH
TUVOVCk7Ci0JCQlmMmZzX2J1Z19vbihzYmksIDEpOworCQkJcmV0ID0gLUVOT1NQQzsKKwkJCWdv
dG8gb3V0X3VubG9jazsKICAJCX0KICAJfQogIAlzZWdubyA9IEdFVF9TRUdfRlJPTV9TRUMoc2Jp
LCBzZWNubyk7CkBAIC0yNzA0LDcgKzI3MDQsMTMgQEAgc3RhdGljIHZvaWQgZ2V0X25ld19zZWdt
ZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKICAJZjJmc19idWdfb24oc2JpLCB0ZXN0X2Jp
dChzZWdubywgZnJlZV9pLT5mcmVlX3NlZ21hcCkpOwogIAlfX3NldF9pbnVzZShzYmksIHNlZ25v
KTsKICAJKm5ld3NlZyA9IHNlZ25vOworb3V0X3VubG9jazoKICAJc3Bpbl91bmxvY2soJmZyZWVf
aS0+c2VnbWFwX2xvY2spOworCisJaWYgKHJldCkgeworCQlmMmZzX3N0b3BfY2hlY2twb2ludChz
YmksIGZhbHNlLCBTVE9QX0NQX1JFQVNPTl9OT19TRUdNRU5UKTsKKwkJZjJmc19idWdfb24oc2Jp
LCAxKTsKKwl9CiAgfQoKICBzdGF0aWMgdm9pZCByZXNldF9jdXJzZWcoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBpbnQgdHlwZSwgaW50IG1vZGlmaWVkKQotLSAKMi40MC4xCgo+IAo+ICAgICBU
aGFua3MsCj4gCj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGYyZnNf
YnVnX29uKHNiaSwgMSk7Cj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH0KPiAgICAgID4g
Kwo+ICAgICAgPsKgIMKgIMKgIMKgfQo+ICAgICAgPsKgIMKgIMKgIMKgc2Vnbm8gPSBHRVRfU0VH
X0ZST01fU0VDKHNiaSwgc2Vjbm8pOwo+ICAgICAgPsKgIMKgIMKgIMKgem9uZW5vID0gR0VUX1pP
TkVfRlJPTV9TRUMoc2JpLCBzZWNubyk7Cj4gICAgICA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2YyZnNfZnMuaCBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4gICAgICA+IGluZGV4IDli
NjljNTAuLjc1NWU5YTQgMTAwNjQ0Cj4gICAgICA+IC0tLSBhL2luY2x1ZGUvbGludXgvZjJmc19m
cy5oCj4gICAgICA+ICsrKyBiL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4gICAgICA+IEBAIC03
NSw2ICs3NSw3IEBAIGVudW0gc3RvcF9jcF9yZWFzb24gewo+ICAgICAgPsKgIMKgIMKgIMKgU1RP
UF9DUF9SRUFTT05fQ09SUlVQVEVEX1NVTU1BUlksCj4gICAgICA+wqAgwqAgwqAgwqBTVE9QX0NQ
X1JFQVNPTl9VUERBVEVfSU5PREUsCj4gICAgICA+wqAgwqAgwqAgwqBTVE9QX0NQX1JFQVNPTl9G
TFVTSF9GQUlMLAo+ICAgICAgPiArwqAgwqAgwqBTVE9QX0NQX1JFQVNPTl9OT19TRUdNRU5ULAo+
ICAgICAgPsKgIMKgIMKgIMKgU1RPUF9DUF9SRUFTT05fTUFYLAo+ICAgICAgPsKgIMKgfTsKPiAg
ICAgID4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
