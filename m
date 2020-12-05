Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A82202CF933
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Dec 2020 04:41:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klORg-0000H0-2W; Sat, 05 Dec 2020 03:41:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1klORe-0000Gp-62
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 03:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LJTsl6c44Uxv31c8hslGbnFgaJEY6UyCSOPJO2t5yoo=; b=REJJnOl5dUr+jYcNgy0MMqRVZz
 ecPpL1oCGJTqpzVgVfA7hSeubiRVM2moiTic98PXKYOdc3lidS0IUQp+SdvDlXx6xio777e9K9uTn
 cY2STiXfXapwiYD6dZOofutfJmQZIw/JWY8oKTnN9Ly+wdMIQi0wUiKcgDoKBDcZsp30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LJTsl6c44Uxv31c8hslGbnFgaJEY6UyCSOPJO2t5yoo=; b=HgGESUSULUrvqw5IDwO49MfCst
 c9A5pw/76PHRWjcO2SOw/Xckj6yGsgb9K+3Ei3WRkoYtMdRwgBqAqlS93za2mzwwf0hhDbQIoB9ig
 KASGoGC5kt8qLuzGerFq8MwxKocI5WwiMyaLt15wRl6S/Snl8rnjTwdba+nNEBEYWGb0=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1klORP-00GG37-5k
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 03:41:14 +0000
Received: by mail-lj1-f193.google.com with SMTP id y16so8873264ljk.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Dec 2020 19:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LJTsl6c44Uxv31c8hslGbnFgaJEY6UyCSOPJO2t5yoo=;
 b=KIrUEQP+BXrrXPpbpyNG2Xfn2lUBRkqUCKMNo6BBt/EgLZuQMkbCYknfzy1u84/aZX
 ryRQ7IViUu3sZWA+htQoajbDRHzaV4geUTkkO4xcNaYhNT4/SAR8DyW/x7q0kyLrr9Gc
 12LgfTiB0SYF0smdnJE5vA7BZC9q26tbje3hnVZAl692JwVufnNM3HzRUdUpD4HJHOUM
 g6u6Xnr1bl7XG6fpK0IuG5YjYo/W4YBh7IaSN73x/0SGSMRIePjH0K4WmSHAzMokgDXC
 sEQ6i9OMX2Bviwrf3BsZ2vRgxKD5G7/oBLkpseTA7jt6rwvw4iYE7Qhq8hv1WQ/cBlG6
 PBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LJTsl6c44Uxv31c8hslGbnFgaJEY6UyCSOPJO2t5yoo=;
 b=CTiad5eHFv5aM+gNUmSnMBJUf62GRpX3GtgSyuF2xTLD77TnRO7lp4pcxjyuFqY/ih
 /Ou/DxyLzzc2LlOsA+Aj/rsIlMcx56zPGjgf6DGBlFESF/oPmjig7ENBL917p1nLgEzv
 bCAyRwPTeYdiUf3kKL7QaNy6rlMqbryVcS4fOcIMYJ5OYNT8WaBsimrICPIjFwA4HD5o
 G1z+4oM0eS/C3qq0YiIQ4bLInXb2varvbPsDIHysMsQuA96jTji0Kvl+HtxXPvhCpcNE
 G5RNig2XAP72JfsJ6EjtyrMbmOyhmF9jij5Kld7Rnk0jNFkBdjxYxGtyWig67gwAWtIu
 Q06A==
X-Gm-Message-State: AOAM533+7XqbExOf/pcRxgCHUpgeoNMDVAoccfOMiBN9NxG6FUUiCJ6K
 INHP9mfJAAgR4pLMaoSfjsClzWt50GCWZGSMvoM=
X-Google-Smtp-Source: ABdhPJyBdEvkKtHgTZxwCTMXwrvSsF+JtmZbMz5bBu4+wF/aQexrIzUgLjMQslIhX2qFPX2sVdjFoO0DeXtDwSsF6yw=
X-Received: by 2002:a2e:9707:: with SMTP id r7mr4417251lji.265.1607139645307; 
 Fri, 04 Dec 2020 19:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
 <X8m0qbd7rvQyiwOt@sol.localdomain>
 <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
 <CACOAw_xzKjZcpVTo3aj5sJUQ_BjLr=5ZhnfuyFwYerpyzZu+aw@mail.gmail.com>
 <X8nAParf9GW9LaGV@sol.localdomain>
 <CACOAw_wOShYf23Y0txs6Fk_Qq9JGEjXGRb0MzMxrBxJpzCfLmA@mail.gmail.com>
 <X8nGvfEeTDTLa6FL@sol.localdomain>
 <CACOAw_wfew8xER-CibUtddRKVtcr3k_iGzjQ-bVYxqRUuEVCcw@mail.gmail.com>
 <X8qAAiRah/zmowZB@google.com>
In-Reply-To: <X8qAAiRah/zmowZB@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 5 Dec 2020 12:40:34 +0900
Message-ID: <CACOAw_yfbkF_BYxt57AuHtobdz4T5tfON8vGcjYGc5OaXGLRVg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1klORP-00GG37-5k
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVwLCB3ZSBuZWVkIHRvIGNvbWUgYmFjayB0byB2MSBhbmQgZW5hYmxlIHZlcml0eSBpbiBhIHVu
aXQgb2YgY2x1c3Rlci4KUGx1cywgYXMgSSB0b2xkIHlvdSwgSSdsbCBwcmV2ZW50IG5ld2x5IHZl
cml0eSBlbmFsYmVkIHBhZ2VzIGZyb20KYmVpbmcgbWVyZ2VkIHdpdGggdmVyaXR5IGRpc2FibGVk
IGJpby4KClRoYW5rcywKCjIwMjDrhYQgMTLsm5QgNeydvCAo7YagKSDsmKTsoIQgMzoyOSwgSmFl
Z2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gMTIvMDQs
IERhZWhvIEplb25nIHdyb3RlOgo+ID4gVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24gYWJvdXQg
dmVyaXR5Lgo+ID4gSSBnb3QgeW91ciBwb2ludC4gVGhhbmtzfgo+Cj4gUG9zc2libGUgZml4IGNh
biBiZSBsaWtlIHRoaXM/Cj4KPiAtLS0KPiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgIDIgLS0KPiAg
ZnMvZjJmcy9kYXRhLmMgICAgIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gaW5kZXggODlmNzNhN2M4
NjY3Li5jNWZlZTRkN2VhNzIgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4gKysr
IGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gQEAgLTE0OTEsOCArMTQ5MSw2IEBAIHN0cnVjdCBkZWNv
bXByZXNzX2lvX2N0eCAqZjJmc19hbGxvY19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4g
ICAgICAgICBkaWMtPm1hZ2ljID0gRjJGU19DT01QUkVTU0VEX1BBR0VfTUFHSUM7Cj4gICAgICAg
ICBkaWMtPmlub2RlID0gY2MtPmlub2RlOwo+ICAgICAgICAgYXRvbWljX3NldCgmZGljLT5wZW5k
aW5nX3BhZ2VzLCBjYy0+bnJfY3BhZ2VzKTsKPiAtICAgICAgIGlmIChmc3Zlcml0eV9hY3RpdmUo
Y2MtPmlub2RlKSkKPiAtICAgICAgICAgICAgICAgYXRvbWljX3NldCgmZGljLT52ZXJpdHlfcGFn
ZXMsIGNjLT5ucl9jcGFnZXMpOwo+ICAgICAgICAgZGljLT5jbHVzdGVyX2lkeCA9IGNjLT5jbHVz
dGVyX2lkeDsKPiAgICAgICAgIGRpYy0+Y2x1c3Rlcl9zaXplID0gY2MtPmNsdXN0ZXJfc2l6ZTsK
PiAgICAgICAgIGRpYy0+bG9nX2NsdXN0ZXJfc2l6ZSA9IGNjLT5sb2dfY2x1c3Rlcl9zaXplOwo+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gaW5kZXggZTMx
NjhmMzJmOTQzLi42NTdmYjU2MmQ3ZDQgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiAr
KysgYi9mcy9mMmZzL2RhdGEuYwo+IEBAIC0xMDM1LDcgKzEwMzUsOCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgZjJmc19uZWVkX3Zlcml0eShjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlLCBwZ29mZl90
IGlkeCkKPgo+ICBzdGF0aWMgc3RydWN0IGJpbyAqZjJmc19ncmFiX3JlYWRfYmlvKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGJsb2NrX3QgYmxrYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIG5yX3BhZ2VzLCB1bnNpZ25lZCBvcF9mbGFnLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGdvZmZfdCBmaXJzdF9pZHgsIGJvb2wg
Zm9yX3dyaXRlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGdvZmZf
dCBmaXJzdF9pZHgsIGJvb2wgZm9yX3dyaXRlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYm9vbCBmb3JfdmVyaXR5KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ICAgICAgICAgc3RydWN0IGJpbyAqYmlv
Owo+IEBAIC0xMDU3LDcgKzEwNTgsNyBAQCBzdGF0aWMgc3RydWN0IGJpbyAqZjJmc19ncmFiX3Jl
YWRfYmlvKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJsb2NrX3QgYmxrYWRkciwKPiAgICAgICAgICAg
ICAgICAgcG9zdF9yZWFkX3N0ZXBzIHw9IDEgPDwgU1RFUF9ERUNSWVBUOwo+ICAgICAgICAgaWYg
KGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkKPiAgICAgICAgICAgICAgICAgcG9zdF9yZWFk
X3N0ZXBzIHw9IDEgPDwgU1RFUF9ERUNPTVBSRVNTX05PV1E7Cj4gLSAgICAgICBpZiAoZjJmc19u
ZWVkX3Zlcml0eShpbm9kZSwgZmlyc3RfaWR4KSkKPiArICAgICAgIGlmIChmb3JfdmVyaXR5ICYm
IGYyZnNfbmVlZF92ZXJpdHkoaW5vZGUsIGZpcnN0X2lkeCkpCj4gICAgICAgICAgICAgICAgIHBv
c3RfcmVhZF9zdGVwcyB8PSAxIDw8IFNURVBfVkVSSVRZOwo+Cj4gICAgICAgICBpZiAocG9zdF9y
ZWFkX3N0ZXBzKSB7Cj4gQEAgLTEwODcsNyArMTA4OCw3IEBAIHN0YXRpYyBpbnQgZjJmc19zdWJt
aXRfcGFnZV9yZWFkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpwYWdlLAo+ICAg
ICAgICAgc3RydWN0IGJpbyAqYmlvOwo+Cj4gICAgICAgICBiaW8gPSBmMmZzX2dyYWJfcmVhZF9i
aW8oaW5vZGUsIGJsa2FkZHIsIDEsIG9wX2ZsYWdzLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYWdlLT5pbmRleCwgZm9yX3dyaXRlKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZS0+aW5kZXgsIGZvcl93cml0ZSwgdHJ1ZSk7
Cj4gICAgICAgICBpZiAoSVNfRVJSKGJpbykpCj4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKGJpbyk7Cj4KPiBAQCAtMjE0MSw3ICsyMTQyLDcgQEAgc3RhdGljIGludCBmMmZzX3JlYWRf
c2luZ2xlX3BhZ2Uoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAg
ICAgICBpZiAoYmlvID09IE5VTEwpIHsKPiAgICAgICAgICAgICAgICAgYmlvID0gZjJmc19ncmFi
X3JlYWRfYmlvKGlub2RlLCBibG9ja19uciwgbnJfcGFnZXMsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpc19yZWFkYWhlYWQgPyBSRVFfUkFIRUFEIDogMCwgcGFnZS0+aW5kZXgs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxzZSk7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmYWxzZSwgdHJ1ZSk7Cj4gICAgICAgICAgICAgICAgIGlmIChJ
U19FUlIoYmlvKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoYmlv
KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBiaW8gPSBOVUxMOwo+IEBAIC0yMTg4LDYgKzIx
ODksNyBAQCBpbnQgZjJmc19yZWFkX211bHRpX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNj
LCBzdHJ1Y3QgYmlvICoqYmlvX3JldCwKPiAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGJsa2JpdHMg
PSBpbm9kZS0+aV9ibGtiaXRzOwo+ICAgICAgICAgY29uc3QgdW5zaWduZWQgYmxvY2tzaXplID0g
MSA8PCBibGtiaXRzOwo+ICAgICAgICAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMgPSBO
VUxMOwo+ICsgICAgICAgYm9vbCBmb3JfdmVyaXR5ID0gZmFsc2U7Cj4gICAgICAgICBpbnQgaTsK
PiAgICAgICAgIGludCByZXQgPSAwOwo+Cj4gQEAgLTIyNTMsNiArMjI1NSwxMSBAQCBpbnQgZjJm
c19yZWFkX211bHRpX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgYmlvICoq
YmlvX3JldCwKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfcHV0X2Rub2RlOwo+ICAgICAgICAg
fQo+Cj4gKyAgICAgICBpZiAoZnN2ZXJpdHlfYWN0aXZlKGNjLT5pbm9kZSkpIHsKPiArICAgICAg
ICAgICAgICAgYXRvbWljX3NldCgmZGljLT52ZXJpdHlfcGFnZXMsIGNjLT5ucl9jcGFnZXMpOwo+
ICsgICAgICAgICAgICAgICBmb3JfdmVyaXR5ID0gdHJ1ZTsKPiArICAgICAgIH0KPiArCj4gICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgZGljLT5ucl9jcGFnZXM7IGkrKykgewo+ICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSA9IGRpYy0+Y3BhZ2VzW2ldOwo+ICAgICAgICAgICAgICAg
ICBibG9ja190IGJsa2FkZHI7Cj4gQEAgLTIyNzIsNyArMjI3OSw3IEBAIGludCBmMmZzX3JlYWRf
bXVsdGlfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsIHN0cnVjdCBiaW8gKipiaW9fcmV0
LAo+ICAgICAgICAgICAgICAgICBpZiAoIWJpbykgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGJpbyA9IGYyZnNfZ3JhYl9yZWFkX2Jpbyhpbm9kZSwgYmxrYWRkciwgbnJfcGFnZXMsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzX3JlYWRhaGVhZCA/IFJFUV9S
QUhFQUQgOiAwLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdl
LT5pbmRleCwgZm9yX3dyaXRlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFnZS0+aW5kZXgsIGZvcl93cml0ZSwgZm9yX3Zlcml0eSk7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKElTX0VSUihiaW8pKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgcmVtYWluZWQgPSBkaWMtPm5yX2NwYWdlcyAtIGk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHJlbGVhc2UgPSBmYWxzZTsKPiBAQCAt
MjI4MCw3ICsyMjg3LDcgQEAgaW50IGYyZnNfcmVhZF9tdWx0aV9wYWdlcyhzdHJ1Y3QgY29tcHJl
c3NfY3R4ICpjYywgc3RydWN0IGJpbyAqKmJpb19yZXQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBQVFJfRVJSKGJpbyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkaWMtPmZhaWxlZCA9IHRydWU7Cj4KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChmc3Zlcml0eV9hY3RpdmUoaW5vZGUpKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoZm9yX3Zlcml0eSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoIWF0b21pY19zdWJfcmV0dXJuKHJlbWFpbmVkLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkaWMtPnZlcml0eV9w
YWdlcykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVsZWFzZSA9IHRydWU7Cj4gLS0KPiAyLjI5LjIuNTc2LmdhM2ZjNDQ2ZDg0LWdvb2cKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
