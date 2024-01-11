Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E7182A57E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 02:18:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNjiG-0000A5-1u;
	Thu, 11 Jan 2024 01:18:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rNjiE-00009s-Ax
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 01:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pHtMusYzsiQkjwSqtRZvJBvHhlKunDRXowWcJK81xTQ=; b=guI3v+hbPoTHgJey765fWYRtAs
 hC7nnnMbL3aas9hraOfsJ7HDyxHepP0rYf3RWDLzCfB10WdPLkpPvs3gkJ1oyLk8J8Cio8kE4DP2C
 hY6LJUMONKoDUfhIwDmz0UOl7ono+us+ag/QowBtXY+Vb2f2HLMWm/c0mDhd1lM1y2qE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pHtMusYzsiQkjwSqtRZvJBvHhlKunDRXowWcJK81xTQ=; b=k2+ooCZ3xrRfGt8+G8Py6AcpVy
 YCRuJv8e/LHprg0yELI3fXNQcE7aWMe4nt5tTa2jmkkNeU2W74+qhInriyTKCoqRxzkgGxpEgudzs
 uEjwTDY2Q96IemnBieNQD/sjEv0q3m4fBMdmnjaemgGmYbJ1shkPupbmVwJElvKpw8zs=;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rNjiA-0002Ff-R6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 01:18:26 +0000
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3bbd1fab171so3470201b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jan 2024 17:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704935892; x=1705540692; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHtMusYzsiQkjwSqtRZvJBvHhlKunDRXowWcJK81xTQ=;
 b=VJEVreIpb7FBED8o3K7coWltXaMpb8Noi1wN5r6IB6hh3oq1RtjjcJlPo5v0yu+VB3
 1AGiEK36ljDSBXNfxPH0ljtTl0k+FET1AnEzSS9UAqZ03scdVNL/Ld7p/v6I/Y+dCX55
 v4QsgUqQw0HInC0ymYxESWw/M6dNW1iCbekAKR+ol4Hp8Xnx9M4NMTRcyqAmQs3lKHRg
 NQNbt/PObbKD88P3P0rGLl0oEZdqdYrckSKdIINot5GfgbE6FnjFvEKnnEtBiirIFm2P
 UUS5n1gJsJTNyjJDnhyn5LsRFYzbbVwIPUeEw6RNL63yrFiE0IgHyncHzxpT+Fobzodb
 eo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704935892; x=1705540692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHtMusYzsiQkjwSqtRZvJBvHhlKunDRXowWcJK81xTQ=;
 b=gzljfDht3hulG6hVk30KTYQ55s6SsU8IcbYLgmC1dNO45vZAXRDfBxGyPrclqXejT7
 6LRbHPfzJxhfo26MSJ/TLGX/d9I2pi8tlr007+/Kb6pADQ7iRGxv4wKjOFFCBzbzNZ6Y
 1WSx8NZAG7GoQ1ZxVLQkbqPRhdsVDjOgNMALyBQt97KSclLl1h+AOVerYxp6ealpdFWr
 YOhJLLZvdRIvPB+9RkUUBp3AO2HyJrMThLo/ro1q9slslT/bg4hg7oqYoBYKHqye00O0
 k2TRMRYqs3n+zBFJqvlSN7Svk2X/PuNMrOekBP+Fa+CFc5WSah6rjXIp/L1qWKfD7iro
 ylTA==
X-Gm-Message-State: AOJu0YznOs0xhvwEejU95lzIeydPe4WT/Uv4YetNlvtCDJ5D9P2TBcrb
 E00Vh7XiPQUStH+Bi4vLI/8/0E2pej+n9dyoQvo=
X-Google-Smtp-Source: AGHT+IEvKshnTrh2QgjWN7AOHq0wbwBMsfXT7k0ve+ddB7HaOYLRctzfDG+J09zPwElVyIIuhw9PlE2exOj7I/8Gu9k=
X-Received: by 2002:a05:6808:448c:b0:3bd:4264:32aa with SMTP id
 eq12-20020a056808448c00b003bd426432aamr558283oib.96.1704935892069; Wed, 10
 Jan 2024 17:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-3-chao@kernel.org>
In-Reply-To: <20231228143152.1543509-3-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 10 Jan 2024 17:18:01 -0800
Message-ID: <CACOAw_xCfOtJaC3FbOhvbrEzyUwecdSujFo4-f--dz+33BC+Sg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Dec 28, 2023 at 6:33 AM Chao Yu wrote: > > From:
    Sheng Yong > > Compressed cluster may not be released due to we can fail
   in > release_compress_blocks(), fix to handle reserved compresse [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rNjiA-0002Ff-R6
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: compress: fix to check
 unreleased compressed cluster
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

T24gVGh1LCBEZWMgMjgsIDIwMjMgYXQgNjozM+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBGcm9tOiBTaGVuZyBZb25nIDxzaGVuZ3lvbmdAb3Bwby5jb20+Cj4KPiBD
b21wcmVzc2VkIGNsdXN0ZXIgbWF5IG5vdCBiZSByZWxlYXNlZCBkdWUgdG8gd2UgY2FuIGZhaWwg
aW4KPiByZWxlYXNlX2NvbXByZXNzX2Jsb2NrcygpLCBmaXggdG8gaGFuZGxlIHJlc2VydmVkIGNv
bXByZXNzZWQKPiBjbHVzdGVyIGNvcnJlY3RseSBpbiByZXNlcnZlX2NvbXByZXNzX2Jsb2Nrcygp
Lgo+Cj4gRml4ZXM6IDRjOGZmNzA5NWJlZiAoImYyZnM6IHN1cHBvcnQgZGF0YSBjb21wcmVzc2lv
biIpCj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5b25nQG9wcG8uY29tPgo+IFNp
Z25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9m
aWxlLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gaW5k
ZXggMDI2ZDA1YTdlZGQ4Li43ODJhZTNiZTQ4ZjYgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxl
LmMKPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+IEBAIC0zNjI0LDYgKzM2MjQsMTUgQEAgc3RhdGlj
IGludCByZXNlcnZlX2NvbXByZXNzX2Jsb2NrcyhzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIHBn
b2ZmX3QgY291bnQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
LyoKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBjb21wcmVzc2VkIGNsdXN0ZXIgd2FzIG5v
dCByZWxlYXNlZCBkdWUgdG8KPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpdCBmYWlscyBp
biByZWxlYXNlX2NvbXByZXNzX2Jsb2NrcygpLgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAq
Lwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChibGthZGRyID09IE5FV19BRERSKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wcl9ibG9ja3MrKzsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiArCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9i
bGthZGRyKGJsa2FkZHIpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
cl9ibG9ja3MrKzsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwoK
SG93IGFib3V0IG1lcmdpbmcgdHdvIGNvbmRpdGlvbnMgbGlrZSAiYmxrYWRkciA9PSBORVdfQURE
UiB8fApfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSI/Cgo+IEBAIC0zNjMzLDYgKzM2
NDIsOSBAQCBzdGF0aWMgaW50IHJlc2VydmVfY29tcHJlc3NfYmxvY2tzKHN0cnVjdCBkbm9kZV9v
Zl9kYXRhICpkbiwgcGdvZmZfdCBjb3VudCkKPiAgICAgICAgICAgICAgICAgfQo+Cj4gICAgICAg
ICAgICAgICAgIHJlc2VydmVkID0gY2x1c3Rlcl9zaXplIC0gY29tcHJfYmxvY2tzOwo+ICsgICAg
ICAgICAgICAgICBpZiAoIXJlc2VydmVkKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
bmV4dDsKPiArCgpIb3cgY2FuIHRoZSByZXNlcnZlZCB2YXJpYWJsZSBiZSB6ZXJvPwoKPiAgICAg
ICAgICAgICAgICAgcmV0ID0gaW5jX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgZG4tPmlub2RlLCAm
cmVzZXJ2ZWQpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gLS0KPiAyLjQwLjEKPgo+Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
