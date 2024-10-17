Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 765AD9A1C89
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Oct 2024 10:08:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1LXw-0003Em-Sx;
	Thu, 17 Oct 2024 08:07:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t1LXv-0003EA-GI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 08:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f3ARNvMTDIwUa/OeE/2jT4z88IP0Xf8KXTuQ47EaPAA=; b=e7f9WxMKnY+h8frD+R86l8phZN
 5zCzOMzJ66QuZloE0gI00Yr9kTKeiO5S/RFEGdypA5f8Mya5jSB7fFD20eKa0wGZpBPswYVpsRYSX
 EvDuv7xKvmdSCczPLNNQO0rhILL4uIih0ejlAnUzNdfNxMARNYJbyNud+nLptoledOkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f3ARNvMTDIwUa/OeE/2jT4z88IP0Xf8KXTuQ47EaPAA=; b=XJwmRPpwMprQXRHluO1XgwENLR
 rBvcGSVOJImAWyi454p8nA+APjExqEbkgnrTbZXl9ARMUaeKs5pKJ+N0S4CURl2woYEs3Lh1+bPC6
 /8hAdrjIsPlJaF337w3yzGSS6FVKOROjWN9p4WjGCWuuh1vNUpPA3nRZEd+UejS4rMrk=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t1LXv-0001um-Ju for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 08:07:48 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d58a51fa5so21970f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Oct 2024 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729152461; x=1729757261; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3ARNvMTDIwUa/OeE/2jT4z88IP0Xf8KXTuQ47EaPAA=;
 b=M5LtkxfwCG2K2MffMv73ZPQ3XG1xaOE/1QjpkRKgXVACVSWOUrTAhwfbMnCOqKiIMo
 MPrMhrRcEfxfvxWpqYe+0dQ8Y7IRzg3WAc52ybOHbnVq/zSeINZ/PUzRUhvQKaUamrp7
 xmKq1s3/HcUbs8f8TlveAgH3PIfGiPK0yB3XE6v0CX9Bk6veE4DcUDhvhOb7MGY7vT/+
 mCTRGy827Ia3Y6Eb8peziq+hjQactwucB9pKuh5iMq/h5/XnWDuAh6R3Josa2cADQxvd
 NutyYsJYbxzFuaOhE+GUevfovo0NsU90WZ19LBJOd5eRJNW0xTPXtKYfCmjOmBO/Gz6k
 xBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729152461; x=1729757261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3ARNvMTDIwUa/OeE/2jT4z88IP0Xf8KXTuQ47EaPAA=;
 b=N3kGf4wHgk2IkD/Xm+pNm2416wHqj97FYGE7SnDM+EOCCE7eUU5cHL2pHxf6krSLbK
 KuYkpvI19rQL+ZFkXvQcauTzQAKd2WQO+cGx961dvq4YpM8gnxZA+RTQhHuapYvzIFdV
 Ba34RjDuF4IW6uZhibZahVaytHrOuW5gIu2ltV7gV5IeAOKlpoflCawsomuCGaJ711Iv
 ImV6VcqoNeNXB36LqwN+Wr50Qs5jqwQQfsax3bse6F5EcKe2YjaOjfcL/mczvK6HQCxZ
 ikBCw1L/Txh+DA7/BurxlJWg4kROg3NqLVOhk6+vOKvg6RifOO9JFKM5nf/ytSesKSZB
 07Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQLMubmEaE794qSZFG74Umyp1T+VLsfyZHKkJLYcIKanLC3deUdCFUJeSckKDpJwrRWYnegmmpQF6HC9CeFptP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwTZCQ9z9+fs/3+tr3/t0bhe93aUJNH8j0Ycp0VhMKWmHtV9V/D
 tpQKqP7C4sDg7gg6NZsWevr26aAxsLw8Cc8kf/qY2UCHRgRb6qxiYP/H/xqOfXf1Us/XJuUL8Ol
 2PofnEvbEyZiXYA7nfE69nzLiMWI=
X-Google-Smtp-Source: AGHT+IHoCiNIIhJpvNcCGrSEd8zUERi0mYbAqee8s1BYf5uwu/qt3wnTu2Z82Ymc1C7ehtXSEY8FCPa59AGUeys2RTc=
X-Received: by 2002:a5d:6daa:0:b0:37c:d122:33ce with SMTP id
 ffacd0b85a97d-37d937d7f3amr800502f8f.6.1729152460755; Thu, 17 Oct 2024
 01:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240927160655.3594366-1-daeho43@gmail.com>
In-Reply-To: <20240927160655.3594366-1-daeho43@gmail.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 17 Oct 2024 16:07:29 +0800
Message-ID: <CAHJ8P3LT21jErAjPB055a0JkHrxtSG=t7kzNKy61Dex5XSzEiQ@mail.gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Daeho Jeong 于2024年9月28日周六 00:08写道： > > From:
    Daeho Jeong > > Current description confuses users like they can add addtional
    devices > with one -c option using commas(,) at the sa [...] 
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -1.3 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.41 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t1LXv-0001um-Ju
Subject: Re: [f2fs-dev] [PATCH v3 1/2] mkfs.f2fs: change -c option
 description
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

RGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPiDkuo4yMDI05bm0OeaciDI45pel5ZGo5YWt
IDAwOjA45YaZ6YGT77yaCj4KPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUu
Y29tPgo+Cj4gQ3VycmVudCBkZXNjcmlwdGlvbiBjb25mdXNlcyB1c2VycyBsaWtlIHRoZXkgY2Fu
IGFkZCBhZGR0aW9uYWwgZGV2aWNlcwo+IHdpdGggb25lIC1jIG9wdGlvbiB1c2luZyBjb21tYXMo
LCkgYXQgdGhlIHNhbWUgdGltZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVo
b2plb25nQGdvb2dsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4KPiAtLS0KPiAgbWtmcy9mMmZzX2Zvcm1hdF9tYWluLmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL21rZnMv
ZjJmc19mb3JtYXRfbWFpbi5jIGIvbWtmcy9mMmZzX2Zvcm1hdF9tYWluLmMKPiBpbmRleCBkOWNk
ZDYxLi5iNjc4NWNkIDEwMDY0NAo+IC0tLSBhL21rZnMvZjJmc19mb3JtYXRfbWFpbi5jCj4gKysr
IGIvbWtmcy9mMmZzX2Zvcm1hdF9tYWluLmMKPiBAQCAtNTAsNyArNTAsNyBAQCBzdGF0aWMgdm9p
ZCBta2ZzX3VzYWdlKCkKPiAgICAgICAgIE1TRygwLCAiXG5Vc2FnZTogbWtmcy5mMmZzIFtvcHRp
b25zXSBkZXZpY2UgW3NlY3RvcnNdXG4iKTsKPiAgICAgICAgIE1TRygwLCAiW29wdGlvbnNdOlxu
Iik7Cj4gICAgICAgICBNU0coMCwgIiAgLWIgZmlsZXN5c3RlbSBibG9jayBzaXplIFtkZWZhdWx0
OjQwOTZdXG4iKTsKPiAtICAgICAgIE1TRygwLCAiICAtYyBkZXZpY2UxWyxkZXZpY2UyLC4uLl0g
dXAgdG8gNyBhZGRpdGlvbmFsIGRldmljZXMsIGV4Y2VwdCBtZXRhIGRldmljZVxuIik7Cj4gKyAg
ICAgICBNU0coMCwgIiAgLWMgW2RldmljZV9uYW1lXSB1cCB0byA3IGFkZGl0aW9uYWwgZGV2aWNl
cywgZXhjZXB0IG1ldGEgZGV2aWNlXG4iKTsKRGVhcnMsCml0IHNlZW1zIHRoYXQgbWFuIHNob3Vs
ZCBiZSB1cGRhdGVkIHRvbz8KLkJJIFwtYyAiIGRldmljZS1saXN0IgpCdWlsZCBmMmZzIHdpdGgg
dGhlc2UgYWRkaXRpb25hbCAiY29tbWEgc2VwYXJhdGVkIGRldmljZXMiLCBzbyB0aGF0IHRoZSB1
c2VyIGNhbgpzZWUgYWxsIHRoZSBkZXZpY2VzIGFzIG9uZSBiaWcgdm9sdW1lLgpTdXBwb3J0cyB1
cCB0byA3IGRldmljZXMgZXhjZXB0IG1ldGEgZGV2aWNlLgp0aGFua3MhCgo+ICAgICAgICAgTVNH
KDAsICIgIC1kIGRlYnVnIGxldmVsIFtkZWZhdWx0OjBdXG4iKTsKPiAgICAgICAgIE1TRygwLCAi
ICAtZSBbY29sZCBmaWxlIGV4dCBsaXN0XSBlLmcuIFwibXAzLGdpZixtb3ZcIlxuIik7Cj4gICAg
ICAgICBNU0coMCwgIiAgLUUgW2hvdCBmaWxlIGV4dCBsaXN0XSBlLmcuIFwiZGJcIlxuIik7Cj4g
LS0KPiAyLjQ2LjEuODI0LmdkODkyZGNkY2RkLWdvb2cKPgo+Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
