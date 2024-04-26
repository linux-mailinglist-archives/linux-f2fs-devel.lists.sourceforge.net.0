Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570E8B3685
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Apr 2024 13:31:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0Jn4-0006Vt-1m;
	Fri, 26 Apr 2024 11:30:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1s0Jmv-0006V0-4Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 11:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fB1mt9sNpnIuQMWViJTKaJZ/u7Ekmxb+gEhtincBweM=; b=iSa6hRsMD30asB5qkSrulMkaXD
 gWlEKE2MAsTIx7SynWH3v+jp96Fh55VihI6lntgXIwQRqlCpYRqrDogiQrC8ZJ8lFkZEgdieOqWrM
 f8QUQYbAp5Hx3yxVxuRb8ncXlpSlZ8ovCCk17BFEemq6UQ64Qb2OLwlHr0suu3JzcD2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fB1mt9sNpnIuQMWViJTKaJZ/u7Ekmxb+gEhtincBweM=; b=UnxHbouFMnX3A6l0IbGlVQgvyN
 LdzNn2W48LFS0CN5FkUXAFGiHfFf+m+dnpaxzYx6EqBTi8QDHmp3E/qiD8/LRDWEwXTlI4X5n3w3d
 nhzkoNcNenj9l5ntNChpYB5205xU4ORnziiJQpjn2HaGUO+e/j0BMhkCr+3ID0t+A0pY=;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0Jmu-0006By-BT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 11:30:45 +0000
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so1297876f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Apr 2024 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714131033; x=1714735833; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fB1mt9sNpnIuQMWViJTKaJZ/u7Ekmxb+gEhtincBweM=;
 b=dAGOuXDZzdnRlY0Lu7fM8xxD5Smwkyl7Hi67DOu7q8n9WammYkvXvIxpvHbFtANA5l
 /nyYxfMMPomPIAtnI/CsfQoXGy5cUuTztO7lGY5bvRfSD68RpnK7yfneWrljUECfcXSn
 7b/7iJws991dmiO87OuSCFCqsvREGvyWMbKKXEbLsk3YlX574yfTLVbRY5nuBPVrsgrn
 4VDqUI9qcbfw8CxZNXNHMqnzAMs/O5He/doBmK/SvXgJA605V1TUYw3+000CNCemLjR+
 QsSZ+J+PwDijhsvvaXDaVgfJM0SXB2/d73vQfMWHYoGUB2WNCsVcUeekdksQKo+84Z/Y
 4Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714131033; x=1714735833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fB1mt9sNpnIuQMWViJTKaJZ/u7Ekmxb+gEhtincBweM=;
 b=XxWL/8a7Zi9pYKGVcBGjrOi/+YnJqx0/rXBf2rG5wx08DEUPb+mx7wxDkMkBr9akl9
 T4/wCOs51fngEmk2J7o6EySjsx3+1Hegcl/FOn0dNZohsWBp+SAcxE8OmFFdBiHQUGCD
 KJT5LwHWMttExPqqyCiCFYE4q4SwLY7eT+3PeeIR/Ma0ZpVoQ2r1a/ctXHpQaaKOF32C
 Kz/tpE1nuTFqjGEFPuXpGgJ2pyWj0GEr5CFPnh1UhKOyfVvJCqghkuw/83EA7QJBjNPe
 ND8gZwxqTOynuaxWWYGJP2z6PYzBOrbUTozPt0LpOm8oNB5wyN6kzgNFLSgYPsX5N7bd
 +TsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs0YmvK6Z1dzXKyK6lQr9YMd1g3JVXmZQ06IRkevGNvX+WsdojvVq0Y5EM/PF9fOHPQFfko3gTG46XReKuvWNwtolVTcG8jXTLvDfZRfXxEextObkWRQ==
X-Gm-Message-State: AOJu0YwZu+sYkSc2cukyyeJiwkiJnhxbNblHZpHA/CywuyPElMdIeJK2
 zmPKIEi6ibqwS2R38wtRb8r96RmwggFR3T3vZzpEV0qGts06rxXxjGhK+wY4Cn4A/yvZPSzoBHo
 vWk8a8LiYsFgSWBRx2s3Qhdc2C+g=
X-Google-Smtp-Source: AGHT+IEq+t0JzlAiE/ntLmzUm/wFvcl8gxKMAtzFSJL9GKIdrXhyeetBuXyDVLTjqKbTRJLxJU081NBHzaGvyWpCCbQ=
X-Received: by 2002:a5d:6e64:0:b0:343:e45c:c91d with SMTP id
 j36-20020a5d6e64000000b00343e45cc91dmr1644235wrz.41.1714131032606; Fri, 26
 Apr 2024 04:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240426103528.406063-1-chao@kernel.org>
In-Reply-To: <20240426103528.406063-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 26 Apr 2024 19:30:21 +0800
Message-ID: <CAHJ8P3+G8ooBt7Atw62wkSWBS0Xzx7J5eE4tPOKWd8_rjp=KNg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dear Chao, On Fri, Apr 26, 2024 at 6:37 PM Chao Yu wrote:
    > > Otherwise, it breaks pinfile's sematics. > > Cc: Daeho Jeong > Signed-off-by:
    Chao Yu > --- > fs/f2fs/data.c | 3 ++- > 1 file changed, 2 inse [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.54 listed in wl.mailspike.net]
X-Headers-End: 1s0Jmu-0006By-BT
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: fix to don't trigger OPU on
 pinfile for direct IO
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBDaGFvLAoKT24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgNjozN+KAr1BNIENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPdGhlcndpc2UsIGl0IGJyZWFrcyBwaW5maWxlJ3Mg
c2VtYXRpY3MuCj4KPiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9kYXRh
LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGlu
ZGV4IGJlZTFlNDVmNzZiOC4uZTI5MDAwZDgzZDUyIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0
YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtMTU5Niw3ICsxNTk2LDggQEAgaW50IGYy
ZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tz
ICptYXAsIGludCBmbGFnKQo+Cj4gICAgICAgICAvKiB1c2Ugb3V0LXBsYWNlLXVwZGF0ZSBmb3Ig
ZGlyZWN0IElPIHVuZGVyIExGUyBtb2RlICovCj4gICAgICAgICBpZiAobWFwLT5tX21heV9jcmVh
dGUgJiYKPiAtICAgICAgICAgICAoaXNfaG9sZSB8fCAoZjJmc19sZnNfbW9kZShzYmkpICYmIGZs
YWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPKSkpIHsKPiArICAgICAgICAgICAoaXNfaG9sZSB8fCAo
ZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYgKGYyZnNfbGZzX21vZGUoc2JpKSAmJgo+ICsg
ICAgICAgICAgICghZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSB8fCAhZjJmc19pc19waW5uZWRf
ZmlsZShpbm9kZSkpKSkpKSB7CkV4Y3VzZSBtZSBJIGEgbGl0dGxlIHF1ZXN0aW9u77yMIHNob3Vs
ZCBwaW4gZmlsZXMgbm90IGJlIHdyaXR0ZW4gaW4gT1BVCm1vZGUgcmVnYXJkbGVzcyBvZiBkZXZp
Y2UgdHlwZShjb252ZW50aW9uYWwgb3IgIHpvbmUpPwp0aGFua3MhCj4gICAgICAgICAgICAgICAg
IGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgZXJyID0gLUVJTzsKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHN5bmNfb3V0
Owo+IC0tCj4gMi40MC4xCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
