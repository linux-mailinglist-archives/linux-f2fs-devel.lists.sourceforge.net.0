Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2501D698D89
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 08:01:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSYH7-0000pw-1T;
	Thu, 16 Feb 2023 07:01:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mikoxyzzz@gmail.com>) id 1pSYH3-0000pp-KG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DyK7iJx8J6FEmEVQUzEANSgyA5JGTxNtNfBjhWHxRQA=; b=c9ZqfR+XplLe7gU0GL+nkRMuia
 qToAC7ehiJGZmYjt6/H3pBWYQkN32MyyA1jLyfBKcoUGibBx88SVzLtD94EpeqVvkkbHZExQAZUGb
 WfIIyvjn8TWGuQAzXFUi1GfmOuvsfeOz9NDW4AmlHYPZsKgClvmH9rfUJkAg4zfRBWf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DyK7iJx8J6FEmEVQUzEANSgyA5JGTxNtNfBjhWHxRQA=; b=XGDdaCZDuAikWZOfkSZGd9xJAV
 A60IYIUIBe64VnvDdkC59U7FarXO0fb+E1dKJbBEE+BZbLOHCaNEgYjdm+Q7FGSSMEB3/nFqll7TN
 10jdyX2Zrw+ffBMaTFbqUbbbz37crvPwiwE5jNDxCfeC33q63nNQCli0u2j5HzI7sSJg=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pSYH2-005zZM-5O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:01:44 +0000
Received: by mail-ej1-f47.google.com with SMTP id t24so2895128eji.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 23:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DyK7iJx8J6FEmEVQUzEANSgyA5JGTxNtNfBjhWHxRQA=;
 b=XzSqmmZrftYp9T+u9YShuR5nZTnfD4iuTGrh4fXPaTYH18HXnOTflWtyUhZqcNKq84
 cBvAuAE4Eu3BTrT+MD/eckBmSf6WbCOxRJ28wJ2vGB/xJzu0iJDnqQA75ZWEfQgd06y+
 mnN6BAgC9kz3bVEIvEYKGBjOKOxzReVftE2u6q8hTW013WKFasQrbq89TjQuqe/Dnohg
 DOCR7yaPEdW6Qjhy/xDN4gKhghhkKMUaPupcKOT1v6CMyjaSyAekBwJ9QWTqY4D/fVrH
 wTB0mFqr29CaAzDPV9nwbnROuFLyv+GKe/D3O+fyVhZ6bLXAqSiR3PiS7fE1ArbwgMYK
 +Kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DyK7iJx8J6FEmEVQUzEANSgyA5JGTxNtNfBjhWHxRQA=;
 b=U7y+xFzhQaph59JlBRh7zqv1rkWPvcaUkAx10G9eLEHjPaqXrZjMPR3DZWSm7b/AAy
 3b86edL5bU307mxD8kc14TG77AIePeOTsYGzS3Gwnv1QtCKh4PAIsjerkSmEbsTagl+5
 /s4JFu6AS6GZ2NI+fwFVqz4IFpaziAqfjcxfS67R2Pa2+089V6r7cQph6GdLNDsS/aKp
 zbmZDWVPQqjqvyV+X0zON+TUKFQxetz64Xt2I1pvAsNAKQKWPozUi5k5HpxnU6bzOHyj
 o1neAq/SEnfx9/fW8LxYivq1FaZVaco96VJ1AgX8YPphWO/1CRFxT+zdB4UCMAe6Bduw
 llMg==
X-Gm-Message-State: AO0yUKULvQz6ULz2bMxXWwRb9HtMeWthseeal+s7nYVPV8K1C5gFyJDz
 Z9cJoAtflmdYAgyNGi431cQ=
X-Google-Smtp-Source: AK7set+mqaTDfU9RIA4qnmexEtHbH+213JmKJf2bZyFft7p1mZA5i1nytm832ECd3WjAMv9wyFyinQ==
X-Received: by 2002:a17:906:9e22:b0:879:2a5:dc40 with SMTP id
 fp34-20020a1709069e2200b0087902a5dc40mr4567522ejc.76.1676530897763; 
 Wed, 15 Feb 2023 23:01:37 -0800 (PST)
Received: from sakura.myxoz.lan (81-230-97-204-no2390.tbcn.telia.com.
 [81.230.97.204]) by smtp.gmail.com with ESMTPSA id
 gy26-20020a170906f25a00b008b14cbb46e2sm392145ejb.145.2023.02.15.23.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 23:01:37 -0800 (PST)
Message-ID: <49fe0a38e1340987be9c898fa806ce5776cba639.camel@gmail.com>
From: Miko Larsson <mikoxyzzz@gmail.com>
To: yonggil.song@samsung.com, Chao Yu <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 16 Feb 2023 08:01:36 +0100
In-Reply-To: <20230216025743epcms2p31d1bde5cfb315d13231010b0a46fbec4@epcms2p3>
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p3>
 <20230216025743epcms2p31d1bde5cfb315d13231010b0a46fbec4@epcms2p3>
User-Agent: Evolution 3.46.3 (3.46.3-1.module_f37+15877+cf3308f9) 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2023-02-16 at 11:57 +0900, Yonggil Song wrote: > When
 f2fs skipped a gc round during victim migration, there was a bug > which
 > would skip all upcoming gc rounds unconditionally because > ski [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mikoxyzzz[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSYH2-005zZM-5O
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix uninitialized skipped_gc_rwsem
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCAyMDIzLTAyLTE2IGF0IDExOjU3ICswOTAwLCBZb25nZ2lsIFNvbmcgd3JvdGU6Cj4g
V2hlbiBmMmZzIHNraXBwZWQgYSBnYyByb3VuZCBkdXJpbmcgdmljdGltIG1pZ3JhdGlvbiwgdGhl
cmUgd2FzIGEgYnVnCj4gd2hpY2gKPiB3b3VsZCBza2lwIGFsbCB1cGNvbWluZyBnYyByb3VuZHMg
dW5jb25kaXRpb25hbGx5IGJlY2F1c2UKPiBza2lwcGVkX2djX3J3c2VtCj4gd2FzIG5vdCBpbml0
aWFsaXplZC4gSXQgZml4ZXMgdGhlIGJ1ZyBieSBjb3JyZWN0bHkgaW5pdGlhbGl6aW5nIHRoZQo+
IHNraXBwZWRfZ2NfcndzZW0gaW5zaWRlIHRoZSBnYyBsb29wLgo+IAo+IEZpeGVzOiAzZGIxZGUw
ZTU4MmMgKCJmMmZzOiBjaGFuZ2UgdGhlIGN1cnJlbnQgYXRvbWljIHdyaXRlIHdheSIpCj4gU2ln
bmVkLW9mZi1ieTogWW9uZ2dpbCBTb25nIDx5b25nZ2lsLnNvbmdAc2Ftc3VuZy5jb20+Cj4gCj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+IGluZGV4IGIyMmY0OWE2
ZjEyOC4uODFkMzI2YWJhYWMxIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ICsrKyBiL2Zz
L2YyZnMvZ2MuYwo+IEBAIC0xNzg2LDggKzE3ODYsOCBAQCBpbnQgZjJmc19nYyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksIHN0cnVjdAo+IGYyZnNfZ2NfY29udHJvbCAqZ2NfY29udHJvbCkKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcHJlZnJlZV9zZWdtZW50cyhzYmkpKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBjcGMu
cmVhc29uID0gX19nZXRfY3BfcmVhc29uKHNiaSk7Cj4gLcKgwqDCoMKgwqDCoMKgc2JpLT5za2lw
cGVkX2djX3J3c2VtID0gMDsKPiDCoGdjX21vcmU6Cj4gK8KgwqDCoMKgwqDCoMKgc2JpLT5za2lw
cGVkX2djX3J3c2VtID0gMDsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KCEoc2JpLT5z
Yi0+c19mbGFncyAmIFNCX0FDVElWRSkpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXQgPSAtRUlOVkFMOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBzdG9wOwoKTWlnaHQgd2FudCB0byBDYyB0aGUgc3RhYmxlIG1haWxpbmcgbGlzdC4KLS0gCn5t
aWtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
