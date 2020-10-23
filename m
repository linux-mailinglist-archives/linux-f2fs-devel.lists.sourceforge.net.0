Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E27296E26
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Oct 2020 14:03:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVvn8-0003kr-D5; Fri, 23 Oct 2020 12:03:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kVvn6-0003ka-WA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Oct 2020 12:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dP/opn4RNSZDnMUPHovJYcbSCr6w6hoguGGpHuZqJt8=; b=leAIcAdFQNjRxhuunKSPzXKEtG
 VjZLZUMLYKXvACWzuMVkmLxrEKPNTevPuA/okIYiDe6Ska2fYBxDDiZfE/ijB0T78wONzH1nJqXO1
 /5g/4LHOHar2I4j5J3hf+V3o0hWmQFAW3nCdPCohxDYa2tplbtFF9m4mybVki+OhbMXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dP/opn4RNSZDnMUPHovJYcbSCr6w6hoguGGpHuZqJt8=; b=bjwYznau6ODOEH4KJg7m6Iejrs
 uVVk7BEQnv+CVIVwvb0MjU3SFoUVtfbDxkKpZTrEtUqpG9FIl8Lt0d9ZlrTmlBfwdLFBLp8G6Vxqw
 Ra10c6TsskWEOEgjbX6WMLVtHwU/I0Ny03JYnWuUslIfgxi6ph75qMp5m/pm2AJWQmiw=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVvmw-00A3xa-PA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Oct 2020 12:03:28 +0000
Received: by mail-lf1-f67.google.com with SMTP id v6so1736920lfa.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Oct 2020 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dP/opn4RNSZDnMUPHovJYcbSCr6w6hoguGGpHuZqJt8=;
 b=Gj2ZIGL+XgGRYmTNmS4mXA3XXXIqAShL6n9rh0Na53wpR2k0Jamyaepdnv7+NYUkOX
 cCQ4L9H+rqSoTq2B45FljM4ZG7PNnjL9xkalnRk4apJ6w0f3rvxs0jSBpT9KM8cBx+//
 6wj3LTUdMcmoSb9ASwlJSkQJLp3TAEXQx3oV/1p8M2I9LVGIB395bUtVCZqn2FEORT3j
 +NCZ5QnJuWUFz3BXh1Ms6dmWobXd2Nf0Nz3Rph3rMieXW+A2SxaYmWPoDLsycZqNGefR
 TLPtTFhQtgHIVye7gnoz8epz29hwlDB8uJGFFwey56Rx/ozTZDEcZhlcMVPk7LZlTzR8
 ACLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dP/opn4RNSZDnMUPHovJYcbSCr6w6hoguGGpHuZqJt8=;
 b=muoLpqbTB/doYmdnOa/H5m5dy8gYMXWz20pwaLLIVNMGQXTT2hbphf/HDbM+T6exU5
 lKyriqD0FzuZ15TIL6GLQJZh2Mujuu99D2sxzHalsNaZcc7ZyTF+0NLSBbJscjaGhfMP
 tflthPbWtCSEn9Ry32eP7NcbWjYL6tq8TedJ6t/GmVQlws/iVkCm0Ci2LNd2LNgErusd
 xTlKrr5HKQzes88RyBgZ3x5HhjNE5nAE7I2vLj8mIOb4YvppwzXDeeVpZSdhqBrg8UlI
 5SQx9YfpcacDOx1MGSFu/2amlgj8LmX424BrzIk44Gh+dY/Snx2eWKFUVPyYOiTysKhq
 2VNw==
X-Gm-Message-State: AOAM530yGRpeGovECFVJ3YZpII/J4POsMeVRtGQKMcHJwrlIGBT0heCi
 j0NbIx8dNxgGMmEoeGgFY+/4ySb1+/6Q6CmdS+I=
X-Google-Smtp-Source: ABdhPJwCOZO+tpMwLl9I/Q9laS2vOtIjKjGfYoC04k6PpKF3oPoBI30mUmMzNABI65S4Enn8PFE4nv6+QQ0NO5j7byw=
X-Received: by 2002:a19:941:: with SMTP id 62mr681861lfj.227.1603454592013;
 Fri, 23 Oct 2020 05:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201022035848.976286-2-daeho43@gmail.com>
 <20201023120036.GY1042@kadam>
In-Reply-To: <20201023120036.GY1042@kadam>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 23 Oct 2020 21:03:01 +0900
Message-ID: <CACOAw_zgDKW1gqaeBYedPOn-7FFnJ0mQ2Cy_g5e7Zd+R37NPBg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kVvmw-00A3xa-PA
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, kbuild@lists.01.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVwLCBzdXJlfiEKCjIwMjDrhYQgMTDsm5QgMjPsnbwgKOq4iCkg7Jik7ZuEIDk6MDAsIERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gSGkg
RGFlaG8sCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1p
dHMvRGFlaG8tSmVvbmcvZjJmcy1hZGQtRjJGU19JT0NfR0VUX0NPTVBSRVNTX09QVElPTi1pb2N0
bC8yMDIwMTAyMi0xMTU5NDcKPiBiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy5naXQgZGV2LXRlc3QKPiBjb25maWc6IHg4
Nl82NC1yYW5kY29uZmlnLW0wMDEtMjAyMDEwMjIgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gY29t
cGlsZXI6IGdjYy05IChEZWJpYW4gOS4zLjAtMTUpIDkuMy4wCj4KPiBJZiB5b3UgZml4IHRoZSBp
c3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlCj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4KPiBOZXcgc21hdGNoIHdhcm5p
bmdzOgo+IGZzL2YyZnMvZmlsZS5jOjQwMTEgZjJmc19pb2Nfc2V0X2NvbXByZXNzX29wdGlvbigp
IGVycm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAncmV0Jy4KPgo+IE9sZCBzbWF0Y2ggd2Fybmlu
Z3M6Cj4gZnMvZjJmcy9mMmZzLmg6MjEyNyBkZWNfdmFsaWRfYmxvY2tfY291bnQoKSB3YXJuOiBz
aG91bGQgJ2NvdW50IDw8IDMnIGJlIGEgNjQgYml0IHR5cGU/Cj4gZnMvZjJmcy9maWxlLmM6MjUy
NSBmMmZzX2lvY19nY19yYW5nZSgpIHdhcm46IGluY29uc2lzdGVudCByZXR1cm5zICdzYmktPmdj
X2xvY2snLgo+IGZzL2YyZnMvZmlsZS5jOjI5NDEgZjJmc19pb2NfZmx1c2hfZGV2aWNlKCkgd2Fy
bjogcG90ZW50aWFsIHNwZWN0cmUgaXNzdWUgJ3NiaS0+ZGV2cycgW3ddIChsb2NhbCBjYXApCj4g
ZnMvZjJmcy9maWxlLmM6Mjk2NiBmMmZzX2lvY19mbHVzaF9kZXZpY2UoKSB3YXJuOiBpbmNvbnNp
c3RlbnQgcmV0dXJucyAnc2JpLT5nY19sb2NrJy4KPiBmcy9mMmZzL2ZpbGUuYzozMzA1IGYyZnNf
cHJlY2FjaGVfZXh0ZW50cygpIGVycm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAnZXJyJy4KPgo+
IHZpbSArL3JldCArNDAxMSBmcy9mMmZzL2ZpbGUuYwo+Cj4gZDg2OWQxMWFjMzllZGIgRGFlaG8g
SmVvbmcgMjAyMC0xMC0yMiAgMzk2OSAgc3RhdGljIGludCBmMmZzX2lvY19zZXRfY29tcHJlc3Nf
b3B0aW9uKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiBkODY5ZDExYWMz
OWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTcwICB7Cj4gZDg2OWQxMWFjMzllZGIgRGFl
aG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk3MSAgICAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVf
aW5vZGUoZmlscCk7Cj4gZDg2OWQxMWFjMzllZGIgRGFlaG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk3
MiAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiBkODY5
ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTczICAgICBzdHJ1Y3QgZjJmc19j
b21wX29wdGlvbiBvcHRpb247Cj4gZDg2OWQxMWFjMzllZGIgRGFlaG8gSmVvbmcgMjAyMC0xMC0y
MiAgMzk3NCAgICAgaW50IHJldDsKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEw
LTIyICAzOTc1Cj4gZDg2OWQxMWFjMzllZGIgRGFlaG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk3NiAg
ICAgaWYgKCFmMmZzX3NiX2hhc19jb21wcmVzc2lvbihzYmkpKQo+IGQ4NjlkMTFhYzM5ZWRiIERh
ZWhvIEplb25nIDIwMjAtMTAtMjIgIDM5NzcgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDM5NzgKPiBkODY5ZDEx
YWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTc5ICAgICBpZiAoIWYyZnNfY29tcHJl
c3NlZF9maWxlKGlub2RlKSkKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIy
ICAzOTgwICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhv
IEplb25nIDIwMjAtMTAtMjIgIDM5ODEKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIw
LTEwLTIyICAzOTgyICAgICBpZiAoIShmaWxwLT5mX21vZGUgJiBGTU9ERV9XUklURSkpCj4gZDg2
OWQxMWFjMzllZGIgRGFlaG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk4MyAgICAgICAgICAgICByZXR1
cm4gLUVCQURGOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDM5ODQK
PiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTg1ICAgICBpZiAoY29w
eV9mcm9tX3VzZXIoJm9wdGlvbiwgKHN0cnVjdCBmMmZzX2NvbXBfb3B0aW9uIF9fdXNlciAqKWFy
ZywKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTg2ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplb2Yob3B0aW9uKSkpCj4gZDg2OWQxMWFjMzllZGIgRGFl
aG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk4NyAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiBk
ODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTg4Cj4gZDg2OWQxMWFjMzll
ZGIgRGFlaG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk4OSAgICAgaWYgKG9wdGlvbi5sb2dfY2x1c3Rl
cl9zaXplIDwgTUlOX0NPTVBSRVNTX0xPR19TSVpFIHx8Cj4gZDg2OWQxMWFjMzllZGIgRGFlaG8g
SmVvbmcgMjAyMC0xMC0yMiAgMzk5MCAgICAgICAgICAgICAgICAgICAgIG9wdGlvbi5sb2dfY2x1
c3Rlcl9zaXplID4gTUFYX0NPTVBSRVNTX0xPR19TSVpFIHx8Cj4gZDg2OWQxMWFjMzllZGIgRGFl
aG8gSmVvbmcgMjAyMC0xMC0yMiAgMzk5MSAgICAgICAgICAgICAgICAgICAgICFmMmZzX2lzX2Nv
bXByZXNzX2FsZ29yaXRobV9yZWFkeShvcHRpb24uYWxnb3JpdGhtKSkKPiBkODY5ZDExYWMzOWVk
YiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTkyICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDM5OTMKPiBkODY5ZDEx
YWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTk0ICAgICBmaWxlX3N0YXJ0X3dyaXRl
KGZpbHApOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDM5OTUgICAg
IGlub2RlX2xvY2soaW5vZGUpOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAt
MjIgIDM5OTYKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICAzOTk3ICAg
ICBpZiAoZjJmc19pc19tbWFwX2ZpbGUoaW5vZGUpIHx8Cj4gZDg2OWQxMWFjMzllZGIgRGFlaG8g
SmVvbmcgMjAyMC0xMC0yMiAgMzk5OCAgICAgICAgICAgICAgICAgICAgIGdldF9kaXJ0eV9wYWdl
cyhpbm9kZSkgfHwgaW5vZGUtPmlfc2l6ZSkgewo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25n
IDIwMjAtMTAtMjIgIDM5OTkgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiBkODY5ZDExYWMz
OWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICA0MDAwICAgICAgICAgICAgIGdvdG8gb3V0Owo+
IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDQwMDEgICAgIH0KPiBkODY5
ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICA0MDAyCj4gZDg2OWQxMWFjMzllZGIg
RGFlaG8gSmVvbmcgMjAyMC0xMC0yMiAgNDAwMyAgICAgRjJGU19JKGlub2RlKS0+aV9jb21wcmVz
c19hbGdvcml0aG0gPSBvcHRpb24uYWxnb3JpdGhtOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEpl
b25nIDIwMjAtMTAtMjIgIDQwMDQgICAgIEYyRlNfSShpbm9kZSktPmlfbG9nX2NsdXN0ZXJfc2l6
ZSA9IG9wdGlvbi5sb2dfY2x1c3Rlcl9zaXplOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25n
IDIwMjAtMTAtMjIgIDQwMDUgICAgIEYyRlNfSShpbm9kZSktPmlfY2x1c3Rlcl9zaXplID0gMSA8
PCBvcHRpb24ubG9nX2NsdXN0ZXJfc2l6ZTsKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAy
MDIwLTEwLTIyICA0MDA2ICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1
ZSk7Cj4KPgo+ICJyZXQiIGlzIHVuaW5pdGlhbGl6ZWQgb24gdGhlIHN1Y2Nlc3MgcGF0aC4KPgo+
IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDQwMDcgIG91dDoKPiBkODY5
ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyICA0MDA4ICAgICBpbm9kZV91bmxvY2so
aW5vZGUpOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIgIDQwMDkgICAg
IGZpbGVfZW5kX3dyaXRlKGZpbHApOwo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAt
MTAtMjIgIDQwMTAKPiBkODY5ZDExYWMzOWVkYiBEYWVobyBKZW9uZyAyMDIwLTEwLTIyIEA0MDEx
ICAgICByZXR1cm4gcmV0Owo+IGQ4NjlkMTFhYzM5ZWRiIERhZWhvIEplb25nIDIwMjAtMTAtMjIg
IDQwMTIgIH0KPgo+IC0tLQo+IDAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENv
cnBvcmF0aW9uCj4gaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2tidWlsZC1h
bGxAbGlzdHMuMDEub3JnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
