Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CA30B43E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 01:42:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6jlk-0003gg-5k; Tue, 02 Feb 2021 00:42:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6jli-0003gV-Q4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 00:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SLf4YUT/WIzk5e1MjJoufGzuMgi4ERJsS94Tsuvs6D0=; b=QinEU2BgH7BPoCzjs6gh7Wf8zX
 tKGBmkyHglggOiPndo/9SI76vWGAqRTnv6j30uz99DrA0rbG0vls2T4tVeAwCAg02k1FrPLT/5s5B
 H9gqL7CoiavinLeM1omaTle8tEZ4Okms1h8k0LB1iHM8n1GmG8hSPCBo4SllamOj/kVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SLf4YUT/WIzk5e1MjJoufGzuMgi4ERJsS94Tsuvs6D0=; b=c4wfHqNzjYtyhWATQVLSvx6JcE
 KVMeRcTJRE7kj0EgrfIXSDGUDN+85ZRDFtcgwy3E3Aw8KK1vTOsbEm6kKkuEb4DypNUdP7ShzDPsc
 XTWLKf+LKxEqf6Mrv7k/kCoKV1NwvIYXNJFi3Yc6yShu8lseSvP3rxdx5tExJtUKzZek=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6jlZ-0003It-7g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 00:42:10 +0000
Received: by mail-lf1-f48.google.com with SMTP id a8so25459856lfi.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Feb 2021 16:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SLf4YUT/WIzk5e1MjJoufGzuMgi4ERJsS94Tsuvs6D0=;
 b=CtYbQhuyL/QEy1OXjkO47o/XmSTAGGGnaUFEGAOhtFMYfsCfpvbVRvW/cjVRxMoT6E
 sOa83IdnpOmbOELiNP/0f60HJlhzmQ3zva2cfwpgqp5SO1kSysAtdZrG4Zlzn5NgW9rL
 JBn1NjpNK2bvwfVGwbNRl0iFsFvnHiPd5FGALWtmBt8ZgIg8whH3OSa4rTgHk479dlSr
 pYhQwUqkxTvy285CjpG1UK/pkv0aWSt5iEM4mpuW9ba3qFLN/0JL+AMOmBD0e9TbD/lg
 WPT+k6ZMNzOkgnROFYHyPwfZdXIWIhaxAO7ltQXyAzvXZ3BD/MpY1WiTLYAKo6770Vap
 1iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SLf4YUT/WIzk5e1MjJoufGzuMgi4ERJsS94Tsuvs6D0=;
 b=c/1kg7dYGLWmwn3YHbor8vFK/L/awHXn6pU5PwKhiu9W2iGE9zQmwhyGHea40gmBhb
 Gxlme0fHZWs7u+lU1R1rcPcrlI54IjaW2QnrhJkEsL9n7LFJ/3g3PuIqNUMj0E0+GPmQ
 cGHTSTn8zPqpXSh9HeUmOcmoDIQMcv/h82v+LniSDnDvTv3x3+Dd2P28t3ljYdfnPyN0
 iYdZyPhcVxj5L7RwbY9cHIWhVDGrD+K0ltkUm98eaf9s3HiBBH/kTDZoEUtz/MzmRcON
 VJzZ9nOD4RqxQvDIfajaXLtNFWT6xH3nGjOcLHy2e8R5cmVungc3jwV3+vTK5SgfbU+t
 u4Lg==
X-Gm-Message-State: AOAM530eIr4HsK3plKJTmu9EmVHIZoyE1BKS3MvvR52vyAhY/q/ymwl1
 pgJYJRNsf6wtggFjpVyUcxIqgEP3ydCa8ZkDNts=
X-Google-Smtp-Source: ABdhPJze8cXgBBahm+b/zMNTT7q7MVcKN3WtQhcCVbBF+3JL7jRx/9yGgjm0LnBxFEKZp72l7VXjH+DmgG5d6PXrrjQ=
X-Received: by 2002:a05:6512:3e6:: with SMTP id
 n6mr9838057lfq.139.1612226514583; 
 Mon, 01 Feb 2021 16:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20210201000606.2206740-1-daeho43@gmail.com>
 <7e2f440e-6500-04c8-1115-880754a18efa@kernel.org>
 <CACOAw_zW+xnN7pBmTknuJ1=CGiAvVq0sQhe7D6X8sOjgjF_qeg@mail.gmail.com>
 <YBhga9OJPcRa7ntk@google.com>
 <CACOAw_xW1NM4bXdzkFi7ee-OuZJ093Kz+-Zbk0huwAFHafXvbw@mail.gmail.com>
In-Reply-To: <CACOAw_xW1NM4bXdzkFi7ee-OuZJ093Kz+-Zbk0huwAFHafXvbw@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 2 Feb 2021 09:41:43 +0900
Message-ID: <CACOAw_yqMnjN60F2q7eyWy6zaPK+pTVYheQeHteYhjEHDP-kJA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.48 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.48 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l6jlZ-0003It-7g
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix checkpoint mount option wrong
 combination
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

Rm9yIGxlc3MgY29uZnVzaW9uLCBJIGFtIGdvaW5nIHRvIHNlcGFyYXRlIHRoZSAibWVyZ2UiIG9w
dGlvbiBmcm9tCiJjaGVja3BvaW50PSIuCkkgYW0gYWRkaW5nIGFub3RoZXIgImNrcHRfbWVyZ2Ui
IG9wdGlvbi4gOikKCjIwMjHrhYQgMuyblCAy7J28ICjtmZQpIOyYpOyghCA4OjMzLCBEYWVobyBK
ZW9uZyA8ZGFlaG80M0BnbWFpbC5jb20+64uY7J20IOyekeyEsToKPgo+IFRoZSByaWdodG1vc3Qg
b25lIGlzIHRoZSBmaW5hbCBvcHRpb24uIEFuZCBjaGVja3BvaW50PW1lcmdlIG1lYW5zCj4gY2hl
Y2twb2ludCBpcyBlbmFibGVkIHdpdGggYSBjaGVja3BvaW50IHRocmVhZC4KPgo+IG1vdW50IGNo
ZWNrcG9pbnQ9ZGlzYWJsZSxjaGVja3BvaW50PW1lcmdlID0+IGNoZWNrcG9pbnQ9bWVyZ2UKPiBy
ZW1vdW50IGNoZWNrcG9pbnQ9ZW5hYmxlLGNoZWNrcG9pbnQ9bWVyZ2UgPT4gY2hlY2twb2ludD1t
ZXJnZQo+IHJlbW91bnQgY2hlY2twb2ludD1tZXJnZSxjaGVja3BvaW50PWRpc2FibGUgPT4gY2hl
Y2twb2ludD1kaXNhYmxlCj4gcmVtb3VudCBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9ZW5h
YmxlID0+IGNoZWNrcG9pbnQ9ZW5hYmxlCj4KPiBMaWtlCj4KPiBtb3VudCBmc3luY19tb2RlPXBv
c2l4LCBmc3luY19tb2RlPXN0cmljdCwgZnN5bmNfbW9kZT1ub2JhcnJpZXIgPT4KPiBmc3luY19t
b2RlPW5vYmFycmllcgo+Cj4gMjAyMeuFhCAy7JuUIDLsnbwgKO2ZlCkg7Jik7KCEIDU6MTEsIEph
ZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPiA+Cj4gPiBPbiAw
Mi8wMSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiA+IEFjdHVhbGx5LCBJIHRoaW5rIHdlIG5lZWQg
dG8gc2VsZWN0IG9uZSBhbW9uZyB0aGVtLCBkaXNhYmxlLCBlbmFibGUKPiA+ID4gYW5kIG1lcmdl
LiBJIHJlYWxpemVkIG15IHByZXZpb3VzIHVuZGVyc3RhbmRpbmcgYWJvdXQgdGhhdCB3YXMgd3Jv
bmcuCj4gPiA+IEluIHRoYXQgY2FzZSBvZiAiY2hlY2twb2ludD1tZXJnZSxjaGVja3BvaW50PWVu
YWJsZSIsIHRoZSBsYXN0IG9wdGlvbgo+ID4gPiB3aWxsIG92ZXJyaWRlIHRoZSBvbmVzIGJlZm9y
ZSB0aGF0Lgo+ID4gPiBUaGlzIGlzIGhvdyB0aGUgb3RoZXIgbW91bnQgb3B0aW9ucyBsaWtlIGZz
eW5jX21vZGUsIHdoaW50X21vZGUgYW5kIGV0Yy4KPiA+ID4gU28sIHRoZSBhbnN3ZXIgd2lsbCBi
ZSAiY2hlY2twb2ludD1lbmFibGUiLiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+Cj4gPiBXZSBuZWVk
IHRvIGNsYXJpZnkgYSBiaXQgbW9yZS4gOikKPiA+Cj4gPiBtb3VudCBjaGVja3BvaW50PWRpc2Fi
bGUsY2hlY2twb2ludD1tZXJnZQo+ID4gcmVtb3VudCBjaGVja3BvaW50PWVuYWJsZSxjaGVja3Bv
aW50PW1lcmdlCj4gPgo+ID4gVGhlbiwgaXMgaXQgZ29pbmcgdG8gZW5hYmxlIGNoZWNrcG9pbnQg
d2l0aCBhIHRocmVhZD8KPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IDIwMjHrhYQgMuyblCAx
7J28ICjsm5QpIOyYpO2bhCA5OjQwLCBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+64uY7J20IOye
keyEsToKPiA+ID4gPgo+ID4gPiA+IE9uIDIwMjEvMi8xIDg6MDYsIERhZWhvIEplb25nIHdyb3Rl
Ogo+ID4gPiA+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBBcyBjaGVja3BvaW50PW1lcmdlIGNvbWVzIGluLCBtb3VudCBvcHRp
b24gc2V0dGluZyByZWxhdGVkIHRvCj4gPiA+ID4gPiBjaGVja3BvaW50IGhhZCBiZWVuIG1peGVk
IHVwLiBGaXhlZCBpdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBK
ZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgIGZz
L2YyZnMvc3VwZXIuYyB8IDExICsrKysrLS0tLS0tCj4gPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4gPiA+ID4gaW5k
ZXggNTY2OTZmNmNmYTg2Li44MjMxYzg4OGM3NzIgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9mcy9m
MmZzL3N1cGVyLmMKPiA+ID4gPiA+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4gPiA+ID4gQEAg
LTkzMCwyMCArOTMwLDI1IEBAIHN0YXRpYyBpbnQgcGFyc2Vfb3B0aW9ucyhzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnNiLCBjaGFyICpvcHRpb25zLCBib29sIGlzX3JlbW91bnQpCj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBGMkZTX09QVElPTihzYmkpLnVudXNhYmxlX2NhcF9wZXJjID0gYXJn
Owo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHNldF9vcHQoc2JpLCBESVNBQkxFX0NI
RUNLUE9JTlQpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNsZWFyX29wdChzYmks
IE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ID4gPiA+ID4gICAgICAgICAgICAgICBjYXNlIE9wdF9jaGVja3BvaW50X2Rpc2FibGVfY2Fw
Ogo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChhcmdzLT5mcm9tICYmIG1hdGNo
X2ludChhcmdzLCAmYXJnKSkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIEYyRlNfT1BU
SU9OKHNiaSkudW51c2FibGVfY2FwID0gYXJnOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgIHNldF9vcHQoc2JpLCBESVNBQkxFX0NIRUNLUE9JTlQpOwo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGNsZWFyX29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpOwo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gICAgICAgICAgICAgICBjYXNl
IE9wdF9jaGVja3BvaW50X2Rpc2FibGU6Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
c2V0X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgY2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIGNhc2UgT3B0
X2NoZWNrcG9pbnRfZW5hYmxlOgo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGNsZWFy
X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgY2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4gPiA+ID4KPiA+ID4gPiBX
aGF0IGlmOiAtbyBjaGVja3BvaW50PW1lcmdlLGNoZWNrcG9pbnQ9ZW5hYmxlCj4gPiA+ID4KPiA+
ID4gPiBDYW4geW91IHBsZWFzZSBleHBsYWluIHRoZSBydWxlIG9mIG1lcmdlL2Rpc2FibGUvZW5h
YmxlIGNvbWJpbmF0aW9uIGFuZCB0aGVpcgo+ID4gPiA+IHJlc3VsdD8gZS5nLgo+ID4gPiA+IGNo
ZWNrcG9pbnQ9bWVyZ2UsY2hlY2twb2ludD1lbmFibGUKPiA+ID4gPiBjaGVja3BvaW50PWVuYWJs
ZSxjaGVja3BvaW50PW1lcmdlCj4gPiA+ID4gY2hlY2twb2ludD1tZXJnZSxjaGVja3BvaW50PWRp
c2FibGUKPiA+ID4gPiBjaGVja3BvaW50PWRpc2FibGUsY2hlY2twb2ludD1tZXJnZQo+ID4gPiA+
Cj4gPiA+ID4gSWYgdGhlIHJ1bGUvcmVzdWx0IGlzIGNsZWFyLCBpdCBzaG91bGQgYmUgZG9jdW1l
bnRlZC4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcywKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIGNhc2Ug
T3B0X2NoZWNrcG9pbnRfbWVyZ2U6Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY2xl
YXJfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBzZXRfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gPiAgICNpZmRlZiBDT05GSUdfRjJGU19GU19D
T01QUkVTU0lPTgo+ID4gPiA+ID4gQEAgLTExNDIsMTIgKzExNDcsNiBAQCBzdGF0aWMgaW50IHBh
cnNlX29wdGlvbnMoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgY2hhciAqb3B0aW9ucywgYm9vbCBp
c19yZW1vdW50KQo+ID4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4g
PiA+ICAgICAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICBpZiAodGVzdF9vcHQoc2JpLCBE
SVNBQkxFX0NIRUNLUE9JTlQpICYmCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgdGVz
dF9vcHQoc2JpLCBNRVJHRV9DSEVDS1BPSU5UKSkgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICBm
MmZzX2VycihzYmksICJjaGVja3BvaW50PW1lcmdlIGNhbm5vdCBiZSB1c2VkIHdpdGggY2hlY2tw
b2ludD1kaXNhYmxlXG4iKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gPiA+ID4gPiAtICAgICB9Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAgICAgICAvKiBOb3QgcGFz
cyBkb3duIHdyaXRlIGhpbnRzIGlmIHRoZSBudW1iZXIgb2YgYWN0aXZlIGxvZ3MgaXMgbGVzc2Vy
Cj4gPiA+ID4gPiAgICAgICAgKiB0aGFuIE5SX0NVUlNFR19QRVJTSVNUX1RZUEUuCj4gPiA+ID4g
PiAgICAgICAgKi8KPiA+ID4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4g
PiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
