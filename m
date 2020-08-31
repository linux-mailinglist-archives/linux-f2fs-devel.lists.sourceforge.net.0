Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 419322571A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 03:44:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCYsP-0003X6-SU; Mon, 31 Aug 2020 01:44:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kCYsO-0003Wz-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 01:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h706+DAmJrg5sh57Pkq1WW2thN7Yu0k83T8H0aXE904=; b=mMwC8afNY5EzrSNjE04jPol9NM
 Dfd8WtZKqdAFjVG2LOl91RlCxLGPaEFgL1Dq54QKDozGrgYTvGwZKpvp6EjYDWbeEWRrYYChrq6OU
 l1r9/+8rd3qklZAwzRtnsdupfB8g9AfbYnh5VbAsz90wa6OwWwq7H9QdrQXbL+WIPRRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h706+DAmJrg5sh57Pkq1WW2thN7Yu0k83T8H0aXE904=; b=cbjeh6W76q9q1V41BuJ7TwDHYC
 sV2a4WwyekHqt/HCRJ5Lztf6hSSFyhLVJSIMtkhWFLSG5uqX7ZCiJY4e73tB/J/30pBAGhcfnK/in
 147aJxEP9+CQKpe45udRmf92IRNdDyp5XxUFLVSWGAhpKt+mvEoiw44qN6BvONTqMMHw=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kCYsK-007TyM-E1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 01:44:52 +0000
Received: by mail-lj1-f196.google.com with SMTP id g6so4795998ljn.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Aug 2020 18:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h706+DAmJrg5sh57Pkq1WW2thN7Yu0k83T8H0aXE904=;
 b=JUZzE3iHuaN52Pd0n6+xd2yOBu1T7t+Krtojh8MVVgn5hNV+M5YyrmMgbfXarNee8f
 5NM6vAkN7BU17lB403pwcNL1xv8i5k1UxzLFl5dmUwaT5gdot0sHYzp9YAKPxvQJy5Ku
 6kjBHsDcCTuzJP0tLw14GXJdonpPAV52NFuILCqmibsfo2YnyzCct2Q2+tA1gI1uQTUv
 +DClnu3P+YN4qgHo9+wCcg5CzW1DjwD8wh2BZzF/7p3Zr0BCYtQ5J7kNeE7sTukCB+lS
 e3pEGqeJKetSvP0+T+FHzvAIYEbpUbyZJzP5QX9fTiD9czj1Ugc8aw2fhiP97X1xK6Yu
 ITaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h706+DAmJrg5sh57Pkq1WW2thN7Yu0k83T8H0aXE904=;
 b=aP42Vpkw0td/h9MSFVmH/i3kN4V2w36DjWdyaom7csAQWdaKlbDsdyP8+XIVp2fZ57
 8IFv4TWmKc1FKb4FyinQreSlzgI/tirfV78fJNtY3UTJhawzStDhTyLUjQNukLNIMdQy
 steYRw9dZKXV6q9DzWzZaO95YAf3sbVFvKllQyj2M3V+V9ZDtCAYp9sxKVlsNlHpGpU7
 qc7eOTU9tTt0S73DKGJKQhQtaFKeZ42ioZ2iDezXS3QQAoEoTow4uhCZ2esrpbUSy37v
 yunntm1pCHjm623oS+1+49eOaWP3YTC4AwFzS06W9FFt2Iyr08QRi2dZh3Jm8jYqToys
 Rgrg==
X-Gm-Message-State: AOAM532iHFDGehE9Mhfo97kxZxc/ULDejHy+zKpKmY1ifbU2AjzW229C
 NUbrf1lFmzXjCSSQ1SrRs5zMcTX+h/sJP3+4e0E=
X-Google-Smtp-Source: ABdhPJw0xo3aAAWtR5a4/o8THBa+273iGF7tyRcdIuUIsSnOe/pt/Fm7piLxvSwaC31HiVSQkvN5x+vXVI/CeOq8q0A=
X-Received: by 2002:a2e:3615:: with SMTP id d21mr4347179lja.333.1598838281712; 
 Sun, 30 Aug 2020 18:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200828054629.583577-1-daeho43@gmail.com>
 <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
 <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
 <bd1a8ffa-83ff-b774-9bed-ed68025d0c7a@huawei.com>
In-Reply-To: <bd1a8ffa-83ff-b774-9bed-ed68025d0c7a@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2020 10:44:30 +0900
Message-ID: <CACOAw_y=O35_SFxdfsVER4+a+n-eE6f48NXF6CsAnj=Ms-dgkA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kCYsK-007TyM-E1
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent compressed file from being
 disabled after releasing cblocks
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U29ycnksIEkgZGlkbid0IGdldCB5b3VyIHBvaW50LgoKU28sIGRvIHlvdSB0aGluayB0aGlzIHBh
dGNoIGlzIG9rPyBBbmQgd2UgbmVlZCB0byBjb25zaWRlciB0aGF0IHdlCm5lZWQgbW9yZSBpbW11
dGFibGUgY2hlY2tzIGZvciBvdGhlciBjYXNlcz8KT3IgeW91IHdhbnQgdG8gcmVtb3ZlIHRoaXMg
aW1tdXRhYmxlIGNoZWNrIGZyb20gaGVyZSBhbmQgYWRkIHRoZSBjaGVjawp0byBlYWNoIGlvY3Rs
IGZ1bmN0aW9ucz8KCjIwMjDrhYQgOOyblCAzMeydvCAo7JuUKSDsmKTsoIQgMTA6MjQsIENoYW8g
WXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gMjAyMC84LzMxIDc6
NDIsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRG8geW91IGhhdmUgYW55IHJlYXNvbiBub3QgdG8g
cHV0IHRoaXMgY2hlY2sgaGVyZT8KPgo+IE5vLCB0aGUgcGxhY2UgaXMgb2theSB0byBtZS4gOikK
Pgo+ID4gSWYgd2UgZG8gdGhpcyBjaGVjayBvdXRzaWRlIG9mIGhlcmUsIHdlIGRlZmluaXRlbHkg
bWFrZSBhIG1pc3Rha2UKPiA+IHNvb25lciBvciBsYXRlci4KPgo+IEkganVzdCB3YW50IHRvIHNl
ZSB3aGV0aGVyIHdlIGNhbiBjb3ZlciBhbGwgY2FzZXMgaW4gd2hlcmUgd2UgbWlzc2VkIHRvCj4g
YWRkIGltbXV0YWJsZSBjaGVjayBjb25kaXRpb24gaWYgbmVjZXNzYXJ5Lgo+Cj4gVGhhbmtzLAo+
Cj4gPgo+ID4gMjAyMOuFhCA47JuUIDMw7J28ICjsnbwpIOyYpO2bhCAxMjoyNCwgQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4gPj4KPiA+PiBPbiAyMDIwLTgtMjggMTM6
NDYsIERhZWhvIEplb25nIHdyb3RlOgo+ID4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4+Pgo+ID4+PiBBZnRlciByZWxlYXNpbmcgY2Jsb2NrcywgdGhlIGNv
bXByZXNzZWQgZmlsZSBjYW4gYmUgYWNjaWRlbnRhbGx5Cj4gPj4+IGRpc2FibGVkIGluIGNvbXBy
ZXNzaW9uIG1vZGUsIHNpbmNlIGl0IGhhcyB6ZXJvIGNibG9ja3MuIEFzIHdlIGFyZQo+ID4+PiB1
c2luZyBJTU1VVEFCTEUgZmxhZyB0byBwcmVzZW50IHJlbGVhc2VkIGNibG9ja3Mgc3RhdGUsIHdl
IGNhbiBhZGQKPiA+Pj4gSU1NVVRBQkxFIHN0YXRlIGNoZWNrIHdoZW4gY29uc2lkZXJpbmcgdGhl
IGNvbXByZXNzZWQgZmlsZSBkaXNhYmxpbmcuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgIGZzL2Yy
ZnMvZjJmcy5oIHwgMiArKwo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgK
PiA+Pj4gaW5kZXggMDI4MTFjZTE1MDU5Li4xNGQzMDc0MGJhMDMgMTAwNjQ0Cj4gPj4+IC0tLSBh
L2ZzL2YyZnMvZjJmcy5oCj4gPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPj4+IEBAIC0zOTM2
LDYgKzM5MzYsOCBAQCBzdGF0aWMgaW5saW5lIHU2NCBmMmZzX2Rpc2FibGVfY29tcHJlc3NlZF9m
aWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gPj4+ICAgICAgICBpZiAoIWYyZnNfY29tcHJlc3Nl
ZF9maWxlKGlub2RlKSkKPiA+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPj4+ICAgICAg
ICBpZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkgewo+ID4+PiArICAgICAgICAgICAgIGlmIChJ
U19JTU1VVEFCTEUoaW5vZGUpKQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7
Cj4gPj4KPiA+PiBJdCBsb29rcyBtb3N0IG9mIGNhbGxlcnMgYXJlIGZyb20gaW9jdGwsIHNob3Vs
ZCB3ZSBhZGQgaW1tdXRhYmxlIGNoZWNrIGluIGYyZnMKPiA+PiBpb2N0bCBpbnRlcmZhY2VzIGlm
IG5lY2Vzc2FyeT8gb3IgSSBtaXNzZWQgZXhpc3RlZCBjaGVjay4KPiA+Pgo+ID4+IFRoYW5rcywK
PiA+Pgo+ID4+PiAgICAgICAgICAgICAgICBpZiAoZ2V0X2RpcnR5X3BhZ2VzKGlub2RlKSkKPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMTsKPiA+Pj4gICAgICAgICAgICAgICAg
aWYgKGZpLT5pX2NvbXByX2Jsb2NrcykKPiA+Pj4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4g
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
