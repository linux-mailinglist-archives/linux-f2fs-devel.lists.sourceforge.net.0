Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD552A6E051
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 17:57:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twl6h-0006bj-LQ;
	Mon, 24 Mar 2025 16:57:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1twl6a-0006bX-TK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 16:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x+R4Zgv1+YUQI5Stto4fUNNKCwwq4ux5aT/NqJLsqnU=; b=P6dzmFQSVBoOC1zSdRlm68NkWh
 s1RZCTaWfZMYbkzlG79VYze82rXwWhURnRr3uGq5Ne3svojmtSg1xGgWPKa7kpXgWPJUrRhm3YCm4
 Us4wRDzBeIszCgXZhT2huVoNMW5VDQhfYJghJg4wOJDruYumsieBLWGqNiYoeFbAOylU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x+R4Zgv1+YUQI5Stto4fUNNKCwwq4ux5aT/NqJLsqnU=; b=a7iVoR+DU+ksIt5F1Bf7UxY9mG
 WTm1qQgVqtGFvPG7dvXZZqJL7SdSvmiMQxc4dP2n/OYpv1kz7Mc/u1EbvG+qxJFx8aPl8qBx2a4Db
 ZXQOBQb5S/0OzpjOru5Ur+VVl4M/KYitHPTvduBeP+C1sdJdw1zwnEBJpF20sZjCN2DY=;
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twl6V-0003QM-QX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 16:56:53 +0000
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-86c29c0acdfso1881284241.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Mar 2025 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742835402; x=1743440202; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+R4Zgv1+YUQI5Stto4fUNNKCwwq4ux5aT/NqJLsqnU=;
 b=HcBxS56h4DZ9I6IpKRwaZUAmFe72N0ISOtf2Zi668C7wDOCdROGZ75Atfr2d2kPWVJ
 LpmqjZsZwJTXecA/LTfyoieLp/4OPQNp5LmgCF9zJQaoa+5IoOXStS84sRp2jP6V75e2
 E5WsnInOkA9A+Cp4zOvtN7GLpv5y4AQZPH2XiRmD1FIbUxO1Zi2tYmC39SvThclsx7rP
 sn2Tm71DFidy64PYIhloZNxluaVSHJX+yCiGQ2npMyNZxnH+JM45AYvmHB4tByEJ1vKb
 iHVVTaaqk81OljSHqfdLp4vPfBG9drDfi5ELdQzPWIunWneIVBR9UZDB7rB7aoT2QBkE
 jIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742835402; x=1743440202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+R4Zgv1+YUQI5Stto4fUNNKCwwq4ux5aT/NqJLsqnU=;
 b=OLbU4krbgyEyOQwUmD5hVHoycVG0sB8D8PLBzAZ4gtVUj/0nC1Iz9ltHCrgpNECQVD
 uh9ThYeyGfUGQEHRIUbIf/R00SEmdxV7LOWqtzSRxL+wgRRRvrVPBY5xX+VLArY2HrL3
 arg7KIzi+3mvOWdd3uAGIxbCG937wWgAkh7akpzn67U70gFFzeXvQCIYSQPGLrwuV2Wu
 lRzy+5JbJ0Q4mOLfC4Ku4dohqaBZT5vl0dLsxPOHW6UMygB4mIL6Mab7mMV4pdgKMrLH
 BZC+68ZQ5iNCvFHu/KUfnRY1gnzi+XDlEvKLMYsDqT7b2u7UVS5+BvflocyhQFOBMk0C
 xkEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi/xTQ8jpgrvEZFMTtzVdQQhcYSyOUy/lp3vSvs+sNWm2aip4k29Dkci9iGBO1m+QgymhfAr870u+H+i0B1max@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7Oj4rf/pBEZZFN5Ute2/3QZb3KW1t6zqjX6RYGMycSMvjkKXj
 vsBYjPDNxEKhRQDb8XlfMUlidxdDY2kfPr3sUXf04aE9il29ihWYwBW0IJ4p0Ty9XbO+dRp0hy7
 fr195gklUjZHOxwu7yxARRjFuVuxPHT0m
X-Gm-Gg: ASbGnctdwEpzthTujjeOMaRP/W7NdlO4UehNdvLXVH0YdT9wLJ7SjXFIhOipvx+k23t
 KfrbO/giuVWfmJs+ZhDq/m4vIgU42b8C/WyssAGSjuScIBAYxfPPMdAnxu1GJ5vUWBBz2ESadzr
 BSND6+5NM2ifIHDrB3rL/ZXZkMhb5fTrN5oHqAFOAVXuF3vvJVoMtjCMEwg3Y=
X-Google-Smtp-Source: AGHT+IHsfFOp+DbRVW4PSnT8CVdboozFUZfZK2d4+gQt+Qgg1TwPugvPDiyIJpiqBHf6v0VU2bp4D6qEvu0sikK9AzA=
X-Received: by 2002:a05:6102:3908:b0:4c4:e21f:6481 with SMTP id
 ada2fe7eead31-4c50d47bbbbmr8736879137.4.1742835401559; Mon, 24 Mar 2025
 09:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250321213328.1170234-1-daeho43@gmail.com>
 <Z-GIOxj1reO87F6E@google.com>
In-Reply-To: <Z-GIOxj1reO87F6E@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 24 Mar 2025 09:56:30 -0700
X-Gm-Features: AQ5f1JrjKx2Rv5zNO4PkTiOMHmTWHFNwr67g3LdIx9yz9VU2CLcZpMU6HZRn6GU
Message-ID: <CACOAw_wLBW1p0z8yNRfwX0GPUtvcoFVYVm_TbJBWe=yzVvwKsQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 24, 2025 at 9:28 AM Jaegeuk Kim wrote: > > Do
    we still need this patch? Yes, in many circumstances, we cannot remove the
    aliasing file because of SELinux. > > On 03/21, Daeho Jeong wrote: > > From:
    Daeho Jeong > > > > support a file truncation to zero size for device aliasing
    files. > > > > Signed-off-by: Daeho Jeong > > --- > > v2: make the extent
    [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.222.50 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.50 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.50 listed in wl.mailspike.net]
X-Headers-End: 1twl6V-0003QM-QX
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support zero sized file truncate
 for device aliasing files
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

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgOToyOOKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRG8gd2Ugc3RpbGwgbmVlZCB0aGlzIHBhdGNoPwoKWWVzLCBp
biBtYW55IGNpcmN1bXN0YW5jZXMsIHdlIGNhbm5vdCByZW1vdmUgdGhlIGFsaWFzaW5nIGZpbGUg
YmVjYXVzZQpvZiBTRUxpbnV4LgoKPgo+IE9uIDAzLzIxLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+
IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gc3VwcG9y
dCBhIGZpbGUgdHJ1bmNhdGlvbiB0byB6ZXJvIHNpemUgZm9yIGRldmljZSBhbGlhc2luZyBmaWxl
cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUu
Y29tPgo+ID4gLS0tCj4gPiB2MjogbWFrZSB0aGUgZXh0ZW50IGxlbmd0aCB6ZXJvCj4gPiAtLS0K
PiA+ICBmcy9mMmZzL2ZpbGUuYyB8IDcgKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gaW5kZXggZjkyYTlmYmE5OTkxLi42OTk1MmYyMDgw
ODYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gKysrIGIvZnMvZjJmcy9maWxl
LmMKPiA+IEBAIC03NzUsNiArNzc1LDExIEBAIGludCBmMmZzX2RvX3RydW5jYXRlX2Jsb2Nrcyhz
dHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9vbCBsb2NrKQo+ID4gICAgICAgICAgICAg
ICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+ID4KPiA+ICAgICAgICAgICAgICAg
ZjJmc19wdXRfcGFnZShpcGFnZSwgMSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIHdyaXRlX2xv
Y2soJmV0LT5sb2NrKTsKPiA+ICsgICAgICAgICAgICAgZXQtPmxhcmdlc3QubGVuID0gMDsKPiA+
ICsgICAgICAgICAgICAgd3JpdGVfdW5sb2NrKCZldC0+bG9jayk7Cj4gPiArCj4gPiAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+ID4gICAgICAgfQo+ID4KPiA+IEBAIC0xMDM2LDcgKzEwNDEsNyBA
QCBpbnQgZjJmc19zZXRhdHRyKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3QgZGVudHJ5
ICpkZW50cnksCj4gPgo+ID4gICAgICAgaWYgKChhdHRyLT5pYV92YWxpZCAmIEFUVFJfU0laRSkp
IHsKPiA+ICAgICAgICAgICAgICAgaWYgKCFmMmZzX2lzX2NvbXByZXNzX2JhY2tlbmRfcmVhZHko
aW5vZGUpIHx8Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJU19ERVZJQ0VfQUxJ
QVNJTkcoaW5vZGUpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKElTX0RFVklD
RV9BTElBU0lORyhpbm9kZSkgJiYgYXR0ci0+aWFfc2l6ZSkpCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gICAgICAgICAgICAgICBpZiAoaXNfaW5vZGVf
ZmxhZ19zZXQoaW5vZGUsIEZJX0NPTVBSRVNTX1JFTEVBU0VEKSAmJgo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICFJU19BTElHTkVEKGF0dHItPmlhX3NpemUsCj4gPiAtLQo+ID4gMi40OS4wLjM5
NS5nMTJiZWI4ZjU1Ny1nb29nCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
