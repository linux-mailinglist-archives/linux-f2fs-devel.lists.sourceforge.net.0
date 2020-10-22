Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E510D295758
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Oct 2020 06:37:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVSLz-0004Io-Or; Thu, 22 Oct 2020 04:37:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kVSLy-0004Ih-Gz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W+1qv0093yWO2OvV4srP8myTrrB3NSN2Lqth7k1NMr8=; b=dECA8byN4+3VNB6R6hjAoFF+Dx
 7VLhyyHOMWHrVyMb8ORTCltRQV1Xrf2zg0qNVS6NN/BD29oC8h4NYpsusMjn4TfkZEX9rxy5QNIsQ
 8nFmLhvFlFoqNCsdTGiMht1yFienhwR4/BhKNOUuqN2oTBVKQMIf7hAukGvcOMcL7bQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W+1qv0093yWO2OvV4srP8myTrrB3NSN2Lqth7k1NMr8=; b=EIENUHjh+9+hKR4ZVD3j/SkKYt
 wX3wg8qhOzLCuL1bWbUitHCPpZcRv69sd+YBlY+wR2xzgjKA7yFH8vCL3waSR3J8vvY1MfxPN6+20
 RcFZ8LWXNhNg6NmMIO1oYAcw8fPdngef3fHVMCRXRxN05bOPEyLDH27ShpAo1VWDV3kI=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVSLq-002Bjd-Nb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:37:30 +0000
Received: by mail-lj1-f194.google.com with SMTP id m16so480264ljo.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Oct 2020 21:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W+1qv0093yWO2OvV4srP8myTrrB3NSN2Lqth7k1NMr8=;
 b=XmCRWoZxfFHScV1GEp0Xh0YTgmb1tQh82LM7jsEJfuKCpnrVT80VdsDy0pPOMsI8L3
 niM2u9eKwdKaQD5zNLVNNKigtNDdBD6QI70bEKxWKdRVwQCcXs+bq5wfXnDuIbZCIALx
 Unnpnzyf9V3Y+IPrAvDIs73cBeS85p07csnRgcEsxJb8Lp4pOsnqIPsQsL2txvckKMbw
 PXdisinFPMhOzsXNwiS5IUAZ3ZwBU0a3Us2gNRqe9avm6rbhyjFpdxCTpRWlS5RNBk0i
 8D6ZuHpE8koVyJTBrQWjE8wgZYN4GTZIAnya9C7U3Gt2YfXDQ+VekGOk5BikZpcVOovW
 Gi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W+1qv0093yWO2OvV4srP8myTrrB3NSN2Lqth7k1NMr8=;
 b=WRniX9T2hjuAiHNBxbDsXtVjCFzF4sZ4StIaetQ2qZLLGZ/Afj12XYc9THW6WZ15fY
 MBtnikSDl8e3P8KAG2llAxlc/aERy5F8mDBwzPl5gMshYlaDs7RXwOjNV9W6+FbHHYBH
 FgJTKO3mQAp1zONXj35KqLINW1AUkowB7+KFsNgMKHi3nF871QKNUbRQT9+3cAiKDTwW
 hxICjTuCj57d/8+UijWlUKo7B22fvdCnQrPKKwlUV/aopIpnaCx9RM5i9PXlKn07MREn
 jRMmE+labQJuDWY8g6W16FqaJvo1JaXFYlt9bdMIcRDKXT/uvcZj5UN5r38+OcCtNCUE
 PtNQ==
X-Gm-Message-State: AOAM533ZXlQCawmNHCtoS/Ytsjph5/lFpxB/EgxGXTpUl6W2OC32plSl
 dOgcAm9Ir5VlJ4QUbDp5Mgn0mbjHs7ucxXPPKrq7OC0Jnx1aOg==
X-Google-Smtp-Source: ABdhPJwWFEKL4gECmX9VHJVAui5KkthGto3dSB+WwW90vDCk1UCn8aZE2ruacrRaKjS5E5JtSyBCj8dmqA/ss4LdpY8=
X-Received: by 2002:a05:651c:130d:: with SMTP id
 u13mr305576lja.265.1603341428939; 
 Wed, 21 Oct 2020 21:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201022035848.976286-1-daeho43@gmail.com>
 <20201022035848.976286-2-daeho43@gmail.com>
 <20201022042608.GB857@sol.localdomain>
In-Reply-To: <20201022042608.GB857@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 22 Oct 2020 13:36:58 +0900
Message-ID: <CACOAw_y1Njm0zswqFXS4EXWcetYAvCGgHpQPqYqaRKh=+JmU8Q@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kVSLq-002Bjd-Nb
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBUaGUgdXNlIG9mID86IGhlcmUgaXMgYSBiaXQgc3RyYW5nZS4gIEhvdyBhYm91dDoKPgo+ICAg
ICAgICAgcmV0dXJuIGFsZ29yaXRobSA8IENPTVBSRVNTX01BWCAmJiBmMmZzX2NvcHNbYWxnb3Jp
dGhtXSAhPSBOVUxMOwo+CgpBY2sKCj4gTGlrZXdpc2UsIEVJTlZBTCB0ZW5kcyB0byBiZSBvdmVy
LXVzZWQsIHdoaWNoIG1ha2VzIGl0IGFtYmlndW91cy4gIE1heWJlIHVzZQo+IEVOT1BLRyBmb3Ig
dGhlIGNhc2Ugd2hlcmUgYWxnb3JpdGhtIDwgQ09NUFJFU1NfTUFYIGJ1dCB0aGUgYWxnb3JpdGht
IHdhc24ndAo+IGNvbXBpbGVkIGludG8gdGhlIGtlcm5lbD8gIFRoYXQgd291bGQgYmUgc2ltaWxh
ciB0byBob3cgb3BlbmluZyBhbiBlbmNyeXB0ZWQKPiBmaWxlIGZhaWxzIHdpdGggRU5PUEtHIHdo
ZW4gdGhlIGVuY3J5cHRpb24gYWxnb3JpdGhtIGlzbid0IGF2YWlsYWJsZS4KCkFjawoKPiBIb3cg
YWJvdXQgRUJVU1kgZm9yIGYyZnNfaXNfbW1hcF9maWxlKGlub2RlKSB8fCBnZXRfZGlydHlfcGFn
ZXMoaW5vZGUpLAo+IGFuZCBFRkJJRyBmb3IgaW5vZGUtPmlfc2l6ZSAhPSAwPwoKQWNrCgpUaGFu
a3N+IQoKMjAyMOuFhCAxMOyblCAyMuydvCAo66qpKSDsmKTtm4QgMToyNiwgRXJpYyBCaWdnZXJz
IDxlYmlnZ2Vyc0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiBUaHUsIE9jdCAyMiwg
MjAyMCBhdCAxMjo1ODo0OFBNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+IGluZGV4IDc4
OTUxODZjYzc2NS4uM2I1OGE0MTIyM2Y4IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9jb21wcmVz
cy5jCj4gPiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+IEBAIC01MTQsNiArNTE0LDExIEBA
IGJvb2wgZjJmc19pc19jb21wcmVzc19iYWNrZW5kX3JlYWR5KHN0cnVjdCBpbm9kZSAqaW5vZGUp
Cj4gPiAgICAgICByZXR1cm4gZjJmc19jb3BzW0YyRlNfSShpbm9kZSktPmlfY29tcHJlc3NfYWxn
b3JpdGhtXTsKPiA+ICB9Cj4gPgo+ID4gK2Jvb2wgZjJmc19pc19jb21wcmVzc19hbGdvcml0aG1f
cmVhZHkodW5zaWduZWQgY2hhciBhbGdvcml0aG0pCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIGFs
Z29yaXRobSA+PSBDT01QUkVTU19NQVggPyBmYWxzZSA6IGYyZnNfY29wc1thbGdvcml0aG1dOwo+
ID4gK30KPgo+IFRoZSB1c2Ugb2YgPzogaGVyZSBpcyBhIGJpdCBzdHJhbmdlLiAgSG93IGFib3V0
Ogo+Cj4gICAgICAgICByZXR1cm4gYWxnb3JpdGhtIDwgQ09NUFJFU1NfTUFYICYmIGYyZnNfY29w
c1thbGdvcml0aG1dICE9IE5VTEw7Cj4KPiA+ICsgICAgIGlmIChvcHRpb24ubG9nX2NsdXN0ZXJf
c2l6ZSA8IE1JTl9DT01QUkVTU19MT0dfU0laRSB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IG9wdGlvbi5sb2dfY2x1c3Rlcl9zaXplID4gTUFYX0NPTVBSRVNTX0xPR19TSVpFIHx8Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgIWYyZnNfaXNfY29tcHJlc3NfYWxnb3JpdGhtX3JlYWR5KG9w
dGlvbi5hbGdvcml0aG0pKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IExp
a2V3aXNlLCBFSU5WQUwgdGVuZHMgdG8gYmUgb3Zlci11c2VkLCB3aGljaCBtYWtlcyBpdCBhbWJp
Z3VvdXMuICBNYXliZSB1c2UKPiBFTk9QS0cgZm9yIHRoZSBjYXNlIHdoZXJlIGFsZ29yaXRobSA8
IENPTVBSRVNTX01BWCBidXQgdGhlIGFsZ29yaXRobSB3YXNuJ3QKPiBjb21waWxlZCBpbnRvIHRo
ZSBrZXJuZWw/ICBUaGF0IHdvdWxkIGJlIHNpbWlsYXIgdG8gaG93IG9wZW5pbmcgYW4gZW5jcnlw
dGVkCj4gZmlsZSBmYWlscyB3aXRoIEVOT1BLRyB3aGVuIHRoZSBlbmNyeXB0aW9uIGFsZ29yaXRo
bSBpc24ndCBhdmFpbGFibGUuCj4KPiA+ICsgICAgIGlmIChmMmZzX2lzX21tYXBfZmlsZShpbm9k
ZSkgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBnZXRfZGlydHlfcGFnZXMoaW5vZGUpIHx8
IGlub2RlLT5pX3NpemUpIHsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ICsg
ICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICB9Cj4KPiBIb3cgYWJvdXQgRUJVU1kgZm9y
IGYyZnNfaXNfbW1hcF9maWxlKGlub2RlKSB8fCBnZXRfZGlydHlfcGFnZXMoaW5vZGUpLAo+IGFu
ZCBFRkJJRyBmb3IgaW5vZGUtPmlfc2l6ZSAhPSAwPwo+Cj4gLSBFcmljCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
