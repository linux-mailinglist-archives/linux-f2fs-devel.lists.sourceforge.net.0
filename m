Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E1485B450
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 08:58:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcL1C-0007fZ-5R;
	Tue, 20 Feb 2024 07:58:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcL16-0007fR-PA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vd5DUm3oLPeYvExyKrLEOYIzybYkrU2C3ctnd34PWyM=; b=XRNwW2z1BqDFrtUZsocnXINxZj
 0kJKNLHnz/tTVYleR7/xsJYYP76j2seVqUUPkdjte3Rej6uZCg5H/0goFaMHBggcL7lI0zOvuSPxU
 bUT8MbJSYEGZKt206UBfSM59Z9IrhfAne/r6ZX49L1smaTcNVEdAxbWEa9Yxgwk1Yib4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vd5DUm3oLPeYvExyKrLEOYIzybYkrU2C3ctnd34PWyM=; b=If9RVa3OB0i7BwkX00qdezrQhZ
 dxFA6iOUresPZ7cjGU+TFwxzzP79qPk7q/96aHvOOHEKc/mtG9eFRze9iNHsvdBOZ9sgiXbYw1Ytt
 m/B6DfxBZ9pyQXpLz5gqBrommu/W1aUMS3eKPj6zJQCIWrvA2y6/v4IVDI/m5NTo1iCE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcL14-0000UM-Nk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A280C60FF1;
 Tue, 20 Feb 2024 07:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609A0C433C7;
 Tue, 20 Feb 2024 07:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708415885;
 bh=SKdSzd9Om3ss7aelGSZx7GlrCUSOV8sg/VeHoK4NhKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XwJcZBhjVpfemPFNDSUdBoAOjVkwklq3JUgMim0sXvHVJ+Mv1Im9O/KiFpwe1fdwz
 Eq4oInUe8QG9haUl3w08iSZ7KN8KTEFJg3wJwC97s77T+q4fRB7TLD3/udIjlQuUR4
 bCUzLUNFZXm9h89Z5HB+25+HlG2Kjn1S2kwrdcl4ZM6H/0HufS4+esymXeA890Fmeb
 QMngvObDXjjWXBttrI8poxzR2Y/UPnPO6SZyzZYif9DgJ1wDmoJcNjQCP8X7ezE2rn
 TXfFCOaz9Vvrzuv8wXFXUt++qaOazsDR/sWqUB5PXAKNLN5Ja5SWMphcQoAc2iqVFu
 TDHtG++ulF0jw==
Message-ID: <5bf29cb0-96a6-4100-8755-750215d31ab6@kernel.org>
Date: Tue, 20 Feb 2024 15:58:00 +0800
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
 <c82f8a3f-0184-43c2-b67d-ca53338a153c@kernel.org>
 <CAHJ8P3J8WUAxOrG91id+sKKt7ndLnETdbzz6Zy7haoC9qfT0tg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J8WUAxOrG91id+sKKt7ndLnETdbzz6Zy7haoC9qfT0tg@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/2/20 15:45, Zhiguo Niu wrote: > > > On Tue, Feb 20,
    2024 at 2:32 PM Chao Yu <chao@kernel.org <mailto:chao@kernel.org>> wrote:
    > > > > On 2024/2/20 13:34, Zhiguo Niu wrote: > > > I think do f [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcL14-0000UM-Nk
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

T24gMjAyNC8yLzIwIDE1OjQ1LCBaaGlndW8gTml1IHdyb3RlOgo+IAo+IAo+IE9uIFR1ZSwgRmVi
IDIwLCAyMDI0IGF0IDI6MzLigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmcgPG1haWx0bzpj
aGFvQGtlcm5lbC5vcmc+PiB3cm90ZToKPiAgPgo+ICA+IE9uIDIwMjQvMi8yMCAxMzozNCwgWmhp
Z3VvIE5pdSB3cm90ZToKPiAgPiA+IEkgdGhpbmsgZG8gZjJmc19oYW5kbGVfZXJyb3IgaW4gX19p
c19iaXRtYXBfdmFsaWQgaXMgYSBnb29kIHdheS4KPiAgPgo+ICA+IExpa2UgdGhpcz8KPiAgPgo+
ICA+IC0tLQo+ICA+IMKgIGZzL2YyZnMvY2hlY2twb2ludC5jIHwgMjggKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLQo+ICA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAx
NCBkZWxldGlvbnMoLSkKPiAgPgo+ICA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NoZWNrcG9pbnQu
YyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gID4gaW5kZXggODdiN2M5ODhjOGNhLi5iOGE3ZTgz
ZWI0ZTAgMTAwNjQ0Cj4gID4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPiAgPiArKysgYi9m
cy9mMmZzL2NoZWNrcG9pbnQuYwo+ICA+IEBAIC0xNTUsMjEgKzE1NSwyNCBAQCBzdGF0aWMgYm9v
bCBfX2lzX2JpdG1hcF92YWxpZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYmxr
YWRkciwKPiAgPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gZXhpc3Q7Cj4gID4KPiAg
PiDCoCDCoCDCoCDCoCBpZiAoKGV4aXN0ICYmIHR5cGUgPT0gREFUQV9HRU5FUklDX0VOSEFOQ0Vf
VVBEQVRFKSB8fAo+ICA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgKCFleGlzdCAmJiB0eXBlID09
IERBVEFfR0VORVJJQ19FTkhBTkNFKSkgewo+ICA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgZjJm
c19lcnIoc2JpLCAiSW5jb25zaXN0ZW50IGVycm9yIGJsa2FkZHI6JXUsIHNpdCBiaXRtYXA6JWQi
LAo+ICA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBibGthZGRyLCBleGlz
dCk7Cj4gID4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfTkVF
RF9GU0NLKTsKPiAgPiAtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGR1bXBfc3RhY2soKTsKPiAgPiAt
IMKgIMKgIMKgIH0KPiAgPiAtCj4gID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoIWV4aXN0ICYm
IHR5cGUgPT0gREFUQV9HRU5FUklDX0VOSEFOQ0UpKQo+ICA+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgZ290byBvdXRfZXJyOwo+ICA+ICsgwqAgwqAgwqAgaWYgKCFleGlzdCAmJiB0eXBlICE9IERB
VEFfR0VORVJJQ19FTkhBTkNFX1VQREFURSkKPiAgPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdv
dG8gb3V0X2hhbmRsZTsKPiAgPiArIMKgIMKgIMKgIHJldHVybiBleGlzdDsKPiAgPiArb3V0X2Vy
cjoKPiAgPiArIMKgIMKgIMKgIGYyZnNfZXJyKHNiaSwgIkluY29uc2lzdGVudCBlcnJvciBibGth
ZGRyOiV1LCBzaXQgYml0bWFwOiVkIiwKPiAgPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmxr
YWRkciwgZXhpc3QpOwo+ICA+ICsgwqAgwqAgwqAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURf
RlNDSyk7Cj4gID4gKyDCoCDCoCDCoCBkdW1wX3N0YWNrKCk7Cj4gID4gK291dF9oYW5kbGU6Cj4g
ID4gKyDCoCDCoCDCoCBmMmZzX2hhbmRsZV9lcnJvcihzYmksIEVSUk9SX0lOVkFMSURfQkxLQURE
Uik7Cj4gID4gwqAgwqAgwqAgwqAgcmV0dXJuIGV4aXN0Owo+ICA+IMKgIH0KPiAgPgo+ICA+IMKg
IHN0YXRpYyBib29sIF9fZjJmc19pc192YWxpZF9ibGthZGRyKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwKPiAgPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBibG9ja190IGJsa2FkZHIsIGludCB0eXBlKQo+ICA+IMKgIHsKPiAgPiAt
IMKgIMKgIMKgIGJvb2wgdmFsaWQgPSBmYWxzZTsKPiAgPiAtCj4gID4gwqAgwqAgwqAgwqAgc3dp
dGNoICh0eXBlKSB7Cj4gID4gwqAgwqAgwqAgwqAgY2FzZSBNRVRBX05BVDoKPiAgPiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBicmVhazsKPiAgPiBAQCAtMjA5LDEwICsyMTIsNyBAQCBzdGF0aWMg
Ym9vbCBfX2YyZnNfaXNfdmFsaWRfYmxrYWRkcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4g
ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZHVtcF9zdGFjaygpOwo+ICA+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdvdG8gZXJyOwo+ICA+IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7Cj4gID4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB2YWxpZCA9IF9faXNfYml0bWFwX3ZhbGlkKHNiaSwgYmxrYWRkciwgdHlwZSk7
Cj4gID4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKCF2YWxpZCAmJiB0
eXBlICE9IERBVEFfR0VORVJJQ19FTkhBTkNFX1VQREFURSkgfHwKPiAgPiAtIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICh2YWxpZCAmJiB0eXBlID09IERBVEFf
R0VORVJJQ19FTkhBTkNFX1VQREFURSkpCj4gID4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGVycjsKPiAgPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJldHVybiBfX2lzX2JpdG1hcF92YWxpZChzYmksIGJsa2FkZHIsIHR5cGUp
Owo+ICA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0KPiAgPiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBicmVhazsKPiAgPiDCoCDCoCDCoCDCoCBjYXNlIE1FVEFfR0VORVJJQzoKPiAgPiBAQCAt
MjI3LDcgKzIyNyw3IEBAIHN0YXRpYyBib29sIF9fZjJmc19pc192YWxpZF9ibGthZGRyKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgPiDCoCDCoCDCoCDCoCByZXR1cm4gdHJ1ZTsKPiAgPiDC
oCBlcnI6Cj4gID4gwqAgwqAgwqAgwqAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTlZB
TElEX0JMS0FERFIpOwo+ICA+IC0gwqAgwqAgwqAgcmV0dXJuIHZhbGlkOwo+ICA+ICsgwqAgwqAg
wqAgcmV0dXJuIGZhbHNlOwo+IEkgdGhpbmsgaXQncyBPSy4KPiBEbyB3ZSBuZWVkIHRvIHdhaXQg
Zm9yIEphZWdldWsgS2lt4oCZcyBzdWdnZXN0aW9uIG9yIHNob3VsZCBJIHVwZGF0ZSB0aGUgbmV3
IHBhdGNowqAgdmVyc2lvbiBmaXJzdPCfmIA/Cj4gdGhhbmtzIQoKSSBndWVzcyB3ZSdkIGJldHRl
ciB0byB3YWl0IGZvciBKYWVnZXVrJ3MgY29tbWVudHMuCgpUaGFua3MsCgo+ICA+IMKgIH0KPiAg
Pgo+ICA+IMKgIGJvb2wgZjJmc19pc192YWxpZF9ibGthZGRyKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwKPiAgPiAtLQo+ICA+IDIuNDAuMQo+ICA+Cj4gID4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
