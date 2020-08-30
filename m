Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B0125710D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 01:42:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCWyO-0006bJ-Qn; Sun, 30 Aug 2020 23:42:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kCWyN-0006b9-HD
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 23:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bWS0GjtZyrC4e/cHEJSl78RSsFz3+ulIrv6l2lk/Cqs=; b=h2joka0+V+3r0EkJk2xqdsEWM+
 65ls4RXPuRdFJsYf5VcCUuQl/tKf8nKrNLIEqAei6Y75ngmBHNnv7TF/gJfMTiIKvvXBgoM1n2mtT
 2s+Sf+nK/brwXddbvmg4cDaL47XVEm42zM92LVpJ367Z+LEiecbyl3d6wZ7im93arl2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bWS0GjtZyrC4e/cHEJSl78RSsFz3+ulIrv6l2lk/Cqs=; b=nCHCKemcp0uaHcMEzJFhuhi1xb
 PsTbsBJHZ0nMIPxb0xxqRb516pqLea7iaoBc3TYt1CmRZWfbQ/zy1VfabHc4iq+vWo51tfTiItNjA
 8OV4cnVW3Sk4wcorSJUQHiZ5DvQ8mvId7g2T/m5BI45m1QAsxfOgB9Sh3pKbYtOc68Aw=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kCWyM-005uYk-2o
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 23:42:55 +0000
Received: by mail-lf1-f68.google.com with SMTP id q8so2513846lfb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Aug 2020 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bWS0GjtZyrC4e/cHEJSl78RSsFz3+ulIrv6l2lk/Cqs=;
 b=OJ4+ifh6RrIAdM0iJ9Tn/HLFL2d6gFth1jit1w5ol+Km0GmNIGfurjWsGWO/+HCVHP
 6Cn2yo7popsZNUQWNsACuea6qHM9eS5a0DVKv1Fozj/s/AZRsiFqwMxp3X1q1VSvIDzT
 VIl2ZlLRe/IqcT+lEkdXheUAIzGIe+fTBRHiG7wqMhB/SckWPONwVG5xX9nFMgovNEMX
 LLd4xl/FfUPNsvkq2y2S1e3Nj+P0F+pPIDn+uQEP119LSbzS8f4Q152lxgIuV1hbAv4y
 /+8CoX9ZcfReFYbauClXnH8Oi1505TNSNWsmfCuuXE+PLEMIfu+iFZMED2YoOnPNNoLs
 3Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bWS0GjtZyrC4e/cHEJSl78RSsFz3+ulIrv6l2lk/Cqs=;
 b=L6rW+4RFtcfIuWVWnItppUkzU1JyMp8QGRsRkDstXCuI1HUs8UeDcuNpiyggI04TtV
 4IylbLwOrc2GhNzZJCa8CcyMr05mBG3D2WhOPt7RWP8KPTAt19eVzJJJQghnytHnVJlm
 z5QmvIL/nqKbyIQQImQ0pzdF/QtY9VKKImj7wxXNcfj2EKVBvu4+cS7NNd+1jkV8xKDp
 +h65gCCmCd95uKwxRzhGga+KOqAcHIgPV+idd8ebWnW5QhqCybfWIHLniBqxDwVP7fae
 Tgwj7Sf4ZqwSOU0TvgX1ASZ0FXT8x5H7hMC2WO4xdt3uE60SZ+eosUT8v3n8Yzh6oVq5
 X41A==
X-Gm-Message-State: AOAM530pEKmmjHYM+bAnYzOTtYI5qIYctnylplBUFWUrnNIPgLMvC2ml
 ds6YLajiN9K6jGc3KBUYSCFWFGFz6ZJAaBhx+ec=
X-Google-Smtp-Source: ABdhPJxYC1J1xEavzSubTLHRIY9YB71znE7pzD5QiWoim97lQEAZA2ULsHdGSYHuORknu9t5BPKvIPyHzUKYgIFaO0A=
X-Received: by 2002:a19:ae0a:: with SMTP id f10mr4294068lfc.100.1598830964648; 
 Sun, 30 Aug 2020 16:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200828054629.583577-1-daeho43@gmail.com>
 <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
In-Reply-To: <61996dcd-6db1-13fc-8239-7e684f3ec49e@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 31 Aug 2020 08:42:33 +0900
Message-ID: <CACOAw_wc29AROzFhcGyC73i_vYZC1NmHP60uQfP7X-j6y6=kSA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kCWyM-005uYk-2o
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG8geW91IGhhdmUgYW55IHJlYXNvbiBub3QgdG8gcHV0IHRoaXMgY2hlY2sgaGVyZT8KSWYgd2Ug
ZG8gdGhpcyBjaGVjayBvdXRzaWRlIG9mIGhlcmUsIHdlIGRlZmluaXRlbHkgbWFrZSBhIG1pc3Rh
a2UKc29vbmVyIG9yIGxhdGVyLgoKMjAyMOuFhCA47JuUIDMw7J28ICjsnbwpIOyYpO2bhCAxMjoy
NCwgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLTgt
MjggMTM6NDYsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBBZnRlciByZWxlYXNpbmcgY2Jsb2NrcywgdGhlIGNv
bXByZXNzZWQgZmlsZSBjYW4gYmUgYWNjaWRlbnRhbGx5Cj4gPiBkaXNhYmxlZCBpbiBjb21wcmVz
c2lvbiBtb2RlLCBzaW5jZSBpdCBoYXMgemVybyBjYmxvY2tzLiBBcyB3ZSBhcmUKPiA+IHVzaW5n
IElNTVVUQUJMRSBmbGFnIHRvIHByZXNlbnQgcmVsZWFzZWQgY2Jsb2NrcyBzdGF0ZSwgd2UgY2Fu
IGFkZAo+ID4gSU1NVVRBQkxFIHN0YXRlIGNoZWNrIHdoZW4gY29uc2lkZXJpbmcgdGhlIGNvbXBy
ZXNzZWQgZmlsZSBkaXNhYmxpbmcuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGZzL2YyZnMvZjJmcy5oIHwgMiAr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gaW5kZXggMDI4MTFjZTE1MDU5
Li4xNGQzMDc0MGJhMDMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gKysrIGIv
ZnMvZjJmcy9mMmZzLmgKPiA+IEBAIC0zOTM2LDYgKzM5MzYsOCBAQCBzdGF0aWMgaW5saW5lIHU2
NCBmMmZzX2Rpc2FibGVfY29tcHJlc3NlZF9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiAg
ICAgICBpZiAoIWYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkKPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gPiAgICAgICBpZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkgewo+ID4gKyAg
ICAgICAgICAgICBpZiAoSVNfSU1NVVRBQkxFKGlub2RlKSkKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gMTsKPgo+IEl0IGxvb2tzIG1vc3Qgb2YgY2FsbGVycyBhcmUgZnJvbSBpb2N0
bCwgc2hvdWxkIHdlIGFkZCBpbW11dGFibGUgY2hlY2sgaW4gZjJmcwo+IGlvY3RsIGludGVyZmFj
ZXMgaWYgbmVjZXNzYXJ5PyBvciBJIG1pc3NlZCBleGlzdGVkIGNoZWNrLgo+Cj4gVGhhbmtzLAo+
Cj4gPiAgICAgICAgICAgICAgIGlmIChnZXRfZGlydHlfcGFnZXMoaW5vZGUpKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ID4gICAgICAgICAgICAgICBpZiAoZmktPmlfY29t
cHJfYmxvY2tzKQo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
