Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF82EA13E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:05:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwZqL-0006bs-7k; Tue, 05 Jan 2021 00:04:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kwZqK-0006bi-0y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RIAu8uS5feNbhsyipiwLYRptnpa/P53/nDDHuTAmANU=; b=eYnp8H46Zf+wZld180w2IRvu74
 2Xf0F3xvOOSNOrkIeKC5rS5pK8tmyKEtugWwvtGCCcfCQzTjYy2hx9FimGBhGS/nkV62xb5S3tFPK
 NwOTiIz+cxAvtIMdkEVRauH9N7bbDuZJHbRxd7UgYKuWwQ6TvG78rxo20N6IyUemVl0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RIAu8uS5feNbhsyipiwLYRptnpa/P53/nDDHuTAmANU=; b=KO0tMxp6l7c2BfnxwnFZioSl6+
 xPCdGePxRc8xdEAXGpKDg85HDApqvrBZ75eGNvbPtKshWQFn+IcV499sOcgCNlLFu+L6kCZ58KkxJ
 DIxJEyMpl5JWNJ8LGFS29TGF8DfkXZ3d5wk4rI4yMdJ1aGQBZjfv4Pf4VYoQiZecPnVc=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwZqB-00DswF-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:04:55 +0000
Received: by mail-lf1-f49.google.com with SMTP id 23so68525400lfg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Jan 2021 16:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RIAu8uS5feNbhsyipiwLYRptnpa/P53/nDDHuTAmANU=;
 b=Bg9iEFVIyFaOS5eu9+24tFOHTVbPYXmXuPa8fLOxoTJNvzX7lxDPyZ8FAgHgcuxGaB
 rNhgDMM2EisQbSa2Aj0W4NSs3lhHF6a74Ql9LVu/WjaiGVHd7gE92eQZ0c/CRKtu4JzJ
 t/mD5T/ww180To3bcVRi1WuBNjyUSBRo97HViY0FMmvBtDXhlUIIrTy/XTGz3fIwFHkK
 kHiEZC0MaxBAUF8ROHsWr7rD5NvAzo4FTMeU+gGGXMJmHuv8bjr4kABJUaH6RTCw5DHh
 /9K7UvN+ot87vJi5tatgaZ6zBm8NK9C6k3l1aHFojaY0KShox6iK0tzjrdDt0ysO/eRQ
 41Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RIAu8uS5feNbhsyipiwLYRptnpa/P53/nDDHuTAmANU=;
 b=O85kB8XMfSEgcjtXuBqKji/VpeCg/3Z+kdpvPDhvFgeeeZYlOV6BPU6zmjDKTI/iMB
 6WRyGFHJv6ABoen2pBx0QM/h3rhlHr4+RP2DVScwTvg2l5Q0aji/XqgJBH3uyi2SAes8
 8O+dNOVEt0nsKJLp2wXnjLr20CzDtjxf1yiCkAFpfQr0pst8B4Zcwse9OSw8AdpEZJ7z
 gA1kuYD8pDan+5RDEPx6gGBp34zPps149QdR9C3sM7y7h+mO5RscH1d3qaW0A78ys84k
 oesGPAh2Q7RBmJzw4e76KgBeHTGOG5pw4UucGJPiZTB43C5ZcUJYUI/79CT+tc2JYc9/
 oN2A==
X-Gm-Message-State: AOAM5322Vu9QyQX3MFrmyXK6xyyAE3y3x3VE0iOxBqvfLVyD7SlXrqFE
 /bShDM/1BSy/ev2CewaJUNAi1HpDsuqJi0aR4uw=
X-Google-Smtp-Source: ABdhPJzCBtNw3KUV+mj0Gs5HT7pcbktTyblGdVU5raqwsE0oZINcZDbSwiY7ga3F3OiSvTBdo312EebrkCkPF+R6x98=
X-Received: by 2002:a19:301:: with SMTP id 1mr31231450lfd.67.1609805081256;
 Mon, 04 Jan 2021 16:04:41 -0800 (PST)
MIME-Version: 1.0
References: <1acf4202-e5e6-f3fb-73c3-11bc965d3058@canonical.com>
In-Reply-To: <1acf4202-e5e6-f3fb-73c3-11bc965d3058@canonical.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 5 Jan 2021 09:04:30 +0900
Message-ID: <CACOAw_zqsY9u4t5zhh+yk-bNVVhZS2J3f6fyOX78tZBc19JeBg@mail.gmail.com>
To: Colin Ian King <colin.king@canonical.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.49 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwZqB-00DswF-Tl
Subject: Re: [f2fs-dev] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ29saW4sCgpUaGFua3MgZm9yIG5vdGlmeWluZyBtZS4gV2UgbmVlZCB0byBqdXN0IGNvbnRp
bnVlIHdpdGhvdXQKc2V0X3BhZ2VfZGlydHkoKSBhbmQgZjJmc19wdXRfcGFnZSgpLgoKMjAyMeuF
hCAx7JuUIDTsnbwgKOyblCkg7Jik7ZuEIDExOjQzLCBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBIaSwKPgo+IFN0YXRpYyBhbmFseXNp
cyB1c2luZyBDb3Zlcml0eSBoYXMgZGV0ZWN0ZWQgYSBwb3RlbnRpYWwgbnVsbCBwb2ludGVyCj4g
ZGVyZWZlcmVuY2UgYWZ0ZXIgYSBudWxsIGNoZWNrIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+
Cj4gY29tbWl0IDVmZGIzMjJmZjJjMmI0YWQ1MTlmNDkwZGNiN2ViYjk2YzU0MzlhZjcKPiBBdXRo
b3I6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gRGF0ZTogICBUaHUgRGVj
IDMgMTU6NTY6MTUgMjAyMCArMDkwMAo+Cj4gICAgIGYyZnM6IGFkZCBGMkZTX0lPQ19ERUNPTVBS
RVNTX0ZJTEUgYW5kIEYyRlNfSU9DX0NPTVBSRVNTX0ZJTEUKPgo+IFRoZSBhbmFseXNpcyBpcyBh
cyBmb2xsb3dzOgo+Cj4gNDAyNSBzdGF0aWMgaW50IHJlZGlydHlfYmxvY2tzKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHBnb2ZmX3QgcGFnZV9pZHgsCj4gaW50IGxlbikKPiA0MDI2IHsKPiA0MDI3ICAg
ICAgICBERUZJTkVfUkVBREFIRUFEKHJhY3RsLCBOVUxMLCBpbm9kZS0+aV9tYXBwaW5nLCBwYWdl
X2lkeCk7Cj4gNDAyOCAgICAgICAgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcgPSBpbm9k
ZS0+aV9tYXBwaW5nOwo+IDQwMjkgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlOwo+IDQwMzAgICAg
ICAgIHBnb2ZmX3QgcmVkaXJ0eV9pZHggPSBwYWdlX2lkeDsKPiA0MDMxICAgICAgICBpbnQgaSwg
cGFnZV9sZW4gPSAwLCByZXQgPSAwOwo+IDQwMzIKPiA0MDMzICAgICAgICBwYWdlX2NhY2hlX3Jh
X3VuYm91bmRlZCgmcmFjdGwsIGxlbiwgMCk7Cj4gNDAzNAo+Cj4gICAgIDEuIENvbmRpdGlvbiBp
IDwgbGVuLCB0YWtpbmcgdHJ1ZSBicmFuY2guCj4gICAgIDQuIENvbmRpdGlvbiBpIDwgbGVuLCB0
YWtpbmcgdHJ1ZSBicmFuY2guCj4KPiA0MDM1ICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbGVuOyBp
KyssIHBhZ2VfaWR4KyspIHsKPiA0MDM2ICAgICAgICAgICAgICAgIHBhZ2UgPSByZWFkX2NhY2hl
X3BhZ2UobWFwcGluZywgcGFnZV9pZHgsIE5VTEwsIE5VTEwpOwo+Cj4gICAgIDIuIENvbmRpdGlv
biBJU19FUlIocGFnZSksIHRha2luZyBmYWxzZSBicmFuY2guCj4gICAgIDUuIENvbmRpdGlvbiBJ
U19FUlIocGFnZSksIHRha2luZyB0cnVlIGJyYW5jaC4KPgo+IDQwMzcgICAgICAgICAgICAgICAg
aWYgKElTX0VSUihwYWdlKSkgewo+IDQwMzggICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBQ
VFJfRVJSKHBhZ2UpOwo+Cj4gICAgIDYuIEJyZWFraW5nIGZyb20gbG9vcC4KPgo+IDQwMzkgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA0MDQwICAgICAgICAgICAgICAgIH0KPiA0MDQx
ICAgICAgICAgICAgICAgIHBhZ2VfbGVuKys7Cj4KPiAgICAgMy4gSnVtcGluZyBiYWNrIHRvIHRo
ZSBiZWdpbm5pbmcgb2YgdGhlIGxvb3AuCj4KPiA0MDQyICAgICAgICB9Cj4gNDA0Mwo+Cj4gICAg
IDcuIENvbmRpdGlvbiBpIDwgcGFnZV9sZW4sIHRha2luZyB0cnVlIGJyYW5jaC4KPgo+IDQwNDQg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBwYWdlX2xlbjsgaSsrLCByZWRpcnR5X2lkeCsrKSB7Cj4g
NDA0NSAgICAgICAgICAgICAgICBwYWdlID0gZmluZF9sb2NrX3BhZ2UobWFwcGluZywgcmVkaXJ0
eV9pZHgpOwo+Cj4gICAgIDguIENvbmRpdGlvbiAhcGFnZSwgdGFraW5nIHRydWUgYnJhbmNoLgo+
ICAgICA5LiB2YXJfY29tcGFyZV9vcDogQ29tcGFyaW5nIHBhZ2UgdG8gbnVsbCBpbXBsaWVzIHRo
YXQgcGFnZSBtaWdodCBiZQo+IG51bGwuCj4KPiA0MDQ2ICAgICAgICAgICAgICAgIGlmICghcGFn
ZSkKPiA0MDQ3ICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsKPgo+IERlcmVm
ZXJlbmNlIGFmdGVyIG51bGwgY2hlY2sgKEZPUldBUkRfTlVMTCkKPgo+ICAgIDEwLiB2YXJfZGVy
ZWZfbW9kZWw6IFBhc3NpbmcgbnVsbCBwb2ludGVyIHBhZ2UgdG8gc2V0X3BhZ2VfZGlydHksCj4g
d2hpY2ggZGVyZWZlcmVuY2VzIGl0Lgo+Cj4gNDA0OCAgICAgICAgICAgICAgICBzZXRfcGFnZV9k
aXJ0eShwYWdlKTsKPiA0MDQ5ICAgICAgICAgICAgICAgIGYyZnNfcHV0X3BhZ2UocGFnZSwgMSk7
Cj4gNDA1MCAgICAgICAgICAgICAgICBmMmZzX3B1dF9wYWdlKHBhZ2UsIDApOwo+IDQwNTEgICAg
ICAgIH0KPiA0MDUyCj4gNDA1MyAgICAgICAgcmV0dXJuIHJldDsKPiA0MDU0IH0KPgo+IFRoZSAh
cGFnZSBjaGVjayBvbiBsaW5lIDQwNDYgc2V0cyByZXQgYXBwcm9wcmlhdGVseSBidXQgd2UgaGF2
ZSBhCj4gZm9sbG93aW5nIGNhbGwgdG8gc2V0X3BhZ2VfZGlydHkgb24gYSBudWxsIHBhZ2UgdGhh
dCBjYXVzZXMgdGhlIGVycm9yLgo+IE5vdCBzdXJlIGhvdyB0aGlzIHNob3VsZCBiZSBmaXhlZCwg
c2hvdWxkIHRoZSBjaGVjayBiYWlsIG91dCBpbW1lZGlhdGVseQo+IG9yIGp1c3QgYXZvaWQgdGhl
IGZvbGxvd2luZyBzZXRfcGFnZV9kaXJ0eSBhbmYgZjJmc19wdXRfcGFnZSBjYWxscz8KPgo+IENv
bGluCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
